source ./download.sh

echo "extracting archives"
tar xvf mpfr-4.1.0.tar.xz
tar xvf mpc-1.2.1.tar.gz
tar xvf gmp-6.2.1.tar.xz
tar xvf binutils-2.33.1.tar.xz
tar xvf gcc-9.4.0.tar.xz

echo "building mpfr"
cd ./mpfr-4.1.0/
mkdir ./build/
cd ./build/
../configure
make -j8
make install
cd ../
cd ../

echo "building mpc"
cd ./mpc-1.2.1/
mkdir ./build/
cd ./build/
../configure
make -j8
make install
cd ../
cd ../

echo "building gmp"
cd ./gmp-6.2.1/
mkdir ./build/
cd ./build/
../configure
make -j8
make install
cd ../
cd ../

export PREFIX="$HOME/opt/cross"
export TARGET=x86_64-elf
export PATH="$PREFIX/bin:$PATH"

echo "building binutils"
cd ./binutils-2.33.1/
mkdir ./build/
cd ./build/
../configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make -j8
make install
cd ../
cd ../

which -- $TARGET-as || echo $TARGET-as is not in the PATH

echo "building gcc"
cd ./gcc-9.4.0/
mkdir ./build/
cd ./build/
../configure -target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-he
make all-gcc -j8
make all-target-libgcc -j8
make install-gcc
make install-target-gcc
cd ../
cd ../
	
echo "请把  export PATH=\"$HOME/opt/cross/bin:$PATH\" 加入~/.bashrc的最后一行"
