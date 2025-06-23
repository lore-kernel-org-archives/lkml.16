Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDD91FBEBD;
	Mon, 23 Jun 2025 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680027; cv=none; b=rROl5Vcc80ORMMOfseiNeWL4zewfwmX32gx7ojlMhTLitWM35BceaAa2Zt3GPQTv5w7JmOfCHUcr1PnanWWI/1VUeifEFBDVnhldwQ2La5RIeFQ2I9NoaF2gEdLOOqEruHEghTeETnSLRvRdtLe6dHu1V32FMc80Kwtq94rdoag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680027; c=relaxed/simple;
	bh=KQDMK2HRMwF1uUdXsBchy166izNLsZ/Y2d5yxmXnG8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lk81GfsmV3a93SiimViSdy0q6bP30WPnsDFcHiG8YlcqiAVXTCDpPuYNpUP4pHGJXF0hhD0OueEW1dI7Ku5uZkwM42HZdsbQz1Lm1AT45pvrN7dRQVfgpWgV3RwcePhOL5wmQubOdsGrMQtU16iJ6zrHnlMdBB0AvxEMRSLl5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D2KpUOSC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D2KpUOSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680023;
	bh=KQDMK2HRMwF1uUdXsBchy166izNLsZ/Y2d5yxmXnG8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D2KpUOSCTyW7qIdAYKyGZ7OAW3CMMs82cCzftjyXvlGS8wgbiJsLH2Kk0gyIfWPyg
	 8U5rCZrzML7LlWkmL6UuzkbjGkaxdKA6TucRpQwV09pcbcB3Itqgzi4u4xCGd9m8En
	 RJ6vufg2RsVzNpEe9jgUwCMj6yuNJDSu7S4xkIEvz9PdjXJYG4ya4TViSZLQM5u5KM
	 1i0DYkXhOBt+a/NVAwCndrdhjXf+o73rjkXQLC68BX4hBAQU/D1FIlrMAfzpaw1vvF
	 gL+zk7gobNU4NyuO9IK5uSNSSL/rIyH2uMYD7oPTwHvqJ/ptZe7B0KgArZCs3PBh0D
	 TXLiFf0BX7+/w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA6D217E0342;
	Mon, 23 Jun 2025 14:00:22 +0200 (CEST)
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
Subject: [PATCH v1 1/6] dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
Date: Mon, 23 Jun 2025 14:00:11 +0200
Message-ID: <20250623120016.108732-2-angelogioacchino.delregno@collabora.com>
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

Add bindings for the regulators found in the MediaTek MT6316 PMIC,
usually found in board designs using the MT6991 Dimensity 9400 and
on MT8196 Kompanio SoC for Chromebooks.

This chip is fully controlled by SPMI and has multiple variants
providing different phase configurations.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6316-regulator.yaml  | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
new file mode 100644
index 000000000000..019c3c36997c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  The MediaTek MT6316 PMIC is fully controlled by SPMI interface; it features
+  four step-down DC/DC (buck) converters and has multiple variants, providing
+  different phase configurations. In particular:
+  MT6316BP/VP:    2+2 Phase (buck 1+2, buck 3+4)
+  MT6316CP/HP/KP: 3+1 Phase (buck 1+2+4, buck 3)
+  MT6316DP/TP:    4+0 Phase (buck 1+2+3+4)
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6316b-regulator
+      - mediatek,mt6316c-regulator
+      - mediatek,mt6316d-regulator
+
+  vbuck1234:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt6316b-regulator
+    then:
+      patternProperties:
+        "^vbuck(12|34)$":
+          type: object
+          $ref: regulator.yaml#
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt6316c-regulator
+    then:
+      patternProperties:
+        "^vbuck(124|3)$":
+          type: object
+          $ref: regulator.yaml#
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt6316d-regulator
+    then:
+      properties:
+        vbuck1234: true
+    else:
+      properties:
+        vbuck1234: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        compatible = "mediatek,mt6316d-regulator";
+
+        vbuck1234 {
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-always-on;
+        };
+      };
+    };
+...
-- 
2.49.0

