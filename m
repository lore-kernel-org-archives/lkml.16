Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66561E98EC;
	Thu, 27 Mar 2025 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081273; cv=none; b=lxJ/IsJCjxmFdAe+ZBXHUtu+DWrTL8fkOkGxudaoNa3WWmqgEEQrdYYSgwjaXfgF3/QJmYZkNw/4oOc8d4NQP+twsY3qfNRhtCD6OZDbQgUvOp9tbm09C0fsBoRjDvwVFScaOBGzFxr0pYgQLVLI2YtUtflfJcNUQ/ThDp0oIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081273; c=relaxed/simple;
	bh=BPY/l5DCooBOnd2duEJQni/suWmytJExjLNYTcbLjdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KU4S5To/8GLzsoATQLBQ/kWKlB/maQIsZDUPigAkG7Ftvc+VbifYeOZvF7YQSiPA1f7fuRmpWOK5yUFBiHZflCqZcKRnwU7GxBk0wtLhZuUjUuz5qu9Tst3Mo1KV+KGqbyzlfetEYWkwI0S5PKMpiwtUVOveD8U1MCYxiacG6lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Pl2+sj8+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Pl2+sj8+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xd0Le9uNqc8iLeDsVGU9xvTYo37Co9fJowBFqoxOwKg=; b=Pl2+sj8+HxF9sbnbAkv6TbuvR3
	j2kjve1wh1KP7gKNFrylM0AFjGDDcuwIJH7+T0KGeL1inglPb60L7FLqWkKS1tPYnbU51PPJdsk0J
	Ocab63LddNV6acIOvYEC+0Ds5A4r7kaVcMO0n+dnLJOZ/Fmw65QLPXtffNgVvGyht578=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1txn3s-007Hlc-IF; Thu, 27 Mar 2025 14:14:20 +0100
Date: Thu, 27 Mar 2025 14:14:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Manikandan.M@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/3] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Message-ID: <807f29fe-2fe1-455b-8357-4caafc45090e@lunn.ch>
References: <20250326072140.172244-1-manikandan.m@microchip.com>
 <20250326072140.172244-4-manikandan.m@microchip.com>
 <eed1531a-353a-4244-a10a-95e67c8416ae@lunn.ch>
 <906d596b-391b-43ec-8654-38de64f043f1@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <906d596b-391b-43ec-8654-38de64f043f1@microchip.com>

On Thu, Mar 27, 2025 at 06:03:05AM +0000, Manikandan.M@microchip.com wrote:
> Hi Andrew Lunn,
> 
> On 26/03/25 6:48 pm, Andrew Lunn wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Wed, Mar 26, 2025 at 12:51:40PM +0530, Manikandan Muralidharan wrote:
> >> Add nvmem-layout in QSPI to read the EUI48 Mac address by the
> >> net drivers using the nvmem property.The offset is set to 0x0
> >> since the factory programmed address is available in the
> >> resource managed space and the size determine if the requested
> >> address is of EUI48 (0x6) or EUI-64 (0x8) type.
> >> This is useful for cases where U-Boot is skipped and the Ethernet
> >> MAC address is needed to be configured by the kernel
> >>
> >> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> >> ---
> >>   .../arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> >> index 35756cc01e68..6c5ff08f0b3f 100644
> >> --- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> >> +++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> >> @@ -478,6 +478,16 @@ flash@0 {
> >>                label = "atmel_qspi1";
> >>                status = "okay";
> >>
> >> +             nvmem-layout {
> >> +                     compatible = "fixed-layout";
> >> +                     #address-cells = <1>;
> >> +                     #size-cells = <1>;
> >> +
> >> +                     mac_address_eui48: mac-address@0 {
> >> +                             reg = <0x0 0x6>;
> >> +                     };
> >> +             };
> >> +
> > 
> > I've not looked too deeply how this all works. Don't you need a
> > reference in the ethernet node pointing to this?
> Yes we need a reference to 'mac_address_eui48' using nvmem-cells in the 
> Ethernet node, since the sama5d29_curiosity uses a daughter card for PHY 
> [1], the DTS properties are defined in overlay files. Here is the quick 
> usage of the nvmem ref in the ethernet node:
> 	macb0 {
> 		nvmem-cells = <&mac_address_eui48>;
> 		nvmem-cell-names = "mac-address";
> 		
> 		phy {
> 
> 		};
> 	};

So why are you not adding this as part of this patch?

> > And are there ordering issues? Boards used to use the MAC address from
> > somewhere else now start using this address, causing a change in
> > behaviour. I would expect somewhere a comment that this MAC address
> > will be used last, after all other options have been tried, in order
> > to avoid regressions.
> > 
> The order of search is documented in of_get_mac_address() in 
> net/core/of_net.c file
> 
> The driver attempts to retrieve the MAC address through a hierarchical 
> approach: first checking device tree properties, then exploring NVMEM 
> cells, followed by the U-Boot 'ethaddr' environment variable. If no 
> valid MAC address is found through these methods, the driver will 
> generate a random but valid MAC address as a final fallback mechanism.

This is not quite correct. macb first uses
of_get_ethdev_address()->of_get_mac_address() which looks for DT
properties:

	ret = of_get_mac_addr(np, "mac-address", addr);
	if (!ret)
		return 0;

	ret = of_get_mac_addr(np, "local-mac-address", addr);
	if (!ret)
		return 0;

	ret = of_get_mac_addr(np, "address", addr);
	if (!ret)
		return 0;

And then it looks in nvram.

	return of_get_mac_address_nvmem(np, addr);

If they all fail, it uses macb_get_hwaddr() which looks in 4 different
locations within the macb register set.

Then lastly it uses a random MAC address.

So with your proposed change, anybody using the curiosity board and
this last mechanism to set the MAC address sees a change in behaviour,
it will start using nvram instead. You should at least document this,
and if possible, argue that nobody is using this last mechanism
because ....

	Andrew
