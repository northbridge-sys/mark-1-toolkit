/*
    Disp.lsl
    BIOS Display Library
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

    Flags and helper functions for the BIOS disp (display) interface.  The display
    is an interface that renders text and graphics in-world using spritemaps.

    More information on the Mark 1 display is available here:
        https://mark1.northbridgesys.com/en/technical-reference/bios/display

    If MK1_DISP_USE_INFO is defined, these functions will be aware of the size of
    the display, as long as you call mk1Disp_ReqInfo(...) and, when you get an LEP
    response, mk1Disp_LoadInfo(...).  This allows negative-indexed positioning via
    mk1Disp_Op(...) and creates the MK1_DISP_TYPE, MK1_DISP_ROWS, MK1_DISP_COLS, and
    MK1_DISP_MONO globals for software use.
*/

#ifndef MK1_DISP_OP_NOBUFFER
#define MK1_DISP_OP_NOBUFFER 8192
#endif
#ifndef MK1_DISP_OP_HIDE
#define MK1_DISP_OP_HIDE 16384
#endif
#ifndef MK1_DISP_OP_SHIFT_UP
#define MK1_DISP_OP_SHIFT_UP 32768
#endif
#ifndef MK1_DISP_OP_SHIFT_DOWN
#define MK1_DISP_OP_SHIFT_DOWN 65536
#endif
#ifndef MK1_DISP_RESET_BUFFER
#define MK1_DISP_RESET_BUFFER 8192
#endif
#ifndef MK1_DISP_RESET_LAYERS
#define MK1_DISP_RESET_LAYERS 16384
#endif
#ifndef MK1_DISP_RESET_SPRITEMAP
#define MK1_DISP_RESET_SPRITEMAP 32768
#endif
#ifndef MK1_DISP_RESET_PALETTE
#define MK1_DISP_RESET_PALETTE 65536
#endif
#ifndef MK1_DISP_RESET_ALL
#define MK1_DISP_RESET_ALL 122880
#endif

// runtime constants
integer MK1_DISP_TYPE;
integer MK1_DISP_ROWS;
integer MK1_DISP_COLS;
integer MK1_DISP_MONO;

mk1Disp_ReqInfo(integer ident)
{ // requests display info
    xiLEP_Send( // sends an LEP message
        "",
        "_fw:disp",
        0, // signed
        "",
        ident,
        ["info"],
        ""
        );
}
mk1Disp_LoadInfo(string data)
{ // for loading response via "_bios-disp;info;ok" into runtime constants
    list lines = llParseStringKeepNulls(data, ["\n"], []);
    MK1_DISP_TYPE = (integer)llList2String(lines, 0);
    MK1_DISP_ROWS = (integer)llList2String(lines, 1);
    MK1_DISP_COLS = (integer)llList2String(lines, 2);
    MK1_DISP_MONO = (integer)llList2String(lines, 3);
}

mk1Disp_Reset(integer ident, integer flags)
{ // resets the Mark 1 display using D_RESET_* flag(s)
    xiLEP_Send( // sends an LEP message
        "",
        "_fw:disp",
        0, // signed
        "",
        ident,
        ["reset"],
        (string)flags
        );
}

string mk1Disp_Op(integer row, integer col, string mode, integer flags, string param_a, string param_b, string param_c, string param_d)
{ // generates a Mark 1 display operation data string
    integer index = col;
    if (MK1_DISP_COLS)
    { // assume info populated
        // correct for negative indexing
        while (row < 0) row += MK1_DISP_ROWS;
        while (col < 0) col += MK1_DISP_COLS;
        // reassign index based on row, col
        index = row * MK1_DISP_COLS + col;
    }
    string data = llDumpList2String([index + flags, mode, param_a, param_b, param_c, param_d], "\n");
    return data;
}

mk1Disp(integer ident, list ops)
{ // sends multiple ops at once, use mk1Disp_Op(...) to generate each in ops list
    xiLEP_Send( // sends an LEP message
        "",
        "_fw:disp",
        0, // signed
        "",
        ident,
        ["op"],
        llDumpList2String(ops, "\n")
        );
}

mk1Disp_Background(integer ident, integer layer, string data)
{ // sets a background layer
    xiLEP_Send( // sends an LEP message
        "",
        "_fw:disp",
        0, // signed
        "",
        ident,
        ["background", "set", layer],
        data
        );
}

mk1Disp_Foreground(integer ident, integer layer, string data)
{ // sets a foreground layer
    xiLEP_Send( // sends an LEP message
        "",
        "_fw:disp",
        0, // signed
        "",
        ident,
        ["foreground", "set", layer],
        data
        );
}
