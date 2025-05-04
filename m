Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2066A4C85;
	Sun,  4 May 2025 23:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746399696; cv=none; b=tDuv2ANWfu4hpMkucf5clIfllHErv4XOcrMq2xo+1dnlXI5G0U2vy9eJyy13uHBSPMxwC+VpEccknZrwmnoeVCepmXa4kNKTh3SwIlHnUIwsQibij8XXz+QOvr8iOiW3Bl7YyvJND498BS5z98D9hRPVIqE3i5G6mm85SaPmtDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746399696; c=relaxed/simple;
	bh=oE1hrTnXs9NdwNShWFu/3cUCsgQBh3gXWlmkpqMA40s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbEKYLfIHhsQE0DgdN5zhwV/Bz09c5eBwyN86jZP+0o/VemBrVjfYgFaDT01RL05TgfiR5UGaPEmDz8JMukVLuv7qdc5fsoEf6p6gD++kpUELKlckbBHy0I5QpQmCt+Uzt1Kxl/B7RQaT6AtIvEXIkJnvJGh3q4+BYlNIRs2UGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SuQSMudD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SuQSMudD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=5PJe2ch6Ms9zAWsGh5fiiCAopiENydoBhMUp03HMdLo=; b=Su
	QSMudDNeSIFw4mG21Xq7Nd7Y6OEN3p/4e540kK6Sfexrcf2dcqu3LUJ71vvB9RDKuZmxAWfwJR69/
	vAEjQDOGoaMvFx+g+/RzpEcBPS0no2ZY16Wuo3tdc2BZ/KoyANwn11ZM2UyGhL2XD47BfpHMeLNLo
	CktRoO4lWndTV5k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uBiKt-00BYej-Pv; Mon, 05 May 2025 01:01:27 +0200
Date: Mon, 5 May 2025 01:01:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: John Clark <inindev@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
	conor+dt@kernel.org, detlev.casanova@collabora.com,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
Message-ID: <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>

On Sun, May 04, 2025 at 05:02:33PM -0400, John Clark wrote:
> On 5/4/25 10:12 AM, Andrew Lunn wrote:
> > > > +&gmac0 {
> > > > +	clock_in_out = "output";
> > > > +	phy-handle = <&rgmii_phy0>;
> > > > +	phy-mode = "rgmii-rxid";
> > > 
> > > See Andrew's remark on v1 of this patch.
> > 
> > Hi John
> > 
> > If you have questions, please ask. It is not a good idea to silently
> > ignore reviewers comments. Either do something about it, ask
> > questions, or politely argue why the reviewer is wrong, because
> > sometimes we are.
> > 
> Hi Andrew,
> Thanks for your feedback and the link to the RGMII delays discussion. I
> assumed you suggested switching to phy-mode = "rgmii-id" from rgmii-rxid.
> The vendor’s downstream kernel uses rgmii-rxid with tx_delay = <0x20>, as
> shown in my post. I tried rgmii-id and removed tx_delay, but the interface
> failed to get a DHCP address. Reverting to rgmii-rxid with the delay
> restored functionality. Any advice on correctly configuring rgmii-id or
> adjusting delays for this board?

What PHY is it? Are you using the correct PHY driver for it, or
genphy?

rk3576-rock-4d.dts and rk3576-armsom-sige5.dts show that it is
possible to use this SoC with the correct 'rgmii-id', 

	Andrew
