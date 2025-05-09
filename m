Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF3525F7A3;
	Fri,  9 May 2025 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820857; cv=none; b=hYl+WnQU8YYOnyPU5hqK/lVt3XpcKfCc6ywpbohlqm0v0j8lavLHLyXtOdtrkWbCsfRZIHe3fzSU1YNzSKRW60doIf5r02nqRAnc6N3WzDcGnvGyb5o3O+7SDSirSiOI8WFadXNdK3NrQNqDrqImd1DSAw55adswjwbqGMiGNcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820857; c=relaxed/simple;
	bh=EYPbeljWb7wX4CgVCbYqkaY79Xcn2m9UEvjdluE1Bg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8gUsq1ZUinDY2z7Gxth73ut+ZddIUR18V1rhPnSPv6CCjmIkW0baoQZnTuBgKVmoUsIV7JtFoymd5Vmw4Nv1gdftkc/fm9C+bBnYWLuFd9Ejmk1vercunWMlTuMMuRiCoDLHhJOMWtd2+U2QJhaRfo2NGrsLx2jlFX4oBoZvZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=upIHKf68; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="upIHKf68"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9Tr4avpC+MzvgrSxOKKwZnty7WT+VJA3Ia5CbcZG9eE=; b=upIHKf688KyjcXYyPtW85pwgAt
	C3OPu7vGZALzoW+7SD/d5roc59G9tisVuiDh5oUDHm7g0SVCfNADoOYVeSZlffaBDy5H5B4A5U/6u
	7ky80Mb8PyHLhepkFO1a+b/o8r2W6Wl4SS98QIacNpO/T+JREjHIibuCqqcw4UzHkm0S+C+l2ehTP
	lWjy6VEoP/0xSK8vfIObJ55cdhNIFkNezFMFrEdBCMtcn5eJACSd9CU5bteWUxPLrzYcrSHDPCOHE
	09ul8USQrhUCLJg5jv3RdAzLO+yQ/mSOj4Pc5kLdsKby7uup2BspuBZgwcvsWszYBW1HS8dUYKKSz
	ElCunnmQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDTtZ-0004Jo-R4; Fri, 09 May 2025 22:00:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for rk3399 industry evaluation board
Date: Fri,  9 May 2025 22:00:20 +0200
Message-ID: <174682074869.2029046.5714989650782845441.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250506034347.57-1-kernel@airkyi.com>
References: <20250506034347.57-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 May 2025 11:43:45 +0800, Chaoyi Chen wrote:
> General feature for rk3399 industry evaluation board:
> - Rockchip RK3399
> - 4GB LPDDR4
> - emmc5.1
> - SDIO3.0 compatible TF card
> - 1x HDMI2.0a TX
> - 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
> - 1x type-c DisplayPort
> - 3x USB3.0 Host
> - 1x USB2.0 Host
> - 1x Ethernet / USB3.0 to Ethernet
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
      commit: ff7c417e54a8cca74db147ba0417ecdfcb99f89c
[2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
      commit: 2435fca0580ca9b58a8c5a71e5bd61b9707bc313

Dropped the regulator-compatible and reordered some minor things.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
