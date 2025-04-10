Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42452276055;
	Thu, 10 Apr 2025 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279237; cv=none; b=BwsB+56V4qxMP+D1N0Jpi4Dmbup0FPYj0qA1cND5ZuW6JaW1ftERO4ks6ZYMck8K2U8BwjyHCXFLIYzSx4lD2UG+fkn8fZlFoRY0WkIP4tcNlcrKn+QY80tJSVMxBvUbtR4wX3DVb8oS0qTMgNToATxupW/oEWDBtpVJUMmIAGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279237; c=relaxed/simple;
	bh=9/msa9u5fLtvGNsrPTbNK03Yw0QDuul5PFpQ3JtVR4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D1xZBvBcKd1NMvZrXeJoR+GtDsO6sbZwg5RuQmDgbasSe5HKHsjWWNsH02mp5+5MM4cpyOp1dEwBQ1Ew3ZHdaw2BUr7u7xaE1VQ9YWezm4QsoHU5oyVZ9vBTWXFVytGS+q0wKjYGsEPrEh2VuYULcVc6dUi3aiODSr+D+i7923w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=NPH4uHdb; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="NPH4uHdb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/0LTiiIwYCUz51jk3BEmuOILoyyD8i0Rtc1e4HdJzUk=; b=NPH4uHdbGrpHPyXC9pHEFvjzuE
	nP7m0U2lMw3neJa7uzCjH+xUZYoXYRE/uTgvmPhwPntBCkmLm0hNLQ3hInZt1tAk+jhHdOhMsk0ET
	nV1tmXNihMJquP6iyUgu1K/scCY+yAfGjn5AM2ZFk1dXlYRk4sJ/DJgzeazsps4ulV7LbXil3LvMo
	pTDJ27UdRBN7z6vueGapYBKcinf2R5r1EmJdRe+7Rn0x7P13GYQE6TrRY2bgoAQzJfcnUnFUMJ4UR
	nVJIK2s0F9nwBOYwDpPZ4hezShNcyGmAc47cNGdafqcAyUSc9BW5DISqpAuxu5DocK4SxLGPXx7Bo
	9iuHCgqw==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noK-000Djj-1R;
	Thu, 10 Apr 2025 11:02:59 +0200
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
Subject: [PATCH 05/13] arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
Date: Thu, 10 Apr 2025 11:02:43 +0200
Message-Id: <20250410090251.1103979-6-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410090251.1103979-1-primoz.fiser@norik.com>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
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

Add property 'no-1-8-v' by default to usdhc1 (eMMC) node. Bootloader
will take care of deleting the property in case SOM supports HS400 mode
(1.8V IO voltage feature flag has to be set in the EEPROM).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 3d84eed33074..d6589d26c875 100644
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

