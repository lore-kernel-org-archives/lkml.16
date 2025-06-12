Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED426D4FB;
	Thu, 12 Jun 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739985; cv=none; b=HWUs5ZJgnMsYgwqHpeX/9T3JSgt/xgpBgilI6I3n6ltpG7NC/xUwdzTixC4p9pAxkydiHc1cVGONO/X+0j6oKEEmbDOzPp7yNWL3dJrcupPM5hjGImkTZ6uLE+6C94jU3djhTDesBRIRYuTIk82YISoN6NVC04GKaPkSSarzytA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739985; c=relaxed/simple;
	bh=+GGuTIftP9Os/S9WTRfml4uTN5de9NhqJE+FVI1Q4vM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORly0e2+t0iMxGtEFJozRDsEGORqD6PL/O90j1doEEajofu4Ywn7Y6njOTW5mtg9EsUbRTwY85cRGLLldll3VfTqhJ/XYdD4ybwcAdLYMf7uBjM3gATWcAWIEiutDrqVqT4jLruhG49wqqImzcRgZUm9sc6OyvHD9b3987659Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gLQR633x; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gLQR633x"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2EFB025F8B;
	Thu, 12 Jun 2025 16:53:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybeNELFMBll6; Thu, 12 Jun 2025 16:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749739981; bh=+GGuTIftP9Os/S9WTRfml4uTN5de9NhqJE+FVI1Q4vM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gLQR633xNlqt2vLpfYdjiGy15XlEQtheiPcCA3qjvl3yW6Zo15xig1d4GKWUWRG68
	 ex4WmttlJ9PLwhXY5P42IoPfirk26voCcRggpJj5qbTYq16G2KgwRq9xagKHbQDtWn
	 vOUGlj8U1EOg5rDr8+7yDW+v2A+Kbovn2/CBs1a/ZersJE+Ea3b7MZKW37RUTtsLb7
	 NLdyW1CBS06P4J3M69R56g2+Iqf4heoKeoZs449uAkOQ+cZg72lFiLNGDNuA4dTHCq
	 yy9U6EzOZVEz4k3b2ZtF9YrenJb0M18wWDMaT/EsEVWVWbXqYthYr7vtMBgtOnpGwS
	 sWVYulJ7Ad54g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:22:41 +0530
Subject: [PATCH 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
In-Reply-To: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749739970; l=2550;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=+GGuTIftP9Os/S9WTRfml4uTN5de9NhqJE+FVI1Q4vM=;
 b=ij0RkMY9rm3qQxLpHc5+eHhhmvg6d4bJ7ut3wUq0Bm0uJbyAl8pjEwqxTx5uwWNZHF8anX13k
 44x4ZcCPvmbC5e5Vs9rftkXYdhxoVE9hDSZnyUF8aEoi2xV7+jJO9nt
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
compatible and devicetree properties of this panel driver. Timings are
provided through the devicetree node as panels are available in
different sizes.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/panel/samsung,s6e8aa5x01.yaml | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..909f43a49434af94c90ee64a3171d44645cd9dc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#
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
+    maxItems: 1
+    description: core voltage supply
+
+  vci-supply:
+    maxItems: 1
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

