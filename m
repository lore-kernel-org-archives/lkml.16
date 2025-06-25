Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88372BCF53
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842760; cv=none; b=jEhiEb29O7U+RT0pbrBhjgsj9VuTvmJFBIsrCkERguWD7gvXVp8JayJGv2Mm68b4V2f3KXFAbpBrOcuHSVxvxR/KUAA5d3PyE0fi5ncpgu0gy2rKEek8ltoqpDy3e8Fy+yMVQJh7Ypw1Fu3PS2Qry5LaKqg0afK76mchvKs+2IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842760; c=relaxed/simple;
	bh=wlfh+1W3Yk1ZGs9hBshsqvaX7PF80+ynWaNZAUcxrOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJ+OaPWmpDtObf5sDh/6gppJDiJx+2AI3avAirHbmnisJXFEs0Q4EUY7UnED+zDw7iUrx6NLdY4JK7/10XN8XJ2P6WjK0cya6rGaHJhqMVtEZv1H+JipFbe/QbeiTXeBUdWbz8Cnsynh0REHom4np2pm43smCGm2GGIgU8QXq9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qafCgY/c; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qafCgY/c"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad574992fcaso1123519966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842754; x=1751447554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jd7xJvI8U6KJmaOFVsZsTyhneNOAXksVQYXksX57DtI=;
        b=qafCgY/c9jY29L9Tm8dYzC9McPUqrn3ozzwDmmNrfHLhgDLwA78v9Tqbh8KCOPDrNN
         QnBptuI8dILN+z0nnog14SrdkrocuD189Vi2DfMeUo4/5t7ky1RqJHQ7BW1e53MoXDjy
         jE1GIfaIlwdqpK5/AI9AewryL/Zpe6kXqlQtbxooKpQgnBR959j+rdZZOQxm0R2hAOKB
         KAAJyBNbgBqMxhbgCEmygTIL+3Kgdyygj4wV/FTi6quF6fRVCJ1bLoOw4bAa1/B1Ewy4
         D2pgDFQPOan0pYfGCOBFBwtL7mOVKxExXTaAam3G6/KcvKDgERW3GOqGP0L/K26QXMQk
         zn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842754; x=1751447554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd7xJvI8U6KJmaOFVsZsTyhneNOAXksVQYXksX57DtI=;
        b=nHP8JNyq+9WLGYxexDOzbIc3fL6S3a4ryRaCmMq2miJ84zr/UrFXVIuE6mNOZW9Ixg
         VByBXbKOLDT7K7d8cWibY6v/4gMIz80BdKdIQhy200GmuHyaODx0gHbuqXJnljO6brxo
         o796/A5lWqsCifOIomfl2ZUNPgdA4HdtYxKVvn5vvY1H4l8wKLMPx+np2jne3CcQT0ZT
         Bk3sMYa0Yx/4SGFPrXGoiVyRSQXAfwQ29meAIHUJd+ZWqFXkzQ93bZn1+GGijL8S9i4S
         yCwislAqcPA7SxQ70/+rDe3ZfiUSbtFx8jyzVM6hRiNDbru4CQs3UUEo9C3icBmx6ejI
         H16A==
X-Forwarded-Encrypted: i=1; AJvYcCUwP9i7v0gtYAEUW5FGql9AB55TJrgwYdYhsN7Njfd/xR2k6o1DTrRwU7TZc1APo3fKK4AE5Cql0e2BcqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylOiiz7CrUfKmaFD0OSm8ijs7QzujJzpoSkDz32Y7IEMfKrfbf
	TJPNNHTDxJ8mWg9Np5felq1nXyOLqUA7hUKX1cCDy3KJpVEOpT5SHJvImF56JX15vdA=
X-Gm-Gg: ASbGncsRUUimyxNpB/3ErY8AO2mmpxdIOBpcygHzOR2Iu/eTf2Gxua/faZe35Q+5NZa
	JE+7atDC+eJMAwC7EwVjZhh0VSbjOHhpHZFQg9asMwloVKObYjNk1GncvH2JTb/rIlySTD77l+C
	5MF5m7LN+TLPgpsG/F5cyDZ9p7zPsu5lJO/rUvA6GUNxLFDXwnMUopuJhjBfCiR3jkNFq5Tvje1
	NSrKsww212UoWXEbHlT61eGh8jiBorrq6fBOjVS/piJKkYLTWRBrWv8jpp2lJoUuriZweF2C3Jf
	Ey3tqe5+LC18KthiXMLyTRSPPuroz+RO79c+kKAAUzq+E6tPPw5IQFfaZDRPMoAfYSqYINQyhBG
	Q+0plhfzT+NcmVW8Q5HZLYOaSgEjJIFTPAP+pgrKo6MY=
X-Google-Smtp-Source: AGHT+IGA9R8BfALsGEL7fi6xj8wmTk1kie1raycb1U6bTuC7aE6zkc7E+3LGBzH7+YPa/k68NGruGQ==
X-Received: by 2002:a17:906:1651:b0:ad9:982f:9206 with SMTP id a640c23a62f3a-ae0bea7ecacmr181892166b.61.1750842753856;
        Wed, 25 Jun 2025 02:12:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:23 +0200
Subject: [PATCH 05/10] dt-bindings: clock: qcom: document the SM7635
 Display Clock Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-5-ca3120e3a80e@fairphone.com>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=5163;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wlfh+1W3Yk1ZGs9hBshsqvaX7PF80+ynWaNZAUcxrOE=;
 b=9EBVJRQeKPjAowlzrVxQug55Udh2Z/5WYoTESXBfumuTis7QBWSPSfSP+Jbh5P/xIQH6OabLx
 oVFAOV3K46BBgX3TOC8oC2OyQjdjtakdAoNjoFH7bbKyFeaucOsJV7s
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 Display Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm7635-dispcc.yaml         | 63 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm7635-dispcc.h     | 61 +++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7635-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7635-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d0427126bfc14b5064d3e08f26169d3408803942
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7635-dispcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7635-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on SM7635
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on SM7635.
+
+  See also: include/dt-bindings/clock/qcom,sm7635-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,sm7635-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Display's AHB clock
+      - description: GPLL0 source from GCC
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Link clock from DP PHY0
+      - description: VCO DIV clock from DP PHY0
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7635-gcc.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    clock-controller@af00000 {
+        compatible = "qcom,sm7635-dispcc";
+        reg = <0x0af00000 0x20000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+                 <&mdss_dsi0_phy 0>,
+                 <&mdss_dsi0_phy 1>,
+                 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm7635-dispcc.h b/include/dt-bindings/clock/qcom,sm7635-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9dc5476eb89e8fb6a67b6413a1aa87c16ba22c0b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7635-dispcc.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM7635_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM7635_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_MDSS_ACCU_CLK					1
+#define DISP_CC_MDSS_AHB1_CLK					2
+#define DISP_CC_MDSS_AHB_CLK					3
+#define DISP_CC_MDSS_AHB_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_CLK					5
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				6
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				7
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				8
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				9
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				10
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				11
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				12
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				13
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			14
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			15
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				16
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			17
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				18
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			19
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		20
+#define DISP_CC_MDSS_ESC0_CLK					21
+#define DISP_CC_MDSS_ESC0_CLK_SRC				22
+#define DISP_CC_MDSS_MDP1_CLK					23
+#define DISP_CC_MDSS_MDP_CLK					24
+#define DISP_CC_MDSS_MDP_CLK_SRC				25
+#define DISP_CC_MDSS_MDP_LUT1_CLK				26
+#define DISP_CC_MDSS_MDP_LUT_CLK				27
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				28
+#define DISP_CC_MDSS_PCLK0_CLK					29
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				30
+#define DISP_CC_MDSS_RSCC_AHB_CLK				31
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				32
+#define DISP_CC_MDSS_VSYNC1_CLK					33
+#define DISP_CC_MDSS_VSYNC_CLK					34
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				35
+#define DISP_CC_SLEEP_CLK					36
+#define DISP_CC_SLEEP_CLK_SRC					37
+#define DISP_CC_XO_CLK						38
+#define DISP_CC_XO_CLK_SRC					39
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+#endif

-- 
2.50.0

