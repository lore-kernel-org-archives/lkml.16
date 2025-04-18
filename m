Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302A254B0E;
	Fri, 18 Apr 2025 06:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957875; cv=none; b=ctGPXt82tzr1nrQoDr1ALNZ2o6V6TjANVz/tak4IqhcnINRjCGGyD4TnIPQPp6gyAmmw+ffPfmnhBsqEwtVPsmZZIiFMfNvv3qg/Tykyy2v1248hjBFSR+Ep6fh59kb9FowUMH5U8V00vpzJ1nBosrsG1slrktQ/FmQxzx3wKic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957875; c=relaxed/simple;
	bh=XZBnI1Ws9FGSjM7B0Qz2KimP4ChiAlZw8B0eiD6qo2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q2fVzD3FBj5zCPJtSuR5mtugBe/6qVaqzxoLvjmgjeA47RJesZRf/sh9ZNrAwI7kPmdyatfgzINWki43mhwD44Y2wCWWnWMyyqWZecYB8Xj9U8JPJxUEwxoTE1qQe0/65st4mBYtjieKs8SzIVQhAXIuLZJIsIndzzLM6wm6DXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=S+8QWJsd; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="S+8QWJsd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iMmL27bnm1Scohl4V+bV95IB9bqNz+0Dqo98Wv3R2Gw=; b=S+8QWJsdNaTmih/DaybGYWKw/h
	wAUIAErbIMFPFqvVu+7/cWJ7O+IvU+pSk7jy/fqlb0MyIKLQxBmk1UTEnPg9uGgvXfklhEPyXYibh
	g+8WsHvGKO6OHzvx/uulVIKHwAn8kl9+TI70ilqvmXQcwPCZeqiPi+rHIN0eT74QGo8eciJ+uICEG
	Rc+Ur1EkxoBqfrQgwrCj9NYpiknEZ+yozzbl1uX2K+nedtEKQZCumMGEtrJ5rgNZfLW5io4HRILNv
	iHX/HB3Qg2ITw3iBIKjBYpR3ussXwlk3Wh6spSlP2NE4D4lA65PN3bIFE1NRpVCkqB7djNK9kFN6X
	jqlsR/EQ==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFh-00AbM0-2s;
	Fri, 18 Apr 2025 08:31:05 +0200
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
Subject: [PATCH v3 00/15] Update PHYTEC i.MX93 DTS
Date: Fri, 18 Apr 2025 08:30:49 +0200
Message-Id: <20250418063104.2202085-1-primoz.fiser@norik.com>
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

Link to v2: https://lore.kernel.org/all/20250415043311.3385835-1-primoz.fiser@norik.com/

Changes in v3:

Patch #1:
- no changes

Patch #2:
- add Reviewed-by tag

Patch #3:
- no changes

Patch #4:
- no changes

Patch #5:
- no changes

Patch #6:
- no changes

Patch #7:
- add Reviewed-by tag

Patch #8:
- add Reviewed-by tag

Patch #9:
- reword commit subject
- add 2 char indention

Patch #10:
- no changes

Patch #11:
- add Reviewed-by tag

Patch #12:
- add Reviewed-by tag

Patch #13:
- add Reviewed-by tag

Patch #14:
- no changes

Patch #15:
- add Reviewed-by tag

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
  arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit to
    fix ERR052021
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

