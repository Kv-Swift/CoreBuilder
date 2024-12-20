from psbuilder import main
import sys
if __name__ == "__main__":
    ver = sys.argv.pop()
    sys.argv += [
        "swiftpackage", "all",
        "--version", ver
    ]
    print(sys.argv)
    main()
