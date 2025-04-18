Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90FD26F44D;
	Fri, 18 Apr 2025 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957887; cv=none; b=eW1IkYuZFjRBnWqj0XdYGE9XPeqvEgNXy9zotZBVqnB+KJN0ULEh6rBu9NrDNhr8w/X6go1bAn0BI5jipBKRQRdQMsoVaTjyJgWb00yDYNfImXJ8kZ8c7WuTdn8gUiJyh0HUhh7JE7GUCt72dUMPdipbhfx/vIy9SJrGxugtEtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957887; c=relaxed/simple;
	bh=r/Ex6zbqfmmSqV6pPOofSWL8wLYsy0vJ40McfaddmnA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p0QZJKKeKkCpobwi0AqH4+7sccAjP4el1gAOQYQKNFXdl1tCZKAhua6guOOaob7rLWLGLip+qU4jP2cUVD5xKXa70IEWUDBiVFv5TmN5gETeiLUDfG6qi49MaVsVjHwZuqN6+mMAp/4xrjOPQ1a+hNHGfjSNs9Vk16NNymYqp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=cKH8Jjz3; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="cKH8Jjz3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oTg5xlBMV3ZpioVnQMKMCNtn41a6TiUkCbtv/ticY0Q=; b=cKH8Jjz3UhDIikWoDUs9Pr6GlI
	Mmz/6GL+pGzQYRY4NUFxkPQ1reeW+aRqBnalYDxz5Cs/EBek0U2vd9bYn3wnMVO9bcz7K6nvF8a8y
	vZ03y5b1HiShBsMyWEt/U56nCsO4sNA2kIgj17dyWhsUnjVS0Lug+UUFVqVMkWM+vgi9oHHr1CpC3
	u/PxqDkEA+4KxZd1OM8JjV0tL7PKohBHdlAp7guW4A9Dh4Ii6FkbCo1ybIlEqu9YT73lbykd/uyPq
	6lgqy2uq2Pj9oAYd1IP0qumexjCyfEGGNJtKkWmG7S+eMaVoK9mq5Pp93074AtyBlQDRSkxrgG5fz
	SV6z8cgw==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fG0-00AbM0-1a;
	Fri, 18 Apr 2025 08:31:24 +0200
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
Subject: [PATCH v3 15/15] arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically
Date: Fri, 18 Apr 2025 08:31:04 +0200
Message-Id: <20250418063104.2202085-16-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
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

Move pinctrl_uart1 to keep nodes in alphabetical order. No functional
changes.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

 .../boot/dts/freescale/imx93-phyboard-segin.dts    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index c62cc06fad4b..0c55b749c834 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -228,13 +228,6 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
 		>;
 	};
 
-	pinctrl_uart1: uart1grp {
-		fsl,pins = <
-			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
-			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
-		>;
-	};
-
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
@@ -257,6 +250,13 @@ MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x1402
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
+		>;
+	};
+
 	pinctrl_usdhc2_cd: usdhc2cdgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.34.1

