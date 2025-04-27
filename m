Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7788F5A;
	Sun, 27 Apr 2025 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745786598; cv=none; b=ZFLEzT8r/Z0UZeFs/6dLqFkNrhCsqHMAOdaRyQMUtDbO6Xjlg0MDKey57AcCEA0x6Ed9bGDK/3ZLdV/a7FojDZoQJEKsKc0qwN/JXp1uENOqalMFB7LmHF9DrjTHMw9j5lkkGFCXjkp7/P/Fv096XriSkJ6mKUbl13WmPnJ+Mrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745786598; c=relaxed/simple;
	bh=Dqkhm7rHKIwu1jHPI9TWUF5c8KPxVS0sl5eK16zQf5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6k7+FR4vj0BxJpX2f0OwtDiy3S4rxW9ND7rwSr0D/nrnibKexhd7SVYYCfgak82pSf2ObnxtHru0vzc10S0t+SIfFQzcTeLX2ISS3FkBp4JCzB5mkIT71BCJdfBNHXsGOZickbTnDLHhFU9NOnKN0QupCNkX05b8R3G+AfpQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yKerti9/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yKerti9/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Tl7OXQaIr8vYn2l9EMuLZFrZfGWU84ju/nbYhGZC7Uc=; b=yKerti9/SoymfMpSROO6drskcG
	C/sLpxGNxhLd6RyafH0eaGQGF8O6BuKDTasNE0Kf2PJz/VXeaHYkhqUHf3pmh9NUNXQNdvHYTrkUD
	e68kxmsk9D/W0n+gNaYaPETvSWBD4YvjVOO+D0KeDlyIQfX4tL9YDjPv+Jd5uTc24Nzw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u98pi-00AlfG-42; Sun, 27 Apr 2025 22:42:38 +0200
Date: Sun, 27 Apr 2025 22:42:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
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
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Message-ID: <6291f6b8-75d3-4243-9935-9b64450e2b7f@lunn.ch>
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427094211.246-3-kernel@airkyi.com>

> +&gmac {
> +	assigned-clocks = <&cru SCLK_RMII_SRC>;
> +	assigned-clock-parents = <&clkin_gmac>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii_pins>;
> +	clock_in_out = "input";
> +	phy-supply = <&vcc_phy>;
> +	phy-mode = "rgmii";

Does the PCB have extra long clock lines to implement the RGMII 2ns
delay?

	Andrew
