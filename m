Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E60727F171;
	Tue, 20 May 2025 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747742987; cv=none; b=MA+BCimeQ9HLxcBFTKSXeNsYskkKazwZaY15J7MUvDgkX70dx7quRh0m9lEl40GwZEMjnDePU08XBwW5whGKS19vBbQcFPcS11FIlOTi33o0PLMliZhLasxEyIPpjXxvUOjbtMoA2PwNMAUWaqa7+M4mUQx5Ab6PMQBBjZroaWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747742987; c=relaxed/simple;
	bh=IkV86RtFSVfKB5OH7kk/gXmCGvsE/032zCO6iEOLJ84=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FJSVXdeI2k+BbCNDESqTDH/C59dd8ms1hzsZlnwdTnHXBedv3Xsryk68Tffdr3OvWHs+dtoo10B78nJHY39uBnWi2KMKaJZtzXVUPnUfqnh6Q7GgzqCvuaC5dnU3b+hwQv6PajWBoXn48C/8p1y57dcQWNGfu9XXuKIR+d+d93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BAYIgmSB; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BAYIgmSB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E76043228;
	Tue, 20 May 2025 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747742979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmSn5XfAasjudyDa3E7vYwoQxs1qbpTg+SqpnL3/lgM=;
	b=BAYIgmSBs6mhhyGy2RRs4bl/ABgZgU9O9gwvpemZvJBjVSMe2X+HxtSOWNu7nDMHC9tk9k
	8PeTBBH+eUSGWTza172pWuhU41j1GKojEai+tBIepog9XasT7KdgSKVMFBVqGTcrhdUBej
	0alsNCnvKpv0MoSRYARTostwdmaQC+M4qRXWhFBmupRxh1FOii57oCETZhgUUsc59t4Hzn
	PCwk6pBHbETHnYAyXDxY9msScVsqINON0Y3gRSq31WExMW8676FENnGTYXoN3w9AFLnazs
	0MqJH96I9k9wiiwQRH9PLFBtbBGZLFCaT7FfXPAVcJqr8LUNB7gSLAPyjiE4fw==
Date: Tue, 20 May 2025 14:09:36 +0200
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
Message-ID: <20250520140936.08d72db6@booty>
In-Reply-To: <329f68fb-a097-ff3d-da9d-f535a8429ea7@synopsys.com>
References: <20250414185458.7767aabc@booty>
	<a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
	<cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
	<20250415162825.083f351c@booty>
	<8c2e18a9-44d1-47b3-8fe4-46bdc5be8d76@rowland.harvard.edu>
	<20250502155308.11a991d4@booty>
	<cc80988c-5941-46f3-8183-f3f9acb7dd5d@rowland.harvard.edu>
	<20250509091738.4ae76d18@booty>
	<329f68fb-a097-ff3d-da9d-f535a8429ea7@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopefoihhnrghsrdfjrghruhhthihunhihrghnsehshihnohhpshihshdrtghomhdprhgtphhtthhopehsthgvrhhnsehrohiflhgrnhgurdhhrghrvhgrrhgurdgvughupdhrtghpthhtoheplhhinhhugidquhhss
 gesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghvvghrrdihrghnghesrhhotghkqdgthhhiphhsrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Minas,

On Tue, 13 May 2025 07:35:40 +0000
Minas Harutyunyan <Minas.Harutyunyan@synopsys.com> wrote:

> >> I don't know anything about that driver, though.  Minas is the expert.
> >> You really need his advice.  
> > 
> > In the meanwhile I did two event captures, one with the mainline kernel
> > and one with the vendor kernel, using the same laptop setup and no hub
> > in between, and for each test I captured both the usbmon log and a
> > wireshark file. Both are available if needed.
> > 
> > By analyzing those captures I found that the communication between host
> > and gadget is almost identical. The only differenceis the get
> > configuration descriptor response has one more descriptor in the vendor
> > case (the working one). Here it is:
> > 
> > OTG Descriptor:
> >    bLength                 3
> >    bDescriptorType         9
> >    bmAttributes         0x03
> >      SRP (Session Request Protocol)
> >      HNP (Host Negotiation Protocol)
> > 
> > I don't know exacty what that implies, but for a quick test I went in
> > the mainline kernel and found that it can add the same descriptor if
> > both of these is true:
> > 
> >   * dr_mode = "otg" in device tree
> >   * "DWC2 Mode Selection" is "Dual role mode" in kconfig
> >     (i.e. CONFIG_USB_DWC2_DUAL_ROLE=y)
> > 
> > While I had:
> > 
> >   * dr_mode = "peripheral"
> >   * "DWC2 Mode Selection" = "Gadget only mode"
> >     (i.e. CONFIG_USB_DWC2_PERIPHERAL=y)
> > 
> > With those two changes the mainline kernel now behaves correctly, just
> > like the vendor kernel. No more disconnection after 5-6 seconds.
> > 
> > For the records, the vendor kernel already had dr_mode = "otg" and
> > CONFIG_USB_DWC2_DUAL_ROLE=y.
> > 
> > Based on my very limited knowledge of USB, intuitively it looks that:
> > 
> >   * in peripheral-only mode the OTG Descriptor should not be sent
> >   * in peripheral-only mode SRP does not make sense
> >   * in peripheral-only mode HNP does not make sense
> > 
> > Are the above correct?
> > 
> > Whether the answer, I think these new findings do not yet explain the
> > problem nor point to a correct solution. Apart from the added
> > descriptor, all of the initial enumeration events seen by usbmon is
> > identical in the two cases.
> > 
> > Minas, were you able to have a look at the info I collected?
> > Do they suggesting you anything about the dwc2 driver?
> >   
> Configuration parameters: CONFIG_USB_DWC2_HOST, 
> CONFIG_USB_DWC2_PERIPHERAL and CONFIG_USB_DWC2_DUAL_ROLE have impact 
> only on build process. Based on these parameters driver can build as 
> host only, device only or host + device.
> 
> OTG functionality of depend on:
> 1. On core configuration - GHWCFG2 bits 0:2:
> Mode of Operation (OtgMode)
> 3'b000: HNP- and SRP-Capable OTG (Host & Device)
> 3'b001: SRP-Capable OTG (Host & Device)
> 3'b010: Non-HNP and Non-SRP Capable OTG (Host and Device)
> 3'b011: SRP-Capable Device
> 3'b100: Non-OTG Device
> 3'b101: SRP-Capable Host
> 3'b110: Non-OTG Host
> Others: Reserved
> As you can see above, device only mode can support OTG, i.e. 
> "SRP-capable device".
> Based on provided OTG descriptor your core's OTG mode is equal to 0, 
> which means "HNP- and SRP-Capable OTG (Host & Device)".
> 2. Depend on platform (see dwc2/param.c) OTG functionality can be 
> updated, if it allowed by above core configuration OTG parameter.
> 3. OTG functionality can updated also through devicetree parameters 
> settings.

Thanks for the clarification. FYI the GHWCFG2 value is 0x228e2450 on
the RK3308, so OtgMode = "3'b000: HNP- and SRP-Capable OTG (Host &
Device)".

And I confirm the outcome of my tests:

 A) if dr_mode = "otg" in DT AND CONFIG_USB_DWC2_DUAL_ROLE=y:
    - OTG descriptor is sent
    - no disconnection, no re-enumeration

 B) if dr_mode = "peripheral" in DT OR CONFIG_USB_DWC2_PERIPHERAL=y:
    - OTG descriptor is not sent
    - disconnection+enumeration after ~6 seconds

The disconnection in case B should _not_ happen.

The presence/absence of the OTG descriptor is not wrong AFAICU. I'm
mentioning it just because it might give some clues.

I did a comparison of /sys/kernel/debug/usb/ff400000.usb/regdump in
cases A and B. The only relevant difference is that bit
USBOTG_GUSBCFG.ForceDevMode is 1 in case B. Based on the TRM, this
seems correct.

Doing other checks on registers and adding some logging to the code
showed everything appears to be configured correctly.

So, nothing explains why after about 6 seconds there is a disconnect.

My tests are done on mainline Linux v6.15-rc2.

Minas, do you have any hints or advice to understand why there is a
disconnect about ~6 seconds after a successful enumeration in gadget
mode?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
