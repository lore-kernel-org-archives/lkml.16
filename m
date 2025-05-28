Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288B6279903;
	Wed, 28 May 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437760; cv=none; b=oxOK0nll/OwtIDanBHWssScsQYqxvQQ+NO1Zzl9R57mED/6a834GrHLOEdxt0fDNO+DJWwscVM+v/oznjsJYxVq8S5I2ljy4eFtrbNe7ACC6n9lFgvUtp+erGzi6yNZpXUTT/xy46zwfxl0/8wySoxZxA79VaDTfxwe2MRsvYoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437760; c=relaxed/simple;
	bh=3prwoC0crX/v6y6Rwo4FYGS2OLUSUM0Y8higC18BW1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuNJwwul3cyRCKXwdXAFSaD/sgj00yxdgqjNBEhLMcowlKQwk8oHo7sGyBWeOG/XrVHbqkH6+Pw9newxIpESp2ispoDnU0pvjxXrxlv/vHmJqJAPSWxIKVmTkTcnGCfGTpY/1ASBbXJY9Zdc4XA2/v6Xuql2ACrPhZu8sw4z1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=04EQCtkq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="04EQCtkq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZV21XWo54z3BlML2GgcnFBxYilTl6UY75ewquPky//0=; b=04EQCtkqm1WGgwmHxnkzaZVswO
	YWaYfyUBEy3FlMgziPdZR/K/J827iN6UiI5z7CLCw/osQIXDF6Em8y0ApXmUIb3i4glqqbe2IxV4S
	FekvfBg5UTXIa/wAbIJglu+DaVebiqoyYB1nYhIcw1UKe5xK65NuJYXfGtj6NrpyltAM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKGWs-00EB2C-6J; Wed, 28 May 2025 15:09:10 +0200
Date: Wed, 28 May 2025 15:09:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Jakob Unterwurzacher <jakobunt@gmail.com>, foss+kernel@0leil.net,
	conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
	jakob.unterwurzacher@cherry.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robh@kernel.org,
	Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
Message-ID: <3303d8d4-ec5a-4cdc-8391-ab6e35d76b33@lunn.ch>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
 <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
 <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>

On Wed, May 28, 2025 at 09:56:51AM +0200, Quentin Schulz wrote:
> Hi Andrew,
> 
> On 5/27/25 6:18 PM, Andrew Lunn wrote:
> > On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
> > > > @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
> > > > should do the trick to disable the circuitry according to the TRM?
> > > 
> > > I measured TXCLK vs TXD3 on an oscilloscope on gmac1:
> > > 
> > > 	Setting	Decimal	Actual TXCLK delay (ps)
> > > 	00	0	47
> > > 	0a	10	283
> > > 	10	16	440
> > > 	20	32	893
> > > 	30	48	1385
> > > 	40	64	1913
> > > 	50	80	2514
> > > 	60	96	3077
> > > 	70	112	3565
> > > 	7f	127	4009
> > > 
> > > 	off	x	-315
> > > 
> > > Setting = tx_delay (hex)
> > > Decimal = tx_delay (dec)
> > > Actual TXCLK delay (ps) = Measurement from oscilloscope
> > > 
> > > Plotting this we can deduce that one tx_delay unit is about 31ps.
> > 
> > Nice to see somebody actually do the measurements. Based on this, it
> > would be good to implement:
> > 
> >          tx-internal-delay-ps:
> >            description:
> >              RGMII Transmit Clock Delay defined in pico seconds. This is used for
> >              controllers that have configurable TX internal delays. If this
> >              property is present then the MAC applies the TX delay.
> > 
> > For the moment, please limit it to just the device you measured it on.
> > 
> 
> What exactly do you mean with "limit it to just the device you measured it
> on"?

Nobody seems to know if rx_delay & tx_delay operate the same across
the whole range of SoCs. I don't particularly care if these properties
are difference between SoC, they are vendor properties, with
undocumented magic values. However 'tx-internal-delay-ps' is
standardised, and has a very clear meaning. I don't want it used
unless somebody has performed a measurement and we know that 2000
produces a 2ns delay.

> I'll need to implement reading the delay from the stmmac driver to use this
> property, do I need to restrict reading this property to the SoC we tested
> (RK3588)?

Yes, please only allow it to be used on RK3588, and any other SoC you
can test and verify its behaviour.

> I assume you're then expecting tx-internal-delay-ps only on this new DTSO's
> gmac1?

I would like rx_delay and tx_delay to be marked deprecated, with the
end goal they are no longer used, the standard properties take there
place. But to get there, we need more measurements from real hardware,
or some other way to be sure what we have the correct delay.

> Would you still want rx_delay/tx_delay to be set to 0x00? Maybe only
> rx_delay since we won't have a companion rx-internal-delay-ps for now (until
> someone from Rockchip answers :); adding Kever back to the Cc for that)? Or
> should I remove both of them?

rx-internal-delay-ps and rx_delay should be mutually exclusive. If
both are present -EINVAL. We have to keep supporting rx_delay for
rk3588 otherwise we break backwards compatibility, but ideally no more
instances of it should be added once rx-internal-delay-ps is added.

	Andrew
