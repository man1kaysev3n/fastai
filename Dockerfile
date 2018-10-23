FROM nvcr.io/nvidia/pytorch:18.09-py3

LABEL maintainer="Kai Lichtenberg <kai@sentin.ai>"

RUN /opt/conda/bin/conda install -c pytorch pytorch-nightly cuda92
RUN /opt/conda/bin/conda install -c fastai torchvision-nightly
RUN /opt/conda/bin/conda install -c fastai fastai

WORKDIR /

RUN git clone https://github.com/fastai/fastai.git 

WORKDIR /fastai

RUN jupyter notebook --generate-config &&\
    echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py &&\
    echo "c.NotebookApp.password = ''" >> ~/.jupyter/jupyter_notebook_config.py

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
