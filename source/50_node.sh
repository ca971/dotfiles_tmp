[[ "$1" != init && ! -e ~/.volta ]] && return 1

export PATH
export VOLTA_HOME="~/.volta"

#grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"
PATH="$(path_remove $VOLTA_HOME/bin):$VOLTA_HOME/bin"

# Use npx instead of installing global npm modules
function make_npx_alias () {
  alias $1="npx $@"
}

npm_global_modules=(
  json2yaml
  pushstate-server
  yaml2json
)

for n in "${npm_global_modules[@]}"; do
  make_npx_alias $n
done
unset n

function get_last_modified_js_file_recursive() {
  find . -type d \( -name node_modules -o -name .git -o -name .build \) -prune -o -type f \( -name '*.js' -o -name '*.jsx' \) -print0 \
    | xargs -0 stat -f '%m %N' \
    | sort -rn \
    | head -1 \
    | cut -d' ' -f2-
}

function watchfile() {
  yarn watch --testPathPattern "$(get_last_modified_js_file_recursive | sed -E 's#.*/([^/]+)/([^.]+).*#\1/\2.#')"
}

function watchdir() {
  yarn watch --testPathPattern "$(dirname "$(get_last_modified_js_file_recursive)")"
}
