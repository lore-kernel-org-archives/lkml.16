Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557F136358;
	Sun, 15 Jun 2025 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749999244; cv=none; b=X5DiMdZYSMUFmOGpT0YKm4lN9Ed+SkVZ4aJOojD4FEO+qyMQsaY1QN/x+xdOdYuq44eWaw5RijHDhB5LuQK6gj2PrZdDKXU0PEQqldu0scqXhg8FNyqBLBP7Y6qblvc10vwf4HpsDrkRz294ZYSodCZLnFzxQXXru1QHjWOmAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749999244; c=relaxed/simple;
	bh=aZxVuFPB2LMtjNZFrwRoZePqmSmiGoTuVNpBiuhqRjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkPtFQkPEfUubA1eM/umSBObQsIsdm2SIxNOd7bb5ktlYBAo6h9huq2b7f83+TL56F7GQV0PkWhxHJEdGTIrIbj5pKXnORKe/R0y1ibqWfQBLHUMIJ94dkjGKb5ATZn3m+uGOHm5jkZ2Ln6m4NgW/7iDe4d/GSwXd1uJC6imkj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=LJmbuP2d; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="LJmbuP2d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kt4hHsFV36RpuWHyTnG4rPaSt9Cjr/5M4+STk580b1Q=; b=LJmbuP2dsPCX3BntYuenOEi+F2
	fO/EYVjq5NGyGgC8NEjJ6YhNYvo3jjWGMWDqGdiI23a313rtjNIRWwgYk/aGA9gZ4GGbsa5R42z5A
	saX7dG+ksnucnrSAxCCcWwG0Qzlwn/Ut05uDSCG0OjmEKZdtHKcX5ORFL9BpLdQoKQJ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uQok4-00FxY8-Lq; Sun, 15 Jun 2025 16:53:52 +0200
Date: Sun, 15 Jun 2025 16:53:52 +0200
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
Message-ID: <bb3486c6-93df-4453-acc6-deba3c8f7f0e@lunn.ch>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
 <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
 <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>
 <3303d8d4-ec5a-4cdc-8391-ab6e35d76b33@lunn.ch>
 <96d32ce8-394b-4454-8910-a66be2813588@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96d32ce8-394b-4454-8910-a66be2813588@cherry.de>

On Fri, Jun 13, 2025 at 04:27:54PM +0200, Quentin Schulz wrote:
> Hi Andrew,
> 
> On 5/28/25 3:09 PM, Andrew Lunn wrote:
> > On Wed, May 28, 2025 at 09:56:51AM +0200, Quentin Schulz wrote:
> > > Hi Andrew,
> > > 
> > > On 5/27/25 6:18 PM, Andrew Lunn wrote:
> > > > On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
> > > > > > @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
> > > > > > should do the trick to disable the circuitry according to the TRM?
> > > > > 
> > > > > I measured TXCLK vs TXD3 on an oscilloscope on gmac1:
> > > > > 
> > > > > 	Setting	Decimal	Actual TXCLK delay (ps)
> > > > > 	00	0	47
> > > > > 	0a	10	283
> > > > > 	10	16	440
> > > > > 	20	32	893
> > > > > 	30	48	1385
> > > > > 	40	64	1913
> > > > > 	50	80	2514
> > > > > 	60	96	3077
> > > > > 	70	112	3565
> > > > > 	7f	127	4009
> > > > > 
> > > > > 	off	x	-315
> > > > > 
> > > > > Setting = tx_delay (hex)
> > > > > Decimal = tx_delay (dec)
> > > > > Actual TXCLK delay (ps) = Measurement from oscilloscope
> > > > > 
> > > > > Plotting this we can deduce that one tx_delay unit is about 31ps.
> > > > 
> > > > Nice to see somebody actually do the measurements. Based on this, it
> > > > would be good to implement:
> > > > 
> > > >           tx-internal-delay-ps:
> > > >             description:
> > > >               RGMII Transmit Clock Delay defined in pico seconds. This is used for
> > > >               controllers that have configurable TX internal delays. If this
> > > >               property is present then the MAC applies the TX delay.
> > > > 
> > > > For the moment, please limit it to just the device you measured it on.
> > > > 
> > > 
> > > What exactly do you mean with "limit it to just the device you measured it
> > > on"?
> > 
> > Nobody seems to know if rx_delay & tx_delay operate the same across
> > the whole range of SoCs. I don't particularly care if these properties
> > are difference between SoC, they are vendor properties, with
> > undocumented magic values. However 'tx-internal-delay-ps' is
> > standardised, and has a very clear meaning. I don't want it used
> > unless somebody has performed a measurement and we know that 2000
> > produces a 2ns delay.
> > 
> > > I'll need to implement reading the delay from the stmmac driver to use this
> > > property, do I need to restrict reading this property to the SoC we tested
> > > (RK3588)?
> > 
> > Yes, please only allow it to be used on RK3588, and any other SoC you
> > can test and verify its behaviour.
> 
> Coming back to this topic, I'm unfortunately the bearer of some bad news.
> 
> I implemented the suggested logic (see at the end of this mail) and then
> went to validate it with Jakob's help. Unfortunately, it seems that the
> delay value really isn't stable or reliable.
> 
> We tested the same adapter with two different main boards (the same product,
> just two different units). With a value of 0x40 for tx_delay (which should
> be ~2000ps if we have a 31ps per tx_delay unit as empirically decided), we
> have one board with 1778ps and one with 1391ps. Following a hunch, we
> started to stress (or cool) the device (with stress-ng/a fan) and it did
> slightly change the result too. Changing the CPU operating points (and by
> extension at least CPU clocks) didn't impact the result though.

Thanks for taking such a scientific approach to this. Most developers
try values until it works, and call it done. It is nice to see
somebody doing some real study.

Russell quoted the standard, which says the delay needs to be between
1ns and 2.6ns, which is quite a wide range. So for a tx_delay value of
0x40, nominally 2000ps, your two values are within that range, and so
conform to the standard.

> While this could be observed with tx_delay property too, this property
> doesn't claim to provide a value in picoseconds that tx-internal-delay-ps
> would (but at the same time this didn't stop it to be implemented for the
> DSA switch we have which claims "more than 1.5ns" and nothing more, so maybe
> that would be acceptable?).
> 
> I feel uncomfortable contributing this considering the wildly different
> results across our very small test sample pool of two units and slightly
> different operating temperature.

I can understand that. But there is another way to look at this. I am
making a big jump from just two boards, but it seems to me, tx_delay
and rx_delay are pointless, if they produce such a wide range of
values from what should be identical boards. They cannot be used for
fine tuning because the same value has a 387ps difference, which is
huge compared to the 31ps step.

It seems to me, rx_delay and tx_delay should be deprecated, set to 0,
and let the PHY do they delays. If i remember correctly, that is what
you ended up with for you board?

	Andrew



