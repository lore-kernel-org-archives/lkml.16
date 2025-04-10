Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C2267722;
	Thu, 10 Apr 2025 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279209; cv=none; b=WC8rdT796319QgCd92hyrO4j+QH0Vqnx/1CGHwQHG6TjbHfjgeBlEDmYuvqe9YhRaRO8oXaWUudnS3aQfO1xLNwWU80JD1t5nfLegszAcXN1pVPR288AYT3BTvANs7kRiDxwCMONpmGgGs/+p6tCuSwmUEnX5a+2LpnXkhT3tEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279209; c=relaxed/simple;
	bh=r9Pr0jCedFHcpAOfYxWz0L4o7FbufjcHG/RGA0zIFfM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cScouuVgXjlAJIHlKzok/r+JN12BwVDs80MSrAeLRm1p+tfb74GHvvnZzxrDrG/O95YJWiENIvdA/nJ5gogt1jfcdAVl/jM8gU51yiMYxBmsYXK8kIPNJA/mj0Iei12o3tx67TTP6xlIBybrtcVtC3Wp6v1keLrJFZM5EDK2cu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=oHURpw0f; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="oHURpw0f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=F0NwixqgaQxT9YX8prSEYJfkDwofGcLXvNKKo3/oxbU=; b=oHURpw0fxIFPHFAfhA+JEF62fg
	3mQ/8bfJ+GX3bvbzkxRIR0Wh17sSyxdKUGjQ1GIr4nBU1B8tH+rBBLPcBaeJeoO6hCIQQx13OIJ9b
	wWZKlByjxxzWYQotLBxrRa78S5eX83nxJ90s5Jz7Jf505hV+5kmSUV4LMkKhlXr90Y6ecVqUs9uPq
	QFxVb4l7w4kjCFmjuOGN6Es8sUTPMJppXZazNVyBIDOre5RNKZZCQ/96KWailio4lupfXPrm8nU5Z
	EW13JjCWu9ecTt6sj69N2d+eLCNmQJY5vWsJKb+0FXB3lTjvQS86mg9+qZsLfXCPENievWWwFk5+J
	gNcurNDg==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noE-000Djj-2r;
	Thu, 10 Apr 2025 11:02:54 +0200
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
Subject: [PATCH 00/13] Update PHYTEC i.MX93 DTS 
Date: Thu, 10 Apr 2025 11:02:38 +0200
Message-Id: <20250410090251.1103979-1-primoz.fiser@norik.com>
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

Primoz Fiser (13):
  arm64: dts: freescale: imx93-phycore-som: Add PMIC support
  arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
  arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
  arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
  arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
  arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
  arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card
    write-protect
  arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
  arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
  arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
  arm64: dts: freescale: imx93-phyboard-segin: Add USB support
  arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
  arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet

 .../dts/freescale/imx93-phyboard-segin.dts    | 240 ++++++++++++++++--
 .../boot/dts/freescale/imx93-phycore-som.dtsi | 165 +++++++++++-
 2 files changed, 369 insertions(+), 36 deletions(-)

-- 
2.34.1

