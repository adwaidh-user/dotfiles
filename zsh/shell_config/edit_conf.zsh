edit-conf () {
    # Checking argument is provided
    if [[ -z "$1" || $# -gt 2 ]]; then
        prompt -e "Bad Usage: config [program_name].\n"
        return 1
    fi

    if [[ -d "$DOT_DIR/$1" ]]; then
        cd "$DOT_DIR/$1"
        $EDITOR "$DOT_DIR/$1"
    else
        prompt -i "Configuration directory not found in $DOT_DIR for '$1'."
        prompt -i "start a new config directory for '$1' ? [y/n] (default: n)"
        read MAKE_NEW_DIR

        if [[ $MAKE_NEW_DIR == "y" || $MAKE_NEW_DIR == "Y" ]]; then
            mkdir -p "$DOT_DIR/$1" && prompt -s "Made config directory for $1 at $DOT_DIR\n"
            cd "$DOT_DIR/$1"
        else
            prompt -i "Exiting...\n"
        fi
    fi
}
