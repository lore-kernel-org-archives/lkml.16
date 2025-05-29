Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284E2DCBE3
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748507532; cv=none; b=SiQriNdRcUir1GpLcggnGS5O+ymsRkWJ6GbP23ahYJpcoa8nI5RPkGzaEjZ4Gi/DsZzzR6TL+EPyTRazEhcjAMAamU03CShLbGuTb3iTWmjk+3AZQwv5VY1U1P0BD1TFaoZ8Eq7+d2TIxQi4Hm5r7qLCRakBLN5HRl7Gu6n/fP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748507532; c=relaxed/simple;
	bh=f084aTER3zHgfTsmBJ1mtbVk1AdH8uHDzcnZ8a680XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBTOn7mVNL5G9r7/pc+CsJFlYw3a5wGE3zZBIwiGnanoiYPoIQrd6sUIhayRdLR1FNY9EEpyxInnTJq/k97BUoNzj4gZal2tr5XQYSAZwfQAbE5fp2I/vvgBH7o0Rj3AvGq2Q87/B2pVpcBF8k02IF/oKQSUbjtnVvk1Rp6SKcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fpOG+6yl; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fpOG+6yl"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604bde84d0fso911086a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748507528; x=1749112328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYTRpYaRCYAMKu8brCxqCw4EqlzslbYDhjqGeb1oUdY=;
        b=fpOG+6yl72psCyyZbTwGM/a+25Z6eMe7sQ0bQZK1lodLrRQ9LVFy9HBEvd5zQJ0Uua
         HOQbZjkQlBabs6T0BVvVjYK+YSURb/iuR/rBaKRadijgZCO19wv2uPh0jLsahsf01XUg
         UNY6apHvOzmX8HIaWI2/q1U/+VFYtTud7VnxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748507528; x=1749112328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYTRpYaRCYAMKu8brCxqCw4EqlzslbYDhjqGeb1oUdY=;
        b=sjdWD8MfZGZ7O9J7HkgyH6syhnvWfibb4cii6Q2PpHH7agyaJbgWCmDMjwZ3x4QhqK
         pktYPnad0Tokpf9NT7KJp0BOusYxmhUVDWrZgwPHPIkDYSDgOgvcqd/tzKKpano77D0H
         t85BdR4OulfCRLYyEwMvQmO/a1WPyOEF+nP5Z97mAJLyjkKbQYCnlLoQkie8weHO2hpw
         UTIgOqMgrUbt5x4rASswIYBq21elcsud7+SuZvS6pEDJZByH8nPNd2ar0pzK1hVh3IOy
         p3h0lq+xUC6hpLbjjJYNuGF8qRDlvkcKYtOAa5bsHxw8/purpwelpW/uT7NY2AqE8f49
         sq4g==
X-Gm-Message-State: AOJu0YwiaJwtY1276XOVZPEreBrwcPLARJkgM3aN+YiI9FCdVUbYbCjH
	QJUFuDge6hXVWH4x23bsHsDnhZvPvGGRqEhh0FMik6XcUkw1e4Dsz5dt3v+oehGGhRhd1/I1SWb
	bEt3F
X-Gm-Gg: ASbGncs2giHCos2F50cDilZPk12O/i4TuJrE2fCjkpINrFsZ8e0gfK4i1J9KEmxu3jx
	gp6iADqHry/2/JkxhnVmBSJLFMkOwoy3AuGfV6kWiGPTAZq3GclaRmfxAitu+rkvnh44BKH0QaR
	iH5dexWtceaX0tQhHGgQw6qBldqppHxIU9Tl/kN8uabqM3uCldfalLoeQaHtS5BZdcEyxMNsIFf
	18MqC5t88BEflJsYESgPR4ypN01whTi8lhNrzBaVH8RVNk28v5T/3yEv3lkc54WS4HYaxBYdeX6
	hEk7HXfYcPcD/JjPbmX/C/IkdfM2W1+Lik45paPOt/ZLyuHXj5GAEaUKuRFLtpxVN7vcPOyv6oE
	G3LAoPd9eebl0V6Q+
X-Google-Smtp-Source: AGHT+IHSQOo26dfHDBKRtfz50/poxTpCV6dmeK2Q5MmBatZ2dUHIMTk+BV2pDTU4LahdN6kqQiBNdg==
X-Received: by 2002:a17:907:1c93:b0:ad2:4c38:5a22 with SMTP id a640c23a62f3a-adadf2a13ecmr120329666b.51.1748507527995;
        Thu, 29 May 2025 01:32:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e87esm100609866b.63.2025.05.29.01.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 01:32:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v3 1/4] dt-bindings: mfd: convert mxs-lradc bindings to json-schema
Date: Thu, 29 May 2025 10:31:04 +0200
Message-ID: <20250529083201.2286915-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
References: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Add Reviewed-by tag of Conor Dooley

 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 --------
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 106 ++++++++++++++++++
 2 files changed, 106 insertions(+), 45 deletions(-)
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
index 000000000000..90391b02c715
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mxs-lradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Low-Resoulution ADC (LRADC)
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+description: |
+  The LRADC provides 16 physical channels of 12-bit resolution
+  for analog-to-digital conversion and includes an integrated
+  4-wire/5-wire touchscreen controller.
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
+    description: |
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
+    description: |
+      Delay between consecutive samples.
+      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its
+      default value (i. e. 2) is 1 ms.
+
+  fsl,settling:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2047
+    default: 10
+    description: |
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
+    fsl,lradc-touchscreen-wires:
+      const: 4
+else:
+  properties:
+    fsl,lradc-touchscreen-wires:
+      enum: [4, 5]
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

