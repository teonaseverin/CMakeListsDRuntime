delete:
	rm -rf ldc-build-runtime.tmp/CMakeFiles/ ldc-build-runtime.tmp/CMakeCache.txt
	rm -rf ldc-build-runtime.tmp/objects/* 

run:
	CC=arm-none-eabi-gcc ldc-build-runtime --dFlags="--d-version=CRuntime_Newlib;--mcpu=cortex-m4;-mtriple=thumb-none-linux-eabi;-O3;--function-sections;--data-sections" --cFlags="-ffunction-sections;-fdata-sections" --linkerFlags="--gc-sections" CMAKE_C_COMPILER_WORKS=True BUILD_SHARED_LIBS=OFF
	# cp ldc-build-runtime.tmp/lib/libdruntime-ldc.a ~/tock-upb/libtock-d/runtime/cortex-m/libdruntime-ldc2.a
	# LANG=d APP_NAME=linked_druntime_example make -C ~/tock-upb/ userspace kernel
	# make -C ~/tock-upb/libtock-d/examples/linked_druntime_example/

# -flto=thin
# -flto=full
