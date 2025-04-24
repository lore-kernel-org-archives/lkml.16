Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF6C226D17
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490325; cv=none; b=TGsWQwY6Eg019DRxCFMFSGuogJSEGnSyvLFI/PbEVvTfrFCJy96O4IWpwHuKLQlvzmvwAX6smwW+Cl8GDtlRUmQo4n52KOqzvjVM18TdNDE/KgUD0UyJS1BLLj2Q6nn4q/0yQ3eE/j2/yV20JXZqjFNjUWo00EAlM/WWW5NXl8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490325; c=relaxed/simple;
	bh=XpxdjpHxHeSh/EXxPCLM7FkwIsKFnrwqno5QtZAGXOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzbJOV9bggVjRGNI42LEqYg03CHJgT1L35/HBY64uT7As8Rm2UBIJ9lQ3e9OY4mRvSkmhUwtJKY8q90uDYpJtTCLqQc3TyRHovt7uxwXOw8DvQHn0VaDcRMKpaEGooPCc08MIOAI6V+NTPyaT+akoH+Uak0KSaVVaLNSMGfrYgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eOeBu2f2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eOeBu2f2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22401f4d35aso9423545ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490323; x=1746095123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=;
        b=eOeBu2f2YmRHbdMniu+H+6IvgUObkcZ2+oXEIm8N6HZC53a0JDn5weoGMtb7WwODhh
         7XbHylZNQOR+oGl0uKwU3IW/DIVns7AmMuTAJ+Tt3opD+ipaVcjEiFTMebily8424A1h
         GHjBSQ/eZmtYRRSFWjVaCYXjLtItn4Y7PH4kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490323; x=1746095123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=;
        b=Y32j3K4NGqsdBpXA6wenjUySVScVh8uwuZ6dggd8A7t6ASfcCX51kKbXxFofdRsZFM
         CeE72N7UDkgHKwv64fEAkH/8uHamLr1Mx+8bWWBGuZ9DNJnJ6dAghXEa0iXVOP0nwDap
         IYLSEX1NJ7PeaK9NgPnWtelnNcBQrQhQ6Zq4+2H9s3ZJFL9W3EXgFx7WAn5ylahdxN8e
         nQYvIGoBFA1ytUK20PbLnF/oxuHAAqUGt/b1sLpnZ5riuOz+L0wNI8M60wVVN4RTF9OE
         WID0C7HbOjI9jPo8MDnfoQs4J8CagZ9RVKMzKdX/5XyBlrTTHOapWV81bd0gvVFSUMJe
         1rcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEP0aAvWPgrZ13fbymXtZ48UZYypaCNdnsj1lFSpI7MnZWeKj8xbc80NZrspZSRlJ/CoHR4OWZyI3nfhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVooqfaPChir0yLhEL79hJpB4cDC8cQQ5bNhjszEGscq68lgKz
	RtDeNhHu20UxpACEyPUR+b2pnFTTYF0asQ8XST5B+MrI6fo2z6Mqem6pK04L+Q==
X-Gm-Gg: ASbGncsq7Zp680K4JNxe0iAZ1jLxQKm0V7i1aOor7v+c39Z8y01hHkm5fn3j9o0N79H
	lY6b/EHcSaQMSPTeDX6rLe6le0BuylHwxFOQhfOV/7NhjZqhmQSB+BuPcoJL5pBEcLCIov/3esU
	0sxlhx9uMknKWk9JBkYUzHlRxCOeMOUSTHFQTkgTSZQinSwCOELkQuMS8CUC9E80lMoa4u90Wdg
	/22+QnNiRabVPyvACSTlF1v5L4YTuHGneRgzV5z4uGBCvBGpxpVDbZfPS+/95bFQqBBNHugLf6j
	vGz0FLyid43grOFjN3bSc2jHKoLcleC0gU1/DTUSn5KdudC9J9FYMJVK0g==
X-Google-Smtp-Source: AGHT+IHzoPXeAj/1Vo9RnY5qRxxsQ+IrUuZpo38gzMRReAUYEIPY7nVtqmt5PXAnUiSLOPEIxc+1ww==
X-Received: by 2002:a17:903:32c9:b0:224:216e:332f with SMTP id d9443c01a7336-22db3db1596mr29371075ad.48.1745490323281;
        Thu, 24 Apr 2025 03:25:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 01/13] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
Date: Thu, 24 Apr 2025 18:24:55 +0800
Message-ID: <20250424102509.1083185-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
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
2.49.0.805.g082f7c87e0-goog

