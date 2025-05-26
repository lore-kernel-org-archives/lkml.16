Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF606213236;
	Mon, 26 May 2025 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748270448; cv=none; b=UIZtJSV0XOwn7nIt91Y3MqspqeOSqW6QFuT4CGzrfi/t8pF9JUIdFpimw4dpAcQfQwxY6rIcOC2ArGspY62tmKEuKLjEJ3Ng900yGux3lY24td85K6nkhYI0fmOwPdOZ2Oju8t+3Pdh4aahbaw1iVsRySqM3rPzP5i+6qWE9mF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748270448; c=relaxed/simple;
	bh=BH+M8S+LdjO6vILGDAHjXkmrs1lq+W5Vv7MqYlwP/g0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=beyCD0Zx2FjAUpvAYS/kSX/li/XKSeFlRGOP28Bfb0trr6I4/atu5e4jt8s78HLmZXFwWBzZkpVc46AUiP5tyscV5YzCYABzoezxDoCk4NLZju5stcKWU4qwQDTx123o/v72S106q5193ZUJv0r5cF8ksx2HpqjzPYplpK99rxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16709a332;
	Mon, 26 May 2025 22:40:37 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 26 May 2025 22:40:18 +0800
Subject: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748270423; l=2263;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=BH+M8S+LdjO6vILGDAHjXkmrs1lq+W5Vv7MqYlwP/g0=;
 b=mXuYbUjZP4VNczBinGSiUwmr+XM0tW9D6UVDvHbEPTMKTZBGwhdUEo3ZZ/ONnqaX0EurDsGm1
 wL44DC+/un2BQ90TeHQNgj2x3DP1Zf6cDPfd/hyKI4H9ZyJFd1Zp/vl
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGk9OVhlJSk4fGB9LTU9ITlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJSEJLQ1VKS0tVSkJZBg
	++
X-HM-Tid: 0a970d09d31703a1kunm5f56ec4c12e60
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDY6OQw*CTErLgwNTzVJFDhR
	ME8aFAJVSlVKTE9DSUxLT09ISENLVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFITENNNwY+

Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
(MBUS) that is not their immediate parent in the device tree. This bus
uses a different address mapping than the CPU.

To express this topology properly, devices are expected to use the
interconnects with name "dma-mem" to reference the MBUS controller.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..533cf99dff689cf55a159118c32a676054294ffa
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-mbus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT Memory Bus controller
+
+maintainers:
+  - Ze Huang <huangze9015@gmail.com>
+
+description: |
+  On the SpacemiT K1 SoC, some devices do not perform DMA through their
+  immediate parent node in the device tree. Instead, they access memory
+  through a separate memory bus (MBUS) that uses a different address
+  mapping from the CPU.
+
+  To correctly describe the DMA path, such devices must reference the MBUS
+  controller through an interconnect with the reserved name "dma-mem".
+
+properties:
+  compatible:
+    const: spacemit,k1-mbus
+
+  reg:
+    maxItems: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interconnect-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - dma-ranges
+  - "#interconnect-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    dram-controller@0 {
+        compatible = "spacemit,k1-mbus";
+        reg = <0x00000000 0x80000000>;
+        dma-ranges = <0x00000000 0x00000000 0x80000000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #interconnect-cells = <0>;
+    };

-- 
2.49.0

