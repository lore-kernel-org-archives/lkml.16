Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB821171B;
	Thu, 17 Apr 2025 23:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744932651; cv=none; b=ljFNByKdaUanc+cAbZ56H3GCR9dt0JtRyqgaJrjPJfaytx/E7IvPyxF+19tvcUD0gHxLU+lrA+RhU+TfaypcfGCvbOKCtV9MDWf5L/pObWmTSe1pk9Gm4wMXdhe+6P8oDZvYTYWrccrwUWMsGnOoFZdlmpGs1vtcgWE2xYKo6Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744932651; c=relaxed/simple;
	bh=BfJiwkLkvySlUqXwGm3ZKtU3x3W4JG5MrgirFZNZ8pE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o++DN4Lt8OInIwfV64JKQtFrQGtzavtGZvecy/xvZOE4u8XY3cq8jczONzschl3u+QyvNxCqtieLsW1Nz0m89RIkroBzK2Ph+Ren34AGvKoeEwjFczLNtb/sojn0SbXDNeQb2dX2VR4jQ2qBQpiy5YT3nj7KNB1PKhC4j670vGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M6F16maQ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M6F16maQ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUeWG136184
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744932640;
	bh=Y7z9JvDramw6cqnxYpFzhEM432yH7Ax9tg4umCAmI7w=;
	h=From:To:CC:Subject:Date;
	b=M6F16maQrI/tO2YKeE6kYIaoXwZ0OCK/bjBA+EnB7XOP64Vizv3C1+iRZtgnQVkwV
	 yh2Omw80GXjG1OB7YN47ImPbweluHaqs3/gWRt4EGuAw+68Mw92EhoubS1n1O6/kDr
	 iFF38jTGwGkccm0rcU2W4/yiaFLYa76X3QgpVZ+k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUeg6096091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 18:30:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 18:30:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 18:30:40 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HNUePe023286;
	Thu, 17 Apr 2025 18:30:40 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v2 0/5] Misc MMC updates
Date: Thu, 17 Apr 2025 18:30:35 -0500
Message-ID: <20250417233040.3658761-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series includes updates for eMMC and SD nodes across
Sitara K3 SoC boards:

Set eMMC clock parents to default to avoid any potential issues with
non-glitch free muxes when switching eMMC PLL source.
Add boot phase flag to MMC nodes and dependency nodes to support SD and
eMMC boot. 
Add missing itapdlysel for default speed and high speed SDR modes on
am65x SoC. 
Add non-removable flag to eMMC nodes to void having to redetect
eMMC after suspend/resume.
Remove disable-wp for eMMC nodes since property is specific to SD.

Changes since v1:
- Add patch 1 and 2
- remove disable-wp for more boards with eMMCs

Link to v1:
- https://lore.kernel.org/linux-devicetree/20241014194722.358444-1-jm@ti.com/

Judith Mendez (5):
  arm64: dts: ti: k3-am6*: Set eMMC clock parents to default
  arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
  arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
  arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
  arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts             | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi             |  2 --
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi      |  1 -
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts       |  2 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi            |  2 --
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     |  1 -
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              |  3 ++-
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi      |  2 --
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              |  2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi       |  2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts              |  1 -
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi             |  2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts       |  1 -
 .../dts/ti/k3-am6548-iot2050-advanced-common.dtsi    |  1 -
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                |  1 -
 15 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.49.0

