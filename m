Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A32C1E18;
	Tue, 29 Apr 2025 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929388; cv=none; b=oPr8Y5tC53Jk5AcnWMddLEAHlUcYwhhgOCS0/5RW40Aa828NRQ8PE/XcpqIL0hWaWeplOhcLurX4qOHfprMv0jHhPttguzw0bPQAmUWt8/0jCOurA0nEy/lnEnuptxgd+WOsSKRV+n/udP3o5PogLUnq3KM9dHjpBVhPtZVT6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929388; c=relaxed/simple;
	bh=SO41IKWTVvqV4D3+FRZ/tUk6OohKSoK9TPXyWG7LeuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TH2Eb7sQ1bHQFSg43Pqk/sn7P2sQLM3l14+3isQSSSVBBVqApnJ8kaJqBnkx6mtTSmb8CQCfxYkQ+x17WFCcIOpswhVc8G4twa4kmjEJ6vQryh4/ybCJh132p/OPBVCBOUgggNXnlEorbQB+q2nAFH+m/a1o6S2dw4A4l1moGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=B2iKM9Pp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="B2iKM9Pp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=meoPhVggS3wumqy6Ke2Ko62bIsOAQVu1jBlESn1C8SM=; b=B2
	iKM9PpkWmwizh8mO2WAIDAqfutsjR8oH4aJj8DxFvS8Uk6oE7cmBCvS0aM9BQd3NWwm2X9uX+MRlw
	N0SoQLzsQBOxRkXjh+tTXitrlzC+inE+6+BYrhV06OoWv8+wx+PeldZ9yILlKNXCNbpgOQEMTnlpF
	j8omBVlKPikhDaA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9jyy-00Aw3n-Vi; Tue, 29 Apr 2025 14:22:40 +0200
Date: Tue, 29 Apr 2025 14:22:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Message-ID: <c9b46d09-f1ed-4549-8267-9a38ceca6461@lunn.ch>
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-3-kernel@airkyi.com>
 <6291f6b8-75d3-4243-9935-9b64450e2b7f@lunn.ch>
 <c583c59a-d5b7-4e20-9a1f-96f51bd7b4f3@rock-chips.com>
 <15ee1a6b-55ba-41e9-b8a0-6e0bf62cabf0@lunn.ch>
 <027de192-4227-4010-a759-5283b6af1531@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <027de192-4227-4010-a759-5283b6af1531@rock-chips.com>

On Tue, Apr 29, 2025 at 10:42:59AM +0800, Chaoyi Chen wrote:
> Hi Andrew,
> 
> On 2025/4/28 20:45, Andrew Lunn wrote:
> > On Mon, Apr 28, 2025 at 09:47:34AM +0800, Chaoyi Chen wrote:
> > > Hi Andrew,
> > > 
> > > On 2025/4/28 4:42, Andrew Lunn wrote:
> > > > > +&gmac {
> > > > > +	assigned-clocks = <&cru SCLK_RMII_SRC>;
> > > > > +	assigned-clock-parents = <&clkin_gmac>;
> > > > > +	pinctrl-names = "default";
> > > > > +	pinctrl-0 = <&rgmii_pins>;
> > > > > +	clock_in_out = "input";
> > > > > +	phy-supply = <&vcc_phy>;
> > > > > +	phy-mode = "rgmii";
> > > > Does the PCB have extra long clock lines to implement the RGMII 2ns
> > > > delay?
> > > The 2ns delay of RGMII is implemented inside the RK3399 chip instead of PCB
> > > lines, and there are also additional delayline configurations.
> > If the PCB does not implement the delay, rgmii is wrong.
> > 
> > If the MAC/PHY pair is implementing the delay, you need to use
> > rgmii-id. You can then use additional properties to fine tune the
> > delay the MAC/PHY is adding. And the Linux preference is that the PHY
> > adds the delay.
> 
> The signal path of RK3399 is as follows:
> 
> MAC <---> IO <---> PHY
> 
> In fact, the delay is added to the path between the MAC and the IO, rather
> than being implemented in the MAC itself. These delay value is controlled by
> the GRF register[0] . These paths are implemented inside the SoC and have
> not yet reached the board level.

'rgmii' implies that the PCB is implementing the delay. Since this is
not the case here, you should be using rgmii-id.

> According to the document[1], use "rgmii" when "RX and TX delays are added
> by the MAC when required". In addition, currently we can see that all RK3399
> boards use "rgmii".  Is there anything I missed? Thank you.

What you are missing is that they are all wrong. Quite a few systems
get is wrong at the moment, and i'm being more strict. Ideally i want
to stop more examples of wrong rgmii being added. There is also a
discussion going on to clarify the documentation.

Implementing delays via the IO is also reasonably common. The MAC
should have control over the GRF register, normally via syscon. So the
MAC can implement correct behaviour. The default is that the MAC,
including IO, adds 0 delay, passes phy-mode to the PHY and the PHY
adds the delay.

Please consider how you can fix the MAC driver without breaking all
the boards using the wrong rgmii value. There are a few discussion
about this on the mailing list if you go searching.

	Andrew
