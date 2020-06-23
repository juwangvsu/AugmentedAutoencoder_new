-------6/22/2020 --------------------
newamdpc, ub18, data5
AugumentedAutoencoder/

initial setup:
	scipy==1.14.1
	pip install -r requirements.txt
	pip install . 
		this will install auto_pose pkg which is a subpackage here. 
		auto_pose pkg has ae_init_workspace script to setup workspace.

tensorflow 1.15.3
	1.16 does not exist?
	1.15 seems work fine with cuda10

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
		...
