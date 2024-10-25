# The Source Code for VAMANA

### Introduction

This repository contains the source code for the **VAMANA** algorithm,
### Modifications

We have modified the original code by:

1. **Adding binary file support**: Implemented functionality to load raw vector data from binary files, requiring only the number of points and dimensions as input.

2. **Facilitating experiment management**: Provided a C++ `main.cpp` interface to run indexing and search separately, simplifying the process of managing and running experiments on HNSW
3. **Disable Unfair Optimization**: We disabled the warming of the cache before search with query results, as well as L2 normalization to reduce L2  to MIPS problem.



### Prerequisites

- GCC 4.9+ with OpenMP
- CMake 3.5+

### Compilation on Linux
```shell
mkdir Release
cd Release
cmake -DCMAKE_BUILD_TYPE=Release ..
make
```


### Building
```shell
./Release/tests/vamana --dataset dataset.bin --dataset-size n --timeseries-size dim --index indexdirname --K K --L L --C range --alpha alpha --mode 0
```

Where:
- `path/dataset.bin` is the absolute path to the dataset binary file.
- `n` is the dataset size.
- `path/indexdirname/` is the absolute path where the index will be stored (the index folder should not already exist).
- `dim` is the dimension.
- `K` is the maximum outdegree for nodes during graph construction.
- `L` is the beamwidth during candidate neighbor search.
- `C` the maximum num of visited candidate considered (like in NSG).
- `alpha` RRND factor.


### Parameters
We tune all parameters and select the values giving the best efficiency accuracy tradeoff

### Parameters Table

| **Parameter** | **Description**                           | **Values (1M Dataset)** | **Values (25GB Dataset)**  | **Values (25GB Dataset)**| **Values (1B Dataset)**  |
|---------------|-------------------------------------------|--------------------------|---------------------------|--------------------------|---------------------------|
| **K**         | Maximum connections per node              | 40                       | 60                        | 60                       | 60                        |
| **L**       | Beam width during search                  | 256                      | 600                       | 800                      | 1000                      |
| **C**       | range                 | 400                     | 600                     | 800                     | 1000                     |
| **alpha**       | RRND parameters                 | 1.2                      | 1.2                      | 1.1                      | 1.1                      |


### Search
```shell
./Release/tests/vamana --queries path/queries.bin --queries-size nq --index-path path/indexdirname/ --timeseries-size dim  --K k  --L beamwidth 
```
Where:
- `path/queries.bin` is the absolute path to the query set binary file.
- `nq` is the query set size.
- `k` is  the number of queries to be answered.
- `L` is thebeam width size (should be greater than **K**).

### Workload
To automate multiple run, please change the workload.sh with correct data path and parameters 
