name "developer"
description "developer role"
run_list(
  "recipe[TDI]",
  "recipe[git]",
  "recipe[chruby::system]",
  "recipe[virtualbox]"
)

default_attributes(
  "chruby" => {
    "rubies" => {
      "1.9.3-p392" => false,
      "1.9.3-p484" => false,
      "2.2.1" => true
    },
#    "default" => "1.9.3-p484"
     "default" => "2.2.1"
  }
)
