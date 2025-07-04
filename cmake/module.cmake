# Copies the required DBC files to the server
# It can be turned off by using cmake argument -DMOD_DALARAN_HEARTHSTONE_UPDATE_DBC=0

option(MOD_DALARAN_HEARTHSTONE_UPDATE_DBC "Replaces Item.dbc and Spell.dbc files during installation" 1)

if(MOD_DALARAN_HEARTHSTONE_UPDATE_DBC)
  file(MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/data/dbc")
  file(GLOB_RECURSE DBC_FILES "${CMAKE_CURRENT_SOURCE_DIR}/modules/mod-dalaran-hearthstone/data/patch/server/*.dbc")

  foreach(DBC_FILE ${DBC_FILES}) 
    get_filename_component(FILE_NAME "${DBC_FILE}" NAME) 
    set(DEST_FILE "${CMAKE_BINARY_DIR}/data/dbc/${FILE_NAME}") 
    set(BACKUP_FILE "${CMAKE_BINARY_DIR}/data/dbc/${FILE_NAME}.backup")

    if(EXISTS "${DEST_FILE}") 
      message(STATUS "[mod-dalaran-hearthstone] Backing up existing ${DEST_FILE} to ${BACKUP_FILE}") 
      file(RENAME "${DEST_FILE}" "${BACKUP_FILE}") 
    endif()

    message(STATUS "[mod-dalaran-hearthstone] Copying ${DBC_FILE} to ${CMAKE_BINARY_DIR}/data/dbc") 
    file(COPY "${DBC_FILE}" DESTINATION "${CMAKE_BINARY_DIR}/data/dbc") 
  endforeach()
else()
  message(STATUS "[mod_dalaran_hearthstone] DBC replacement skipped (MOD_DALARAN_HEARTHSTONE_UPDATE_DBC=0)")
endif()