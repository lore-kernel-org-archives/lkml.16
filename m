Received: from m239-7.eu.mailgun.net (m239-7.eu.mailgun.net [185.250.239.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA731C1F0C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.239.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745135144; cv=none; b=FGfBiJl9cr8qbxe6RoO9W/kmvfvT7njMjmr392XGDnZgaeaG2dSDH9NtZHRZGTIzTfXWzUHBmR5XFwb0Xc/tb4XM9PSnRWFxyd4/0DdpDPLGFmE66asdXjTDxuuqSSYzByj88NzMNBth/e5sOYmbDrOgQDCqI/5Mms6Uca40g1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745135144; c=relaxed/simple;
	bh=BkudVnTAnNC/V6WNtP7NAWkhu59T0YQbYmSZiw0Adb8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Gb1oC9MuHcO4F9A3UhFUCtwRSZNYzsHgaQy8TPwk/2CJkElxT2ry/K4zFOpk/cmV80s9zBWCHur8oVTr4x+B6nfdA9d8RsBwH68A2LzJCOoc+eSyKV0nJ4u5FBmnibqoeVxd6Hf+PWNzfCiwwXiURabmzGaNnUIBXFf6S/fs6Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hewittfamily.org.uk; spf=pass smtp.mailfrom=hewittfamily.org.uk; dkim=pass (2048-bit key) header.d=hewittfamily.org.uk header.i=@hewittfamily.org.uk header.b=UjJsCs19; arc=none smtp.client-ip=185.250.239.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hewittfamily.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hewittfamily.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hewittfamily.org.uk header.i=@hewittfamily.org.uk header.b="UjJsCs19"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=hewittfamily.org.uk; q=dns/txt; s=s1; t=1745135140; x=1745142340;
 h=To: To: References: Message-Id: Content-Transfer-Encoding: Cc: Date: In-Reply-To: From: From: Subject: Subject: Mime-Version: Content-Type: Sender: Sender;
 bh=AItcyn0Q5k6MSVPg2w1qZOZG10cgn3d5vIEn6SA5F+w=;
 b=UjJsCs194UstY1COTvnDtiVMN7vtRZNhF6ArAgRKpmEEH028TV7xS0ay6XJhs0yFNvMaMDh/gKIsh1gPr5rUqFF42KJW8mi09RVA1dRc/pBQuVFHCBYS+Cb6daDP05DCzlnC9FLDouBlxgc0/sFdCzOIVVQlusY8kV0on+opKjJjmTBOutCCpVF+585tZa03DEEQvBN/v2YVq6J0fxpJAkWJA4JRFo+kSZ3DSIXf/UcbSQy8mBaLwyivoue7Dn5iIoSMLoAVSLUFYypWse3YVIH8gMDF7uuqNegNIDAN4FjigHdoCtwd36EO3MIAoTdzyyMEtYpNpJ6Qh3Zg/PH83Q==
X-Mailgun-Sending-Ip: 185.250.239.7
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyIyNWUwNSIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCJlMzcyMCJd
Received: from mail.hewittfamily.org.uk (unknown [87.200.95.144]) by 16311eb4e9af with
 SMTP id 6804a62428d7c2ba46392bc6 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Sun, 20 Apr 2025 07:45:40 GMT
Sender: christian@hewittfamily.org.uk
Received: from smtpclient.apple (unknown [172.16.20.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.hewittfamily.org.uk (Postfix) with ESMTPSA id 4ZgLC51FmDz2Vymn;
	Sun, 20 Apr 2025 11:45:37 +0400 (+04)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/5] dts: amlogic: switch to the new PWM controller
 binding
From: Christian Hewitt <christian@hewittfamily.org.uk>
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
Date: Sun, 20 Apr 2025 11:45:20 +0400
Cc: linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 jbrunet@baylibre.com,
 neil.armstrong@linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A37D0CD-FD4F-445A-87F8-19D65CB7FDB9@hewittfamily.org.uk>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Synology-Spam-Flag: no
X-Synology-Virus-Status: no
X-Synology-Spam-Status: score=-0.091, required 5, FREEMAIL_ENVRCPT 0, FROM_HAS_DN 0, FROM_EQ_ENVFROM 0, SUSPICIOUS_RECIPS 2.51, __NOT_A_PERSON 0, TO_MATCH_ENVRCPT_ALL 0, BAYES_HAM -3, __INR_AND_NO_REF 0, __HDRS_LCASE_KNOWN 0, MIME_GOOD -0.1, MV_CASE 0.5, MID_RHS_MATCH_FROM 0, NO_RECEIVED -0.001, RCPT_COUNT_SEVEN 0, RCVD_COUNT_ZERO 0, TAGGED_RCPT 0, FREEMAIL_TO 0, __BODY_URI_ONLY 0, ARC_NA 0, TO_DN_SOME 0, MIME_TRACE 0, __THREADED 0, __NOT_SPOOFED 0

> On 28 Dec 2024, at 1:25=E2=80=AFam, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> This series switches all Amlogic SoCs to use the new PWM controller
> binding. The main benefits of the new binding are:
> - the pwm controller driver now picks the best possible clock to
>  achieve the most accurate pwm output
> - board.dts don't have to know about the pwm clock inputs anymore (as
>  the driver picks the best one automatically)
> - new SoCs only need a new compatible string but no pwm-meson driver
>  changes, assuming only the clock inputs differ from older IP
>  revisions
>=20
> This silences the following warning(s) at boot (for each pwm
> controller instance):
>  using obsolete compatible, please consider updating dt
>=20
> I have tested this on two devices:
> - meson8b: odroidc1 (boots fine and cycling through all CPU
>  frequencies and thus voltages works fine)
> - meson-sm1: x96-air-gbit (boots and the rtw8822cs SDIO card is
>  detected, so the 32kHz clock for the SDIO card works)
>=20
> Since I cannot test all devices I'm asking for this series to be
> applied so the Kernel CI board farm can help verify it works on all
> boards available there.

This series breaks Broadcom BT on the GXBB/GXM/G12B boards in my
current test rotation. I=E2=80=99m running Linux 6.14.2 with this series
backported for testing. This is generally what=E2=80=99s seen in dmesg:

VIM2:~ # dmesg | grep -i blue
[    8.659535] Bluetooth: Core ver 2.22
[    8.659681] NET: Registered PF_BLUETOOTH protocol family
[    8.659690] Bluetooth: HCI device and connection manager initialized
[    8.659712] Bluetooth: HCI socket layer initialized
[    8.659721] Bluetooth: L2CAP socket layer initialized
[    8.659742] Bluetooth: SCO socket layer initialized
[    8.724898] Bluetooth: HCI UART driver ver 2.3
[    8.724953] Bluetooth: HCI UART protocol H4 registered
[    8.725106] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    8.725434] Bluetooth: HCI UART protocol Broadcom registered
[    8.725502] Bluetooth: HCI UART protocol QCA registered
[    8.725559] Bluetooth: HCI UART protocol AML registered
[    8.966727] Bluetooth: hci0: Frame reassembly failed (-84)
[    8.966772] Bluetooth: hci0: Frame reassembly failed (-84)
[   11.148157] Bluetooth: hci0: command 0xfc18 tx timeout
[   11.148383] Bluetooth: hci0: BCM: failed to write update baudrate =
(-110)
[   11.148446] Bluetooth: hci0: Failed to set baudrate
[   13.281510] Bluetooth: hci0: command 0xfc18 tx timeout
[   13.281576] Bluetooth: hci0: BCM: Reset failed (-110)

This is also visible on a VIM3 board in kernelci (Linux 6.15.-rc2):

=
https://dashboard.kernelci.org/test/maestro%3A67fd3cda3328e043e96da230?l=3D=
true

[ 3.954267] Bluetooth: hci0: Frame reassembly failed (-84)
[ 4.040555] Bluetooth: hci0: Frame reassembly failed (-84)

(linux-firmware and thus kernelci is lacking Broadcom BT firmwares so
later messages that result from trying to load fw aren=E2=80=99t seen)

With the series reverted:

VIM2:~ # dmesg | grep -i blue
[    8.452570] Bluetooth: Core ver 2.22
[    8.452695] NET: Registered PF_BLUETOOTH protocol family
[    8.452703] Bluetooth: HCI device and connection manager initialized
[    8.452724] Bluetooth: HCI socket layer initialized
[    8.452735] Bluetooth: L2CAP socket layer initialized
[    8.452752] Bluetooth: SCO socket layer initialized
[    8.530077] Bluetooth: HCI UART driver ver 2.3
[    8.530113] Bluetooth: HCI UART protocol H4 registered
[    8.530387] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    8.530902] Bluetooth: HCI UART protocol Broadcom registered
[    8.530983] Bluetooth: HCI UART protocol QCA registered
[    8.531037] Bluetooth: HCI UART protocol AML registered
[    8.917685] Bluetooth: hci0: BCM: chip id 101
[    8.918000] Bluetooth: hci0: BCM: features 0x2f
[    8.919526] Bluetooth: hci0: BCM4354A2
[    8.919560] Bluetooth: hci0: BCM4356A2 (001.003.015) build 0000
[    8.941837] Bluetooth: hci0: BCM4356A2 'brcm/BCM4356A2.hcd' Patch
[    9.831321] Bluetooth: hci0: BCM: features 0x2f
[    9.832884] Bluetooth: hci0: BCM4356 37.4MHz AMPAK AP6356-0055
[    9.832902] Bluetooth: hci0: BCM4356A2 (001.003.015) build 0266
[    9.856044] Bluetooth: MGMT ver 1.23

An SML544TW board (S905D) with a QCA9377 chip is not affected by the
changes so the scope appears to be limited to Broadcom BT.

I=E2=80=99ve also noticed that VIM3 and the SML5442TW have device-tree =
items
like max-speed, clocks, clock-names defined, but adding these to e.g.
a WeTek Play2 board or removing from VIM3 doesn=E2=80=99t change =
anything.

Christian

