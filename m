Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80082264B3;
	Thu, 26 Jun 2025 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750922200; cv=none; b=hkZvQGP8SyLU7oZgWR6m3aKuqKnWPXmH3SbVCUZstVbDlbzjRVGkZdCIkvVAS3jB1QimvtXoK6va7wHW6YpU2j2Ny3tgM9iXP6Y5ZT2KkV0Ryt+BVLrdTZ2fXXd/pVmLKUSHiKBwSjO2NEV3khgACSa1SthH33JQZE3pRwJRqyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750922200; c=relaxed/simple;
	bh=0q2JKjk5rlpL1746jH/ubWzmc6KZ+IZsAj+d8WcyzPk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y/cNVh5fAKA2vRDcWU5WgRBXjVDPuGQ0U2cfvJLBb4EgWibYtEujG0JYLE4nvnbBfQRkXawqOLU7Hx7GZTgPNwa2ecy/p9Y2jEFou2qmnMO2WGOxSdC8Gh5RImjTCreWZ884fwFIX12xjQysZFbdRSiHi+2ziKQXO1Nl+99rueg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=WDgrXAck; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="WDgrXAck"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Op03+qucqVF+nZEGn/AJUKWrnarNtLlz6bXQbzmKHKo=; b=WDgrXAck+b+Fb89P+1pfJvOa7o
	hkmcyJOlDNvaik2y7zg4BIznyeoU9Q/YtKp2tiFkrZ4F4K5NjBZy/g35m4TcKR3yTQ1lncUjCc3Ht
	8U44m50bQiR7evULsQRTR3QdY7cQJZcLTcFveMPQV7z9DqZTRxV6b6QDTd2t3O2UpHd96SplZ5jnM
	gLM9oHvNOaat6fwSKMVV+tl0nj39o9WKEJ9nq3ZP52FekEmiRyY0ns5Vm0d82dJKI1guYi//iIuXh
	hgyTd9n2oX5IfLy4I+SwCPtX8KCrhidrJbpKiD7TqIQs3SnA+jg/NYn7wYiqNrrDO1GQKbVKbTugO
	PYucaynw==;
Received: from [89.212.21.243] (port=34404 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uUgqU-00D1LJ-2V;
	Thu, 26 Jun 2025 09:16:29 +0200
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
Subject: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Add watchdog ext-reset-output pin
Date: Thu, 26 Jun 2025 09:16:29 +0200
Message-Id: <20250626071629.3380656-1-primoz.fiser@norik.com>
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

On phyCORE-i.MX93 SoM, the SoC WDOG_ANY output line is connected to the
external pca9451a PMIC WDOG_B input. Apply pinctrl and set the property
"fsl,ext-reset-output" for watchdog to trigger board reset via PMIC on
timeout/reset.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reword commit title as suggested by Frank Li in v1

Link to v1: https://lore.kernel.org/all/20250624061323.601550-1-primoz.fiser@norik.com/

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 5ee52774e7bf..729c26f9ac94 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -191,6 +191,9 @@ &usdhc1 {
 
 /* Watchdog */
 &wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
 	status = "okay";
 };
 
@@ -279,4 +282,10 @@ MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
+		>;
+	};
 };
-- 
2.34.1

