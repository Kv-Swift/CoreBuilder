from os.path import *

class MyTeam:

    @property
    def id():
        return "U7AZRR7LN3"

class WrapImport:
    products: list[str]
    modules: list[str]

class WrapPackage:
    url: str
    branch: str
    products: list[str]
    python_imports: WrapImport

    def __init__(self,url: str,branch: str, products: list[str],python_imports: WrapImport):
        self.url = url
        self.branch = branch
        self.products = products
        self.python_imports = python_imports


development_team = MyTeam()

info_plist = {
    "NSBluetoothAlwaysUsageDescription": "require bluetooth"
}



packages = {

    "PyCoreBluetooth": WrapPackage(
        url="https://github.com/KivySwiftPackages/PyCoreBluetooth",
        branch="master",
        products=[ "PyCoreBluetooth" ],
        python_imports=WrapImport(
            [ "PyCoreBluetooth" ],
            [ "corebluetooth" ]
        ),
    ),
    

}

root = "my_path/to/some_place"

pip_folders = [
    { "path": join(root, "other_pips") }
]

pip_requirements = join(root, "requirements.txt")