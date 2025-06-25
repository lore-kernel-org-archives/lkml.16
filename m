Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5D4265CC5;
	Wed, 25 Jun 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857427; cv=none; b=kD8eMGdbwWyJDUeAm4IOERdJDk8FAtCOmFoSBrvtpQEqicUnMqoB2BsHvgKj2rjd3zEwv1V2eTmbT/RH8Dv8/TMc14vt5ptlg9WHX6/1SG5OaGaUGn2Ar0KBUCxrI635fjxDIMj7u0JgZ7P0rzW8EuUNRvrC3Vgws7mZYxAtc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857427; c=relaxed/simple;
	bh=XAgpjW/O3CM0ZnOLk2RcDGdLgfzXfUkXBKJ3HCpD1Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=apK8EP3U6uP81lx6M65pTdojAfAvsyf0CHGG1ZO3AJVVo/06cOZdWB2zT2MK8uIcOpAzs9KMxHGPMRwsQaIyhURdb6hhUaq0Y4WT0tWWufcPrSyLYq/ecEYfco8iGD8ah4IUyPp1/H35/aMoWTjq25+GDZsus5QD7GTcqtD5L1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fohGDIt2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fohGDIt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF4DC4CEF3;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857425;
	bh=XAgpjW/O3CM0ZnOLk2RcDGdLgfzXfUkXBKJ3HCpD1Qk=;
	h=From:To:Cc:Subject:Date:From;
	b=fohGDIt2S5dW8eGGmDkgtYKdXBnWVxx7EZCq9ZBJqvIvFqHEpmJsFQemA+NiTOmuk
	 Z8D4iDoTqT+8q/rEwcLMGOTRDwwCN/jPdOIQ/rpRc8CUlXCX4D25l+YmMYVjOPNhGu
	 XxsAqHH+GSDsSwbm5HuD7OwP9Q03l9IbFQnFDKQkgtBrcpnkCnEc5ku+3piBFcfa8d
	 vGL3ebutZ3I1skb7vrhjs0oGPQYemnRSy3UgFa89E9i+pzpNzJ0O3CuM5bg7lmBoMp
	 3tAogbbKgZD8b564kogcAbcVNKNSdkmQ4el/+BjxKF+cCTrpJLLED4uQVQCj2EmYfx
	 ZvGas7sQMl9hw==
Received: by wens.tw (Postfix, from userid 1000)
	id 4953A5FC6F; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
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
Subject: [PATCH v2 0/5] arm64: allwinner: t527: Add OrangePi 4A board
Date: Wed, 25 Jun 2025 21:16:47 +0800
Message-Id: <20250625131652.1667345-1-wens@kernel.org>
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

This is v2 of my OrangePi 4A series. Changes since v1:
- Fixed regulator names for bldo3 and bldo4
- Dropped labels for aldo1, bldo3, and bldo4, which are not really used
- Added voltage constraints to aldo2, based on specifications from
  schematic
- Appended "-usb-0v9" to cpusldo's regulator name
- Added comments to explain how axp323 aldo1 and dldo1 are tied together

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
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 383 ++++++++++++++++++
 4 files changed, 476 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts

-- 
2.39.5

