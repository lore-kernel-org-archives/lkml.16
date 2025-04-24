Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C21E3DF4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475754; cv=none; b=jFaAOBX+4pr4ga5zy3KjkoIETgdRcZSRsjUn1RtM29h7g26IGFpwPCkgmz2T6OGo5K8D0TvLaAlHBs6GbF6HcpGK/u2Dd/LgdEN9ZV7UJOTsjpexP8ZLi5VWpHq0xGna9610ADPvnRcKBsjl0CyeOxbXPEc660jHpimp2OQ1HKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475754; c=relaxed/simple;
	bh=34ql/C/fKkOiPnnjJ/7R42kXdOJ4oBZrgE3R/kLi4t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJdkM9edZBfiYgPMY7f43b//9hhZ726k786A/0mS+3OvfZ+0u2ZemDM91LC7DCLcC89IcPrLYcqACxAvPIxTat1LlPTa7D79oUbkt5ch6ASWJ9p9ago9xhzoJsXa6vepefABI7ffu0LnvzzMkOlIMeVKLiGSSM6IjthF+3ydzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=S3od7xZq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="S3od7xZq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf680d351so10610655e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475749; x=1746080549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lFy00OTtg40In8pvAKghkkcDK/j3ZCpiu8RgaE7BUc=;
        b=S3od7xZq5Q0XsLUEYG4rCBlSJjIZaML5PdpyjWEvrKuNRuDAJ8dJO/5j+/PPMcgDym
         eqStKKqaAIA4Gbg7rHLU0Aa38v3GknL81wFWWHPZgKqjKGhRREcPEIOaWfN0V0IUcqOk
         VRAMYd2a81hV6jCFZ47r5Tz9J9BuElfshfnRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475749; x=1746080549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lFy00OTtg40In8pvAKghkkcDK/j3ZCpiu8RgaE7BUc=;
        b=i0UEXU3lT/HzxxVSuWnddbBrjZlNHyLSF2DwEOem8NTQwTXB43FOkuMLiu6WaOu9af
         7MKEUesBU2W2X2J3jvvm0Zo3Gf7a03ncJUJZC1aY2PBtv77X0ooox1MDryXqBfqLRxnK
         ZZEiaELC/+a4OE17M58Z0bEezBuEjzc8D5hx1VI1/c7j7K27J/MgLw5MfpSQ1J8ZmEfr
         pWXpZVdne9igbU0Mj7z9tzMM138+LrNh6lTvAWidO/Clv2doQaEmcc6/lNdaAeH1Z0Xu
         HYw1g/zabID8EvIvoI7XMOQ4/DfY414S0XKWLgfq3LVCEkRbFh7aGZgN/5GsTl/NtFoL
         nEcQ==
X-Gm-Message-State: AOJu0YwRg9rdkKwTReR0EaU3AXAyFazcBa7QBh71QL4KFYNWl/gPgOw2
	lB8zO3KPwQ9ryYsjzUgdEOCFPRA1q+NcOAsovO1IYjiEhVx7UHHUVFEqdVtOGXIUWS480DxOmPY
	5
X-Gm-Gg: ASbGncvgS+rwrVmKcDbyT0fYKgr9yS00lAmwfTdkfaq812jHlrdqozAUI7Ovm5nmNKg
	mOewhvTiLf7XhNChX9H2nW6rFkcDfMx4thq+riRUu3aCyy6rjsjI2nMHulfS/rGzLFFoN5iHkpY
	Rm3hG6nvERymTBCiqmxf3DNI3G1W03uKWPZ5DufCZI1CSHnk2zTEDpBTcm6rQWYkShW2Q60lybe
	gGUBTnTlRIYjbGhgjGyGp8D6KtaIIK6vyjrGd5kyKql1Sr6sIolPsWZXr7LyEy0Q0mJKnQy4hjY
	Iy/3c006aLgWleHsJzsyoR5kIaXSKQ9aa+xuJMOCwanZ+SLaPP43EkL9SXfJnmEJjzcXMApkV8C
	E1doW
X-Google-Smtp-Source: AGHT+IGGlGn1TKiYozz1AjS13SIEPJhaArHik4vJz2EcfG850BwHredNkQnaeix77ID0kQX88QIyKw==
X-Received: by 2002:a05:600c:2045:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-4409c46087amr6406085e9.4.1745475749362;
        Wed, 23 Apr 2025 23:22:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
Date: Thu, 24 Apr 2025 08:21:46 +0200
Message-ID: <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Though adding the PLLs to clocks and clock-names properties will break
the ABI, it is required to accurately describe the hardware. Indeed,
the Clock Control Module (CCM) receives clocks from the PLLs and
oscillators and generates clocks for on-chip peripherals.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v11)

Changes in v11:
- Fix conflict while rebasing on master

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 4fec55832702..e83f08abd44c 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -29,12 +29,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   clock-names:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -93,6 +93,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -102,20 +106,31 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+            - const: audio_pll1
+            - const: audio_pll2
+            - const: dram_pll
+            - const: video_pll
 
 additionalProperties: false
 
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
         #clock-cells = <1>;
         clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
+                 <&clk_ext3>, <&clk_ext4>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
         fsl,operating-mode = "nominal";
     };
 
-- 
2.43.0

