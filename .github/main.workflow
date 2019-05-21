workflow "Push to GAS" {
  on = "push"
  resolves = ["844196/actions/clasp@master"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "branch master"
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["Filters for GitHub Actions"]
  args = "install"
}

action "844196/actions/clasp@master" {
  uses = "844196/actions/clasp@master"
  needs = ["GitHub Action for npm"]
  args = "push"
  secrets = ["CLASPRC_JSON"]
}
