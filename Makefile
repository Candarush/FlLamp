# Компилятор
CC=g++

# Стандарт
STD=c++11

.PHONY: all

all: detector clear

detector: Vector3.o Soltrack.o Sun.o Lamp.o Cloud.o MosqMQTTWrapper.o MQTTFlowerLamp.o main.o 
	$(CC) -I"/usr/local/include" -L"/usr/local/lib" vector3.o soltrack.o sun.o lamp.o cloud.o sun.o mosqmqttwrapper.o mqttflowerlamp.o main.o -o detector -lmosquitto -lmosquittopp 
Vector3.o: Vector3.hpp
	$(CC) -std=$(STD) -c Vector3.cpp -o vector3.o
main.o:
	$(CC) -std=$(STD) -c main.cpp -o main.o
MQTTFlowerLamp.o: MQTTFlowerLamp.hpp
	$(CC) -std=$(STD) -c MQTTFlowerLamp.cpp -o mqttflowerlamp.o 
MosqMQTTWrapper.o: MosqMQTTWrapper.hpp
	$(CC) -std=$(STD) -c MosqMQTTWrapper.cpp -o mosqmqttwrapper.o
Lamp.o: Lamp.hpp
	$(CC) -std=$(STD) -c Lamp.cpp -o lamp.o
Cloud.o: Cloud.hpp
	$(CC) -std=$(STD) -c Cloud.cpp -o cloud.o
Sun.o: Sun.hpp
	$(CC) -std=$(STD) -c Sun.cpp -o sun.o
Soltrack.o: SolTrack.h
	$(CC) -std=$(STD) -c SolTrack.c -o soltrack.o
clear:
	rm -rf *.o
