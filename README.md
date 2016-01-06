# Docker Container for Logitech Media Server

This is a Docker image for running the Logitech Media Server package
(aka SqueezeboxServer).

Run Directly:

    docker run -d \
               -p 9000:9000 \
               -p 3483:3483 \
               -v <local-state-dir>:/srv/squeezebox \
               -v <audio-dir>:/srv/music \
               plusminus/logitech-media-server


