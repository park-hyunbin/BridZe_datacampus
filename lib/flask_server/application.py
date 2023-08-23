from flask import Flask, request, send_file, jsonify
from werkzeug.utils import secure_filename
from stt import model_stt, crr, Jijeong
from flask_cors import CORS
import os
from facial_emotion_recognition import model_cv as cv
import numpy as np
import glob
from videos import video2frame as v2f
import cv2
import time



application = Flask(__name__)
CORS(application, resources={r"/*": {"origins": "*"}})

stt_result = '초기 결과값입니다. 음성을 입력하세요'
crr_scores = {'crrscore1': '0.0', 'crrscore2': '0.0', 'crrscore3': '0.0'}


@application.route("/")
def hello():
    return 'Good Connection'


@application.route("/audio", methods=['POST', 'GET'])
def upload_audio():
    global stt_result
    if request.method == 'POST':
        f = request.files['audio']
        file_path = os.path.join('stt', secure_filename(f.filename))
        f.save(file_path)
        output = model_stt.query(file_path)
        stt_result = output['text']
        return stt_result
    else:
        output = model_stt.query("test.flac")
        stt_result = output['text']
        return 'result: ' + stt_result


@application.route('/crr/<int:index>', methods=['GET'])
def crr_score(index):
    global crr_scores
    age_num = str(request.args['query'])
    score_key = f'crrscore{index}'
    if request.method == 'GET':
        jijeong_age = getattr(Jijeong, f'jijeong{age_num}', None)
        if jijeong_age is not None:
            score = crr.compute_crr(jijeong_age, stt_result)
            crr_scores[score_key] = score
            return score
        else:
            return 'age_num error'
    else:
        return 'GET Plz'


@application.route('/crr/average', methods=['GET'])
def average_score():
    average_crr = (float(crr_scores['crrscore1']) + float(crr_scores['crrscore2']) + float(crr_scores['crrscore3'])) / 3
    score = str(average_crr)

    if request.method == 'GET':
        return score
    else:
        return score


@application.route("/image/<int:index>", methods=['POST', 'GET'])
def upload_image(index):
    if request.method == 'POST':
        f = request.files['image']
        file_path = os.path.join('facial_emotion_recognition/temp/', secure_filename(f.filename))
        f.save(file_path)
        return f'image{index} post complete'
    else:
        return f'post image{index} plz'


@application.route('/execute', methods=['GET'])
def execute_file():
    emotion = str(request.args['emotion'])
    if request.method == 'GET':
        try:
            # Change the directory and execute the command
            #command = 'cd "/workspace/wpqkf/facial_emotion_recognition" && python "model_cv.py"'
            #result = subprocess.run(command, shell=True, capture_output=True, text=True)
            p = np.sort(np.array(glob.glob('/workspace/wpqkf/facial_emotion_recognition/temp/*.jpg')))
            i = cv.infer_multi_images(p)
            final_emotion = cv.find_max_emotion(f'{emotion}', i)
            print(f'stage: {emotion}\nresult: {final_emotion}')
            return jsonify({'message': 'File executed successfully'})
        except Exception as e:
            return jsonify({'error': str(e)}), 500
    else:
        return emotion


@application.route('/v2f')
def execute_v2f():
    if request.method == 'GET':
        v2f.v2f()
        return 'v2f lets go'
    else:
        return 'get execute file2 plz'


@application.route('/execute2', methods=['GET'])
def execute_file2():
    if request.method == 'GET':
        try:
            p2 = np.sort(np.array(glob.glob('/workspace/wpqkf/videos/frames/*.jpg')))
            i2 = cv.infer_multi_images(p2)
            final_emotion = cv.find_max_emotion2('chart', i2)
            print(f'chart result: {final_emotion}')
            return jsonify({'message': 'File2 executed successfully'})
        except Exception as e:
            return jsonify({'error': str(e)}), 500
    else:
        return 'get execute file2 plz'


@application.route("/video/<int:index>", methods=['POST', 'GET'])
def upload_video(index):
    if request.method == 'POST':
        f = request.files['video']
        file_path = os.path.join('videos', secure_filename(f.filename))
        f.save(file_path)
        return f'video{index} post complete'
    else:
        return f'post video{index} plz'


@application.route("/download/video/<int:index>", methods=['GET'])
def download_video(index):
    if request.method == 'GET':
        file_path = os.path.join('videos/', f'video{index}.mp4')
        try:
            return send_file(file_path, as_attachment=True)
        except Exception as e:
            return str(e), 404
    else:
        return f'get download video{index} plz'


@application.route("/download/image", methods=['GET'])
def download_image():
    emotion = str(request.args['emotion'])
    if request.method == 'GET':
        file_path = os.path.join(f'facial_emotion_recognition/inference/{emotion}', 'picture.jpg')

        try:
            return send_file(file_path, as_attachment=True)
        except Exception as e:
            return str(e), 404
    else:
        return f'get download image plz'


@application.route("/download/chart/image", methods=['GET'])
def download_chart_image():
    if request.method == 'GET':
        file_path = os.path.join('/workspace/wpqkf/videos/chart', 'picture.jpg')

        try:
            return send_file(file_path, as_attachment=True)
        except Exception as e:
            return str(e), 404
    else:
        return f'get download image plz'



if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)
