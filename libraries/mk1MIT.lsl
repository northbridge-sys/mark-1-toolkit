/*
mk1MIT.lsl
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
Basically a remotely accessible enTimer library instance.
*/

// should be 0x0 and 0x1
#define MK1MIT_ONESHOT ENTIMER_ONESHOT
#define MK1MIT_PERIODIC ENTIMER_PERIODIC
#define MK1MIT_START_RETURN_ID 0x10000

// TODO: convert these to macros, if more efficient?

mk1MIT_Start(
    float interval,
    integer flags,
    string callback
)
{
    enLEP_Send( // translate into LEP request
        LINK_ROOT,
        "_fw:mit",
        ENLEP_TYPE_REQUEST,
        ["mit", "start", interval, flags],
        callback
    );
}

mk1MIT_CancelID(
    string id
)
{
    enLEP_Send( // translate into LEP request
        LINK_ROOT,
        "_fw:mit",
        ENLEP_TYPE_REQUEST,
        ["mit", "cancel_id"],
        id
    );
}

mk1MIT_CancelCallback(
    string callback
)
{
    enLEP_Send( // translate into LEP request
        LINK_ROOT,
        "_fw:mit",
        ENLEP_TYPE_REQUEST,
        ["mit", "cancel_callback"],
        callback
    );
}
