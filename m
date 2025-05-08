Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69369265615;
	Thu,  8 May 2025 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695720; cv=none; b=n3oLoT1V+7Qz26LqryzPsBxUwBZvZYQmjwXuYQm7tGoXBPxT7TEfSUZn0+esYm2b16CBQ2LfrQ+RkU+K5iEWI2G3uywpxG797A3Lptl1jZqpkvGnabPcd5knkenyfTUH1bDnSXHlkcbkt5+2AUECH4fAoe7DdypPAvPhq413eTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695720; c=relaxed/simple;
	bh=Sz+P8VUrjYWDsH77RFKtYsxSIw1Pbe/FMGn+UhFvkHQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BRgnyqmMedj5adWeF7bWbrRsBoil2IVD0HTQ6n8r5dP1ZwH3y33C5sXoUHU9Tid4nveW4gwGsa4BTly/HRz9wDS0tIVISLuuOPF79chBTlhJqGHngG3OdB3x/Ai+qhJ60qP/Rk11QQtX71IWSdYC4g09oV8T7jg/gk9ef6HXyG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RdUttfMh; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RdUttfMh"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5489ErKI1632365
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 04:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746695693;
	bh=MyRaGoNoeSjypgIYgd0bWb96E1p/i2sZb3+1WmcOQYY=;
	h=From:To:CC:Subject:Date;
	b=RdUttfMhSD4iw2y9hv8OPdo+CNx4COkhoaf3fuk2/zTFme1caqs60NOn1FAOAh98h
	 /0iqUsb96iTtDEKOh7Zlu6LO+skHwVqh61wZld2p/XnDGqtYXFhg6t5AL7W2zpV/Y5
	 7/QHAlz3AwrBQIPgBXeD3MVDn1PhXTPgaVr0x5W0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5489ErUM105930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 04:14:53 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 04:14:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 04:14:52 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5489Eqd9110295;
	Thu, 8 May 2025 04:14:52 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: [PATCH v3 0/3] Add support for AM62D2 SoC and EVM
Date: Thu, 8 May 2025 14:44:19 +0530
Message-ID: <20250508091422.288876-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series adds support for the AM62D SoC and its evaluation
module (EVM) board. The AM62D SoC is a high-performance Digital
Signal Processing (DSP) device with a quad-core Cortex-A53 cluster,
dual Cortex-R5F cores, and a Cx7 DSP core with Matrix Multiplication
Accelerator (MMA). It features a range of peripherals, including
multichannel audio serial ports, Ethernet, UARTs, SPI, I2C, USB, and
more.

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
https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383db6
Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
Schematics Link-https://www.ti.com/lit/zip/sprcal5

Note: This patch series should be applied after the below series 
has been merged.
https://lore.kernel.org/all/20250415153147.1844076-1-jm@ti.com/

Change Log:
V2 -> V3:
	-Added bootph-all property to essential device nodes.
	-Updated reserved memory for ATF.
	-Introduce common dtsi files for AM62A and AM62D.

V1 -> V2: Fixed indentation and build errors.

Paresh Bhagat (3):
  dt-bindings: arm: ti: Add bindings for AM62D2 SoC
  arm64: dts: ti: Add pinctrl entries for AM62D2 family of SoCs
  arm64: dts: ti: Add support for AM62D2-EVM

 .../devicetree/bindings/arm/ti/k3.yaml        |    6 +
 arch/arm64/boot/dts/ti/Makefile               |    3 +
 .../dts/ti/k3-am62a-am62d-common-main.dtsi    | 1013 +++++++++++++++++
 ...cu.dtsi => k3-am62a-am62d-common-mcu.dtsi} |   26 +-
 ...tsi => k3-am62a-am62d-common-thermal.dtsi} |    2 +-
 ...dtsi => k3-am62a-am62d-common-wakeup.dtsi} |    2 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     | 1005 ----------------
 arch/arm64/boot/dts/ti/k3-am62a.dtsi          |    9 +-
 arch/arm64/boot/dts/ti/k3-am62d.dtsi          |  123 ++
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      |  533 +++++++++
 arch/arm64/boot/dts/ti/k3-am62d2.dtsi         |  155 +++
 arch/arm64/boot/dts/ti/k3-pinctrl.h           |    3 +
 12 files changed, 1846 insertions(+), 1034 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi
 rename arch/arm64/boot/dts/ti/{k3-am62a-mcu.dtsi => k3-am62a-am62d-common-mcu.dtsi} (86%)
 rename arch/arm64/boot/dts/ti/{k3-am62a-thermal.dtsi => k3-am62a-am62d-common-thermal.dtsi} (94%)
 rename arch/arm64/boot/dts/ti/{k3-am62a-wakeup.dtsi => k3-am62a-am62d-common-wakeup.dtsi} (97%)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi

-- 
2.34.1

