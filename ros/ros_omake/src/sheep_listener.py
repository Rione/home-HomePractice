#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# モジュールのインポート
import rospy
from std_msgs.msg import String

# クラスの宣言
class SheepListener():
    def __init__(self):
        # ノードの初期化
        rospy.init_node("listener")

        # サブスクライバの作成。トピック名、メッセージの型、コールバック関数を指定
        self.sheep_sub = rospy.Subscriber("/sheep", String, self.callback)

    # コールバック関数
    def callback(self, msg):
        # ターミナルに表示
        rospy.loginfo(f"I heard {msg.data}")


if __name__ == '__main__':
    # クラスのインスタンス化
    sheepListener = SheepListener()
    # コールバック関数を繰り返し呼び出す
    rospy.spin()
