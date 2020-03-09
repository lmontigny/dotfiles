# Change quality
~/.config/pulse/daemon.conf
```
default-sample-format = float32le
default-sample-rate = 48000
alternate-sample-rate = 44100
default-sample-channels = 2
default-channel-map = front-left,front-right
default-fragments = 2
default-fragment-size-msec = 125
resample-method = soxr-vhq
enable-lfe-remixing = no
high-priority = yes
nice-level = -11
realtime-scheduling = yes
realtime-priority = 9
rlimit-rtprio = 9
daemonize = no
```

`sudo service pulseaudio restart`  
`sudo alsactl restore`


# Use equalizer
```
sudo apt-get install pulseaudio-equalizer
pactl load-module module-equalizer-sink
pactl load-module module-dbus-protocol
qpaeq
```