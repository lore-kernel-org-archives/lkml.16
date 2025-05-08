Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9891F5F6;
	Thu,  8 May 2025 23:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748186; cv=none; b=S707OHpsB4ToktLH47bmqmGnvNdK2UR7p5S2Jgkk9aTPPOEAj/RD7hr+jOzIVFtyPoXEkYzJofLQ1aVWBkJ+wESS7gN+kX/ElkS3lxGbjmpMLmItxHbuWfOffIpw/migGua3rOlNqCNK0LCMqnOG561wAT1HKFM006m47llYKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748186; c=relaxed/simple;
	bh=PHkzmazZbYNFsZ8Z3dXZDpcjBGKxVGnG8Eabx+LYYTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lCBCrWzS6hRKsRsQYmgWTofmxPsWQg0+5y6f2TAp0Mva9w7qJUmuFXBXRgWKD8l2XORu1WL5+P0tJ9+aVioaayIARzAgJrNY+/I2IctxVYni77i4yGG7ZvrwK4I/j6HICVzSd5egC1SMvgMdraL9tWxHgaQyEIKgieTNNG71deE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OzDZXw2K; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OzDZXw2K"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 64BA326050;
	Fri,  9 May 2025 01:49:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtwmwACksPdI; Fri,  9 May 2025 01:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746748180; bh=PHkzmazZbYNFsZ8Z3dXZDpcjBGKxVGnG8Eabx+LYYTM=;
	h=From:To:Cc:Subject:Date;
	b=OzDZXw2KUUb2OxfCLHMDc5LhJyFyLcLncTZRGagZbFbXZSib+MDfa5fLDsyrrXbcz
	 KnayWORxO1F2EXRhsYGZJnUf5tScLUP5a37+bfc2+opyr170FfD3de9ADU3pzOJKWv
	 vbEleZo7153Nl0V5yF/dKmmE4KQIKQ6lWxeM4VQiz2+crq21WAeHrHA3KefodU1zKL
	 Ts/cfYztat8qUHpHbPgQ8zVlXYAmyd4WLZl37732a6chki9c3y6CHDxDRAuSi1mkVH
	 xRj1HMe5oW2GlkRy+l+c//NZkecCq0bzHNn1XBceyilB0ZmbHKfG+J048cfZx0QYmo
	 PHUWdayt7oLrA==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] Support SD/SDIO controllers on RK3528
Date: Thu,  8 May 2025 23:48:28 +0000
Message-ID: <20250508234829.27111-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3528 features two SDIO controllers and one SD/MMC controller. This
series brings the SD/MMC one up on Radxa E20C board. Both HS and SDR104
modes are verified.

- Changed from v5
  - Drop applied clock patches
  - Rebase on top of linux-rockchip/for-next
  - Link to v5: https://lore.kernel.org/all/20250506092206.46143-1-ziyao@disroot.org/
- Changed from v4
  - rk3528 clock driver
    - Switch to auxiliary GRF
    - drop rockchip_clk_register_grf_branches
    - Rename branch_mmc_grf to branch_grf_mmc to make style consistent
      (with branch_grf_gate)
  - Link to v4: https://lore.kernel.org/all/20250417143647.43860-1-ziyao@disroot.org/
- Changed from v3
  - Drop applied binding patch of MMC controller
  - Rebase on top of linux-rockchip/for-next
  - Link to v3: https://lore.kernel.org/all/20250309055348.9299-1-ziyao@disroot.org/
- Changed from v2
  - Apply review tags
  - Rebase on top of linux-rockchip/for-next and drop applied patches
  - RK3528 devicetree
    - Fix accidentally dropped status property of saradc node
    - drop det and pwren pinctrls for SDIO{0,1} according to the
      reference design
    - Correct max-frequency for SDIO{0,1}
  - rk3528-radxa-e20c devicetree
    - Don't disable sdio for sdmmc as claimed in the hw design guide
  - Link to v2: https://lore.kernel.org/all/20250305194217.47052-1-ziyao@disroot.org/
- Changed from v1
  - Apply review tags
  - Rebase on top of linux-rockchip/for-next and saradc v2 series
  - rk3528 clock driver:
    - explicitly include minmax.h, replace MAX() with more robust max()
    - readability improvements
    - fix error checks: ERR_PTR(-ENODEV), instead of ERR_PTR(ENODEV), is
      returned when syscon_regmap_lookup_by_compatible() fails for missing
      such syscon
  - RK3528 devicetree
    - Add default pinctrl
    - Move the per-SoC property, rockchip,default-sample-phase, into the
      SoC devicetree
  - rk3528-radxa-e20c devicetree
    - Assign sdcard to mmc1
    - Add missing regulators
    - Apply no-sdio for the sdmmc controller
    - Sort nodes
  - Link to v1: https://lore.kernel.org/all/20250301104250.36295-1-ziyao@disroot.org/

Thanks for your time and review.

Yao Zi (2):
  arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
  arm64: dts: rockchip: Enable SD-card interface on Radxa E20C

 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 ++++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 69 +++++++++++++++++++
 2 files changed, 99 insertions(+)

-- 
2.49.0

