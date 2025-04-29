FROM selenium/standalone-chromium:134.0

# 切换到 root 用户
USER root

# 修复 base-files 安装问题并安装 python3
RUN rm -f /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i '/^deb http/!d' /etc/apt/sources.list && \
    dpkg-divert --remove /lib32 || true && \
    apt-get update && \
    apt-get install -y --no-install-recommends python3-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
