Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883811A23B0;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127372; cv=none; b=FaJ2t0i1uJPTd2mQ04sqjHRrw0XE7dpMSExiyZIiJqRUD+8eXbUwjs4HaxLwvWchbqst/pSvksQ7uS+HLGRswFWkTlXj2q7DW5Tz7RSDK1DqwHYd7zt9pu0ZYJlYS4GA0BEVFDf5vzQMPoP+k345+oToTud6/z4GI8rKVrP89x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127372; c=relaxed/simple;
	bh=xwBJtYb4XftTQnUvPPzT8bBayvc42wCvVRgKR/Qg5G0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kbOCHlximZlTUpr+3/rBSp0auGiXMTfXAjjL0Upv9up6Zl0Ja/UpCRCyead5eS5yYOt9Yx1wDETH0cwpV5a8RiNiMPc8cd2NZaVqnbIKZBhBo4kJV2zHjGTSVpCQGLw9DneWVVvwvFw0k2xipxq/RTmoAMtVnMZJ9174S6zQoAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BN5ULZp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BN5ULZp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF27CC4CEF0;
	Sat, 28 Jun 2025 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=xwBJtYb4XftTQnUvPPzT8bBayvc42wCvVRgKR/Qg5G0=;
	h=From:To:Cc:Subject:Date:From;
	b=BN5ULZp8kAML7kYEpIYJykHXQhUWu6Q8XEiqfn+8HlvpEZKR4uJDUKkKnP07He1GJ
	 /HlYMXKxXJaD3h2VYQr6lr+qSUlQfru7v4KKVZSD7hRmuhKDLaP6Il03wpebzxi+ra
	 g16OKnUCUQjAER0olQLqCymhOZUowh/y3jWOOXVf/kbOYjM6P0ikTEGt/V9bCa8qK6
	 jWbf4/Muqf0shyUe9b4T02BCfJoH2GO9WIY9ESry06apQrhLthY0/zAOVZFGBE6wXf
	 JGsB0QLDzu6T3qFfg4VU1YsArBWOsIS9BvSl1A4uLcrtIpDmuJZLCRJZ6GbzI2QyKb
	 OspL4fAsSs9lQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 2504A5FE35; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 0/5] arm64: allwinner: t527: Add OrangePi 4A board
Date: Sun, 29 Jun 2025 00:16:03 +0800
Message-Id: <20250628161608.3072968-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This is v3 of my OrangePi 4A series.

Changes since v2:
- Actually include cpusldo regulator name change and axp323 aldo1/dldo1
  comments
- Fix indentation of comment in usb_otg block
- Link to v2:
  https://lore.kernel.org/all/20250625131652.1667345-1-wens@kernel.org/

Changes since v1:
- Fixed regulator names for bldo3 and bldo4
- Dropped labels for aldo1, bldo3, and bldo4, which are not really used
- Added voltage constraints to aldo2, based on specifications from
  schematic
- Appended "-usb-0v9" to cpusldo's regulator name
- Added comments to explain how axp323 aldo1 and dldo1 are tied together
- Link to v1:
  https://lore.kernel.org/all/20250619173007.3367034-1-wens@kernel.org/

This series adds support for the OrangePi 4A board. This is a Raspberry
Pi model B form factor development board based on the Allwinner T527
SoC.

The board has the following features:
- Allwinner T527 SoC
- AXP717B + AXP323 PMICs
- Up to 4GB LPDDR4 DRAM
- micro SD slot
- optional eMMC module
- M.2 slot for PCIe 2.0 x1
- 16 MB SPI-NOR flash
- 4x USB 2.0 type-A ports (one can be used in gadget mode)
- 1x Gigabit ethernet w/ Motorcomm PHY (through yet to be supported GMAC200)
- 3.5mm audio jack via internal audio codec
- HDMI 2.0 output
- eDP, MIPI CSI (2-lane and 4-lane) and MIPI DSI (4-lane) connectors
- USB type-C port purely for power
- AP6256 (Broadcom BCM4345) WiFi 5.0 + BT 5.0
- unsoldered headers for ADC and an additional USB 2.0 host port
- 40-pin GPIO header

Patch 1 adds a new entry to the list of board compatibles.

Patch 2 and 3 are minor cleanups.

Patch 4 adds pins for UART1, which is used for BT on the board.

Patch 5 adds a dts file for the new board.


Please take a look. I will take all the patches through the sunxi tree.


Thanks
ChenYu


Chen-Yu Tsai (5):
  dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
  arm64: dts: allwinner: a523: Move mmc nodes to correct position
  arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
  arm64: dts: allwinner: a523: Add UART1 pins
  arm64: dts: allwinner: t527: Add OrangePi 4A board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 160 ++++----
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 385 ++++++++++++++++++
 4 files changed, 478 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts

-- 
2.39.5

