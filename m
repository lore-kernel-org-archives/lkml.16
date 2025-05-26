Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435F4212B2B;
	Mon, 26 May 2025 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269891; cv=none; b=BMij5FoYq2vLUSjFQIt4JSjq4SlYkpUg7AyHsZRNCC3XfSO+pXpgPl6rM9ttIxu6/Og8JTn5kLAKUsCE36CEiOFdrPgmshbt4gpqSd21S8xaptNFS/siP82PKQUw6bgSucav9kCEpHyMrgPiqjtbiJAi3aCpyvEBJNtQ9lAzyEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269891; c=relaxed/simple;
	bh=7wRZijPTWkMIjtlbhD5lqHbIBKaLm3eG7ixPg9G+vh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SsdSxXgFzNZuOYxrUjSbfVB2FSk+79HweD71O4PoPMjxUK8KeFzJoe3RmP+Z5f0xULgtSNVyBlin4qHDB5nCl+JbJW7MdUGshYRNFsmXbcVSDuOCX2cyJ0JKpvkMlefMIjNxu4yu5iDNbXpFX0j7ygBZApdvmvyrSffvFchg274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1670631e3;
	Mon, 26 May 2025 22:31:21 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 26 May 2025 22:31:00 +0800
Subject: [PATCH v4 2/4] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-k1-usb3-phy-v2-v4-2-eca668fc16a2@whut.edu.cn>
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
In-Reply-To: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748269870; l=2717;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=7wRZijPTWkMIjtlbhD5lqHbIBKaLm3eG7ixPg9G+vh4=;
 b=Zn5CP2nXRZDHZQO7ADSxxOmVSpAEdLXfbXKk7fNk2j9aDm5YbaFxOPG6zZaImbljExR/YgIwi
 CgDASEUaL4dAdbqnz1J9aHonVwMXny6GcpQJ/S8D2S58STJ7eh+XVal
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUMZVk5CSx8ZGkgeGUxLTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a970d0158bd03a1kunm41fed850119dc
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRQ6NCo*STE8IgwOCjQ9FR85
	Tg0aCxJVSlVKTE9DSU1CQ0NNQ09DVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
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

