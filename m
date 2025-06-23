Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647BA246326;
	Mon, 23 Jun 2025 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680030; cv=none; b=bKoGqIjcpe7F+g5knWsJAtAH2PdO+8nCExOEWTJLsWeNCbgBdz3/qaSFUaRquUSibLgaLf6QQgbhqbxsCQu2u8lHVurZzzI/cpN51pPrMjB8qAoQkKCAgTfY7lYr2OoSPZjFk7SvpkImwBncIa9LnAicb3hfsObXH+zOnosz7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680030; c=relaxed/simple;
	bh=mzxtffpc8124e+4rNT1E58HDtnhj972jw7+7oRO1f2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KkwCiJ6cyZ7+5rBBwHPmkBtviFUvpQyqNIshUujSz/8kL+88t2PXClTCNApoaZ2r24HnTLgL4m7c6gVtw1KLHevCG36BCNkI//Z7q6FFKH/FGoZU8iqwN77uEmiDhoJvUfVGqqxU4dUdoprb+jn6r90Eo2tAi9bOk/Id2BwJpDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g6F6JLHy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g6F6JLHy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680026;
	bh=mzxtffpc8124e+4rNT1E58HDtnhj972jw7+7oRO1f2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g6F6JLHyPq/+tGjLT27v7ZisxhSH60Oqd3cPOKSFn40KUrwZtMROePMZhdhFdkbdN
	 /E+Fd9O7v5Iu/FrxQeAOInDlmowQBwgAQdldEYFNSKaSxuuTj5LTQZLJvmZLfB9gLR
	 b3qpre3WQ4z+g6QroPhZdJqyZsAIHrLftA4v9Uh87Ti93LUGe4H4Qx7q3AW0QKVaj/
	 3RQn+1zUtpuRDFNJnyLH4iPi4ecc3EPK/i4Irkr++vZvIW6ogWphd9gdKuyKQFvPNB
	 z7OtVfXV48hd6U8sKMuJRguSctK+EReDSItMgXI7wtW0gsQQBJ7oY+qAnDL+svcaCs
	 ivbekD4WzhI0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E75E17E156E;
	Mon, 23 Jun 2025 14:00:26 +0200 (CEST)
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
Subject: [PATCH v1 5/6] dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
Date: Mon, 23 Jun 2025 14:00:15 +0200
Message-ID: <20250623120016.108732-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120016.108732-1-angelogioacchino.delregno@collabora.com>
References: <20250623120016.108732-1-angelogioacchino.delregno@collabora.com>
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

