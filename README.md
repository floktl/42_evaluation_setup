
# Evaluate Script

This shell script (`evaluate`) is designed to reduce the process of setting up the pre_settings before an evaluation at 42 by automating the cloning of Git repositories inside your evaluation folder and opening them in Visual Studio Code. It can save valuable time before evaluation sessions.

• If the Evaluations directory does not exist, the script will create it automatically.

• Ensure that Visual Studio Code is installed on your system.
   
## Installation

1. **Navigate to the Directory:** go to the home directory:

   ```zsh
   cd ~
   
2. **Clone the Repository:** Clone this repository to your local machine:

   ```zsh
   git clone https://github.com/floktl/42_evaluation_setup.git


3. **Navigate to the Directory and make the Script Executable:**

   ```zsh
   cd 42_evaluation_setup && chmod +x evaluate.sh

4. **(Optional) change the path where your evaluation should be:**

   Replace the default with the actual path to the evaluate scrip inside the evaluate.sh script
   
    ```zsh
    EVALUATIONS_DIR="$HOME/<your_path_where_you_want_to_elavuate>"
   
5. **Open your shell's configuration file (e.g., ~/.bashrc, ~/.bash_profile, ~/.zshrc):**
   
      ```zsh
      nano ~/.zshrc
   
6.  **Add the following lines inside your configuration file**
      
      ```zsh
      # function to make the setup of evaluations at 42 quicker
      function evaluate() {
      	if [ "$#" -ne 3 ]; then
      		echo "Usage: evaluate <name_of_project> <name_of_person> <git_repo>"
      	else
      		cd "$HOME/42_evaluation_setup"
      		./evaluate.sh "$1" "$2" "$3"
      		local path="$HOME/Desktop/Evaluations/$1/$2""_$1"
      		if [ -d "$path" ]; then
      			source "$path"
      		fi
      	fi
      }  
      # creating an alias, choose a name you like
      alias evaluate=evaluate
   
7.  **(if you did step 4)Change your evaluation path in the added lines in the configuration file:**

      ```zsh
      local path="$HOME/<your_path_where_you_want_to_elavuate>/$1/$2""_$1"
      
8. **Save your changes and start your terminal or reload configuration:**

   ```zsh
   source ~/.zshrc

## Usage

   The script takes three arguments: <name_of_project>, <name_of_person>, and <git_repo>
   
   Here's how to use it:

   • <name_of_project>: Name of the project being evaluated.
   
   • <name_of_person>: Name of the person associated with the evaluation.
   
   • <git_repo>: URL of the Git repository to clone.
   
## Example
   ```zsh
   evaluate my_project John git@vogsphere.42heilbronn.de:vogsphere/blablabla
