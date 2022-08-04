RED='\033[0;31m'
NC='\033[0m'

errEcho() {
    echo >&2 "$*"
}

redErrEcho() {
    echo >&2 "${RED}${*}${NC}"
}
watch-n-run() {
    if [[ $# -ne 1 ]]; then
        errEcho "Watches for FS events on a file and executes the file (twice"
        errEcho "sometimes!)"
        errEcho
        errEcho "Usage: watch-n-run ./file_name"
        return 1
    fi
    # This is bad, and it fails if you give this program an absolute path, but is
    # also protects you from passing in a file in the CWD like "shutdown" where
    # when it goes to execute it it won't execute "./shutdown" but actually
    # "shutdown". I can't use "-f" in readlink because it's not there in macOS
    file="./${1}"
    if [[ ! -e $file ]]; then
        redErrEcho "error: $file does not exist"
        return 2
    elif [[ ! -x $file ]]; then
        redErrEcho "error: $file is not executable by current user"
        redErrEcho "Perhaps 'chmod +x $file'?"
        return 3
    else
        fswatch -0 "$file" | while read -r -d "" _; do
            errEcho "watch-n-run: Running file at $(date '+%H:%M:%S')"
            $file
            exitCode=$?
            if [[ $exitCode -ne 0 ]]; then
                redErrEcho "watch-n-run: $file exited with $exitCode status"
            fi
            echo
        done
    fi
}
