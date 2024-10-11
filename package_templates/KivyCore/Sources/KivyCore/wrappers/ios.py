from swift_tools.swift_types import * # type: ignore


def get_scale() -> float: ...

def get_dpi() -> float: ...

def get_safe_area() -> object: ... # returns dict, but wanted to handle it on my own in swift..


@wrapper()
class IOSKeyboard:
    
    kheight: float
    
    
def get_kheight() -> float: ...