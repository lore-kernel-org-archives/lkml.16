Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C26257AD1;
	Tue, 20 May 2025 02:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709320; cv=none; b=XaqGCa4ZGV8JorEsPl5w5M0LH2zV9uTaG7117wezonDtNvA0419C9AiCYbisAflqdHvP/3678XqyzyMvcfD6sJDutyZI1hIWBriBHnCA58TD3R6VlPCk1lcTfPIYFvtT0STie6dhrEfND00B3vGL2s4mu6kHCX7VbdEHxeVqHvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709320; c=relaxed/simple;
	bh=kXx1mHnQyVCB0kq7XXxiyAX/o8QtjHcPyHUNZC9gCPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=pJmudvhlJXt4dY2VTbpPa8VIIOHt/tqmJNo3zQA2eQJZ79cpKgK4/Vr3yFh5tl/3nWHfgI8C1r266qc37208r8RfgINhlh3tu4jo9mkXY1Yl3Eu4WnuYXxC1tJEg56sduYF4kEBG7PAdWwN36RLdHK9yRzlsLnYi8WGPeiVHG0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=hZILU21v; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="hZILU21v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747709279;
	bh=0FmmGTT7/kkpo68LJtWYV6x4TUVBTBuFVK+exAKFKeg=;
	h=From:To:Subject:Date:Message-Id;
	b=hZILU21vfhR4lSohELg9hcdh+ySZFFlZfht9yoouDIvJIZEi/FW7eK62x2M3FElTm
	 9pqko348SaHwIgHF++oc4o+BAywLb+YEd7T3RAoGHaLF3jI90kIl4LKpaNFWKkNQDu
	 KuPvxo3g1ou/9w9Ikk9bDyT927mmOQscjEeDQ7Z4=
X-QQ-mid: zesmtpgz1t1747709277t3ccaccd6
X-QQ-Originating-IP: WX5ZmZyYWICN6Vqork4Xt6+hfJpYFO7s+3xRsU6gpoA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:47:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15235635931531597864
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
Date: Tue, 20 May 2025 10:47:18 +0800
Message-Id: <20250520024718.142-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250520024718.142-1-kernel@airkyi.com>
References: <20250520024718.142-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MmpliBmRb3iC3JDiFEMN5aU+weuBeojLZVEwIXrmSCjNsYV6rOZQ2S15
	oBhZmVONFJbc3t6hXqRcto883+BuZuJhBLuhS6Utqd8n5rt2QBPdWbW2d/xWtQX4NRbcTMy
	LDNt2t8Ajnta72NrWGKCas3ezXBDo2pWD7DHpGO6T5df8dra8IrGyLphGwys8uIy/YNYhOh
	/YJHvYY0QYAr/6LuqqCHwO2H57E5/s+HbUOWV01jUY6OqKGm2pavAD44TnzEIUTIwpv9Pmq
	XnbfYY3CT+fyvpYr9c62HCQG3x7emXhwbmPpcw5o9qOXN7ktX4LvL7CM4/zbTcdwNImOdft
	mEuBJ79sVHaeGdYeaBJn8Wzi/oH7r27Zg6q/9o9LaB18IJqXwrKo1HpY96N4V645IrVJviI
	PkGcN6Rt0dWzoa1c6liT5usimTuxvNWz2S4InO6PZO8gjkyxmkRg2rySvJSZaEJdm9FrmXJ
	VY1gf3vqCwkcH5XM8W9p/Kg3nG03MILlJyxswJ3ioIPti3Z7lVz+nU2xDpByq6cNRNx+4+A
	b1wbP2Zodq8fvyIr8i4FBIXQQYen9tEwkVH1jz9VlIXQxpwMvDSQwHGO+GPASr6z1obQsAE
	zD8oKYWE3klknENSHfm4sID+Gyg8Homrm29jtcUNlsHH/t/d1pzOSTJMKbpWIJ/S5C+2SJY
	u4LNMocVMQl1QlDaMQ5YJdFv2IYD5eHGTOXbloSY+jexnx02+DVqJ52iS1pQtHWTuEIrq7i
	tqnGhCEgicggpYt0tGNXoMN6xOev5BsBK6PAg+21+HTJndbgyV1XGYOwHzB7UXA+QF9F9BO
	Hxts/Ro8dYnSE7t8ZOt/3tvwK75qHxdz1UL1tgeurhfan09qf0bANnds4kVcCSVpyGsnARH
	vYhjN97CO/P/zOTlO+JtsNSIf08GUfgOp2Jz6NdhzOlSRzYh4VJY+LY8RuqQ2nJYAArLIj3
	0P19/o4qxEZYBr6VrFlXlwSlFv49pkzVfVfzN7ytq0HRhUtNrx1csyEzh0WrmHK7HoICUu6
	H5ELRe9H9GU/Feg9x/
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert cdn-dp-rockchip.txt to yaml.

Add new "port@1" property which represents the CDN DP output to keep
the same style as the other display interfaces.

This patch also changes the constraints for "phys" and "extcon". For
the original binding, only one phy and the corresponding extcon can
be specified. In the new binding, one or two phys can be specified.
Since the RK3399 has two DP-USB PHYs, specifying one allows output
via the corresponding PHY, while specifying two lets the driver
choose one PHY for output. This rule also applies to extcon, which
provides the cable state for the corresponding PHY.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v5:
- Fix constraints on extcon and phys
- Add commit about changes to extcon and phys
- Add "#sound-dai-cells" to required properties

Changes in v4:
- Add commit about port@1 node

Changes in v3:
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 168 ++++++++++++++++++
 2 files changed, 168 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
deleted file mode 100644
index 8df7d2e393d6..000000000000
--- a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Rockchip RK3399 specific extensions to the cdn Display Port
-================================
-
-Required properties:
-- compatible: must be "rockchip,rk3399-cdn-dp"
-
-- reg: physical base address of the controller and length
-
-- clocks: from common clock binding: handle to dp clock.
-
-- clock-names: from common clock binding:
-	       Required elements: "core-clk" "pclk" "spdif" "grf"
-
-- resets : a list of phandle + reset specifier pairs
-- reset-names : string of reset names
-		Required elements: "apb", "core", "dptx", "spdif"
-- power-domains : power-domain property defined with a phandle
-		  to respective power domain.
-- assigned-clocks: main clock, should be <&cru SCLK_DP_CORE>
-- assigned-clock-rates : the DP core clk frequency, shall be: 100000000
-
-- rockchip,grf: this soc should set GRF regs, so need get grf here.
-
-- ports: contain a port nodes with endpoint definitions as defined in
-	 Documentation/devicetree/bindings/media/video-interfaces.txt.
-	 contained 2 endpoints, connecting to the output of vop.
-
-- phys: from general PHY binding: the phandle for the PHY device.
-
-- extcon: extcon specifier for the Power Delivery
-
-- #sound-dai-cells = it must be 1 if your system is using 2 DAIs: I2S, SPDIF
-
--------------------------------------------------------------------------------
-
-Example:
-	cdn_dp: dp@fec00000 {
-		compatible = "rockchip,rk3399-cdn-dp";
-		reg = <0x0 0xfec00000 0x0 0x100000>;
-		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
-			 <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
-		clock-names = "core-clk", "pclk", "spdif", "grf";
-		assigned-clocks = <&cru SCLK_DP_CORE>;
-		assigned-clock-rates = <100000000>;
-		power-domains = <&power RK3399_PD_HDCP>;
-		phys = <&tcphy0_dp>, <&tcphy1_dp>;
-		resets = <&cru SRST_DPTX_SPDIF_REC>;
-		reset-names = "spdif";
-		extcon = <&fusb0>, <&fusb1>;
-		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		#sound-dai-cells = <1>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			dp_in: port {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				dp_in_vopb: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vopb_out_dp>;
-				};
-
-				dp_in_vopl: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vopl_out_dp>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
new file mode 100644
index 000000000000..5649e008f14a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3399 specific extensions to the CDN Display Port
+
+maintainers:
+  - Andy Yan <andy.yan@rock-chip.com>
+  - Heiko Stuebner <heiko@sntech.de>
+  - Sandy Huang <hjc@rock-chips.com>
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3399-cdn-dp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DP core work clock
+      - description: APB clock
+      - description: SPDIF interface clock
+      - description: GRF clock
+
+  clock-names:
+    items:
+      - const: core-clk
+      - const: pclk
+      - const: spdif
+      - const: grf
+
+  extcon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    items:
+      - description: Extcon device providing the cable state for DP PHY device 0
+      - description: Extcon device providing the cable state for DP PHY device 1
+    description:
+      List of phandle to the extcon device providing the cable state for the DP PHY.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    items:
+      - description: DP output to the DP PHY device 0
+      - description: DP output to the DP PHY deivce 1
+    description: |
+      List of phandle to the PHY device for DP output.
+      RK3399 have two DP-USB PHY, specifying one PHY which want to use,
+      or specify two PHYs here to let the driver determine which PHY to use.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input of the CDN DP
+        properties:
+          endpoint@0:
+            description: Connection to the VOPB
+          endpoint@1:
+            description: Connection to the VOPL
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output of the CDN DP
+
+    required:
+      - port@0
+      - port@1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: spdif
+      - const: dptx
+      - const: apb
+      - const: core
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to GRF register to control HPD.
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - ports
+  - resets
+  - reset-names
+  - rockchip,grf
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dp@fec00000 {
+            compatible = "rockchip,rk3399-cdn-dp";
+            reg = <0x0 0xfec00000 0x0 0x100000>;
+            assigned-clocks = <&cru SCLK_DP_CORE>;
+            assigned-clock-rates = <100000000>;
+            interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>, <&cru SCLK_SPDIF_REC_DPTX>,
+                    <&cru PCLK_VIO_GRF>;
+            clock-names = "core-clk", "pclk", "spdif", "grf";
+            power-domains = <&power RK3399_PD_HDCP>;
+            phys = <&tcphy0_dp>, <&tcphy1_dp>;
+            resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
+                    <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
+            reset-names = "spdif", "dptx", "apb", "core";
+            rockchip,grf = <&grf>;
+            #sound-dai-cells = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                dp_in: port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    dp_in_vopb: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&vopb_out_dp>;
+                    };
+
+                    dp_in_vopl: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&vopl_out_dp>;
+                    };
+                };
+
+                dp_out: port@1 {
+                    reg = <1>;
+                };
+            };
+        };
+    };
--
2.49.0

