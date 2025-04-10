Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C4426F466;
	Thu, 10 Apr 2025 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279212; cv=none; b=rOQqeZD7MG46mCelHS9DgjtHnIBJJYf8tX8ZIHLzVfjiIU6G/8Tm6DdC5Thzo6h323xFXQV7qPxB710fdstgPHH2UBhV7pwsoLwvFPaacUnrODsJIGSUOZY5JA5Da6+ZYOhGo5QP+R6Z2niCXFX6umFm13BEMXWVfr2s6ite378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279212; c=relaxed/simple;
	bh=pLO2Wip5sMNqxPVOS/4gTiCZMRxORGC5VqdQ4f/mxyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LNIE8H0z7CvMUIvlbfrLgnZk2n2lSS8VLZtgB3plcH0QwIOxxlAmIgB02aPhfnt3MKOguy7K2qdcevrp7NXm8GHtDMD482XbYVEOGP+NIxkSbIUDNTM8oTYem+PxuFJ0+T1Q2ENn0KBH57+kGXYw+uRSeaeNUkfU76WGYup+jy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=lOMm6c8X; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="lOMm6c8X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Z+eC249uRYkRdhzJpnJvyPrRUmUkEwuqtNVIRRPmw04=; b=lOMm6c8XqARmWitxR2VMJkEtKO
	fTBcVvBCV+1UxpirZGQYCwsae9oVKTj3MnpZUf5TwRHZ6AmBcEsO8JhDOrIFn3gTx3mXHH22PWygW
	cIScXdj40jgdy3vtPg+pldR0RdzO6bxn9SNQyEcPtdIgVwflxQKr19o5FYGjmLbfr9v29mU/B+HcD
	KSzAMFA3R9sL5CXd0shZvFrBkSjx/KvAfRF/vhoilQOL6IbuzW4f2FtSxGozBO3EVshgzjhKHPkTw
	GfN7VEeIweOt9UID4CcLruOn3Sf+EIWfOfs4brmvYRp6ceNsy3Y5oZXIRbvztrIAyfo7HotuFNHPv
	QZr4Ofsg==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noF-000Djj-0M;
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
Subject: [PATCH 02/13] arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
Date: Thu, 10 Apr 2025 11:02:40 +0200
Message-Id: <20250410090251.1103979-3-primoz.fiser@norik.com>
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

Add support for the EEPROM chip available on I2C3 bus (address 0x50),
used for the PHYTEC SOM detection.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 507a71f9294b..442ee067a047 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -154,6 +154,14 @@ ldo5: LDO5 {
 			};
 		};
 	};
+
+	/* EEPROM */
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		pagesize = <32>;
+		reg = <0x50>;
+		vcc-supply = <&buck4>;
+	};
 };
 
 /* eMMC */
-- 
2.34.1

