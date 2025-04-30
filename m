Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCC221C173;
	Wed, 30 Apr 2025 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008914; cv=none; b=DsRIXlnl7dAEaC2onTltUuluY96jjZyyCG6SeVy/N44z85L3t+/0Q8Pz1B70bdNBPDVuMeCVUmfUIak4v0S6awfVRzWhFM/qzfR/J7To2SE2A3PUB15vDK8jGQGxMn10xSaAmHeM9DJbPuX8/zK1LuLvsvPPc0wMpn0obnqVWFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008914; c=relaxed/simple;
	bh=xswGIM+mJ1xR30H5MxCv2w7+xy9PbEtx4rbifY1P6iA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rM6bgiKsFB7LTYURU3ZbgfUdteN0gaCRbdkberEtyVU2mrzCXJWG//Jv5c6yr2BppD7t5c80ohWOvU8YIMav4+v3GV2Nr9lmhkHUFUqeeYBRe3cGJLNHqUzd/2HVfJDddUV1cUaml40oI7ZTFJaa6PTMHIZFz9yqm06VYeGm/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=DFpCSoMG; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="DFpCSoMG"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E09891F9E3;
	Wed, 30 Apr 2025 12:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008911;
	bh=EMGjnsc+8iqXvQ2qqPAhoADqLsaNBDLsEh9Ky/rtpOA=; h=From:To:Subject;
	b=DFpCSoMGYXorLahnuRX+J/LmVryubrJ5uEzrpcoqHtlnQ0jApUFc1cu/gEEojY3dz
	 GomSTzlAWjaKItoEG+SNsRQ4I4aNxiXhDDo3G+L6L4jcrKeCQvPUbVnt5jGZA/15Sw
	 pi7k/n3Ls0+Alt6ZykILuj3TW5QpaIlo8IDsE1eZzNJfNvB9Bne+bjci/F5PE8BGmL
	 tEvxU+N1/diklj2GPEWqNP1IomV0HBa6hlS6zldbqNW+XmsHtGuI3lXaimJby4/+5W
	 DVwt61Qq94s/PNaSsubcRDi3CDQFS7ftvJRzfLru1ewa71859xkbsDmX4D8hQfZ5EA
	 r2o5Xh1bozyHw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] arm64: dts: ti: Add Toradex Verdin AM62P
Date: Wed, 30 Apr 2025 12:28:09 +0200
Message-Id: <20250430102815.149162-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds support for the Toradex Verdin AM62 SoM which can be used on
different carrier boards (Verdin Development Board, Dahlia, Yavia, Mallow and
Ivy).

The module consists of an TI AM62P family SoC, a TPS65219 PMIC, a Gigabit
Ethernet PHY, up to 8GB of LPDDR4 RAM, an eMMC, a TLA2024 ADC, an I2C EEPROM,
an RX8130 RTC, plus an optional Bluetooth/Wi-Fi module.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p

Francesco Dolcini (6):
  dt-bindings: arm: ti: Add Toradex Verdin AM62P
  arm64: dts: ti: add Toradex Verdin AM62P
  arm64: dts: ti: am62p-verdin: add dahlia
  arm64: dts: ti: am62p-verdin: add mallow
  arm64: dts: ti: am62p-verdin: add yavia
  arm64: dts: ti: am62p-verdin: add ivy

 .../devicetree/bindings/arm/ti/k3.yaml        |   24 +
 arch/arm64/boot/dts/ti/Makefile               |   10 +
 .../boot/dts/ti/k3-am62p-verdin-dahlia.dtsi   |  228 +++
 .../boot/dts/ti/k3-am62p-verdin-dev.dtsi      |  245 +++
 .../boot/dts/ti/k3-am62p-verdin-ivy.dtsi      |  629 ++++++++
 .../boot/dts/ti/k3-am62p-verdin-mallow.dtsi   |  213 +++
 .../boot/dts/ti/k3-am62p-verdin-nonwifi.dtsi  |   15 +
 .../boot/dts/ti/k3-am62p-verdin-wifi.dtsi     |   31 +
 .../boot/dts/ti/k3-am62p-verdin-yavia.dtsi    |  219 +++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi   | 1405 +++++++++++++++++
 .../ti/k3-am62p5-verdin-nonwifi-dahlia.dts    |   22 +
 .../dts/ti/k3-am62p5-verdin-nonwifi-dev.dts   |   22 +
 .../dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts   |   22 +
 .../ti/k3-am62p5-verdin-nonwifi-mallow.dts    |   22 +
 .../dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts |   22 +
 .../dts/ti/k3-am62p5-verdin-wifi-dahlia.dts   |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-dev.dts |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts |   22 +
 .../dts/ti/k3-am62p5-verdin-wifi-mallow.dts   |   22 +
 .../dts/ti/k3-am62p5-verdin-wifi-yavia.dts    |   22 +
 20 files changed, 3239 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dev.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-nonwifi.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dts

-- 
2.39.5

