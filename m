Received: from smtp134-83.sina.com.cn (smtp134-83.sina.com.cn [180.149.134.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF2D25F98E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824214; cv=none; b=BEHs+OYPzpNk2+7Zk+VtRjfi8l6eqOcc2sZlBXejw6ggtzfsgJUfLjPcDHAjWec6rxRTCVYDUEFELA78IF8FxS04/r41LylGUTmsaA1ntNshcPpOSl8YBiZc8gskFw1EPNU5FfkoGSn0pXkI2THWNPCnFtbGWzeuEl1jbBiVz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824214; c=relaxed/simple;
	bh=WvhkurQgWjJE+R0UHU3NegjTRgdSpjV3HQVMDl3eS/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KfnQhwqRqceMbL0oHI1ksgZ7SnH/NAD1x5xyLDfKQNyQQJesMYhFl1L3KAuJoEJp0PX03asXP2EQE8OhCLGPJhe4Tyv3GtJJMeQRQQks8Bj8tO6e4m+ixQPoMG6g8F1XW7UW8idDBUHeElG/2w7YIYCbgoT3Gt++JObqtNbluKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.29) with ESMTP
	id 682DAE290000569E; Wed, 21 May 2025 18:42:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 74144E2DE4E142A786A8C9CE129BAC8C
X-SMAIL-UIID: 74144E2DE4E142A786A8C9CE129BAC8C-20250521-184251
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
Subject: [PATCH 1/2] ASoC: dt-bindings: Add Everest ES8375 audio CODEC
Date: Wed, 21 May 2025 18:42:46 +0800
Message-Id: <20250521104247.6595-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250521104247.6595-1-zhangyi@everest-semi.com>
References: <20250521104247.6595-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add device tree binding documentation for Everest ES8375

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8375.yaml        | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8375.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8375.yaml b/Documentation/devicetree/bindings/sound/everest,es8375.yaml
new file mode 100644
index 000000000000..a7e158493e0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8375.yaml
@@ -0,0 +1,62 @@
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
+      es8375: codec@10 {
+        compatible = "everest,es8375";
+        reg = <0x18>;
+        vdda-supply = <&vdd3v3>;
+        vddd-supply = <&vdd3v3>;
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.17.1

