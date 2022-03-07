
# Install Operating system and dependencies
FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# local proxy mirror
#RUN export https_proxy=http://10.10.57.133:7890 http_proxy=http://10.10.57.133:7890 all_proxy=socks5://10.10.57.133:7890

# download Flutter SDK from Flutter Github repo
#RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

#RUN export PUB_HOSTED_URL=https://pub.flutter-io.cn
#RUN export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# Set flutter environment path
#ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
#RUN flutter doctor

# Enable flutter web
#RUN flutter channel master
#RUN flutter upgrade
#RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
ADD ./build/web/ /app/
ADD ./server.sh /app/
WORKDIR /app/
#RUN flutter build web --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.33.0/bin/ --release

# Record the exposed port
EXPOSE 5000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server.sh"]

ENTRYPOINT [ "/app/server.sh"]
