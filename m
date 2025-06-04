Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1DF49659;
	Wed,  4 Jun 2025 23:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749079065; cv=none; b=bfG7oZpcb6VXvmYw+c6kEd2TFjHR10WuKK4ETdFX95ZPbObTOZqia/bEZTGj8ZaPQoarQXeHWqZsjOmPjTHKyzAX5gsHIuZxpmSDHpH7NQroSECw2Ao6ehwUIHYvBrzedEBY8+fZ+GGH3eNmjiDnHWVtaIRjbx97U3KFHYr2Y28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749079065; c=relaxed/simple;
	bh=pM8CmrLz/FFL/2U/C4cXcKjLVMqnJpnjvoUhceHqFmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d2ocm7A1c1M5Npct1CcIRGO1gxicham5u8aYUptlhGiMf6esQ1Gvnyba04lM1ck6vZAiMG0597NcChwwBxe+FUTnGsV7n76tAFRhe3/5sVlYYbRSjxlYLkuhWak5vZ04hsGScINugtsVu84Y/FY1sRiRhIi6+1rifq9ET17JDPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uMwwC-007Xnc-DK;
	Wed, 04 Jun 2025 22:50:24 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH] arm64: dts: imx8mp-venice-gw74xx: update name of M2SKT_WDIS2# gpio
Date: Wed,  4 Jun 2025 15:50:22 -0700
Message-Id: <20250604225022.1429093-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GW74xx D revision has added a M2SKT_WDIS2# GPIO which routes to the
W_DISABLE2# pin of the M.2 socket. Update the gpio name for consistency.

Fixes: 6a5d95b06d93 ("arm64: dts: imx8mp-venice-gw74xx: add M2SKT_GPIO10 gpio configuration")
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v2: update commit log to clarify we are just renaming a gpio
---
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index 6daa2313f879..f00099f0cd4e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -301,7 +301,7 @@ &gpio2 {
 &gpio3 {
 	gpio-line-names =
 		"", "", "", "", "", "", "m2_rst", "",
-		"", "", "", "", "", "", "m2_gpio10", "",
+		"", "", "", "", "", "", "m2_wdis2#", "",
 		"", "", "", "", "", "", "", "",
 		"", "", "", "", "", "", "", "";
 };
@@ -310,7 +310,7 @@ &gpio4 {
 	gpio-line-names =
 		"", "", "m2_off#", "", "", "", "", "",
 		"", "", "", "", "", "", "", "",
-		"", "", "m2_wdis#", "", "", "", "", "",
+		"", "", "m2_wdis1#", "", "", "", "", "",
 		"", "", "", "", "", "", "", "rs485_en";
 };
 
@@ -811,14 +811,14 @@ pinctrl_hog: hoggrp {
 			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09	0x40000040 /* DIO0 */
 			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11	0x40000040 /* DIO1 */
 			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02	0x40000040 /* M2SKT_OFF# */
-			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x40000150 /* M2SKT_WDIS# */
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x40000150 /* M2SKT_WDIS1# */
 			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40000040 /* M2SKT_PIN20 */
 			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x40000040 /* M2SKT_PIN22 */
 			MX8MP_IOMUXC_SD2_CLK__GPIO2_IO13	0x40000150 /* PCIE1_WDIS# */
 			MX8MP_IOMUXC_SD2_CMD__GPIO2_IO14	0x40000150 /* PCIE3_WDIS# */
 			MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18	0x40000150 /* PCIE2_WDIS# */
 			MX8MP_IOMUXC_NAND_DATA00__GPIO3_IO06	0x40000040 /* M2SKT_RST# */
-			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14	0x40000040 /* M2SKT_GPIO10 */
+			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14	0x40000150 /* M2KST_WDIS2# */
 			MX8MP_IOMUXC_SAI3_TXD__GPIO5_IO01	0x40000104 /* UART_TERM */
 			MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31	0x40000104 /* UART_RS485 */
 			MX8MP_IOMUXC_SAI3_TXC__GPIO5_IO00	0x40000104 /* UART_HALF */
-- 
2.25.1

