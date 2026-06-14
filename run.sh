#!/bin/bash
case "$1" in
    build_generator)
        docker build -t generator-app ./generator
    ;;
    run_generator)
        mkdir -p "$(pwd)/data"
        docker run --rm -v "$(pwd)/data:/data" generator-app
    ;;
    create_local_data)
        mkdir -p "$(pwd)/local_data"
        docker run --rm -v "$(pwd)/local_data:/data" generator-app
    ;;
    build_reporter)
        docker build -t reporter-app ./reporter
    ;;
    run_reporter)
        mkdir -p "$(pwd)/data"
        docker run --rm -v "$(pwd)/data:/data" reporter-app
    ;;
    structure)
        ls -R
    ;;
    clear_data)
        rm -rf "$(pwd)"/data/*.csv "$(pwd)"/data/*.html
    ;;
    inside_generator)
        docker run --rm -v "$(pwd)/data:/data" generator-app ls -ls /data
    ;;
    inside_reporter)
        docker run --rm -v "$(pwd)/data:/data" reporter-app ls -ls /data
    ;;
    *)
        echo "Данная команда отсутствует в списке команд"
    ;;

esac








