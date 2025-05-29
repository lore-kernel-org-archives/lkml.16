Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF57521ABBB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529357; cv=none; b=DIki0J/1r+yOIfYmIlWtf64R8LEBCke6x4aVppw2Qsi96uDkrBTQBiCoZcC/sMoQU2NY//CVQ48uO0y20IdyurBUhSKkJH+7qZIUosssRlnw3suZVdA5GAyeHj1SxxwBWw5Vs7J6r/+HMB8CONuxIl6EnySpVAhuHXcyOO7WJHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529357; c=relaxed/simple;
	bh=lWI4T2RiBW23UkmALNgK+owDgixAhqm2J1H+wTwycSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3hS+ApuVUrlVfdkNMmGQXiYvPd7pm6xS2WGftVuwGXZCp9W37NwDw0H7kpurBFxXHjPwlLKZ8vZhNG3d3O4rLlK0d/mhDlcd3aYQ7nCN0s7purYOelMpj3GoK5sttV+uaZ4tH65vM6GfUi4DJP9mBWGs26lyJyIvfOAV+z3hr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=klJHJ72h; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="klJHJ72h"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6046ecc3e43so1512092a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529354; x=1749134154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZBCgnAET/7svvvAxCFqw/qkQj58y6b6iHWz5ZaJvGE=;
        b=klJHJ72hsm/F4MeAx/IO8I8WIQ5nvR/jpOmBBnLpocrS3jm8AxLNFECsc3B2tezGF6
         QY9urgc2pFS8d/EkwuL6H2aohTouev/nhAD7jUDJ5KR425fxjbDIeIbo7SsWyhxxORmH
         DQ1wT8fi0HMb/iFrwAMVix593Am1loss7H6rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529354; x=1749134154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZBCgnAET/7svvvAxCFqw/qkQj58y6b6iHWz5ZaJvGE=;
        b=JgK3UOUixYiql1q/4lgZ3Ggn9zdZWqNy8pUr7Knj9kQE2F8TLO9ytI6/hVaiPPzMMC
         cXOuhBJd+p2l5jOjvy+4XSa94+q9kNZXkfUfNBwP3FSv6WS1Jl3YxaqTCxb78Epf7cm4
         oi9F8x6YelhWaIPkEAaxhXrcSDvVhRgvHbs96DO1x0SPxGaYi6Vzph4q5vJpi3VUsodp
         LJudBfpgn52URS1yl32YmWql4ewLLoZAgqpjzkZ4SKaBUNxcz4IURBfFDlSwbW3o6zTS
         VrpO6zUyaqdJ7g+LLNNT1M47A0oPHa6LiHHgVN4ULeqCoBrqH7UprQf7sQ1h1OVreYv5
         kk/g==
X-Gm-Message-State: AOJu0Yz5H1Ej/FN+B40soHwIpqOrWC7s5Cc6qSyyHFSEu/SWUhAEAid7
	cwG5xceidhe+wMEvyjmrX0YEdO00OHV/V8Xx0U01apEDCMd+OaF+9Xg4voySod+opXy2/6M8Ei8
	JJflH
X-Gm-Gg: ASbGncuYoOYoA01sN8dKCTbu/DQYj7XSnob8NiNLeqx1yurdjLBgdeYngUmXS4KeoI8
	aZv7SlbXW0XMEuU4VbaK99VKHCzGjrrjyhSqyLRMcqBWbNTbus2+g6MhU/pcCUq0k4SegnBeUEp
	AYQ+hKI5oZA2DjalUz0s1LqC/uUaMYebPdiNOE0R9vM1mFtNAAPjy7Gd4ACsRpnO6hT2mOnqhDp
	5NWy0T3wfCpeS1zSoAjXYX4GEEf8yg7Xr6uoOmHhUP23O0XiLusPl0cmiZTW2TU+0BNTcgGrD9C
	DIh3sl6FBYcdEYx4S7lFAmJPcEMgftAIwy/VDe4NlX/61vi9XE0fYJG+xX1uI/NYnSs7pokP/IV
	yDScQOdfQe5pfm61Z
X-Google-Smtp-Source: AGHT+IHa52b+vSbAsyz/N9mzyCKngvFXo9cXYY8r05kAw/BK0bB/NY6TNVZhWWYTAv9SIpftClPn9A==
X-Received: by 2002:a17:906:b810:b0:adb:2f9c:34bb with SMTP id a640c23a62f3a-adb2f9c7504mr24458666b.49.1748529353961;
        Thu, 29 May 2025 07:35:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/6] dt-bindings: mfd: convert mxs-lradc bindings to json-schema
Date: Thu, 29 May 2025 16:35:08 +0200
Message-ID: <20250529143544.2381031-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
binding documentation to json-schema.

The clocks and #io-channel-cells properties have also been added; They
are present in the respective SoC DTSI files but were missing from the
old mxs-lradc.txt file.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v4:
- Fix typo Low-Resoulution -> Low-Resolution'
- Wrap lines at 80 char.
- Drop '|' from the description
- Describe what each interrupt is for.
- Move touchscreen-wires constraint for imx28 to the top level

Changes in v3:
- Add Reviewed-by tag of Conor Dooley

 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ------
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 131 ++++++++++++++++++
 2 files changed, 131 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
deleted file mode 100644
index 755cbef0647d..000000000000
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Freescale MXS LRADC device driver
-
-Required properties:
-- compatible: Should be "fsl,imx23-lradc" for i.MX23 SoC and "fsl,imx28-lradc"
-              for i.MX28 SoC
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the LRADC interrupts
-
-Optional properties:
-- fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
-                               to LRADC. Valid value is either 4 or 5. If this
-                               property is not present, then the touchscreen is
-                               disabled. 5 wires is valid for i.MX28 SoC only.
-- fsl,ave-ctrl: number of samples per direction to calculate an average value.
-                Allowed value is 1 ... 32, default is 4
-- fsl,ave-delay: delay between consecutive samples. Allowed value is
-                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
-                 2 kHz and its default is 2 (= 1 ms)
-- fsl,settling: delay between plate switch to next sample. Allowed value is
-                1 ... 2047. It counts at 2 kHz and its default is
-                10 (= 5 ms)
-
-Example for i.MX23 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx23-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <36 37 38 39 40 41 42 43 44>;
-		fsl,lradc-touchscreen-wires = <4>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
-
-Example for i.MX28 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx28-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
-		fsl,lradc-touchscreen-wires = <5>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
new file mode 100644
index 000000000000..f90fdfbb74a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mxs-lradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Low-Resolution ADC (LRADC)
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+description:
+  The LRADC provides 16 physical channels of 12-bit resolution for
+  analog-to-digital conversion and includes an integrated 4-wire/5-wire
+  touchscreen controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx23-lradc
+          - fsl,imx28-lradc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  interrupts:
+    minItems: 9
+    maxItems: 13
+
+  fsl,lradc-touchscreen-wires:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [4, 5]
+    description:
+      Number of wires used to connect the touchscreen to LRADC.
+      If this property is not present, then the touchscreen is disabled.
+
+  fsl,ave-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 32
+    default: 4
+    description: |
+      Number of samples per direction to calculate an average value.
+
+  fsl,ave-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2
+    maximum: 2048
+    default: 2
+    description:
+      Delay between consecutive samples.
+      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its
+      default value (i. e. 2) is 1 ms.
+
+  fsl,settling:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2047
+    default: 10
+    description:
+      Delay between plate switch to next sample.
+      It counts at 2 kHz and its default (i. e. 10) is 5 ms.
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx23-lradc
+then:
+  properties:
+    interrupts:
+      items:
+        - description: channel 0
+        - description: channel 1
+        - description: channel 2
+        - description: channel 3
+        - description: channel 4
+        - description: channel 5
+        - description: touchscreen
+        - description: channel 6
+        - description: channel 7
+    fsl,lradc-touchscreen-wires:
+      const: 4
+else:
+  properties:
+    interrupts:
+      items:
+        - description: threshold 0
+        - description: threshold 1
+        - description: channel 0
+        - description: channel 1
+        - description: channel 2
+        - description: channel 3
+        - description: channel 4
+        - description: channel 5
+        - description: button 0
+        - description: button 1
+        - description: touchscreen
+        - description: channel 6
+        - description: channel 7
+
+additionalProperties: false
+
+examples:
+  - |
+    lradc@80050000 {
+        compatible = "fsl,imx23-lradc";
+        reg = <0x80050000 0x2000>;
+        interrupts = <36>, <37>, <38>, <39>, <40>,
+                     <41>, <42>, <43>, <44>;
+        clocks = <&clks 26>;
+        #io-channel-cells = <1>;
+        fsl,lradc-touchscreen-wires = <4>;
+        fsl,ave-ctrl = <4>;
+        fsl,ave-delay = <2>;
+        fsl,settling = <10>;
+    };
-- 
2.43.0

