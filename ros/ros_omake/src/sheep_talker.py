#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# モジュールのインポート
import rospy
from std_msgs.msg import String

# クラスの定義
class SheepTalker():
    def __init__(self):
        # ノードの初期化
        rospy.init_node("talker")

        # パブリッシャの作成。トピック名、メッセージの型、キューサイズを指定
        self.sheep_pub = rospy.Publisher("/sheep", String, queue_size=10)

        # ループの周期。この場合は1hz、1秒間に1回
        self.rate = rospy.Rate(1)

        self.i = 0

    # メイン関数の定義
    def main(self):
        # rospyが立ち上がっている限り
        while not rospy.is_shutdown():
            # 送るメッセージを定義
            msg = String()
            msg.data = f"羊が{self.i}匹.."

            # パブリッシュする
            self.sheep_pub.publish(msg)

            # ターミナルに表示
            rospy.loginfo(msg.data)

            # 指定した周期になるように停止
            self.rate.sleep()

            self.i += 1

if __name__ == '__main__':
    # クラスのインスタンス化
    sheepTalker = SheepTalker()
    # メイン関数の実行
    sheepTalker.main()
