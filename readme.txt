
Ai-------6/23/2020 train step ----------

setup: newpcamd, py2.7 native 

ae_train exp_group/my_autoencoder -d
	this will interactive train, show a window with 
	  3 subwindow: train data, reconstructed, and gt
	  in the window hit any key will move to next train sample

ae_train exp_group/my_autoencoder 
	this will perform 30000 iteration of training with no gui window.
	  to run it more after 30000 iteration, need to change to iteration
	  parameter in the configure file $AE_WORKSPACE_PATH/cfg/exp_group/my_autoencoder.cfg

the train 3d object sample: see models/*.ply, wuson.ply does not work
	obj_04.ply train well.
	to train a different object, change my_autoencoder.cfg and change iteration #

-------6/22/2020 --------------------
newamdpc, ub18, data5
AugumentedAutoencoder/

sudo apt-get install libglfw3-dev libglfw3  

sudo apt-get install libassimp-dev  
Tensorflow >= 1.6
OpenCV >= 3.1

pip install --user --pre --upgrade PyOpenGL PyOpenGL_accelerate
pip install --user cython
pip install --user cyglfw3
pip install --user pyassimp==3.3
pip install --user progressbar
pip install configparser pyassimp
pip2 install imageio==2.6.1
pip install user imgaug

initial setup:
	scipy==1.14.1
	pip install -r requirements.txt
	pip install . 
		this will install auto_pose pkg which is a subpackage here. 
		auto_pose pkg has ae_init_workspace script to setup workspace.

tensorflow 1.15.3
	1.15 seems work fine with cuda10
	1.6 - 1.12 requuire cuda9.0
	1.13       require cuda10.0
training:
ae_train exp_group/my_autoencoder
	ply file :
		keytruck.ply not work
		wuson.ply work
	error: RuntimeError: Attempted to use a closed Session.	
docker run --gpus all -it -v "${PWD}:/media/student/data5/AugmentedAutoencoder" jwang3vsu/tensorflow:tf1.14-keras bash

	6/22/20 venv (autoencoder) with tensorflow cpu version works
		tensorflow 1.12.0
		python3

	6/22/20 use docker image ub16cuda9py2 seems promising.
		docker run --gpus all -it -v "${PWD}:/media/student/data5/AugmentedAutoencoder" jwang3vsu/ub16cuda9py2 bash
		cd /media/student/data5/AugmentedAutoencoder
		pip install .
		ae_train exp_group/my_autoencoder
	6/23/2020 dead end, docker image opengl not working with nvidia 

	6/23/20 native python2.7 + tensorflow-gpu 1.12	
		7/5/20 recheck

		steps:
			check /usr/local/cuda-10 folder
			. ./init_env.sh
		  	note: autoencoder_ws_2, don't use ~/bin/py36aae.sh	
			
		ae_train exp_group/my_autoencoder -d 
			work, show the gui
		ae_train exp_group/my_autoencoder 
			work, gpu 7gb, 3 hr.
		to examine the result
