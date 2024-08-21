# BashCanvas

BashCanvas is a custom bash profile manager that allows you to switch between different themed terminal environments easily. It provides a more personalized and enjoyable command-line experience with visually appealing prompts and useful functions.

## Features

- Multiple themed profiles (Cosmic Explorer, Cyberpunk Hacker, Oceanic Dream)
- Easy switching between profiles using a GUI
- Customizable prompts with Git integration
- Themed ASCII art and animations

## Screenshots

(TODO: Add screenshots for each profile here)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/prakash-aryan/bashcanvas.git ~/BashCanvas
   ```

2. Install the required package:
   ```bash
   sudo apt install libncurses-dev
   ```

3. Make the scripts executable:
   ```bash
   chmod +x ~/BashCanvas/*.sh ~/BashCanvas/profiles/*.sh
   ```

4. Edit your `~/.bashrc` file:
   ```bash
   nano ~/.bashrc
   ```
   Add the following at the end of the file:
   ```bash
   # BashCanvas Profile Loading
   if [ -f "$HOME/.current_profile" ]; then
       current_profile=$(cat "$HOME/.current_profile")
       profile_file="$HOME/BashCanvas/profiles/${current_profile}.sh"
       if [ -f "$profile_file" ]; then
           source "$profile_file"
       fi
   fi
   ```

5. Source your `.bashrc`:
   ```bash
   source ~/.bashrc
   ```

## Usage

1. Navigate to the BashCanvas directory:
   ```bash
   cd ~/BashCanvas
   ```

2. Compile the GUI:
   ```bash
   gcc -o bashcanvas_gui bashcanvas_gui.c -lncurses
   ```

3. Run the GUI:
   ```bash
   ./bashcanvas_gui
   ```

4. Use the arrow keys to navigate, Enter to select a profile, and 'q' to quit.

5. After selecting a profile, open a new terminal or source your `.bashrc` for the changes to take effect:
   ```bash
   source ~/.bashrc
   ```

## Uninstallation

To remove BashCanvas and its settings:

1. Remove the BashCanvas directory:
   ```bash
   rm -rf ~/BashCanvas
   ```

2. Edit your `~/.bashrc` file:
   ```bash
   nano ~/.bashrc
   ```
   Remove the BashCanvas Profile Loading block.

3. Remove the current profile file:
   ```bash
   rm ~/.current_profile
   ```

4. Source your `.bashrc` to apply changes:
   ```bash
   source ~/.bashrc
   ```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
