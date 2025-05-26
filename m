Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBFC211479;
	Mon, 26 May 2025 14:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748270442; cv=none; b=cgTAtNZB/9yVEyWHTrXOiow/chQl4yU1DXwoUL1F6L3FEk5XJnCapbY8T0p/iIQN74QpfW2MeN5EMtDjDhFbjWeu18D2mMiVxLxohqNoV0NiZfAxfLrtoEozzWpO7Yd9NuldsNqdxvzFj0Up3WZISff05HcODfcyNb07I3NdZps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748270442; c=relaxed/simple;
	bh=bwc4ehrUUb5yMr61UXhl319IcCCrFAV6pb82Pcs8dqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7ziH6k8oH0kDczRtw4viknqFKZHSwaGOaAdj/cvytdhCQYiGvtwvFamMPNfjVNVVo8/v2pkgFprz6pccC8JMJPpgxBIIAHiIQYb0m0Y2s6H8v8uA+iPC05a8C7mNXrF/pJwWZwIoqoTPOgd0Q013PF0dWBVorHhR4zq3xSOWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16709a323;
	Mon, 26 May 2025 22:40:30 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 26 May 2025 22:40:17 +0800
Subject: [PATCH v4 1/4] dt-bindings: usb: dwc3: add support for SpacemiT K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748270423; l=3650;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=bwc4ehrUUb5yMr61UXhl319IcCCrFAV6pb82Pcs8dqI=;
 b=4WUvEDLz9hoMoYvR0A1q4dM0FNou2Q5lu6Ek6vmgD1+ATlDBk7yfp6NCgACDGnB60kk7VvTRG
 eaVF9rrPeW1Cq09qfQ6iamBFp4Q5HTDKSZKZ8w7Xk2le1X3N/dTs4ZM
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0gaVktCTUlPGR0eQkJLTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a970d09b8fc03a1kunm5f56ec4c12e05
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTI6GDo4TzE3PgwWGisYFDk2
	PzgwChZVSlVKTE9DSUxLT0hNQ0tLVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFOSkxPNwY+

Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
in the SpacemiT K1 SoC. The controller is based on the Synopsys
DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
DRD mode.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bba3fc1c020500383b1256a97648be3f626c7602
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
+
+maintainers:
+  - Ze Huang <huangze9015@gmail.com>
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
+  interrupts:
+    maxItems: 1
+
+  phys:
+    items:
+      - description: phandle to USB2/HS PHY
+      - description: phandle to USB3/SS PHY
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  resets:
+    maxItems: 1
+
+  vbus-supply:
+    description: A phandle to the regulator supplying the VBUS voltage.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
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
+        interconnects = <&mbus0>;
+        interconnect-names = "dma-mem";
+        interrupts = <125>;
+        phys = <&usb2phy>, <&usb3phy>;
+        phy-names = "usb2-phy", "usb3-phy";
+        resets = <&syscon_apmu 8>;
+        vbus-supply = <&usb3_vbus>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub_2_0: hub@1 {
+            compatible = "usb2109,2817";
+            reg = <1>;
+            vdd-supply = <&usb3_vhub>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio 3 28 1>;
+        };
+
+        hub_3_0: hub@2 {
+            compatible = "usb2109,817";
+            reg = <2>;
+            vdd-supply = <&usb3_vhub>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio 3 28 1>;
+        };
+    };

-- 
2.49.0

