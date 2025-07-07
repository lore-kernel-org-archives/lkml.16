Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243AF2BEC31;
	Mon,  7 Jul 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895911; cv=none; b=ZmOQ6fuP4NQZ4gt6ygwKWoo1KdqA2OP/KHognFWoxLh5sLv5Jm9+TOcW0BFGjLklGYRqQ0K5cFB2V/ZV/rLK8oznTY4Nk8I9VPBfbPlPtgu0mxx3vp5xmmZIXDuFEX4IJtImhx1HsJ8xeI2LJGzQiAxOl32DTJ1baBu7x9Tmkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895911; c=relaxed/simple;
	bh=uF2AKEB66mbucdHZm59kAVoaRsS9wpNJ/B8bilV0bZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5IbFSEUuz45Kg3LMgv0MiFv3l1mPG8Kh6da6llo5riEwIP6I0u00shMoILdcGPE7AH/MQRMce8Zh6y2GwX+/nAPAMvBIojKuxHAgSuvoDSzV5grKlasZ42HzgCMu/MmGiAaJyAO2oVwHeg1SSENXgy2Oi9qkKkigjwfvGWUYic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J85/qWgH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J85/qWgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751895907;
	bh=uF2AKEB66mbucdHZm59kAVoaRsS9wpNJ/B8bilV0bZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J85/qWgH5t4wZoP/UwKy1PoCDcUruo/vUTf0pTyfLMPg516CyYgqchhaJ4+KYrlJT
	 Kc0wy/iWcrrE4zNGfGChUv+Xg+PuqaWCWNxDsz66iU+BrD3BrCYkf+z8t/l4rrOZai
	 57mfzyd7sb60CthKwYh6CiQZoLyipn8bAJGep+VXZ8YICAqMXiAMSmCFhw5spOBCpA
	 eBHOqpSDM7F345SahqK2h2Oh1tEIwTUzbIexCsoeWcz98FHewzHh5mSoY62yXr57Z1
	 I21IN6NyWVTg8OvynRYj3yX158kTWvi/EN6kae6cJBBCwERP3vkLOq49Rpb8xqc+hS
	 nZuGz6Vjk75fg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD05317E0657;
	Mon,  7 Jul 2025 15:45:06 +0200 (CEST)
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
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 7/8] dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
Date: Mon,  7 Jul 2025 15:44:50 +0200
Message-ID: <20250707134451.154346-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a binding for the MediaTek MT6363/6373 (and similar) multi
function PMICs connected over SPMI.

These PMICs are found on board designs using newer MediaTek SoCs,
such as the Dimensity 9400 Smartphone chip, or the Chromebook
MT8196 chip.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Link: https://lore.kernel.org/r/20250623120038.108891-2-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6363.yaml         | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
new file mode 100644
index 000000000000..0d1078e92232
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6363 series SPMI PMICs multi-function device
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  Some MediaTek Power Management ICs (PMICs) found in board designs with
+  the Helio, Dimensity and/or Kompanio series of SoCs are interfaced to
+  the chip via the System Power Management Interface (SPMI) bus.
+
+  These PMICs are multi-function devices with various sub modules.
+  For example, those may include one, or more of the following:
+  - Auxiliary ADC Controller
+  - Clock Controller
+  - eFuses
+  - GPIO Controller
+  - Interrupt Controller
+  - Keys
+  - LEDs Controller
+  - Regulators
+  - RTC
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6363
+      - mediatek,mt6373
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 0
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+
+  adc:
+    type: object
+    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
+    unevaluatedProperties: false
+
+  regulators:
+    type: object
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6363-regulator
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/mediatek,mt6363-regulator.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6373-regulator
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/mediatek,mt6373-regulator.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@4 {
+        compatible = "mediatek,mt6363";
+        reg = <0x4 SPMI_USID>;
+        interrupts = <4 64 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #address-cells = <0>;
+        #interrupt-cells = <3>;
+
+        adc {
+            compatible = "mediatek,mt6363-auxadc";
+            #io-channel-cells = <1>;
+        };
+
+        regulators {
+            compatible = "mediatek,mt6363-regulator";
+        };
+      };
+    };
-- 
2.49.0

