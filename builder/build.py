from psbuilder import main
import sys


if __name__ == "__main__":
    recipe = sys.argv.pop()
    sys.argv += [
        "build", recipe
    ]
    print(sys.argv)
    main()
