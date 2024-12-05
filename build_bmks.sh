#!/bin/bash

# Does not run:
# facesim, ferret, freqmine, netdedup, netferret, netstreamcluster, raytrace, vips

# List of all benchmarks, excluding 'facesim'
BENCHMARKS=(
    parsec.blackscholes
    parsec.bodytrack
    parsec.canneal
    parsec.dedup
    parsec.fluidanimate
    parsec.streamcluster
    parsec.swaptions
    parsec.x264
    splash2.barnes
    splash2.cholesky
    splash2.fft
    splash2.fmm
    splash2.lu_cb
    splash2.lu_ncb
    splash2.ocean_cp
    splash2.ocean_ncp
    splash2.radiosity
    splash2.radix
    splash2.raytrace
    splash2.volrend
    splash2.water_nsquared
    splash2.water_spatial
    splash2x.barnes
    splash2x.cholesky
    splash2x.fft
    splash2x.fmm
    splash2x.lu_cb
    splash2x.lu_ncb
    splash2x.ocean_cp
    splash2x.ocean_ncp
    splash2x.radiosity
    splash2x.radix
    splash2x.raytrace
    splash2x.volrend
    splash2x.water_nsquared
    splash2x.water_spatial
)

# Set static build flags
export CFLAGS="--static"
export LDFLAGS="--static"

# Iterate through benchmarks and build each
echo "Building all benchmarks except 'facesim'..."
for BENCHMARK in "${BENCHMARKS[@]}"; do
    echo "Building $BENCHMARK..."
    parsecmgmt -a build -c gcc-pthreads -p $BENCHMARK
    if [ $? -ne 0 ]; then
        echo "Error building $BENCHMARK. Skipping..."
    fi
done

echo "Build process complete."
