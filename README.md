# kimera-semantics-docker

This project contains docker files and scripts which allow user to build and launch [Kimera-Semantics](https://github.com/MIT-SPARK/Kimera-Semantics) project easily on particular data-set.


Buld needed docker image first:
```bash
./build_all_layers.sh
```

Create directory with `Input_Output` name inside the project directory.

Copy dataset *.bag file into `Input_Output` directory.

Launch Kimera-Semantics:
```bash
./run_session.sh
```

## Caution!
Currently project works properly only with `kimera_semantics_demo.bag` dataset which could be downloaded [here](https://drive.google.com/file/d/1SG8cfJ6JEfY2PGXcxDPAMYzCcGBEh4Qq/view).