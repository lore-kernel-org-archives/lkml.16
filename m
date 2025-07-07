Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E52BE02E;
	Mon,  7 Jul 2025 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895909; cv=none; b=DFFeZrKyO2qJPJC4efxBQCdNHvaCFCwEgjV1ztUF12pDo9s5TP7iaURpZgIKLP2lF+Og2XNyOiBZcQDRoaFaxlufVrKdR5S1VS+1NI5Npwvzx1VD6B7IEy+cTcNwAJUaCPCZ1YgItvEV5Zh5ru0M5siiPdClMW1zlCOKH+vodPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895909; c=relaxed/simple;
	bh=p/CHMm6LRfCh8lE1fNm+5yHfL0bb4eTmG7lvDvnDN+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNsQ6QP/bV9997LGVV2F8Ds5gQW7h322wLALYOahfakR/f+EY9nKUrhp9OKvggJSECy0+bXgar+RR1urHkhJcodtJRvnd4O+mMHVjgHYnGaggj5X1582B/AjXCNewgsO4tAwi4EvYadHlWAKp2w2f/w4FrQ+YAyEn+TdLGWlGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c7FWEFFh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c7FWEFFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751895905;
	bh=p/CHMm6LRfCh8lE1fNm+5yHfL0bb4eTmG7lvDvnDN+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c7FWEFFhdqE0SJfXblaxMkIOr9EXfo5FHLdFUoelG6wUQOVL3TjNjzFED0BWoWJ3B
	 3HGWLyqzZ/XAjeYd7SNGMbEAPylm5mOjBsBpcjPb24kprud+iPIb0P7LjC15iIrAHR
	 Gkw48zvr0VZcI4gU5ZJ7/aGBwn2/erWSKAFvp9UwxgJ1Ak12u/W6Zjx8/8PYdRYsTA
	 0NOMbTeDpGdnQMt9t8ASeqhg08ui0MA3FW4rjkuFd6IX7Ko/VrUS3vzDT/7vw40acE
	 otjfuYt8zHEvKz2HAabYl/JbglQlP4ROAnnKAJPBxbyJ43cpZ1akKk3e95GSBRQTtu
	 jWaDknoOeLeXQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAF1017E1110;
	Mon,  7 Jul 2025 15:45:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 5/8] dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
Date: Mon,  7 Jul 2025 15:44:48 +0200
Message-ID: <20250707134451.154346-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
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

Link: https://lore.kernel.org/r/20250624073548.29732-6-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6373-regulator.yaml  | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
new file mode 100644
index 000000000000..dec4bf90e892
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
@@ -0,0 +1,175 @@
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
+  The MT6373 SPMI PMIC provides 11 BUCK and 23 LDO (Low Dropout) regulators
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
+    maxItems: 34
+
+  interrupt-names:
+    description:
+      Names for the overcurrent interrupts are the same as the name
+      of a regulator (hence the same as each regulator's node name).
+      For example, the interrupt name for regulator vfp will be "vfp".
+    minItems: 1
+    maxItems: 34
+    contains:
+      enum:
+        - vbuck0
+        - vbuck1
+        - vbuck2
+        - vbuck3
+        - vbuck4
+        - vbuck4-ufs
+        - vbuck5
+        - vbuck6
+        - vbuck7
+        - vbuck8
+        - vbuck9
+        - vant18
+        - vaud18
+        - vaux18
+        - vcn33-1
+        - vcn33-2
+        - vcn33-3
+        - vcn18io
+        - vefuse
+        - vfp
+        - vibr
+        - vio28
+        - vmc
+        - vmch
+        - vrfio18-aif
+        - vrf09-aif
+        - vrf12-aif
+        - vrf13-aif
+        - vrf18-aif
+        - vsim1
+        - vsim2
+        - vsram-digrf-aif
+        - vtp
+        - vusb
+
+patternProperties:
+  "^v(ant|aud|aux)18$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vbuck([0123456789]|4-ufs)$":
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed Buck regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
+                regulation accuracy with constant switching frequency but lower
+                regulator efficiency
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, does not limit the maximum out
+                current but unless only a light load is applied, there will be
+                regulation accuracy and efficiency losses.
+            3 - Forced Ultra Low Power mode for ultra low load, this greatly
+                reduces the maximum output power, makes the regulator to be
+                efficient only for ultra light load, and greatly reduces the
+                quiescent current (Iq) of the buck.
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2, 3 ]
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

