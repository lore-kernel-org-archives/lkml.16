Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72520CCF3;
	Tue,  1 Apr 2025 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522353; cv=none; b=UlNtg+js1t4DpjlDpCH4Aj7PNjGm9oGpri3ULyRwfAY5qJ+i3NbAhyxQRo7Jqfyc+Fb9BTG2wAqVFZ0MpwHSfzAMGFLC6z1L1nxQqznOlmy/ifnLai04iDUIP9D7EmvA8AGJfrQiGswWSpisk05LnASlBzzk29hBbdc06PBbu0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522353; c=relaxed/simple;
	bh=sxAP2V1oxgbBtdX05NGWLgCSKwvmd1Ozf5XrNSoMX0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GYgV5gIZWr+nhSOQFag6ro5pPlBNdTWu/gr0w7sSUrRKlYL7wbEmaHI1qbIVBZV8h/lUxcwd1osWvF5akzU6yVcgnDQr+DTotfftVlV2GrDemqvdLupGlOve1HPhlLXltvoHZaqUhWsGUU6HqEczauaH8MXuVMKh3en1IRZqOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGS9+Ycy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGS9+Ycy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3995ff6b066so3278259f8f.3;
        Tue, 01 Apr 2025 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522349; x=1744127149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB1PP1x3fa02Q8papa7Q4qbO9lj9DsfbybLuQtv7HIQ=;
        b=TGS9+YcybxixFWIlyKJu5OQQ3zOSaugEGQJi7He68FWU5g2op43NdIt+B4wd+PW+l6
         fOT86Up3XW7vIKLCZ+wsvcZ1d6j4wAnt63lS2K2K6spbIZ/RGmdRppbH9GqCLCMChkUh
         /FZjQOn1tA1I5RVL2xEal1N0Y2s4ch1Gb9LDzGmgH0vbNBmlmrdmLRN9jR9D72+3FiRB
         pXSHKPghTWYJsipLoEc1yLF69tl6XalWw9CfxtfjRA3Yih/7RDLOiHRmDC8te7bZS1Z4
         6h14kBqZgNjR5QCxupSB4V4lwNVdxZ9S+PDzbdesrfOXQlhneinjYqRHRrBGfG0NpAua
         PPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522349; x=1744127149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB1PP1x3fa02Q8papa7Q4qbO9lj9DsfbybLuQtv7HIQ=;
        b=NcIquGax8o+tzXtuT7c7KqOYAZ9FNLnA6kyWU3Roos5FqmzHlmEFOAtRo2bje/qZuy
         6QvAH/6qFl5fM4X9DnbIa7SKHU5l/waH0pvrlssxteThlb1SRSgPGTpJOAQeWJAsRG1p
         dZxUX034FQM+xkelIbE6yLSPkPr3zrPboOGWSAz8TCDav0QZG8NGwaEUCjoWhmyTUJk+
         LUVJFCoiaWsGXHpcfRBY8mSMD318RT9BIgVxepPjFZaX3s2Ou3JWM508+e9/pojLzQt6
         Fo61Vfx1hJZlBEX4wYOP+FXxUgEUHB5L7fVQT/NmK8cdoTtLdrXsKkBPImRw2NhHhUHb
         xN6g==
X-Forwarded-Encrypted: i=1; AJvYcCUSwQTUtuKmbvuXCU7Sifia0F+DPf0GUDQ2R+zrxBBSThI+ccbHrvebGdzFvGGU7417RclSl/Hitalo@vger.kernel.org, AJvYcCVVBGRwujnXSw+r6Yd4E79jlYXwdX1nbh51MQw8fMlYkWCBiwhLaZk0M/dDzJ5sH0I5rTkQv7B8SstIJOsO@vger.kernel.org
X-Gm-Message-State: AOJu0Yypy+9b9VVoKsccuVVxmaFzhpEhHbvYOpz9Hu2sXbGKB49C4+Ja
	p4gvFfWoLUGw0EuBjGcmUNjfxlRuq2fqoGv4J/lOr5r9dVCxWRf8
X-Gm-Gg: ASbGnct9BnSyl9s9LLd2pE4RpeCc5EZ4MzZTEaU+aAC8YTh02s8znTJdfS6Q5oJmaGs
	O5++Rd1RbK69z621t4+5U6FMs6g1mi8kDMJxAp604bib1zdlyuW48CSFUEzzXxvflg21gUaZXzO
	50VQlhw7OKNchBNDiYeg2+JmZz1FPL+WSn5fky4OxrMtdsbI7JSb4HNxyHYIZB0FRiDhUxdgKC/
	2P1o2fCHCA//R1MsZ6pkvi61HZbCM3EzM6240SoIgOFZxINZdtr3G0OTiy/QGg9rthqd7mAvi2v
	jlyAWUWpowbYkYyI5b7JbH2MoaW45B14qZeMJaVTSwpm9SEJuDyiCaDv75nCu9EQvmLnbIeYKB2
	kUWUcHsw=
X-Google-Smtp-Source: AGHT+IEwP1LRFyekKJgsxs9B8k784Op1Fz73VSFZYv3B3/zly1RjzrL3LrijYBHY+f5sPUhyA6ADAg==
X-Received: by 2002:a05:6000:420d:b0:391:2ab1:d4b8 with SMTP id ffacd0b85a97d-39c120c7d4cmr10416753f8f.1.1743522349145;
        Tue, 01 Apr 2025 08:45:49 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:48 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
Date: Tue,  1 Apr 2025 11:43:59 -0400
Message-Id: <20250401154404.45932-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for IMX AIPSTZ bridge.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 include/dt-bindings/bus/imx-aipstz.h          |  25 +++++
 2 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 include/dt-bindings/bus/imx-aipstz.h

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..13b7fb39d6ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
+  transactions to IP Slave peripherals. Additionally, this module offers access
+  control configurations meant to restrict which peripherals a master can
+  access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#access-controller-cells":
+    const: 3
+    description:
+      The first cell consists of the consumer type (master or peripheral).
+      The second cell consists of the consumer ID.
+      The third cell consists of the configuration value.
+
+  ranges: true
+
+# borrowed from simple-bus.yaml, no additional requirements for children
+patternProperties:
+  "@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        items:
+          minItems: 2
+          maxItems: 4
+        minItems: 1
+        maxItems: 1024
+      ranges:
+        oneOf:
+          - items:
+              minItems: 3
+              maxItems: 7
+            minItems: 1
+            maxItems: 1024
+          - $ref: /schemas/types.yaml#/definitions/flag
+    anyOf:
+      - required:
+          - reg
+      - required:
+          - ranges
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus@30df0000 {
+        compatible = "fsl,imx8mp-aipstz";
+        reg = <0x30df0000 0x10000>;
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <3>;
+        ranges = <0x30c00000 0x30c00000 0x400000>;
+
+        dma-controller@30e00000 {
+            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+            reg = <0x30e00000 0x10000>;
+            #dma-cells = <3>;
+            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
+            clock-names = "ipg", "ahb";
+            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+        };
+    };
diff --git a/include/dt-bindings/bus/imx-aipstz.h b/include/dt-bindings/bus/imx-aipstz.h
new file mode 100644
index 000000000000..b81b4654e00f
--- /dev/null
+++ b/include/dt-bindings/bus/imx-aipstz.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef _DT_BINDINGS_BUS_IMX_AIPSTZ_H
+#define _DT_BINDINGS_BUS_IMX_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX_AIPSTZ_MASTER 0x0
+#define IMX_AIPSTZ_PERIPH 0x1
+
+/* master configuration options */
+#define IMX_AIPSTZ_MPL 0x1
+#define IMX_AIPSTZ_MTW 0x2
+#define IMX_AIPSTZ_MTR 0x4
+#define IMX_AIPSTZ_MBW 0x8
+
+/* peripheral configuration options */
+#define IMX_AIPSTZ_TP 0x1
+#define IMX_AIPSTZ_WP 0x2
+#define IMX_AIPSTZ_SP 0x4
+#define IMX_AIPSTZ_BW 0x8
+
+#endif /* _DT_BINDINGS_BUS_IMX_AIPSTZ_H */
-- 
2.34.1

