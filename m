Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE021EEA3C;
	Tue, 27 May 2025 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347308; cv=none; b=YqNn03Aw6018TOJsDz4NuAAsnvOOxhrb3fJuhyOTS4HNOLbf7A4qpzCk/giz7vLCh1Iscfc8u69Ovsxsj6KgSSK1pBJ4hoIVj/sJD4f8JbTQs7jAldM2N6C8+ap4LmyxH89SeV9kmc+J+hxoVY1CYBlrt0GvFbaRmdoJWCTGwew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347308; c=relaxed/simple;
	bh=7wRZijPTWkMIjtlbhD5lqHbIBKaLm3eG7ixPg9G+vh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+5nnYghWxzdULt4xo2UG04eCix4hulTEa+GQe4OCFP1skcp7PhBcFFdywSQkjnrhZ4c3VQZYsDUQOgVv2A0igllvwxbdT0lLFRNvNVcfE1H+jh6p6Fyl4EiO4vspYtY5KESK6AGqsh8WwLpHoosD38GHs4lH/PY1kHrL80GzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 169309535;
	Tue, 27 May 2025 20:01:38 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Tue, 27 May 2025 20:01:16 +0800
Subject: [PATCH v5 2/4] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-b4-k1-usb3-phy-v2-v5-2-2d366b0af999@whut.edu.cn>
References: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
In-Reply-To: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>, 
 Junzhong Pan <junzhong.pan@spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748347285; l=2717;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=7wRZijPTWkMIjtlbhD5lqHbIBKaLm3eG7ixPg9G+vh4=;
 b=XP1U3pSMWre1S31zT8drPg2Uj/71asthvklLTsIEJzD1cM0Tn8dJg9UB+Exuiu1LeVTdBW8tw
 85creN3IUpSD+VsL1Z+p06OqQzqENVqPpwdwAEpGSkekJsBbH3y/pqb
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEJLVk9PQh8YS0xMGE4eQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a97119ea17003a1kunm8e523759adf5c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6OBw4UTE5OlY8UT5JPzg3
	SEoaC0hVSlVKTE9DSE9MSEtITUxNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFPSkhONwY+

Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.

PCIe portA and USB3 controller share this phy, only one of them can work
at any given application scenario.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Junzhong Pan <junzhong.pan@spacemit.com>
Signed-off-by: Junzhong Pan <junzhong.pan@spacemit.com>
Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../bindings/phy/spacemit,k1-combphy.yaml          | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..93f7a3bb06bba380def77f87f6db0184af26e9e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-combphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe/USB3 Combo PHY
+
+maintainers:
+  - Ze Huang <huangze9015@gmail.com>
+
+description:
+  Combo PHY on SpacemiT K1 SoC. PCIe port A and USB3 controller share this
+  phy, only one of PCIe port A and USB3 port can work at any given application
+  scenario.
+
+properties:
+  compatible:
+    const: spacemit,k1-combphy
+
+  reg:
+    items:
+      - description: PHY control registers
+      - description: PCIe/USB3 mode selection register
+
+  reg-names:
+    items:
+      - const: ctrl
+      - const: sel
+
+  resets:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description:
+      Indicates the PHY mode to select. The value determines whether the PHY
+      operates in PCIe or USB3 mode.
+
+  spacemit,lfps-threshold:
+    description:
+      Controls the LFPS signal detection threshold, affects polling.LFPS
+      handshake. Lower the threshold when core voltage rises.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xff
+
+  spacemit,rx-always-on:
+    description:
+      Affects RX.detect, enhance compatibility of some DFPs in device mode but
+      increase power consumption.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@c0b10000 {
+        compatible = "spacemit,k1-combphy";
+        reg = <0xc0b10000 0x800>,
+              <0xd4282910 0x400>;
+        reg-names = "ctrl", "sel";
+        resets = <&syscon_apmu 19>;
+        #phy-cells = <1>;
+    };

-- 
2.49.0

