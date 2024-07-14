#!/usr/bin/env bash

export PYTHONUNBUFFERED=1
source /venv/bin/activate
cd /workspace/LLaVA
nohup python3 -m llava.serve.controller \
  --host ${LLAVA_HOST} \
  --share \
  --port ${LLAVA_CONTROLLER_PORT} > /workspace/logs/controller.log 2>&1 &
deactivate
