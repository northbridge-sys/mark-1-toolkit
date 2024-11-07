/*
    main.lsl
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

    This file #includes all existing Mk1 dev library scripts. Type the following:
		#include "nbs-mk1-libraries/libraries.lsl"
    into the top of an LSL script with the LSL preprocessor enabled to be able to
    call Mk1 dev library functions.

    Make sure the "Script optimizer" setting is enabled in your preprocessor,
    otherwise the entire contents of the dev library will be added to your script!
*/

#include "nbs-mk1-libraries/libraries/mk1Disp.lsl"
#include "nbs-mk1-libraries/libraries/mk1MIT.lsl"
#include "nbs-mk1-libraries/libraries/mk1PCI.lsl"
#include "nbs-mk1-libraries/libraries/mk1RAM.lsl"
