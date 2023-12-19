#!/bin/bash

# Define variables
VERSION="v0.1.0"
MANUAL_PATH="E:/task1"  # Adjust the path as needed

# Function to display command manual
display_manual() {
    cat << EOF
.TH INTERNCTL 1 "2023-12-18" "v0.1.0" "internsctl Manual"

.SH NAME
internsctl \- Custom Linux command for operations

.SH SYNOPSIS
.B internsctl
[\fIOPTIONS\fR] [\fIARGUMENTS\fR]

.SH DESCRIPTION
.B internsctl
is a custom Linux command designed for specific operations.

.SH OPTIONS
.TP
\fB--help\fR
Display this help message.

.TP
\fB--version\fR
Display command version.

.SH EXAMPLES
.B internsctl --help
.B internsctl --version

.SH AUTHOR
Your Name

.SH COPYRIGHT
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

.SH VERSION
$VERSION
EOF
}

# Function to display command help
display_help() {
    cat << EOF
Usage: internsctl [OPTIONS] [ARGUMENTS]

OPTIONS
    --help          Display this help message
    --version       Display command version

EXAMPLES
    internsctl --help
    internsctl --version
EOF
}

get_cpu_info() {
    lscpu
}

# Main script logic
case "$1" in
    --help)
        display_help
        ;;
    --version)
        echo "internsctl $VERSION"
        ;;

    cpu)
        case "$2" in
            getinfo)
                get_cpu_info
                ;;
            *)
                echo "Error: Unknown subcommand. Use 'internsctl cpu getinfo' for CPU information."
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Error: Unknown option. Use 'internsctl --help' for usage instructions."
        exit 1
        ;;

esac

# Create the manual page
display_manual > "$MANUAL_PATH/internsctl.1"

# Display the manual page
if [ "$1" = "man" ]; then
    man "$MANUAL_PATH/internsctl.1"
fi
