if [[ ! -o interactive ]]; then
    return
fi

compctl -K _luenv luenv

_luenv() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(luenv commands)"
  else
    completions="$(luenv completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
