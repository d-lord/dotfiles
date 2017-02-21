# Add the Android SDK tools to $PATH
ANDROID_SDK_DIR="${HOME}/Library/Android/sdk"
if [ -d "${ANDROID_SDK_DIR}" ]; then
  PATH="${PATH}:${ANDROID_SDK_DIR}/tools"
  PATH="${PATH}:${ANDROID_SDK_DIR}/platform-tools"
  ANDROID_BUILD_TOOLS_DIR="${ANDROID_SDK_DIR}/build-tools"
  PATH="${PATH}:${ANDROID_BUILD_TOOLS_DIR}/$(ls -1 ${ANDROID_BUILD_TOOLS_DIR} | sort -rn | head -1)"
fi

# Homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# mine
export PATH=$PATH:~/bin

export EDITOR=nvim

# add pyisam library to Python's search path
export PYTHONPATH="${PYTHONPATH}:${HOME}/repos/pyisam"

# jellybeans and reverse
export FZF_DEFAULT_OPTS="--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104 --color info:183,prompt:110,spinner:107,pointer:167,marker:215 --reverse"
