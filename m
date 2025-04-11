Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5FF20F063;
	Fri, 11 Apr 2025 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371501; cv=none; b=JCtignxTrYTgCglL+GCKBJe1trUqV9th7MF5ND+4i2tEHkB45QAQ09J9TpPyBMXW7777HuJ5pb3oZ9A+GTqY6rjFXIED41WqjfgKdIICWmtD49TS2gkisezXEFuOXOgKpJ1kZdY9QC/CQ7owxzMBN8wWqXyAb0OQG4LkPotdPW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371501; c=relaxed/simple;
	bh=nSJeRVzzaivIB88gKQyatucRpKgXoP8b+63uudU5lDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNtcS8pNXwsbAL60QDnL+Fdjqux9vQDNZht28AIYmTqkBsLlN5VFnv9W2kK+efIj3GmXm+mhnkkKcEcbSxD0lVMgxZmrfoEyHhYVJqBHdMDp3AvUE3ZnmIJvWlBzcUe/QxhJRD0scMOMWzIg4DZhhmgCue26Zx/1zhx8NDSW5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5JMA9Em; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5JMA9Em"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37FB2C4CEEA;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371501;
	bh=nSJeRVzzaivIB88gKQyatucRpKgXoP8b+63uudU5lDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X5JMA9EmZ/Z3iU7lsOo2pwlY9L7j1bCn+5X3lG4/6O2k+ubp9P4vX12ewy058W6zn
	 dqhKv5HAyEmD7RA+eZDABEE/YTHGsMWUMdm4WZIT/wBZ8mVg7g89HaXuDUh0veyrF5
	 +7P8slov3QxjY5DMr/yp8UiRMZ1v36LAq8IT6EIKUnt62+fUJ9TgDLr4uCQhse/0wS
	 KClYcrxJzSCayMDjiV05qm1F629hakXeVpHwABNp90T6+JQzuWEJcxSEMhgUEpxYsO
	 scNDOAhHFvv+Ve/LegrHQyOdo377P61XH5GQL++A++CDFlzvuKPZR5MedOJDuE8fSI
	 +7Vzb9UlQRCZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29568C369AC;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 19:38:16 +0800
Subject: [PATCH v6 2/3] arm64: dts: amlogic: Add A4 Reset Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-a4-a5-reset-v6-2-89963278c686@amlogic.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
In-Reply-To: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744371498; l=3908;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=oF2MZH3lmYKfr/9G4rTMkISCrbGCYT5binySnJgFGrM=;
 b=1hCD4X3dmHRDlOzmN0G8PlfVSAjgwdH0vodvKUmlTu9AACO4KmKo73RpO8sQSr6GCQN1dI7Iw
 IGMcKjlXhMpAN6RLt0JFTgzg2xD+AsFaCt6LjKFQr1PV5hp/5ZHy3hc
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
Reply-To: kelvin.zhang@amlogic.com

From: Zelong Dong <zelong.dong@amlogic.com>

Add the device node and related header file for Amlogic
A4 reset controller.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Link: https://lore.kernel.org/r/20240918074211.8067-3-zelong.dong@amlogic.com
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h | 93 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi    |  8 +++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
new file mode 100644
index 0000000000000000000000000000000000000000..f6a4c90bab3cf7cfaa3c98c522bed5e455b73bd3
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __DTS_AMLOGIC_A4_RESET_H
+#define __DTS_AMLOGIC_A4_RESET_H
+
+/* RESET0 */
+/*						0-3 */
+#define RESET_USB				4
+/*						5-6*/
+#define RESET_U2PHY22				7
+#define RESET_USBPHY20				8
+#define RESET_U2PHY21				9
+#define RESET_USB2DRD				10
+#define RESET_U2H				11
+#define RESET_LED_CTRL				12
+/*						13-31 */
+
+/* RESET1 */
+#define RESET_AUDIO				32
+#define RESET_AUDIO_VAD				33
+/*						34*/
+#define RESET_DDR_APB				35
+#define RESET_DDR				36
+#define RESET_VOUT_VENC				37
+#define RESET_VOUT				38
+/*						39-47 */
+#define RESET_ETHERNET				48
+/*						49-63 */
+
+/* RESET2 */
+#define RESET_DEVICE_MMC_ARB			64
+#define RESET_IRCTRL				65
+/*						66*/
+#define RESET_TS_PLL				67
+/*						68-72*/
+#define RESET_SPICC_0				73
+#define RESET_SPICC_1				74
+/*						75-79*/
+#define RESET_MSR_CLK				80
+/*						81*/
+#define RESET_SAR_ADC				82
+/*						83-87*/
+#define RESET_ACODEC				88
+/*						89-90*/
+#define RESET_WATCHDOG				91
+/*						92-95*/
+
+/* RESET3 */
+/*						96-127 */
+
+/* RESET4 */
+/*						128-131 */
+#define RESET_PWM_AB				132
+#define RESET_PWM_CD				133
+#define RESET_PWM_EF				134
+#define RESET_PWM_GH				135
+/*						136-137*/
+#define RESET_UART_A				138
+#define RESET_UART_B				139
+/*						140*/
+#define RESET_UART_D				141
+#define RESET_UART_E				142
+/*						143-144*/
+#define RESET_I2C_M_A				145
+#define RESET_I2C_M_B				146
+#define RESET_I2C_M_C				147
+#define RESET_I2C_M_D				148
+/*						149-151*/
+#define RESET_SDEMMC_A				152
+/*						153*/
+#define RESET_SDEMMC_C				154
+/*						155-159*/
+
+/* RESET5 */
+/*						160-175*/
+#define RESET_BRG_AO_NIC_SYS			176
+/*						177*/
+#define RESET_BRG_AO_NIC_MAIN			178
+#define RESET_BRG_AO_NIC_AUDIO			179
+/*						180-183*/
+#define RESET_BRG_AO_NIC_ALL			184
+/*						185*/
+#define RESET_BRG_NIC_SDIO			186
+#define RESET_BRG_NIC_EMMC			187
+#define RESET_BRG_NIC_DSU			188
+#define RESET_BRG_NIC_CLK81			189
+#define RESET_BRG_NIC_MAIN			190
+#define RESET_BRG_NIC_ALL			191
+
+#endif
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index c02fa5ee9fd22285ebad2ef52939e2fc4c4dd019..563bc2e662fac5f2ec3d0b9cc3fca0de39ec0553 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "amlogic-a4-common.dtsi"
+#include "amlogic-a4-reset.h"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
@@ -51,6 +52,13 @@ pwrc: power-controller {
 };
 
 &apb {
+	reset: reset-controller@2000 {
+		compatible = "amlogic,a4-reset",
+			     "amlogic,meson-s4-reset";
+		reg = <0x0 0x2000 0x0 0x98>;
+		#reset-cells = <1>;
+	};
+
 	periphs_pinctrl: pinctrl@4000 {
 		compatible = "amlogic,pinctrl-a4";
 		#address-cells = <2>;

-- 
2.37.1


