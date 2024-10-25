// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

#include <iostream>
#include "utils.h"

template<class T>
void block_convert(std::ifstream& reader, std::ofstream& writer, _u64 npts,
                   _u64 ndims) {
  auto read_buf = new T[4 * npts * (ndims + 1)];
/*
  auto cursor = read_buf;
  T    val;

  for (_u64 i = 0; i < npts; i++) {
    for (_u64 d = 0; d < ndims; ++d) {
      reader >> val;
      *cursor = val;
      cursor++;
    }
  }
*/
  reader.read((char*) read_buf, npts * ndims * sizeof(T));
//  PRINTVEC2(read_buf,ndims*npts)

/*  if(*(read_buf+ndims)==0){
    PRINTVEC2(read_buf,ndims)
    reader.close();
    writer.close();

  }*/

  writer.write((char*) read_buf, npts * ndims * sizeof(T));
  delete[] read_buf;
}

int main(int argc, char** argv) {
  if (argc != 6) {
    std::cout << argv[0]
              << "<float/int8/uint8> input_filename.tsv output_filename.bin "
                 "dim num_pts>"
              << std::endl;
    exit(-1);
  }

  if (std::string(argv[1]) != std::string("float") &&
      std::string(argv[1]) != std::string("int8") &&
      std::string(argv[1]) != std::string("uint8")) {
    std::cout << "Unsupported type. float, int8 and uint8 types are supported."
              << std::endl;
  }

  _u64 ndims = atoi(argv[4]);
  _u64 npts = atoi(argv[5]);

  std::ifstream reader(argv[2], std::ios::binary );
  //  _u64          fsize = reader.tellg();
//  reader.seekg(0, std::ios::beg);



  std::cout << npts << " "<< ndims << " " << argv[2] <<std::endl;
  /*
  //  diskann::alloc_aligned(((void**) &query), npts*dim*sizeof(T), 8 * sizeof(float));
  auto query1 = new float[ndims];
  for (size_t i = 0; i < npts; i++) {
    reader.read((char*) query1 , ndims * sizeof(float));
    PRINTVEC2(query1 ,ndims)
  }

  EXIT_PRG
  */
  _u64 blk_size = npts > 131072 ? 131072 : npts;
//  blk_size = ;
  std::cout<< "\n"<<blk_size<<std::endl;
  _u64 nblks = ROUND_UP(npts, blk_size) / blk_size;
  std::cout << "# blks: " << nblks << std::endl;
  std::ofstream writer(argv[3], std::ios::binary);
  auto          npts_s32 = (_u32) npts;
  auto          ndims_s32 = (_u32) ndims;
  writer.write((char*) &npts_s32, sizeof(_u32));
  writer.write((char*) &ndims_s32, sizeof(_u32));

  for (_u64 i = 0; i < nblks; i++) {
    _u64 cblk_size = std::min(npts - i * blk_size, blk_size);
    if (std::string(argv[1]) == std::string("float")) {
      block_convert<float>(reader, writer, cblk_size, ndims);
    } else if (std::string(argv[1]) == std::string("int8")) {
      block_convert<int8_t>(reader, writer, cblk_size, ndims);
    } else if (std::string(argv[1]) == std::string("uint8")) {
      block_convert<uint8_t>(reader, writer, cblk_size, ndims);
    }
    std::cout << "Block #" << i <<" of size "<<cblk_size<< " written" << std::endl;
  }

  reader.close();
  writer.close();
}
