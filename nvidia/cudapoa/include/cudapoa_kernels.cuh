// Header for for CUDA POA host kernel wrappers.

#pragma once

#include <stdint.h>
#include <cuda_runtime_api.h>

#define CUDAPOA_MAX_NODE_EDGES 5
#define CUDAPOA_MAX_NODES_PER_WINDOW 500

namespace nvidia {

namespace cudapoa {

void generatePOA(uint8_t* consensus_d,
                 size_t conensus_pitch,
                 uint8_t* sequences_d,
                 size_t sequences_pitch,
                 uint32_t max_sequence_size,
                 uint16_t * num_sequences_per_window_d,
                 uint16_t * sequence_lengths_d,
                 uint32_t max_depth_per_window,
                 uint32_t total_windows,
                 uint32_t num_threads, uint32_t num_blocks, cudaStream_t stream,
                 int32_t* scores, int16_t* ti, int16_t* tj,
                 uint8_t* nodes,
                 uint16_t*,  uint16_t*, uint16_t*, uint16_t*, uint16_t*, uint16_t*, uint16_t*);

void topologicalSort(uint8_t* sorted_poa_d,
                     uint16_t node_count,
                     uint16_t* incoming_edge_count_d,
                     uint16_t* outoing_edges_d,
                     uint16_t* outgoing_edge_count_d,
                     uint32_t num_threads, uint32_t num_blocks, cudaStream_t stream);

}

}
