Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85789222581
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714573; cv=none; b=qZSVoL8zKEcMqV9GQIMbbvaeIrM5EUcNUY5j/JZlmVi/+UugE1QTPzjwHtbgSXqI5rQjpwV76YghZsFFjlALQhXl06HpzwZIZK2Wc91fQYdobsfi6rfY89KUK4AmtqNr9EIkVv/RCQTnyfOUOOvheKigpFVxFO2oxexcSC2kMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714573; c=relaxed/simple;
	bh=Ie80HTTPb+7v61cu0NKdu4+VZ8h0CVPuFDYFuq8/l3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4AiNpJAl2hHarIuJDpmxuRuMI6oXAuE0GtF+hFk2ThrZ+d1O2qoXtGsUYTDnuVOQrJj7eSN+tqNw2jAcitbVX8cd0fev/R5iaC1znuu7M/vVwTozKliv/vVHaJv3ZXhdlxEkfNhG4WmY4K+VyHXvJT5GyefyTpj2shCWIj94GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mgz6KTxz; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mgz6KTxz"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-40669fd81b5so409507b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714570; x=1750319370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=;
        b=Mgz6KTxzSWC5cH/BPVYyceX6i2J6/E7wwmffJyT3RVQXFseTv4MgTcqxj4n+6kxgoW
         aZ1yu8pTLoxKRA5tlEQLrAN8VC8+HFLgpU6xOVDSIU70fUAlZYB696erZlmR/Wrcos6t
         lNgHD+eBN+f9wk2cyt+iBuBJxbezVVs3EmIo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714570; x=1750319370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=;
        b=Q4CuYBuRE9LlDmFG6w1BG0rTTJWPyENH1iLgVXktbLZInsvbi0B/vKOmRo1AIpYPdW
         r1hllIXJO/CbsmW0ss5kF5bBV3+evaY/J94ac72zSHaqUedlrUAHH2a6hipvpciQn/Gf
         pl8uGIuNvO8L8qlubWlJ17WpWvfXycRrWefjZTwPhePcjwSUCW7FPCLNwi/KsU1PZgHT
         HtJpp/yRTCERhM9k1KPfvjRbiKcea3im+oe9IVIuntcZkDgHqv93xGosTfMaS9GS4rfu
         a3mA9nvNxTYMNH83vztnZr6xHl3yePEOd8Kg/dfny6cFLvCzP2U8/o1TC3wuxL9yfb2l
         axiw==
X-Forwarded-Encrypted: i=1; AJvYcCVmOpgiagrmjz+5WNbn/nHAEdgrIG8cHlUAzxzpdvWNGcZCo7hqFa//JSagNhzpUa06/f3DygQpVi80Vqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhXYOtlxBXu/mNtVWnlN/4Azq+08LbLoAQNLu63T0wcMKPSVKd
	2SiUY61qug2731ZyRQMAakvvJ1Mj9tbdtfELUhQewDQKZ1YJUBPcooX2qvcP0QjaU2ie+2whYa8
	Yj/c=
X-Gm-Gg: ASbGnctaOLDpn4f42ECLD1xrW87R1AL9H5kumN4I2lA8C+Zx5R72d5IPY4jL/ljHeX2
	ktuyMIi3X7B48I0EVL4Z/ypxrvBH+AM8VpoIDjEjAYbhr7aCN13/Fysh/ggfz6oDRns1jnVNd8T
	HaH19ruvA+JV+Tq+M9n6L01TOBtrFM7Ga+D03zapaQCVXGJkiu5IBGhRcXKYZJ+40+i6noQKr8s
	cmXIJgM0kb39btgyrWl0LbP805DxvCDEg2KGo/ndMyNoyTqHbLzUHNoAFfUSqd60EeoAGdV8tmT
	ZPOJaGkmbejEv/RgNmCxS1dPpfH2+PuwW3wWN4GQU8xzMWcw46TAtz6bawSGpWJsVSv1HJEvEVN
	JOJ4=
X-Google-Smtp-Source: AGHT+IHec1zUXIa5nP38bZlEL08BVN/XVUdoN70CGx527A+qcXzcKljkY/6lP9dS1yxTSifW5ZVikg==
X-Received: by 2002:a17:902:ccc8:b0:234:e7aa:5d9b with SMTP id d9443c01a7336-2364d676a85mr32691565ad.23.1749714557205;
        Thu, 12 Jun 2025 00:49:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Trevor Wu <trevor.wu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/9] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
Date: Thu, 12 Jun 2025 15:48:52 +0800
Message-ID: <20250612074901.4023253-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the MT8173 AFE (audio frontend) binding from text to dt-schema
in YAML. "clocks" is added to the list of required properties to match
"clock-names". And the example was slightly fixed up in style. Otherwise
everything is as before.

A contributer and maintainer for a recently added MediaTek audio binding
was chosen instead of the original submitter.

Cc: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../sound/mediatek,mt8173-afe-pcm.yaml        | 87 +++++++++++++++++++
 .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ----------
 2 files changed, 87 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
new file mode 100644
index 000000000000..a95215ba6361
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for MT8173
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: audio infra sys clock
+      - description: audio top mux
+      - description: audio intbus mux
+      - description: apll1 clock
+      - description: apll2 clock
+      - description: i2s0 mclk mux
+      - description: i2s1 mclk mux
+      - description: i2s2 mclk mux
+      - description: i2s3 mclk mux
+      - description: i2s3 bclk mux
+
+  clock-names:
+    items:
+      - const: infra_sys_audio_clk
+      - const: top_pdn_audio
+      - const: top_pdn_aud_intbus
+      - const: bck0
+      - const: bck1
+      - const: i2s0_m
+      - const: i2s1_m
+      - const: i2s2_m
+      - const: i2s3_m
+      - const: i2s3_b
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mt8173-afe-pcm@11220000 {
+        compatible = "mediatek,mt8173-afe-pcm";
+        reg = <0x11220000 0x1000>;
+        interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        clocks = <&infracfg CLK_INFRA_AUDIO>,
+                 <&topckgen CLK_TOP_AUDIO_SEL>,
+                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+                 <&topckgen CLK_TOP_APLL1_DIV0>,
+                 <&topckgen CLK_TOP_APLL2_DIV0>,
+                 <&topckgen CLK_TOP_I2S0_M_SEL>,
+                 <&topckgen CLK_TOP_I2S1_M_SEL>,
+                 <&topckgen CLK_TOP_I2S2_M_SEL>,
+                 <&topckgen CLK_TOP_I2S3_M_SEL>,
+                 <&topckgen CLK_TOP_I2S3_B_SEL>;
+         clock-names = "infra_sys_audio_clk",
+                       "top_pdn_audio",
+                       "top_pdn_aud_intbus",
+                       "bck0",
+                       "bck1",
+                       "i2s0_m",
+                       "i2s1_m",
+                       "i2s2_m",
+                       "i2s3_m",
+                       "i2s3_b";
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt b/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
deleted file mode 100644
index e302c7f43b95..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Mediatek AFE PCM controller
-
-Required properties:
-- compatible = "mediatek,mt8173-afe-pcm";
-- reg: register location and size
-- interrupts: Should contain AFE interrupt
-- clock-names: should have these clock names:
-		"infra_sys_audio_clk",
-		"top_pdn_audio",
-		"top_pdn_aud_intbus",
-		"bck0",
-		"bck1",
-		"i2s0_m",
-		"i2s1_m",
-		"i2s2_m",
-		"i2s3_m",
-		"i2s3_b";
-
-Example:
-
-	afe: mt8173-afe-pcm@11220000  {
-		compatible = "mediatek,mt8173-afe-pcm";
-		reg = <0 0x11220000 0 0x1000>;
-		interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
-		clocks = <&infracfg INFRA_AUDIO>,
-			<&topckgen TOP_AUDIO_SEL>,
-			<&topckgen TOP_AUD_INTBUS_SEL>,
-			<&topckgen TOP_APLL1_DIV0>,
-			<&topckgen TOP_APLL2_DIV0>,
-			<&topckgen TOP_I2S0_M_CK_SEL>,
-			<&topckgen TOP_I2S1_M_CK_SEL>,
-			<&topckgen TOP_I2S2_M_CK_SEL>,
-			<&topckgen TOP_I2S3_M_CK_SEL>,
-			<&topckgen TOP_I2S3_B_CK_SEL>;
-		clock-names = "infra_sys_audio_clk",
-				"top_pdn_audio",
-				"top_pdn_aud_intbus",
-				"bck0",
-				"bck1",
-				"i2s0_m",
-				"i2s1_m",
-				"i2s2_m",
-				"i2s3_m",
-				"i2s3_b";
-	};
-- 
2.50.0.rc1.591.g9c95f17f64-goog

