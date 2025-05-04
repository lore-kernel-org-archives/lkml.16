Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195217996;
	Sun,  4 May 2025 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746367955; cv=none; b=MsQHVM5KmRGTZ8Y1HTpbzOsDzdHJiVkISXxNhm2r/GVQ4VweqvsfGxJqP1iewct7lxeqoNyLeGGjEDwCglm3NaiX063h6Br/zlsVJYvSBZ95PL7SQ9hAQBytbc17EJxJqXN12vpPnTuUsw92V5MACZktkibYNsIIrvDCIWEncmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746367955; c=relaxed/simple;
	bh=gkkmFF2Sp2718kg5rXyr67yd5W54tZ4aYdEM2KFLYPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcRWIGyEqj9yL5wGsVa3R5n4rHbssJ+N6fGyn+2o4BsLCXe6RL1rzQLEYq30C77CeG8pIY0di/b1SKgYuOR/jjjjo335KHfQOT5tVRSiws7aX9N7eDVl83IgJdGOQ93O/bD4Z6js2nlcf/cePPlS++4uACY3b7B2g9hZttRG6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Bb7gjwRW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Bb7gjwRW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TzNUiPHYqKLKNt/h1EVZBJxW8aJwF1vX/txgWZiJsu0=; b=Bb7gjwRWfwJ0JouMGasFpiS43u
	2IVy3h2C3iqVfvL2e+Arxxj2/qvCygXe080JqRUEM2fgGLgQyoUhQzLvXmj6w8MHFE3UM4x/FmclU
	UXEFo7P/YG2GXi2IA5E0J6SRER3/SL/qm0tMnbdKCBpIVF77bFt7uHjrwNV2Hx78akqM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uBa4q-00BWXL-Q4; Sun, 04 May 2025 16:12:20 +0200
Date: Sun, 4 May 2025 16:12:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: John Clark <inindev@gmail.com>, heiko@sntech.de, robh@kernel.org,
	conor+dt@kernel.org, detlev.casanova@collabora.com,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
Message-ID: <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>

> > +&gmac0 {
> > +	clock_in_out = "output";
> > +	phy-handle = <&rgmii_phy0>;
> > +	phy-mode = "rgmii-rxid";
> 
> See Andrew's remark on v1 of this patch.

Hi John

If you have questions, please ask. It is not a good idea to silently
ignore reviewers comments. Either do something about it, ask
questions, or politely argue why the reviewer is wrong, because
sometimes we are.

> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&eth0m0_miim
> > +		     &eth0m0_tx_bus2
> > +		     &eth0m0_rx_bus2
> > +		     &eth0m0_rgmii_clk
> > +		     &eth0m0_rgmii_bus
> > +		     &ethm0_clk0_25m_out>;
> > +	snps,reset-gpio = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
> > +	snps,reset-active-low;
> > +	snps,reset-delays-us = <0 20000 100000>;
> 
> The snps,reset- props are depracated, please move to reset props in the
> Ethernet PHY node.

FYI: snps,dwmac.yaml says:

snps,reset-gpio:
    deprecated: true
    maxItems: 1
    description:
      PHY Reset GPIO

Anything with 'deprecated: true' you should not be using in new DT
blobs. Don't blindly copy vendor DT, you need to verify it is up to
Mainline quality, and if not, bring it up to Mainline quality.

> > +	tx_delay = <0x20>;

This property probably plays a role in the issue with phy-mode.

arch/arm64/boot/dts/rockchip$ grep "rgmii-id" *
rk3328-orangepi-r1-plus-lts.dts:	phy-mode = "rgmii-id";
rk3566-bigtreetech-cb2.dtsi:	phy-mode = "rgmii-id";
rk3566-nanopi-r3s.dts:	phy-mode = "rgmii-id";
rk3566-odroid-m1s.dts:	phy-mode = "rgmii-id";
rk3566-orangepi-3b.dtsi:	phy-mode = "rgmii-id";
rk3566-radxa-zero-3e.dts:	phy-mode = "rgmii-id";
rk3566-rock-3c.dts:	phy-mode = "rgmii-id";
rk3568-evb1-v10.dts:	phy-mode = "rgmii-id";
rk3568-evb1-v10.dts:	phy-mode = "rgmii-id";
...
etc.

You might be able to learn something from these.

	Andrew
