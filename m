Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB3B34CF9;
	Thu, 15 May 2025 14:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318599; cv=none; b=LAmzs3Jfc7eU2lp2MZdUSZSUztqGkRxNnhduhGbEs5MztQ07WAT5X+cEM1iJ6xPOy5hB4I/YolsGnrmJrzBwBrggTOVlx10eL9R+Ao/xGw2OwNeIn544TG1ECXZIffCgkVXkMNq6sjbnw2SV2aHXsPyGKoBDwJQBHJ4vunJDk+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318599; c=relaxed/simple;
	bh=GnNWfEJsCM4fk/ThPv4LmkyHVZB29fZrJcJDfdBbv8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tMtMnXL7mC2YtugFtrXvJ9ZkiuNRpJutopJ1SNPiCBiB8PwZuUKSgibyG2mW807RhlprjiXrLBGh1PLz5S4UBwpQWQWG+nhNx1vIqOYG6S2SuMLyWet9fOmdKr5DN5FJr6gyCr1GeGRPpuU/gCNA1wb0oQRveaKtTuZKVY0cCXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C52st9en; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C52st9en"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad4d5bb4d0eso183724666b.1;
        Thu, 15 May 2025 07:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318595; x=1747923395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrXQvrzz4wmn33In08eidQK8XMAndmPCx4B1Koh1dGU=;
        b=C52st9en3OiwkSdifo5xcFD8BB3gwUVvxkXndDKRiiNumIFzYPRBNNuofjM6JesXrH
         CuU3e1fXqL2oVmSmYMAKt4C9YT/Lrj7wuUpnBVW5iFzY3f1WRBqJSbFXRDLcFq0xDlKT
         Un9xsM8Uyk5fq0frqRSk0EJ4cgMbevC24JcoIGyZOpRMcevRDy+e7ZPfMKE/XrSsmziN
         S2RVHiqK9KZWEtGGLy3RGwB+aYMUgghdwlkO8D5dwC5NFraHZ2qmbAXNY6DDBuSCV7Hf
         CLcUKfAvuzee/wle93NDtdI9YuhmVfGBmvrnRw2TsxU6p53OOC+DZpjclzUVFbBq32zD
         uKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318595; x=1747923395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrXQvrzz4wmn33In08eidQK8XMAndmPCx4B1Koh1dGU=;
        b=asagQrNdWieRYYT9Lg7P9W8x0rFVmqOUzA3PTOMbtUPzzIL9WRfVHOVMaJl4PB9hIj
         R3FZ2kx55dtF4TS4R4pZltrQVSCxlAokBpCm132gaQVtdjo6KSCmL2GN5J0U/CCpyL0a
         mUKS0U/76VMV1gTZ0UP1UWFnVwOYoSrJduZi9xPJdupdMccBdVWFFIKI+MSFOn10V5gF
         N+gPxw5Rn9igG/9woNBKsNiJgt7y6VQekdu5ADJHyAl5t2UWvjlKCUy6HG83+NJW9EO0
         oUwU4UZ3Wl9WY9NoERmE5b/tLxSwNw5TgRaa2B/mGOL0xVt8UPQ3tLA7QAtSCou8sd3T
         pqng==
X-Forwarded-Encrypted: i=1; AJvYcCUinhz73m7ADx15aEsb4MP9EESSTpKJVdm6jnq6PXZ2kNMqT9DVEWlrhowTuagckOvn6uBqfLpApgip@vger.kernel.org, AJvYcCWNKqXUPp297YGn45Cyh+wAo6vssMT/APzeyDthc1dHUeO2/UkzUqu9uFROmnITKzYDJG6X6ncUwfWQEyzK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8mXwi0x/2ByWrhwDji9Q6uJeVqeHZZdETriL61hQdWJNjLUTG
	KLjchX+1wn6240ZKj9XNHXau66n1q0xrNeTv14fLdrcqtWhOTAqc
X-Gm-Gg: ASbGncthxR0RrvllPb7j/ggc16MJ/lcnYDwGPu7HhUNbTdVWKZbmanvcMIr+VbZOHuw
	ltWfdhyi6Q5P5TAqBqvW+z74ndELM3RT5uFketDFkIFT8y/Piju/jUtiUGT6kukM/RYlDNzP9VG
	KBFUGcf5ylAgGeVjb0ctzT12V2dERamE0uv49EhzuqFWMclyigTOkR+TaICyIfym5QXt3YeF6+2
	Zi6qzi0V86AeuvOVI0bRZ1S5jHS6ukOsO8i8ZduB6ZR34Bwt1LzGYI55OX3woZp3dFB62kuJGCi
	9Gjvlno7tZWmcUr9zIg54iWbGCev86tZY9zQlb95qrM4LN/R/XSupVoqa05zYRP47wzKNToihEV
	HvXJgB/WRVYMY8QISAPXicev4wiyh5Qb3
X-Google-Smtp-Source: AGHT+IGbmyTHM7gplHRzsl/8w0L/RRE3lEU5OpbaQhIBucqVAwxjQkQCfBm6MLGwXU/E8+zetovORA==
X-Received: by 2002:a17:906:6610:b0:ad5:1bfd:30f0 with SMTP id a640c23a62f3a-ad51bfd3405mr169244366b.18.1747318594963;
        Thu, 15 May 2025 07:16:34 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:34 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:28 +0200
Subject: [PATCH v9 1/8] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-1-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=6273;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=GnNWfEJsCM4fk/ThPv4LmkyHVZB29fZrJcJDfdBbv8c=;
 b=CuJGufesEzghWquaRYUkNGPi5EbqTvTTnxC6//qtkZmdzhLdbTJKHRCE1frU3P85b+fgG8ijv
 NdaSLmIWfnfBqOSH5xee8PWHVqhW5EElltBbu0YvJe6CiVCqjZ4H+OI
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
TXT to YAML format. This patch does not change any functionality;
the bindings remain the same.

The bindings have been split into two parts: the MFD binding and
a separate binding for the regulator node, to simplify the addition
of other models later (which have different regulators).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
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

