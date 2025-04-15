Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2A156228;
	Tue, 15 Apr 2025 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727313; cv=none; b=gr+bW/2Cvj5joW5AnpQ5CpQCECEzpzYajyn5kUfc/gyQvcjNgMU015enmanGFdV9GSZqiqCReNz4shDZ6ZibcphoJLKH96VLF3Wf6FAGLh0p/6QPL4hzUH1xinfCLAD32CJBD3a8ZQpAFZceYoj3INonbweGz3aR3lzlwSeqs3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727313; c=relaxed/simple;
	bh=KkAGQwGo6/EH93I+dCXETFLuiR6d1fuMAbfIXnB9df4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y9HsaEtZJncDIvr2TxjaTl1rVcL9lCQUaQWAufiU4RrXe636c+Wu4DXt6XWose1z66/VfMb4Ie9blohyukEJWrogvxIOw17XJyhk00fcFpm7msjxfB2hMQUxfQcktG8lmnF3rikxOWfShk7QRBYVJY6BJlLesTdXgx/bxpeaSo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yicbgad0; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yicbgad0"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E68A3439A6;
	Tue, 15 Apr 2025 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744727308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ti2sTCCsvm233a+9ILNMwX+EwXdouQpWXGc/eSqDsgc=;
	b=Yicbgad0HOvVWKM1c//yNB67qQxurstRpDeqDnZFQ1WGE+ZAEk8cuIt9C2VdG0PIGCgXoC
	cmZ1cDGOuDVG308njRX4MMZvUpKDIiLaqtRxY+FzdExl0iDA19VD7RRqkr9w9kAzz5jMfr
	W/mpNZ/+vRJ8xqITz2jYCpS/ZLzy+a6g4juJ1Bar8z3XslKTjuq/vqCxsumGksewLE2q87
	r5lUPGd4g/817E9clbFDYkIPEtqf4fdhr4peZkNJkgu6txMtDoI57279YRnK2aaE1KHgGt
	hJWbMO5dKUfbU4n41r0Yo4VR7qMmEZD3eNtw6iCwJ2cWVmSncjESaSSs902W4A==
Date: Tue, 15 Apr 2025 16:28:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, Kever Yang <kever.yang@rock-chips.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Stefan Wahren <wahrenst@gmx.net>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Message-ID: <20250415162825.083f351c@booty>
In-Reply-To: <cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
References: <20250414185458.7767aabc@booty>
	<a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
	<cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepofhinhgrshdrjfgrrhhuthihuhhnhigrnhesshihnhhophhshihsrdgtohhmpdhrtghpthhtohepshhtvghrnhesrhhofihlrghnugdrhhgrrhhvrghrugdrvgguuhdprhgtphhtthhopehlihhnuhigq
 dhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvhgvrhdrhigrnhhgsehrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Alan, Minas,

thanks for the prompt feedback! See below my comments.

On Tue, 15 Apr 2025 11:26:55 +0000
Minas Harutyunyan <Minas.Harutyunyan@synopsys.com> wrote:

> Hi Luca,
> 
> On 4/14/25 21:26, Alan Stern wrote:
> > On Mon, Apr 14, 2025 at 06:54:58PM +0200, Luca Ceresoli wrote:  
> >> Hello Minas, Kever, linux-usb, recent dwc2 driver contributors,
> >>
> >> I am facing an unexpected behavior (apparently a bug) with a dwc2
> >> controller in gadget mode, using a mainline kernel: the gadget device is
> >> enumerated normally but then disappears and gets re-enumerated about 6
> >> seconds after the initial enumeration, for no apparent reason. Here are
> >> the details.
> >>
> >> Testing setup:
> >>
> >> SoC:             Rockchip RK3308
> >> Board:           Rock Pi S [1]
> >> USB controller:  rockchip,rk3308-usb, snps,dwc2 [2]
> >> Controller mode: device only (dr_mode = "peripheral") [3]
> >> Tested kernels:
> >>   - v6.15-rc2
> >>   - v6.14.1
> >>   - v6.12.20
> >>   - v6.6.87
> >>   - v6.1.134
> >>   - v5.15.180
> >> Device tree:     upstream Rock Pi S dts [4]
> >> Kernel config:   ARM64 defconfig
> >>
> >> Hardware setup: USB A-C cable connected from PC A port to the C
> >> connector on the Rock Pi S board. This cable provides board power as
> >> well as the connection between the host and the gadget.
> >>
> >> Behavior:
> >>   1. boot board normally
> >>   2. optionally wait some time
> >>   3. run script to start a CDC serial gadget [5]
> >>   4. after about 0.6 seconds the ttyGS0 serial device is present and
> >>      working, and so is ttyACM0 on the host: so far all good
> >>   5. after about 6 seconds the dwc2 controller receives some
> >>      interrupts and starts a new enumeration sequence
> >>
> >> This is what the kernel logs:
> >>
> >> [   20.105688] dwc2 ff400000.usb: bound driver configfs-gadget.g1
> >> [   20.285431] dwc2 ff400000.usb: new device is high-speed
> >> [   20.373455] dwc2 ff400000.usb: new device is high-speed
> >> [   20.426496] dwc2 ff400000.usb: new address 28
> >> [   26.688388] dwc2 ff400000.usb: new device is high-speed
> >> [   26.775363] dwc2 ff400000.usb: new device is high-speed
> >> [   26.836880] dwc2 ff400000.usb: new address 29
> >>
> >> Here is a side-by-side log of host and device, synced manually using
> >> a video capture (sorry about the long lines, can't do without):
> >>
> >>      *** HOST ***                                                                                      *** DEVICE ***
> >>                                                                                                   <<< Last line of the script: 'echo ff400000.usb > UDC' >>>
> >>                                                                                                   [   14.281350] dwc2 ff400000.usb: bound driver configfs-gadget.g1
> >>                                                                                                   [   14.482332] dwc2 ff400000.usb: new device is high-speed
> >> [108204.084049] usb 3-2: new high-speed USB device number 39 using xhci_hcd
> >>                                                                                                   [   14.675692] dwc2 ff400000.usb: new device is high-speed
> >> [108204.274639] usb 3-2: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00    [   14.737395] dwc2 ff400000.usb: new address 44
> >> [108204.274652] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> >> [108204.274656] usb 3-2: Product: ...
> >> [108204.274659] usb 3-2: Manufacturer: ...
> >> [108204.274662] usb 3-2: SerialNumber: 12345678
> >> [108204.282555] cdc_acm 3-2:1.0: ttyACM0: USB ACM device
> >>                                                              (...nothing happens for about 6 seconds...)
> >> [108209.972180] usb 3-2: USB disconnect, device number 39
> >>                                                                                                   [   20.766950] dwc2 ff400000.usb: new device is high-speed
> >> [108210.339297] usb 3-2: new high-speed USB device number 40 using xhci_hcd
> >>                                                                                                   [   20.960375] dwc2 ff400000.usb: new device is high-speed
> >> [108210.739738] usb 3-2: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00    [   21.200670] dwc2 ff400000.usb: new address 45
> >> [108210.739750] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> >> [108210.739753] usb 3-2: Product: ...
> >> [108210.739756] usb 3-2: Manufacturer: ...
> >> [108210.739758] usb 3-2: SerialNumber: 12345678
> >> [108210.747084] cdc_acm 3-2:1.0: ttyACM0: USB ACM device
> >>
> >> Note: the device address is different on the host and the target. Is
> >> this expected?  
> > 
> > The value on the host side is a device number, not a device address.
> > Device numbers are assigned sequentially by the kernel, whereas
> > addresses are assigned automatically by the xHCI hardware without
> > software intervention.
> > 
> > For non-xHCI controllers the two are the same, but not with xHCI.

I see, that clarifies!

> >> In the driver there are 2 interrupt handlers involved:
> >>   - dwc2_handle_common_intr in core_intr.c for the common events
> >>   - dwc2_hsotg_irq in gadget.c for gadget events
> >>
> >> They share the same interrupt number, which AFAICU is because they
> >> actually read different bits from the same GINTSTS register.
> >>
> >> I enabled DEBUG in the dwc2 driver and captured the initial events
> >> logged after the ~6 seconds pause, i.e. where the 2nd enumeration
> >> starts. Here they are with some annotations:
> >>
> >>   1. first interrupt after the ~6 s break:
> >>      - dwc2_handle_common_intr finds no bits high
> >>      - dwc2_hsotg_irq finds one (early suspend bit):
> >>         [   46.203094] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008428 00000400 (d88c3cc4) retry 8
> >>         [   46.204060] dwc2 ff400000.usb: GINTSTS_ErlySusp
> >>
> >>   2. second interrupt
> >>      - dwc2_handle_common_intr finds one bits high (suspend):
> >>         [   46.206807] dwc2 ff400000.usb: USB SUSPEND
> >>         [   46.206824] dwc2 ff400000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x502a01
> >>         [   46.206842] dwc2 ff400000.usb: DSTS.Suspend Status=1 HWCFG4.Power Optimize=1 HWCFG4.Hibernation=0
> >>         [   46.206872] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008028 00000000 (d88c3cc4) retry 8
> >>      - dwc2_hsotg_irq finds no bits high
> >>
> >>   3. third interrupt
> >>      - dwc2_handle_common_intr finds no bits high
> >>      - dwc2_hsotg_irq finds two (reset detected + USB reset):
> >>         [   46.437109] dwc2 ff400000.usb: dwc2_hsotg_irq: 04809028 00801000 (d88c3cc4) retry 8
> >>         [   46.437607] dwc2 ff400000.usb: dwc2_hsotg_irq: USBRstDet
> >>         [   46.437630] dwc2 ff400000.usb: dwc2_hsotg_irq: USBRst
> >>         [   46.437649] dwc2 ff400000.usb: GNPTXSTS=00080010
> >>         [   46.437673] dwc2 ff400000.usb: complete: ep 00000000dab859c8 ep0, req 000000009cb97255, -108 => 00000000acdb2ee9
> >>         [   46.437719] dwc2 ff400000.usb: dwc2_hsotg_complete_setup: failed -108
> >>         [   46.437765] dwc2 ff400000.usb: dwc2_hsotg_ep_disable(ep 00000000cf8cf06f)
> >>         [   46.437790] dwc2 ff400000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08080200
> >>         ...
> >>
> >>  From now on the log appears as a normal enumeration process.
> >>
> >> I'm stuck at a dead end, trying to understand what may be triggering the
> >> second enumeration.  
> > 
> > You should enable host-side debugging before connecting the cable:
> > 
> > 	echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

Did that, and here is my host log:

### First enumeration starts

[105021.069029] hub 3-3:1.0: state 7 ports 4 chg 0000 evt 0010
[105021.076825] usb 3-3-port4: status 0101, change 0001, 12 Mb/s
[105021.080244] usb 3-3-port4: indicator auto status 0
[105021.190710] usb 3-3-port4: debounce total 100ms stable 100ms status 0x101
[105021.286322] usb 3-3.4: new high-speed USB device number 87 using xhci_hcd
[105021.396995] usb 3-3.4: skipped 1 descriptor after configuration
[105021.397009] usb 3-3.4: skipped 4 descriptors after interface
[105021.398516] usb 3-3.4: default language 0x0409
[105021.403247] usb 3-3.4: udev 87, busnum 3, minor = 342
[105021.403257] usb 3-3.4: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00
[105021.403262] usb 3-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[105021.403265] usb 3-3.4: Product: foobar
[105021.403267] usb 3-3.4: Manufacturer: ACME
[105021.403269] usb 3-3.4: SerialNumber: 12345678
[105021.403762] usb 3-3.4: usb_probe_device
[105021.403768] usb 3-3.4: configuration #1 chosen from 1 choice
[105021.410537] usb 3-3.4: adding 3-3.4:1.0 (config #1, interface 0)
[105021.412201] cdc_acm 3-3.4:1.0: usb_probe_interface
[105021.412207] cdc_acm 3-3.4:1.0: usb_probe_interface - got id
[105021.413917] cdc_acm 3-3.4:1.0: ttyACM0: USB ACM device
[105021.413966] usb 3-3.4: adding 3-3.4:1.1 (config #1, interface 1)

### 6 seconds delay, second enumeration starts

[105027.468951] hub 3-3:1.0: state 7 ports 4 chg 0000 evt 0010
[105027.477656] usb 3-3-port4: status 0101, change 0001, 12 Mb/s
[105027.481091] usb 3-3-port4: indicator auto status 0
[105027.481116] usb 3-3.4: USB disconnect, device number 87
[105027.481123] usb 3-3.4: unregistering device
[105027.481128] usb 3-3.4: unregistering interface 3-3.4:1.0
[105027.481803] usb 3-3.4: unregistering interface 3-3.4:1.1
[105027.481899] usb 3-3.4: usb_disable_device nuking all URBs
[105027.591528] usb 3-3-port4: debounce total 100ms stable 100ms status 0x101
[105027.686604] usb 3-3.4: new high-speed USB device number 88 using xhci_hcd
[105027.797310] usb 3-3.4: skipped 1 descriptor after configuration
[105027.797328] usb 3-3.4: skipped 4 descriptors after interface
[105027.798834] usb 3-3.4: default language 0x0409
[105027.803564] usb 3-3.4: udev 88, busnum 3, minor = 343
[105027.803574] usb 3-3.4: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00
[105027.803578] usb 3-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[105027.803582] usb 3-3.4: Product: foobar
[105027.803584] usb 3-3.4: Manufacturer: ACME
[105027.803586] usb 3-3.4: SerialNumber: 12345678
[105027.803919] usb 3-3.4: usb_probe_device
[105027.803926] usb 3-3.4: configuration #1 chosen from 1 choice
[105027.810831] usb 3-3.4: adding 3-3.4:1.0 (config #1, interface 0)
[105027.812617] cdc_acm 3-3.4:1.0: usb_probe_interface
[105027.812627] cdc_acm 3-3.4:1.0: usb_probe_interface - got id
[105027.814357] cdc_acm 3-3.4:1.0: ttyACM0: USB ACM device
[105027.814424] usb 3-3.4: adding 3-3.4:1.1 (config #1, interface 1)

### Second enumeration finished

Do you find useful hints in this log?

To me it doesn't, I'm afraid.

> > It's quite possible that you're getting messed up by link power
> > management (LPM).  But that's just a guess.

What would be a symptom, if that happened?

> I don't see, from logs, any wrong behavior from dwc2 device side. dwc2 
> driver correctly handle Early Suspend, Suspend, USB Reset detect and 
> finally USB Reset which all initiating from Host side.

That was my impression, thanks for confirming that. Clearly somethins
goes wrong before that.

In case it were helpful, here are the logged lines on the dwc2 device
from just _before_ up to just after the 6 seconds delay:

[   40.515896] dwc2 ff400000.usb: dwc2_hsotg_irq: 04088028 00080000 (d88c3cc4) retry 8
[   40.516402] dwc2 ff400000.usb: dwc2_hsotg_irq: daint=00010000
[   40.516426] dwc2 ff400000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[   40.516450] dwc2 ff400000.usb: dwc2_hsotg_epint: Setup/Timeout
[   40.516469] dwc2 ff400000.usb: complete: ep 00000000dab859c8 ep0, req 000000009cb97255, 0 => 00000000acdb2ee9
[   40.516507] dwc2 ff400000.usb: ctrl Type=80, Req=06, V=0306, I=0409, L=00ff
[   40.516542] dwc2 ff400000.usb: ep0: req 00000000326c54ef: 26@0000000010e15f7f, noi=0, zero=1, snok=0
[   40.516577] dwc2 ff400000.usb: dwc2_hsotg_start_req: DxEPCTL=0x00028000, ep 0, dir in
[   40.516604] dwc2 ff400000.usb: ureq->length:26 ureq->actual:0
[   40.516627] dwc2 ff400000.usb: dwc2_hsotg_start_req: 1@26/26, 0x0008001a => 0x00000910
[   40.516656] dwc2 ff400000.usb: dwc2_hsotg_start_req: 042fa000 pad => 0x00000914
[   40.516678] dwc2 ff400000.usb: ep0 state:1
[   40.516696] dwc2 ff400000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[   40.516717] dwc2 ff400000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[   40.517286] dwc2 ff400000.usb: dwc2_hsotg_irq: 04048028 00040000 (d88c3cc4) retry 8
[   40.517783] dwc2 ff400000.usb: dwc2_hsotg_irq: daint=00000001
[   40.517805] dwc2 ff400000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[   40.517832] dwc2 ff400000.usb: dwc2_hsotg_epint: XferCompl: DxEPCTL=0x00008000, DXEPTSIZ=00000062
[   40.517859] dwc2 ff400000.usb: dwc2_hsotg_complete_in: adjusting size done 0 => 26
[   40.517884] dwc2 ff400000.usb: req->length:26 req->actual:26 req->zero:1
[   40.517909] dwc2 ff400000.usb: Receiving zero-length packet on ep0
[   40.518514] dwc2 ff400000.usb: dwc2_hsotg_irq: 04088028 00080000 (d88c3cc4) retry 8
[   40.519011] dwc2 ff400000.usb: dwc2_hsotg_irq: daint=00010000
[   40.519035] dwc2 ff400000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[   40.519062] dwc2 ff400000.usb: dwc2_hsotg_epint: XferCompl: DxEPCTL=0x00028000, DXEPTSIZ=60000011
[   40.519087] dwc2 ff400000.usb: zlp packet received
[   40.519106] dwc2 ff400000.usb: complete: ep 00000000dab859c8 ep0, req 00000000326c54ef, 0 => 000000002dd872a5
[   40.519143] dwc2 ff400000.usb: dwc2_hsotg_enqueue_setup: queueing setup request
[   40.519164] dwc2 ff400000.usb: ep0: req 000000009cb97255: 8@00000000e42d6d89, noi=0, zero=0, snok=0
[   40.519214] dwc2 ff400000.usb: dwc2_hsotg_start_req: DxEPCTL=0x00028000, ep 0, dir out
[   40.519242] dwc2 ff400000.usb: ureq->length:8 ureq->actual:0
[   40.519264] dwc2 ff400000.usb: dwc2_hsotg_start_req: 1@8/8, 0x00080008 => 0x00000b10
[   40.519297] dwc2 ff400000.usb: dwc2_hsotg_start_req: 042f8000 pad => 0x00000b14
[   40.519321] dwc2 ff400000.usb: ep0 state:0
[   40.519340] dwc2 ff400000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[   40.519364] dwc2 ff400000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[   46.203094] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008428 00000400 (d88c3cc4) retry 8
[   46.204060] dwc2 ff400000.usb: GINTSTS_ErlySusp
[   46.205565] dwc2 ff400000.usb: gintsts=04008828  gintmsk=d88c3cc4
[   46.206807] dwc2 ff400000.usb: USB SUSPEND
[   46.206824] dwc2 ff400000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x502a01
[   46.206842] dwc2 ff400000.usb: DSTS.Suspend Status=1 HWCFG4.Power Optimize=1 HWCFG4.Hibernation=0
[   46.206872] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008028 00000000 (d88c3cc4) retry 8

> You need to 
> investigate why Host after 6 second initiated above signaling sequence.
> Maybe after 5-6 sec host initiate autosuspend? But in this case not 
> clear why then it perform USB reset?

See the host logs above.

> Did you test with different PC's with different EHCI/XHCI hosts?

Both the PCs I tested for my initial report (including the one I tested
with Windows) only have xHCI controllers (I user lsusb to find out).

I now managed to find an old laptop with an EHCI controller, and
connecting to that host gives the same result: re-enumeration after 6
seconds.

There are two more facts that may hint at something:

 * using the Rockchip 4.4 vendor kernel the problem does never happen
 * using a custom board with the RK3308 the problem happens if the
   USB-C cable is connected before booting; it does not happen if the
   connectror is connected after the boot has completed

These two have been reported to me and I haven't reproduced them (yet)
so I cannot provide logs at the moment. I can prioritize working on
them, or the 4.4 vendor kernel at least, if it is deemed useful.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
