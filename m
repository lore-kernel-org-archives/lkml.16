Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA79D2D9EC1;
	Fri, 27 Jun 2025 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030852; cv=none; b=DKY6KM/NDrHqB986hwjucAqZ+wqt/TxaxQCpmc61deEtmHkWg7q7nNxuW3WYl+E/gEwyj/YTM5VSt/1DXh6tmJRhw382Mib2z2CwHRjHqwYuL3VBtTUzJtOXFmnz9lCUHeHm+sRkh7c9R41UVQabxIx/4oeXVeg5RS9kO9pzHGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030852; c=relaxed/simple;
	bh=KZYJhm9UPtGzECz1HxwIYc8GEylWjMZHFM2Zz2tspqI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=smaEkEg54CESc0XRBG8UYkmjfUu8lt86yEaVCjWDx/fyCBezkhh2ASnm7Pk1hvlfvoqBFvEdi+GF83U2bV9Lzg0zUk8rcE4Lg9TXQk24CfxpAoaMFTZDHUQ9U3z2Tsy7sxgrMyauDensto0y1FBp8vcL9rv0N+LkVe2kvTyUmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E16CT/WL; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E16CT/WL"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RBw0gc2747731;
	Fri, 27 Jun 2025 06:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751025480;
	bh=Y6ab/7/rCmnpESR4rDGCTeqcMqaugD9Zg+9DrZJj9Yo=;
	h=From:To:CC:Subject:Date;
	b=E16CT/WLYaoZSIQ4HS8VVYCYEz68f2RkbMPif049nDXdeFTHFt0am352/ujRR5Y4U
	 fHcwGVUh3excQ5wFg0+4ZMdXzkoQB8hic1yd2/b66z1CaCIm04LCKbaGhFy/9HD+BL
	 vmc9GkJPh2kCnt38syFf+ZL+GbW+suSBxtOPGj+A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RBw0KX3207803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 06:58:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 06:58:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 06:57:59 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RBvxVO2754930;
	Fri, 27 Jun 2025 06:57:59 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
Subject: [PATCH v5 0/4] Add support for AM62D2 SoC and EVM
Date: Fri, 27 Jun 2025 17:27:49 +0530
Message-ID: <20250627115753.2246881-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series adds support for the AM62D SoC and its evaluation
module (EVM) board, enable eMMC and firmware-name update for
AM62D2-EVM board.

The AM62D SoC is a high-performance Digital Signal Processing (DSP)
device with a quad-core Cortex-A53 cluster, dual Cortex-R5F cores,
and a Cx7 DSP core with Matrix Multiplication Accelerator (MMA).
It features a range of peripherals, including multichannel audio
serial ports, Ethernet, UARTs, SPI, I2C, USB, and more.

The EVM board is a low-cost, expandable platform designed for the AM62D2
SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, audio
jacks, USB ports, and more.

This SoC is part K3 AM62x family, which includes the AM62A and AM62P
variants. While the AM62A and AM62D are largely similar, the AM62D is
specifically targeted for general-purpose DSP applications, whereas the
AM62A focuses on edge AI workloads. A key distinction is that the AM62D
does not include multimedia components such as the video encoder/decoder,
MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
processing, or the display subsystem. Additionally, the AM62D has a
different pin configuration compared to the AM62A, which impacts embedded
software development.

This patch series includes updates to the dts and dtsi files, device tree
bindings, and pin control header files to support the AM62D SoC and EVM
board.

Bootlog-

SD Card
https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383db6

eMMC
https://gist.github.com/paresh-bhagat12/36c756422ff71fa9568c45e9b44332f0

Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
Schematics Link-https://www.ti.com/lit/zip/sprcal5

Change Log:
V4 -> V5:
	- Added bootph-all property only in leaf node.
	- Added a new dtsi file for am62d2 SOC.
	- Updated commit msg and description for dt bindings patch.
	- Updated cpsw_port node for rx internal delays. This change also
	  depends on this series for functionality (networking)
	  https://lore.kernel.org/r/cover.1750756583.git.matthias.schiffer@ew.tq-group.com/
	- Updated device tree to follow ordering of properties and
	  schematic.
	  https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

V3 -> V4:
	- Added bootph-all property at source nodes.
	- Reuse dtsi files of am62a (instead of common files).
	- Added eMMC support.
	- Updated firmware name for am62d.

V2 -> V3:
	- Added bootph-all property to essential device nodes.
	- Updated reserved memory for ATF.
	- Introduce common dtsi files for AM62A and AM62D.

V1 -> V2: Fixed indentation and build errors.

Paresh Bhagat (4):
  arm64: dts: ti: Add bootph property to nodes at source for am62a
  dt-bindings: arm: ti: Add AM62D2 SoC and Boards
  arm64: dts: ti: Add pinctrl entries for AM62D2 family of SoCs
  arm64: dts: ti: Add support for AM62D2-EVM

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   3 +
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  14 +
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |   1 +
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |   2 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 599 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62d2.dtsi         |  25 +
 arch/arm64/boot/dts/ti/k3-pinctrl.h           |   3 +
 8 files changed, 653 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi

-- 
2.34.1

