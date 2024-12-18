# delete inst file to rebuild fast. chage input file sizes to suit needs.

# parsec.blackscholes -> works with work stealing
# parsecmgmt -a build -p blackscholes -c gcc-pthreads
~/parsec-3.0/pkgs/apps/blackscholes/inst/aarch64-linux.gcc-pthreads/bin/blackscholes 4 /home/ishita/parsec-3.0/pkgs/apps/blackscholes/inputs/in_16.txt prices.txt: Crashes in Gem5
# time build/ARM/gem5.opt  -d test/test configs/example/se_SMT_ARM.py 'bmrk_binaries/parsec_FINAL/blackscholes 1 bmrk_binaries/parsec_FINAL/in_16.txt prices.txt' --threadTypes S --cpu=o3_grace_test --mem-type=DDR4_2400_16x4 --mem-size=64GB --mem-channels=2 --num-cpus=1 --smt -t 1 -WThreads 0 -SThreads 1 -MainSAllPW=True -ROBSize 256 -numSIQEntries 256 -numWIQEntries 10 -numIQEntries 256 -LQEntries 72 -SQEntries 68 -numPhysFloatRegs 280 -numPhysVecRegs 280 -numPhysIntRegs 280 > out

# bodytrack-> opnly openmp
~/parsec-3.0/pkgs/apps/bodytrack/inst/aarch64-linux.gcc-pthreads/bin/bodytrack /home/ishita/parsec-3.0/pkgs/apps/bodytrack/inputs/sequenceB_1 <frames> <annealing_layers> <particles> <threads>
time /home/ishita/parsec-3.0/pkgs/apps/bodytrack/inst/aarch64-linux.gcc-pthreads/bin/bodytrack /home/ishita/parsec-3.0/pkgs/apps/bodytrack/inputs/sequenceB_1 4 1 5 1 0 1

# canneal- Done not run
/path/to/parsec/pkgs/kernels/canneal/inst/<platform>/bin/canneal <num_threads> <num_iterations> <temp_steps> <input_file>
time /home/ishita/parsec-3.0/pkgs/kernels/canneal/inst/aarch64-linux.gcc-pthreads/bin/canneal 4 2 2 10.nets 2

# dedup-> not what I am looking for. Pipeline parallelism not TLP. 
$PARSECDIR/pkgs/apps/dedup/inst/<platform>/bin/dedup -c <compress_type> -i <input_file> -o <output_file> -t <num_threads>
time /home/ishita/parsec-3.0/pkgs/kernels/dedup/inst/aarch64-linux.gcc-pthreads/bin/dedup -c -p -v -t 1 -i /home/ishita/parsec-3.0/pkgs/kernels/dedup/run/test.dat -o output.dat.ddp

# fluidanimate: Is giving error when running with work stealing...
$PARSECDIR/pkgs/apps/fluidanimate/inst/<platform>/bin/fluidanimate <num_threads> <input_file> <output_file>
time /home/ishita/parsec-3.0/pkgs/apps/fluidanimate/inst/aarch64-linux.gcc-pthreads/bin/fluidanimate 4 1 /home/ishita/parsec-3.0/pkgs/apps/fluidanimate/run/in_5K.fluid out.fluid

# streamcluster: Can be done but not straight forward
time /home/ishita/parsec-3.0/pkgs/kernels/streamcluster/inst/aarch64-linux.gcc-pthreads/bin/streamcluster 10 20 32 4096 4096 1000 none output.txt 4

# swaptions: Too big to work on
time /home/ishita/parsec-3.0/pkgs/apps/swaptions/inst/aarch64-linux.gcc-pthreads/bin/swaptions -ns 16 -sm 10000 -nt 4

# x264 -> done not run
time /home/ishita/parsec-3.0/pkgs/apps/x264/inst/aarch64-linux.gcc-pthreads/bin/x264 --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 4 -o /home/ishita/parsec-3.0/pkgs/apps/x264/run/eledream.264 eledream_640x360_8.y4m

# barnes
/home/ishita/parsec-3.0/ext/splash2/apps/barnes/inst/aarch64-linux.gcc-pthreads/bin/barnes 4 < /home/ishita/parsec-3.0/ext/splash2/apps/barnes/run/input_4

# cholesky
/home/ishita/parsec-3.0/ext/splash2/kernels/cholesky/inst/aarch64-linux.gcc-pthreads/bin/cholesky -p3 < /home/ishita/parsec-3.0/ext/splash2/kernels/cholesky/run/tk14.o

# fft
/home/ishita/parsec-3.0/ext/splash2/kernels/fft/inst/aarch64-linux.gcc-pthreads/bin/fft -m16 -p4

# fmm -> does not run

# lu_cb
/home/ishita/parsec-3.0/ext/splash2/kernels/lu_cb/inst/aarch64-linux.gcc-pthreads/bin/lu_cb -p4 -n512 -b16

# lu_ncb
/home/ishita/parsec-3.0/ext/splash2/kernels/lu_ncb/inst/aarch64-linux.gcc-pthreads/bin/lu_ncb -p3 -n512 -b16

# ocean_cp -> does not run

# radiosity
/home/ishita/parsec-3.0/ext/splash2/apps/radiosity/inst/aarch64-linux.gcc-pthreads/bin/radiosity -batch -room -p 4

# radix -> too slow
/home/ishita/parsec-3.0/ext/splash2/kernels/radix/inst/aarch64-linux.gcc-pthreads/bin/radix -p3 -r1024 -n262144 -m524288
/home/ishita/parsec-3.0/ext/splash2/kernels/radix/inst/aarch64-linux.gcc-pthreads/bin/radix -p3 -r1024 -n2048 -m2048

# raytrace:
/home/ishita/parsec-3.0/ext/splash2/apps/raytrace/inst/aarch64-linux.gcc-pthreads/bin/raytrace -s -p3 /home/ishita/parsec-3.0/ext/splash2/apps/raytrace/run/teapot.env

# volrend -> does not work
/home/ishita/parsec-3.0/ext/splash2/apps/volrend/inst/aarch64-linux.gcc-pthreads/bin/volrend 3 head-scaleddown4

# water_nsquared
/home/ishita/parsec-3.0/ext/splash2/apps/water_nsquared/inst/aarch64-linux.gcc-pthreads/bin/water_nsquared 3 < /home/ishita/parsec-3.0/ext/splash2/apps/barnes/run/input_4

# water_spatial
/home/ishita/parsec-3.0/ext/splash2/apps/water_spatial/inst/aarch64-linux.gcc-pthreads/bin/water_spatial 4 < /home/ishita/parsec-3.0/ext/splash2/apps/water_spatial/run/input_4