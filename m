Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66F296173;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371501; cv=none; b=RCjTRoZEn0mcpwqevuK6UaI3l8yPJMnyWQPcX0QnNqn7cGOfMTzeRBT2pH7uafNwkHKM//39akBMoW+MlFI/be9miwky29Fy7N0erh0NDL2bZe4u2hdsLR9pHJgvL/Wf+Ieb9U9UfCy52KLMadUq3yTgNKbSV2bIAmmY9gTlssE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371501; c=relaxed/simple;
	bh=m07n1i6EW5KXoabkxKV3BA5YXAEQROFJ/PT65oveu8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APjVlCtav+zcGK3g+P6AslvWy7rUS+j7vfZiZptaJNhygtAJI2DYyPk4W0pEiMZedJ8D9LVZIJXgkvnVvdvJ635AZLIC9e52+Wf59q5HZuXrswPLoio2kSQeem/bmCIvslHMZEjnOn8gRLmcpM6Ms59oek653NP1kOpXLFoyMT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLWZR7JD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLWZR7JD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46315C4CEEC;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371500;
	bh=m07n1i6EW5KXoabkxKV3BA5YXAEQROFJ/PT65oveu8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RLWZR7JDZQVmDTsMHkommj4Jv9FQXpu9xcwTEQWiV9WOVGZ3KSjWiU95cHKgwYHkj
	 1f9muvFc9fuWnnJH/f2MHN6rl31gNMoH6uYaVLb/2uFrhlHS8ewqXa2PDWlrjWcHbr
	 Y4/aE/ypmFD5DUa4JhGerijbhjGyaJZozjRFib4Pu1Zcat0z/fuOHHFnVih9PJ9OjZ
	 dyjfe2jz25cSlZScDkGZeNGPjjjJ9mVBMpcwhVFmJ6rdn0bxDFhK25hPp9lRrrSPVN
	 zzhpFp3/fMnaf8+tIsLRvPuy3NUSG6HS3fUy8FjjgIsQtC9oJhjHvE6Y/7v8Kk7p+R
	 Di26n/MUJqK1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371EEC369AD;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 19:38:17 +0800
Subject: [PATCH v6 3/3] arm64: dts: amlogic: Add A5 Reset Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-a4-a5-reset-v6-3-89963278c686@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744371498; l=4039;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=39cgxEleCRWNGiMf9dZjnPoJH+4QSAKwm+85hqJrCUk=;
 b=PYZD7Sc+pTxBghbA1cA21hexU/OWuPj4rDnnZZ6WOBpv3nXbjtlIHPTwhBqUI0HHSNaobk/Qi
 tEf44laRPLJA3zSVhSqHI0O3qUP7QnvdvQEzT2+6XYwUAEI++as4w/a
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
Reply-To: kelvin.zhang@amlogic.com

From: Zelong Dong <zelong.dong@amlogic.com>

Add the device node and related header file for Amlogic
A5 reset controller.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Link: https://lore.kernel.org/r/20240918074211.8067-4-zelong.dong@amlogic.com
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h | 95 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi    |  8 +++
 2 files changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h
new file mode 100644
index 0000000000000000000000000000000000000000..cdf0f515962097c606e4c53badb19df7d21606ec
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __DTS_AMLOGIC_A5_RESET_H
+#define __DTS_AMLOGIC_A5_RESET_H
+
+/* RESET0 */
+/*						0-3 */
+#define RESET_USB				4
+/*						5-7 */
+#define RESET_USBPHY20				8
+/*						9 */
+#define RESET_USB2DRD				10
+/*						11-31 */
+
+/* RESET1 */
+#define RESET_AUDIO				32
+#define RESET_AUDIO_VAD				33
+/*                                              34 */
+#define RESET_DDR_APB				35
+#define RESET_DDR				36
+/*						37-40 */
+#define RESET_DSPA_DEBUG			41
+/*                                              42 */
+#define RESET_DSPA				43
+/*						44-46 */
+#define RESET_NNA				47
+#define RESET_ETHERNET				48
+/*						49-63 */
+
+/* RESET2 */
+#define RESET_ABUS_ARB				64
+#define RESET_IRCTRL				65
+/*						66 */
+#define RESET_TS_PLL				67
+/*						68-72 */
+#define RESET_SPICC_0				73
+#define RESET_SPICC_1				74
+#define RESET_RSA				75
+
+/*						76-79 */
+#define RESET_MSR_CLK				80
+#define RESET_SPIFC				81
+#define RESET_SAR_ADC				82
+/*						83-90 */
+#define RESET_WATCHDOG				91
+/*						92-95 */
+
+/* RESET3 */
+/*						96-127 */
+
+/* RESET4 */
+#define RESET_RTC				128
+/*						129-131 */
+#define RESET_PWM_AB				132
+#define RESET_PWM_CD				133
+#define RESET_PWM_EF				134
+#define RESET_PWM_GH				135
+/*						104-105 */
+#define RESET_UART_A				138
+#define RESET_UART_B				139
+#define RESET_UART_C				140
+#define RESET_UART_D				141
+#define RESET_UART_E				142
+/*						143*/
+#define RESET_I2C_S_A				144
+#define RESET_I2C_M_A				145
+#define RESET_I2C_M_B				146
+#define RESET_I2C_M_C				147
+#define RESET_I2C_M_D				148
+/*						149-151 */
+#define RESET_SDEMMC_A				152
+/*						153 */
+#define RESET_SDEMMC_C				154
+/*						155-159*/
+
+/* RESET5 */
+/*						160-175 */
+#define RESET_BRG_AO_NIC_SYS			176
+#define RESET_BRG_AO_NIC_DSPA			177
+#define RESET_BRG_AO_NIC_MAIN			178
+#define RESET_BRG_AO_NIC_AUDIO			179
+/*						180-183 */
+#define RESET_BRG_AO_NIC_ALL			184
+#define RESET_BRG_NIC_NNA			185
+#define RESET_BRG_NIC_SDIO			186
+#define RESET_BRG_NIC_EMMC			187
+#define RESET_BRG_NIC_DSU			188
+#define RESET_BRG_NIC_SYSCLK			189
+#define RESET_BRG_NIC_MAIN			190
+#define RESET_BRG_NIC_ALL			191
+
+#endif
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 32ed1776891bc7d1befd01a76c76048631606f5a..b1da8cbaa25a1844312a23bc39eb876df3c60df5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "amlogic-a4-common.dtsi"
+#include "amlogic-a5-reset.h"
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 / {
 	cpus {
@@ -50,6 +51,13 @@ pwrc: power-controller {
 };
 
 &apb {
+	reset: reset-controller@2000 {
+		compatible = "amlogic,a5-reset",
+			     "amlogic,meson-s4-reset";
+		reg = <0x0 0x2000 0x0 0x98>;
+		#reset-cells = <1>;
+	};
+
 	gpio_intc: interrupt-controller@4080 {
 		compatible = "amlogic,a5-gpio-intc",
 			     "amlogic,meson-gpio-intc";

-- 
2.37.1


