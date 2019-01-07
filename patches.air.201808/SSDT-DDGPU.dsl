DefinitionBlock("", "SSDT", 2, "hack", "_DDGPU", 0)
{
    // Note: The _OFF path should be customized to correspond to your native ACPI
    // the two paths provided here should be considered examples only
    // it is best to edit the code such that only the single _OFF path that your ACPI
    // uses is included.
    External (_SB.PCI0.RP01.PXSX._OFF, MethodObj)

    Device(RMD1)
    {
        Name(_HID, "RMD10000")
        Method(_INI)
        {
            // disable discrete graphics (Nvidia/Radeon) if it is present
            If (CondRefOf(\_SB.PCI0.RP01.PXSX._OFF)) { \_SB.PCI0.RP01.PXSX._OFF() }
        }
    }
}
