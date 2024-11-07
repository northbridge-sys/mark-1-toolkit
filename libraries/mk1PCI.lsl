/*
    PCI.lsl
    Firmware Peripheral Control Interface Library
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

mk1PCI_Send(
	string device, // target device name
	string target, // target script name
    string status, // ":" (broadcast), "" (request), "err:_" (error response), "ok" (generic success), or any other value (success)
    integer ident,
    list parameters,
    string data
    )
{ // sends an IMP message via PCI
	parameters = ["_pci", device, target] + parameters;
    xiIMP_Send( // sends an IMP message
        "", // prim
        "_fw:pci", // target
        0, // signed
        status,
        ident,
        parameters,
        data
        );
}
