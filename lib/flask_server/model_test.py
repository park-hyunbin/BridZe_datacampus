from facial_emotion_recognition import model_cv as cv
import numpy as np
import glob


p = np.sort(np.array(glob.glob('/workspace/wpqkf/facial_emotion_recognition/temp/*.jpg')))
i = cv.infer_multi_images(p)
final_emotion = cv.find_max_emotion('',i)
print(final_emotion)