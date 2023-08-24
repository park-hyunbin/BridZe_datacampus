from flask import Flask, request, send_file
from werkzeug.utils import secure_filename
import model_stt
import crr
import Jijeong
from flask_cors import CORS

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
        f.save(secure_filename(f.filename))
        output = model_stt.query("test.flac")
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


'''
@application.route('/crr/0', methods=['GET'])
def crr_score():
    global crrscore
    age_num = str(request.args['query'])
    if request.method == 'GET':
        if age_num == '5_1':
            score = crr.compute_crr(Jijeong.jijeong5_1, stt_result)
        elif age_num == '5_2':
            score = crr.compute_crr(Jijeong.jijeong5_2, stt_result)
        elif age_num == '5_3':
            score = crr.compute_crr(Jijeong.jijeong5_3, stt_result)
        elif age_num == '8':
            score = crr.compute_crr(Jijeong.jijeong8, stt_result)
        elif age_num == '11':
            score = crr.compute_crr(Jijeong.jijeong11, stt_result)
        elif age_num == 'mom':
            score = crr.compute_crr(Jijeong.jijeongmom, stt_result)
        else:
            score = 'age_num error'
        return score
    else:
        return 'GET Plz'


@application.route('/crr/1', methods=['GET'])
def crr_score1():
    global crrscore1
    age_num = str(request.args['query'])
    if request.method == 'GET':
        if age_num == '5_1':
            crrscore1 = crr.compute_crr(Jijeong.jijeong5_1, stt_result)
        elif age_num == '5_2':
            crrscore1 = crr.compute_crr(Jijeong.jijeong5_2, stt_result)
        elif age_num == '5_3':
            crrscore1 = crr.compute_crr(Jijeong.jijeong5_3, stt_result)
        elif age_num == '8':
            crrscore1 = crr.compute_crr(Jijeong.jijeong8, stt_result)
        elif age_num == '11':
            crrscore1 = crr.compute_crr(Jijeong.jijeong11, stt_result)
        elif age_num == 'mom':
            crrscore1 = crr.compute_crr(Jijeong.jijeongmom, stt_result)
        else:
            crrscore1 = 'age_num error'
        return crrscore1
    else:
        return 'GET Plz'


@application.route('/crr/2', methods=['GET'])
def crr_score2():
    global crrscore2
    age_num = str(request.args['query'])
    if request.method == 'GET':
        if age_num == '5_1':
            crrscore2 = crr.compute_crr(Jijeong.jijeong5_1, stt_result)
        elif age_num == '5_2':
            crrscore2 = crr.compute_crr(Jijeong.jijeong5_2, stt_result)
        elif age_num == '5_3':
            crrscore2 = crr.compute_crr(Jijeong.jijeong5_3, stt_result)
        elif age_num == '8':
            crrscore2 = crr.compute_crr(Jijeong.jijeong8, stt_result)
        elif age_num == '11':
            crrscore2 = crr.compute_crr(Jijeong.jijeong11, stt_result)
        elif age_num == 'mom':
            crrscore2 = crr.compute_crr(Jijeong.jijeongmom, stt_result)
        else:
            crrscore2 = 'age_num error'
        return crrscore2
    else:
        return 'GET Plz'


@application.route('/crr/3', methods=['GET'])
def crr_score3():
    global crrscore3
    age_num = str(request.args['query'])
    if request.method == 'GET':
        if age_num == '5_1':
            crrscore3 = crr.compute_crr(Jijeong.jijeong5_1, stt_result)
        elif age_num == '5_2':
            crrscore3 = crr.compute_crr(Jijeong.jijeong5_2, stt_result)
        elif age_num == '5_3':
            crrscore3 = crr.compute_crr(Jijeong.jijeong5_3, stt_result)
        elif age_num == '8':
            crrscore3 = crr.compute_crr(Jijeong.jijeong8, stt_result)
        elif age_num == '11':
            crrscore3 = crr.compute_crr(Jijeong.jijeong11, stt_result)
        elif age_num == 'mom':
            crrscore3 = crr.compute_crr(Jijeong.jijeongmom, stt_result)
        else:
            crrscore3 = 'age_num error'
        return crrscore3
    else:
        return 'GET Plz'
    
'''


@application.route('/crr/average', methods=['GET'])
def average_score():
    average_crr = (float(crr_scores['crrscore1']) + float(crr_scores['crrscore2']) + float(crr_scores['crrscore3'])) / 3
    score = str(average_crr)
    
    if request.method == 'GET':
        return score
    else:
        return score

'''
@application.route('/crr/average', methods=['GET'])
def average_score():
    average_crr = (float(crrscore1) + float(crrscore2) + float(crrscore3)) / 3
    score = str(average_crr)
    
    if request.method == 'GET':
        return score
    else:
        return score
'''

@application.route("/image", methods=['POST', 'GET'])
def upload_image():
    if request.method == 'POST':
        f = request.files['image']
        f.save(secure_filename(f.filename))
        return 'image post complete'
    else:
        return 'post image plz'


    
'''
@application.route("/video/1", methods=['POST', 'GET'])
def upload_video1():
    if request.method == 'POST':
        f = request.files['video']
        f.save(secure_filename(f.filename))
        return 'video post complete'
    else:
        return 'post video1 plz'


@application.route("/video/2", methods=['POST', 'GET'])
def upload_video2():
    if request.method == 'POST':
        f = request.files['video']
        f.save(secure_filename(f.filename))
        return 'video post complete'
    else:
        return 'post video2 plz'


@application.route("/video/3", methods=['POST', 'GET'])
def upload_video3():
    if request.method == 'POST':
        f = request.files['video']
        f.save(secure_filename(f.filename))
        return 'video post complete'
    else:
        return 'post video3 plz'

'''

@application.route("/video/<int:index>", methods=['POST', 'GET'])
def upload_video(index):
    if request.method == 'POST':
        f = request.files['video']
        f.save(secure_filename(f.filename))
        return f'video{index} post complete'
    else:
        return f'post video{index} plz'


@application.route("/download/video/<int:index>", methods=['GET'])
def download_video(index):
    if request.method == 'GET':
        file_path = f'video{index}.mp4'

        try:
            return send_file(file_path, as_attachment=True)
        except Exception as e:
            return str(e), 404
    else:
        return f'get download video{index} plz'

'''
@application.route("/download/video/1", methods=['POST', 'GET'])
def download1():
    if request.method == 'GET':
        # 실제 파일 경로를 적절히 지정해주세요
        file_path = 'video1.mp4'

        try:
            return send_file(file_path, as_attachment=True)
        except Exception as e:
            return str(e), 404
    else:
        return 'get download plz'

@application.route("/download/video/2", methods=['POST', 'GET'])
def download2():
    if request.method == 'GET':
        # 실제 파일 경로를 적절히 지정해주세요
        file_path = 'video2.mp4'

        try:
            return send_file(file_path, as_attachment=True)
        except Exception as e:
            return str(e), 404
    else:
        return 'get download plz'


@application.route("/download/video/3", methods=['POST', 'GET'])
def download3():
    if request.method == 'GET':
        # 실제 파일 경로를 적절히 지정해주세요
        file_path = 'video3.mp4'

        try:
            return send_file(file_path, as_attachment=True)
        except Exception as e:
            return str(e), 404
    else:
        return 'get download plz'
'''

if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)
