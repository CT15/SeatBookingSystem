# SeatSeekr!

A project done within 24 hours during NUS IEEE Hackathon 2018. The topic given was **Smart Campus**. Our project is a seat booking system for educational institutions, such as universities.

## Problems (What We Observe)

* During examination periods, all the study places (e.g. library, common areas, Starbucks) are replete with students revising for their exams. Some students take bus from one place to another within the campus in search for seats to study only to find that there are no more seats for them.

* Many students are hogging seats by placing their belongings (e.g. bags, books, laptops) on their seats even when they leave their seats for a long time (to have lunch, to meet friends, etc.).

## Our Aims

* To ease the process of seat searching during the examination periods, eliminating completely the need to travel in the process of finding out whether seats are available in any particular places within the campus.

* To promote a better "no-seat-hogging" culture within the campus.

## Our Solution

A phone application that allows the user to **check** the availability of seats in all the study areas within the campus and **book** them if they are available.

A tiny sensor (we used infrared attached to Raspberry Pi for our demonstration) is attached to every seat. This can be used to detect whether the seat is currently available / being occupied. This is similar to the parking sensor system. The data from all the sensor is then sent to the cloud (Firebase), which then updates the information in the mobile application in real time, enabling user to see which seats are currently available for booking.

A mechanism has been designed to allow the user to book an available seat (and claim it within a period of time), as well as claim a seat whose "owner" has left for longer than a certain period of time. Take a look at our presentation slide to see the flow chart of this mechanism.

## Presentation Slide

The slides for the final presentation can be found [here](https://docs.google.com/presentation/d/147KEQD0Ob6wXCii5aJwfnshHhW_geBQuOacds_XbPU8/edit?usp=sharing)

## Our Team

[Calvin Tantio](https://github.com/CT15)

[Han Keong](https://github.com/han-keong)

[Li Jiayao](https://github.com/JYL123)

Li Xinyi
