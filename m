Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6FE2046A6;
	Mon,  5 May 2025 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448738; cv=none; b=fqlBrMpa1CJKBNOuY1e1GCybWvXU2juCSVC/Hqhj1XCBTju39HJU0QvVyPZWHGvcaw3t00XP0dsjhPHoFJz8pH+WcRpD6wyqPhhdZTwWhQxl1wrYsCxEwOFzIwsErXdYJCwMuXpA4XydmKEexSAL/b3Infe9k7fK94tq16AjLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448738; c=relaxed/simple;
	bh=+dOUG53ZZtdM1RopCaXVxnCSmuJLBL7bSwbeueV+9AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKsC6jdro5s3aTmqohqnM4ZOUM1fmNEUFTy+hOJi5USMYZn7aqH9w0WxRvJWUE8zDtS3ba6MIbb8SDjUOtouIrR6Lik09iEsPjS1Mxg8Zo7J18UDn7GWUtCxo5Pv1tCHrZ6JSzaVVrDFG/3Zz/X284SnkcS4vSSjlLRtRrlG4TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YvcrgvGl; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YvcrgvGl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=RwOtQh7ufR/hgfV1LX9/r3rjIFbD4mmiETvvgQjMe4c=; b=Yv
	crgvGlIVixwh/LrlvMhrAYsLr/rdCOz4ng2/BJue0oPhnhDWRQH+VrnLCIAoTcqlgcyJCsto/uv3K
	hfPFb+i6WplLWzzI+Hfi7y1tIk/xALtYFtckt4QrUDrIJl4+ftI498t6kj+kBEVzD4iN5lYTSKwdY
	sTalGZhALN54M9c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uBv5v-00BauR-71; Mon, 05 May 2025 14:38:51 +0200
Date: Mon, 5 May 2025 14:38:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: John Clark <inindev@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
	conor+dt@kernel.org, detlev.casanova@collabora.com,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
Message-ID: <bf734f63-d849-433b-abcb-37af8fd704e9@lunn.ch>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
 <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
 <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
 <1a403393-e317-4a1b-a151-fa668c6278f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a403393-e317-4a1b-a151-fa668c6278f9@gmail.com>

> Hi Andrew,
> Thank you for your valuable feedback and for pointing me toward
> investigating the PHY configuration further. After digging deeper into the
> MAE0621A-Q3C PHY (PHY ID 0x7b744412), I now understand why it performs
> reliably: the generic PHY driver relies on the GMAC to set RGMII delays
> (tx_delay=0x20, rx_delay=0x10), enabling a stable 1Gbps link for gmac0 in
> rgmii-rxid mode, while rgmii-id failed in my tests due to the driver’s lack
> of internal delay configuration. Given the critical role of networking for
> development, I’d like to retain the GMAC nodes in v3 using this setup, but
> I’d greatly appreciate your approval on whether the generic PHY driver is
> suitable in rgmii-rxid mode for now.

Device Tree describes the hardware. The hardware does not appear to
have the 2ns delay added by extra long clock lines, so your DT
description of the hardware using 'rgmii-rxid' is wrong.

If we where to accept this broken description now, it really will
break when the MAE0621A driver is merged and it correctly sets the
RGMII delays.

So sorry, no we cannot accept it.

For you own development work, you can merge the driver i pointed to
into your tree. It needs work, but it is not terrible. So it should
work for you.

> I’m eager to explore a Maxio-specific
> driver for mainline compatibility and would be grateful for any guidance on
> existing upstreaming efforts for this PHY.

This is the first time i've heard of this device, so i have no idea if
anybody else is working on it. I would suggest you reach out to the
author of that patch.

	Andrew
