function fi() {
  CD=$(pwd)
  cd ~/github/fpm/
  cargo install --path=.
  cd $CD
}

function ac() {
  git commit -m "$(git branch --show-current): $1"
}

function gp() {

}
