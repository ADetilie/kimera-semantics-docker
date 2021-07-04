# kimera-semantics-docker

This project contains docker files and scripts which allow user to build and launch [Kimera-Semantics](https://github.com/MIT-SPARK/Kimera-Semantics) project easily on particular data-set.

# How to use

Build needed docker images first:
```bash
./build_all_layers.sh
```


## Run with default dataset

Download [kimera_semantics](https://drive.google.com/file/d/1SG8cfJ6JEfY2PGXcxDPAMYzCcGBEh4Qq/view) dataset.

Copy downloaded dataset into `Input` directory.

Launch Kimera-Semantics:
```bash
./run_session.sh
```


## Run with uHumans2 dataset

Download [uHumans2](http://web.mit.edu/sparklab/datasets/uHumans2/) dataset.

Rename downloaded dataset to `kimera_semantics_demo.bag`.

Copy downloaded dataset into `Input` directory.

Launch Kimera-Semantics:
```bash
./run_session_uHumans2.sh
```


## Run in interactive mode

To run kimera-semantics-docker in interactive mode, simply call:
```bash
./run_session_interactive.sh
```

# Output

After simulation completion *.ply file with reconstructed mesh should be stored in `Output` directory.

# Tips

To improve kimera-semantics performance, *.bag file could be decompressed. <br/>
To do it, run docker image in interactive mode:
```bash
./run_session_interactive.sh
```

And unpack *.bag file inside docker:
```bash
cd /tmp/kimera-semantics-custom/Input
rosbag decompress kimera_semantics_demo.bag
```

After that - you can leave interactive mode and run kimera-semantics simulation and use unpacked *.bag file as an input.