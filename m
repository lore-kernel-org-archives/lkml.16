Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48562DFA5B;
	Tue, 15 Apr 2025 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691598; cv=none; b=KGfdeTOL3jP4g6wkrY+iG3OW4GldkfKvpWAt7rjBvgBSvZG0hW9GBwPRDW2brAIOhz+izB7GP3wDdLFxJ2mXlTg87YnBd8p8YFyMNMC24+flYu2kyL4c0zAJg1zbhAqfnXMGUyOytIEUOV2hHs3jtXB1l3I2VoUh+Sa1lwvHl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691598; c=relaxed/simple;
	bh=Ka9uiHCrZuJOKyLB39qARQnmC3pH9Lj0iGiRIvDRGQM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pIaP8T1D2A7HEMNGJhMduZj4NDb+zpCJxaY1FALEjaBIsqhlO9GeWr0EzlRvIAvjRkOFKDCw0SCtzR4MrF4kgTBdHj2lVj6OIwjp8945rfRaxGbKm/S/ylnyQwgW+K/y93A5/cc2xsyKyA/S1iqAKZ+99HNVEcoJCEQPHYIIaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4Xyz-00Gb4I-25;
	Tue, 15 Apr 2025 06:33:12 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 00/15] Update PHYTEC i.MX93 DTS
Date: Tue, 15 Apr 2025 06:32:56 +0200
Message-Id: <20250415043311.3385835-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Update i.MX93 device-tree sources in mainline for phyCORE-i.MX93 SoM and
phyBOARD-Segin-i.MX93 board with changes from the downstream kernel.

New SoM features:
 - PMIC support
 - EEPROM support
 - enhanced eMMC support
 - fix eMMC for ERR052021

New board features:
 - RTC support
 - CAN support
 - USB support
 - I2S audio support
 - 2nd Ethernet (EQOS interface)
 - enhanced SD-card support
 - fix SD-card for ERR052021

Link to v1: https://lore.kernel.org/all/20250410090251.1103979-1-primoz.fiser@norik.com/

Changes in v2:

Patch #1:
- add Reviewed-by tag

Patch #2:
- move reg property ahead of pagesize

Patch #3:
- add Reviewed-by tag

Patch #4:
- no changes

Patch #5:
- reword commit message (add more info)

Patch #6:
- add Reviewed-by tag

Patch #7:
- reword commit message

Patch #8:
- reword commit msg
- split errata changes into separate patch

Patch #9:
- new patch in v2 (split from #8)

Patch #10:
- reword commit message

Patch #11:
- drop CAN regulator hack in favor or "can-transceiver-phy" mechanism
- reword commit message

Patch #12:
- reword commit message

Patch #13:
- add Reviewed-by tag
- remove empty line

Patch #14:
- add Reviewed-by tag

Patch #15:
- new patch in v2

Primoz Fiser (15):
  arm64: dts: freescale: imx93-phycore-som: Add PMIC support
  arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
  arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
  arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
  arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
  arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
  arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card
    write-protect
  arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
  arm64: dts: freescale: imx93-phyboard-segin: Fix for ERR052021 errata
  arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
  arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
  arm64: dts: freescale: imx93-phyboard-segin: Add USB support
  arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
  arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
  arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically

 .../dts/freescale/imx93-phyboard-segin.dts    | 243 ++++++++++++++++--
 .../boot/dts/freescale/imx93-phycore-som.dtsi | 165 +++++++++++-
 2 files changed, 369 insertions(+), 39 deletions(-)

-- 
2.34.1

