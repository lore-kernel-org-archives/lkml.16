Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0F28C000;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354215; cv=none; b=K+aFKbgSy/1ajG7gdVbWW3sKAZxbTxBSDYEGFRwZGD2KZOSOLSvykjUc8X+bbLubtWo8VFHILPZ18eDGqIMx5Fq4xhxtGAaHF/vztTadnG5+AAsx9/VpBoKuW7BRV1RPJ07RCPH/0B90jDQ1wrCBVgaWZJDLbt1npeZTWnJc+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354215; c=relaxed/simple;
	bh=HfFEv6qUpuQv8j0SGXGzwPKNs8oEcWMJkK/zqT9Mh64=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ObibbeXdDkFipSFu56TpnmEAnkZ93T0Ba8ilqZki5VDu/2VpZ+tWm+12/hc/ZPM10OKUcqDrZhdz5A/O5hPhzfkpAecj4azwQn84/zZg5+IGNL1Czn8mL72GAIO5ngs+rR32stJTaC9krhLIcBsUzV50vP4VNFltmE/JrBH3coM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cesb14hu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cesb14hu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63971C4CEF1;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=HfFEv6qUpuQv8j0SGXGzwPKNs8oEcWMJkK/zqT9Mh64=;
	h=From:To:Cc:Subject:Date:From;
	b=cesb14huYwxK82KQ4sPB058imYTtnn85Vzl+lLjNEKK6mc/amkcQMvJ3KLZS1No6y
	 86/0OGkM9a7EHA8WIVUzO6Pgqzr69KUIYGuaR/37HRKv7YXNmeuL3NfWlq5f5YlhwD
	 tPn1akioZjboW3ir9b5vei6iMXfESdKMOxMQhDIPcAMhQKQwSO6N/tBxrHKuLhbj2n
	 QOv3YfXjJco7Ni7RqpP+/z6hOmYAs98Ut2pKsnuAFZp/oHoYPHpDLOx6yx+7wcenN6
	 hLhm3J1vtvBOcmya2KXAFE8k454AlmGxhG3q1nCf+MfOhB3QTuEYuB7wsyCGt46QzX
	 BC5K8A1k2Vejw==
Received: by wens.tw (Postfix, from userid 1000)
	id 0B0015FEF5; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
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
Subject: [PATCH 0/5] arm64: allwinner: t527: Add OrangePi 4A board
Date: Fri, 20 Jun 2025 01:30:02 +0800
Message-Id: <20250619173007.3367034-1-wens@kernel.org>
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
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 378 ++++++++++++++++++
 4 files changed, 471 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts

-- 
2.39.5

