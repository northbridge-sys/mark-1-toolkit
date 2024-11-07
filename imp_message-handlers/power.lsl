/*
    power.lsl
    Drop-In Power State Management for Mark 1 Software
    Library Snippet
    Mk1 Dev Library
    Revision 0
    Copyright (C) 2024  Northbridge Business Systems
    https://mark1.northbridgesys.com

    ╒══════════════════════════════════════════════════════════════════════════════╕
    │ LICENSE                                                                      │
    └──────────────────────────────────────────────────────────────────────────────┘

    This script is free software: you can redistribute it and/or modify it under the
    terms of the GNU Lesser General Public License as published by the Free Software
    Foundation, either version 3 of the License, or (at your option) any later
    version.

    This script is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
    PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License along
    with this script.  If not, see <https://www.gnu.org/licenses/>.

    ╒══════════════════════════════════════════════════════════════════════════════╕
    │ INSTRUCTIONS                                                                 │
    └──────────────────────────────────────────────────────────────────────────────┘

    TBD
*/

integer power_changed;

if (source == "_object")
{ // mesasge from _object
	if (llList2String(params, 0) == "_object" && llList2String(params, 1) == "power" && status == ":")
	{ // broadcast power state
		integer newpower = (integer)data;
		if (newpower != power)
		{
			xiLog(DEBUG, "Power state changed from " + (string)power + " to " + (string)newpower + ".");
			power = newpower;
			power_changed = 1;
			if (!power) llSetTimerEvent(0.0); // clear local timers, if any
		}
	}
}
