Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6035F17A2F0;
	Thu,  8 May 2025 06:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686661; cv=none; b=HkfFPmIB/YjdgewrtqIKLCDkfK1GHank/+Vz3kK0MRebPv29ssZ1yDJcyMTk823IVVplUIGWJKD9LINYiduhmm3XCjt8NdBKcGFdHWcw34LXV5mDru5M2Kp20Q+FnuTOqFhLgkCuU36s30ZH9IkgH+CcLEpBtD3efTjajwltLls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686661; c=relaxed/simple;
	bh=iJW6WOHNtWwu4D33uyz/a7pPIbuQhMzzj5nZUW+PiE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GxKrscB1CONmjkFgeTwtphFqVe0K7bmoIL6KB1uk50GE3jvST0wiz9DZvkCa2Lb0LqtBXzBNW8C4KwNN60n/PDRj6vy047V5pYuQ/bHesdzjd1f4zj6gAxBsMJPesi4YcUpWT5VW1b901DPlARsF7YHeMueHzkpogj187nJve7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=C19ZUcTz; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="C19ZUcTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746686616;
	bh=S38gIegyImzSiPrPTJZbZJbHNkJdghgnHdGNsjdUcdY=;
	h=From:To:Subject:Date:Message-Id;
	b=C19ZUcTzKIfhaexVnl4JUB9Ja60eg5kPNE9KoaBFDReYt+lhTBMwaPxiR0pJs2GqO
	 pNqh49+OuHbSWe9o0O8Lr+bxOsHjQYdBDVfUJ96U4CQXLn8uIJrsDnO1gw3JPaOHlw
	 Q8y/bG5S2SSMCyjxE8pGAv9ORo3wQNpOmKm7cNfU=
X-QQ-mid: esmtpsz18t1746686615t934238f6
X-QQ-Originating-IP: 6QePaabhGr3rW48lbWk1i7+S8T1BOSY7MRS+ZtJxtzw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 May 2025 14:43:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16256494491489308250
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
Subject: [PATCH 2/2] dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
Date: Thu,  8 May 2025 14:43:04 +0800
Message-Id: <20250508064304.670-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250508064304.670-1-kernel@airkyi.com>
References: <20250508064304.670-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MN7J+qOXnZ1LC2rHDFipWslgoSnqa12WgIq5OFE7T5CnvQygjVvLtPOz
	34z4g/G9c6Bz2zSN9IWW2dtlILMVqZUuVpfFpRnYER0GVTZluIS8NoJgI4+I7x3O8ACv17D
	ygDmpUbZ1K4KHwBwGmbVlEIaCw+TwGpVv/18qZ1aIvSh23CNPOc9361Cmwm4OAj2NFNCKTw
	u28d7uoc4XpcUVtEGg/Y10Htm4i5vF+zLYaYxkw1T/HAPF3FPG+ddADvdn8AI5hQfBAJ1yR
	rDBHnTKXH0+OMpgNrwgEk+jcIMfXgcvJz2xci4ITCYxeC4bVDGzGcl7axDygcYcWcnjHuS7
	eS1FHY/JKF3JRPLDjfcBta73qlJOX2T3cvK6RPDM1dyl9oHN14xmK7wSJDdA2BDPXpW/sNm
	wuAuswVyBAPPyp3cxZmYrU+WEWQEeeQnhgmiq5Hqu5IyO5wAWTjtOHzmLZf7t4AHUCmMoQ2
	gqUs3Ys6A84V2NHL6PqI9RrBB9e03ZA800pFwB57vDBhr8ALcoC+km9Y2Nh6SqHlvjymonv
	fMRCSTidxAZnOadpLIWOyKHsKN0GZVllC1/niUn6yxMv6s8I7z29sM+fk+FjJA4oJSPitga
	ykBWlz2Jlybhk5R9kdXPd5pRggBDU66vTenAwHryRhknLZhRg5RBZZsGysESH4f75t8xW1A
	Q4CpwR3Ox3WD53hK4LOyqI3nuozPLk7FEKjipwSeunDL8Q2cEPpq2HMJ9BN+vvGYMswNeHz
	1pxQqpNMFXrbZXZ/Fsorf6xuN8puXtFvDPMNoyJfOoqOuT4mbXrOGfqyM4jaYu/GDMkwcmX
	uB+bKMQjk66GROAx55iDXNYpD1IqTTnYWyQmHmZ4DqSuefX6b5Y4Q633iYG3xAzyofOyD9I
	Lg0pApPOnai0jkvm0ERghjvIP52JT98z31ddueWW2o08u4UGzm+alYO6dZwOWB2+v/v9T1p
	t9cRaRB+mRBCG92dz7sXNhGoh/BJB+uWO6BTeoru44MlNynosFzXdn9AV
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert cdn-dp-rockchip.txt to yaml.

Tested with:

1. make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

2. make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../display/rockchip/cdn-dp-rockchip.txt      |  74 ---------
 .../display/rockchip/rockchip,cdn-dp.yaml     | 148 ++++++++++++++++++
 2 files changed, 148 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

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
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
new file mode 100644
index 000000000000..ed68b48a6743
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
@@ -0,0 +1,148 @@
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
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3399-cdn-dp
+
+  reg:
+    description:
+      CDN DP core register
+
+  assigned-clock-rates: true
+  assigned-clocks: true
+
+  clocks:
+    minItems: 4
+
+  clock-names:
+    items:
+      - const: core-clk
+      - const: pclk
+      - const: spdif
+      - const: grf
+
+  extcon:
+    description:
+      Phandle to the extcon device providing the cable state for the DP phy.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
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
+    minItems: 4
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
+      This SoC makes use of GRF regs.
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
+    cdn_dp: dp@fec00000 {
+        compatible = "rockchip,rk3399-cdn-dp";
+        reg = <0x0 0xfec00000 0x0 0x100000>;
+        assigned-clocks = <&cru SCLK_DP_CORE>;
+        assigned-clock-rates = <100000000>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>, <&cru SCLK_SPDIF_REC_DPTX>,
+                <&cru PCLK_VIO_GRF>;
+        clock-names = "core-clk", "pclk", "spdif", "grf";
+        power-domains = <&power RK3399_PD_HDCP>;
+        phys = <&tcphy0_dp>, <&tcphy1_dp>;
+        resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
+                <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
+        reset-names = "spdif", "dptx", "apb", "core";
+        rockchip,grf = <&grf>;
+        #sound-dai-cells = <1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            dp_in: port@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                dp_in_vopb: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&vopb_out_dp>;
+                };
+
+                dp_in_vopl: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&vopl_out_dp>;
+                };
+            };
+
+            dp_out: port@1 {
+                reg = <1>;
+            };
+        };
+    };
--
2.49.0

