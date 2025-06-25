Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B327CB02;
	Wed, 25 Jun 2025 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842595; cv=none; b=pfI2oEW4eUZyD9atMJk2FUYF54y001cBMiJkboyJgkumfuK3YXZqTxts0m6jkBBXj+TPYQbhPduVKocr6EDhQHx76mPG1t2Vrcvi7Gr71XKPidCA4d8IvKL0S+2b9u5dbnKMrQJKIF940Ha30+SdnKNMYCwCYXg1F6Dbi/UXv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842595; c=relaxed/simple;
	bh=bnYqW+P7cHwEMYJ6/COYnVOE3rPjRiNjIFyIgadqvFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=F/zGCBRiftxvY265Z/TB+lEVKyA36hZFnWdAbekY2TSiR7gCpmYaRf4KhSxlMnPx+bNhJQ6JTcmvhcpR9L4HGT/l5LnKQKer/i7Q+Ie0nq7QAxr7WFBJUWQKNWsJrlz5It8n5VUx3PcfHQdqyfL3fOnZlAQkdbOG3TvJQQUmafs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=rpqSw6Bk; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="rpqSw6Bk"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5vmrB005164;
	Wed, 25 Jun 2025 11:09:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	IgxTZBT25twzbM3wpJ4isoQbEkFyGOclWHPMbqKTDj0=; b=rpqSw6BkqLi01Pd2
	BjFfZ520bgPaStrERa8Sjl43OxDy38VzVhf8+iI6fq0ABnAjxbhffqtCyWThU0Rg
	nIz5U8CxRBCBYOR/7STnDze/qD6wMYU0JvHQk4MzX5nyovLvW359ARgBgJbO55ru
	F2Sd5FIvXEXhfu9sLmC8p+JrymsoOQndhOnIdo3s7nViYoLDR34jUDDrGj+1u56c
	yfEM0ndvYuNBfHjkckqx0g0Es+Gql3Ajhb7s1JLe7FG7Gdhx1hMEbUaz0FoV8LCD
	EjJl1oaVPBJchT2G4nZO5FAd1D0uBLKL2fTYW1EvWq1huEBIU3oI0y6PlmIuPkjH
	CBYgNg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbrtp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:09:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CFEA640044;
	Wed, 25 Jun 2025 11:08:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E4DAB28F50;
	Wed, 25 Jun 2025 11:07:35 +0200 (CEST)
Received: from localhost (10.48.87.144) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 11:07:34 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 25 Jun 2025 11:07:26 +0200
Subject: [PATCH RESEND v4 3/3] dt-bindings: stm32: cosmetic fixes for
 STM32MP25 clock and reset bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-upstream_rcc_mp21-v4-3-9368a86c8515@foss.st.com>
References: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com>
In-Reply-To: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01

- drop minItems from access-controllers
- remove rcc label from example
- fixes typos
- remove double '::' from 'See also::'

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../devicetree/bindings/clock/st,stm32mp25-rcc.yaml         | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 88e52f10d1ecc68e818cd7d8cb1ca39dceb7a494..1e3b5d218bb01acb247d27bc6902be821cabd98c 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -11,9 +11,9 @@ maintainers:
 
 description: |
   The RCC hardware block is both a reset and a clock controller.
-  RCC makes also power management (resume/supend).
+  RCC makes also power management (resume/suspend).
 
-  See also::
+  See also:
     include/dt-bindings/clock/st,stm32mp25-rcc.h
     include/dt-bindings/reset/st,stm32mp25-rcc.h
 
@@ -38,7 +38,7 @@ properties:
       - description: CK_SCMI_MSI Low Power Internal oscillator (~ 4 MHz or ~ 16 MHz)
       - description: CK_SCMI_LSE Low Speed External oscillator (32 KHz)
       - description: CK_SCMI_LSI Low Speed Internal oscillator (~ 32 KHz)
-      - description: CK_SCMI_HSE_DIV2 CK_SCMI_HSE divided by 2 (coud be gated)
+      - description: CK_SCMI_HSE_DIV2 CK_SCMI_HSE divided by 2 (could be gated)
       - description: CK_SCMI_ICN_HS_MCU High Speed interconnect bus clock
       - description: CK_SCMI_ICN_LS_MCU Low Speed interconnect bus clock
       - description: CK_SCMI_ICN_SDMMC SDMMC interconnect bus clock
@@ -108,15 +108,14 @@ properties:
       - description: CK_SCMI_ICN_APB2 Peripheral bridge 2
       - description: CK_SCMI_ICN_APB3 Peripheral bridge 3
       - description: CK_SCMI_ICN_APB4 Peripheral bridge 4
-      - description: CK_SCMI_ICN_APBDBG Peripheral bridge for degub
+      - description: CK_SCMI_ICN_APBDBG Peripheral bridge for debug
       - description: CK_SCMI_TIMG1 Peripheral bridge for timer1
       - description: CK_SCMI_TIMG2 Peripheral bridge for timer2
       - description: CK_SCMI_PLL3 PLL3 clock
       - description: clk_dsi_txbyte DSI byte clock
 
   access-controllers:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
 required:
   - compatible
@@ -131,7 +130,7 @@ examples:
   - |
     #include <dt-bindings/clock/st,stm32mp25-rcc.h>
 
-    rcc: clock-controller@44200000 {
+    clock-controller@44200000 {
         compatible = "st,stm32mp25-rcc";
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;

-- 
2.25.1

