Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6E239E6B;
	Thu, 12 Jun 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734665; cv=none; b=kL6RhjJjTe75wlGWIirB0u4eo2qh7n+Dj/DlnJlfkmqlixJA/Qu6Ic9Kiao6804dqWANWMtdWC4vsvGcb6Zix0BTbbEsD7+C/9BIQwRervOh/wLPFh7HENtmwVIAF+qGoAkdJ41yDyRu2nS60qYDlFDmPEl7iWT0C2TX9tM0Ei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734665; c=relaxed/simple;
	bh=D2mWxOEl/SvBvC0JbtnXDM6Cnw45/llMvFED839LKMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcTOV5Qt38tjjSYe00XCXAfeH/PIoaWhKz3yE3LL/oDIa90emSHBYcSdvozPA472tGseXmJ8gRiDEn5cTTuNzfGKfyoPa/33VWTQAvV/r0MylZf2jMytF7d3SUoyW9PQKbH2czCKLIERz+4Mf9wtACT9idrhxU4k4HW5RiQXHog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yawixxk0; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yawixxk0"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7292543A32;
	Thu, 12 Jun 2025 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749734655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IFpN9A7N1FAhnqmYi16qpoBihZ1VUNhOREImXIAGnqU=;
	b=Yawixxk0l9Lmyu9zuyEuHrAp00k53iEx0a69ejSoQ6i7ZTO85H4HeFbTAPIJWR/RhEHoUt
	z+oIP9xXkah3ahqWwdDDN46Xlw6qxqIZJiaScAPnrh3aVKNiO1/ByNySo83VvaatvwznOe
	C/mxXCNnBKAMoAn5yV/BmOhN6XDjlG+9eRA6R5Kg/OLP9b4QqYUx9SLjHZ96bZ6SMc+qi1
	sBu2r0/fN2AP4JHOmlBcLMZiOhh+24cuauOsHX7dOsuscocWL01EY4gY2MqlpWR57T8OE5
	Y1pq+t44+kIU1+8PgFkx+oxurge5sFeP0Qn6/j8yvgWmOzG7ralWaXnwrQSRXA==
Message-ID: <cb081d0f-3a53-4b5e-9f14-92745820fc75@bootlin.com>
Date: Thu, 12 Jun 2025 15:23:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 heiko@sntech.de, vkoul@kernel.org, kishon@kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250414185458.7767aabc@booty>
 <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
 <cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
 <20250415162825.083f351c@booty>
 <8c2e18a9-44d1-47b3-8fe4-46bdc5be8d76@rowland.harvard.edu>
 <20250502155308.11a991d4@booty>
 <cc80988c-5941-46f3-8183-f3f9acb7dd5d@rowland.harvard.edu>
 <20250509091738.4ae76d18@booty>
 <329f68fb-a097-ff3d-da9d-f535a8429ea7@synopsys.com>
 <20250520140936.08d72db6@booty>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250520140936.08d72db6@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduhedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfhfeduueekhfettdfgfeettdehudfhfeffleelteeffeejveduueetvdeuueeinecuffhomhgrihhnpehsrhdrhhhtpdgsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtt
 hhopefoihhnrghsrdfjrghruhhthihunhihrghnsehshihnohhpshihshdrtghomhdprhgtphhtthhopehsthgvrhhnsehrohiflhgrnhgurdhhrghrvhgrrhgurdgvughupdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghvvghrrdihrghnghesrhhotghkqdgthhhiphhsrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com



Le 20/05/2025 à 14:09, Luca Ceresoli a écrit :
> Hello Minas,

[...]

> Minas, do you have any hints or advice to understand why there is a
> disconnect about ~6 seconds after a successful enumeration in gadget
> mode?

+CC: vkoul@kernel.org, kishon@kernel.org, 
linux-rockchip@lists.infradead.org, 
linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
heiko@sntech.de

Hello,

I am a colleague of Luca and have been working on an issue related to 
USB peripheral disconnections over the past few days. I believe I have 
found some interesting insights that explain the disconnection.

To provide some context, I have added traces in relevant functions to 
understand the sequence of events (filtered on interesting logs, see [1] 
for full logs):


[... boot proccess ...]

[    0.628744] dwc2 ff400000.usb: mapped PA ff400000 to VA (____ptrval____)
[    0.629358] dwc2 ff400000.usb: supply vusb_d not found, using dummy 
regulator
[    0.630478] dwc2 ff400000.usb: supply vusb_a not found, using dummy 
regulator
[    0.631297] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/usb/dwc2/platform.c:157:dwc2_lowlevel_hw_enable
[    0.632406] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/phy-core.c:230:phy_init
[    0.633233] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:491:rockchip_usb2phy_init
[    0.634262] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:539:rockchip_usb2phy_init 
(before schedule_delayed_work otg_sm_work)
[    0.635602] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/phy-core.c:309:phy_power_on
[    0.636379] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:577:rockchip_usb2phy_power_on
[    0.637496] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:606:rockchip_usb2phy_power_on 
(before rockchip_usb2phy_reset)

[... bunch of dwc2 ff400000.usb logs ...]

[    0.688708] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/usb/dwc2/platform.c:200:dwc2_lowlevel_hw_disable
[    0.689661] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/phy-core.c:360:phy_power_off
[    0.690442] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:620:rockchip_usb2phy_power_off
[    0.691522] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/phy-core.c:271:phy_exit
[    0.692261] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:648:rockchip_usb2phy_exit 
(before cancel_delayed_work_sync otg_sm_work/chg_work)
[    0.698909] dwmmc_rockchip ff490000.mmc: IDMAC supports 32-bit 
address mode.

[... boot finished ...]

[... call to my peripheral setup script ...]

[   44.493316] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/usb/dwc2/platform.c:157:dwc2_lowlevel_hw_enable
[   44.495078] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/phy-core.c:230:phy_init
[   44.495837] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:491:rockchip_usb2phy_init
[   44.496960] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:539:rockchip_usb2phy_init 
(before schedule_delayed_work otg_sm_work)
[   44.498317] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/phy-core.c:309:phy_power_on
[   44.499107] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:577:rockchip_usb2phy_power_on
[   44.500160] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:606:rockchip_usb2phy_power_on 
(before rockchip_usb2phy_reset)


[... bunch of dwc2 ff400000.usb logs ...]
[   44.976346] dwc2 ff400000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000

[... ~5 seconds delay ...]

[   50.660998] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:670:rockchip_usb2phy_otg_sm_work
[   50.662128] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:685:rockchip_usb2phy_otg_sm_work 
(rport->state=0 vbus_attach=1 rphy->chg_state=0 rphy->chg_type=0 
extcon_get_state=0)
[   50.663862] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:831:rockchip_chg_detect_work
[   50.664973] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:839:rockchip_chg_detect_work 
(rphy->chg_state=0 rport->suspended=0)
[   50.666316] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:620:rockchip_usb2phy_power_off
[   50.769027] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:831:rockchip_chg_detect_work
[   50.770093] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:839:rockchip_chg_detect_work 
(rphy->chg_state=1 rport->suspended=1)
[   50.813030] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:831:rockchip_chg_detect_work
[   50.814083] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:839:rockchip_chg_detect_work 
(rphy->chg_state=2 rport->suspended=1)
[   50.857013] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:831:rockchip_chg_detect_work
[   50.858067] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:839:rockchip_chg_detect_work 
(rphy->chg_state=3 rport->suspended=1)
[   50.859409] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:670:rockchip_usb2phy_otg_sm_work
[   50.860475] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:685:rockchip_usb2phy_otg_sm_work 
(rport->state=1 vbus_attach=1 rphy->chg_state=5 rphy->chg_type=6 
extcon_get_state=0)
[   50.862267] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:577:rockchip_usb2phy_power_on
[   50.863326] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:606:rockchip_usb2phy_power_on 
(before rockchip_usb2phy_reset)

[... bunch of dwc2 ff400000.usb logs ...]

[   52.868992] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:670:rockchip_usb2phy_otg_sm_work
[   52.870108] phy phy-ff008000.syscon:usb2phy@100.0: 
drivers/phy/rockchip/phy-rockchip-inno-usb2.c:685:rockchip_usb2phy_otg_sm_work 
(rport->state=3 vbus_attach=1 rphy->chg_state=5 rphy->chg_type=6 
extcon_get_state=0)

[... repeated every 2 seconds ...]



I found two potential issues that may be relevant:

1 - The workers rockchip_usb2phy_otg_sm_work and 
rockchip_chg_detect_work call rockchip_usb2phy_power_off/on directly, 
bypassing phy_power_off/on. This means the state of the PHY after a call 
to phy_power_on may not be the one expected by users of the struct phy api.
2 -  The worker rockchip_chg_detect_work always disables the PHY at its 
first call, which creates the disconnection.


For issue 1, here is the phy_power_on/off reference count:

[    0.635602] phy_power_on	count = 1
[    0.689661] phy_power_off	count = 0
[   44.498317] phy_power_on	count = 1 // ./setup-cdc-serial
[   50.666316] rockchip_usb2phy_power_off => direct call to power_off! 
This causes issues in the dwc2 driver because the PHY is powered off 
even if the phy_power_on counter is not zero, leading to the disconnection
[   50.862267] rockchip_usb2phy_power_on => direct call to power_on and 
reset! This will reset the PHY even if the phy_power_on counter is not zero.

This is my first time digging into the USB/PHY subsystem, so I might be 
wrong, but this behavior seems very strange. Once phy_power_on is 
called, I expect the PHY to never go off until phy_power_off is called.


For issue 2, this is also a strange behavior. I understand that 
resetting the PHY before its first use might be necessary, but I don't 
understand why this must be delayed by 6 seconds. In my opinion, this 
reset sequence should occur synchronously during the phy_init call.

I quickly looked at other PHY drivers, and none of them seem to have 
asynchronous behavior or any internal calls to power_on/power_off.

Could you confirm if what I found is indeed the issue and if the 
rockchip_usb2phy driver needs to be fixed?

Does anyone know why rockchip_usb2phy needs to perform these 
asynchronous tasks and these power_on/off calls?

Let me know if you need more logs to understand the issue.

Thanks a lot,
Louis Chauvet


[1]:https://paste.sr.ht/~fomys/26e0d03d03537a6eb3757fb709b6d5a81484eee3

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

