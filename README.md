# Fibaro-Smarthome
My Smarthome project

Documentation of my smarthome. Based on Z-wave, Fibaro HomeCenter 2 HC2 and Lua.

I started this project in March 2016, and "finalized" it in December 2016.

I control all light switches, heating, closing of water, venetian blinds, water alarm, burglary alarm, fire alarm, closing of main door.

The goal has been to implement it in such a way that you don´t have to "do" anything.

Heating, lights, water, blinds, alarms, it is all happening without you thinking about it. At the same time, you can choose to use the old fashion switches for lighting, looking. You tell the house you are going to bed, you are leaving it, you go on vacation, which rooms to keep warm, thats it. The how takes care of heating, alarms, lights, etc.

Total numbers of switches, sensors, etc. is approximately 170.

Functionality:

Lights is controlled based on time of the day, lux, movement, "fake" home when gone, etc,
Burglary alarm with connection to alarm company. Sirens, lightning. Automatically turns on when we go to bed or leave the house
Fire alarm with connection to alarm company. Turn on lights, sirens, open blinds, open doors
Wateralarm with connection to alarm company. Close main water, sirens warning
Panic alarm
Venetian blinds controlled to lux metering inside and outside build in "human factor" delays not to cause a devorse
Heating controlled by thermostat sensors. Cooler at night. Saving mode when out. Really saving when vacation. Controlled by checking someone is moving, watching TV etc. Virtual app to override rooms.
Balancing heating to avoid peeks when everything is on.
Controlling Nobø Orion 512 heating with switches
Door locking by checking if door is firmly shut, looked. Automatic looking at night.
