FROM bids/base_validator

RUN apt-get update && \
    apt-get install -y tcsh libxp6 xfonts-base python-qt4             \
                        libmotif4 libmotif-dev motif-clients          \
                        gsl-bin netpbm gnome-tweak-tool libjpeg62 &&  \
    chsh -s /usr/bin/tcsh && \
    

