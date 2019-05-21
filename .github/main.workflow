workflow "Push to GAS" {
  on = "push"
  resolves = ["clasp push"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "branch master"
}

action "GitHub Action for Yarn" {
  uses = "nuxt/actions-yarn@master"
  needs = ["Filters for GitHub Actions"]
  args = "install"
}

action "clasp push" {
  uses = "844196/actions/clasp@master"
  needs = ["GitHub Action for Yarn"]
  args = "push"
  secrets = ["CLASPRC_JSON"]
}
