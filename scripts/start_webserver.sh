#!/usr/bin/env bash

export PYTHONUNBUFFERED=1
source /venv/bin/activate
cd /workspace/LLaVA
nohup python -m llava.serve.gradio_web_server \
  --controller http://localhost:${LLAVA_CONTROLLER_PORT} \
  --share \
  --model-list-mode reload > /workspace/logs/webserver.log 2>&1 &
deactivate
