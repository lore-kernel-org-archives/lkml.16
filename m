Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8923956F;
	Thu,  6 Feb 2025 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867435; cv=none; b=NaEX39WM8a2Grwkv5wkk9+2bN7NkqHGM2QFSmfEOTAHpeMt9CDTeSNRsCM1YdaDkEFbKyjOKWwqf+WvFWShRf1uzoVS1p6o3us059boiDJ5yZKwEGKBNp7LC0ya81I1F+b/8ebREKeDJ33KdXFuXRXaBskPXIZNfh8A0bqcNsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867435; c=relaxed/simple;
	bh=CNSd/XfblGxI6izRTsDyMK22TAILA5owisRFvsSjU8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gm7SkUpN4+pdPqKA6uCtRt6bC6pt5kbEUMj5UZDUyVem5wZ2T500LbxOztwNI0Nv9l7vdzWR/s0Vkk4/S6Ed/fIeVH6vxu2PcpaCD7pIpW/t7zHoH4rSIksrd3S0bHexXvh7x5uulp5wj2WqX2qr3c4Ax9DgN9YgATNrCQQ+wOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWiUMPFr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWiUMPFr"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54021daa6cbso1368660e87.0;
        Thu, 06 Feb 2025 10:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738867432; x=1739472232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFA9qOaY71BOcek5hdgFiWKU2Bfr/7aGqTCBHcoc0kk=;
        b=jWiUMPFrywUG6r/a+p391aHxdDywW9RrdK8wKfh8NiwiD8c0Cwe6E0mbTPlq7wtk5o
         nZLoDuxCmOASMIiGJMARqPH6ht56Ciyl0PhlRIDXtGg4lHhWnuaWcbLmGtv8mmN4i+wD
         yJuEVcNxl5/9hwD+E+l6QXSa01GA0ojk1miwdhgPCBNPVwtZuQ5zoZUzykiy1yX07c6S
         A0qiCPmQHwrRAbuOPgSTtQN4PIP982/0jb4RRQizgcezmNr+pN0zpXrBQ4Zgf9mvZ1l8
         4coYAi9NcG8vCE8psdLLxpTVP2M14JuSe62kXwK0h1A0qkY54QMeAAxaz/DNa0q7eNta
         9qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867432; x=1739472232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFA9qOaY71BOcek5hdgFiWKU2Bfr/7aGqTCBHcoc0kk=;
        b=Bx45B0Q11tAVzjy22S7F7+vENlyQlJ515Fr6KHweDyTgCpd33ubx4XhCZWUUN2bHHg
         8J//ClhayOrS2/m7V7Sln0IJttL3pRgAUJMjpbhB8srqzAjixmiiToIId4wEQa6KYqNh
         B3e5V+LnWUFOdgbHM2ZuAv5IW2XO9DGUY2L2bJieF43be1cGtq4SsVCxfUugoJbKqK8k
         5R+IOCqdy9uPyWqRcdI3r6cL/2uN+Ki8HndpXdetEP+egvw3zGZyQ3N4J5E6cwquX4Lo
         uZxH4QfyrRhWxtpx7gixTaaLjiRTGiQZ5F0OIxcTt06wJLv8WFnn5GdMDvdpdiK0Lc2n
         WExg==
X-Forwarded-Encrypted: i=1; AJvYcCUr1Kok7xXF7yL5q+WzaSDaiVyPHH5ckJDv8jjzxiuPLEQ0Rszvsxf4k2E8ksG4h7xwkfwTeH6BOjMc@vger.kernel.org, AJvYcCWLId63SCKbwkkeJ3r4iFOAzmI3pObkvdsw5HX1/PokeWx/08JsN9gyw0vn58fOhirlksEwz7FtehCxxao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyVTnxx5l6yTv9d5IdvdaK+sD5sgJFXz5zHB0HVOCiCQV8lF7/
	Yf0CpscPSyxnTx/7u6dPpHF7DRPfE2sm7KOayWEbqwi657RL9ruT
X-Gm-Gg: ASbGncvwIOvuAN3YFaWDcoWEyNDjbeMOtIibJ1jZDk/bbyv63+Is6MqQUAoGSXj8yC6
	4i3jL6jwShWkaUBVKuBTxVTS9kxRBWN3TDrd9DQebD685dZ7Wwavv8VX9cLZMf2U8KaNl+tAXUq
	z4nKserct3gRKyDVtDKY7hls1F8AjEw5uz6ZxOfF1w20jAbs+6FzYH9mttEN4+VH/s5mZyfeRPG
	GiWUa3+iFQgfyzRcamhrI7mMw+LcH4zRp+2X6BfcjYLG4Xi40NsgPIOEsJ5rCLgLMRgkcSoIv0P
	Hj+dcyaOLiSQ8Bnmwna3axFjutFVOpMD8YlYovuKAcpSvbwGOljAdw==
X-Google-Smtp-Source: AGHT+IE8LUXMLZqdJRWc48WAB7tbm6lC5bs6E4JOo8NRynxyWirg2c83zxd/OBPLKKRhUSlVeLd5OA==
X-Received: by 2002:ac2:4c56:0:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-54405a68ac9mr3177400e87.43.1738867431171;
        Thu, 06 Feb 2025 10:43:51 -0800 (PST)
Received: from fedora.. (broadband-5-228-116-177.ip.moscow.rt.ru. [5.228.116.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f31b8sm198394e87.204.2025.02.06.10.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:43:50 -0800 (PST)
From: Fedor Pchelkin <boddah8794@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Cc: Fedor Pchelkin <boddah8794@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson@squebb.ca>
Subject: [PATCH RFC 0/2] usb: typec: ucsi: avoid problems during initial PPM reset
Date: Thu,  6 Feb 2025 21:43:13 +0300
Message-ID: <20250206184327.16308-1-boddah8794@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch of the series is intended to fix a "WARNING in
ucsi_reset_ppm()" reported in mailing lists [1], in bugzilla [2] and
distro-specific bug-trackers [3]. I've got the same splat rather
frequently occuring on my system so took the patch [4] proposed by
Christian for testing.

The second patch is all about timeout issues during the initial PPM reset
attempt which I observe every time booting my Lenovo laptop (I'm not an
active UCSI user so didn't pay attention to them before but saw this
problem while poking around with the patch for WARNING). The timeout issue
is not a recent regression and it is reproduced on my laptop back to v5.12
at least. That said, this timeout also sometimes leads to the WARNING in
question because it is used for polling the CCI value there as well.

Decided to post the patch series as it actually solves the whole problem
for me. But the nature of timeout is still not quite clear - thus RFC and
I hope it would be an effective way for further discussion of the problems
or maybe just taking the patches as is. For the timeout one I'm still
under impression that it may be a firmware bug or some hidden driver
problem but TBH I'm not aware of how to check that (it occurs only during
the boot phase).

And I don't see anything suspicious in the relevant part of the ACPI dump.
It is at the bottom of this cover-letter.

[1]: https://lore.kernel.org/linux-usb/Z18hJM55ED2hYJ6D@lappy/
[2]: https://bugzilla.kernel.org/show_bug.cgi?id=219590
[3]: https://retrace.fedoraproject.org/faf/reports/1113325/
[4]: https://lore.kernel.org/linux-usb/Z2Cf1AI8CXao5ZAn@cae.in-ulm.de/

The laptop info.
Machine:
  Type: Laptop System: LENOVO product: 21D0 v: ThinkBook 14 G4+ ARA
    serial: <superuser required>
  Mobo: LENOVO model: LNVNB161216 v: SDK0T76479 WIN
    serial: <superuser required> UEFI: LENOVO v: J6CN50WW date: 09/27/2024


    Scope (\_SB)
    {
        Device (UBTC)
        {
            Name (_HID, EisaId ("USBC000"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0CA0"))  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_DDN, "USB Type C")  // _DDN: DOS Device Name
            Name (_ADR, Zero)  // _ADR: Address
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PCI0.LPC0.EC0
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_PS0, 0, Serialized)  // _PS0: Power State 0
            {
                Sleep (0x07D0)
            }

            Method (_PS3, 0, Serialized)  // _PS3: Power State 3
            {
                Sleep (0x07D0)
            }

            Method (TPLD, 2, Serialized)
            {
                Name (PCKG, Package (0x01)
                {
                    Buffer (0x10){}
                })
                CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
                REV = One
                CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
                VISI = Arg0
                CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
                GPOS = Arg1
                CreateField (DerefOf (PCKG [Zero]), 0x4A, 0x04, SHAP)
                SHAP = One
                CreateField (DerefOf (PCKG [Zero]), 0x20, 0x10, WID)
                WID = 0x08
                CreateField (DerefOf (PCKG [Zero]), 0x30, 0x10, HGT)
                HGT = 0x03
                Return (PCKG) /* \_SB_.UBTC.TPLD.PCKG */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x7AF66000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.UBTC._CRS.RBUF */
            }

            Device (HSP1)
            {
                Name (_ADR, One)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0x09, 
                    Zero, 
                    Zero
                })
                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                {
                    Return (TPLD (One, 0x04))
                }
            }

            Device (HSP2)
            {
                Name (_ADR, One)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0x09, 
                    Zero, 
                    Zero
                })
                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                {
                    Return (TPLD (One, 0x04))
                }
            }

            OperationRegion (USBC, SystemMemory, 0x7AF66000, 0x30)
            Field (USBC, ByteAcc, Lock, Preserve)
            {
                VER1,   8, 
                VER2,   8, 
                RSV1,   8, 
                RSV2,   8, 
                CCI0,   8, 
                CCI1,   8, 
                CCI2,   8, 
                CCI3,   8, 
                CTL0,   8, 
                CTL1,   8, 
                CTL2,   8, 
                CTL3,   8, 
                CTL4,   8, 
                CTL5,   8, 
                CTL6,   8, 
                CTL7,   8, 
                MGI0,   8, 
                MGI1,   8, 
                MGI2,   8, 
                MGI3,   8, 
                MGI4,   8, 
                MGI5,   8, 
                MGI6,   8, 
                MGI7,   8, 
                MGI8,   8, 
                MGI9,   8, 
                MGIA,   8, 
                MGIB,   8, 
                MGIC,   8, 
                MGID,   8, 
                MGIE,   8, 
                MGIF,   8, 
                MGO0,   8, 
                MGO1,   8, 
                MGO2,   8, 
                MGO3,   8, 
                MGO4,   8, 
                MGO5,   8, 
                MGO6,   8, 
                MGO7,   8, 
                MGO8,   8, 
                MGO9,   8, 
                MGOA,   8, 
                MGOB,   8, 
                MGOC,   8, 
                MGOD,   8, 
                MGOE,   8, 
                MGOF,   8
            }

            OperationRegion (DBG0, SystemIO, 0x80, One)
            Field (DBG0, ByteAcc, NoLock, Preserve)
            {
                IO80,   8
            }

            Method (NTFY, 0, Serialized)
            {
                ECRD ()
                Sleep (One)
                Notify (\_SB.UBTC, 0x80) // Status Change
            }

            Method (ECWR, 0, Serialized)
            {
                IO80 = 0xA0
                \_SB.PCI0.LPC0.EC0.ECWT (MGO0, RefOf (\_SB.PCI0.LPC0.EC0.MGO0))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO1, RefOf (\_SB.PCI0.LPC0.EC0.MGO1))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO2, RefOf (\_SB.PCI0.LPC0.EC0.MGO2))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO3, RefOf (\_SB.PCI0.LPC0.EC0.MGO3))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO4, RefOf (\_SB.PCI0.LPC0.EC0.MGO4))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO5, RefOf (\_SB.PCI0.LPC0.EC0.MGO5))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO6, RefOf (\_SB.PCI0.LPC0.EC0.MGO6))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO7, RefOf (\_SB.PCI0.LPC0.EC0.MGO7))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO8, RefOf (\_SB.PCI0.LPC0.EC0.MGO8))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO9, RefOf (\_SB.PCI0.LPC0.EC0.MGO9))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOA, RefOf (\_SB.PCI0.LPC0.EC0.MGOA))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOB, RefOf (\_SB.PCI0.LPC0.EC0.MGOB))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOC, RefOf (\_SB.PCI0.LPC0.EC0.MGOC))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOD, RefOf (\_SB.PCI0.LPC0.EC0.MGOD))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOE, RefOf (\_SB.PCI0.LPC0.EC0.MGOE))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOF, RefOf (\_SB.PCI0.LPC0.EC0.MGOF))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL0, RefOf (\_SB.PCI0.LPC0.EC0.CTL0))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL1, RefOf (\_SB.PCI0.LPC0.EC0.CTL1))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL2, RefOf (\_SB.PCI0.LPC0.EC0.CTL2))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL3, RefOf (\_SB.PCI0.LPC0.EC0.CTL3))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL4, RefOf (\_SB.PCI0.LPC0.EC0.CTL4))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL5, RefOf (\_SB.PCI0.LPC0.EC0.CTL5))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL6, RefOf (\_SB.PCI0.LPC0.EC0.CTL6))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL7, RefOf (\_SB.PCI0.LPC0.EC0.CTL7))
                \_SB.PCI0.LPC0.EC0.ECWT (0xE0, RefOf (\_SB.PCI0.LPC0.EC0.USDC))
                IO80 = 0xA1
            }

            Method (ECRD, 0, Serialized)
            {
                IO80 = 0xA3
                MGI0 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI0))
                MGI1 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI1))
                MGI2 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI2))
                MGI3 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI3))
                MGI4 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI4))
                MGI5 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI5))
                MGI6 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI6))
                MGI7 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI7))
                MGI8 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI8))
                MGI9 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGI9))
                MGIA = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGIA))
                MGIB = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGIB))
                MGIC = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGIC))
                MGID = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGID))
                MGIE = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGIE))
                MGIF = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.MGIF))
                VER1 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.VER1))
                VER2 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.VER2))
                RSV1 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.RSV1))
                RSV2 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.RSV2))
                CCI0 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.CCI0))
                CCI1 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.CCI1))
                CCI2 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.CCI2))
                CCI3 = \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0.CCI3))
                \_SB.PCI0.LPC0.EC0.ECWT (0xE1, RefOf (\_SB.PCI0.LPC0.EC0.USGC))
                IO80 = 0xA4
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
                {
                    If ((ToInteger (Arg2) == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x0F                                             // .
                        })
                    }
                    ElseIf ((ToInteger (Arg2) == One))
                    {
                        ECWR ()
                    }
                    ElseIf ((ToInteger (Arg2) == 0x02))
                    {
                        ECRD ()
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Return (Zero)
            }
        }
    }

Christian A. Ehrhardt (1):
  acpi: typec: ucsi: Introduce a ->poll_cci method

Fedor Pchelkin (1):
  usb: typec: ucsi: increase timeout for PPM reset operations

 drivers/usb/typec/ucsi/ucsi.c           | 12 ++++++------
 drivers/usb/typec/ucsi/ucsi.h           |  2 ++
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 21 ++++++++++++++-------
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  1 +
 drivers/usb/typec/ucsi/ucsi_glink.c     |  1 +
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   |  1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  1 +
 7 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.48.1

