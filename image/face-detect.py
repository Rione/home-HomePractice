import cv2
import matplotlib.pyplot as plt

try:
    # 画像ファイルとカスケード分類器の読み込み
    img = cv2.imread("data/lenna.png")
    face_cascade = cv2.CascadeClassifier("data/haarcascade_frontalface_default.xml")
    eye_cascade = cv2.CascadeClassifier("data/haarcascade_eye.xml")

    # 検出
    faces = face_cascade.detectMultiScale(img)
    eyes = eye_cascade.detectMultiScale(img)

    # 検出の結果を枠で囲む
    for (x, y, w, h) in faces:
        cv2.rectangle(img, (x, y), (x + w, y + h), (0, 0, 255), thickness=2)

    for (x, y, w, h) in eyes:
        cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0), thickness=2)

    # matplotlibで表示
    converted_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    plt.imshow(converted_img)
    plt.show()
except Exception as e:
    print(e)
