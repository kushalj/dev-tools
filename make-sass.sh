#!/bin/sh

# Creates the following structure:

# stylesheets/
# |
# |-- modules/              # Common modules
# |   |-- _all.scss         # Include to get all modules
# |   |-- _utility.scss     # Module name
# |   |-- _colors.scss      # Etc...
# |   ...
# |
# |-- partials/             # Partials
# |   |-- _base.sass        # imports for all mixins + global project variables
# |   |-- _buttons.scss     # buttons
# |   |-- _figures.scss     # figures
# |   |-- _grids.scss       # grids
# |   |-- _typography.scss  # typography
# |   |-- _reset.scss       # reset
# |   ...
# |
# |-- vendor/               # CSS or Sass from other projects
# |   |-- _colorpicker.scss
# |   |-- _jquery.ui.core.scss
# |   ...
# |
# `-- main.scss            # primary Sass file
#


# Functions and parameters

# checks if $1 exists, creates it if it doesn't
dirMaker () {
    if [ -z "$1" ];                           # Is parameter #1 zero length?
        then
            echo "directory name missing"          # Or no parameter passed.
            return 1
    fi

    if [ ! -d "$1" ]; 
        then
            echo "Making directory $1"
            mkdir $1
            return 0
        else
            echo "Directory $1 exists; moving on..."
            return 0
    fi
}


# checks if $1 exists, creates it if it doesn't
fileMaker () {
    if [ -z "$1" ];                           # Is parameter #1 zero length?
        then
            echo "filename missing"          # Or no parameter passed.
            return 1
    fi

    if [ ! -f "$1" ]; 
        then
            echo "Making file $1"
            touch $1
            return 0
        else
            echo "File $1 exists; moving on..."
            return 0
    fi
}


# Root

dirMaker "stylesheets"
cd stylesheets
    fileMaker   "main.css"

    # modules
    dirMaker    "modules"
    cd modules
        fileMaker "_all.scss"
        fileMaker "_utility.scss"
        fileMaker "_colors.scss"
    cd ..

    # partials
    dirMaker    "partials"
    cd partials
        fileMaker "_base.scss"
        fileMaker "_buttons.scss"
        fileMaker "_figures.scss"
        fileMaker "_grids.scss"
        fileMaker "_typography.scss"
        fileMaker "_reset.scss"
    cd ..

    # vendor 
    dirMaker    "vendor"
    cd vendor
        fileMaker "_colorpicker.scss"
        fileMaker "_jquery.ui.core.scss"
    cd ..

cd ..


