Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D214426C3A2;
	Wed, 25 Jun 2025 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840310; cv=none; b=sgoGLlRYgdZ+R1bxuD3Ou0bbpVA9XCT5I4jb0Im/F0mjF+9NxevPvxkg46oZWFyNFxk1sAllNp/qFoZdwoAguyh05MsSe/InsYaeKoyGi3FNUkyd9S58l4x7OMzM6mKFTyL5uHQzbIdrJ82VMtC47m5KUKcr6RxA8lD4lTA9Qko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840310; c=relaxed/simple;
	bh=f0JRQMEsVKlGa0ZIRNYll0HpfPGIEpcJG3yvaDfP6WI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p711FKCH9hwtaOB/iWQwMlAAjdyscSWoZSimIdiOPnvDnC+2WaEMNxi7za0zN9uKD3XSl/2AxmzVtffJomhnkwkiUsVBkYuQqdYmga1oLUCf9iw0YyHVanS8dxftqr9vl7aGauGqww51vu9WizIzdgaITeyG2McOn7Dh1Hl5yCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BE5wn33H; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BE5wn33H"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3D8AB2600D;
	Wed, 25 Jun 2025 10:31:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9zCeHefamUn; Wed, 25 Jun 2025 10:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750840306; bh=f0JRQMEsVKlGa0ZIRNYll0HpfPGIEpcJG3yvaDfP6WI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BE5wn33HJSU6KttaeNozm5/WqxD2yuBTrPBbhnqgFZoHueYT0gJhMbAkmkBVkk4az
	 f14KxCn4F4VihwDZ1fesH04XdQRIiBrswsJ/aa0PTqWwZh+LZCgn1HaE+0TPCEYtyT
	 gfozvHeBLhvqlTQr8cdXYEFAC03/MGLmC1zS48xLuR2N2/J8mtcev14L9eEWp52QqN
	 hfhovDEoLAj4aYqhgAoL1LGfqSHZhadvcyS/rvp0+7GLE47vhMiUMiPdC//Khg7Nhy
	 s5e/B6/LIDH7MUhXxWZFx7OBzz/64IWHKfsnVuyFq+nSLZf60XT/mwaTbHwY7VI9do
	 hFRHhjZyrFAag==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 25 Jun 2025 14:01:15 +0530
Subject: [PATCH v2 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-panel-samsung-s6e8aa5x01-v2-1-4db72b87a5a4@disroot.org>
References: <20250625-panel-samsung-s6e8aa5x01-v2-0-4db72b87a5a4@disroot.org>
In-Reply-To: <20250625-panel-samsung-s6e8aa5x01-v2-0-4db72b87a5a4@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750840288; l=2570;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=f0JRQMEsVKlGa0ZIRNYll0HpfPGIEpcJG3yvaDfP6WI=;
 b=0ba8V32EHTcgRN38+l4ZPrfTjF3jDlzW8X/nOPaPj5Ea7hEwMrHLq+4K8Ns7PoUyq0x/sdnRP
 Th9gqxPdafsCZRtjPAUvX+gYPijx4+WtZc+gP6dNogmOiipw/TRenMT
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
compatible and devicetree properties of this panel driver. Timings are
provided through the devicetree node as panels are available in
different sizes.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/panel/samsung,s6e8aa5x01.yaml | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..23dae6e961ae01c99de93bf4b4a067f2953f8edf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa5x01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E8AA5X01 display panel controller
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8aa5x01
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: core voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
+
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,s6e8aa5x01";
+            reg = <0>;
+
+            vdd-supply = <&panel_vdd_reg>;
+            vci-supply = <&panel_vci_reg>;
+
+            reset-gpios = <&gpd3 4 GPIO_ACTIVE_HIGH>;
+
+            width-mm = <62>;
+            height-mm = <128>;
+
+            panel-timing {
+                clock-frequency = <73094400>;
+
+                hactive = <720>;
+                hsync-len = <2>;
+                hfront-porch = <62>;
+                hback-porch = <26>;
+
+                vactive = <1480>;
+                vsync-len = <2>;
+                vfront-porch = <12>;
+                vback-porch = <10>;
+            };
+        };
+    };
+
+...

-- 
2.49.0

