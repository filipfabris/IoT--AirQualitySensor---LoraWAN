/*  
 *  ------   [868LP_12] - set/get the power level     -------- 
 *  
 *  Explanation: This program shows how to set and read the power mode
 *  at which the XBee module transmits at. Parameter Range: 0 - 4(default)
 *
 *  0 = +3 dBm, (2 mW) 
 *	1 = +7 dBm, (5 mW)
 *	2 = +10 dBm, (10 mW)
 *	3 = +12 dBm, (16 mW)
 *	4 = +14 dBm, (25 mW)
 *
 *  REMARKS: Check your country's Restrictions
 *
 *  Copyright (C) 2016 Libelium Comunicaciones Distribuidas S.L. 
 *  http://www.libelium.com 
 *  
 *  This program is free software: you can redistribute it and/or modify 
 *  it under the terms of the GNU General Public License as published by 
 *  the Free Software Foundation, either version 3 of the License, or 
 *  (at your option) any later version. 
 *  
 *  This program is distributed in the hope that it will be useful, 
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 *  GNU General Public License for more details. 
 *  
 *  You should have received a copy of the GNU General Public License 
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>. 
 *  
 *  Version:           3.0 
 *  Design:            David Gascón 
 *  Implementation:    Yuri Carmona
 */
 
 #include <WaspXBee868LP.h>

// Define the power level value
////////////////////////////////////////////////
uint8_t powerValue=4;
////////////////////////////////////////////////


void setup()
{ 
  // Init USB port
  USB.ON();
  USB.println(F("868LP_12 example\n")); 
  USB.println(F("----------------------------------"));
  USB.println(F("\tPOWER LEVEL"));
  USB.println(F("----------------------------------\n"
                "0 = 3 dBm\n"
                "1 = 7 dBm\n"
                "2 = 10 dBm\n"
                "3 = 12 dBm\n"
                "4 = 14 dBm\n"
               "----------------------------------\n"));

  delay(1000);
  
  // init XBee
  xbee868LP.ON();
  
  // get the Power Level
  xbee868LP.getPowerLevel();
  
  USB.print(F("Current Power Level:"));
  USB.println(xbee868LP.powerLevel, DEC);
  USB.println();
  delay(1000);
  
}

void loop()
{     

  // 1. set the Power Level to powerValue
  USB.print(F("Set the Power Level to "));
  USB.println(powerValue, DEC);
  xbee868LP.setPowerLevel(powerValue);
  
    
  // 2. get the Power Level
  USB.print(F("Read the Power Level:"));
  xbee868LP.getPowerLevel();
  USB.println(xbee868LP.powerLevel, DEC);
  USB.println();
  delay(1000);
  
  // 3. write actual value to module
  USB.println(F("Write actual value to module"));
  xbee868LP.writeValues();
  
  USB.println(F("******************************"));
  delay(10000);
  
}
