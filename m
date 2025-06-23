Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFF124169D;
	Mon, 23 Jun 2025 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680028; cv=none; b=fQuJLpQZkJI/9mcZODE7kMzUuHqtUfQvfrXtfrI+XcrRxU60tl+Douhg/Ikv9Lw+2ZbYDhcbvFai1jJt35iXDElmP8MLAmi8931rffCPifkkqsl+6tqmOm6Pqah2L1K6dszoeTEWThL3n0bi8HUGbk3zrCdn35TaymLqxyOMWC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680028; c=relaxed/simple;
	bh=tuIAU3/jPqC/vVlqNQI9mFvFjLa8oCatvIPSUqpJew0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMAWpHSfUIbvY4wuEgQ9PLfZ01SwuR+BTCeaceZc89jvfBZ9hPpja4nbQOvp/1XWBiry2deFl4o+DjqHlOafMdW7gZR6vMrBh2QM41zQIOu+ghDzhTSP7b0WjLQjI31it3RBUukUkfskvncg++ZzQRPfogvBV4/GASc+bm6hP+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lhHqBhj0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lhHqBhj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680025;
	bh=tuIAU3/jPqC/vVlqNQI9mFvFjLa8oCatvIPSUqpJew0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lhHqBhj0suwPcULebYZAXglFOUWnaUMN6a7mpEXMOzuchNGGchpKg10syUros7De6
	 /jLSPBiWE64DBZZWmkewsmk2lCTaWaT+H+diuMsMzrvF95LisX6uId4tRmDEjtsef5
	 RKCDHF1z98LJP8pvwFANDYcI29756sM/13QDeCP6HiC3YejL9oIw+3Htm/dhfj9yec
	 Mb+2K7TEtavyoTSb1eX7FjQVh1bYLW3c1rq9NJ0fvoJF5qJdy/ITPYlYgkoCAKSZJU
	 M+1WGMe4XLVhbKrwJLzBjyUUf+THas+taxh6zV/5RljS7GcjnFjRNp3O2Pmu0MQpJa
	 WaJk24OA55EQg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 705B517E1560;
	Mon, 23 Jun 2025 14:00:24 +0200 (CEST)
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
Subject: [PATCH v1 3/6] dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
Date: Mon, 23 Jun 2025 14:00:13 +0200
Message-ID: <20250623120016.108732-4-angelogioacchino.delregno@collabora.com>
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
MT6373 PMICs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6363-regulator.yaml  | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
new file mode 100644
index 000000000000..f866c89c56f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6363 PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) regulators
+  and can optionally provide overcurrent warnings with one ocp interrupt
+  for each voltage regulator.
+
+properties:
+  compatible:
+    const: mediatek,mt6363-regulator
+
+  interrupts:
+    description: Overcurrent warning interrupts
+    minItems: 1
+    maxItems: 36
+
+  interrupt-names:
+    description:
+      Names for the overcurrent interrupts are the same as the name
+      of a regulator (hence the same as each regulator's node name).
+      For example, the interrupt name for regulator vs2 will be "vs2".
+    minItems: 1
+    maxItems: 36
+
+  isink-load:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  ldo-vemc:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+patternProperties:
+  "^ldo-va(12-1|12-2|15)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^buck-vb[1-7]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^buck-sshub[124]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-v(aux|m|rfio|tref)18$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vcn(13|15)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vio(0p75|18)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vrf(0p9|12|13|18)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vs[1-3]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vufs(12|18)$":
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
+        compatible = "mediatek,mt6363-regulator";
+        interrupts = <4 16 IRQ_TYPE_LEVEL_HIGH>, <4 17 IRQ_TYPE_LEVEL_HIGH>,
+                     <4 18 IRQ_TYPE_LEVEL_HIGH>, <4 19 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "vcn15", "vcn13", "vrf09", "vrf12";
+
+        ldo-vio18 {
+          regulator-name = "pp1800-vio18-s3";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-allowed-modes = <0 2>;
+          regulator-allow-set-load;
+        };
+      };
+    };
+...
-- 
2.49.0

