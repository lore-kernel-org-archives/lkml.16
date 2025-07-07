Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7D4255F28;
	Mon,  7 Jul 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895905; cv=none; b=lbEP+0e6PHRc1Mi0Y089MiWNPHej1QvD0yTtxhGH4+sm0Y4zIEqFl8xUL5WLaSzbabBn2KwPMBM+C7YkYq9hDVrKzMj+UyiHZud6HYNiaTURQFC5ZzM8P9S5ZLIIqNJbSjQ6cNCyDCxflc056J3QZoY5wIQYrgLv4lB9Od+kSVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895905; c=relaxed/simple;
	bh=YfJsAz/MXzGFmP41ETWF8TQ5Ecu21USFNF5/WGHyE8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ko7xtaFnN5Q+BaGD4zY9veE1Ekk1UzcUe3WqCOyrB726Fu1y+z7SViNrOaR0qD0RBtSF9QDkZHTAL6yP8esBRHtKUjEJif9pXJZdyY1xKvYUr0N7H0hSxwjcv5MUl26n9J/4C6tUO62JQrWDRk89mXMbrnjl+BtRwtRrshQkgaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JfdYIL4I; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JfdYIL4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751895902;
	bh=YfJsAz/MXzGFmP41ETWF8TQ5Ecu21USFNF5/WGHyE8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JfdYIL4IjL+XUv0VMpLjKEsMttOKTijuyI+MxD2rMOGFNUmE/sUqryE2ziE+6e6ye
	 TfMxsO/9f5OliZGC9UcdFcY0KmJsw1Qb9P1tvBrXfJX5rJUptAanffgicQwElz9gQ6
	 K4x8VlSTeoIyg/AiEamt7F6joidBy4fezEGXND+BGSJ3qizIkrk2SM61M382OEct+s
	 cVATf7fGNBOtR0lbnAIOAuDNuwWxofqt3EMoOoccjwZVlspDeQORKn7eghmLmi1Bb2
	 5hSuPIpWCSLKTPuoUrkvOwxG6N15KNIe/IlWLDjOCkpCMkaVbqIp1/Yb/7kNTJXYjL
	 hv9wOzSIXiWQQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 457F717E0657;
	Mon,  7 Jul 2025 15:45:01 +0200 (CEST)
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
Subject: [PATCH v2 1/8] dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
Date: Mon,  7 Jul 2025 15:44:44 +0200
Message-ID: <20250707134451.154346-2-angelogioacchino.delregno@collabora.com>
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

Add bindings for the regulators found in the MediaTek MT6316 PMIC,
usually found in board designs using the MT6991 Dimensity 9400 and
on MT8196 Kompanio SoC for Chromebooks.

This chip is fully controlled by SPMI and has multiple variants
providing different phase configurations.

Link: https://lore.kernel.org/r/20250624073548.29732-2-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6316b-regulator.yaml | 46 +++++++++++++++++++
 .../regulator/mediatek,mt6316c-regulator.yaml | 46 +++++++++++++++++++
 .../regulator/mediatek,mt6316d-regulator.yaml | 41 +++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
new file mode 100644
index 000000000000..e7a6b70cdab2
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
+  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
+  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
+
+properties:
+  compatible:
+    const: mediatek,mt6316b-regulator
+
+  vbuck12:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  vbuck34:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        compatible = "mediatek,mt6316b-regulator";
+
+        vbuck12 {
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <965000>;
+          regulator-always-on;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
new file mode 100644
index 000000000000..0b9239a595ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316c-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 CP/HP/KP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316CP/HP/KP PMICs are fully controlled by SPMI interface,
+  features four step-down DC/DC (buck) converters, and provides 3+1 Phases,
+  joining Buck 1+2+4 for the first phase, and uses Buck 3 for the second.
+
+properties:
+  compatible:
+    const: mediatek,mt6316c-regulator
+
+  vbuck124:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  vbuck3:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        compatible = "mediatek,mt6316c-regulator";
+
+        vbuck124 {
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-always-on;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
new file mode 100644
index 000000000000..460c02bf69de
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316d-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 DP/TP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316DP/TP PMICs are fully controlled by SPMI interface, both
+  feature four step-down DC/DC (buck) converters, and provides a single Phase,
+  joining Buck 1+2+3+4.
+
+properties:
+  compatible:
+    const: mediatek,mt6316d-regulator
+
+  vbuck1234:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
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

