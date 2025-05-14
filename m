Received: from smtp134-86.sina.com.cn (smtp134-86.sina.com.cn [180.149.134.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD61A83E2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747193653; cv=none; b=p/XQlUSDH56e7DNXfOxQAwnYWPhhqimygW2SV36uM6yVAYIrNSFCdXAgCcheTK5k4f9nsw+/z5ae36Rp07h73NqpPVNz0hKs5WWMtXqeUTeyOdMicvyKDXBqIeT495c91zxfBJbruH5fzwvyfqG4iMZaiBVxPdoowEjhF/40UVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747193653; c=relaxed/simple;
	bh=mqJ2zpr0rM1SozvZK0nLMqNWqEKb6AcbZ6KjfpKuxrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=V6OXQ6b3pEULIiXoxhDpvxLRt7PoN7F7hAaT0FwTpmf9VisH2KXC/GR8kgojtOpYkHy1rs3bLcwkYPcNbrlZLYVCC1tos1mP/Mi834Av+vKSzkgM37dgRt0vW1BC2vB4mCA9RZ5/1HEh7SIEwu7nr8b4qoEsDRiVE1zrSrHD66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.30) with ESMTP
	id 68240F0900001008; Wed, 14 May 2025 11:33:32 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 8F35DFED0E944B93BEB9FFBD51A8AC56
X-SMAIL-UIID: 8F35DFED0E944B93BEB9FFBD51A8AC56-20250514-113332
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
Subject: [RESEND v7 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Date: Wed, 14 May 2025 11:33:27 +0800
Message-Id: <20250514033327.32641-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250514033327.32641-1-zhangyi@everest-semi.com>
References: <20250514033327.32641-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add device tree binding documentation for Everest ES8389 which
is different from ES8388

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/everest,es8389.yaml        | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
new file mode 100644
index 000000000000..a673df485ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es8389.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES8389 audio CODEC
+
+maintainers:
+  - Michael Zhang <zhangyi@everest-semi.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: everest,es8389
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
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      es8389: codec@10 {
+        compatible = "everest,es8389";
+        reg = <0x10>;
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.17.1

