import cv2

try:
    # カメラのIDを設定
    cap = cv2.VideoCapture(0)

    # カスケード分類器の読み込み
    face_cascade = cv2.CascadeClassifier("data/haarcascade_frontalface_default.xml")

    while True:
        # カメラから画像を取得
        ret, img = cap.read()

        # 検出
        faces = face_cascade.detectMultiScale(img)

        # 検出の結果を枠で囲む
        for (x, y, w, h) in faces:
            cv2.rectangle(img, (x, y), (x + w, y + h), (0, 0, 255), thickness=2)

        # 認識の結果の表示
        cv2.imshow("webcam", img)

        # Escが押されたら終了
        key = cv2.waitKey(10)
        if key == 27:
            break

    # ウインドウを閉じる
    cv2.destroyAllWindows()
    # カメラのメモリを解放
    cap.release()
except Exception as e:
    print(e)
