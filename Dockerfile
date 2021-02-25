FROM jupyter/minimal-notebook:612aa5710bf9

# Add RUN statements to install packages as the $NB_USER defined in the base images.

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.

# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.
RUN conda create -n xeus-sql
RUN echo "source activate env" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH
RUN conda install xeus-sql=0.0.8 -c conda-forge
# Add RISE to the mix as well so user can show live slideshows from their notebooks
# More info at https://rise.readthedocs.io
# Note: Installing RISE with --no-deps because all the neeeded deps are already present.
RUN conda install rise
# Add nbgitpuller
RUN pip install nbgitpuller jupyter-resource-usage
