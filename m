Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9399289350
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651599; cv=none; b=WLFuivvnBW1khh+iR9ul1lBC6JYMxP9CNv0tNaSgzc2HrLv+dOoVDgnOjwJEQvq+Zugh+TX8yLM/86tzVJ8enjnUjYa9ILCFSya5Qgx6zjHEFzijOstlihsWBTqEavIL3kK+xVh8kyzNlpkaLy34aNKxaDQQrpBF7O4I1aiFLLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651599; c=relaxed/simple;
	bh=y7scEJgjMxb4QXpOLLee5dWY9Dg/UCvvUhgVM5o+Rfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5wUpoeUsVvq1PSeSGCYTTxFwAk2nu6QYuy8SIRrmhn4G0RGUumWjNsNq9AX0QEb5IrggDvgH1PIC7UTbbHlJyi3BWDvpK29A9cMBMW1H5vy8OO8V4HudlEO+gL79w11SL41QVjO9ETN2eYZ1C4Pbcy+9hmdWJssNXzd5/xAlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hE0NkJvn; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hE0NkJvn"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8ffa00555so37224706d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744651596; x=1745256396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZABkeQkFhxx7tpQggIXSiN748KnBjtbZNb781rtUxm4=;
        b=hE0NkJvnlGdKwCEtcf81y5ebknCmcLb3NqnQydNajoRRQz5/MOTPW2TlYPkSP1or2I
         OJfL01E/PYR/1xm2osIJSx1OWmSU1ZhKQ/hMyPSHX/W55jh2vF9GaYmuRyQm4YI3Fl7N
         RtoVEbNk52F+uoegEGfhp79OsyGYe0HmMidg3OLpVPDM8XC8sJfJoCBA4Pv6fQ6iip7C
         AOMzxQ87LOIEaTIQ9jbTrVEAvZ/JYR4/RprhpQhiAJtl/LMueJdQwJ38CdGayp+UsoI6
         8KgGcMZ3E64E5eDkvArxi6zc68ZjEhs9QxRfSbHA58yKCuzu2Sw/PqScmjreItVSXEMw
         YDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744651596; x=1745256396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZABkeQkFhxx7tpQggIXSiN748KnBjtbZNb781rtUxm4=;
        b=tQ8HrbSRK6O5fFyFRfsA5O7Ronk68KZlVgtMDE3M98GeHVt34lZe5aAiOX4KEUX5W7
         pZLe6DmXN+TRXWItBYfnRFb+t+06ES2V+SouSNLqVJE4KAkAJyNRIYcQTdIdH5koQL6u
         6GhNXH7YiuaMwy5jd/9vR71DfFhD3JpEM36qFe/sMdMtvgtq+XKkeLjrlTl/Ot1QPXBi
         +wgOMst8m9eycKA5MKqa4LRbdVfjKFV+Yhwnz5KHoT1bGnNx3eFOqUJOAZlCoGc009JW
         9w3EoviUvaz0O5MTmV1NDtoRrBPQ9u9c0vWt6keXnCl2fCEs0AszqhLKnZXzAGXtU9Xp
         NBDA==
X-Forwarded-Encrypted: i=1; AJvYcCWE5Xdq3KsXeWeZjAjSRG01b/wzwYBztxp1+R5eAGMrf/d+oMFs9n1fEnYF5I7gPht3bqSDN0AMd4duESU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRdOSSicnX/a1/ULfvs1cpYj1Ohm+gXOBiyik4mzxDreLjPc2
	MhqvQb+JIOLtw1Rbqj3uz24PMm6BSLorTYQBeeU06qUCaK79dbHa+B7Y4E1S+A==
X-Gm-Gg: ASbGncsbvV44LHbvS84OjMKWUs7F2lxsiTvwuMXlYGWUh9fV0IDanv/Rq7KAALf7Yi3
	N+4PUlMZdmFlCJ81YbAXjFKmADqHiTPDEJYaU974gsNNQ2yrVbDAV/5qmDX1DvDAhenFJSyvgcI
	I4b9CZ7eyUaHU27zxtgCZSOX25ogBsew2kQv4FbKYZH2bjzSDrJ0Yr6N0LSLkGhgVbmv1IlAlY5
	vT6SuaVT28FDfP71GwMuCk0wrgfSOcRfoJgOBdYgNab6gIPNxQ9yjtN9UtGtuz0E/RQbxV0cxCq
	Aq0AJRN16RtFQTrMJuKjFTWvzrqXZL93BZrRH/HMLUfCJsAVruqQYP88AHlrmQ4jyzQKFs64Qgz
	EXcuwGIh4ODfE4Buk3Aciapi7NeI20794CA==
X-Google-Smtp-Source: AGHT+IFSLinOUad47aRlcaoYDuUassi8QuXGKVjP3L87wtHmg74C0hkomAmOpf3oM3WYm+BMVt9LLg==
X-Received: by 2002:a05:6214:319e:b0:6ed:1da2:afac with SMTP id 6a1803df08f44-6f23f119368mr208391336d6.32.1744651596377;
        Mon, 14 Apr 2025 10:26:36 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-31.harvard-secure.wrls.harvard.edu. [65.112.8.31])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de970f5esm86064586d6.33.2025.04.14.10.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 10:26:35 -0700 (PDT)
Date: Mon, 14 Apr 2025 13:26:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Message-ID: <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
References: <20250414185458.7767aabc@booty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414185458.7767aabc@booty>

On Mon, Apr 14, 2025 at 06:54:58PM +0200, Luca Ceresoli wrote:
> Hello Minas, Kever, linux-usb, recent dwc2 driver contributors,
> 
> I am facing an unexpected behavior (apparently a bug) with a dwc2
> controller in gadget mode, using a mainline kernel: the gadget device is
> enumerated normally but then disappears and gets re-enumerated about 6
> seconds after the initial enumeration, for no apparent reason. Here are
> the details.
> 
> Testing setup:
> 
> SoC:             Rockchip RK3308
> Board:           Rock Pi S [1]
> USB controller:  rockchip,rk3308-usb, snps,dwc2 [2]
> Controller mode: device only (dr_mode = "peripheral") [3]
> Tested kernels:
>  - v6.15-rc2
>  - v6.14.1
>  - v6.12.20
>  - v6.6.87
>  - v6.1.134
>  - v5.15.180
> Device tree:     upstream Rock Pi S dts [4]
> Kernel config:   ARM64 defconfig
> 
> Hardware setup: USB A-C cable connected from PC A port to the C
> connector on the Rock Pi S board. This cable provides board power as
> well as the connection between the host and the gadget.
> 
> Behavior:
>  1. boot board normally
>  2. optionally wait some time
>  3. run script to start a CDC serial gadget [5]
>  4. after about 0.6 seconds the ttyGS0 serial device is present and
>     working, and so is ttyACM0 on the host: so far all good
>  5. after about 6 seconds the dwc2 controller receives some
>     interrupts and starts a new enumeration sequence
> 
> This is what the kernel logs:
> 
> [   20.105688] dwc2 ff400000.usb: bound driver configfs-gadget.g1
> [   20.285431] dwc2 ff400000.usb: new device is high-speed
> [   20.373455] dwc2 ff400000.usb: new device is high-speed
> [   20.426496] dwc2 ff400000.usb: new address 28
> [   26.688388] dwc2 ff400000.usb: new device is high-speed
> [   26.775363] dwc2 ff400000.usb: new device is high-speed
> [   26.836880] dwc2 ff400000.usb: new address 29
> 
> Here is a side-by-side log of host and device, synced manually using
> a video capture (sorry about the long lines, can't do without):
> 
>     *** HOST ***                                                                                      *** DEVICE ***
>                                                                                                  <<< Last line of the script: 'echo ff400000.usb > UDC' >>>
>                                                                                                  [   14.281350] dwc2 ff400000.usb: bound driver configfs-gadget.g1
>                                                                                                  [   14.482332] dwc2 ff400000.usb: new device is high-speed
> [108204.084049] usb 3-2: new high-speed USB device number 39 using xhci_hcd
>                                                                                                  [   14.675692] dwc2 ff400000.usb: new device is high-speed
> [108204.274639] usb 3-2: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00    [   14.737395] dwc2 ff400000.usb: new address 44
> [108204.274652] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [108204.274656] usb 3-2: Product: ...
> [108204.274659] usb 3-2: Manufacturer: ...
> [108204.274662] usb 3-2: SerialNumber: 12345678
> [108204.282555] cdc_acm 3-2:1.0: ttyACM0: USB ACM device
>                                                             (...nothing happens for about 6 seconds...)
> [108209.972180] usb 3-2: USB disconnect, device number 39
>                                                                                                  [   20.766950] dwc2 ff400000.usb: new device is high-speed
> [108210.339297] usb 3-2: new high-speed USB device number 40 using xhci_hcd
>                                                                                                  [   20.960375] dwc2 ff400000.usb: new device is high-speed
> [108210.739738] usb 3-2: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00    [   21.200670] dwc2 ff400000.usb: new address 45
> [108210.739750] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [108210.739753] usb 3-2: Product: ...
> [108210.739756] usb 3-2: Manufacturer: ...
> [108210.739758] usb 3-2: SerialNumber: 12345678
> [108210.747084] cdc_acm 3-2:1.0: ttyACM0: USB ACM device
> 
> Note: the device address is different on the host and the target. Is
> this expected?

The value on the host side is a device number, not a device address.  
Device numbers are assigned sequentially by the kernel, whereas 
addresses are assigned automatically by the xHCI hardware without 
software intervention.

For non-xHCI controllers the two are the same, but not with xHCI.

> In the driver there are 2 interrupt handlers involved:
>  - dwc2_handle_common_intr in core_intr.c for the common events
>  - dwc2_hsotg_irq in gadget.c for gadget events
> 
> They share the same interrupt number, which AFAICU is because they
> actually read different bits from the same GINTSTS register.
> 
> I enabled DEBUG in the dwc2 driver and captured the initial events
> logged after the ~6 seconds pause, i.e. where the 2nd enumeration
> starts. Here they are with some annotations:
> 
>  1. first interrupt after the ~6 s break:
>     - dwc2_handle_common_intr finds no bits high
>     - dwc2_hsotg_irq finds one (early suspend bit):
>        [   46.203094] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008428 00000400 (d88c3cc4) retry 8
>        [   46.204060] dwc2 ff400000.usb: GINTSTS_ErlySusp
> 
>  2. second interrupt
>     - dwc2_handle_common_intr finds one bits high (suspend):
>        [   46.206807] dwc2 ff400000.usb: USB SUSPEND
>        [   46.206824] dwc2 ff400000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x502a01
>        [   46.206842] dwc2 ff400000.usb: DSTS.Suspend Status=1 HWCFG4.Power Optimize=1 HWCFG4.Hibernation=0
>        [   46.206872] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008028 00000000 (d88c3cc4) retry 8      
>     - dwc2_hsotg_irq finds no bits high
> 
>  3. third interrupt
>     - dwc2_handle_common_intr finds no bits high
>     - dwc2_hsotg_irq finds two (reset detected + USB reset):
>        [   46.437109] dwc2 ff400000.usb: dwc2_hsotg_irq: 04809028 00801000 (d88c3cc4) retry 8
>        [   46.437607] dwc2 ff400000.usb: dwc2_hsotg_irq: USBRstDet
>        [   46.437630] dwc2 ff400000.usb: dwc2_hsotg_irq: USBRst
>        [   46.437649] dwc2 ff400000.usb: GNPTXSTS=00080010
>        [   46.437673] dwc2 ff400000.usb: complete: ep 00000000dab859c8 ep0, req 000000009cb97255, -108 => 00000000acdb2ee9
>        [   46.437719] dwc2 ff400000.usb: dwc2_hsotg_complete_setup: failed -108
>        [   46.437765] dwc2 ff400000.usb: dwc2_hsotg_ep_disable(ep 00000000cf8cf06f)
>        [   46.437790] dwc2 ff400000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08080200
>        ...
> 
> From now on the log appears as a normal enumeration process.
> 
> I'm stuck at a dead end, trying to understand what may be triggering the
> second enumeration.

You should enable host-side debugging before connecting the cable:

	echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

It's quite possible that you're getting messed up by link power 
management (LPM).  But that's just a guess.

Alan Stern
