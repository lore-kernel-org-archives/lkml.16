Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A1235054
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621278; cv=none; b=EfrHKPUXY6/kpYy5WOY5C3qVYz58NmA/bYT1LGxnnfmEdUsQ3sfGAPC+ckEiHZ6Lgez6kzRpTHx/dS/da1Up5YfuAgb/gXb7W1XQv9akYxBlbmgY9nuFj7tzWPdAfxCCGB55FpedRaXnugoy9NIV6RsgfQszLIdOa+0RXfbFhio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621278; c=relaxed/simple;
	bh=LBdAIMty5GE1KfJHxai0bVaOUZnB93k0HKiQtvmIBDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIhPA9beqIDCBC7RV9v7no5VwR4SDwrGtcXkfCQX2avPFKDKlMVt4eqD+u9QSWFRL77WtKXzIplgCcWx0Sgu9E+ZP5yMZpFpr3iaWMtDAfOCh5T7/86Viye/WAZWTkHdRoN6QU3rMrdU4ifZNnCXQT9dCERrHuZx0UQciIjjDAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UJq1UJk4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UJq1UJk4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so7328385e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621274; x=1749226074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvMdIH4nN1sFDJOlm2BIuEd8Qez9m/rrIfFo0iNwOy8=;
        b=UJq1UJk4GXU0qFbKdJGuOFHwJNwDdR8GICDriX0L54a6W4a+Me30IDfuZfqt+BDaI2
         bBRj+B3Gz4++JRFgURzM1B9VgqJm52jfRMuQVWufhJ8LieURTZglyaaLC2YDiCf/I4Hq
         RA4xjWj+Kj0/z4xtD3X96Z7SblivN/R+vy+jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621274; x=1749226074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvMdIH4nN1sFDJOlm2BIuEd8Qez9m/rrIfFo0iNwOy8=;
        b=BH1Cx/1STine1sIKgSktXiPZ/BmOQpHUEmGBdDC2Y/iqG/VFO23HGZ+kspcji0aqhD
         qHFp8z7yw+qCy8Yvxh07+pbtX2GyVkmpfVYDL6EPV52/6nCKJBnZLKucH6j9VfAHF4cM
         AdaQbZlYrb35Ns/1CI4hCn5szH/IOzK6U8f1xhyTjZHgBssv5qMOgFZdgVQGbW/87cgy
         vXsL/GxIJDcYm9iS39bPpix2ZSdQOGauEF4B8YyaGLYi9EFw6cqe6dl+knItJ11J2oJz
         vbs4bSeFHv98YC08VdWDXMNJ6wUox0yl9CJ2aN2KgQnSweO/ZevJLl3vffoAS8wv9PLC
         VgDw==
X-Gm-Message-State: AOJu0YzwprA53P/k/rGInrVcA7PmOMzwsADPecIE0yPGeyoh4IECiJsO
	PPoaYf4mK6dR5rsWVo71zNfO8SyytmyElm4qlMNIpcPm+aUKpOQaX6HUHazcvqsaUczOneF2wh2
	MDaHT
X-Gm-Gg: ASbGncv8oZmYHhaQc3X161MHmyRbuWCCkL7X6OkbvQXoEi6nFH7UvZpvqmuDJ+6UWRH
	95SSdlcM+2Tj3eihGk46JZ21B24YxJeN8zntro0Yo1AaM+Ne9JTNO8zcR8F8RPYhGvJV4+fv++M
	mxk+mbmxRVYQx+11eRj0zMD8DhQ7oixh9cuUmg9wzoza/qSht6jbu4ukvxoksAJ8O/pkHgUmyZt
	gv0Db8BUQxvSm14Y0jOFNs3tzG2KgIOkkS+PBCehox/0d0uHpwK+EKHxDIZFoCS6oAOV5j5ZSxo
	Xfn09heSBAYcRwp5myigDnQceGbzcf9xZuOAK0I1BZHpoK9CCBCtMdIWO9+nY0THtHyDi20O3oB
	D3yf39LMDMxPzwhnlbgc3YwqlZcBQBpQzKl1xl8quklsAKl01xFY=
X-Google-Smtp-Source: AGHT+IEVAFgFPhAFYVuATFA6DOaPdpMyms7hoynJuR3YzzCeJCI8RlsrsWCeB+RKHnnB9DZQ0OrU0g==
X-Received: by 2002:a05:600c:4649:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-450ce88aa5dmr54520215e9.14.1748621274332;
        Fri, 30 May 2025 09:07:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v5 1/6] dt-bindings: mfd: convert mxs-lradc bindings to json-schema
Date: Fri, 30 May 2025 18:07:32 +0200
Message-ID: <20250530160748.2476088-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
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

Changes in v5:
- Fix description formatting.

Changes in v4:
- Fix typo Low-Resoulution -> Low-Resolution'
- Wrap lines at 80 char.
- Drop '|' from the description
- Describe what each interrupt is for.
- Move touchscreen-wires constraint for imx28 to the top level

Changes in v3:
- Add Reviewed-by tag of Conor Dooley

 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ------
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 134 ++++++++++++++++++
 2 files changed, 134 insertions(+), 45 deletions(-)
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
index 000000000000..782b2f4005a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -0,0 +1,134 @@
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
+    description: >
+      Number of wires used to connect the touchscreen to LRADC.
+
+      If this property is not present, then the touchscreen is disabled.
+
+  fsl,ave-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 32
+    default: 4
+    description:
+      Number of samples per direction to calculate an average value.
+
+  fsl,ave-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2
+    maximum: 2048
+    default: 2
+    description: >
+      Delay between consecutive samples.
+
+      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its default value (2)
+      is 1 ms.
+
+  fsl,settling:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2047
+    default: 10
+    description: >
+      Delay between plate switch to next sample.
+
+      It counts at 2 kHz and its default (10) is 5 ms.
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

