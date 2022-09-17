bin/aquacppminer-gpu: src/*.cpp src/*.h
	mkdir -p bin
	cmake -Bbuild
	make -C build -j12 aquacppminer-gpu
	mv build/aquacppminer-gpu bin/aquacppminer-gpu
