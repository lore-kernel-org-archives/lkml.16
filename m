Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E4227B95;
	Thu,  8 May 2025 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711854; cv=none; b=WeIywdjaQV30w1KuRMgjsJbzET3hAitkMQbaYbwJVp31bzjvVto6lohnI/hjQdbXzcu6Q1dHmmDv1Kba7X/q9OnQsGuOxRU6AJFPC52QGjItgFYVc2ozNPxPO2YyzFH1q6/YcAz2riukPpHrC0OWh+7OafrXoWangFpc0crQw8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711854; c=relaxed/simple;
	bh=X6Yu3x0xPCSuSq8UL7wpQLlzPGCiDE0xw6l+RcPJyao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pi9C1dXX/m7x4TAF973egi4MmxXNc5UP82HbQAIBEIbhCyH37w7jaw+GP3D0edYV765lXqpXzlivhsWcNrKMwA9FcZ8dp9J5leJ5J0Rmqk5MDrfDoCOhQOPfok/FoM5f4gT1KePVUxfuGMEWi8omuOABIrj5QwzVXWB+0+3+d18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=C8CudheC; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="C8CudheC"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B9223261CE;
	Thu,  8 May 2025 15:44:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7mFSywzps7E; Thu,  8 May 2025 15:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746711841; bh=X6Yu3x0xPCSuSq8UL7wpQLlzPGCiDE0xw6l+RcPJyao=;
	h=From:To:Cc:Subject:Date;
	b=C8CudheCORIWPtDCkwpl2+57gId+4YhGA/oHeKwANNoujv5hw+/3XcHw4jFvZ+pKj
	 vX59902vb2sYt0vXXLNVACIZ9FH7LniuN4XHBZe8lOnC8YGR12Q2P5MuwOxechzo9A
	 DRJVdNP9me4tTB4dh5l8aWjxfLqhI2VkDbTHbi7eMNHrLv6vcUvzfAr63UtPL0nTiI
	 /tbEFH1YOkEjUkM3pkpx7tBfGtBCxkc3/YXeR7BYOG6qlciF5QmYQx3yOz4yxFxIqT
	 gpYoknBEDsEhy/f3s7XEhbHyH9h3Hvc6ZV1iiFa/H+fFvUhQPT7uYPo5a5bAYFrtr5
	 qaoU/63J+oUdw==
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
Subject: [PATCH 0/5] Support RK3528 variant of Rockchip naneng-combphy
Date: Thu,  8 May 2025 13:43:28 +0000
Message-ID: <20250508134332.14668-2-ziyao@disroot.org>
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

The devicetree change (PATCH 5) depend on v5 of the SD/SDIO series
("Support SD/SDIO controllers on RK3528")[1] for a clean apply. Thanks
for your time and review.

[1]: https://lore.kernel.org/all/20250506092206.46143-1-ziyao@disroot.org/

Yao Zi (5):
  dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
  dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
  phy: rockchip: naneng-combphy: Add SoC prefix to register definitions
  phy: rockchip: naneng-combphy: Add RK3528 support
  arm64: dts: rockchip: Add naneng-combphy for RK3528

 .../phy/phy-rockchip-naneng-combphy.yaml      |   5 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |  23 +
 .../rockchip/phy-rockchip-naneng-combphy.c    | 740 +++++++++++-------
 4 files changed, 495 insertions(+), 274 deletions(-)

-- 
2.49.0

