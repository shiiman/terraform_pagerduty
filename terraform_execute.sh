#!/bin/sh

_usage() {
    echo "terraform_execute.sh <command> (upgrade)"
    _command
}

_command() {
    echo "command=plan|apply|destroy|graph|..."
}

_command_apply() {
    echo "applyコマンドを実行します"
    echo "planコマンドを実行して確認しましたか [Y/n]"
    read ANSWER
    case $ANSWER in
        "Y" | "y" | "yes" | "Yes" | "YES" )
            ;;

        * )
            exit 1;;
    esac
}

_command_destroy() {
    echo "destroyコマンドを実行しますか [Y/n]"
    read ANSWER
    case $ANSWER in
        "Y" | "y" | "yes" | "Yes" | "YES" )
            ;;

        * )
            exit 1;;
    esac
}

_execute() {
    # stateファイル初期化
    if [[ $UPGRADE == "upgrade" ]]; then
        terraform init -upgrade
    else
        terraform init
    fi

    # 実行
    if [ $COMMAND == "graph" ]; then
        terraform ${COMMAND} | dot -Tpng > "${TASK}-graph.png"
    else
        terraform ${COMMAND}
    fi
}

if [ $# -ne 1 ] && [ $# -ne 2 ]; then
    _usage
    exit 1
fi

if [ $1 == "apply" ]; then
    _command_apply
fi

if [ $1 == "destroy" ]; then
    _command_destroy
fi

COMMAND=$1
UPGRADE=$2

_execute
