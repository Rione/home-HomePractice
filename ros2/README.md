# ROS 2

## turtlesimで遊ぶ

3つターミナルを用意します。 \
[Terminator](https://github.com/gnome-terminator/terminator)を使うと便利かも...

```
ros2 run turtlesim turtlesim_node
```

亀さんが現れます。

```
ros2 run turtlesim turtle_teleop_key
```

矢印キーで亀さんを動かせます。

```
ros2 run rqt_graph rqt_graph
```

rqtが立ち上がり、トピック通信の様子が確認できます。

`Ctrl+c`で`ros2 run turtlesim turtle_teleop_key`を終了して以下のコマンドを入力する。

```
ros2 topic pub /turtle1/cmd_vel geometry_msgs/Twist '{linear: {x: 0.1}, angular: {z: 0.3}}'
```

直接、トピック名とメッセージを指定して亀さんを動かすことも出来る。

```
ros2 interface show geometry_msgs/msg/Twist
```

メッセージの型を直接確認することが出来ます。

### 練習

- ROS 2とPythonで作って学ぶAIロボット入門のp38-39を読んで実行してみてください

## トピック通信の勉強

以下の本、動画を参考にしてください。

- ROS 2とPythonで作って学ぶAIロボット入門 2章
- https://youtu.be/mBhtD08f5KY

## Turtlebot 4を動かす

工事中
