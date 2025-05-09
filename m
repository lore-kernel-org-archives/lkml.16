Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163F25DCED;
	Fri,  9 May 2025 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820845; cv=none; b=JpZlChTxDRJG4A37OkTLGEqOspD75wsCHY6g3h/a/JVvILHeobgBZlkWCRoQlpZEk/cPAePvZsumCgM4AUFWnjl4LWvJ4Hpw59a0e45PwyqsDQg8LxRfmmouhnex9SkzOoTBQsmHP7IkwOSf91zS7iG6TANNru/uPvqPh6gTI3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820845; c=relaxed/simple;
	bh=chO1k4fDyu2eYOHha8AZNZF4lCTV5sZsr/oNYjXdza4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpiiXT/L5U8HVCKe67LUboy6kTfjneoAaNFO9WBWZsW31UJ/EdIQDsMkiJewMRrhZUxeVmyGaRlKe5WEjgXM6KhyXUeYzD+bELTsoJONd6fXKRwvweWvbG47wSBy/h/8vCgOfNovOVj+ThbKUU/4DkN5mh0M6ls49EI3LgeGIZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Pyv7+A++; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Pyv7+A++"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KL6I1YmxNyuddUkwhXXWOAEg5l5FH054h54i4n0mk9A=; b=Pyv7+A++X2qXrdKmdackh5Cjmi
	B9Nyd3jGnhX3hYmeumXkeMOGKr4FpDEPOlbbS0ytzvkCOhlhTNJ6h1ceBAYGPeIlg7X/gwSgw7XcB
	1qIS7bVdgpYEBy3MBHIs19mt0OjsmvBNlsUJTNCCxrFYHUMr//HgecLQDDLujTqJc+kDOXmv7tqYh
	CV0EylPgXa3UGkVeLsYIPfjRtglRPjRJmv27hrcvlYT0eOGULIt76/jy6Mbx45sivLRU8p+UWUmJB
	22FYIhTxgK17ghYSGxoTR6NYRIHIguKAoY4PVdHFTiz93EonqnwUtBDxs9FhC2uM98XL5BfOgEVkL
	gOo4/EGA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDTtb-0004Jo-LF; Fri, 09 May 2025 22:00:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] Support SD/SDIO controllers on RK3528
Date: Fri,  9 May 2025 22:00:23 +0200
Message-ID: <174682074858.2029046.4538748769888209188.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508234829.27111-2-ziyao@disroot.org>
References: <20250508234829.27111-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 23:48:28 +0000, Yao Zi wrote:
> RK3528 features two SDIO controllers and one SD/MMC controller. This
> series brings the SD/MMC one up on Radxa E20C board. Both HS and SDR104
> modes are verified.
> 
> - Changed from v5
>   - Drop applied clock patches
>   - Rebase on top of linux-rockchip/for-next
>   - Link to v5: https://lore.kernel.org/all/20250506092206.46143-1-ziyao@disroot.org/
> - Changed from v4
>   - rk3528 clock driver
>     - Switch to auxiliary GRF
>     - drop rockchip_clk_register_grf_branches
>     - Rename branch_mmc_grf to branch_grf_mmc to make style consistent
>       (with branch_grf_gate)
>   - Link to v4: https://lore.kernel.org/all/20250417143647.43860-1-ziyao@disroot.org/
> - Changed from v3
>   - Drop applied binding patch of MMC controller
>   - Rebase on top of linux-rockchip/for-next
>   - Link to v3: https://lore.kernel.org/all/20250309055348.9299-1-ziyao@disroot.org/
> - Changed from v2
>   - Apply review tags
>   - Rebase on top of linux-rockchip/for-next and drop applied patches
>   - RK3528 devicetree
>     - Fix accidentally dropped status property of saradc node
>     - drop det and pwren pinctrls for SDIO{0,1} according to the
>       reference design
>     - Correct max-frequency for SDIO{0,1}
>   - rk3528-radxa-e20c devicetree
>     - Don't disable sdio for sdmmc as claimed in the hw design guide
>   - Link to v2: https://lore.kernel.org/all/20250305194217.47052-1-ziyao@disroot.org/
> - Changed from v1
>   - Apply review tags
>   - Rebase on top of linux-rockchip/for-next and saradc v2 series
>   - rk3528 clock driver:
>     - explicitly include minmax.h, replace MAX() with more robust max()
>     - readability improvements
>     - fix error checks: ERR_PTR(-ENODEV), instead of ERR_PTR(ENODEV), is
>       returned when syscon_regmap_lookup_by_compatible() fails for missing
>       such syscon
>   - RK3528 devicetree
>     - Add default pinctrl
>     - Move the per-SoC property, rockchip,default-sample-phase, into the
>       SoC devicetree
>   - rk3528-radxa-e20c devicetree
>     - Assign sdcard to mmc1
>     - Add missing regulators
>     - Apply no-sdio for the sdmmc controller
>     - Sort nodes
>   - Link to v1: https://lore.kernel.org/all/20250301104250.36295-1-ziyao@disroot.org/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
      commit: 894a2640422208b1d3e4c238f126220d406e5fb1
[2/2] arm64: dts: rockchip: Enable SD-card interface on Radxa E20C
      commit: a2130d9123b23d74a717f52240fa3cb92bf8113c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
