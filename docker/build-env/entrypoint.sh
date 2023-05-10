#!/bin/sh

setup_cache(){
    export CPM_SOURCE_CACHE=${EXT_MOUNT}/cache/cpm
    export CCACHE_DIR=${EXT_MOUNT}/cache/ccache

    maven_cache_dir=${EXT_MOUNT}/cache/m2-repo

    # we copy the settings file each time in case the $HOME folder changes
    mkdir -p $HOME/.m2 || true
    cp $ASSETS_PATH/maven-settings.xml $HOME/.m2/settings.xml
    sed -i 's@MAVEN_CACHE_REPOSITORY@'"${maven_cache_dir}"'@' $HOME/.m2/settings.xml
}

run_init(){
    init_script=${EXT_MOUNT}/scripts/init.sh

    env

    if [ -f "${init_script}" ]; then
        exec ${init_script}
    else
        printf "No ${init_script} available, executing sh\\n"
        #exec /bin/sh
    fi
}

setup_cache
run_init

