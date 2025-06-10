Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F1262BE;
	Tue, 10 Jun 2025 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571346; cv=none; b=KckhVV3s/8QHzgVaRDiOAldyYP2aAm+A+cPKPDsnY5wqTxqUlxb3LI+bha03UrGg3dbZFmRp5ts2eBk9yl1bQr1lM7SOe8eeUuGqgsjK5/8Ptu2ehlT+uAednH+KaukheoDCy8yPPiqVicRcSHzW5twfa3eFW8KjKMcF1O6H2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571346; c=relaxed/simple;
	bh=YogC5pr2hL+OWqcsJP5ip6Uo84tqBvA1fB7I5weMwGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mUtcKZI+otgoKyqiq0G71Oox+lZhhPq1fZvKc+IGDPCIFiZimpY9m10/7SzSc5svHRbgrNNEJTtgune+JwaRZjOlCZAmhhOj6QQaq2oZ87Nh4EDkum3fxtzFnTD3stiv9v18szX2k9gV5RBOcvVC5Wj92DjXyHReyZlueHSWt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia8Yo7Gf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia8Yo7Gf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d54214adso46503815e9.3;
        Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571343; x=1750176143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=ia8Yo7Gf9NVdd5FySEKakem9q17pPHovsBtRQ/kBivONIpfusxARS36B+4+f1xwUyO
         v+lbKUblE6jtAIP0zA8kfk9WoHylYTgr30Kd4Iom4Lv3sHMaJfrdR1gewCjR4fHhd67c
         5ShSS1VbDPSI7PFJPE1P+QbbE3M23jtY/E94H94W5+a5FLjvr219R2OJkaGWufQgT6hg
         kDEbvEYhCBRYPvExHsN532omLJb30b5h5fZl1EeHAPwRhXhzqN+7Oztw6q4ypyLPCx/o
         XY++7i7sakVgLQPuzr//V0E0dNnsjAdYtB0fKTuTaGmjOOZ+60e16IZGJBLGt9y/xfl1
         Rz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571343; x=1750176143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=h52ThAd0yY/PUxR7AQPmWzG9Y8mEboK3YR5EEjlso96lOE8t3qN2b7IpYNVjYGkuq5
         fFStrx4LUOa/mWAVgRVlw1pwkb7AKFaWVapUeQOKWxYupnuu4uftLKsWGgwOtMMKTZCL
         ajx/olHF2cj4Tsptij2qvdA6o/dR9gdvbWyPt9JJEQ2XYDbDY7SGmE23lrBFhFSvdnZ4
         PRaB3a3lO4uP9XKsEP2aOfIZS3mhyK8UJlvlmTvkwqHoCQUW24fvB6znlo1pua8Res8m
         gLciNZ9N5jAX5Oi64y1WxzUzpY1FEwBDDZvWJC6MbUWJfU6ULxoioxV2WUiMUUkty50r
         AsdA==
X-Forwarded-Encrypted: i=1; AJvYcCWrAV4ZlWbIDCOfQfBDvetwuOW/Yv/LSeNXaV2q7lDGYCG8+6iSfGqm7VguaGf36qH34dbNsfp9IlECp+E3@vger.kernel.org, AJvYcCXBBsGXsfTHq715OgWpGwv1WqTHp5IjfWsAIiXeB/R5D713D5pjhH7azkzShuqohH/2SuglNBjtS+rD@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxq7Z7G+PNPYtAZ6t8wRhjzNIMS02JRonlMpjozAGbaoSsABU
	IaJrmyZplXctxi7HlK3ol7AGvzdSLDI0Jd5+c9LZUGwwTwbjj2zmOp6I1nxS78FP
X-Gm-Gg: ASbGnctcwyw7wCfF6IUbhKBWmlO4iXU4cES8lVZsrfWAXfdsyI31ySn1pspmi7MhP2X
	WyhmiDKlNvnsYchUjWtUrr5QCXfKImamshPESVrAmtYeLGrHyDeFtYpX7qOd7KASVqbR4flLQoG
	aKzxwboLW5oeJJZXxoEls7LwNKLNBrsKR582BqxNMgLA0fQIK8o9I+D1oMdCOidKTqBHvopY6un
	MGmp3kvuao24LfZVSn0G49y+2jLaYc981ba2z0RUjWFxHFcrkZYgYPoXS37yoiZ+jz7PIA95YD1
	lkJce9TiQDqOzG1U5liUHV1dqLwD0SqOEHnWsS/1H3nkEaewRg4fA2LJ1yuRKR7wGMLYzpjIhTv
	jTNWYJXiv6Hs5hppYrQs7kzM=
X-Google-Smtp-Source: AGHT+IGIQmwoh/m9ZyExLKzTeQknfvMb3DhvDjf5fzdmS0IWnKQl4ojPR0BwLRuRbj4bK9JzjZBEpA==
X-Received: by 2002:a05:600c:8b72:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4531de00a15mr33799315e9.13.1749571342603;
        Tue, 10 Jun 2025 09:02:22 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Date: Tue, 10 Jun 2025 12:01:47 -0400
Message-Id: <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..993293ebc4d3
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
+      First cell - consumer ID
+      Second cell - consumer type (master or peripheral)
+      Third cell - configuration value
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
+        ranges = <0x30c00000 0x30c00000 0x400000>;
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <3>;
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
-- 
2.34.1

