Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF05F4FA;
	Tue, 24 Jun 2025 03:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750736274; cv=none; b=PLTGS3FzfvnHoLssX/TR5gZHsnymcEUAvE8Z7Z5PzfmBd0akvLOuF5J7UHFDZOh+Qiaiv5OWWxTzoa/T2rPeyts/upuxR2e4M4k7O1Y2WPgEXKsymxuUTrwe0HZG5BdNiw0qUVdEkM+xZ4Hpt7ZdCPSpvt3E0TmTgzpK6b8JHLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750736274; c=relaxed/simple;
	bh=cpbZBwjbBZgHkRQ7AWaTRO0fpUi6AJxBeB+TW6Cfd6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jSn1XvHNE93q4rwTgm2ScUbJPe5hj/f2FDrdR57gpQdWc9EPqyM04t1YbqhqLslx+7YXbztgVwBhmU17fYXqsg3ENmoxyghSrDLHjVyUUtlbqPaFqpbTlyQ74aUoHB1aKNf/9EEm3/HW7swI17qMw/uQG4PocauhW0fQgGSrG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=N/VwivIj; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="N/VwivIj"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E821120731;
	Tue, 24 Jun 2025 05:37:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-bGI4FkFAEs; Tue, 24 Jun 2025 05:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736268; bh=cpbZBwjbBZgHkRQ7AWaTRO0fpUi6AJxBeB+TW6Cfd6I=;
	h=From:To:Cc:Subject:Date;
	b=N/VwivIjCw02sOY60jg1xWpaSoEBSwLFCl2Adt/Md73nlOrSXxjEPxuvdNFaX3I7f
	 YWi7W9Pyf+EKdZyldKUGELqQn0Q4Bj/a37syY96jRG73qcMVJRE9vHJS6rITNw7QbL
	 8Dt6F6o8VOX5mMRsjatHNbhT4M3J0P//f4HLLbV3SVkZvvy4A8+0zYhEl0Gm2FheXr
	 PICqeXYzJuQHoqlvLc/NStYkj1EhwZrdsiT1qsgmYPW+QOy+DcE3RTo1EEbgqj9Ayv
	 UaVMozfLmuORpuHKUev6EUb1ylno3ryD9GUxIu/sPsAeD1hi7j9QgPL9wUJxU7mw0J
	 7Q/hgTBb6C8lw==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Support RK3528 variant of Rockchip naneng-combphy
Date: Tue, 24 Jun 2025 03:37:27 +0000
Message-ID: <20250624033733.50197-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RK3528 ships a naneng-combphy that operates in either PCIe or
USB 3.0 mode. It has a similar control logic to previous generations of
naneng-combphy but an apparently different register layout.

This series prepares phy-rockchip-naneng-combphy.c for variants with a
different register layout and add RK3528 support.

Testing is done on both Radxa E20C and Radxa Rock 2A with downstream
devicetree changes, both USB 3 and PCIe modes are verified with mainline
driver and achives a reasonable link speed.

This series depends on v2 of patch "arm64: dts: rockchip: convert rk3528
power-domains to dt-binding constants"[1] to build.

[1]: https://lore.kernel.org/all/20250620201715.1572609-1-heiko@sntech.de/

Changed from v3
- Add a dt-binding patch to allow power-domains property when describing
  Rockchip naneng combphys
- devicetree patch
  - Break down long lines
  - Sort properties to keep the style consistent
  - Add power-domains property to the combphy node
- Link to v3: https://lore.kernel.org/linux-rockchip/20250519161612.14261-1-ziyao@disroot.org/
Changed from v2
- phy binding patch
  - Fix format issue
  - drop review tags
- Link to v2: https://lore.kernel.org/all/20250509004121.36058-2-ziyao@disroot.
org/
Changed from v1
- Collect review tags
- Restyle RK3528 register definitions in the combphy driver
- Drop unused include of phy.h in SoC devicetree
- Link to v1: https://lore.kernel.org/all/20250508134332.14668-2-ziyao@disroo
t.org/

Yao Zi (6):
  dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
  dt-bindings: phy: rockchip: naneng-combphy: Add power-domains property
  dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
  phy: rockchip: naneng-combphy: Add SoC prefix to register definitions
  phy: rockchip: naneng-combphy: Add RK3528 support
  arm64: dts: rockchip: Add naneng-combphy for RK3528

 .../phy/phy-rockchip-naneng-combphy.yaml      |   8 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |  24 +
 .../rockchip/phy-rockchip-naneng-combphy.c    | 746 +++++++++++-------
 4 files changed, 505 insertions(+), 274 deletions(-)

-- 
2.49.0

