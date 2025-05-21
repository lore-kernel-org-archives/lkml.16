Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BBD25D8FC;
	Wed, 21 May 2025 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831261; cv=none; b=gVBIdGZogIE5L9UOBUlcTS3CZWf5dYiJx1AwR5GUJZOtaQLnyrotfGwkWQVbPu6jA2dOSzIV+N+bjuaY9XCLMExXEeRJwKjJww+uwwWFalGeuhVaTy3GCP+L18YmVbK3aS4iuN7uVEb4ZbjVg9VpY+2KzIYKF94/ldckANMd99s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831261; c=relaxed/simple;
	bh=Zt5ygJEfH4hH4SkPDCDAhyibiaJiF0S5RQ07/hs0WB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nhUnlVHDYL7ITXNQtJ3Z1sL6DNXvcl5FqDyIHLvlVITr3djAV7m3+kpQ/yvuC3x9uRemNvt7mHzrR7lb89st7yZjDfPL29SRNKqzxq28rMcRGQr/g3CqWiXDL8ouMFCXKU9mOQXhtpXQVCOfmrnM0ZTKiEH2Dm4YOcgg9R86kuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gKSeAfZW; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gKSeAfZW"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LCbgVZ026217;
	Wed, 21 May 2025 14:40:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hnQP/Q6LnoWX6XkVCxhVUrfCmZaEh5Joq/MobuJDvww=; b=gKSeAfZWQbT8v6Ql
	qJB5Xq8SdW7FyGWTyHFAq0L+Nvcrmq4MnJAc7HoqA5TdhEziL3ahKbQI69sDG/tG
	Vq8K7i1ENHiP2FiME0j+yT+24D8bhBe4J/Sqh2l3wRfYOfjj/9JXzhOMfL/XjS7c
	3U6EFf92p87xY9BhferX7MhwM5FwuvhqlyOhJf7NomAoHeFzwwp+cJvQftoK92Cc
	lV5POoOWfeALgj+C4K2dYTGFxCr0gA6cTmbwW7UtmUnKNKXvROaRa2zgQKvU6MT0
	iTu/xW+S0GQ6huW4c3CGBngUx3sm9qLkwpIOs5O9FBkiUGMo4CreBAYPPCsOq3YQ
	GweTtw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfac36c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:40:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9B66A4004D;
	Wed, 21 May 2025 14:39:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE06BCAA53E;
	Wed, 21 May 2025 14:38:53 +0200 (CEST)
Received: from localhost (10.252.1.130) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 14:38:53 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 21 May 2025 14:38:51 +0200
Subject: [PATCH v3 3/3] dt-bindings: stm32: cosmetic fixes for STM32MP25
 clock and reset bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
In-Reply-To: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
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
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01

- drop minItems from access-controllers
- remove rcc label from example
- fixes typos
- remove double '::' from 'See also::'

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

