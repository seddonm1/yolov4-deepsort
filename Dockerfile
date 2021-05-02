FROM tensorflow/tensorflow:2.3.2-gpu

# copy in source
COPY . /src

# add python packages
RUN pip3 install -r /src/requirements-gpu.txt

# create tensorflow checkpoints
RUN cd /src && \
    python save_model.py --model yolov4 --size 416 && \
    python save_model.py --model yolov4 --size 512 && \
    python save_model.py --model yolov4 --size 640 && \
    python save_model.py --model yolov4 --size 768 && \
    python save_model.py --model yolov4 --size 960 && \
    python save_model.py --model yolov4 --size 1024 && \
    rm /src/data/*.weights