Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32425742C;
	Tue, 24 Jun 2025 07:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750559; cv=none; b=jJ+gmvre58+dsTlSM+BqUpBsPRh4KoPA7tz+kvxkpbtFy7Yfjsj8RlCJjGBpo38mBZ8T2f6rHM2zxjc23NdDMMsowrbpeshYUHRE4OGh3Qhd0I2xZEk4qpc3j8gnuyOuH9wyrR8RL8Pr9NZzwZ11LrJPM8sZhCT6WHLnHJD7r/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750559; c=relaxed/simple;
	bh=mzxtffpc8124e+4rNT1E58HDtnhj972jw7+7oRO1f2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNL24F/vDFLonIQ/VB5Q525wA2VHOdP5bXPaUAOTMtZZLwqPrYdeSPxP0/QAbLW4Llb7OD+7lHzPN9694tBxRoHapWfdPIa9gEa8p7dBOG/+R4fSg33eUfcJCPArFTYDfyT50GvosvVnGuisjqF5AEmXfrfUHscaVa14z8U6qnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lnUCdVT1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lnUCdVT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750750555;
	bh=mzxtffpc8124e+4rNT1E58HDtnhj972jw7+7oRO1f2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lnUCdVT1Kw0ndc42XPVlyw+09bFSmMj3ZyvOzhJhFAlx3IhC0ybIXK+8eA+/valdt
	 s/GzqJKfmHkVjiYLfjJsdop/OAs34CS9eEVSfxskirbg9XY+S6w6qEMIqidYYUuNy+
	 wKXPDsV7NUjqA+zE3LzsAj7YrEGgxtWVlZyOLtq7QBejD7rG3Of7B0Z1T0IDVfIkLu
	 KjxwIugrtvWdECko6H5Vv5F3X/uoNqkiTZAXfgkBj7/A0qi3N0bUYMvJi5qcGxVWkk
	 5naqRs5X7Op32VS4JCUTbaoTF3qxw3kpFB1UZJ4ETFFyszEpz7MjPoW2HhgwCqwLQ6
	 JypkFirInpshQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B83B17E156D;
	Tue, 24 Jun 2025 09:35:54 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 5/6] dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
Date: Tue, 24 Jun 2025 09:35:47 +0200
Message-ID: <20250624073548.29732-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the regulators found in the MediaTek MT6363 PMIC,
usually found in board designs using the MT6991 Dimensity 9400 and
on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
MT6363 PMICs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6373-regulator.yaml  | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
new file mode 100644
index 000000000000..08deb1258b98
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6373-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6373 PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MT6363 SPMI PMIC provides 10 BUCK and 25 LDO (Low Dropout) regulators
+  and can optionally provide overcurrent warnings with one ocp interrupt
+  for each voltage regulator.
+
+properties:
+  compatible:
+    const: mediatek,mt6373-regulator
+
+  interrupts:
+    description: Overcurrent warning interrupts
+    minItems: 1
+    maxItems: 35
+
+  interrupt-names:
+    description:
+      Names for the overcurrent interrupts are the same as the name
+      of a regulator (hence the same as each regulator's node name).
+      For example, the interrupt name for regulator vs2 will be "vs2".
+    minItems: 1
+    maxItems: 35
+
+patternProperties:
+  "^v(ant|aud|aux)18$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vbuck[12356789]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vbuck4(-ufs)?$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vcn33-[123]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(f|t)p":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(cn18io|efuse|ibr|io28|sram-digrf-aif|usb)":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vmc(h)?$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vmch-(eint-low|eint-high)?$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vrf(09|12|13|18|io18)-aif$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vsim[12]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+      interrupt-controller;
+      #interrupt-cells = <3>;
+
+      regulators {
+        compatible = "mediatek,mt6373-regulator";
+        interrupts = <5 17 IRQ_TYPE_LEVEL_HIGH>, <5 18 IRQ_TYPE_LEVEL_HIGH>,
+                     <5 19 IRQ_TYPE_LEVEL_HIGH>, <5 20 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "vusb", "vaux18", "vrf13-aif", "vrf18-aif";
+
+        vaux18 {
+          regulator-name = "avss18-auxadc-mt6373";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+
+        vmc {
+          regulator-name = "pp1800-2900-vmc";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <2900000>;
+          regulator-allowed-modes = <0 2>;
+        };
+      };
+    };
+...
-- 
2.49.0

