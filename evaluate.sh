#!/usr/bin/env bash

# shell script to make your evaluation quicker and save repetetive time
# by Florian Keitel

#
#	Usage: evaluate <name_of_project> <name_of_person> <git_repo>
#

# Define variables
# change to your Evaluations folder location
EVALUATIONS_DIR="$HOME/Desktop/Evaluations"
PROJECT_NAME="$1"
PERSON_NAME="$2"
GIT_REPO="$3"
NEW_FOLDER_NAME="$PERSON_NAME"_"$PROJECT_NAME"
CLONE_DIR="$EVALUATIONS_DIR/$PROJECT_NAME"

# Function to clone repository
clone_repository() {
	cd "$CLONE_DIR"

	# check if the folder is already there
	if [ -d "$NEW_FOLDER_NAME" ]; then
		echo "$PERSON_NAME"_"$PROJECT_NAME already exists."
		exit 1
	fi
    echo "Cloning repository $GIT_REPO into $CLONE_DIR"
    git clone "$GIT_REPO" "$NEW_FOLDER_NAME"
	if [ $? -ne 0 ]; then
        echo "Error: Cloning failed."
        exit 1
    fi
	
	# Open folder directly in VS Code
	open_in_vscode "$CLONE_DIR"
}

# Function to open folder in Visual Studio Code
open_in_vscode() {
    open -a "Visual Studio Code" "$1"
}

# Main function
main() {

	cd "$HOME"
    # Check if the Evaluations directory exists
    if [ ! -d "$EVALUATIONS_DIR" ]; then
        echo "Evaluations directory not found. Creating..."
        mkdir -p "$EVALUATIONS_DIR"
    fi

    # Check if the project directory exists
    if [ -d "$CLONE_DIR" ]; then
        echo "Project directory $PROJECT_NAME already exists. Cloning into existing directory..."
        clone_repository
    else
        echo "Project directory $PROJECT_NAME not found. Creating..."
        mkdir -p "$CLONE_DIR"
        clone_repository
    fi
    echo "Clone completed successfully."

}

# Check if all arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: eval <name_of_project> <name_of_person> <git_repo>"
    exit 1
fi

main "$@"

