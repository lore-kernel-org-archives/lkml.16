Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38753213224;
	Tue, 22 Apr 2025 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319416; cv=none; b=i6Laovqsr/6dGQmzV1Ei3Yti2SYmaiwrAKaugQt/KAe7QgxGb9VqKMOza8Bm24MscZgiswiX73oYm+Dkaifr9tz0ERyyyAYFTkmrSVpfijl7tMWTgXXHhoc7ZmAE2ZCQZat2wbd2ZOWDruC5w7UxgSlr0QNxB/G92sNINr2hht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319416; c=relaxed/simple;
	bh=6d+U91CPqoFD93yIaALxCHx3nOlc0OBM6RD1ZRMXbRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lu7f+tN6NVEJXJZRWjb4Bn6EtLE3YMhP+kUOnaSyyl6bD64TifwLldrVRWJH5k7IM3FvlSp+xVle9w8jLQ1Yz3xEO9hB9UxKQyipoa5s1fVh2c8ufrUX0h4d+2rwfZjGkhVXF2jEvDnBI7Af4mtQKIW5pVhJmN7uSeZOOvwHyZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=OI81sUHG; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="OI81sUHG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rcC6sO/CO6NiYaevDv7ur1bv7w/Mg7MMOwZOt9Qajsc=; b=OI81sUHGM/1BwyYkAPJxbCK46v
	//e/uMtr6QsC4WGnwQJjmjs2uDNjTcNRDXkrmPojEKdlEO+3jvViivfaCbWz+BVqOU9lH5UAzA6Yd
	gaxVWA77lT+h7O1I0GSmTBvyJERCQj6cmdydCiyAZAiNpRrZQZSASLI8Ng5/yaRS1BMX0eE+J7WbC
	Pz9PZ2pLWSvoKik5rBCDYHg6bcMcOzZ7VjzJkJKIYaxQ/89g/cHe0m/Vz6nca5HPrX+5vRtiGrjs+
	Q1ZATpozvftYxLxnMgr9vX3zFUmb/VkQWaa5qhgzKDKfGX6a9/QW0ahvA2Y+fMNQewROPoh9po4U+
	TH0XFmVg==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BIz-008kyr-2N;
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
Subject: [PATCH v4 02/15] arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
Date: Tue, 22 Apr 2025 12:56:31 +0200
Message-Id: <20250422105644.2725168-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 507a71f9294b..0528e293c03d 100644
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
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&buck4>;
+	};
 };
 
 /* eMMC */
-- 
2.34.1

