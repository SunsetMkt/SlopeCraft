set(SlopeCraft_download_njson OFF)

if (NOT DEFINED SlopeCraft_Nlohmann_json_include_dir)
    if (EXISTS ${CMAKE_SOURCE_DIR}/3rdParty/nlohmann/json.hpp)
        set(SlopeCraft_Nlohmann_json_include_dir ${CMAKE_SOURCE_DIR}/3rdParty/nlohmann)
    else ()
        set(SlopeCraft_download_njson ON)
    endif ()
else ()
    # check if cmake can find the json file
    if (EXISTS ${SlopeCraft_Nlohmann_json_include_dir}/json.hpp)
        # nothing to do
    else ()
        message(WARNING
            "The original value of SlopeCraft_Nlohmann_json_include_dir is invalid: failed to find "
            ${SlopeCraft_Nlohmann_json_include_dir}/json.hpp)
        set(SlopeCraft_download_njson ON)
    endif ()
endif ()

if (${SlopeCraft_download_njson})
    message(STATUS "Downloading nlohmann json...")
    file(DOWNLOAD
        "https://github.com/nlohmann/json/releases/download/v3.11.3/json.hpp"
        ${CMAKE_SOURCE_DIR}/3rdParty/nlohmann/json.hpp
        HASH 9bea4c8066ef4a1c206b2be5a36302f8926f7fdc6087af5d20b417d0cf103ea6
        SHOW_PROGRESS)

    message(STATUS "nlohmann json downloaded")
    set(SlopeCraft_download_njson OFF)
    set(SlopeCraft_Nlohmann_json_include_dir ${CMAKE_SOURCE_DIR}/3rdParty/nlohmann)
endif ()