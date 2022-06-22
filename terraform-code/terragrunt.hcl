terraform {
  extra_arguments "init" {
    commands = [
      "init"
    ]    
    arguments = [
    ]
  }

  extra_arguments "apply_args" {
    commands = [
      "apply",
      "destroy"
    ]
    arguments = [
      "--auto-approve"
    ]
  }
}
