function pushd2() {
  PUSHED="$(pwd)"
  cd "$PROJDIR""$1" >>/dev/null
}

function popd2() {
  cd "${PUSHED:-"$PROJDIR"}" >>/dev/null
  unset PUSHED
}

function wip() {
  pushd2
  commit_message=${1:-wip}
  git add .
  git commit -m "${commit_message}"
  git push
  popd2
}