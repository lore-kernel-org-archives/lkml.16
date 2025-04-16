Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739621DDA2F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812296; cv=none; b=N63vQ1k1RzaWWx1DSSd4ZWKeJP2V6Mw9ZW01O40XQQUwRbwNvUAIaV4eIoMF6g5ZeOzT3RGb4aVtIuURdQ7EZAmT8qbLalxEXIxLT0QztayLtWlvdYa0ilpekfc6OxS0KeSRKfqWit/EnzKZlORspJkZ1PDw2rgu39TdFlolQvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812296; c=relaxed/simple;
	bh=rt4LVlUiTSj0UZdNZvaIcUxulNvJteVLNDUDXR5Mv9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Peoi7i7HJ/k2qkpyVfgQ1p1k+7gC15kR53UIqBjPh8OA6otipGBMSxms0fBdWCq130vx6Br9gnnOSyJdADUbGxtIvVIkLV3Ftxp7/J73zHbJDbye41hSwyabsKqqce0TTRgCGzHRZbx2ZgELgSOqPDTBvPZCGAgDDO2Hp8JJFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u53NE-0003zg-Oo; Wed, 16 Apr 2025 16:04:20 +0200
Message-ID: <fcdb9283-07aa-4d50-ac4d-317b0a4e5f7e@pengutronix.de>
Date: Wed, 16 Apr 2025 16:04:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] ARM: dts: microchip: Remove additional compatible
 string from PIO3 pinctrl nodes
To: claudiu beznea <claudiu.beznea@tuxon.dev>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240814061315.112564-1-manikandan.m@microchip.com>
 <20240814061315.112564-3-manikandan.m@microchip.com>
 <605ff021-0770-4363-9734-ad8114a429f9@tuxon.dev>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: lsc@pengutronix.de, "kernel@pengutronix.de" <kernel@pengutronix.de>
In-Reply-To: <605ff021-0770-4363-9734-ad8114a429f9@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hello,

On 8/24/24 16:32, claudiu beznea wrote:
> 
> 
> On 14.08.2024 09:13, Manikandan Muralidharan wrote:
>> The driver data specific to each pinctrl GPIO bank compatible nodes are not
>> the sameand declaring additional compatible string as fallback has no
>> specific purpose

That's incorrect. A compatible for the old IP core means that the new
revision is still compatible with it and old drivers should work for either.

> , hence, removing the additional compatible string from the
>> pinctrl nodes in DT to comply with atmel,at91-pinctrl.txt documentation.

The correct resolution would be to add an extra compatible to the
binding instead of breaking non-Linux users of the device tree.

>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Me and Lars stumbled upon your patch, because it broke the barebox
bootloader console on SAMA5D3 boards after it was imported.

Fortunately, the system still booted, because the first stage bootloader
sets up SD host controller pinmux without referring to the device tree.

We'll submit a driver patch on the barebox side, but please keep DT
compatibility in mind with similar changes in the future.

Thanks,
Ahmad

> 
> Applied to at91-dt, thanks!
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

