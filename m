Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B4248191;
	Tue, 29 Apr 2025 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945780; cv=none; b=Ri9axr/UJj1DLWj16RgES4517PXHG7SzPyU1H0WrDjKkSas+j2ee0lW0u5ZT6jnd+ztAUeIY+ThfG640QObva3OP+X0l7IpX8AvUVNdStxGriEzicoKMSD/jRMgaF1oRABF0hMJnG0wkomit8bJPte807RpBycVDWpDByclZVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945780; c=relaxed/simple;
	bh=ZBivkq4bsRKPhUyFGxJQG9MmcvXaxlQ9Dd4wSsqIJSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8WKjkMnC/pl3HClMh2B11IHLpcz/e52/6ijQK+93KuzZ3lvyZVufjDOpuYK6b8s8w7eaH0HpjblHr+Mfnr9ywXpKH7VA7N2Q+33GEDqPdsPKf7Qb0W1Vvx4uGduVS3XMN1F1b9C1K+3vRj1OJR0tIZu6Qe+IINU51GyRuoa8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Ho9e5Jmd; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Ho9e5Jmd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=r5rlUDCcvbNorSSfBxhY0Uo2Pju4LLTw7V0kTzWGnw0=; b=Ho9e5JmdTFW+pLmFUi4wNow9wm
	VXlhmjwcdIcVeswarlOATW52sNWISJ24fB8EbnhqWkVPq5rWXCKE4XW6CCvksmzSNXGu6Rjho0bq/
	E09xKIHdsgcp/D40bvZt6p8bdcgD1GU2aPoc/q59R6QMlkz38uxPZV9YB6ACDKlDfR3Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9oFc-00AxlT-0j; Tue, 29 Apr 2025 18:56:08 +0200
Date: Tue, 29 Apr 2025 18:56:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, samuel@sholland.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <b98d6bab-d3bb-44d2-9dbf-623dfb673671@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
 <4645060.LvFx2qVVIh@jernej-laptop>
 <4975791.GXAFRqVoOG@jernej-laptop>
 <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
 <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>

> > The RX path looks O.K. RGMII-RXID means the PHY should be adding the
> > 2ns delay. The allwinner,rx-delay-ps = <0> should be redundant, that
> > should be the driver default. And there are no properties in the PHY
> > node about RX. All good.
> 
> The default action when the property is missing is to leave the hardware
> settings alone. I admit this doesn't match the bindings.

Please submit a patch fix the binding.

> > TX is the problem. The allwinner,tx-delay-ps = <700> causes the MAC to
> > add 700ps delay, and 'rgmii-rxid' means the PHY should not add any
> > delay. But 700ps is too low. It should be around 2000ps. So something
> > else is adding a delay, or the 700ps is not really 700ps.
> 
> Anything is possible. As was raised in a previous reply, it's possible
> instead of extending the delay range, the decreased the step size and
> added more steps. The problem is we don't really know.

By poking around with other configuration knobs, i hope we can
determine if this 700ps actually is 700ps.

> > You say the PHY is a YT8531C. These PHYs also accept
> > rx-internal-delay-ps and tx-internal-delay-ps properties in their DT
> > node.
> >
> > Try setting 'rgmii-id', allwinner,tx-delay-ps = <0>, and both
> > rx-internal-delay-ps and tx-internal-delay-ps in the PHY node to 1950.
> > If that does not work, try other values in the PHY node.
> 
> I don't get why we should ignore the strappings instead of using them
> as reference or even truth.

If you don't want the PHY to be reprogrammed pass:

* @PHY_INTERFACE_MODE_NA: Not Applicable - don't touch

rather than one of

 * @PHY_INTERFACE_MODE_RGMII: Reduced gigabit media-independent interface
 * @PHY_INTERFACE_MODE_RGMII_ID: RGMII with Internal RX+TX delay
 * @PHY_INTERFACE_MODE_RGMII_RXID: RGMII with Internal RX delay
 * @PHY_INTERFACE_MODE_RGMII_TXID: RGMII with Internal TX delay

However, if we do pass one of these RGMII modes, i expect the PHY to
follow them.

> If the strappings worked correctly w/ the
> generic PHY driver (that doesn't know how to configure the delay mode
> on the PHY side), isn't it working as intended?

The generic PHY driver is there as a fallback, for when the real PHY
driver is missing. It is nice if it works, but it often does not in
current systems.  What we really care about is that the real PHY
driver works, and the system as a whole follows the DT bindings.

	Andrew
