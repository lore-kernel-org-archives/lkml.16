Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119AF14A62B;
	Mon, 23 Jun 2025 14:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688011; cv=none; b=mtus6Rut4K07+cw8Af673WAXwEZ5xbqRCpLV74sByATBG+m2lIxStse1MN9G6N1jSju2zgZYH57nGuf6Sn1ImrVjEBKym8igC17esDems+GFG9gx9++h5sQwXLC8PtuNh2puffY6pAQ4cqlS8RzrdGoGEZKki6KIPC3T6miRoAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688011; c=relaxed/simple;
	bh=n56dHUaNIYXeKL9MCjxGBldJvaGwGOAU9ocwmPo/50I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gR07+n9ImOBQuhpPRdcKDFoDqlgElAwlIbqaw5J6RSYciaNFopZ0kQlsHafVbC85t/BOe/4+mgVd16Z0NI5LcSKdgyFK0KhxvPF0pOqwADQXxuxKooi/qrc+zWyDSCBkXwov1fi3t6lu/cjkqva80MMAj5KSKbSmDacmMNaEaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vz3K5ziw; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vz3K5ziw"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NEDMTY1572752;
	Mon, 23 Jun 2025 09:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750688002;
	bh=N+XxtETMhphvkKQCUquvctKd1Yg9fvwXG/AZvqg3R6U=;
	h=From:To:CC:Subject:Date;
	b=Vz3K5ziwm4duq2pQdJl5tIVqNh9Gh5HMbsBBcV9vmvNK9qzHeCPkePWG36gxZc3Xx
	 9YseZXRRFN9CA31YcxoN2tjjihM90srUO4xybTjJoY0BtSSQ3hUYZYBJ3a0YsopofM
	 M85R80xqsiYGSnjU9QZ8aDv+ROvNqiqqLSR7RXHk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NEDLeV3541024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 09:13:21 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 09:13:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 09:13:21 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NEDKus3987370;
	Mon, 23 Jun 2025 09:13:21 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>
Subject: [PATCHv4 0/6] Add support for AM62D2 SoC and EVM
Date: Mon, 23 Jun 2025 19:42:47 +0530
Message-ID: <20250623141253.3519546-1-p-bhagat@ti.com>
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

Paresh Bhagat (6):
  arm64: dts: ti: Add bootph property to nodes at source for am62a
  dt-bindings: arm: ti: Add bindings for AM62D2 SoC
  arm64: dts: ti: Add pinctrl entries for AM62D2 family of SoCs
  arm64: dts: ti: Add support for AM62D2-EVM
  arm64: dts: ti: Update firmware-name for IPC
  arm64: dts: ti: Add eMMC support for AM62D

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   3 +
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  15 +
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |   1 +
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |   3 +
 arch/arm64/boot/dts/ti/k3-am62a.dtsi          |   3 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 590 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h           |   3 +
 8 files changed, 624 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts

-- 
2.34.1

