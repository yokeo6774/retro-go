FROM espressif/idf:release-v5.2

WORKDIR /app

ADD . /app

# RUN pip install -r requirements.txt

# Apply patches
# RUN cd /opt/esp/idf && \
#	patch --ignore-whitespace -p1 -i "/app/tools/patches/panic-hook (esp-idf 4).diff" && \
#	patch --ignore-whitespace -p1 -i "/app/tools/patches/sdcard-fix (esp-idf 4).diff"

# Build
SHELL ["/bin/bash", "-c"]
RUN . /opt/esp/idf/export.sh && \
	python3 rg_tool.py --target es3c28p build-img
