Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CD61F09BF;
	Thu, 10 Apr 2025 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314076; cv=pass; b=dcm5EUqlUgHFuA24Q0mYem0TDeNHXCkWyKpYdWHAK12nJgDUlcc0WM1K8bs5Qg2s76m9QMj1xyp7ZS0wQScuQCR6fazM4buRjC7xEsqpWDQlt5aAEu3GyR9FiN0k3dz4kxVuj0TSgp1ku3ICK4TufTiaAC12XhsgIEg2wKa/PDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314076; c=relaxed/simple;
	bh=HerB7egG8wdD8mLG3TEsS8OYvBih5S0suenGSbfFxyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Si4ID0tXHhmbmur3LCptz7lL9yUOwfIWXZsDO0JtZxn/ES4R9DQbPQr8BZxh4kwz63eWMM7gypx+cwQ2D1lYXjxmCARbasFRhF/BsRbJvrJrqHJ15s1oy6tHoSpVt4MqihpbLEMuUC1ZvIGFj49we3Mz0C3EZmBGx3/KBavWPcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Jk0yeFYY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Jk0yeFYY"
ARC-Seal: i=1; a=rsa-sha256; t=1744314043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fBJ6R9yCr0/Ln8eBmb6Kl1hQt6Sqos2Z3bpRrWX6vPsGGj/VLVd+gqMqrVXLqC9uvfBCQwENfRztNDeHul3/dFM96c2lqaD/M0KhgJCNBFzsLnojfjaPECwzcYfBQay6x0RjeSy5nfakHzZJcWpSWMipBpOjDXdXdN8fr17TzxA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314043; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U1u4zTe2vGBhpFEm2Hrof0M+T3ZkWuuLGGTGSoUl7+Y=; 
	b=b48p/Jk247HX5ZxJtnUhrSIjkGl5j3esqQD5pL9IGL8jc9MIfAFhfS7rzgjwfai82Mb7W9xploAot7dvQTDAXCz2zpkMWuonBr6Zia776E0AIG/0drAK2a9WkX0/7bntW2wxpxJYYEnRBb3d8BDGRGHbOBUmUJP2j1QJ702nC5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314043;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=U1u4zTe2vGBhpFEm2Hrof0M+T3ZkWuuLGGTGSoUl7+Y=;
	b=Jk0yeFYYhgRjozwb0ko7Eg9mypMX9L+T4cBDyl0bfe3NWSY8XM9++5EfIjHo0F65
	A3rG/7E66E9GUDIVTV625cK7y2BLS4+I9B9p3F1Mg4iR8b5ixxO7mX1dAZjD2UdHPOG
	K+3AQoG8LeJAqHgJd/k2LTiWAFng0D+FMMOyLKnE=
Received: by mx.zohomail.com with SMTPS id 1744314041130428.8987154701755;
	Thu, 10 Apr 2025 12:40:41 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:39:57 +0200
Subject: [PATCH v2 05/11] ASoC: dt-bindings: add schema for rockchip SAI
 controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-5-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

Rockchip introduced a new audio controller called the "Serial Audio
Interface", or "SAI" for short, on some of their newer SoCs. In
particular, this controller is used several times on the RK3576 SoC.

Add a schema for it, with only an RK3576 compatible for now. Other SoCs
may follow as mainline support for them lands.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/sound/rockchip,rk3576-sai.yaml        | 144 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..149da9a91451f202aa241f0854d9f54514cae8a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3576-sai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Serial Audio Interface Controller
+
+description:
+  The Rockchip Serial Audio Interface (SAI) controller is a flexible audio
+  controller that implements the I2S, I2S/TDM and the PDM standards.
+
+maintainers:
+  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: rockchip,rk3576-sai
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [tx, rx]
+      - const: rx
+
+  clocks:
+    items:
+      - description: master audio clock
+      - description: AHB clock driving the interface
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: hclk
+
+  resets:
+    minItems: 1
+    items:
+      - description: reset for the mclk domain
+      - description: reset for the hclk domain
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: m
+      - const: h
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+  power-domains:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  rockchip,sai-rx-route:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Defines the mapping of the controller's SDI ports to actual input lanes,
+      as well as the number of input lanes.
+      rockchip,sai-rx-route = <3> would mean sdi3 is receiving from data0, and
+      that there is only one receiving lane.
+      This property's absence is to be understood as only one receiving lane
+      being used if the controller has capture capabilities.
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 3
+
+  rockchip,sai-tx-route:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Defines the mapping of the controller's SDO ports to actual output lanes,
+      as well as the number of output lanes.
+      rockchip,sai-tx-route = <3> would mean sdo3 is sending to data0, and
+      that there is only one transmitting lane.
+      This property's absence is to be understood as only one transmitting lane
+      being used if the controller has playback capabilities.
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 3
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+    #include <dt-bindings/power/rockchip,rk3576-power.h>
+    #include <dt-bindings/reset/rockchip,rk3576-cru.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        sai1: sai@2a610000 {
+            compatible = "rockchip,rk3576-sai";
+            reg = <0x0 0x2a610000 0x0 0x1000>;
+            interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru MCLK_SAI1_8CH>, <&cru HCLK_SAI1_8CH>;
+            clock-names = "mclk", "hclk";
+            dmas = <&dmac0 2>, <&dmac0 3>;
+            dma-names = "tx", "rx";
+            power-domains = <&power RK3576_PD_AUDIO>;
+            resets = <&cru SRST_M_SAI1_8CH>, <&cru SRST_H_SAI1_8CH>;
+            reset-names = "m", "h";
+            pinctrl-names = "default";
+            pinctrl-0 = <&sai1m0_lrck
+                         &sai1m0_sclk
+                         &sai1m0_sdi0
+                         &sai1m0_sdo0
+                         &sai1m0_sdo1
+                         &sai1m0_sdo2
+                         &sai1m0_sdo3>;
+            rockchip,sai-tx-route = <3 1 2 0>;
+            #sound-dai-cells = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..fef80aecabab25b2855311174607d05b3cffed45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20910,6 +20910,12 @@ F:	Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
 F:	sound/soc/codecs/rk3308_codec.c
 F:	sound/soc/codecs/rk3308_codec.h
 
+ROCKCHIP SAI DRIVER
+M:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
+
 ROCKCHIP VIDEO DECODER DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org

-- 
2.49.0

