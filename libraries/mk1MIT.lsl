/*
    MIT.lsl
    BIOS Multiple Interval Timer Library
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

    Flags and helper function for the Multiple Interval Timer, an interface that
    responds with an LEP message after a specified time.  This allows scripts to
    effectively run multiple llSetTimerEvent-like timers, albeit with low precision.
*/

#define MK1_MIT_ONESHOT 0
#define MK1_MIT_PERIODIC 1
#define MK1_MIT_CANCEL -1

mk1MIT(integer mode, float time, integer ident, string callback)
{
    xiLEP_Send( // sends an LEP message
        "",
        "_fw:mit",
        0, // signed
        "",
        ident,
        llList2List(["o", "p", "c"], mode, mode) + [time],
        callback
        );
}
