#!/bin/bash

hugo
rsync -r --progress public/ 128.199.239.70:vikasgorur.in
