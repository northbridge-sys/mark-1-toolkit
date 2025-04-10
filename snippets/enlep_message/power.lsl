if (source_script == "_object" && ~flags & ENLEP_TYPE_REQUEST)
{ // mesasge from _object
	if (llList2String(parameters, 0) == "power")
	{ // broadcast power state
		if ((integer)data != power)
		{
			power = (integer)data;
			if (!power) enTimer_Reset(); // this also clears regular timers
		}
	}
}
