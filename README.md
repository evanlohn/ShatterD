# ShatterD
Similar to the Shatter symmetry breaking tool, but does not introduce new solutions.

This tool was created as an extension of Shatter version 0.3, effectively we just replaced the last of the four steps shatter takes.
Code only tested on Ubuntu 20.04.2 LTS, python 3.8.10, perl v5.30.0, but probably works on most Linux machines with python>=3.5

## Installation
1. Install the symmetry breaking tool Shatter v0.3, last known to be available [here](http://www.aloul.net/Tools/shatter/)
2. Clone this repo

## Usage
The command to run is:
```
/path/to/dshatter foo.cnf [bar.cnf] [baz]
```
where 
- `foo.cnf` is the name of the cnf file you want to generate symmetry breaking clauses for
- `bar.cnf` is the optional name of the output cnf containing the original cnf plus the syymetry breaking clauses (default is `foo_dshatter.cnf`, output in same directory as `foo.cnf`)
- `baz` is an optional output file that contains only the symmetry breaking clauses (by default, this file is not outputted).

