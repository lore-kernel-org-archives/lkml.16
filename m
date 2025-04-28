Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D1F9D9;
	Mon, 28 Apr 2025 12:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844373; cv=none; b=nUdevUBT4Qi0hrZqOk2oCvd6PB1aZ6CKtmEHYWu1yorxKLk37Be+nHg4t3/HlicpI+GbU25sLVEqYVT3iDPMiMHsX7/NC8zTd5JUj5gqAeXkApy/A2KU6Y1V78TqRdZQKOn2t0zHwPrdqzBkafxiAovg9khTPKzUI46eJMDQmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844373; c=relaxed/simple;
	bh=yWj3z5sDeIA3NI9OQ0I6m+gxkb7W090nH26iof3ThUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvEjs0bYXMuZGzrCaJ2ym/ei6ADr560SdIyge37X4LWMt6dheEefAjC/Ki/LjsE5iX/U5xLPxKEEXUCTs8LzriarATB1sz0dDPDBjbyNV00T0YdkCM0yWs/ZYya2N5ySv4ZCupPkEsSE4Mrf52LUbsqes9t+AvzhXyFQfv83E1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=rVu+aJxM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rVu+aJxM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M8HFfAjikHg///ljRi+LTR+AKhrdVRjDdpitnpTBu/M=; b=rVu+aJxMy3TeYosH2Nev8ql1Ry
	76SzVzr+BlV+154A+GFXvAu87sxcC3PZ0IaLykHvK5rXFdMNP57p3yYBJhFtpa/55HmxKeVolCjwt
	wNc2ZGRYLV5UZRjqzIKAZjf4EOzyXDFV+U4S5TQCb5kCLuOkcqMXt6lpnjfbiQWzAB2g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9Nrn-00ApwX-Uy; Mon, 28 Apr 2025 14:45:47 +0200
Date: Mon, 28 Apr 2025 14:45:47 +0200
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
Message-ID: <15ee1a6b-55ba-41e9-b8a0-6e0bf62cabf0@lunn.ch>
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-3-kernel@airkyi.com>
 <6291f6b8-75d3-4243-9935-9b64450e2b7f@lunn.ch>
 <c583c59a-d5b7-4e20-9a1f-96f51bd7b4f3@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c583c59a-d5b7-4e20-9a1f-96f51bd7b4f3@rock-chips.com>

On Mon, Apr 28, 2025 at 09:47:34AM +0800, Chaoyi Chen wrote:
> Hi Andrew,
> 
> On 2025/4/28 4:42, Andrew Lunn wrote:
> > > +&gmac {
> > > +	assigned-clocks = <&cru SCLK_RMII_SRC>;
> > > +	assigned-clock-parents = <&clkin_gmac>;
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&rgmii_pins>;
> > > +	clock_in_out = "input";
> > > +	phy-supply = <&vcc_phy>;
> > > +	phy-mode = "rgmii";
> > Does the PCB have extra long clock lines to implement the RGMII 2ns
> > delay?
> The 2ns delay of RGMII is implemented inside the RK3399 chip instead of PCB
> lines, and there are also additional delayline configurations.

If the PCB does not implement the delay, rgmii is wrong.

If the MAC/PHY pair is implementing the delay, you need to use
rgmii-id. You can then use additional properties to fine tune the
delay the MAC/PHY is adding. And the Linux preference is that the PHY
adds the delay.

	Andrew
