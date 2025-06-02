Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF21805A;
	Mon,  2 Jun 2025 02:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748830166; cv=none; b=TOCqE97Vc8KOeQj/c4MSbpieJn2OJh+s0msr+qpZN/+oBxk8pYleaEJ8Okjo9bF3GPidVV8ser37dEZLxJuFix0rY1WpiYtduNg9JozeU3XMusA3ksHxbVRcA4QolYAtBBJ/9elVJXme6aTILhceraamDLVtPuuZImCw5e6rUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748830166; c=relaxed/simple;
	bh=Des96kx03dqeUX3f6uVZx5O0Xl0Hv4pcKQ7YRSzBaKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ih1ed/iXonAi3CMm5jW1jrvJtvY3MShy3RnvL1wNIHiG0BlxfDqrf6g8spZJzLeOs9y01LdPkuLYYMuTC/3Oa210SZUI2l2ZdMzJXGkNtTnkxn4Ypbnx7WN8Ec/qS+rEz5nxo/XEGvg4w65NOmRXJMw/l73iu6DaKOTIlKIm/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uSz9ekKV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uSz9ekKV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=d1ICQTT0Rg5TH6VqXWjJIx5h6SXfLiF2uQPFAA/zAgM=; b=uS
	z9ekKVA1+8dCedTF/EeSwI2lQx7MPHqdYeB0SO68ckLK9NFGwbh4CISZ2FuLJoXu7Zj2IH1BvIv70
	3D4WZzR7ovjqTenu3t1Cvo7+Slb/Ho6/acontFtxtmhm327klwlQ2mSMG3k9mrutK1LP9YnXRA7c2
	nk1F6b4/n54tpzE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uLubr-00ETbT-6u; Mon, 02 Jun 2025 04:09:07 +0200
Date: Mon, 2 Jun 2025 04:09:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christoph Stoidner <C.Stoidner@phytec.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Message-ID: <8e448625-b4ad-4bf1-8930-6fecdedb1d8d@lunn.ch>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
 <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
 <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>

On Fri, May 30, 2025 at 01:40:38PM +0000, Christoph Stoidner wrote:
> 
> 
> On Mi, 2025-05-28 at 21:29 +0200, Andrew Lunn wrote:
> > > Yes, that's what I measured. For analysis, I added some
> > > debug outputs
> > > to
> > > the phy reset and the 1st phy register access. And as I can see,
> > > the
> > > phy register access happens when userland sets up the network:
> > 
> > Please repeat the measurements with NFS root.
> > 
> > You will find that the kernel brings the interface up right have
> > register_netdev() is called, and starts transmitting. It can happen
> > before register_netdev() even returns.
> 
> Thanks for that hint. As you said, with nfs root the register access
> happens much earlier. I measured:
> 
>        [   1.713185] DEB-PHY: mdio reset exeucted
>        ...
>        ...
>        ...
>        [   2.672892] DEB-PHY: register access
> 
> However, the delta time of 0.959707s (9597ms) still meets the T2
> ("prior to MDC preamble for register access") that is defined in the
> PHY's datasheet with 2ms.

I agree it is long enough, but i'm also surprised how slow the kernel
was. Are you using a fixed IP address, or dhcp?

	Andrew
