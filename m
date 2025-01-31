Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475F41F03FF;
	Fri, 31 Jan 2025 18:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347239; cv=none; b=XSvAKgmKddSs6OSiQ3QIo1ggf19JecL8M3LtpkRYe7FWI6EPRdxsKRkMLQ1t7QiWV4/53mkaa8nXoLfIvnXT2b6L+EDwy/rC4pTd4+B0piLvhVTEXlDYoYiS2xnSTltEFgh1xZ3b9d4Vg+CsPMTwPD9VoTQKFtWQ04SiZThrDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347239; c=relaxed/simple;
	bh=it+n+q4v8xX5ycZK7F7lG+eJksUO7QTkZaWRNpCMKQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkHTYA2e6ZSSnAQeQGXrjYFaI6SUwd09sQj6bXrannytbCJeFfwt4Q65eltWUDFY1l3P3KPEWtelK2UJQBAOR/auX7AEcIAnrebrVvzjQaDX9UZowN7yc3vwFP6mObrAo3QC1jHRn03vTr02vAJ3dX4vxe0HoHZ/PAnTBukBxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwPfAjdx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwPfAjdx"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso4438009a12.0;
        Fri, 31 Jan 2025 10:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347235; x=1738952035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faHjqb9bX1ActelU1HLJ2Bi1CB5Zkv+nbfbnT4awVJ8=;
        b=mwPfAjdxP8E/wvpUBhQNt/BlW54YO6DFzij/yT4blJEnBcVGDUruvHG6jCt25L8Znf
         QZf1ws37utTAdl9j507tIztWVa6pbSHOUPNkMCBrtxETvl6ZfD7qW+3Rk/XCZMnQlUt4
         oHp0gpP4sQYpQqKcYM1cFynqDBVXTvkq7c5cNMn7oDh3hW59DQp/t9QmN3+kRVxGcWMt
         Ne290BzrYtklo82mHJExIoddhYNGSvCka7LqABtqdOzfKDo1Vipk4vvxhhAtQ2aOez1T
         rQAXxNKvq5v3dl5vQzFiectVbmhsHV3+v7rj6NJEcRhCh+uY2vDnX8W+SAfRy2maNwam
         zzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347236; x=1738952036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faHjqb9bX1ActelU1HLJ2Bi1CB5Zkv+nbfbnT4awVJ8=;
        b=vau5J5h8d21sjQOPgmTAUgTfHHJqYm3qTbqzqIbDvbkd4KhiBYFDvD1ARKns3PSFDP
         xRMHei0c/w3CQEpBuqkO2pBMxXMCzF7hQFN7mVMdNXnLfXUkHJiIQBrDe5A3aF3HJYTV
         FGEbEfOuDwhxXiExserQqQgK/EEWFZhbn7KcPJrOdx4vzgWNwTgUyygLtlllFXKs+c/1
         xyZToCZC5k7/4kLsv5LcDHmUFFhTSoCe5dbc4CAG/+NkIqGRqeoSGrGIKib+Sy/3Eqdm
         YmGowgR7+7Mwll+46uxQnk8Aj8SD+V1fDRBlCLGPJcmFqjRaQW7yxC3OoX6SI9Yy6X4H
         yB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvIGWzvBMfAHr1Zr8BV8Kdx/TY7+zO5wJqHKtJEXUK1ZUPQLME5xiiWOzj9ah7YJIewI+Ifkd5+dJWpOm5@vger.kernel.org, AJvYcCWoTgxjlhii+roIjUPUYShGt+GDvYcZu+HA5a4cn09TS/6hiKRw7ihBFTGlmjWTl1O11jAxd6UE2Ci3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6x1+yFs0+rHujKBsldFCodSbU+B6maifDWs0pyxpwEYTtd/cE
	wVEyvpFS8eSlzknh9kCSVDIPUZDu4tkdg65nHlDv7u9MoV+fsPG7TofP+Q==
X-Gm-Gg: ASbGnctIrtmYIEwC1BBmhSU9lIDBKJqvUJJ0RwS+bg4J5jV9xNn9Mr3Bwk9i+rvGP7k
	eq+eqgkn9j6h2wdnE/SjeSupeX59ADAiynmuOoKsLUxx1hTyQf4cqDpw6BczzUrk9N9Kctw3fO+
	HJtL/MIYslTK+VTMz4Yz3jVFvDDMi/yFGGbZtJC2Z3pbTCiVtgX+xovi5GT3DIt+jZ9rGOglqga
	DAickkldb/6yVeKho4ps3eKSHN6TGyi9H9HKeifyuzbKazkalSCcmvqxpo1TfpPFxMaiI1ShdRU
	Xs/NSVJsItKHABNeuMFqp95NP53dUuvdJaxm2+TAAXFwozg5WXhc0d2csynkPg==
X-Google-Smtp-Source: AGHT+IFspwDCIn1E1Qiowgf07pW+ZtusY2lwLx7GBUQapWj2b5B69a3dlAFjE22iArENaT+MvWn16A==
X-Received: by 2002:a05:6402:254a:b0:5d9:a85:1a59 with SMTP id 4fb4d7f45d1cf-5dc5f0331afmr13746615a12.27.1738347235545;
        Fri, 31 Jan 2025 10:13:55 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:55 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:49 +0100
Subject: [PATCH v3 1/7] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=5927;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=it+n+q4v8xX5ycZK7F7lG+eJksUO7QTkZaWRNpCMKQM=;
 b=6mwnvMHDWmjEdJqGc1hOYTBsP3IP/edVdX1DxnIUKaNoazJR9utYdWiZ7hrIANJsgshoIExHi
 QxVSpRc990CCbEGhArmhTLnPz+WQFB1Ik3dIyQyNOHDt+4JUdxhjNs/
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
TXT to YAML format. This patch does not change any functionality;
the bindings remain the same.

The bindings have been split into two parts: the MFD binding and
a separate binding for the regulator node, to simplify the addition
of other models later (which have different regulators).

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Moved regulator node to separate binding
- Removed quotes around compatibles/vbus property
- Style fixes for example
---
 .../devicetree/bindings/mfd/brcm,bcm59056.txt      | 39 ---------------
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 54 ++++++++++++++++++++
 .../bindings/regulator/brcm,bcm59056.yaml          | 58 ++++++++++++++++++++++
 3 files changed, 112 insertions(+), 39 deletions(-)

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
index 0000000000000000000000000000000000000000..3296799eb452fca2a4b03699fcb5aa27005a8e8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM590xx Power Management IC
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
+    description: Container node for regulators.
+    $ref: ../regulator/brcm,bcm59056.yaml
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
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic: bcm59056@8 {
+            compatible = "brcm,bcm59056";
+            reg = <0x08>;
+            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+
+            regulators {
+                rfldo_reg: rfldo {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8939004d5a3f079c05d313bed4a2f07fbc473bac
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59056 Power Management IC regulators
+
+description: |
+  This is a part of device tree bindings for the BCM590XX family of power
+  management ICs.
+
+  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+# The valid regulator node names for BCM59056 are:
+#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
+#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
+#   csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
+#   gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
+#   vbus
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
2.48.1

