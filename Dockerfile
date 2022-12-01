FROM python:3.8
WORKDIR /Chemformer-app
RUN conda install pytorch==1.8.0 torchvision cudatoolkit=11.1 -c pytorch -c nvidia
RUN conda install gcc_linux-64 gxx_linux-64 mpi4py
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN python -m pip install git+https://github.com/MolecularAI/pysmilesutils.git
COPY ./Chemformer ./Chemformer
CMD [ "./Chemformer/example_scripts/fine_tune.sh" ]
