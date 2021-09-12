# Install volta if necessary
modules=(
  node
  yarn
  tsc
)

if [[ ! "$VOLTA_HOME" ]]; then
  curl https://get.volta.sh | bash -s -- --skip-setup
  export VOLTA_HOME=~/.volta
  grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"
  for v in ${modules[@]}
  do
    volta install $v
    export VOLTA_BIN_${v^^}="$(volta which $v)"
  done
fi
unset v modules
