CDEF=" \033[0m"                                     # default color
CCIN=" \033[0;36m"                                  # info color
CGSC=" \033[0;32m"                                  # success color
CRER=" \033[0;31m"                                  # error color
CWAR=" \033[0;33m"                                  # waring color
b_CDEF=" \033[1;37m"                                # bold default color
b_CCIN=" \033[1;36m"                                # bold info color
b_CGSC=" \033[1;32m"                                # bold success color
b_CRER=" \033[1;31m"                                # bold error color
b_CWAR=" \033[1;33m"                                # bold warning color

prompt () {
  case ${1} in
    "-s"|"--success")
      echo -e "${b_CGSC}${@/-s/}${CDEF}";;          # print success message
    "-e"|"--error")
      echo -e "${b_CRER}${@/-e/}${CDEF}";;          # print error message
    "-w"|"--warning")
      echo -e "${b_CWAR}${@/-w/}${CDEF}";;          # print warning message
    "-i"|"--info")
      echo -e "${b_CCIN}${@/-i/}${CDEF}";;          # print info message
    *)
    echo -e "$@"
    ;;
  esac
}

conf () {

    # Checking argument is provided
    if [[ -z "$1" || $@ -gt 2 ]]; then
        prompt -e "Bad Usage: config [program_name].\n"
        exit 1
    fi

    if [[ -d "$DOT_DIR/$1"]]; then
        cd "$DOT_DIR/$1"
    else
        prompt -i "Configuration directory not found in $DOT_DIR for \'$1\'."
        prompt -i "start a new config directory for \'$1\' ? [y/n] (default: n)\n"
        read MAKE_NEW_DIR

        if [[$MAKE_NEW_DIR -eq "y"]]; then
            mkdir -p "$DOT_DIR/$1" && prompt -s "Made config directory for $1 at $DOT_DIR\n"
            cd "$DOT_DIR/$1"
        else
            prompt -i "Exiting...\n"
}
