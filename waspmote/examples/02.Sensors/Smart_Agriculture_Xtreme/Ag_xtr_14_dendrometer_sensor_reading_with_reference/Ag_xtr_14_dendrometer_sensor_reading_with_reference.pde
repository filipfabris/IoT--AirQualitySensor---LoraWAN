/*
    ----------- [Ag_xtr_14] - Dendrometer sensor reading with reference --

    Explanation: Basic example that turns on, reads and turn off the
    sensor. Measured parameters are stored in the corresponding class
    variables and printed by the serial monitor.

    Measured parameters:
      - Trunk diameter
      - Stem diameter
      - Fruit diameter


    Copyright (C) 2018 Libelium Comunicaciones Distribuidas S.L.
    http://www.libelium.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    Version:           3.1
    Design:            David Gascón
    Implementation:    J.Siscart, V.Boria
*/

#include <WaspSensorXtr.h>

/*
  SELECT THE RIGHT SOCKET FOR EACH SENSOR.

  Possible sockets for this sensor are:
  - XTR_SOCKET_C           _________
                          |---------|
                          | A  B  C |
                          |_D__E__F_|


  Example: a 5TM sensor on socket A will be
  [Sensor Class] [Sensor Name] [Selected socket]
  Decagon_5TM    mySensor      (XTR_SOCKET_A);

  Refer to the technical guide for information about possible combinations.
  www.libelium.com/downloads/documentation/smart_agriculture_xtreme_sensor_board.pdf
*/

/*
   Select dendrometer type:
     - DENDRO_DD:  Stem diameter
     - DENDRO_DF:  Fruit diameter
     - DENDRO_DC3: Trunk diameter
*/
//   [Sensor Class] [Sensor Name] [dendrometer type]
dendrometer mySensor(DENDRO_DD);

void setup()
{
  USB.println(F("Dendrometer example with reference"));

  // 1. Turn ON the sensor before setting the reference
  mySensor.ON();

  // 2. Read the dendrometer and set its current value as reference (zero)
  mySensor.setReference();

  // 3. Print information
  USB.print(F("Reference set at: "));
  USB.printFloat(mySensor.dendroRef, 3);
  USB.println(F(" mm"));
  USB.println(F("The following samples will be relatives to this"));

}

void loop()
{
  // 4. Turn ON the sensor
  mySensor.ON();

  // 5. Read the sensor growth
  mySensor.readGrowth();

  // 6. Turn off the sensor
  mySensor.OFF();

  // 7. Print information
  USB.println(F("---------------------------"));
  USB.println(F("Dendrometer"));
  USB.print(F("Diameter growth:"));
  USB.printFloat(mySensor.dendroGrowth, 3);
  USB.println(F(" mm"));
  USB.println(F("---------------------------\n"));

  delay(5000);

}
