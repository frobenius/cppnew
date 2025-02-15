#!/bin/bash

VERSION=$(cat ./VERSION)
CONTROL_FILE=./tmp/cppnew_${VERSION}/DEBIAN/control
rm -rf ./tmp
mkdir -p ./tmp/cppnew_${VERSION}/DEBIAN
mkdir -p ./tmp/cppnew_${VERSION}/usr/local/bin
mkdir -p ./tmp/cppnew_${VERSION}/usr/local/share/cppnew

echo "Package: cppnew" > ${CONTROL_FILE}
echo "Version: ${VERSION}" >> ${CONTROL_FILE}
echo "Maintainer: Andrea Masullo" >> ${CONTROL_FILE}
echo "Architecture: all" >> ${CONTROL_FILE}
echo "Description: C++ cmake project creation tool" >> ${CONTROL_FILE}

cp ./cppnew ./tmp/cppnew_${VERSION}/usr/local/bin
sed -i "s/XXXXXXXXX/${VERSION}/g" ./tmp/cppnew_${VERSION}/usr/local/bin/cppnew
cp ./template/* ./tmp/cppnew_${VERSION}/usr/local/share/cppnew/

cd ./tmp/
dpkg-deb --build cppnew_${VERSION}
cp *.deb ../
cd ../
rm -rf tmp





