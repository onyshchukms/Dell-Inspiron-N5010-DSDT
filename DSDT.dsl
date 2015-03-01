/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20150204-64 [Feb  4 2015]
 * Copyright (c) 2000 - 2015 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of DSDT.aml, Sat Feb 28 14:00:08 2015
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00009900 (39168)
 *     Revision         0x02
 *     Checksum         0xBF
 *     OEM ID           "DELL  "
 *     OEM Table ID     "WN09   "
 *     OEM Revision     0x00005010 (20496)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 2, "DELL  ", "WN09   ", 0x00005010)
{
    Name (PEBS, 0xE0000000)
    Name (PEBL, 0x10000000)
    Name (VTDS, 0xFED90000)
    Name (VTDL, 0x4000)
    Name (TCBR, 0xFED08000)
    Name (TCLT, 0x1000)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (SMIP, 0xB2)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x00100000)
    Name (PM30, 0x0430)
    Name (SMBS, 0x1180)
    Name (SMBL, 0x20)
    Name (HPTC, 0xFED1F404)
    Name (GPBS, 0x0500)
    Name (GPLN, 0x80)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (P0HP, Zero)
    Name (P1HP, Zero)
    Name (P3HP, Zero)
    Name (P4HP, One)
    Name (P5HP, Zero)
    Name (P6HP, Zero)
    Name (P7HP, Zero)
    Name (PEPM, Zero)

    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        DBG8 = 0xAA

        PICM = Arg0
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        OSVR = 0x04
        Return (OSVR) /* \OSVR */
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Index (PRWP, Zero) = Arg0
        Local0 = (SS1 << One)
        Local0 |= (SS2 << 0x02)
        Local0 |= (SS3 << 0x03)
        Local0 |= (SS4 << 0x04)
        If (((One << Arg1) & Local0))
        {
            Index (PRWP, One) = Arg1
        }
        Else
        {
            Local0 >>= One
            If (((OSFL () == One) || (OSFL () == 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, One)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (MG1B, 0x00000000)
    Name (MG1L, 0x00000000)
    Name (MG2B, 0xC0000000)
    Name (MG2L, 0x40000000)
    OperationRegion (GNVS, SystemMemory, 0xBF622E18, 0x0172)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
        THOF,   8, 
        ACT1,   8, 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        Offset (0x25), 
        REVN,   8, 
        Offset (0x28), 
        APIC,   8, 
        TCNT,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        Offset (0x32), 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        CMCP,   8, 
        CIRP,   8, 
        SMSC,   8, 
        W381,   8, 
        SMC1,   8, 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        KSV0,   32, 
        KSV1,   8, 
        Offset (0x67), 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
        Offset (0x6E), 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
        Offset (0x74), 
        MEFE,   8, 
        DSTS,   8, 
        Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
        PPRP,   32, 
        PPRQ,   8, 
        LPPR,   8, 
        Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
        Offset (0xAA), 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IPCF,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        PAVP,   8, 
        Offset (0xE1), 
        OSCC,   8, 
        NEXP,   8, 
        SDGV,   8, 
        SDDV,   8, 
        Offset (0xEB), 
        DSEN,   8, 
        ECON,   8, 
        GPIC,   8, 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8, 
        Offset (0x100), 
        NVGA,   32, 
        NVHA,   32, 
        AMDA,   32, 
        DID6,   32, 
        DID7,   32, 
        DID8,   32, 
        EBAS,   32, 
        CPSP,   32, 
        EECP,   32, 
        EVCP,   32, 
        XBAS,   32, 
        OBS1,   32, 
        OBS2,   32, 
        OBS3,   32, 
        OBS4,   32, 
        OBS5,   32, 
        OBS6,   32, 
        OBS7,   32, 
        OBS8,   32, 
        Offset (0x157), 
        ATMC,   8, 
        PTMC,   8, 
        ATRA,   8, 
        PTRA,   8, 
        PNHM,   32, 
        TBAB,   32, 
        TBAH,   32, 
        RTIP,   8, 
        TSOD,   8, 
        ATPC,   8, 
        PTPC,   8, 
        PFLV,   8, 
        BREV,   8, 
        DPBM,   8, 
        DPCM,   8, 
        DPDM,   8, 
        ALFP,   8, 
        IMON,   8
    }

    OperationRegion (EXBU, SystemMemory, 0xBF62F018, 0x1011)
    Field (EXBU, AnyAcc, Lock, Preserve)
    {
        ECMD,   8, 
        WCMD,   32, 
        WDID,   32, 
        WBUF,   32768, 
        GPUF,   8, 
        SMIB,   8, 
        THML,   8, 
        S3FL,   8, 
        BUF1,   16, 
        BUF2,   16
    }

    Scope (_SB)
    {
        Name (AR00, Package (0x29)
        {
            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }
        })
        Name (AR20, Package (0x10)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x17
            }
        })
        Name (AR11, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (AR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (AR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (AR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (AR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (AR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (AR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (AR18, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                Return (AR00) /* \_SB_.AR00 */
            }

            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                If (((OSFL () == One) || (OSFL () == 0x02)))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Device (MCEH)
            {
                Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Name (MCHR, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFED14000,         // Address Base
                        0x00006000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x1FE00000,         // Address Length
                        _Y00)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y01)
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00010000,         // Address Length
                        )
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (MCHR, \_SB.PCI0.MCEH._Y00._BAS, PCIB)  // _BAS: Base Address
                    CreateDWordField (MCHR, \_SB.PCI0.MCEH._Y00._LEN, PCIL)  // _LEN: Length
                    PCIB = PEBS /* \PEBS */
                    PCIL = PEBL /* \PEBL */
                    CreateDWordField (MCHR, \_SB.PCI0.MCEH._Y01._BAS, VTCB)  // _BAS: Base Address
                    CreateDWordField (MCHR, \_SB.PCI0.MCEH._Y01._LEN, VTCL)  // _LEN: Length
                    VTCB = VTDS /* \VTDS */
                    VTCL = VTDL /* \VTDL */
                    Return (MCHR) /* \_SB_.PCI0.MCH_.MCHR */
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Device (PEGP)
                {
                    Name (_ADR, 0xFFFF)  // _ADR: Address
                }
            }

            Device (P0P2)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Device (PEGP)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (P0P3)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (P0P4)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (P0P5)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Method (SPTS, 1, NotSerialized)
                {
                    PS1S = One
                    PS1E = One
                    SLPS = One
                }

                OperationRegion (APMP, SystemIO, SMIP, 0x02)
                Field (APMP, ByteAcc, NoLock, Preserve)
                {
                    APMC,   8, 
                    APMS,   8
                }

                Field (APMP, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x01), 
                        ,   1, 
                    BRTC,   1
                }

                OperationRegion (SMIE, SystemIO, PM30, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    PS1E,   1, 
                        ,   31, 
                    PS1S,   1, 
                    Offset (0x08)
                }

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                    OperationRegion (PMS0, SystemIO, PMBS, 0x04)
                    Field (PMS0, ByteAcc, NoLock, Preserve)
                    {
                            ,   10, 
                        RTCS,   1, 
                            ,   3, 
                        PEXS,   1, 
                        WAKS,   1, 
                        Offset (0x03), 
                        PWBT,   1, 
                        Offset (0x04)
                    }

                    Device (SLPB)
                    {
                        Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If ((SUSW != 0xFF))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                        {
                            If ((SUSW != 0xFF))
                            {
                                Return (Package (0x02)
                                {
                                    SUSW, 
                                    0x04
                                })
                            }
                            Else
                            {
                                Return (Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                            }
                        }
                    }
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Device (PCH)
                        {
                            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                            Name (_UID, 0x01C7)  // _UID: Unique ID
                            Name (_STA, 0x0F)  // _STA: Status
                            Name (ICHR, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y02)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y03)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y04)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y06)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y05)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y07)
                                Memory32Fixed (ReadWrite,
                                    0xFF000000,         // Address Base
                                    0x01000000,         // Address Length
                                    )
                            })
                            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                            {
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y02._MIN, PBB)  // _MIN: Minimum Base Address
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y02._MAX, PBH)  // _MAX: Maximum Base Address
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y02._LEN, PML)  // _LEN: Length
                                PBB = PMBS /* \PMBS */
                                PBH = PMBS /* \PMBS */
                                PML = PMLN /* \PMLN */
                                If (SMBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y03._MIN, SMB)  // _MIN: Minimum Base Address
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y03._MAX, SMH)  // _MAX: Maximum Base Address
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y03._LEN, SML)  // _LEN: Length
                                    SMB = SMBS /* \SMBS */
                                    SMH = SMBS /* \SMBS */
                                    SML = SMBL /* \SMBL */
                                }

                                If (GPBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y04._MIN, IGB)  // _MIN: Minimum Base Address
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y04._MAX, IGH)  // _MAX: Maximum Base Address
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y04._LEN, IGL)  // _LEN: Length
                                    IGB = GPBS /* \GPBS */
                                    IGH = GPBS /* \GPBS */
                                    IGL = GPLN /* \GPLN */
                                }

                                If (APCB)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y05._BAS, APB)  // _BAS: Base Address
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y05._LEN, APL)  // _LEN: Length
                                    APB = APCB /* \APCB */
                                    APL = APCL /* \APCL */
                                }

                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y06._BAS, RCB)  // _BAS: Base Address
                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y06._LEN, RCL)  // _LEN: Length
                                RCB = SRCB /* \SRCB */
                                RCL = SRCL /* \SRCL */
                                If (TCBR)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y07._BAS, TCB)  // _BAS: Base Address
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y07._LEN, TCL)  // _LEN: Length
                                    TCB = TCBR /* \TCBR */
                                    TCL = TCLT /* \TCLT */
                                }

                                Return (ICHR) /* \_SB_.PCI0.PCH_.ICHR */
                            }
                        }
                    }
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFE800000,         // Address Base
                            0x00000200,         // Address Length
                            )
                    })
                    OperationRegion (MBOX, SystemMemory, 0xFE800000, 0x0200)
                    Field (MBOX, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x01), 
                        ENTF,   8
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (CRS) /* \_SB_.PCI0.LPCB.RMSC.CRS_ */
                    }
                }
                
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x04)
                    {
                        "name", 
                        "pci8086,3b09", 
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x09, 0x3B, 0x00, 0x00                           /* .;.. */
                        }
                    })
                }
            }

            Device (BR20)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR20) /* \_SB_.AR20 */
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Name (\FZTF, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5         /* ....... */
                })
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If ((Arg0 == 0x02))
                    {
                        REGF = Arg1
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14) {})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (PRT0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (PSCR << One)
                        Local0 = (PMCR | Local1)
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local1 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local2 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local0 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local1 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local1 |= Local3
                        GMPT = PMRI /* \_SB_.PCI0.SAT0.PMRI */
                        GMUE = Local0
                        GMUT = PMUT /* \_SB_.PCI0.SAT0.PMUT */
                        GMCR = PMCR /* \_SB_.PCI0.SAT0.PMCR */
                        GSPT = PSRI /* \_SB_.PCI0.SAT0.PSRI */
                        GSUE = Local1
                        GSUT = PSUT /* \_SB_.PCI0.SAT0.PSUT */
                        GSCR = PSCR /* \_SB_.PCI0.SAT0.PSCR */
                        STM ()
                        PMRI = GMPT /* \_SB_.PCI0.SAT0.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT0.GMUE */
                        PMUT = GMUT /* \_SB_.PCI0.SAT0.GMUT */
                        PMCR = GMCR /* \_SB_.PCI0.SAT0.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT0.GSUE */
                        PSUT = GSUT /* \_SB_.PCI0.SAT0.GSUT */
                        PSCR = GSCR /* \_SB_.PCI0.SAT0.GSCR */
                        If ((Local0 & One))
                        {
                            PM3E = One
                        }
                        Else
                        {
                            PM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            PM6E = One
                        }
                        Else
                        {
                            PM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            PMAE = One
                        }
                        Else
                        {
                            PMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            PS3E = One
                        }
                        Else
                        {
                            PS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            PS6E = One
                        }
                        Else
                        {
                            PS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            PSAE = One
                        }
                        Else
                        {
                            PSAE = Zero
                        }

                        ATA0 = GTF (Zero, Arg1)
                        ATA1 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (SSCR << One)
                        Local0 = (SMCR | Local1)
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local1 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local2 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local0 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local1 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local1 |= Local3
                        GMPT = SMRI /* \_SB_.PCI0.SAT0.SMRI */
                        GMUE = Local0
                        GMUT = SMUT /* \_SB_.PCI0.SAT0.SMUT */
                        GMCR = SMCR /* \_SB_.PCI0.SAT0.SMCR */
                        GSPT = SSRI /* \_SB_.PCI0.SAT0.SSRI */
                        GSUE = Local1
                        GSUT = SSUT /* \_SB_.PCI0.SAT0.SSUT */
                        GSCR = SSCR /* \_SB_.PCI0.SAT0.SSCR */
                        STM ()
                        SMRI = GMPT /* \_SB_.PCI0.SAT0.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT0.GMUE */
                        SMUT = GMUT /* \_SB_.PCI0.SAT0.GMUT */
                        SMCR = GMCR /* \_SB_.PCI0.SAT0.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT0.GSUE */
                        SSUT = GSUT /* \_SB_.PCI0.SAT0.GSUT */
                        SSCR = GSCR /* \_SB_.PCI0.SAT0.GSCR */
                        If ((Local0 & One))
                        {
                            SM3E = One
                        }
                        Else
                        {
                            SM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            SM6E = One
                        }
                        Else
                        {
                            SM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            SMAE = One
                        }
                        Else
                        {
                            SMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            SS3E = One
                        }
                        Else
                        {
                            SS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            SS6E = One
                        }
                        Else
                        {
                            SS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            SSAE = One
                        }
                        Else
                        {
                            SSAE = Zero
                        }

                        ATA2 = GTF (Zero, Arg1)
                        ATA3 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    PIO0 = Ones
                    PIO1 = Ones
                    DMA0 = Ones
                    DMA1 = Ones
                    CHNF = 0x10
                    If (REGF) {}
                    Else
                    {
                        Return (TMD0) /* \_SB_.PCI0.SAT0.TMD0 */
                    }

                    If ((Arg1 & 0x20))
                    {
                        CHNF |= 0x02
                    }

                    Local6 = Match (DerefOf (Index (TIM0, One)), MEQ, Arg0, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6))
                    DMA0 = Local7
                    PIO0 = Local7
                    If ((Arg4 & 0x20))
                    {
                        CHNF |= 0x08
                    }

                    Local6 = Match (DerefOf (Index (TIM0, 0x02)), MEQ, Arg3, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6))
                    DMA1 = Local7
                    PIO1 = Local7
                    If ((Arg1 & 0x07))
                    {
                        Local5 = Arg2
                        If ((Arg1 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg1 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA0 = DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5))
                        CHNF |= One
                    }

                    If ((Arg4 & 0x07))
                    {
                        Local5 = Arg5
                        If ((Arg4 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg4 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA1 = DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5))
                        CHNF |= 0x04
                    }

                    Debug = TMD0 /* \_SB_.PCI0.SAT0.TMD0 */
                    Return (TMD0) /* \_SB_.PCI0.SAT0.TMD0 */
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        GMUE = Zero
                        GMUT = Zero
                        GSUE = Zero
                        GSUT = Zero
                        If ((CHNF & One))
                        {
                            Local0 = Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GMUT = DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0))
                            GMUE |= One
                            If ((Local0 > 0x02))
                            {
                                GMUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GMUE &= 0xFD
                                GMUE |= 0x04
                            }
                        }
                        Else
                        {
                            If (((PIO0 == Ones) | (PIO0 == Zero)))
                            {
                                If (((DMA0 < Ones) & (DMA0 > Zero)))
                                {
                                    PIO0 = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                                    GMUE |= 0x80
                                }
                            }
                        }

                        If ((CHNF & 0x04))
                        {
                            Local0 = Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA1, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GSUT = DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0))
                            GSUE |= One
                            If ((Local0 > 0x02))
                            {
                                GSUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GSUE &= 0xFD
                                GSUE |= 0x04
                            }
                        }
                        Else
                        {
                            If (((PIO1 == Ones) | (PIO1 == Zero)))
                            {
                                If (((DMA1 < Ones) & (DMA1 > Zero)))
                                {
                                    PIO1 = DMA1 /* \_SB_.PCI0.SAT0.DMA1 */
                                    GSUE |= 0x80
                                }
                            }
                        }

                        If ((CHNF & 0x02))
                        {
                            GMUE |= 0x20
                        }

                        If ((CHNF & 0x08))
                        {
                            GSUE |= 0x20
                        }

                        Local0 = (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO0, MTR, Zero, 
                            Zero) & 0x07)
                        Local1 = DerefOf (Index (DerefOf (Index (TIM0, One)), Local0))
                        GMPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GMUE |= 0x50
                        }

                        Local0 = (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO1, MTR, Zero, 
                            Zero) & 0x07)
                        Local1 = DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0))
                        GSPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GSUE |= 0x50
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF         /* ....... */
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6         /* ....... */
                })
                Name (ATA0, Buffer (0x1D) {})
                Name (ATA1, Buffer (0x1D) {})
                Name (ATA2, Buffer (0x1D) {})
                Name (ATA3, Buffer (0x1D) {})
                Name (ATAB, Buffer (0x1D) {})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Local0 = (CMDC * 0x38)
                    Local1 = (Local0 + 0x08)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Local0 = (CMDC * 0x07)
                    CreateByteField (ATAB, (Local0 + 0x02), A001)
                    CreateByteField (ATAB, (Local0 + 0x06), A005)
                    CMDX = Arg0
                    A001 = Arg1
                    A005 = Arg2
                    CMDC++
                }

                Method (GTF, 2, Serialized)
                {
                    Debug = Arg1
                    CMDC = Zero
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If ((SizeOf (Arg1) == 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        ID49 = IW49 /* \_SB_.PCI0.SAT0.GTF_.IW49 */
                        CreateWordField (Arg1, 0x6A, IW53)
                        ID53 = IW53 /* \_SB_.PCI0.SAT0.GTF_.IW53 */
                        CreateWordField (Arg1, 0x7E, IW63)
                        ID63 = IW63 /* \_SB_.PCI0.SAT0.GTF_.IW63 */
                        CreateWordField (Arg1, 0x76, IW59)
                        ID59 = IW59 /* \_SB_.PCI0.SAT0.GTF_.IW59 */
                        CreateWordField (Arg1, 0xB0, IW88)
                        ID88 = IW88 /* \_SB_.PCI0.SAT0.GTF_.IW88 */
                    }

                    Local7 = 0xA0
                    If (Arg0)
                    {
                        Local7 = 0xB0
                        IRDY = (CHNF & 0x08)
                        If ((CHNF & 0x10))
                        {
                            PIOT = PIO1 /* \_SB_.PCI0.SAT0.PIO1 */
                        }
                        Else
                        {
                            PIOT = PIO0 /* \_SB_.PCI0.SAT0.PIO0 */
                        }

                        If ((CHNF & 0x04))
                        {
                            If ((CHNF & 0x10))
                            {
                                DMAT = DMA1 /* \_SB_.PCI0.SAT0.DMA1 */
                            }
                            Else
                            {
                                DMAT = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                            }
                        }
                    }
                    Else
                    {
                        IRDY = (CHNF & 0x02)
                        PIOT = PIO0 /* \_SB_.PCI0.SAT0.PIO0 */
                        If ((CHNF & One))
                        {
                            DMAT = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                        }
                    }

                    If ((((ID53 & 0x04) && (ID88 & 0xFF00)) && DMAT))
                    {
                        Local1 = Match (DerefOf (Index (TIM0, 0x03)), MLE, DMAT, MTR, Zero, 
                            Zero)
                        If ((Local1 > 0x05))
                        {
                            Local1 = 0x05
                        }

                        GTFB (AT01, (0x40 | Local1), Local7)
                    }
                    Else
                    {
                        If (((ID63 & 0xFF00) && PIOT))
                        {
                            Local0 = (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, Zero, 
                                Zero) & 0x03)
                            Local1 = (0x20 | DerefOf (Index (DerefOf (Index (TIM0, 0x07)), Local0)))
                            GTFB (AT01, Local1, Local7)
                        }
                    }

                    If (IRDY)
                    {
                        Local0 = (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x07)
                        Local1 = (0x08 | DerefOf (Index (DerefOf (Index (TIM0, 0x06)), Local0)))
                        GTFB (AT01, Local1, Local7)
                    }
                    Else
                    {
                        If ((ID49 & 0x0400))
                        {
                            GTFB (AT01, One, Local7)
                        }
                    }

                    If (((ID59 & 0x0100) && (ID59 & 0xFF)))
                    {
                        GTFB (AT03, (ID59 & 0xFF), Local7)
                    }

                    Debug = ATAB /* \_SB_.PCI0.SAT0.ATAB */
                    Return (ATAB) /* \_SB_.PCI0.SAT0.ATAB */
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Local0 = (CMDN * 0x38)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Debug = RETB /* \_SB_.PCI0.SAT0.RATA.RETB */
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If ((Arg0 == 0x02))
                    {
                        REGF = Arg1
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14) {})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (PRT0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (PSCR << One)
                        Local0 = (PMCR | Local1)
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local1 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local2 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local0 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local1 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local1 |= Local3
                        GMPT = PMRI /* \_SB_.PCI0.SAT1.PMRI */
                        GMUE = Local0
                        GMUT = PMUT /* \_SB_.PCI0.SAT1.PMUT */
                        GMCR = PMCR /* \_SB_.PCI0.SAT1.PMCR */
                        GSPT = PSRI /* \_SB_.PCI0.SAT1.PSRI */
                        GSUE = Local1
                        GSUT = PSUT /* \_SB_.PCI0.SAT1.PSUT */
                        GSCR = PSCR /* \_SB_.PCI0.SAT1.PSCR */
                        STM ()
                        PMRI = GMPT /* \_SB_.PCI0.SAT1.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT1.GMUE */
                        PMUT = GMUT /* \_SB_.PCI0.SAT1.GMUT */
                        PMCR = GMCR /* \_SB_.PCI0.SAT1.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT1.GSUE */
                        PSUT = GSUT /* \_SB_.PCI0.SAT1.GSUT */
                        PSCR = GSCR /* \_SB_.PCI0.SAT1.GSCR */
                        If ((Local0 & One))
                        {
                            PM3E = One
                        }
                        Else
                        {
                            PM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            PM6E = One
                        }
                        Else
                        {
                            PM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            PMAE = One
                        }
                        Else
                        {
                            PMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            PS3E = One
                        }
                        Else
                        {
                            PS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            PS6E = One
                        }
                        Else
                        {
                            PS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            PSAE = One
                        }
                        Else
                        {
                            PSAE = Zero
                        }

                        ATA0 = GTF (Zero, Arg1)
                        ATA1 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (SSCR << One)
                        Local0 = (SMCR | Local1)
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local1 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local2 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local0 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local1 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local1 |= Local3
                        GMPT = SMRI /* \_SB_.PCI0.SAT1.SMRI */
                        GMUE = Local0
                        GMUT = SMUT /* \_SB_.PCI0.SAT1.SMUT */
                        GMCR = SMCR /* \_SB_.PCI0.SAT1.SMCR */
                        GSPT = SSRI /* \_SB_.PCI0.SAT1.SSRI */
                        GSUE = Local1
                        GSUT = SSUT /* \_SB_.PCI0.SAT1.SSUT */
                        GSCR = SSCR /* \_SB_.PCI0.SAT1.SSCR */
                        STM ()
                        SMRI = GMPT /* \_SB_.PCI0.SAT1.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT1.GMUE */
                        SMUT = GMUT /* \_SB_.PCI0.SAT1.GMUT */
                        SMCR = GMCR /* \_SB_.PCI0.SAT1.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT1.GSUE */
                        SSUT = GSUT /* \_SB_.PCI0.SAT1.GSUT */
                        SSCR = GSCR /* \_SB_.PCI0.SAT1.GSCR */
                        If ((Local0 & One))
                        {
                            SM3E = One
                        }
                        Else
                        {
                            SM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            SM6E = One
                        }
                        Else
                        {
                            SM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            SMAE = One
                        }
                        Else
                        {
                            SMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            SS3E = One
                        }
                        Else
                        {
                            SS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            SS6E = One
                        }
                        Else
                        {
                            SS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            SSAE = One
                        }
                        Else
                        {
                            SSAE = Zero
                        }

                        ATA2 = GTF (Zero, Arg1)
                        ATA3 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    PIO0 = Ones
                    PIO1 = Ones
                    DMA0 = Ones
                    DMA1 = Ones
                    CHNF = 0x10
                    If (REGF) {}
                    Else
                    {
                        Return (TMD0) /* \_SB_.PCI0.SAT1.TMD0 */
                    }

                    If ((Arg1 & 0x20))
                    {
                        CHNF |= 0x02
                    }

                    Local6 = Match (DerefOf (Index (TIM0, One)), MEQ, Arg0, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6))
                    DMA0 = Local7
                    PIO0 = Local7
                    If ((Arg4 & 0x20))
                    {
                        CHNF |= 0x08
                    }

                    Local6 = Match (DerefOf (Index (TIM0, 0x02)), MEQ, Arg3, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6))
                    DMA1 = Local7
                    PIO1 = Local7
                    If ((Arg1 & 0x07))
                    {
                        Local5 = Arg2
                        If ((Arg1 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg1 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA0 = DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5))
                        CHNF |= One
                    }

                    If ((Arg4 & 0x07))
                    {
                        Local5 = Arg5
                        If ((Arg4 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg4 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA1 = DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5))
                        CHNF |= 0x04
                    }

                    Debug = TMD0 /* \_SB_.PCI0.SAT1.TMD0 */
                    Return (TMD0) /* \_SB_.PCI0.SAT1.TMD0 */
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        GMUE = Zero
                        GMUT = Zero
                        GSUE = Zero
                        GSUT = Zero
                        If ((CHNF & One))
                        {
                            Local0 = Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GMUT = DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0))
                            GMUE |= One
                            If ((Local0 > 0x02))
                            {
                                GMUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GMUE &= 0xFD
                                GMUE |= 0x04
                            }
                        }
                        Else
                        {
                            If (((PIO0 == Ones) | (PIO0 == Zero)))
                            {
                                If (((DMA0 < Ones) & (DMA0 > Zero)))
                                {
                                    PIO0 = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                                    GMUE |= 0x80
                                }
                            }
                        }

                        If ((CHNF & 0x04))
                        {
                            Local0 = Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA1, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GSUT = DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0))
                            GSUE |= One
                            If ((Local0 > 0x02))
                            {
                                GSUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GSUE &= 0xFD
                                GSUE |= 0x04
                            }
                        }
                        Else
                        {
                            If (((PIO1 == Ones) | (PIO1 == Zero)))
                            {
                                If (((DMA1 < Ones) & (DMA1 > Zero)))
                                {
                                    PIO1 = DMA1 /* \_SB_.PCI0.SAT1.DMA1 */
                                    GSUE |= 0x80
                                }
                            }
                        }

                        If ((CHNF & 0x02))
                        {
                            GMUE |= 0x20
                        }

                        If ((CHNF & 0x08))
                        {
                            GSUE |= 0x20
                        }

                        Local0 = (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO0, MTR, Zero, 
                            Zero) & 0x07)
                        Local1 = DerefOf (Index (DerefOf (Index (TIM0, One)), Local0))
                        GMPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GMUE |= 0x50
                        }

                        Local0 = (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO1, MTR, Zero, 
                            Zero) & 0x07)
                        Local1 = DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0))
                        GSPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GSUE |= 0x50
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF         /* ....... */
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6         /* ....... */
                })
                Name (ATA0, Buffer (0x1D) {})
                Name (ATA1, Buffer (0x1D) {})
                Name (ATA2, Buffer (0x1D) {})
                Name (ATA3, Buffer (0x1D) {})
                Name (ATAB, Buffer (0x1D) {})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Local0 = (CMDC * 0x38)
                    Local1 = (Local0 + 0x08)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Local0 = (CMDC * 0x07)
                    CreateByteField (ATAB, (Local0 + 0x02), A001)
                    CreateByteField (ATAB, (Local0 + 0x06), A005)
                    CMDX = Arg0
                    A001 = Arg1
                    A005 = Arg2
                    CMDC++
                }

                Method (GTF, 2, Serialized)
                {
                    Debug = Arg1
                    CMDC = Zero
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If ((SizeOf (Arg1) == 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        ID49 = IW49 /* \_SB_.PCI0.SAT1.GTF_.IW49 */
                        CreateWordField (Arg1, 0x6A, IW53)
                        ID53 = IW53 /* \_SB_.PCI0.SAT1.GTF_.IW53 */
                        CreateWordField (Arg1, 0x7E, IW63)
                        ID63 = IW63 /* \_SB_.PCI0.SAT1.GTF_.IW63 */
                        CreateWordField (Arg1, 0x76, IW59)
                        ID59 = IW59 /* \_SB_.PCI0.SAT1.GTF_.IW59 */
                        CreateWordField (Arg1, 0xB0, IW88)
                        ID88 = IW88 /* \_SB_.PCI0.SAT1.GTF_.IW88 */
                    }

                    Local7 = 0xA0
                    If (Arg0)
                    {
                        Local7 = 0xB0
                        IRDY = (CHNF & 0x08)
                        If ((CHNF & 0x10))
                        {
                            PIOT = PIO1 /* \_SB_.PCI0.SAT1.PIO1 */
                        }
                        Else
                        {
                            PIOT = PIO0 /* \_SB_.PCI0.SAT1.PIO0 */
                        }

                        If ((CHNF & 0x04))
                        {
                            If ((CHNF & 0x10))
                            {
                                DMAT = DMA1 /* \_SB_.PCI0.SAT1.DMA1 */
                            }
                            Else
                            {
                                DMAT = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                            }
                        }
                    }
                    Else
                    {
                        IRDY = (CHNF & 0x02)
                        PIOT = PIO0 /* \_SB_.PCI0.SAT1.PIO0 */
                        If ((CHNF & One))
                        {
                            DMAT = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                        }
                    }

                    If ((((ID53 & 0x04) && (ID88 & 0xFF00)) && DMAT))
                    {
                        Local1 = Match (DerefOf (Index (TIM0, 0x03)), MLE, DMAT, MTR, Zero, 
                            Zero)
                        If ((Local1 > 0x05))
                        {
                            Local1 = 0x05
                        }

                        GTFB (AT01, (0x40 | Local1), Local7)
                    }
                    Else
                    {
                        If (((ID63 & 0xFF00) && PIOT))
                        {
                            Local0 = (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, Zero, 
                                Zero) & 0x03)
                            Local1 = (0x20 | DerefOf (Index (DerefOf (Index (TIM0, 0x07)), Local0)))
                            GTFB (AT01, Local1, Local7)
                        }
                    }

                    If (IRDY)
                    {
                        Local0 = (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x07)
                        Local1 = (0x08 | DerefOf (Index (DerefOf (Index (TIM0, 0x06)), Local0)))
                        GTFB (AT01, Local1, Local7)
                    }
                    Else
                    {
                        If ((ID49 & 0x0400))
                        {
                            GTFB (AT01, One, Local7)
                        }
                    }

                    If (((ID59 & 0x0100) && (ID59 & 0xFF)))
                    {
                        GTFB (AT03, (ID59 & 0xFF), Local7)
                    }

                    Debug = ATAB /* \_SB_.PCI0.SAT1.ATAB */
                    Return (ATAB) /* \_SB_.PCI0.SAT1.ATAB */
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Local0 = (CMDN * 0x38)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Debug = RETB /* \_SB_.PCI0.SAT1.RATA.RETB */
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
                Field (SMBP, DWordAcc, NoLock, Preserve)
                {
                        ,   2, 
                    I2CE,   1
                }

                OperationRegion (SMPB, PCI_Config, 0x20, 0x04)
                Field (SMPB, DWordAcc, NoLock, Preserve)
                {
                        ,   5, 
                    SBAR,   11
                }

                OperationRegion (SMBI, SystemIO, (SBAR << 0x05), 0x10)
                Field (SMBI, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                    Offset (0x02), 
                    HCON,   8, 
                    HCOM,   8, 
                    TXSA,   8, 
                    DAT0,   8, 
                    DAT1,   8, 
                    HBDR,   8, 
                    PECR,   8, 
                    RXSA,   8, 
                    SDAT,   16
                }

                Scope (\_GPE)
                {
                    Method (_L07, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        \_SB.PCI0.SMB.HSTS = 0x20
                    }

                    Method (_L1B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        \_SB.PCI0.SMB.HSTS = 0x20
                    }
                }
                
                Device (BUS0)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (DVL0)
                    {
                        Name (_ADR, 0x57)  // _ADR: Address
                        Name (_CID, "diagsvault")  // _CID: Compatible ID
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            If ((Arg2 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             /* . */
                                })
                            }

                            Return (Package (0x02)
                            {
                                "address", 
                                0x57
                            })
                        }
                    }
                }
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR11) /* \_SB_.AR11 */
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR12) /* \_SB_.AR12 */
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR13) /* \_SB_.AR13 */
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR14) /* \_SB_.AR14 */
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR15) /* \_SB_.AR15 */
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR16) /* \_SB_.AR16 */
                }
            }

            Device (PEX6)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR17) /* \_SB_.AR17 */
                }
            }

            Device (PEX7)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR18) /* \_SB_.AR18 */
                }
            }

            Device (GBE)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0P1, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P2, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P3, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P4, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P5, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX0, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX5, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX6, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX7, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.BR20, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.GBE, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }
        }
        
        Device (PNLF)
        {
            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
            Name (_CID, "backlight")  // _CID: Compatible ID
            Name (_UID, 0x0A)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    OperationRegion (_SB.PCI0.LPCB.PIX0, PCI_Config, 0x60, 0x0C)
    Field (\_SB.PCI0.LPCB.PIX0, ByteAcc, NoLock, Preserve)
    {
        PIRA,   8, 
        PIRB,   8, 
        PIRC,   8, 
        PIRD,   8, 
        Offset (0x08), 
        PIRE,   8, 
        PIRF,   8, 
        PIRG,   8, 
        PIRH,   8
    }

    Name (MISC, Buffer (0x07)
    {
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00         /* ....... */
    })
    CreateByteField (MISC, Zero, MIS0)
    CreateByteField (MISC, One, MIS1)
    CreateByteField (MISC, 0x03, MIS3)
    Scope (_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
        Processor (CPU2, 0x03, 0x00000410, 0x06) {}
        Processor (CPU3, 0x04, 0x00000410, 0x06) {}
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Name (CRS, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {0,8,11,15}
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        _Y08)
                })
                OperationRegion (HCNT, SystemMemory, HPTC, 0x04)
                Field (HCNT, DWordAcc, NoLock, Preserve)
                {
                    HPTS,   2, 
                        ,   5, 
                    HPTE,   1
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (HPTE)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (CRS, \_SB.PCI0.HPET._Y08._BAS, HTBS)  // _BAS: Base Address
                    Local0 = (HPTS * 0x1000)
                    HTBS = (Local0 + 0xFED00000)
                    Return (CRS) /* \_SB_.PCI0.HPET.CRS_ */
                }
            }
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
            }

            Name (CRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (CRS, \_SB.PCI0._Y09._MIN, MIN5)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y09._MAX, MAX5)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y09._LEN, LEN5)  // _LEN: Length
            CreateDWordField (CRS, \_SB.PCI0._Y0A._MIN, MIN6)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y0A._MAX, MAX6)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y0A._LEN, LEN6)  // _LEN: Length
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = MG1L /* \MG1L */
                If (Local0)
                {
                    MIN5 = MG1B /* \MG1B */
                    LEN5 = MG1L /* \MG1L */
                    MAX5 = (MIN5 + Local0--)
                }

                MIN6 = MG2B /* \MG2B */
                LEN6 = MG2L /* \MG2L */
                Local0 = MG2L /* \MG2L */
                MAX6 = (MIN6 + Local0--)
                Return (CRS) /* \_SB_.PCI0.CRS_ */
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        DBG8 = Arg0
        If (((Arg0 == 0x04) && (OSFL () == 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        Index (WAKP, Zero) = Zero
        Index (WAKP, One) = Zero
        WSSB = ASSB /* \ASSB */
        WOTB = AOTB /* \AOTB */
        WAXB = AAXB /* \AAXB */
        ASSB = Arg0
        AOTB = OSFL ()
        AAXB = Zero
        \_SB.SLPS = One
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        DBG8 = (Arg0 << 0x04)
        WAK (Arg0)
        If (ASSB)
        {
            ASSB = WSSB /* \WSSB */
            AOTB = WOTB /* \WOTB */
            AAXB = WAXB /* \WAXB */
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Index (WAKP, One) = Zero
        }
        Else
        {
            Index (WAKP, One) = Arg0
        }

        Return (WAKP) /* \WAKP */
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    If (!PEHP)
                    {
                        CTRL &= 0x1E
                    }

                    If (!SHPC)
                    {
                        CTRL &= 0x1D
                    }

                    If (!PEPM)
                    {
                        CTRL &= 0x1B
                    }

                    If (!PEER)
                    {
                        CTRL &= 0x15
                    }

                    If (!PECS)
                    {
                        CTRL &= 0x0F
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0._OSC.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }
        }
    }

    Device (LDRC)
    {
        Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
        Name (_UID, 0x0E11)  // _UID: Unique ID
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
    }

    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    OperationRegion (SPRT, SystemIO, 0xB2, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    Scope (_SB.PCI0.P0P1.PEGP)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            _ADR = Zero
        }

        OperationRegion (DGPU, PCI_Config, Zero, 0x30)
        Field (DGPU, AnyAcc, NoLock, Preserve)
        {
            DGID,   16, 
            Offset (0x2C), 
            DVID,   32
        }

        Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
        {
            DSEN = (Arg0 & 0x03)
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Return (Package (0x03)
            {
                0x00010100, 
                0x00010110, 
                0x00010210
            })
        }

        Device (CRT)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0100)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                Local0 = SMI (0x8E, 0x02)
                Return (Local0)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Local0 = SMI (0x99, 0x02)
                Return (Local0)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSS (0x02, Arg0)
            }
        }

        Device (LCD)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0110)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                Local0 = SMI (0x8E, One)
                Return (Local0)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Local0 = SMI (0x99, One)
                Return (Local0)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSS (One, Arg0)
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                Return (Package (0x12)
                {
                    0x64, 
                    0x1E, 
                    0x06, 
                    0x0C, 
                    0x12, 
                    0x18, 
                    0x1E, 
                    0x24, 
                    0x2A, 
                    0x30, 
                    0x36, 
                    0x3C, 
                    0x42, 
                    0x48, 
                    0x4E, 
                    0x54, 
                    0x5A, 
                    0x64
                })
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                SX10 ()
                SX30 (0x19)
                SX30 (One)
                SX30 (Arg0)
                BRTL = Arg0
                SX11 ()
                SX12 ()
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                Local0 = SMI (0x19, 0x02)
                Return (Local0)
            }
        }

        Device (DVI)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0210)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                Local0 = SMI (0x8E, 0x02)
                Return (Local0)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Local0 = SMI (0x99, 0x08)
                Return (Local0)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSS (0x02, Arg0)
            }
        }
    }

    Scope (_SB.PCI0.P0P2.PEGP)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            ^^^P0P1.PEGP._ADR = Zero
        }

        OperationRegion (DGPU, PCI_Config, Zero, 0x30)
        Field (DGPU, AnyAcc, NoLock, Preserve)
        {
            DGID,   16, 
            Offset (0x2C), 
            DVID,   32
        }

        Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
        {
            DSEN = (Arg0 & 0x03)
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Return (Package (0x03)
            {
                0x00010100, 
                0x00010110, 
                0x00010210
            })
        }

        Device (CRT)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0100)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                Local0 = SMI (0x8E, 0x02)
                Return (Local0)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Local0 = SMI (0x99, 0x02)
                Return (Local0)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSS (0x02, Arg0)
            }
        }

        Device (LCD)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0110)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                Local0 = SMI (0x8E, One)
                Return (Local0)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Local0 = SMI (0x99, One)
                Return (Local0)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSS (One, Arg0)
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                Return (Package (0x12)
                {
                    0x64, 
                    0x1E, 
                    0x06, 
                    0x0C, 
                    0x12, 
                    0x18, 
                    0x1E, 
                    0x24, 
                    0x2A, 
                    0x30, 
                    0x36, 
                    0x3C, 
                    0x42, 
                    0x48, 
                    0x4E, 
                    0x54, 
                    0x5A, 
                    0x64
                })
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                SX10 ()
                SX30 (0x19)
                SX30 (One)
                SX30 (Arg0)
                BRTL = Arg0
                SX11 ()
                SX12 ()
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                Local0 = SMI (0x19, 0x02)
                Return (Local0)
            }
        }

        Device (DVI)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0210)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                Local0 = SMI (0x8E, 0x02)
                Return (Local0)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Local0 = SMI (0x99, 0x08)
                Return (Local0)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSS (0x02, Arg0)
            }
        }
    }

    OperationRegion (RCRB, SystemMemory, SRCB, SRCL)
    Field (RCRB, ByteAcc, NoLock, Preserve)
    {
        Offset (0x3418), 
        Offset (0x341A), 
        PE0E,   1, 
        PE1E,   1, 
        PE2E,   1, 
        PE3E,   1, 
        PE4E,   1, 
        PE5E,   1, 
        PE6E,   1, 
        PE7E,   1
    }

    Scope (_GPE)
    {
        Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            DBG8 += One
            If (((PE0E == Zero) && \_SB.PCI0.PEX0.HPST))
            {
                Sleep (0x64)
                If (\_SB.PCI0.PEX0.PDCX)
                {
                    \_SB.PCI0.PEX0.PDCX = One
                    \_SB.PCI0.PEX0.HPST = One
                    Notify (\_SB.PCI0.PEX0, Zero) // Bus Check
                }
                Else
                {
                    \_SB.PCI0.PEX0.HPST = One
                }
            }

            If (((PE1E == Zero) && \_SB.PCI0.PEX1.HPST))
            {
                Sleep (0x64)
                If (\_SB.PCI0.PEX1.PDCX)
                {
                    \_SB.PCI0.PEX1.PDCX = One
                    \_SB.PCI0.PEX1.HPST = One
                    Notify (\_SB.PCI0.PEX1, Zero) // Bus Check
                }
                Else
                {
                    \_SB.PCI0.PEX1.HPST = One
                }
            }

            If (((PE2E == Zero) && \_SB.PCI0.PEX2.HPST))
            {
                Sleep (0x64)
                If (\_SB.PCI0.PEX2.PDCX)
                {
                    \_SB.PCI0.PEX2.PDCX = One
                    \_SB.PCI0.PEX2.HPST = One
                    Notify (\_SB.PCI0.PEX2, Zero) // Bus Check
                }
                Else
                {
                    \_SB.PCI0.PEX2.HPST = One
                }
            }

            If (((PE3E == Zero) && \_SB.PCI0.PEX3.HPST))
            {
                Sleep (0x64)
                If (\_SB.PCI0.PEX3.PDCX)
                {
                    \_SB.PCI0.PEX3.PDCX = One
                    \_SB.PCI0.PEX3.HPST = One
                    Notify (\_SB.PCI0.PEX3, Zero) // Bus Check
                }
                Else
                {
                    \_SB.PCI0.PEX3.HPST = One
                }
            }

            If (((PE4E == Zero) && \_SB.PCI0.PEX4.HPST))
            {
                Sleep (0x64)
                If (\_SB.PCI0.PEX4.PDCX)
                {
                    \_SB.PCI0.PEX4.PDCX = One
                    \_SB.PCI0.PEX4.HPST = One
                    Notify (\_SB.PCI0.PEX4, Zero) // Bus Check
                }
                Else
                {
                    \_SB.PCI0.PEX4.HPST = One
                }
            }

            If (((PE5E == Zero) && \_SB.PCI0.PEX5.HPST))
            {
                Sleep (0x64)
                If (\_SB.PCI0.PEX5.PDCX)
                {
                    \_SB.PCI0.PEX5.PDCX = One
                    \_SB.PCI0.PEX5.HPST = One
                    Notify (\_SB.PCI0.PEX5, Zero) // Bus Check
                }
                Else
                {
                    \_SB.PCI0.PEX5.HPST = One
                }
            }

            If (((PE6E == Zero) && \_SB.PCI0.PEX6.HPST))
            {
                Sleep (0x64)
                If (\_SB.PCI0.PEX6.PDCX)
                {
                    \_SB.PCI0.PEX6.PDCX = One
                    \_SB.PCI0.PEX6.HPST = One
                    Notify (\_SB.PCI0.PEX6, Zero) // Bus Check
                }
                Else
                {
                    \_SB.PCI0.PEX6.HPST = One
                }
            }

            If (((PE7E == Zero) && \_SB.PCI0.PEX7.HPST))
            {
                Sleep (0x64)
                If (\_SB.PCI0.PEX7.PDCX)
                {
                    \_SB.PCI0.PEX7.PDCX = One
                    \_SB.PCI0.PEX7.HPST = One
                    Notify (\_SB.PCI0.PEX7, Zero) // Bus Check
                }
                Else
                {
                    \_SB.PCI0.PEX7.HPST = One
                }
            }
        }
    }

    Scope (_SB.PCI0.PEX0)
    {
        Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
        {
            0x08, 
            0x40, 
            One, 
            Zero
        })
        OperationRegion (PXRG, PCI_Config, Zero, 0x0100)
        Field (PXRG, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0x5A), 
                ,   3, 
            PDCX,   1, 
            Offset (0xD8), 
                ,   30, 
            HPEN,   1, 
            PCEN,   1, 
                ,   30, 
            HPST,   1, 
            PCST,   1
        }

        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Local0 = Zero
                If ((P0HP == One))
                {
                    Local0 = One
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.PEX1)
    {
        Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
        {
            0x08, 
            0x40, 
            One, 
            Zero
        })
        OperationRegion (PXRG, PCI_Config, Zero, 0x0100)
        Field (PXRG, AnyAcc, NoLock, Preserve)
        {
            Offset (0x5A), 
                ,   3, 
            PDCX,   1, 
            Offset (0xD8), 
                ,   30, 
            HPEN,   1, 
            PCEN,   1, 
                ,   30, 
            HPST,   1, 
            PCST,   1
        }

        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_SUN, 0x001C0001)  // _SUN: Slot User Number
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x09, 
                0x04
            })
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             /* . */
                    })
                }

                Return (Package ()
                {
                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             /* . */
                    }, 

                    "device_type", 
                    "AirPort", 
                    "model", 
                    "Broadcom BCM43225 802.11 a/b/g/n Wireless Network Controller", 
                    "name", 
                    "AirPort Extreme", 
                    "compatible", 
                    "pci14e4,43a0"
                })
            }
            
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Local0 = Zero
                If ((P1HP == One))
                {
                    Local0 = One
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.PEX2)
    {
        Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
        {
            0x08, 
            0x40, 
            One, 
            Zero
        })
        OperationRegion (PXRG, PCI_Config, Zero, 0x0100)
        Field (PXRG, AnyAcc, NoLock, Preserve)
        {
            Offset (0x5A), 
                ,   3, 
            PDCX,   1, 
            Offset (0xD8), 
                ,   30, 
            HPEN,   1, 
            PCEN,   1, 
                ,   30, 
            HPST,   1, 
            PCST,   1
        }
    }

    Scope (_SB.PCI0.PEX3)
    {
        Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
        {
            0x08, 
            0x40, 
            One, 
            Zero
        })
        OperationRegion (PXRG, PCI_Config, Zero, 0x0100)
        Field (PXRG, AnyAcc, NoLock, Preserve)
        {
            Offset (0x5A), 
                ,   3, 
            PDCX,   1, 
            Offset (0xD8), 
                ,   30, 
            HPEN,   1, 
            PCEN,   1, 
                ,   30, 
            HPST,   1, 
            PCST,   1
        }

        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Local0 = Zero
                If ((P3HP == One))
                {
                    Local0 = One
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.PEX4)
    {
        Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
        {
            0x08, 
            0x40, 
            One, 
            Zero
        })
        OperationRegion (PXRG, PCI_Config, Zero, 0x0100)
        Field (PXRG, AnyAcc, NoLock, Preserve)
        {
            Offset (0x5A), 
                ,   3, 
            PDCX,   1, 
            Offset (0xD8), 
                ,   30, 
            HPEN,   1, 
            PCEN,   1, 
                ,   30, 
            HPST,   1, 
            PCST,   1
        }

        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Local0 = Zero
                If ((P4HP == One))
                {
                    Local0 = One
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.PEX5)
    {
        Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
        {
            0x08, 
            0x40, 
            One, 
            Zero
        })
        OperationRegion (PXRG, PCI_Config, Zero, 0x0100)
        Field (PXRG, AnyAcc, NoLock, Preserve)
        {
            Offset (0x5A), 
                ,   3, 
            PDCX,   1, 
            Offset (0xD8), 
                ,   30, 
            HPEN,   1, 
            PCEN,   1, 
                ,   30, 
            HPST,   1, 
            PCST,   1
        }

        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Local0 = Zero
                If ((P5HP == One))
                {
                    Local0 = One
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.PEX6)
    {
        Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
        {
            0x08, 
            0x40, 
            One, 
            Zero
        })
        OperationRegion (PXRG, PCI_Config, Zero, 0x0100)
        Field (PXRG, AnyAcc, NoLock, Preserve)
        {
            Offset (0x5A), 
                ,   3, 
            PDCX,   1, 
            Offset (0xD8), 
                ,   30, 
            HPEN,   1, 
            PCEN,   1, 
                ,   30, 
            HPST,   1, 
            PCST,   1
        }

        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Local0 = Zero
                If ((P6HP == One))
                {
                    Local0 = One
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.PEX7)
    {
        Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
        {
            0x08, 
            0x40, 
            One, 
            Zero
        })
        OperationRegion (PXRG, PCI_Config, Zero, 0x0100)
        Field (PXRG, AnyAcc, NoLock, Preserve)
        {
            Offset (0x5A), 
                ,   3, 
            PDCX,   1, 
            Offset (0xD8), 
                ,   30, 
            HPEN,   1, 
            PCEN,   1, 
                ,   30, 
            HPST,   1, 
            PCST,   1
        }

        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Local0 = Zero
                If ((P7HP == One))
                {
                    Local0 = One
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Method (PEWK, 0, NotSerialized)
        {
            If ((PE4E == Zero))
            {
                If (^PEX4.PDCX)
                {
                    ^PEX4.PDCX = One
                    ^PEX4.HPST = One
                }
                Else
                {
                    ^PEX4.HPST = One
                }

                Notify (PEX4, Zero) // Bus Check
            }
        }

        Method (RLWK, 0, NotSerialized)
        {
            If ((PE2E == Zero))
            {
                If (^PEX2.PDCX)
                {
                    DBG8 = 0xEE
                    ^PEX2.PDCX = One
                    ^PEX2.HPST = One
                }
                Else
                {
                    DBG8 = 0xEF
                    ^PEX2.HPST = One
                }

                Notify (PEX2, Zero) // Bus Check
            }
        }
    }

    Method (NEVT, 0, NotSerialized)
    {
        Local0 = ECG1 ()
        If ((Local0 & One))
        {
            Notify (\_SB.PWRB, 0x80) // Status Change
        }

        If ((Local0 & 0x04))
        {
            LIDE ()
        }

        If ((Local0 & 0x08))
        {
            PWRE ()
        }

        If ((Local0 & 0x80))
        {
            SMIE ()
        }
    }

    Name (WAKE, Zero)
    Method (NWAK, 0, NotSerialized)
    {
        WAKE = One
        Local0 = ECG7 ()
        Local1 = Zero
        If ((Local0 == Zero))
        {
            Local1 = One
        }

        If ((Local0 & One))
        {
            Local1 = One
        }

        If ((Local0 & 0x02))
        {
            LIDE ()
        }

        If ((Local0 & 0x20)) {}
        If (Local1)
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        WAKE = Zero
    }

    Mutex (GFXM, 0x01)
    Method (ILID, 0, NotSerialized)
    {
        Acquire (GFXM, 0xFFFF)
        Local0 = SMI (0x46, Zero)
        Notify (\_SB.LID0, 0x80) // Status Change
        Release (GFXM)
    }

    Method (LIDE, 0, NotSerialized)
    {
        Local1 = GPUF /* \GPUF */
        If ((Local1 == 0x04))
        {
            ILID ()
        }
        Else
        {
            Notify (\_SB.LID0, 0x80) // Status Change
        }
    }

    Method (PWRE, 0, NotSerialized)
    {
        Local0 = ECG5 ()
        Local1 = (Local0 ^ MIS0) /* \MIS0 */
        MIS0 = (Local0 & 0x13)
        If ((Local1 & One))
        {
            Notify (\_SB.ADP1, 0x80) // Status Change
        }

        Local2 = (MIS0 & 0x02)
        If ((Local1 & 0x02))
        {
            If (Local2)
            {
                Notify (\_SB.BAT0, 0x81) // Information Change
            }
            Else
            {
                Notify (\_SB.BAT0, 0x81) // Information Change
            }
        }

        If ((Local1 & 0x04))
        {
            If (Local2)
            {
                Notify (\_SB.BAT0, 0x80) // Status Change
            }
        }

        If ((Local1 & 0x08))
        {
            If (Local2)
            {
                Notify (\_SB.BAT0, 0x80) // Status Change
            }
        }

        If ((_REV != 0x03))
        {
            SMI (0xD7, Zero)
        }
    }

    Method (SMIE, 0, NotSerialized)
    {
        Local0 = SMI (0x96, Zero)
        If ((Local0 & One))
        {
            Notify (\_TZ.THM, 0x80) // Thermal Status Change
        }

        If ((Local0 & 0x02))
        {
            Local1 = GPUF /* \GPUF */
            Name (T_0, Zero)  // _T_x: Emitted by ASL Compiler
            T_0 = Local1
            If ((T_0 == One))
            {
                Notify (\_SB.PCI0.P0P1.PEGP, 0x80) // Status Change
            }
            Else
            {
                If ((T_0 == 0x02))
                {
                    Notify (\_SB.PCI0.P0P2.PEGP, 0x80) // Status Change
                }
                Else
                {
                    If ((T_0 == 0x03))
                    {
                        Notify (\_SB.PCI0.P0P1.PEGP, 0x80) // Status Change
                    }
                    Else
                    {
                    }
                }
            }
        }

        If ((Local0 & 0x04))
        {
            CESM (Local0)
        }
    }

    Method (CESM, 1, NotSerialized)
    {
        Local0 = Arg0
        SX10 ()
        SX30 (0x18)
        SX11 ()
        Local0 = SX42 ()
        SX12 ()
        If ((OSYS >= 0x20))
        {
            If ((Local0 & 0x0400))
            {
                Local1 = GPUF /* \GPUF */
                Name (T_0, Zero)  // _T_x: Emitted by ASL Compiler
                T_0 = Local1
                If ((T_0 == One))
                {
                    Notify (\_SB.PCI0.P0P1.PEGP.LCD, 0x86) // Device-Specific
                }
                Else
                {
                    If ((T_0 == 0x02))
                    {
                        Notify (\_SB.PCI0.P0P2.PEGP.LCD, 0x86) // Device-Specific
                    }
                    Else
                    {
                    }
                }
            }
        }

        If ((OSYS >= 0x20))
        {
            If ((Local0 & 0x0200))
            {
                Local1 = GPUF /* \GPUF */
                Name (T_1, Zero)  // _T_x: Emitted by ASL Compiler
                T_1 = Local1
                If ((T_1 == One))
                {
                    Notify (\_SB.PCI0.P0P1.PEGP.LCD, 0x87) // Device-Specific
                }
                Else
                {
                    If ((T_1 == 0x02))
                    {
                        Notify (\_SB.PCI0.P0P2.PEGP.LCD, 0x87) // Device-Specific
                    }
                    Else
                    {
                    }
                }
            }
        }
    }

    Scope (_GPE)
    {
        Method (_L11, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            NEVT ()
        }

        Method (_L17, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            NWAK ()
        }
    }

    Method (OPTS, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            S3FL = One
        }

        SMI (0x8A, Arg0)
        MIS1 = SMI (0x46, Zero)
    }

    Method (OWAK, 1, NotSerialized)
    {
        SOST ()
        MIS0 = ECG5 ()
        Notify (\_SB.ADP1, 0x80) // Status Change
        SMI (0x9A, Arg0)
        Local1 = GPUF /* \GPUF */
        If ((Local1 == 0x04))
        {
            Local0 = SMI (0x46, Zero)
            If ((Arg0 == 0x03))
            {
                If (((MIS1 != Local0) | (Local0 == Zero)))
                {
                    If ((OSYS >= 0x20))
                    {
                        
                    }
                    Else
                    {
                        LIDE ()
                    }
                }
            }
        }
    }

    Method (PSW, 2, NotSerialized)
    {
        SX10 ()
        SX30 (0x06)
        SX30 (Arg0)
        SX30 (Arg1)
        SX11 ()
        SX12 ()
    }

    Method (DSS, 2, NotSerialized)
    {
        SX10 ()
        SX30 (0x08)
        SX30 (Arg0)
        SX32 (Arg1)
        SX11 ()
        SX12 ()
    }

    Scope (_SB)
    {
        OperationRegion (SMIR, SystemIO, 0xB2, 0x02)
        Field (SMIR, ByteAcc, NoLock, Preserve)
        {
            SMII,   8, 
            SMID,   8
        }

        OperationRegion (SMR2, SystemIO, 0x86, One)
        Field (SMR2, ByteAcc, NoLock, Preserve)
        {
            SMIA,   8
        }
    }

    Mutex (SMIX, 0x01)
    Method (SMI, 2, NotSerialized)
    {
        Acquire (SMIX, 0xFFFF)
        SMIB = Arg1
        \_SB.SMII = Arg0
        Local1 = SMIB /* \SMIB */
        Release (SMIX)
        Return (Local1)
    }

    Name (SXX0, Buffer (0x0100) {})
    Name (SXX1, Buffer (0x08) {})
    Name (NSMI, Zero)
    CreateWordField (SXX1, Zero, SXX2)
    CreateWordField (SXX1, 0x04, SXX3)
    Method (SX10, 0, NotSerialized)
    {
        Acquire (SMIX, 0xFFFF)
        SXX2 = Zero
        If ((\_SB.PCI0.LPCB.RMSC.ENTF == Zero))
        {
            NSMI = Zero
        }
        Else
        {
            NSMI = One
        }
    }

    Method (SX30, 1, NotSerialized)
    {
        If ((NSMI == Zero))
        {
            Local0 = SXX2 /* \SXX2 */
            Local0++
            If ((Local0 <= SizeOf (SXX0)))
            {
                CreateByteField (SXX0, SXX2, SX20)
                SX20 = Arg0
                SXX2 = Local0
            }
        }
    }

    Method (SX32, 1, NotSerialized)
    {
        If ((NSMI == Zero))
        {
            Local0 = SXX2 /* \SXX2 */
            Local0 += 0x04
            If ((Local0 <= SizeOf (SXX0)))
            {
                CreateDWordField (SXX0, SXX2, SX22)
                SX22 = Arg0
                SXX2 = Local0
            }
        }
    }

    Method (SXX6, 2, NotSerialized)
    {
        SMIB = Arg1
        \_SB.SMII = Arg0
        Return (SMIB) /* \SMIB */
    }

    Method (SXX5, 2, NotSerialized)
    {
        If ((Arg1 < SizeOf (Arg0)))
        {
            CreateByteField (Arg0, Arg1, SX20)
            SXX6 (0x7C, SX20)
        }
    }

    Method (SXX4, 0, NotSerialized)
    {
        SXX6 (0x7B, Zero)
        Local0 = Zero
        While ((Local0 < SXX2))
        {
            SXX5 (SXX0, Local0)
            Local0++
        }
    }

    Method (SXX8, 2, NotSerialized)
    {
        If ((Arg1 < SizeOf (Arg0)))
        {
            CreateByteField (Arg0, Arg1, SX20)
            SX20 = SXX6 (0x7D, Zero)
        }
    }

    Method (SXX7, 0, NotSerialized)
    {
        Local0 = Zero
        While ((Local0 < SXX3))
        {
            Local1 = (SXX2 + Local0)
            SXX8 (SXX0, Local1)
            Local0++
        }
    }

    Method (SX11, 0, NotSerialized)
    {
        If ((NSMI == Zero))
        {
            SXX4 ()
            SXX3 = SXX6 (0x79, Zero)
            Local0 = (SXX2 + SXX3) /* \SXX3 */
            If ((SizeOf (SXX0) < Local0))
            {
                Local0 = SizeOf (SXX0)
                Local0 -= SXX2 /* \SXX2 */
                SXX3 = Local0
            }

            SXX7 ()
        }
    }

    Method (SX40, 0, NotSerialized)
    {
        If ((NSMI == Zero))
        {
            Local0 = SXX2 /* \SXX2 */
            Local0++
            If ((Local0 <= SizeOf (SXX0)))
            {
                CreateByteField (SXX0, SXX2, SX20)
                SXX2 = Local0
                Return (SX20) /* \SX40.SX20 */
            }
        }

        Return (Zero)
    }

    Method (SX41, 0, NotSerialized)
    {
        If ((NSMI == Zero))
        {
            Local0 = SXX2 /* \SXX2 */
            Local0 += 0x02
            If ((Local0 <= SizeOf (SXX0)))
            {
                CreateWordField (SXX0, SXX2, SX21)
                SXX2 = Local0
                Return (SX21) /* \SX41.SX21 */
            }
        }

        Return (Zero)
    }

    Method (SX42, 0, NotSerialized)
    {
        If ((NSMI == Zero))
        {
            Local0 = SXX2 /* \SXX2 */
            Local0 += 0x04
            If ((Local0 <= SizeOf (SXX0)))
            {
                CreateDWordField (SXX0, SXX2, SX22)
                SXX2 = Local0
                Return (SX22) /* \SX42.SX22 */
            }
        }

        Return (Zero)
    }

    Method (SX12, 0, NotSerialized)
    {
        Release (SMIX)
    }

    Scope (_SB.PCI0)
    {
        Method (UCMD, 3, NotSerialized)
        {
            SX10 ()
            SX30 (0x0F)
            SX30 (Arg0)
            SX30 (Arg1)
            SX30 (Arg2)
            SX11 ()
            Local0 = SX40 ()
            SX12 ()
            Return (Local0)
        }

        Method (UPSW, 2, NotSerialized)
        {
            Return (UCMD (0x02, Arg0, Arg1))
        }

        Method (UPRW, 2, NotSerialized)
        {
            Return (UCMD (One, Arg0, Arg1))
        }

        Device (EHC2)
        {
            Name (_ADR, 0x001A0000)  // _ADR: Address
            Name (_S1D, 0x02)  // _S1D: S1 Device State
            Name (_S3D, 0x02)  // _S3D: S3 Device State
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Local0 = UPRW (Zero, 0x02)
                If ((Local0 == 0x03))
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        0x03
                    })
                }

                If ((Local0 == One))
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        One
                    })
                }

                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                UPSW (Arg0, 0x02)
            }

            Device (HUB7)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Device (RMCH)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0xFF, 
                        Zero, 
                        Zero
                    })
                    Name (_PLD, Package ()
                    {
                        ToPLD (
                        PLD_Revision       = 0x0,
                        PLD_IgnoreColor    = 0x0,
                        PLD_Red            = 0x0,
                        PLD_Green          = 0x0,
                        PLD_Blue           = 0x81,
                        PLD_Width          = 0x0,
                        PLD_Height         = 0x0,
                        PLD_UserVisible    = 0x0,
                        PLD_Dock           = 0x0,
                        PLD_Lid            = 0x0,
                        PLD_Panel          = "TOP",
                        PLD_VerticalPosition = "UPPER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape          = "ROUND",
                        PLD_GroupOrientation = 0x0,
                        PLD_GroupToken     = 0x0,
                        PLD_GroupPosition  = 0x60,
                        PLD_Bay            = 0x0,
                        PLD_Ejectable      = 0x0,
                        PLD_EjectRequired  = 0x0,
                        PLD_CabinetNumber  = 0x0,
                        PLD_CardCageNumber = 0x0,
                        PLD_Reference      = 0x0,
                        PLD_Rotation       = 0x0,
                        PLD_Order          = 0x0,
                        PLD_VerticalOffset = 0x0,
                        PLD_HorizontalOffset = 0x0)
                    })  // _PLD: Physical Location of Device
                    Device (CH00)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (CH01)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }

                    Device (CH10)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package ()
                        {
                            ToPLD (
                            PLD_Revision       = 0x0,
                            PLD_IgnoreColor    = 0x0,
                            PLD_Red            = 0x0,
                            PLD_Green          = 0x0,
                            PLD_Blue           = 0x81,
                            PLD_Width          = 0x0,
                            PLD_Height         = 0x0,
                            PLD_UserVisible    = 0x0,
                            PLD_Dock           = 0x0,
                            PLD_Lid            = 0x0,
                            PLD_Panel          = "TOP",
                            PLD_VerticalPosition = "UPPER",
                            PLD_HorizontalPosition = "LEFT",
                            PLD_Shape          = "ROUND",
                            PLD_GroupOrientation = 0x0,
                            PLD_GroupToken     = 0x0,
                            PLD_GroupPosition  = 0x60,
                            PLD_Bay            = 0x0,
                            PLD_Ejectable      = 0x0,
                            PLD_EjectRequired  = 0x0,
                            PLD_CabinetNumber  = 0x0,
                            PLD_CardCageNumber = 0x0,
                            PLD_Reference      = 0x0,
                            PLD_Rotation       = 0x0,
                            PLD_Order          = 0x0,
                            PLD_VerticalOffset = 0x0,
                            PLD_HorizontalOffset = 0x0)
                        })  // _PLD: Physical Location of Device
                    }

                    Device (CH11)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package ()
                        {
                            ToPLD (
                            PLD_Revision       = 0x0,
                            PLD_IgnoreColor    = 0x0,
                            PLD_Red            = 0x0,
                            PLD_Green          = 0x0,
                            PLD_Blue           = 0x81,
                            PLD_Width          = 0x0,
                            PLD_Height         = 0x0,
                            PLD_UserVisible    = 0x0,
                            PLD_Dock           = 0x0,
                            PLD_Lid            = 0x0,
                            PLD_Panel          = "TOP",
                            PLD_VerticalPosition = "UPPER",
                            PLD_HorizontalPosition = "LEFT",
                            PLD_Shape          = "ROUND",
                            PLD_GroupOrientation = 0x0,
                            PLD_GroupToken     = 0x0,
                            PLD_GroupPosition  = 0x60,
                            PLD_Bay            = 0x0,
                            PLD_Ejectable      = 0x0,
                            PLD_EjectRequired  = 0x0,
                            PLD_CabinetNumber  = 0x0,
                            PLD_CardCageNumber = 0x0,
                            PLD_Reference      = 0x0,
                            PLD_Rotation       = 0x0,
                            PLD_Order          = 0x0,
                            PLD_VerticalOffset = 0x0,
                            PLD_HorizontalOffset = 0x0)
                        })  // _PLD: Physical Location of Device
                    }

                    Device (CH20)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                    }

                    Device (CH21)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package ()
                        {
                            ToPLD (
                            PLD_Revision       = 0x0,
                            PLD_IgnoreColor    = 0x0,
                            PLD_Red            = 0x0,
                            PLD_Green          = 0x0,
                            PLD_Blue           = 0x81,
                            PLD_Width          = 0x0,
                            PLD_Height         = 0x0,
                            PLD_UserVisible    = 0x0,
                            PLD_Dock           = 0x0,
                            PLD_Lid            = 0x0,
                            PLD_Panel          = "TOP",
                            PLD_VerticalPosition = "UPPER",
                            PLD_HorizontalPosition = "LEFT",
                            PLD_Shape          = "ROUND",
                            PLD_GroupOrientation = 0x0,
                            PLD_GroupToken     = 0x0,
                            PLD_GroupPosition  = 0x60,
                            PLD_Bay            = 0x0,
                            PLD_Ejectable      = 0x0,
                            PLD_EjectRequired  = 0x0,
                            PLD_CabinetNumber  = 0x0,
                            PLD_CardCageNumber = 0x0,
                            PLD_Reference      = 0x0,
                            PLD_Rotation       = 0x0,
                            PLD_Order          = 0x0,
                            PLD_VerticalOffset = 0x0,
                            PLD_HorizontalOffset = 0x0)
                        })  // _PLD: Physical Location of Device
                    }
                }
            }
        }

        Device (EHCI)
        {
            Name (_ADR, 0x001D0000)  // _ADR: Address
            Name (_S1D, 0x02)  // _S1D: S1 Device State
            Name (_S3D, 0x02)  // _S3D: S3 Device State
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Local0 = UPRW (Zero, 0x02)
                If ((Local0 == 0x03))
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        0x03
                    })
                }

                If ((Local0 == One))
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        One
                    })
                }

                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                UPSW (Arg0, 0x02)
            }

            Device (HUB7)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Device (RMCH)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0xFF, 
                        Zero, 
                        Zero
                    })
                    Name (_PLD, Package ()
                    {
                        ToPLD (
                        PLD_Revision       = 0x0,
                        PLD_IgnoreColor    = 0x0,
                        PLD_Red            = 0x0,
                        PLD_Green          = 0x0,
                        PLD_Blue           = 0x81,
                        PLD_Width          = 0x0,
                        PLD_Height         = 0x0,
                        PLD_UserVisible    = 0x0,
                        PLD_Dock           = 0x0,
                        PLD_Lid            = 0x0,
                        PLD_Panel          = "TOP",
                        PLD_VerticalPosition = "UPPER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape          = "ROUND",
                        PLD_GroupOrientation = 0x0,
                        PLD_GroupToken     = 0x0,
                        PLD_GroupPosition  = 0x60,
                        PLD_Bay            = 0x0,
                        PLD_Ejectable      = 0x0,
                        PLD_EjectRequired  = 0x0,
                        PLD_CabinetNumber  = 0x0,
                        PLD_CardCageNumber = 0x0,
                        PLD_Reference      = 0x0,
                        PLD_Rotation       = 0x0,
                        PLD_Order          = 0x0,
                        PLD_VerticalOffset = 0x0,
                        PLD_HorizontalOffset = 0x0)
                    })  // _PLD: Physical Location of Device
                    Device (CH00)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (CH01)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }

                    Device (CH10)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                    }

                    Device (CH11)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                    }

                    Device (CH20)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                    }

                    Device (CH21)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package ()
                        {
                            ToPLD (
                            PLD_Revision       = 0x0,
                            PLD_IgnoreColor    = 0x0,
                            PLD_Red            = 0x0,
                            PLD_Green          = 0x0,
                            PLD_Blue           = 0x81,
                            PLD_Width          = 0x0,
                            PLD_Height         = 0x0,
                            PLD_UserVisible    = 0x0,
                            PLD_Dock           = 0x0,
                            PLD_Lid            = 0x0,
                            PLD_Panel          = "TOP",
                            PLD_VerticalPosition = "UPPER",
                            PLD_HorizontalPosition = "LEFT",
                            PLD_Shape          = "ROUND",
                            PLD_GroupOrientation = 0x0,
                            PLD_GroupToken     = 0x0,
                            PLD_GroupPosition  = 0x60,
                            PLD_Bay            = 0x0,
                            PLD_Ejectable      = 0x0,
                            PLD_EjectRequired  = 0x0,
                            PLD_CabinetNumber  = 0x0,
                            PLD_CardCageNumber = 0x0,
                            PLD_Reference      = 0x0,
                            PLD_Rotation       = 0x0,
                            PLD_Order          = 0x0,
                            PLD_VerticalOffset = 0x0,
                            PLD_HorizontalOffset = 0x0)
                        })  // _PLD: Physical Location of Device
                    }

                    Device (CH30)
                    {
                        Name (_ADR, 0x07)  // _ADR: Address
                    }

                    Device (CH31)
                    {
                        Name (_ADR, 0x08)  // _ADR: Address
                    }
                }
            }
        }
    }

    Scope (_SB.PCI0.LPCB)
    {
        Device (PS2)
        {
            Name (_HID, EisaId ("DLL0447"))  // _HID: Hardware ID
            Name (_CID, Package (0x03)  // _CID: Compatible ID
            {
                EisaId ("SYN0600"), 
                EisaId ("SYN0002"), 
                EisaId ("PNP0F13") /* PS/2 Mouse */
            })
            Name (CRS, ResourceTemplate ()
            {
                IRQNoFlags ()
                    {12}
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (CRS) /* \_SB_.PCI0.LPCB.PS2_.CRS_ */
            }
        }

        Device (KBC)
        {
            Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
            Name (ECNT, Zero)
            Name (DAHA, Buffer (0x03)
            {
                 0x00, 0x00, 0x55                                 /* ..U */
            })
            CreateByteField (DAHA, Zero, DCK0)
            CreateByteField (DAHA, One, DCK1)
            CreateByteField (DAHA, 0x02, DCK2)
            Name (CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0060,             // Range Minimum
                    0x0060,             // Range Maximum
                    0x10,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0064,             // Range Minimum
                    0x0064,             // Range Maximum
                    0x04,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x02,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x06,               // Alignment
                    0x01,               // Length
                    )
                IRQNoFlags ()
                    {1}
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (CRS) /* \_SB_.PCI0.LPCB.KBC_.CRS_ */
            }

            OperationRegion (MMBX, SystemMemory, 0xFE800000, 0x0200)
            Field (MMBX, AnyAcc, Lock, Preserve)
            {
                Offset (0x100), 
                MZ00,   8, 
                MZ01,   8, 
                MZ02,   8, 
                MZ03,   32, 
                MZ04,   32, 
                MZ05,   32, 
                MZ06,   32, 
                MZ07,   32, 
                MZ08,   32, 
                Offset (0x14B), 
                MZ09,   32, 
                MZ10,   32
            }

            Method (ECRB, 1, NotSerialized)
            {
                Local0 = Zero
                If ((Arg0 == Zero))
                {
                    Local0 = MZ00 /* \_SB_.PCI0.LPCB.KBC_.MZ00 */
                }
                Else
                {
                    If ((Arg0 == One))
                    {
                        Local0 = MZ01 /* \_SB_.PCI0.LPCB.KBC_.MZ01 */
                    }
                    Else
                    {
                        If ((Arg0 == 0x02))
                        {
                            Local0 = MZ02 /* \_SB_.PCI0.LPCB.KBC_.MZ02 */
                        }
                        Else
                        {
                            If ((Arg0 == 0x03))
                            {
                                Local0 = MZ03 /* \_SB_.PCI0.LPCB.KBC_.MZ03 */
                            }
                            Else
                            {
                                If ((Arg0 == 0x04))
                                {
                                    Local0 = MZ04 /* \_SB_.PCI0.LPCB.KBC_.MZ04 */
                                }
                                Else
                                {
                                    If ((Arg0 == 0x05))
                                    {
                                        Local0 = MZ05 /* \_SB_.PCI0.LPCB.KBC_.MZ05 */
                                    }
                                    Else
                                    {
                                        If ((Arg0 == 0x06))
                                        {
                                            Local0 = MZ06 /* \_SB_.PCI0.LPCB.KBC_.MZ06 */
                                        }
                                        Else
                                        {
                                            If ((Arg0 == 0x07))
                                            {
                                                Local0 = MZ07 /* \_SB_.PCI0.LPCB.KBC_.MZ07 */
                                            }
                                            Else
                                            {
                                                If ((Arg0 == 0x08))
                                                {
                                                    Local0 = MZ08 /* \_SB_.PCI0.LPCB.KBC_.MZ08 */
                                                }
                                                Else
                                                {
                                                    If ((Arg0 == 0x09))
                                                    {
                                                        Local0 = MZ09 /* \_SB_.PCI0.LPCB.KBC_.MZ09 */
                                                    }
                                                    Else
                                                    {
                                                        If ((Arg0 == 0x0A))
                                                        {
                                                            Local0 = MZ10 /* \_SB_.PCI0.LPCB.KBC_.MZ10 */
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Return (Local0)
            }

            Method (ECWB, 2, NotSerialized)
            {
                If ((Arg0 == Zero))
                {
                    MZ00 = Arg1
                }
                Else
                {
                    If ((Arg0 == One))
                    {
                        MZ01 = Arg1
                    }
                    Else
                    {
                        If ((Arg0 == 0x02))
                        {
                            MZ02 = Arg1
                        }
                        Else
                        {
                            If ((Arg0 == 0x03))
                            {
                                MZ03 = Arg1
                            }
                            Else
                            {
                                If ((Arg0 == 0x04))
                                {
                                    MZ10 = Arg1
                                }
                            }
                        }
                    }
                }
            }

            Method (WATK, 2, NotSerialized)
            {
                ECNT = 0x01F4
                While (ECNT)
                {
                    If ((ECRB (Arg0) == Arg1))
                    {
                        Break
                    }

                    Sleep (One)
                    ECNT--
                }
            }

            Method (PCA1, 2, NotSerialized)
            {
                If ((NSMI == Zero))
                {
                    ECWB (0x03, Arg1)
                    ECWB (One, Arg0)
                    WATK (0x0A, DCK2)
                    WATK (One, DCK0)
                    ECWB (0x04, Zero)
                    WATK (0x0A, DCK1)
                }
            }
        }

        OperationRegion (GPI1, SystemIO, 0x0500, 0x4A)
        Field (GPI1, ByteAcc, Lock, Preserve)
        {
            Offset (0x38), 
                ,   4, 
            GO36,   1, 
            GI37,   1
        }
    }

    Scope (_TZ)
    {
        ThermalZone (THM)
        {
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Local0 = GINF (0x12)
                Return (Local0)
            }

            Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
            {
                If ((THML == One))
                {
                    Local0 = GINF (0x12)
                    Local0 += One
                }
                Else
                {
                    Local0 = GINT (0x04)
                }

                Return (Local0)
            }

            Method (GINF, 1, NotSerialized)
            {
                SX10 ()
                SX30 (Arg0)
                SX11 ()
                Local0 = SX41 ()
                SX12 ()
                If ((Local0 < 0x0DF4))
                {
                    Local0 = 0x0DF4
                }

                Return (Local0)
            }

            Method (GINT, 1, NotSerialized)
            {
                SX10 ()
                SX30 (Arg0)
                SX11 ()
                Local0 = SX41 ()
                SX12 ()
                If ((Local0 < 0x0BA6))
                {
                    Local0 = 0x0BA6
                }

                Return (Local0)
            }
        }
    }

    Method (OSID, 0, NotSerialized)
    {
        If ((MIS3 == Zero))
        {
            MIS3 = 0x10
        }

        OSYS = MIS3 /* \MIS3 */
        Return (MIS3) /* \MIS3 */
    }

    Method (SOST, 0, NotSerialized)
    {
        SX10 ()
        SX30 (0x0A)
        OSID ()
        SX30 (MIS3)
        SX11 ()
        SX12 ()
    }

    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            MIS0 = SMI (0x98, Zero)
            MIS0 &= 0x13
            SOST ()
            If ((OSYS == 0x10))
            {
                SMI (0xE3, Zero)
            }
        }
    }

    Scope (_SB)
    {
        OperationRegion (SMI1, SystemIO, SMIP, 0x02)
        Field (SMI1, ByteAcc, NoLock, Preserve)
        {
            SSMI,   8
        }
    }

    Scope (_SB)
    {
        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (MIS0 & 0x02)
                If (Local0)
                {
                    Return (0x1F)
                }

                Return (0x0F)
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Name (BIF0, Package (0x0D) {})
                ECG9 (One, BIF0)
                Return (BIF0) /* \_SB_.BAT0._BIF.BIF0 */
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Name (BST0, Package (0x04) {})
                ECG6 (One, BST0)
                Return (BST0) /* \_SB_.BAT0._BST.BST0 */
            }
        }
    }

    Scope (_SB)
    {
        Device (ADP1)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                BAT0
            })
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Local0 = (MIS0 & One)
                Return (Local0)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }

    Scope (_SB)
    {
        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Local0 = ECG3 ()
                Return (Local0)
            }

            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x17, 
                0x03
            })
            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                PSW (Arg0, 0x02)
            }
        }

        Device (SBTN)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
        }
    }

    Method (ECG1, 0, NotSerialized)
    {
        SX10 ()
        SX30 (0x1C)
        SX11 ()
        Local0 = SX41 ()
        SX12 ()
        Return (Local0)
    }

    Method (ECG7, 0, NotSerialized)
    {
        Return (SMI (0x89, Zero))
    }

    Method (ECG3, 0, NotSerialized)
    {
        Return (SMI (0x84, Zero))
    }

    Method (ECG5, 0, NotSerialized)
    {
        Return (SMI (0x98, Zero))
    }

    Method (EGB0, 3, NotSerialized)
    {
        Name (KBMN, Buffer (0x0D) {})
        CreateDWordField (KBMN, Zero, KB00)
        CreateDWordField (KBMN, 0x04, KB04)
        CreateDWordField (KBMN, 0x08, KB08)
        CreateByteField (KBMN, 0x0C, KB12)
        KB00 = Arg0
        KB04 = Arg1
        KB08 = Arg2
        KB12 = Zero
        Return (KBMN) /* \EGB0.KBMN */
    }

    Method (EGB1, 1, NotSerialized)
    {
        Name (KBSN, Buffer (0x06)
        {
            "     "
        })
        Name (BBSN, Buffer (0x04) {})
        CreateWordField (BBSN, One, SN01)
        BBSN = Arg0
        Local2 = SN01 /* \EGB1.SN01 */
        Local3 = 0x04
        While (Local2)
        {
            Divide (Local2, 0x0A, Local4, Local2)
            Index (KBSN, Local3) = (Local4 + 0x30)
            Local3--
        }

        Return (KBSN) /* \EGB1.KBSN */
    }

    Method (EGB2, 1, NotSerialized)
    {
        Name (BBTY, Buffer (0x04) {})
        CreateByteField (BBTY, Zero, TY00)
        Name (KBLI, Buffer (0x05)
        {
            "LION"
        })
        Name (KBNI, Buffer (0x05)
        {
            "NiMH"
        })
        BBTY = Arg0
        If ((TY00 == 0x02))
        {
            Local0 = KBLI /* \EGB2.KBLI */
        }
        Else
        {
            If ((TY00 == 0x04))
            {
                Local0 = KBNI /* \EGB2.KBNI */
            }
        }

        Return (Local0)
    }

    Method (EGB3, 1, NotSerialized)
    {
        Name (BBOI, Buffer (0x04) {})
        CreateByteField (BBOI, 0x03, OI03)
        Name (KNSO, Buffer (0x05)
        {
            "Sony"
        })
        Name (KNSA, Buffer (0x06)
        {
            "Sanyo"
        })
        Name (KNPA, Buffer (0x0A)
        {
            "Panasonic"
        })
        Name (KNSU, Buffer (0x0C)
        {
            "Samsung SDI"
        })
        Name (KNSP, Buffer (0x04)
        {
            "SMP"
        })
        Name (KNMO, Buffer (0x09)
        {
            "Motorola"
        })
        Name (KNDY, Buffer (0x09)
        {
            "Dynapack"
        })
        Name (KNNL, Buffer (0x05)
        {
            "    "
        })
        BBOI = Arg0
        If ((OI03 == 0x02))
        {
            Local0 = KNSO /* \EGB3.KNSO */
        }
        Else
        {
            If ((OI03 == 0x03))
            {
                Local0 = KNSA /* \EGB3.KNSA */
            }
            Else
            {
                If ((OI03 == 0x04))
                {
                    Local0 = KNPA /* \EGB3.KNPA */
                }
                Else
                {
                    If ((OI03 == 0x06))
                    {
                        Local0 = KNSU /* \EGB3.KNSU */
                    }
                    Else
                    {
                        If ((OI03 == 0x07))
                        {
                            Local0 = KNSP /* \EGB3.KNSP */
                        }
                        Else
                        {
                            If ((OI03 == 0x08))
                            {
                                Local0 = KNMO /* \EGB3.KNMO */
                            }
                            Else
                            {
                                If ((OI03 == 0x09))
                                {
                                    Local0 = KNDY /* \EGB3.KNDY */
                                }
                                Else
                                {
                                    If ((OI03 == 0x0A))
                                    {
                                        Local0 = KNDY /* \EGB3.KNDY */
                                    }
                                    Else
                                    {
                                        If ((OI03 == 0x0B))
                                        {
                                            Local0 = KNDY /* \EGB3.KNDY */
                                        }
                                        Else
                                        {
                                            If ((OI03 == 0x0C))
                                            {
                                                Local0 = KNDY /* \EGB3.KNDY */
                                            }
                                            Else
                                            {
                                                If ((OI03 == 0x0D))
                                                {
                                                    Local0 = KNDY /* \EGB3.KNDY */
                                                }
                                                Else
                                                {
                                                    If ((OI03 == 0x0E))
                                                    {
                                                        Local0 = KNSP /* \EGB3.KNSP */
                                                    }
                                                    Else
                                                    {
                                                        Local0 = KNNL /* \EGB3.KNNL */
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Return (Local0)
    }

    Method (ECG6, 2, NotSerialized)
    {
        Name (BBST, Buffer (0x04) {})
        CreateByteField (BBST, Zero, BF00)
        CreateWordField (BBST, 0x02, BF02)
        Name (BBS1, Buffer (0x04) {})
        CreateWordField (BBS1, Zero, BF04)
        CreateWordField (BBS1, 0x02, BF06)
        SX10 ()
        If ((NSMI == Zero))
        {
            \_SB.PCI0.LPCB.KBC.PCA1 (0x9F, One)
            BBST = \_SB.PCI0.LPCB.KBC.ECRB (0x07)
            BBS1 = \_SB.PCI0.LPCB.KBC.ECRB (0x08)
            Index (Arg1, Zero) = BF00 /* \ECG6.BF00 */
            Local0 = BF02 /* \ECG6.BF02 */
            Local1 = (MIS0 & One)
            If ((Local0 == Zero))
            {
                Local0++
            }
            Else
            {
                If (((Local1 == One) & (Local0 & 0x8000)))
                {
                    Local0 = 0xFFFFFFFF
                }
                Else
                {
                    If (((Local1 == One) & ~(Local0 & 0x8000)))
                    {
                        Local0 = Local0
                    }
                    Else
                    {
                        If ((Local0 & 0x8000))
                        {
                            Local0 ^= 0xFFFF
                            Local0++
                        }
                        Else
                        {
                            Local0 = 0xFFFFFFFF
                        }
                    }
                }
            }

            Index (Arg1, One) = Local0
            Index (Arg1, 0x02) = BF06 /* \ECG6.BF06 */
            Index (Arg1, 0x03) = BF04 /* \ECG6.BF04 */
        }
        Else
        {
            Index (Arg1, Zero) = Zero
            Index (Arg1, One) = Zero
            Index (Arg1, 0x02) = Zero
            Index (Arg1, 0x03) = Zero
        }

        SX12 ()
    }

    Method (ECG9, 2, NotSerialized)
    {
        Name (BBI1, Buffer (0x04) {})
        CreateByteField (BBI1, One, BI01)
        CreateByteField (BBI1, 0x02, BI02)
        CreateByteField (BBI1, 0x03, BI03)
        Name (BBI2, Buffer (0x04) {})
        CreateByteField (BBI2, Zero, BI04)
        CreateByteField (BBI2, One, BI05)
        CreateByteField (BBI2, 0x02, BI06)
        Name (BBI3, Buffer (0x04) {})
        Name (BBI4, Buffer (0x04) {})
        Name (BC00, Buffer (0x04) {})
        Name (BC04, Buffer (0x04) {})
        Name (BC08, Buffer (0x04) {})
        SX10 ()
        If ((NSMI == Zero))
        {
            \_SB.PCI0.LPCB.KBC.PCA1 (0xA0, One)
            BBI2 = \_SB.PCI0.LPCB.KBC.ECRB (0x04)
            BBI1 = \_SB.PCI0.LPCB.KBC.ECRB (0x03)
            BBI3 = \_SB.PCI0.LPCB.KBC.ECRB (0x05)
            BBI4 = \_SB.PCI0.LPCB.KBC.ECRB (0x06)
            \_SB.PCI0.LPCB.KBC.PCA1 (0x9E, One)
            BC00 = \_SB.PCI0.LPCB.KBC.ECRB (0x03)
            BC04 = \_SB.PCI0.LPCB.KBC.ECRB (0x04)
            BC08 = \_SB.PCI0.LPCB.KBC.ECRB (0x05)
            Index (Arg1, Zero) = One
            Local0 = (BI03 | (BI04 << 0x08))
            Local1 = Local0
            Index (Arg1, One) = Local0
            Local0 = (BI01 | (BI02 << 0x08))
            Index (Arg1, 0x02) = Local0
            Index (Arg1, 0x03) = One
            Local0 = (BI05 | (BI06 << 0x08))
            Index (Arg1, 0x04) = Local0
            Index (Arg1, 0x05) = (Local1 / 0x0A)
            Index (Arg1, 0x06) = (Local1 / 0x21)
            Index (Arg1, 0x07) = (Local1 / 0x64)
            Index (Arg1, 0x08) = (Local1 / 0x64)
            Index (Arg1, 0x09) = EGB0 (BC00, BC04, BC08)
            Index (Arg1, 0x0A) = EGB1 (BBI3)
            Index (Arg1, 0x0B) = EGB2 (BBI4)
            Index (Arg1, 0x0C) = EGB3 (BBI3)
        }
        Else
        {
            Index (Arg1, Zero) = Zero
            Index (Arg1, One) = Zero
            Index (Arg1, 0x02) = Zero
            Index (Arg1, 0x03) = Zero
            Index (Arg1, 0x04) = Zero
            Index (Arg1, 0x05) = Zero
            Index (Arg1, 0x06) = Zero
            Index (Arg1, 0x07) = Zero
            Index (Arg1, 0x08) = Zero
            Index (Arg1, 0x09) = Zero
            Index (Arg1, 0x0A) = Zero
            Index (Arg1, 0x0B) = Zero
            Index (Arg1, 0x0C) = Zero
        }

        SX12 ()
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.LPCB.SPTS (Arg0)
            \_SB.PCI0.PEX0.SPRT (Arg0)
            \_SB.PCI0.PEX1.SPRT (Arg0)
            \_SB.PCI0.PEX2.SPRT (Arg0)
            \_SB.PCI0.PEX3.SPRT (Arg0)
            \_SB.PCI0.PEX4.SPRT (Arg0)
            \_SB.PCI0.PEX5.SPRT (Arg0)
            \_SB.PCI0.PEX6.SPRT (Arg0)
            \_SB.PCI0.PEX7.SPRT (Arg0)
            OPTS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        If (\_SB.PCI0.PEX0.PMS)
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX0, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX1.PMS)
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX2.PMS)
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX3.PMS)
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX4.PMS)
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX5.PMS)
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX5, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX6.PMS)
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX6, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX7.PMS)
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX7, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
        }

        \_SB.PCI0.PEWK ()
        \_SB.PCI0.RLWK ()
        OWAK (Arg0)
    }
}

