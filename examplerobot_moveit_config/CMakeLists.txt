cmake_minimum_required(VERSION 3.1.3)
project(examplerobot_moveit_config)

find_package(catkin REQUIRED)

catkin_package()

install(DIRECTORY launch DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  PATTERN "setup_assistant.launch" EXCLUDE)
install(DIRECTORY config DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

#add_executable(exmaplerobot_moveit_config src/examplerobot_interface.cpp)
#target_link_libraries(examplerobot_moveit_config ${catkin_LIBRARIES} ${Boost_LIBRARIES})
#install(TARGETS examplerobot_moveit_config DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})