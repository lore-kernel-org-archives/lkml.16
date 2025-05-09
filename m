Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272E25E815;
	Fri,  9 May 2025 20:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820851; cv=none; b=HzRxpGRb1nvZZOFz/AgJTB5O8gBgW3UdC4t9Ii7pzAmVlYir4NWutwySwOcl61+oDsJ2MiCtEmUU3ukTP6PbPWSRrvhaReCpOt3gkWrqjDB/xIbisstbDzlCNBlbJZCXy693HjNnesGHK+8ulMk50ZHNNxgt37HoZ3AkTaGxO0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820851; c=relaxed/simple;
	bh=wiOVd+vFk5rdFuhZzV/kyvgEtuq/lWI8M+zV5v2Leo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NizXUbKOE3QvOlU4vkRPZrCqDGmMh41Hu/thMoM2x7Py5kCrbzf8lr9vL8hr1zP+sJwdo0G+QqWe5NEK2Tesz7mQ9djbVX5cKHCQJweowfgodpg5gEQEIrHJefHfsVxep1vX5Bcwpnq4xkXGeazFVosC2mkjdx25JrPy30Ti+uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QcULRaeW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QcULRaeW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i0QTL6OGoLDoSHo02DwPWhUp/ii7lcgusrtzJi+Dd24=; b=QcULRaeWBG0HypA38YARbZ+MZa
	G6dGDhQkzY7/zF+XtNGvIp/ww5yqiwJLRB0FK+PINYJ02h3JUqHF83wiqKovAiKWqnArwx6HLlJPh
	BI+llkEE50dJACP4dsvkvpG8e2LOSj1FxghJyq988noOvadB+tOWDChqo48ty/S7iDExNzaSG+Hmw
	/ajS7q8HPClfKXcmASay4oV35JwGIVo69BgeX7ErikyYIjWFL5WR7XrDnlBr/w+c96Vxfho6SN3Zw
	i4FI0SgUKa4B2BLKoMi7F8oOPqMUcyRRIG4qIg3MAimo4NrUvRvfIVmHpQhuszVZU7bUdKDsC/3m3
	e3PRuT2w==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDTta-0004Jo-N8; Fri, 09 May 2025 22:00:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add RK3576 SAI Audio Controller Support
Date: Fri,  9 May 2025 22:00:21 +0200
Message-ID: <174682074864.2029046.1413189234015489546.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
References: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 May 2025 12:42:39 +0200, Nicolas Frattaroli wrote:
> This series adds support for Rockchip's Serial Audio Interface (SAI)
> controller, found on SoCs such as the RK3576. The SAI is a flexible
> controller IP that allows both transmitting and receiving digital audio
> in the I2S, TDM and PCM formats. Instances of this controller are used
> both for externally exposed audio interfaces, as well as for audio on
> video interfaces such as HDMI.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: rockchip: Add RK3576 SAI nodes
      commit: 3dfeccdd3cc88792e631539792a1ecc37a9581dc
[2/5] arm64: dts: rockchip: Add RK3576 HDMI audio
      commit: 7f1561d82e3d3589038782f75faa50c65d9cdd42
[3/5] arm64: dts: rockchip: Add analog audio on RK3576 Sige5
      commit: f4a9c9fbf02c8948029846aba63c65c0425cb275
[4/5] arm64: dts: rockchip: Enable HDMI audio on Sige5
      commit: fcdeb39bb5615c4bb36f69d2ec11f25b54168304
[5/5] arm64: defconfig: Enable Rockchip SAI and ES8328
      commit: bd088836a10e418aaf7dbda4a1db9da864f09fb8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
