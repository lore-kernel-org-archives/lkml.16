Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD02238142;
	Tue, 29 Apr 2025 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941534; cv=none; b=CtBcqsSa4mSOPKEzAY2hLkggklBLp607sFYByMOsMY6oMtagT1NalCqVO+YJtx4Epxgm8T0eA++149nzTQE/hFbAvIlsM64/S1D1JXA4lgVALdi++iiMzTJ0ZVYTA8aIcc6ktHLUQ83Jg/QBp9XHuqHo/QoTv9f0mMYwvzbR3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941534; c=relaxed/simple;
	bh=TFbZHOn4SQSbdZtheFl6YItHjFqVNzRoPLIElmn8Lu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imEfRNQDuV8g74+IbWb0Bfujy3aO2nd642Pa9nqSN37Kd9N5j36Pl3pjVUQhEPfnW4dwYbySQ/XWBBmOvSDlezFhspM/rgdnI+ZD8rI40y/u3LPhJycyjEOAaL5zN5Jb/0FP0KQwc4hpeAcRz8dyC2kHT/Zt4zieUAIu1+oEa30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=w/q8z4H6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="w/q8z4H6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hiDUcEAvkqAct7DYr49674W2ZeDjMHFKnQgfifte+sw=; b=w/q8z4H6p3pxP0VMQ72dJ7iUHL
	8UVYbXmdNTuoRKXbqStlm2tzHb2LciDe/oBZIkn7p4Ob8ZQ+sfjRIoJl/qMoNYZUvAA9YKde0eZSE
	UdVoZcoI80DDmP3u4+/fOiT6YJNq9N5emUKcO8yB+nRAMD5JqNYUcQeDIhjffjHmzVgQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9n9A-00AxJU-AE; Tue, 29 Apr 2025 17:45:24 +0200
Date: Tue, 29 Apr 2025 17:45:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
	samuel@sholland.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
 <4645060.LvFx2qVVIh@jernej-laptop>
 <4975791.GXAFRqVoOG@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4975791.GXAFRqVoOG@jernej-laptop>

> I just to be clear, I tested various combinations, including rgmii-id, and it
> didn't work, except rgmii-rxid, which matches strapping. Of course Motorcomm
> PHY driver took that into account and set registers accordingly.

So we have:

&emac {
	pinctrl-names = "default";
	pinctrl-0 = <&ext_rgmii_pins>;
	phy-mode = "rgmii-rxid";
	phy-handle = <&ext_rgmii_phy>;
	phy-supply = <&reg_gmac_3v3>;
	allwinner,rx-delay-ps = <0>;
	allwinner,tx-delay-ps = <700>;
	status = "okay";
};

and

&mdio {
	ext_rgmii_phy: ethernet-phy@1 {
		compatible = "ethernet-phy-ieee802.3-c22";
		reg = <1>;

		motorcomm,clk-out-frequency-hz = <125000000>;

		reset-gpios = <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
		reset-assert-us = <15000>;
		reset-deassert-us = <100000>;
	};
};

The RX path looks O.K. RGMII-RXID means the PHY should be adding the
2ns delay. The allwinner,rx-delay-ps = <0> should be redundant, that
should be the driver default. And there are no properties in the PHY
node about RX. All good.

TX is the problem. The allwinner,tx-delay-ps = <700> causes the MAC to
add 700ps delay, and 'rgmii-rxid' means the PHY should not add any
delay. But 700ps is too low. It should be around 2000ps. So something
else is adding a delay, or the 700ps is not really 700ps.

You say the PHY is a YT8531C. These PHYs also accept
rx-internal-delay-ps and tx-internal-delay-ps properties in their DT
node.

Try setting 'rgmii-id', allwinner,tx-delay-ps = <0>, and both
rx-internal-delay-ps and tx-internal-delay-ps in the PHY node to 1950.
If that does not work, try other values in the PHY node.

	Andrew
