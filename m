Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF0C1E1A16;
	Wed, 30 Apr 2025 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996838; cv=none; b=oQxkF1QppBbw0QOaTo0pfOSLF3Uo/cRF88sFXoLDm6wqE5UvwFLUMSTXKt58ZyjWcmrG3MMYKn4Am33d50FNXMkEctxQZi9qcjo7IYDkRVgs95yDCjn8e4WB/cwa9S3FMA78D2eyowP0bTv1+J9SadiwuLWn5AZ9kZig2I49MLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996838; c=relaxed/simple;
	bh=ju68suXj1FdMPTHt/69qtVE6zoVM1v0L/Oo4fVZxJiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gk2zI6zotNNELk4KB3tf8MAiT11myawuYjRRlqQa4A2BiIXkYITZe1iz8b9/syJfyr+vMToEVVgA3KaMNCPmNdd9/G+RecGSyLgZURuqccqWmz5ypZWX68o03tMLCx57dY3nDOOuhzU6jb198ZXUijOypIopV9jIlz7iz6/Y2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b02NfKDd; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b02NfKDd"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso11031531a12.1;
        Wed, 30 Apr 2025 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996835; x=1746601635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+wS3VO76uiWIMKpgH/YayG/py8IuihOzEQEPls+nPs=;
        b=b02NfKDdvvL+NCqMPCfj47EpRCz9OMeKHnF5wGTntm4ml4OshAL9sMg+mhXZeQBgE4
         8pM1kQe9bp9EHHB6DkEupk8M8M9ysipCW8+cE5RkCRclOXdDImmJZsLeRhQVnKZbc55n
         yRJ8HEbdZYAdaujr57NkhQo9OUsLI1NMMQmMZLr2lD2v0/qfDw4sqtW5RPuIfLByWoO1
         d6Vn9XPpbrr5og1belKX3DxXS1pic+5FrguXP9RTGNQHyT54r1RvSx866SRli52fS8Ov
         y+V8fJBUjN/HnTwsEu6KQyo1jm4unzJSuJvK7XNxhcBP6bntFE5kf/NijUK/x5SAi0gz
         OA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996835; x=1746601635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+wS3VO76uiWIMKpgH/YayG/py8IuihOzEQEPls+nPs=;
        b=SLwDph0zoWVJNTdIYtcdAQwa0oYrETTtvqZrKsgHalxycPI63rI9yugTCZDP+phaOb
         Xstx71M87+GbVMtQwAj6Tv3by4mSWjolL69zcn/O3G2QHknzg93J7BH/ABRvdVNUVbId
         r+o1BMcW2OyZdrK2lin1yRRU5BRzD5TmqlSBDomNiwKGue+0Gm/eIX0a2nSXf08/LNZa
         mjfuB+UQ/UQHds8F28Or+0zfz+0bOh7O7/t/gxq9WjdDAXqKD7wD/uLra7rj5bcsDsH0
         zvHuQa550KUD0yO4fCVoE3rkMSTDP3WkdgCTPfOZH9OTo6WhweUygONTuakpp3lA7OKX
         TyXA==
X-Forwarded-Encrypted: i=1; AJvYcCU7OF6msnjlrykNO8urA2q0lQW15kQb2kO8nxlDMBMCyIejKqgJgaZa5Sc8aOHzqUBB1ch1DYznWI7C@vger.kernel.org, AJvYcCX4jHTEucpFfZR5DR4jlPZYJr9AOuLhUiJ5a9EYZjXTPBT22gcIMxxVZp/Bu3fX8Ctvsgswh7MxL3tPPLcp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79BOcEr/0TFasEf3gda6W36pDRK8+7NFhNcoXEFW26QCYgN8n
	xQaUjMXrbBIevv8krnsMMy1yqdZnluzjgRa6zjpzlqMT6JRvH4299T9xGw==
X-Gm-Gg: ASbGncuM/T6X+Nbf0jbqeD9++vuhWcm1kJMMsC0wYqWP5WA6+a3WhhubZtAr61LTLTd
	RV5GUBAinteHtz6zgxqzVRfunmKmzsXTzefMHEOziBYbY6js3u+2sxR/oIgUFW9cN/QIZfGR44b
	QfBOBdlGFHe5Xp56H1EEcgrDc8AC4UBsoDHiGkBuwCtGbSuwBAopFvSMU+9YWrlv014vleR7Rtb
	EL1+f4X7wE66iQ5dB0Q1KfdHOtxJkds+APtKxDsKWp696eMFNf1npLy6KTXt+8zsIV5BzJrFKDC
	GO49imracm7XXmt/uFwrhBoQung75szCfCXDiz48nEwSW39hq+HIrhYMs9dTHzAWFpskwseXuIV
	G1hdjnSeFQN0=
X-Google-Smtp-Source: AGHT+IF8YcdVIQsW+av/zWPED4/GHseUdFL2jDaJFueKLvx4eO70MR2lAPoD1hagrMkiNDrWXsCT1g==
X-Received: by 2002:a05:6402:1ed1:b0:5f7:2ac6:c280 with SMTP id 4fb4d7f45d1cf-5f89bf16568mr1538686a12.25.1745996835194;
        Wed, 30 Apr 2025 00:07:15 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:14 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:05 +0200
Subject: [PATCH v8 1/9] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-1-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=6215;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=ju68suXj1FdMPTHt/69qtVE6zoVM1v0L/Oo4fVZxJiY=;
 b=sEbrd2fyF3UCVeEPTC6UFVUrpDMVxzLCz1y+D4iZMYb+dYiNCqah1008aGiiefT6H9jkjbRM2
 FxqL/0feelDATxscPAhgncK14jjYc5mLyd1cZZq1JBzO6XNVlXQ9qjA
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
TXT to YAML format. This patch does not change any functionality;
the bindings remain the same.

The bindings have been split into two parts: the MFD binding and
a separate binding for the regulator node, to simplify the addition
of other models later (which have different regulators).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Replace mfd/brcm,bcm590xx.yaml with mfd/brcm,bcm59056.yaml

Changes in v5:
- Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
  regulator binding description

Changes in v4:
- Made $ref use full schema path
- Cleaned up example
- Dropped regulator name list comment
- Changed description of regulator binding to mention BCM59056
  explicitly
- Changed "Power Management IC" to "Power Management Unit" to match
  official Broadcom naming
- Renamed mfd/brcm,bcm59056.yaml to mfd/brcm,bcm590xx.yaml

Changes in v3:
- Moved regulator node to separate binding
- Removed quotes around compatibles/vbus property
- Style fixes for example
---
 .../devicetree/bindings/mfd/brcm,bcm59056.txt      | 39 ----------------
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 54 ++++++++++++++++++++++
 .../bindings/regulator/brcm,bcm59056.yaml          | 51 ++++++++++++++++++++
 3 files changed, 105 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
deleted file mode 100644
index be51a15e05f926913b3a473648d977b25f1a2fbc..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
+++ /dev/null
@@ -1,39 +0,0 @@
--------------------------------
-BCM590xx Power Management Units
--------------------------------
-
-Required properties:
-- compatible: "brcm,bcm59056"
-- reg: I2C slave address
-- interrupts: interrupt for the PMU. Generic interrupt client node bindings
-  are described in interrupt-controller/interrupts.txt
-
-------------------
-Voltage Regulators
-------------------
-
-Optional child nodes:
-- regulators: container node for regulators following the generic
-  regulator binding in regulator/regulator.txt
-
-  The valid regulator node names for BCM59056 are:
-  	rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
-	mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
-	csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
-	gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
-	vbus
-
-Example:
-	pmu: bcm59056@8 {
-		compatible = "brcm,bcm59056";
-		reg = <0x08>;
-		interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-		regulators {
-			rfldo_reg: rfldo {
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			...
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b387ef9885c3ac524e0782545dbca9c0e81a556c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM590xx Power Management Units
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm59056
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    $ref: /schemas/regulator/brcm,bcm59056.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@8 {
+            compatible = "brcm,bcm59056";
+            reg = <0x08>;
+            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+
+            regulators {
+                rfldo {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7a5e36394d216232e0a2070fb20d09dcc1ea8056
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59056 Power Management Unit regulators
+
+description: |
+  This is a part of device tree bindings for the BCM59056 power
+  management unit.
+
+  See Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+patternProperties:
+  "^(cam|sim|mmc)ldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(rf|sd|sdx|aud|mic|usb|vib)ldo$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(c|m|v)sr$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(io|sd)sr[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^gpldo[1-6]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+properties:
+  vbus:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false

-- 
2.49.0

