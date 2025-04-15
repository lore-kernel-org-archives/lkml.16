Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEBD21E0A8;
	Tue, 15 Apr 2025 04:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691601; cv=none; b=AMjtKy007glq8oSKlkWoCSxitWxzRebY3tC5LHwHMZUftJRojzNuribdmNgpmf+/ZSO1sYETe4SdM40TDT+QrZIOr0reb00E9CVO5QVHzB5QvPxcPcLAx4tmdzdHyj7Jdqyzl83o3OrRhkzt6rknJOLk2idDSCny7ni5HKrfEaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691601; c=relaxed/simple;
	bh=iExqCb+habPpTVewyoLREcwcokcu1CkbyxhDMsb4Z54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZGyikZhyxi+2h/bXf2YGaRnNemOby45hRi7TbF5Aup9U7bGT8qUpgmCP6sbjbfhhNKp43j/ENL8kwEQxgVaTG/KdrfEClcNnD5M6tPD15uN2fQrdIZuWP+r94biy0rypVPym3Kwfc6roHmPer8vnTPzGB0PvyAbod/FTYRuwziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4Xz5-00Gb4I-0X;
	Tue, 15 Apr 2025 06:33:18 +0200
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
Subject: [PATCH v2 05/15] arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
Date: Tue, 15 Apr 2025 06:33:01 +0200
Message-Id: <20250415043311.3385835-6-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043311.3385835-1-primoz.fiser@norik.com>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
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

The phyCORE-i.MX93 SoM comes in two variants, one with VDD_IO set to
3.3V and the other variant to 1.8V. The 3.3V variant can only support
DDR52 mode, while 1.8V variant is capable of HS400ES eMMC mode. The
information about VDD_IO option is encoded in the SoM's EEPROM. EEPROM
is read in the bootloader and bootloader clears the "no-1-8-v" flag in
case of 1.8V SoM variant is detected. Thus add property 'no-1-8-v' by
default to usdhc1 (eMMC) node and let bootloader handle the flag. In
case EEPROM is erased or read-out fails, flag "no-1-8-v" also ensures
fall-back compatibility with both SoM variants.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reword commit message (add more info)
 
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 663530a7e2bb..22dbcc89e311 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -172,6 +172,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	no-1-8-v;
 	status = "okay";
 };
 
-- 
2.34.1

