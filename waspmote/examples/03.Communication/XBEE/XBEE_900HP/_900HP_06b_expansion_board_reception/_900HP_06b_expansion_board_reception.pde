/*  
 *  ------   [900HP_06b] - Use of Expansion board     -------- 
 *  
 *  Explanation: This example shows how to receive packets through
 *  the Expansion board (SOCKET1). 
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

#include <WaspXBee900HP.h>

// define variable
uint8_t error;


void setup()
{  
  // init USB port
  USB.ON();
  USB.println(F("Receiving example via Expansion Board"));

  // init XBee 
  xbee900HP.ON( SOCKET1 );
}


void loop()
{ 
  // receive XBee packet
  error = xbee900HP.receivePacketTimeout(10000);
  
  // check answer  
  if( error == 0 ) 
  {
    // Show data stored in '_payload' buffer indicated by '_length'
    USB.print(F("\nData: "));  
    USB.println( xbee900HP._payload, xbee900HP._length);
    
    // Show data stored in '_payload' buffer indicated by '_length'
    USB.print(F("Length: "));  
    USB.println( xbee900HP._length,DEC);
  }
  else
  {
    // Print error message:
    /*
     * '7' : Buffer full. Not enough memory space
     * '6' : Error escaping character within payload bytes
     * '5' : Error escaping character in checksum byte
     * '4' : Checksum is not correct	  
     * '3' : Checksum byte is not available	
     * '2' : Frame Type is not valid
     * '1' : Timeout when receiving answer   
    */
    USB.print(F("Error receiving a packet:"));
    USB.println(error,DEC);     
  }

} 

