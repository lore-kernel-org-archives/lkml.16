Received: from smtp134-80.sina.com.cn (smtp134-80.sina.com.cn [180.149.134.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BE0288CB4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910160; cv=none; b=Ca0sZLN0BKngqvCDThsvFVUi+6AN75rE10tn1gErt/tSZ6D3aKzzScVZ03AoF4T4N4Mpyubw3+u+h5Ac0d+xvNw38tl64eTlQtzOWLTRbnzxAA9b2nmUaQWheb0pGmzuMF00FK8y9cCK6Rhq7pUqBkTiPeWhmAya100rIAOIUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910160; c=relaxed/simple;
	bh=9BCOZjNm2q8RavaslpU4IvZ1jNwKcJcNhH/LzaHPbVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ax3NX9m8ROlHsLD08lWkzYrdDmRRaqGnep1GoGzWJVr5MKgkGC/aSWKzBi20s5uQmfCJqSImaFUebtWq8DqcUbbAGdkslSqj+jmUAwJ2dArBT9FbU+wBh4qVjo6DyO8CD4KiNcodE/91QY9ybCbzYL4mmI8XnY1bc7Ey8SZXwsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.29) with ESMTP
	id 682EFE05000009F7; Thu, 22 May 2025 18:35:53 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 720F221B6C7C47399735B01F3881A612
X-SMAIL-UIID: 720F221B6C7C47399735B01F3881A612-20250522-183553
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org
Cc: amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: Add Everest ES8375 audio CODEC
Date: Thu, 22 May 2025 18:35:47 +0800
Message-Id: <20250522103548.20134-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250522103548.20134-1-zhangyi@everest-semi.com>
References: <20250522103548.20134-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add device tree binding documentation for Everest ES8375

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/everest,es8375.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8375.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8375.yaml b/Documentation/devicetree/bindings/sound/everest,es8375.yaml
new file mode 100644
index 000000000000..4a3d671c66b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8375.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es8375.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES8375 audio CODEC
+
+maintainers:
+  - Michael Zhang <zhangyi@everest-semi.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: everest,es8375
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for master clock (MCLK)
+
+  clock-names:
+    items:
+      - const: mclk
+
+  vdda-supply:
+    description:
+      Analogue power supply.
+
+  vddd-supply:
+    description:
+      Interface power supply.
+
+  everest,mclk-src:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      Represents the MCLK/SCLK pair pins used as the internal clock.
+      0 represents selecting MCLK.
+      1 represents selecting SCLK.
+    enum: [0, 1]
+    default: 0
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - vdda-supply
+  - vddd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      es8375: codec@18 {
+        compatible = "everest,es8375";
+        reg = <0x18>;
+        vdda-supply = <&vdd3v3>;
+        vddd-supply = <&vdd3v3>;
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.17.1

