# The Source Code for HNSW

### Introduction

This repository contains the source code for the **HNSW** algorithm,
### Modifications

We have modified the original code by:

1. **Adding binary file support**: Implemented functionality to load raw vector data from binary files, requiring only the number of points and dimensions as input.

2. **Facilitating experiment management**: Provided a C++ `main.cpp` interface to run indexing and search separately, simplifying the process of managing and running experiments on HNSW
3. **Improving the search efficiency**: We adopt a single priority queue beam width for search instead of original code in HNSW for search using inefficient double priority queue for search. A single priority queue search is used accross different graph method in our experiment Please refer to the supplementary material for more details
4. 


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
./Release/HNSW --dataset dataset.bin --dataset-size n --timeseries-size dim --index-path indexdirname --M M --efconstruction EFC --mode 0
```

Where:
- `path/dataset.bin` is the absolute path to the dataset binary file.
- `n` is the dataset size.
- `path/indexdirname/` is the absolute path where the index will be stored (the index folder should not already exist).
- `dim` is the dimension.
- `M` is the 1/2 maximum outdegree for nodes during graph construction.
- `EFC` is the beamwidth during candidate neighbor search.


### Parameters
We tune both parameters and selecte the ones giving the best efficiency accuracy tradeoff

### Parameters Table

| **Parameter** | **Description**                           | **Values (1M Dataset)** | **Values (25GB Dataset)**  | **Values (25GB Dataset)**| **Values (1B Dataset)**  |
|---------------|-------------------------------------------|--------------------------|---------------------------|--------------------------|---------------------------|
| **M**         | Maximum connections per node              | 20                       | 30                        | 50                       | 40                        |
| **EFC**       | Beam width during search                  | 400                      | 600                       | 800                      | 1000                      |


### Search
```shell
/Release/HNSW --queries path/queries.bin --queries-size nq --index-path path/indexdirname/ --timeseries-size dim  --K k  --L beamwidth 
```
Where:
- `path/queries.bin` is the absolute path to the query set binary file.
- `nq` is the query set size.
- `k` is  the number of queries to be answered.
- `L` is thebeam width size (should be greater than **K**).

### Workload
To automate multiple run, please change the workload.sh with correct data path and parameters 
