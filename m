Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8141EA90;
	Sat, 17 May 2025 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747509603; cv=none; b=jk852MkViupEC7jW/koqsfHy6wRx3mQIu7UtQWNKWMAZsZHs7KEUoXxHPSF+viM75CQzFT55pgHbnZMRYFdFDdWPLQRI5JAT/WkemgKsVXd66kpb70kbPWPpI5uJPGPY1vHX18evp0imCvCM6GJZtrGrihSyUq1WrsQW9v87vhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747509603; c=relaxed/simple;
	bh=q4+q4KP0i1Wc2LpG8lcLj/nJxJ4h5HU8IRe3ZcTOc8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/YvXPMdbC/xIlFkfklN9N7hsqn+8QIQgghjx3Sc3jHZPHgDZuy7yqcn/Vfwl+KrHPsNdKIZHikE8Dm9PtCyRsXA/LCLLCTmKgSDnXBcBbgFO3eUorwWtkDor6YDIw7uwrrsFScioF4AdbBKw1MUVDlNND6B2DC7DdrgBz6d/zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.32])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15658ef43;
	Sun, 18 May 2025 03:19:51 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Sun, 18 May 2025 03:19:19 +0800
Subject: [PATCH v3 1/3] dt-bindings: usb: dwc3: add support for SpacemiT K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-b4-k1-dwc3-v3-v3-1-7609c8baa2a6@whut.edu.cn>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
In-Reply-To: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747509584; l=2805;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=q4+q4KP0i1Wc2LpG8lcLj/nJxJ4h5HU8IRe3ZcTOc8M=;
 b=1BLejhDbCoTqProPlguK1gw2+w6G0OrAWxh2AG82n4IPItJpo/7ugJKtVo9pO+fgfIamEElbu
 vbIV55koxkrB6m6TLkCrL//Z88lK2mv4LmUdWkS9GM9tHaQkFH6bQ11
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHh5IVkxISk5NTkJNS0NCHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVISVlXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG
X-HM-Tid: 0a96dfb03e9603a1kunm15658ef43
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MiI6TSo6SjE1PioeNBkoLBEV
	EDQwCjJVSlVKTE9MTktCTkJMTkNOVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVISVlXWQgBWUFPSElCNwY+

Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
in the SpacemiT K1 SoC. The controller is based on the Synopsys
DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
DRD mode.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2fb9f1014c4e901417818a37b6289814a2d3d49a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
+
+maintainers:
+  - Ze Huang <huangze@whut.edu.cn>
+
+description: |
+  The SpacemiT K1 embeds a DWC3 USB IP Core which supports Host functions
+  for USB 3.0 and DRD for USB 2.0.
+
+  Key features:
+  - USB3.0 SuperSpeed and USB2.0 High/Full/Low-Speed support
+  - Supports low-power modes (USB2.0 suspend, USB3.0 U1/U2/U3)
+  - Internal DMA controller and flexible endpoint FIFO sizing
+
+  Communication Interface:
+  - Use of PIPE3 (125MHz) interface for USB3.0 PHY
+  - Use of UTMI+ (30/60MHz) interface for USB2.0 PHY
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: usbdrd30
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 1
+    description:
+      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
+      The 'interconnects' property explicitly describes this path, ensuring
+      correct address translation.
+
+  interconnect-names:
+    const: dma-mem
+
+  vbus-supply:
+    description: A phandle to the regulator supplying the VBUS voltage.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - interrupts
+  - interconnects
+  - interconnect-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@c0a00000 {
+        compatible = "spacemit,k1-dwc3";
+        reg = <0xc0a00000 0x10000>;
+        clocks = <&syscon_apmu 16>;
+        clock-names = "usbdrd30";
+        resets = <&syscon_apmu 8>;
+        interrupt-parent = <&plic>;
+        interrupts = <125>;
+        interconnects = <&mbus0>;
+        interconnect-names = "dma-mem";
+    };

-- 
2.49.0

