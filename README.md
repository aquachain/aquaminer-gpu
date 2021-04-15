# AquaMiner GPU

> AquaChain miner for CPU and GPU

## Building

The current project could be built by using _GPU_ capabilities optionally.

In order to build **with** GPU capabilities, use the next commands:

```
cmake . -Bbuild -DWITH_GPU=ON
cmake --build build
```

For building **wihout** GPU capabilities, use the next commands:

```
cmake . -Bbuild -DWITH_GPU=OFF
cmake --build build
```

## Usage

Once the project is built, you could run the application and get the help
information by using the next command:

```
./build/bin/aquaminer -h
```

