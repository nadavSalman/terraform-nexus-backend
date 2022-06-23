terraform {
  extra_arguments "init" {
    commands = [
      "init"
    ]    
    arguments = [
      "-input=false"
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
