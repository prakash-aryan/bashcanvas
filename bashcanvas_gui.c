#include <ncurses.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <unistd.h>

#define MAX_PROFILES 50
#define MAX_PROFILE_NAME_LENGTH 50

void apply_profile(const char* profile_name) {
    char command[200];
    snprintf(command, sizeof(command), "%s/BashCanvas/switch_profile.sh %s", getenv("HOME"), profile_name);
    endwin();  // Temporarily end ncurses mode
    system(command);
    exit(0);  // Exit the app
}

int main() {
    char* profiles[MAX_PROFILES];
    int num_profiles = 0;
    int selected_profile = 0;

    // Read profile names from the profiles directory
    DIR* dir;
    struct dirent* entry;
    dir = opendir("profiles");
    if (dir != NULL) {
        while ((entry = readdir(dir)) != NULL && num_profiles < MAX_PROFILES) {
            if (entry->d_type == DT_REG && strstr(entry->d_name, ".sh") != NULL) {
                char *dot = strrchr(entry->d_name, '.');
                if (dot != NULL) *dot = '\0';  // Remove .sh extension
                profiles[num_profiles] = strndup(entry->d_name, MAX_PROFILE_NAME_LENGTH);
                num_profiles++;
            }
        }
        closedir(dir);
    }

    // Initialize ncurses
    initscr();
    cbreak();
    noecho();
    keypad(stdscr, TRUE);

    // Set up colors
    start_color();
    init_pair(1, COLOR_CYAN, COLOR_BLACK);
    init_pair(2, COLOR_GREEN, COLOR_BLACK);
    init_pair(3, COLOR_YELLOW, COLOR_BLACK);

    // Main loop
    while (1) {
        clear();
        attron(COLOR_PAIR(1));
        mvprintw(0, 0, "BashCanvas - Select a profile:");
        attroff(COLOR_PAIR(1));

        // Display profile list
        for (int i = 0; i < num_profiles; i++) {
            if (i == selected_profile)
                attron(A_REVERSE | COLOR_PAIR(2));
            mvprintw(i + 2, 2, "%s", profiles[i]);
            attroff(A_REVERSE | COLOR_PAIR(2));
        }

        // Display instructions
        attron(COLOR_PAIR(3));
        mvprintw(num_profiles + 3, 0, "Use arrow keys to navigate, Enter to select, 'q' to quit.");
        mvprintw(num_profiles + 4, 0, "Press 'n' to create a new profile.");
        attroff(COLOR_PAIR(3));

        // Refresh the screen
        refresh();

        // Handle user input
        int ch = getch();
        switch (ch) {
            case KEY_UP:
                if (selected_profile > 0)
                    selected_profile--;
                break;
            case KEY_DOWN:
                if (selected_profile < num_profiles - 1)
                    selected_profile++;
                break;
            case '\n':  // Enter key
                // Apply the selected profile and exit
                apply_profile(profiles[selected_profile]);
                break;
            case 'n':  // New profile
                echo();
                char new_profile[MAX_PROFILE_NAME_LENGTH];
                mvprintw(num_profiles + 5, 0, "Enter new profile name: ");
                getnstr(new_profile, MAX_PROFILE_NAME_LENGTH - 1);
                noecho();
                apply_profile(new_profile);
                break;
            case 'q':
                endwin();
                // Free allocated memory
                for (int i = 0; i < num_profiles; i++) {
                    free(profiles[i]);
                }
                return 0;
        }
    }

    endwin();
    return 0;
}
