Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD95134AC;
	Tue, 22 Apr 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319415; cv=none; b=Lhab4AoP5hTVCUq7tP1wFQTcQiO2XsKoR9yQeiEeVGy5TGbuQWrZ2y9TZnXsSPrIJDwXBt/EvvKZ0kHsWPQoh541NUrX8dIrybZipIc/oYZMUwNgN/wqDL3t5FFHStoXkVyX0kwxg1INymB8hqqUkohKiDWJOgDqMHfmAHAaT6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319415; c=relaxed/simple;
	bh=X7ob+1t7faJy0dtEZ5Ew2ZVx2nnmkT7BRI5h3x/SRpo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O81IUsCwjklUh2FNKObZvudZsdl56H20kM9I5qBWhroykBCIG3fFJ4ZAaxr8dae5eg7LX1dN9Y61RoIDDHfdUhbKkX58bZL1RM/Ud/A7YSwnAU4LOO+sawZ2vRb8nfcPjxtYhrHm8ezcZhRoQrsSMN/eXSw4d3oRXE8RvrpIh2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=aavujSDv; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="aavujSDv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NcJGNvpYM/m232+NdkLo68s3KFMPsC8oEvT7xb+EEOU=; b=aavujSDvxMjZJu66LpLkd3ZZTc
	1dUYrdjUPI0GOSgTqa2H47/ulT/23zfzJbxHEoeTt8b3ubYhAaePvzjFMi4yVyJ3cYJ1Q7hw20NLg
	4wlYDmg0TFs84Ikox3/18Y1QuQdgdjpzWpgrqBPXeQtuJR530dnbNyPr5kzLT3QE+JOHMEzAtbB2e
	Zvh5X/2Ka01+Mg+Bs9+P0N6DW+6kgF6V5p2+1zI45xTxKOnPxpq07BD3RM5pPe5qrp21J0y5+Oedf
	XmWVai68a6LrjBMS9y5k+SN/x5dGghoLmLoRfxV2/zn6Ldzl+wiuhBSoEJVfP1QBpOZvW4th/rvBJ
	aju25naQ==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BIz-008kyr-1o;
	Tue, 22 Apr 2025 12:56:45 +0200
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
Subject: [PATCH v4 00/15] Update PHYTEC i.MX93 DTS
Date: Tue, 22 Apr 2025 12:56:29 +0200
Message-Id: <20250422105644.2725168-1-primoz.fiser@norik.com>
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

Link to v3: https://lore.kernel.org/all/20250418063104.2202085-1-primoz.fiser@norik.com/

Changes in v4:

Patch #1:
- no changes

Patch #2:
- no changes

Patch #3:
- fix commit message (s/pull-down/pull-up)

Patch #4:
- no changes

Patch #5:
- no changes

Patch #6:
- no changes

Patch #7:
- no changes

Patch #8:
- no changes

Patch #9:
- no changes

Patch #10:
- no changes

Patch #11:
- no changes

Patch #12:
- no changes

Patch #13:
- no changes

Patch #14:
- no changes

Patch #15:
- no changes


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

