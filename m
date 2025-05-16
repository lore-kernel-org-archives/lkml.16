Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0617B425
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747406518; cv=none; b=LlmnoMR5uzXAJFBWQWw4RhWiiv3A/4N/Zvi/W6RDQxDwiMfeZCTIpv0r/PsYezpRM7M+kg/12KBg1iwLDgpbZlrSrXnFB5T+5NKJ8MRs+UJDbvJMR17mSqjRusNEeSPP14q+C23bcK/EbjtIbFEoHp+Wr5+3nlzCcXqhdcI/P1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747406518; c=relaxed/simple;
	bh=UF/l49MUcPfvZfl+RizxUYnB6siSN5GvLW8juOtrtmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvYMSGnJYM6PhB6qgFveydB5g2C2Denk66ecky0wXcJIonqL3WFCC9cYwCCadPWyZA5qeKTHdFHOJ/tfJMWAr3fiokggKe7XXMCluoEsLnq84H3JU/S8A18G+eWY6MJKYYKrUgm+SDK3PzXl5lGhHqeykTpra06aks1x+ITKNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 8B1152003C8;
	Fri, 16 May 2025 16:41:39 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id 0F44CC4D6; Fri, 16 May 2025 14:41:38 +0000 (GMT)
Date: Fri, 16 May 2025 14:41:38 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Etienne Buira <etienne.buira@free.fr>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: Searching for firmware timeout cause (was: [PATCH]
 firmware/raspberrypi: raise timeout to 3s)
Message-ID: <aCdOooM5a_zx6MO4@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Stefan Wahren <wahrenst@gmx.net>,
	Etienne Buira <etienne.buira@free.fr>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
 <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
 <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>
 <aCZqVzM5h9lwbfpQ@Z926fQmE5jqhFMgp6>
 <77f25ee5-1079-4729-866c-cfdeeff1ad9a@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77f25ee5-1079-4729-866c-cfdeeff1ad9a@gmx.net>

On Fri, May 16, 2025 at 01:17:41PM +0200, Stefan Wahren wrote:
> Am 16.05.25 um 00:27 schrieb Etienne Buira:
> > Hi Stefan
> >
> > On Thu, May 15, 2025 at 07:48:04PM +0200, Stefan Wahren wrote:
> >> Hi Etienne,
> >>
> >> Am 15.05.25 um 13:48 schrieb Etienne Buira:
> >>> On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
> >>>> Am 15.05.25 um 11:44 schrieb Etienne Buira:
> >>>>> Hi Stefan, and thank you for your interest.
> >>>>>
> >>>>> On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
> >>>>>> Hi Etienne,
> >>>>>>
> >>>>>> Am 15.05.25 um 08:41 schrieb Etienne Buira:
> >>>>>>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
> >>>>>>>> Hi Etienne,
> >>>>>>>>
> >>>>>>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
> >>>>>>> ../..
> >>>>>>>> Out of curiosity and because i never saw this issue, could you please
> >>>>>>>> provide more details?
> >>>>>>>> There is nothing connected to HDMI 0 & 1 ?
> >>>>>>>> Which firmware version are you running?
> >>>>>> Please provide the dmesg output, so we can extract the firmware version.
> >>>>> Firmware version is 2025-02-17T20:03:07, i also attach the full gzipped
> >>>>> dmesg, as long as a patch of extra traces used.
> >>>>> I did not specifically test other firmware versions for the timeout
> >>>>> issue (but i did for video output).
> >>>> Thanks, i'll try to reproduce.
> >>>>
> >>>> Sorry, i forgot but is this reproducible with a recent stable 6.12.x kernel?
> >>> Just reproduced with pristine 6.12.28.
> >>>
> >> okay, i've update the firmware on my older Raspberry Pi 4 to the same
> >> version as yours. But even with your configuration i don't see this kind
> >> of fallout. So I think we shouldn't apply this patch until we really
> >> know what's going on.
> > Ok, thank you, did you make sure a powered hdmi sink were connected? I
> > noticed there is no timeout if no hdmi is plugged (but there were when
> > monitor were powered off, maybe specific to my monitor).
> Yes, HDMI monitor was connected to HDMI 0 and powered on. Raspberry Pi 
> OS started as expected.
> 
> The fact that your SDIO interface triggers a warning, which I also don't 
> get let me think this is not just related to HDMI interface.
> 
> [    3.603736] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
> [    3.603739] mmc0: sdhci: Sys addr:  0x00000000 | Version: 0x00009902
> [    3.646852] mmc0: sdhci: Blk size:  0x00000000 | Blk cnt: 0x00000000
> [    3.646856] mmc0: sdhci: Argument:  0x00000000 | Trn mode: 0x00000000
> [    3.646859] mmc0: sdhci: Present:   0x01ff0001 | Host ctl: 0x00000000
> [    3.665697] mmc0: sdhci: Power:     0x0000000f | Blk gap: 0x00000000
> [    3.672214] mmc0: sdhci: Wake-up:   0x00000000 | Clock: 0x00003947
> [    3.678736] mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
> [    3.685254] mmc0: sdhci: Int enab:  0x00ff0003 | Sig enab: 0x00ff0003
> [    3.685257] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [    3.685260] mmc0: sdhci: Caps:      0x00000000 | Caps_1: 0x00000000
> [    3.712672] mmc0: sdhci: Cmd:       0x00000000 | Max curr: 0x00000001
> [    3.719186] mmc0: sdhci: Resp[0]:   0x00000000 | Resp[1]: 0x00000000
> [    3.725708] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]: 0x00000000
> [    3.732230] mmc0: sdhci: Host ctl2: 0x00000000
> [    3.736724] mmc0: sdhci: ============================================
> [    3.819205] mmc0: new high speed SDIO card at address 0001
Hi Stefan

I think this warning is because there is nothing in SD slot (i boot from
usb).
> >
> >> You don't have another Raspberry Pi 4 by any chance?
> > No, i don't.
> >
> >> Another cause might be the toolchain. Currently I use a not so fresh gcc
> >> 11.3.1 from Linaro.
> > Previous tries were cross built. I tried a native build with (Gentoo
> > packages) gcc 14.2.1_p20241221, binutils 2.44, and glibc 2.40-r8; but
> > got same result.
> > Will do a software upgrade overnight to try with more up to date build
> > system.
> I will try to update my toolchain, but this will take some time.
Ok, thank you.
I updated the whole thing, but no change in toolchain versions. I'm
trying to get a gcc11 based one.
> >
> >> Except of this, I noticed that your configuration doesn't enable
> >> DWC2_DUAL_ROLE and the LEDS_TRIGGER.
> > I have no use of them (and i have a lot of things to disable, but i
> > prefer to do that starting with a working system).
> I this case you can disable DWC2 completely, because USB host is 
> provided by xhci driver. LEDS_TRIGGER is used for the ACT LED as heartbeat.
Ok, thank you.

Regards.

