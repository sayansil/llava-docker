variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "ashleykza"
}

variable "APP" {
    default = "llava"
}

variable "RELEASE" {
    default = "1.4.6"
}

variable "CU_VERSION" {
    default = "118"
}

variable "BASE_IMAGE_REPOSITORY" {
    default = "ashleykza/runpod-base"
}

variable "BASE_IMAGE_VERSION" {
    default = "1.0.2"
}

variable "CUDA_VERSION" {
    default = "11.8.0"
}

variable "TORCH_VERSION" {
    default = "2.1.2"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${USERNAME}/${APP}:${RELEASE}"]
    args = {
        RELEASE = "${RELEASE}"
        BASE_IMAGE = "${BASE_IMAGE_REPOSITORY}:${BASE_IMAGE_VERSION}-cuda${CUDA_VERSION}-torch${TORCH_VERSION}"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"
        TORCH_VERSION = "${TORCH_VERSION}+cu${CU_VERSION}"
        XFORMERS_VERSION = "0.0.23.post1+cu${CU_VERSION}"
        LLAVA_COMMIT = "9d8c19ed26094f31ffb3ef5bb0b4efb9c5713884"
        LLAVA_MODEL = "liuhaotian/llava-v1.6-mistral-7b"
        VENV_PATH = "/workspace/venvs/${APP}"
    }
}
