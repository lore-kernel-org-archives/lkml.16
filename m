Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C461298CA5;
	Fri, 23 May 2025 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021854; cv=none; b=nAy4wCg/vAPbzoMxNn+GgO90JP6dmEjMF14wTiXvnM5AkLhJjNuzo26IYyOi3jlRAk//Qwt+Y9soSx0SNAL40oD/nBqAu2jGlvncAEDK5maUGr0OxGemS5HKaMBBk7gTQQWffETDHbstCtc/EuYO4Oi/gThqVt3fKeJyeK1GwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021854; c=relaxed/simple;
	bh=ePo0YWhWI02MOqzpipPfChsVWuE5sduu/Zr5kYDvIIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9rBROplmwpAPdHf06Tk1NfU56X4ab9g5I5+qyREctkgOY4hyrtgQ0XE+sDLOQu+OCK/Q3tA/moCwA1w09qSn00g4yH2wBcS+mhY3oX/5ifQocgJSIiX9b1akpt3xuBdeAZyhq4KDcmZyucBet5lvsw+pxsaasX2BO47tsX+un0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uIWKo-0076rJ-WD;
	Fri, 23 May 2025 17:37:31 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stable@vger.kernel.org
Cc: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 4/4] arm64: dts: imx8mp-venice-gw74xx: fix TPM SPI frequency
Date: Fri, 23 May 2025 10:37:23 -0700
Message-Id: <20250523173723.4167474-4-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250523173723.4167474-1-tharvey@gateworks.com>
References: <20250523173723.4167474-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX8MPDS Table 37 [1] shows that the max SPI master read frequency
depends on the pins the interface is muxed behind with ECSPI2
muxed behind ECSPI2 supporting up to 25MHz.

Adjust the spi-max-frequency based on these findings.

Fixes: 531936b218d8 ("arm64: dts: imx8mp-venice-gw74xx: update to revB PCB")
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index f00099f0cd4e..12de7cf1e853 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -201,7 +201,7 @@ &ecspi1 {
 	tpm@0 {
 		compatible = "atmel,attpm20p", "tcg,tpm_tis-spi";
 		reg = <0x0>;
-		spi-max-frequency = <36000000>;
+		spi-max-frequency = <25000000>;
 	};
 };
 
-- 
2.25.1

