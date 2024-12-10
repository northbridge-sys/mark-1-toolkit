/*
    RAM.lsl
    BIOS RAM Library
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

    Helper functions for the BIOS RAM interface, which allows scripts to store data
    in 8192-character string banks and manipulate them remotely.  This allows a
    limited form of dynamic memory allocation for LSL scripts.
*/

mk1RAM_Info(integer ident)
{
    xiLEP_Send( // request RAM statistics
        "", // prim
        "_fw:ram", // target
        0, // signed
        "", // status
        ident, // ident
        ["info"], // params
        "" // data
        );
}

mk1RAM_Alloc(integer ident)
{
    xiLEP_Send( // request RAM statistics
        "", // prim
        "_fw:ram", // target
        0, // signed
        "", // status
        ident, // ident
        ["alloc"], // params
        "" // data
        );
}

mk1RAM_Free(integer ident, integer bank)
{
    xiLEP_Send( // request RAM statistics
        "", // prim
        "_fw:ram", // target
        0, // signed
        "", // status
        ident, // ident
        ["free"], // params
        (string)bank // data
        );
}
