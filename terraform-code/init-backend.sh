#!/bin/bash

rm -rf .terraform
terragrunt init
terragrunt apply