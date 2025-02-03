Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6001FECA0;
	Mon,  3 Feb 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570580; cv=none; b=Iut7gq+Xh0g832NuBCFbCsVQB0RpivKttwZIglKigB0SBPof1fA8twHIP8mU/G2S3cSoQLdL/EYpp0sXCdO50JeW6E6wa4wXfCLEgS2q+Kb+loBo21rYkndHgiucRcg18ufFUIYymwk8x/TrdgC0qZZF5yp0Pla6/t2rAnfUXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570580; c=relaxed/simple;
	bh=Ra/dFJWWE2FW5sJsJ5Ukgs9bHYv2WG3xLqjDX/wJXYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhJdjcZcHUF4/2gbUPskCctab+/0Vsd70W3OVVov3i1SHmykYF0aaN98jrAOmRo6BnvO4HHfJ2+zReKfuMz91fvkwqn+/B0FKIl57+R1wM6nvPcUNTA3zurP54oYGfuCOaKSGT86DTGHif+3CR6CfLq5etLHfhHEd8YSqwwinbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=sGBlaUI8; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="sGBlaUI8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=93epfxqDvQkA4VstYuNsyHFiuxB63dG0Zy3P5Z6o61s=; b=sGBlaUI8ZjlKrnUPITkJHL/AMn
	KyyeIUx/q14lm4YW+5pg1N/iPJYvZtJ5pJ59pW0qeKrHZ93/0xZjFLfQYlH3BFQOd++rXAPnv5zBT
	0Z7sQqsqV9seYcVkur8UoAgB/HjVLHyJIo2MyON9y1kqhEyhNsVWLLkeAZPVwnc7UKDmECcK7EguJ
	fwocgksbC/tCwDmdsiPbZQAWU8ozdjJBfANhMCpUHG/Jik1+asX5hTD3CBVpfJ+0Zjfvj3JtD+rqP
	cxW6X3iW67WKYlgEZNUX+s5BalDrF1Apj01zh/Gwyw6kVpFzjJdOCos7AV21OrEnnw95NlsLbjX8A
	ndHCvhlA==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1terck-0005Vr-UI; Mon, 03 Feb 2025 09:16:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	maz@kernel.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Use "dma-noncoherent" in base RK3588 SoC dtsi
Date: Mon,  3 Feb 2025 09:15:56 +0100
Message-ID: <173857053623.78657.5406481342048846452.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <fa1a672dae3644bb3caa58f03216d0ca349db88b.1736279094.git.dsimic@manjaro.org>
References: <fa1a672dae3644bb3caa58f03216d0ca349db88b.1736279094.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Jan 2025 05:26:45 +0100, Dragan Simic wrote:
> The preferred way to denote hardware with non-coherent DMA is to use the
> "dma-noncoherent" DT property, at both the GIC redistributor and the GIC ITS
> levels, [1] instead of relying on the compatibles to handle hardware errata,
> in this case the Rockchip 3588001 errata. [2]
> 
> Let's have the preferred way employed in the base Rockchip RK3588 SoC dtsi,
> which also goes along with adding initial support for the Rockchip RK3582 SoC
> variant, with its separate compatible. [2][3]
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Use "dma-noncoherent" in base RK3588 SoC dtsi
      commit: 33b561eb66f1e271f2899e103c857d20425076f4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
