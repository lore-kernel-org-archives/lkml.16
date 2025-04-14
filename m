Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09A519F130;
	Mon, 14 Apr 2025 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649706; cv=none; b=Ai3P225ksUePnJIWI1kXQMIo8CaLG0WOs5UpcBs3ole3prqXWgOTwoyL6m7Kykt6NnyjO0tZi4RWXr0eXXCUa7SXjy8pId4AFX6JuRMrh3OxbMywd0TtSnIxrbYzOiKowUhXPFdqmDHHRtQ7jlX9gZYb9cQ+HZKJPw11TvgU30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649706; c=relaxed/simple;
	bh=ZY843y8r7FkKDxZ3LXY9PDcDmWSaRKZYXZmCMZjQnd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LgY+QBbdKsPgNV3HV3wytgBXeOFJ0xTRmPCsfmk5HoqnEJket36kQBcW6Tya4JV/r3K8TLdwMQPtPtfcXb+1zYM1+2BoJVu21i6nb3NmZCVKrzBAH+SKVTnN+zA1MJ2N7jEHnQeB3i/+r/j2BWPEpACDi55ejrxNxvKCWzAOP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZIG4agDJ; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZIG4agDJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D11F43AF0;
	Mon, 14 Apr 2025 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744649701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=42t/2/QY6y41gKecCEXacZfooM3QKM6eiym303yETDg=;
	b=ZIG4agDJ3kRw+jCcVsyRWc4rHtC2Ir0hItngUSWFtYx17MR5Sw2S3Z2dajWQ/WveU3Lpht
	53gm/fnA6bhDXKT3Dq0/v3dIyguGDkpe3zrZp4MGNb2SbIayZ03efoyf7rlsa7jPYIzuMU
	9/pn5772cl9l8I7jXz2V2n2RNrdZmDBBvOTkztCxneTOu4BmCIZUnpFMSd8W7Tfo9ruv4I
	xygtHeBcgvlzoZbg9jkOFO0HhdqZMyUIVnTHRR0jQQtTdjS9050ymYJLHWYXYbjJyBgXdG
	oNkHgeQXeeHFPOgdzOEE/qPWievOLWPu083EIaC5zHuuNEEXQAHk7QFAoyt5zA==
Date: Mon, 14 Apr 2025 18:54:58 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Stefan Wahren <wahrenst@gmx.net>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
Subject: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Message-ID: <20250414185458.7767aabc@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhoofggtgfgsehtqhertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeljedthfeggefgteejvdeugefgtdegieegudduveekjefhhfekgeevfedtjeefnecuffhomhgrihhnpehrrggugigrrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehhmhhinhgrshesshihnhhophhshihsrdgtohhmpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhin
 hhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifrghhrhgvnhhsthesghhmgidrnhgvthdprhgtphhtthhopehfrggsrhhitggvrdhgrghsnhhivghrsehfohhsshdrshhtrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Minas, Kever, linux-usb, recent dwc2 driver contributors,

I am facing an unexpected behavior (apparently a bug) with a dwc2
controller in gadget mode, using a mainline kernel: the gadget device is
enumerated normally but then disappears and gets re-enumerated about 6
seconds after the initial enumeration, for no apparent reason. Here are
the details.

Testing setup:

SoC:             Rockchip RK3308
Board:           Rock Pi S [1]
USB controller:  rockchip,rk3308-usb, snps,dwc2 [2]
Controller mode: device only (dr_mode =3D "peripheral") [3]
Tested kernels:
 - v6.15-rc2
 - v6.14.1
 - v6.12.20
 - v6.6.87
 - v6.1.134
 - v5.15.180
Device tree:     upstream Rock Pi S dts [4]
Kernel config:   ARM64 defconfig

Hardware setup: USB A-C cable connected from PC A port to the C
connector on the Rock Pi S board. This cable provides board power as
well as the connection between the host and the gadget.

Behavior:
 1. boot board normally
 2. optionally wait some time
 3. run script to start a CDC serial gadget [5]
 4. after about 0.6 seconds the ttyGS0 serial device is present and
    working, and so is ttyACM0 on the host: so far all good
 5. after about 6 seconds the dwc2 controller receives some
    interrupts and starts a new enumeration sequence

This is what the kernel logs:

[   20.105688] dwc2 ff400000.usb: bound driver configfs-gadget.g1
[   20.285431] dwc2 ff400000.usb: new device is high-speed
[   20.373455] dwc2 ff400000.usb: new device is high-speed
[   20.426496] dwc2 ff400000.usb: new address 28
[   26.688388] dwc2 ff400000.usb: new device is high-speed
[   26.775363] dwc2 ff400000.usb: new device is high-speed
[   26.836880] dwc2 ff400000.usb: new address 29

Here is a side-by-side log of host and device, synced manually using
a video capture (sorry about the long lines, can't do without):

    *** HOST ***                                                           =
                           *** DEVICE ***
                                                                           =
                      <<< Last line of the script: 'echo ff400000.usb > UDC=
' >>>
                                                                           =
                      [   14.281350] dwc2 ff400000.usb: bound driver config=
fs-gadget.g1
                                                                           =
                      [   14.482332] dwc2 ff400000.usb: new device is high-=
speed
[108204.084049] usb 3-2: new high-speed USB device number 39 using xhci_hcd
                                                                           =
                      [   14.675692] dwc2 ff400000.usb: new device is high-=
speed
[108204.274639] usb 3-2: New USB device found, idVendor=3D1209, idProduct=
=3D0001, bcdDevice=3D 1.00    [   14.737395] dwc2 ff400000.usb: new address=
 44
[108204.274652] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D3
[108204.274656] usb 3-2: Product: ...
[108204.274659] usb 3-2: Manufacturer: ...
[108204.274662] usb 3-2: SerialNumber: 12345678
[108204.282555] cdc_acm 3-2:1.0: ttyACM0: USB ACM device
                                                            (...nothing hap=
pens for about 6 seconds...)
[108209.972180] usb 3-2: USB disconnect, device number 39
                                                                           =
                      [   20.766950] dwc2 ff400000.usb: new device is high-=
speed
[108210.339297] usb 3-2: new high-speed USB device number 40 using xhci_hcd
                                                                           =
                      [   20.960375] dwc2 ff400000.usb: new device is high-=
speed
[108210.739738] usb 3-2: New USB device found, idVendor=3D1209, idProduct=
=3D0001, bcdDevice=3D 1.00    [   21.200670] dwc2 ff400000.usb: new address=
 45
[108210.739750] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D3
[108210.739753] usb 3-2: Product: ...
[108210.739756] usb 3-2: Manufacturer: ...
[108210.739758] usb 3-2: SerialNumber: 12345678
[108210.747084] cdc_acm 3-2:1.0: ttyACM0: USB ACM device

Note: the device address is different on the host and the target. Is
this expected?

In the driver there are 2 interrupt handlers involved:
 - dwc2_handle_common_intr in core_intr.c for the common events
 - dwc2_hsotg_irq in gadget.c for gadget events

They share the same interrupt number, which AFAICU is because they
actually read different bits from the same GINTSTS register.

I enabled DEBUG in the dwc2 driver and captured the initial events
logged after the ~6 seconds pause, i.e. where the 2nd enumeration
starts. Here they are with some annotations:

 1. first interrupt after the ~6 s break:
    - dwc2_handle_common_intr finds no bits high
    - dwc2_hsotg_irq finds one (early suspend bit):
       [   46.203094] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008428 00000400 =
(d88c3cc4) retry 8
       [   46.204060] dwc2 ff400000.usb: GINTSTS_ErlySusp

 2. second interrupt
    - dwc2_handle_common_intr finds one bits high (suspend):
       [   46.206807] dwc2 ff400000.usb: USB SUSPEND
       [   46.206824] dwc2 ff400000.usb: dwc2_handle_usb_suspend_intr: DSTS=
=3D0x502a01
       [   46.206842] dwc2 ff400000.usb: DSTS.Suspend Status=3D1 HWCFG4.Pow=
er Optimize=3D1 HWCFG4.Hibernation=3D0
       [   46.206872] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008028 00000000 =
(d88c3cc4) retry 8     =20
    - dwc2_hsotg_irq finds no bits high

 3. third interrupt
    - dwc2_handle_common_intr finds no bits high
    - dwc2_hsotg_irq finds two (reset detected + USB reset):
       [   46.437109] dwc2 ff400000.usb: dwc2_hsotg_irq: 04809028 00801000 =
(d88c3cc4) retry 8
       [   46.437607] dwc2 ff400000.usb: dwc2_hsotg_irq: USBRstDet
       [   46.437630] dwc2 ff400000.usb: dwc2_hsotg_irq: USBRst
       [   46.437649] dwc2 ff400000.usb: GNPTXSTS=3D00080010
       [   46.437673] dwc2 ff400000.usb: complete: ep 00000000dab859c8 ep0,=
 req 000000009cb97255, -108 =3D> 00000000acdb2ee9
       [   46.437719] dwc2 ff400000.usb: dwc2_hsotg_complete_setup: failed =
-108
       [   46.437765] dwc2 ff400000.usb: dwc2_hsotg_ep_disable(ep 00000000c=
f8cf06f)
       [   46.437790] dwc2 ff400000.usb: dwc2_hsotg_ep_disable: DxEPCTL=3D0=
x08080200
       ...

=46rom now on the log appears as a normal enumeration process.

I'm stuck at a dead end, trying to understand what may be triggering the
second enumeration.

Some more facts:

 * the 2nd enumeration happens always
 * there is never a 3rd enumeration
 * the ~6 seconds delay is always between 5 and 6.5 seconds
 * no relevant kernel activity is logged during the 6 seconds, except
   for some OPP changes; disabling CONFIG_CPU_IDLE and CONFIG_CPU_FREQ
   the OPP changes disappear but USB behaves like before
 * happens (with same delay) if after the 1st enumeration the USB
   serial is opened and kept in use
 * happens even if using a different device class (tried 0x8, 0x2)
 * happens even using g_mass_storage or g_zero instead of libcomposite
   (but with g_zero it happens when the g_zero module is loaded,
   without any configfs configuration)
 * tried different cables, no change
 * there is no evidence of power glitches
 * happens also on a custom hardware which is self-powered
 * happens with different hosts: two different PCs, one running Linux
   and one running Windows
 * to be double checked: does not happen if the host is an Android phone
   (but I haven't gone into the details of what happens with that setup)

So I'm looking for any hints or directions for further investigation.
Any input would be very appreciated.

Thanks in advance!

Luca

[1] https://wiki.radxa.com/RockpiS
[2]
https://elixir.bootlin.com/linux/v6.13.7/source/arch/arm64/boot/dts/rockchi=
p/rk3308.dtsi#L696-L710
[3]
https://elixir.bootlin.com/linux/v6.13.7/source/arch/arm64/boot/dts/rockchi=
p/rk3308-rock-pi-s.dts#L383=20
[4]
https://elixir.bootlin.com/linux/v6.13.7/source/arch/arm64/boot/dts/rockchi=
p/rk3308-rock-pi-s.dts

[5] Script used to configure the gadget serial:

------------------------8<------------------------

#!/bin/sh

set -eu

modprobe libcomposite

mount -t configfs none /sys/kernel/config

mkdir -p "/sys/kernel/config/usb_gadget/g1"
cd "/sys/kernel/config/usb_gadget/g1"

echo 0x0200 > bcdUSB
echo 0x0100 > bcdDevice
echo 0x1209 > idVendor
echo 0x0001 > idProduct
echo 0x02   > bDeviceClass=20
echo 0x00   > bDeviceSubClass=20
echo 0x00   > bDeviceProtocol=20

mkdir -p strings/0x409
echo 12345678 > strings/0x409/serialnumber
echo "ACME"   > strings/0x409/manufacturer
echo "foobar" > strings/0x409/product

# create the configuration
mkdir -p configs/c.1
mkdir -p configs/c.1/strings/0x409
echo "foobar Config" > configs/c.1/strings/0x409/configuration
echo 500 > configs/c.1/MaxPower

# create the function
mkdir functions/acm.0

# associate the function with the configuration
ln -s functions/acm.0 configs/c.1

# enable the gadget using rock pi s UDC controller name (from /sys/class/ud=
c/)
echo ff400000.usb > UDC

------------------------8<------------------------

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
