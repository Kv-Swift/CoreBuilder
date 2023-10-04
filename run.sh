python3.10 -m venv venv
. venv/bin/activate

pip3 install https://github.com/kivy/kivy-ios/archive/master.zip

./build.sh
./restructure.sh


#fake other process
cd output
chmod 755 create_package.sh
./create_package.sh