#!/usr/bin/env bash
export CUDAHOME=/usr/local/cuda-10.0
export PATH=/usr/local/cuda-10.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64/:$LD_LIBRARY_PATH
export PYOPENGL_PLATFORM='egl'
export AE_WORKSPACE_PATH="$(pwd)/autoencoder_ws_2"
echo $AE_WORKSPACE_PATH
#cd $AE_WORKSPACE_PATH;ae_init_workspace;cd ..
