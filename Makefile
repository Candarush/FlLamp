# Имя компилятора
CC=g++

# Имя линковщика
LINKER=g++

# Стандарт
STD=c++11

detector: Vector3.o Soltrack.o Sun.o Lamp.o Cloud.o MosqMQTTWrapper.o MQTTFlowerLamp.o main.o 
	$(CC) -I"/usr/local/include" -L"/usr/local/lib" vector3.o soltrack.o sun.o lamp.o cloud.o sun.o mosqmqttwrapper.o mqttflowerlamp.o main.o -o detector -lmosquitto -lmosquittopp 
Vector3.o: Vector3.hpp
	$(LINKER) -std=$(STD) -c Vector3.cpp -o vector3.o
main.o:
	$(LINKER) -std=$(STD) -c main.cpp -o main.o
MQTTFlowerLamp.o: MQTTFlowerLamp.hpp
	$(LINKER) -std=$(STD) -c MQTTFlowerLamp.cpp -o mqttflowerlamp.o 
MosqMQTTWrapper.o: MosqMQTTWrapper.hpp
	$(LINKER) -std=$(STD) -c MosqMQTTWrapper.cpp -o mosqmqttwrapper.o
Lamp.o: Lamp.hpp
	$(LINKER) -std=$(STD) -c Lamp.cpp -o lamp.o
Cloud.o: Cloud.hpp
	$(LINKER) -std=$(STD) -c Cloud.cpp -o cloud.o
Sun.o: Sun.hpp
	$(LINKER) -std=$(STD) -c Sun.cpp -o sun.o
Soltrack.o: SolTrack.h
	$(LINKER) -std=$(STD) -c SolTrack.c -o soltrack.o
