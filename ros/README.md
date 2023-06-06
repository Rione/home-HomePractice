# ROS

## セットアップ

`setup-ros-noetic.sh`を使ってください

```
sh setup-ros-noetic.sh
```

## turtlesimで遊ぶ

3つターミナルを用意します。 \
[Terminator](https://github.com/gnome-terminator/terminator)を使うと便利かも...

```
roscore
```

roscoreを立ち上げます。

```
rosrun turtlesim turtlesim_node
```

亀さんが現れます。

```
rosrun turtlesim turtlesim_teleop_key
```

矢印キーで亀さんを動かせます。

```
rosrun rqt_graph rqt_graph
```

rqtが立ち上がり、トピック通信の様子が確認できます。

`Ctrl+c`で`rosrun turtlesim turtlesim_teleop_key`を終了して以下のコマンドを入力する。

```
rostopic pub -r 10 /turtle1/cmd_vel geometry_msgs/Twist '{linear: {x: 0.1}, angular: {z: 0.3}}'
```

直接、トピック名とメッセージを指定して亀さんを動かすことも出来る。

```
rosmsg show geometry_msgs/Twist
```

メッセージの型を直接確認することが出来ます。

## トピック通信の勉強

以下の動画、リンクを参考にしてください

- https://youtu.be/PL85Pw_zQH0
    - 端末を開いて実際にコマンドを実行するのは、56分40秒からにして下さい。それより前の部分のコマンドは実行しないようにしてください。
    - `ssh ubuntu...`どいうコマンドを実行していますが、実行しなくていいです。
- https://youtu.be/MDCQ4oH6Dlc
- https://wiki.ros.org/ja/ROS/Tutorials/UnderstandingNodes
- https://wiki.ros.org/ja/ROS/Tutorials/UnderstandingTopics
- https://wiki.ros.org/ja
- https://kato-robotics.hatenablog.com/entry/2019/02/18/053255

### 練習

- パブリッシャとサブスクライバのパッケージを作ってください
    - パブリッシャは`/suuji`トピックに`Int32`型の整数を送ってください
        - 送る整数は一秒ごとに1足してください
        - 送っている数字をターミナルに表示してください
    - サブスクライバは`/suuji`トピックから受け取った整数を2倍にしてください
        - 2倍にした数字をターミナルに表示してください

ヒント

- > 一秒ごとに...
    - `rospy.Rate()`を使おう
- > ターミナルで表示する際は...
    - `rospy.loginfo()`を使おう
- `.py`ファイルに実行権限を与えよう
    - `chmod +x ファイル名.py`で実行できるよ

## Turtlebot 2を動かす

`roslaunch turtlebot_teleop keyboard_teleop.launch`のトピック通信を参考にTurtlebot2を動かしてください。

## おまけ

簡単なパブリッシャとサブスクライバの例

- [sheep_talker](ros_omake/src/sheep_talker.py)
- [sheep_listener](ros_omake/src/sheep_listener.py)

### 使い方

```
cp -r ros_omake ~/catkin_ws/src
cd ~/catkin_ws
catkin_make
```

3つターミナルを開いてそれぞれ以下のコマンドを入力

```
roscore
rosrun ros_omake sheep_talker.py
rosrun ros_omake sheep_listener.py
```
