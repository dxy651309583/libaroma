#!/bin/sh
cd libaroma

$LIBAROMA_GCC \
  -static \
  -fdata-sections -ffunction-sections -Wl,--gc-sections \
  -D_GLIBCXX_DEBUG_PEDANTIC -D_GLIBCXX_DEBUG \
  -fPIC -DPIC -Wl,-s -Werror \
  \
    $LIBAROMA_CFLAGS \
  \
    -DLIBAROMA_CONFIG_DEBUG=$LIBAROMA_CONFIG_DEBUG \
    -DLIBAROMA_CONFIG_DEBUG_FILE=$LIBAROMA_CONFIG_DEBUG_FILE \
    -DLIBAROMA_CONFIG_DEBUG_MEMORY=$LIBAROMA_CONFIG_DEBUG_MEMORY \
    -DLIBAROMA_CONFIG_COMPILER_MESSAGE=$LIBAROMA_CONFIG_COMPILER_MESSAGE \
    -DLIBAROMA_CONFIG_SHMEMFB=$LIBAROMA_CONFIG_SHMEMFB \
  \
    ../obj/*.o ./*.o \
    ../../../examples/libaroma_test.c \
  \
  -I../../../include \
  -I../../../src \
  -o ../bin/libaroma_test \
  \
  -lm -lpthread -lstdc++ -lrt
