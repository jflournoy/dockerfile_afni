FROM bids/base_validator

RUN apt-get update && \
    apt-get install -y tcsh libxp6 xfonts-base python-qt4 curl            \
                        libmotif4 libmotif-dev motif-clients          \
                        gsl-bin netpbm gnome-tweak-tool libjpeg62 libglu1-mesa &&  \
    chsh -s /usr/bin/tcsh && \
    curl -O https://afni.nimh.nih.gov/pub/dist/bin/linux_fedora_21_64/@update.afni.binaries && \
    tcsh @update.afni.binaries -package linux_openmp_64 -do_extras && \
    export R_LIBS=$HOME/R && \
    mkdir $R_LIBS && \
    echo 'setenv R_LIBS ~/R' >> ~/.cshrc && \
    curl -O https://afni.nimh.nih.gov/pub/dist/src/scripts_src/@add_rcran_ubuntu.tcsh && \
    sed -i 's/apt-get \(.*\)install/apt-get \1install -y/' \@add_rcran_ubuntu.tcsh && \
    sudo tcsh @add_rcran_ubuntu.tcsh && \
    export PATH=$PATH:/root/abin/ && \
    rPkgsInstall -pkgs ALL && \
    cp $HOME/abin/AFNI.afnirc $HOME/.afnirc && \
    suma -update_env &&\
    echo 'export R_LIBS=$HOME/R' >> ~/.bashrc  

ENV PATH=$HOME/abin:$PATH
ENV R_LIBS=$HOME/R

