

git clone https://github.com/PythonSwiftLink/PythonSwiftLink

mkdir KivySwiftLink

cp -rf PythonSwiftLink/Sources KivySwiftLink/

cp -rf xcframework KivySwiftLink/Sources/PythonLib/
cp -f Package.swift KivySwiftLink
cp -rf KivyLauncher KivySwiftLink/Sources/KivyLauncher
#mv PythonSwiftLink Kivy-iOS-Package
