

git clone https://github.com/PythonSwiftLink/PythonSwiftLink

cp -rf xcframework PythonSwiftLink/Sources/PythonLib/
cp -f Package.swift PythonSwiftLink
cp -rf KivyLauncher PythonSwiftLink/Sources/KivyLauncher
mv PythonSwiftLink Kivy-iOS-Package
