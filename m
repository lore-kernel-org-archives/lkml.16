Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F26268FFF;
	Mon, 28 Apr 2025 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843886; cv=none; b=CR0HyqdM/rIOOSG7CSTY66UjntRlPkNl23kz610tmAVBuOEcFtr0KXFx47xeuTu31lWdiGstkrvNZmZridI/CosaJVsh9AIDBiY/WJ8YXBDgGtPL3M903G8I8exdm+9cD8RKKp+tM1Ig4yIOmYySuWVtpv6C40Nkxi5z1kyt9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843886; c=relaxed/simple;
	bh=meHWLVZ0S5MilVqdf5x6PAb4kftFLYvDmsZ1UCGAZoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9uDrYLJHkbxD0skslweNt4s4PDe2a44/LGk54/KfYtkN1zSzeBDVS2EzMquw0KVPELk3KSEA3BzUzFfHOlVVuSAEOwogQT3zBzMyHVe2gjM8o1r24lsWOBcCPph8Z6//7dUvLrsEtVw6A1cMFwKnaNrxUwUWIcl50skWR6X0kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=d0FVi0lS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="d0FVi0lS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=dH/FvjHE8lshhA2GzAYCh4KC+tngQVadf9pdXMFOnjI=; b=d0
	FVi0lSLJts6XaHlfuaVTqfbQlGFln20eaztuujqTEbBR2i8yn4Zf7TAF06sWq8vpWuEQb0cWOxG+g
	e5pbH2bSpZAXbo7Waa46KZIhptnYsMfl6hxPJ9ILCMu5iR7AiZ6FXWvIItQ4gllGkewnTfHNY/cHB
	dLMHkIPA6XTVe8Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9Nk4-00Apse-Im; Mon, 28 Apr 2025 14:37:48 +0200
Date: Mon, 28 Apr 2025 14:37:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
	samuel@sholland.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <34e30bf2-6f80-4c43-9e52-c1ebe0521c43@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250425135429.174a1871@donnerap.manchester.arm.com>
 <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
 <2219754.irdbgypaU6@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2219754.irdbgypaU6@jernej-laptop>

On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej Škrabec wrote:
> Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni čas je Andrew Lunn napisal(a):
> > > > +&emac {
> > > > +	pinctrl-names = "default";
> > > > +	pinctrl-0 = <&ext_rgmii_pins>;
> > > > +	phy-mode = "rgmii-rxid";
> > > 
> > > So relating to what Andrew said earlier today, should this read rgmii-id
> > > instead? Since the strap resistors just set some boot-up value, but we
> > > want the PHY driver to enable both RX and TX delay programmatically?
> > 
> > Yes.
> > 
> > There is a checkpatch.pl patch working its way through the system
> > which will add warning about any rgmii value other than rgmii-id. Such
> > values need a comment that the PCB has extra long clock
> > lines. Hopefully that will make people actually stop and think about
> > this, rather than just copy broken vendor code.
> 
> I spent quite some time working on ethernet support for this board. Once
> I've found PHY datasheet, I confirmed that there is added delay. So this
> particular board needs "rgmii-rxid" mode.

There have been numerous discussions about what these rgmii modes
mean, because DT developers frequently get them wrong.

Does the PCB have an extra long clock line in the TX direction? That
is what rgmii-rxid means, the PCB is providing the TX delay, the
MAC/PHY pair needs to add the RX delay.

Ignore strapping. That is just a power on default which gets over
ridden once the PHY driver is running.

What PHY is this?

	Andrew
