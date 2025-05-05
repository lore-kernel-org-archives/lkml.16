Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B721F419B;
	Mon,  5 May 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433609; cv=none; b=N8IlrG9R9gyykX9K6cEGNGJQbnL+9mfdsLPtFZnuwGq0NS4GPokdwW7TARwSwgzd9R9I+XLpQmhl76Uh6kKmlUnX8SmC6hv8o8FfHsgzh1UiP4keg2QoJy3b6jhnvo2M3uOEykn/tdb1ZQ+JoLmdwESlfvg2LLfrq3fTv7kUnPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433609; c=relaxed/simple;
	bh=28fTn6+CXDdAMNn1wgavj1F/LzHm79b1rTFHO2xS54c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYKVwvxNRq/yFICB9gHywK230qeD0ipDq/BFrkEYAPcFoJCdYiy4B+d2dqwlhj99CFqTRPfSk7BqqRsW4OMAWL8yQtBsPe6oKY2Jx3Tx2lyH4i347Lvr2LNe2qz0QKLYQwtfKzSC7hr9vOvvouMoisEU+Imx+5r6b0F/vojzxO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CDZVROZn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CDZVROZn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CaqP67BMNYN7LC3R6Za31vMQCwrdPvTZaPLg+kYHYg0=; b=CDZVROZnK5s3N3ZD5m2+gPI0rb
	IpJO40oDZQTV2yVohzoCyzs/A8zlfHNuDX3F/virOmlQIWRaApvQOO8eZ0dr7SS59z9NCkKqKGB7l
	9RMGf1sLQ/aXCJZnoVQrqcJxPDrO01NzpTHEWSOPbGiL1w2eVJchzFyuWYlynNL32YC4cKdm+R9cO
	2BXFP2ZEmUrm2Jkqj9hLXN+mP3Hy8Z4iJUpCXxmAdLxZiX3lnN9trAGM3pnLFTlkRIdfkoCmUSlKH
	I/HYZZ9obtnBf6L9CzqrxgRYc4CFd0iCBaeKnCdtCrmQi7dBqd/srhcgIE0NKa7OXar84TI8OHLCL
	T/WnCB/w==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBr9g-0001Ho-Rb; Mon, 05 May 2025 10:26:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>
Subject: Re: [PATCH 0/2] Add phy+vcc supply to NanoPi R5S and Q64-B
Date: Mon,  5 May 2025 10:26:16 +0200
Message-ID: <174643357079.1204535.15682445178976713220.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503152917.138648-1-didi.debian@cknow.org>
References: <20250503152917.138648-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 May 2025 17:22:17 +0200, Diederik de Haas wrote:
> Testing on my NanoPi R5S and Quartz64 Model B brought some more issues
> with power supplies to light, so fix them as well.
> 
> Diederik de Haas (2):
>   arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
>   arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz64-b
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
      commit: fdc68be8a8acbea9630c3bca560b7a1cf3a952e2
[2/2] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz64-b
      commit: ec79aee752c6b5c7695cd82a57a8a9249d09316d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
