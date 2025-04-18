Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F5E2512FC;
	Fri, 18 Apr 2025 06:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957875; cv=none; b=nkt/gqw/sTom857fiRAAjSmLaZUmyJrp5oArkb0i3tsJkjWZfnV8FZmwi9VRWMGq6/6yiz6dQcPxOIpeGEgTEf8R5m7wNvE9l0hBGB/hDnXKyfujrHqYylKAZgYSBori7srovir+uXoYyGXswKmfc9epVEv0fTnkoVCo1h6a22o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957875; c=relaxed/simple;
	bh=VAo/Ca5+mJ33zeiK46eux7tglQLRdsuGWeqA920KCco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u2HBuIjD9y4pZiUSbQNu0N4Dg1ApXyzR3vg82N3oIzQbv/j4JDeO+jHPMDglSBIzOOvH5Y/uu7Pkukmt16veaGT8N3cOizA5aXUIrxAvd97maarVl0p/Hw5rWluVvQESTYFkeWIIjn1sIwI2UVP3edjYHyyn0wtjtihYu29Yzp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=CuvAIVtt; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="CuvAIVtt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mqRoswbCU2PmZaM2YpiQHIcOlqwDnelfkfYWs64Uy74=; b=CuvAIVttemxXUump81vBKO2aPJ
	cf52lX0sY/Hz8Udd/aHmG9/68XlIg2cxw/rvh59dmlV9iyTlvqNpgV9q3d9aG97wvRn1LaaH/70dz
	QpBLW/89VZqg52L416scwGQo8i+0blS0QyjK53Z02tooMmuKqW9K1xda+uivA3m6ibgwljzs6yrco
	CjT/cgM5gvXjdbf0nY9GuaupYTbYRaPeBHB4zx0ypJufMBCywXIup9rNslncVbsM42ULNtzWOPIPQ
	W48xnmSNUeV8tq0BRSaVy8XMt45j0wAxcfoTh5FdpDEJEzut/1Q7ByeRKGZ/R5AGsdVLDvfYstMY2
	L+q8CC5g==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFi-00AbM0-0T;
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
Subject: [PATCH v3 03/15] arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
Date: Fri, 18 Apr 2025 08:30:52 +0200
Message-Id: <20250418063104.2202085-4-primoz.fiser@norik.com>
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

There is already an external pull-down resistor on the LED output line.
It makes no sense to have both pull-down and pull-up resistors enabled
at the same time. Thus disable the internal pull-down.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- no changes

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 0528e293c03d..06a9e674e338 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -196,7 +196,7 @@ MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
 
 	pinctrl_leds: ledsgrp {
 		fsl,pins = <
-			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x31e
+			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x11e
 		>;
 	};
 
-- 
2.34.1

