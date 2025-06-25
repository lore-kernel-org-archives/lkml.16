Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A8260579;
	Wed, 25 Jun 2025 12:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855311; cv=none; b=NjIncBCGHlwzm5BfZK93ilIA+OZB7aLogI9d91xDJRy95/qBub5zQAewmfX2LWdf7tEQdBD3zbjDj+KdBLy4t200+Q8+2SDGN8VMku166xrCN32tZKuvj8T8+sCV83wU3Bl6FmNDeHB+39FZ6JjrRTCivUDV4iBonXfXP2vvnY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855311; c=relaxed/simple;
	bh=f0JRQMEsVKlGa0ZIRNYll0HpfPGIEpcJG3yvaDfP6WI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTIQM8j+un6OEkdGIvMgiZACJHWl5ZeSN7dIUt2XUUWqt2hw+wKyy+bFz//6hR+FtM0difiSFfKpPhm4F8xlPntulrIO05vpsXUv4xCtaSczq75hgl4BEo20+nBK4HYh3v33sa8xgAQXFAjAItEo8ojJQrk1aTxRFHSQ/3I316k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Lmus5BIf; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Lmus5BIf"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4288A22E77;
	Wed, 25 Jun 2025 14:41:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WDmWBds7S-4; Wed, 25 Jun 2025 14:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750855306; bh=f0JRQMEsVKlGa0ZIRNYll0HpfPGIEpcJG3yvaDfP6WI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Lmus5BIfu4fCaYB498+Tsaiv8pmWviBNbjtU0Uv3Bbuaq6c6KFcXbalhpMFAHowL1
	 QsPy3HAqg79mDcFOKtnOjT6/QYyyKnreVpjJibmMn6QPyEmcwnSn0bzUBZWRTEueqR
	 LHJWZlOQzK0eU0qDZach4VQ1WbG1L3vNlyQ5DfUwmuzw5T4NhlT4edxIjWPULVxsDY
	 sqykfO9N/N9DITn2CEjj8Sr1SOQR9jauBjZmOnB1YE/6KpEGOu5NlPaP62Y1t+FSbr
	 tmvntRqKs8ZJFUZya9LG2WY0LEaaL8PCOHZKHB7KW2jtk9lnoAoVz4s9J4qmDcXKI7
	 RlfY3XEvs6WeQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 25 Jun 2025 18:11:25 +0530
Subject: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
References: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
In-Reply-To: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750855293; l=2570;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=f0JRQMEsVKlGa0ZIRNYll0HpfPGIEpcJG3yvaDfP6WI=;
 b=4gHZ6p02DoCgctAauhiZwhxESjSXoNuWs9dHjGDbREvcKPo06rNCwzzAEZKoh89R7Z+uiSsfS
 LHQ6zn1SZg0AuWYde1ucVbWe5Hpgrme6LLsnr68rt0T3CyQLG/d8x0n
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

