Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A121CC71;
	Tue, 29 Apr 2025 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939381; cv=none; b=AWhBg82p+pzYxDdWaxlJrLsZAgkJ3NjzWMbgRtoAke4+HPm0IXDLM9bNOyuaGjTy+elAt4nvDNn2yA8S5w0SPjnI+Lb/99ixTcJBEhqauIv/Pdrf1CdnxUkt6AbNI1SKf7CQhxObyGODC8qH5L+TrxMDsY6ffDFRR0AJgqOTRbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939381; c=relaxed/simple;
	bh=TZueY6r4MtJVN4qtEpTvckm76JVmxT5yG3PqM8Wda0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmy4CRNjebfX3L+JH9BuPQlImsZVXmA6ktO5pzccqjW4xMk44xIH31l6kZsZVWZsqmsCrAYr3X5xEmQv5iDTN+N+5FOzwlnb0AsdmlClasQKZrpWGCYzW39F65PWcR4P9Z3c8tMGjD+lVHXKyU3R/9bLQ8kn/ttPPrzaKAGLN7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=XLfMdKhh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XLfMdKhh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=OduaXqO0vpWQkm2nTVR92WsTV4Q+eJ6nrxylSonj7oQ=; b=XL
	fMdKhhooPPpr7PglDfv/395KTHmc33skhhEu3pHQ8o3hzgpAyhN4ZI6NnVsCWyMyJWIzM/TZqp+5U
	njOmiFSDSiQjslO/jdmfKlJV8RRXoFHKrgY26MgyEsLM9F3NkY5QxCr1tRxO0p7xdrsOjhszVymot
	TIKFQDB196BQykY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9maI-00Ax53-Aq; Tue, 29 Apr 2025 17:09:22 +0200
Date: Tue, 29 Apr 2025 17:09:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
	samuel@sholland.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <2219754.irdbgypaU6@jernej-laptop>
 <34e30bf2-6f80-4c43-9e52-c1ebe0521c43@lunn.ch>
 <5880182.DvuYhMxLoT@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5880182.DvuYhMxLoT@jernej-laptop>

On Tue, Apr 29, 2025 at 04:51:59PM +0200, Jernej Škrabec wrote:
> Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni čas je Andrew Lunn napisal(a):
> > On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej Škrabec wrote:
> > > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni čas je Andrew Lunn napisal(a):
> > > > > > +&emac {
> > > > > > +	pinctrl-names = "default";
> > > > > > +	pinctrl-0 = <&ext_rgmii_pins>;
> > > > > > +	phy-mode = "rgmii-rxid";
> > > > > 
> > > > > So relating to what Andrew said earlier today, should this read rgmii-id
> > > > > instead? Since the strap resistors just set some boot-up value, but we
> > > > > want the PHY driver to enable both RX and TX delay programmatically?
> > > > 
> > > > Yes.
> > > > 
> > > > There is a checkpatch.pl patch working its way through the system
> > > > which will add warning about any rgmii value other than rgmii-id. Such
> > > > values need a comment that the PCB has extra long clock
> > > > lines. Hopefully that will make people actually stop and think about
> > > > this, rather than just copy broken vendor code.
> > > 
> > > I spent quite some time working on ethernet support for this board. Once
> > > I've found PHY datasheet, I confirmed that there is added delay. So this
> > > particular board needs "rgmii-rxid" mode.
> > 
> > There have been numerous discussions about what these rgmii modes
> > mean, because DT developers frequently get them wrong.
> > 
> > Does the PCB have an extra long clock line in the TX direction? That
> > is what rgmii-rxid means, the PCB is providing the TX delay, the
> > MAC/PHY pair needs to add the RX delay.
> 
> While schematic is accessible, AFAIK PCB/gerbers are not, so I can't really
> tell how long it is. But without this extra delay, ethernet doesn't work.

You are not adding an extra delay, you are subtracting a
delay. 'rgmii-rxid' says the TX delay is implemented by the PCB, hence
the PHY does not need to add the delay.

What is normal is that the PCB adds no delays, and the PHY adds the
delay for both the RX and the TX. And you represent this with
'rgmii-id'.

So what you need to find out is, where does the TX delay come from?

	Andrew
