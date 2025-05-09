Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15532550DD;
	Fri,  9 May 2025 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.54.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774235; cv=none; b=VIPTcJceVMrC29G+U6CXv6qRw5wi3YR5yegq8/FA93wwOnDOk86XFQBrJMwlZzapXcwN+hM3ZRtgRsWp4zfjFKpPKS1ub2bu7QsCtStZ5VzwyO8k1XwlxlYheeGLou6QfFoD8cwRwsmxanxMnIibA6DC7sdLfFWjqjH/LMDMjjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774235; c=relaxed/simple;
	bh=WtbcrIowng/eU84Zchl6gZh9rdTCJKpVua+59qwSUwo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=pER6vjd5ZbhKfaO2xP68Z6aBkQTdd//8y4g3V9GqNDHY5CzX3uAoOIjvH1W1kuJYaZD21FA17k+4sxLSQNp3ruVenkgVOtxPQp9pLOTzce5hc8cgwrVfXeT7UBk2uezZFyKUxb/HCZ/+BjkVAMR5lkIiv1faXKghLMGbOctApkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=a78MwHIh; arc=none smtp.client-ip=43.154.54.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="a78MwHIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746774189;
	bh=8NysbQOJ86vuPoT7ltR1OuNDQoX9vHxyNbrDaqkbNVY=;
	h=From:To:Subject:Date:Message-Id;
	b=a78MwHIh4oMbU9C0DBsNVgQ8tqAxxbdfdxNJ2gPC6m02bxq6cDDTdhxd7VcaPBbgr
	 ddVz46Z/yRXCA8KaDRqT3U8loSppJdRPuD8/H2Eg0LvYHaywUH1N+Z+aHZkUy4bvUK
	 qZLpkuzO3ipw0buhZOvYmFyh+I1DuSIrzK83FkAI=
X-QQ-mid: zesmtpsz9t1746774188t8eb6ddc0
X-QQ-Originating-IP: New5mvh2wYiHvAxS/fOyolFMfTZgcP2lZ3Fej2D4xNc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 May 2025 15:03:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5872515443839041301
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
Subject: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
Date: Fri,  9 May 2025 15:02:47 +0800
Message-Id: <20250509070247.868-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250509070247.868-1-kernel@airkyi.com>
References: <20250509070247.868-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: M8JnMGwRo1mQxaI4WBaNvf5vavcAIbh8Xpt0DbTBK3cCd176eYF26gp8
	41DKuTGECcHHTl7aCyZlkpNQtW8HkgKVnCzzQbxsy+91cnk6QwlPP0T9tXo2awVG2I34dYY
	O/2kzu9Lp/hiTyuo4Xvg96pED5uITP/nQqRtBOvG4bn6tNPFFel8Xjo1qDBIYTUABRUfhP9
	yInH7pYfH80EQUzGz6+akPjT5YECIsOY74KBlOEPhWg93QgEqciE/XK4dsAkrR4a6Zx10w/
	M1Uaaec+JzCmiph2YXFdcQmeGAYUwN8N+0vcEJU/Ok0COD4tmGwZ/WNaDvPlEweC9Q8eRYe
	JHod38t2AmKqY0TF3P2g2tM8L5afy4PndnmmQu3AXoMrNT/mNtAmiHLqkZmj7ortf9INlwy
	4/r02Ht4ks578CuHV+DM9BFbVeBRBHCoMxP3w70KGwNSQuARTbEFglIIw0GkkUCo9q8JChU
	cHY2wJm1ClYuXt+8eC80uIWWL0NkKBHGISZhwZc9IBQKOrwNh7p5NUprP2xMUGpmVHYOhWH
	QVjRv+yszkBMTSZsTwoRHlSvbkFMlUvYxFhql6KfMWvIBIOM5ZiLW9Rxvi2LNcYyRqlhaCg
	uXs3cJazqbhEV5AzDE4SjYJJBXGuazbAT9PhUgHJJHan69CNZDSkiTQquB06OWyFb+d/Y1L
	vPxkfuiQQRMYf6AVZaTSWg6SyLA5BBRcB4YePW6x7h3JpaAqI4LiZzjYYQiRU+ZgSvLkpEl
	A4ulFBpoFpQJJ3qTe7RBdqoNM7OtaS9cRsV5TEcF6Z9VV+9g2aUbNdgUxnniC39ko9k3LYb
	cLiyo5oz/SoSJPhuHP/o2SbEv/Dm4pPglf6nwLG/LqrCLWSGsuNlp20V9ww15LNF9kJ5j4k
	UeeE5eoL8oBFh9poDoXWCAeJPn8OWmkKyxFsveESzKAvcsG73Kcq4aKXXLXlXAErtpf5EYR
	VUx6pi44Fe9bd60J5Do/emrRZW4IqduqGu+kaJQ5vE72LEqpQmwxoTzlF0bm77SPashc=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert cdn-dp-rockchip.txt to yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style


 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 158 ++++++++++++++++++
 2 files changed, 158 insertions(+), 74 deletions(-)
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
index 000000000000..99d1f0ad9cda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,cdn-dp.yaml#
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
+    description:
+      Phandle to the extcon device providing the cable state for the DP PHY.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle to the PHY device for DP output.
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
+
+additionalProperties: false
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

