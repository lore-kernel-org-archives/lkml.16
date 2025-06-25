Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782D2D1F6B;
	Wed, 25 Jun 2025 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846153; cv=none; b=t5UIQcYvENmCDheIZNumcW3j6BgUZik7PhinJ8JqVi4EsBR61EdsCNzKMTKmldTfV9uWgiER0ewHOXEhyAHCYzMxfX5oJ0/v+RMTd+WVtckl7neyyYlMVsMZ05FJVniKbl7mAAPo3EGy6U4jnYUCDGsFSvBp6OcCc4kUwwBvc3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846153; c=relaxed/simple;
	bh=HdlGU4uFigU94HS/hpJv4/qyqkW1zpKq6o0RHxR+NtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHx/2uATZoge4Aw4NiMdcYiARfRRCJDCblcwXdtqit51YWTR3RvjHvOy1qPrD8SG9rqrMEx/B3EL90/jZZnt6kTqSNB32yOh7ubUJ3IVtnvQjTBbExt5tqrkPYC+01dNm2NomFJ8Fe2Drtcy769cu137/D98XMSzr2PzLII0l5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DM1bWqg6; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DM1bWqg6"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2E35425C66;
	Wed, 25 Jun 2025 12:09:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndqWISe2pY-j; Wed, 25 Jun 2025 12:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750846148; bh=HdlGU4uFigU94HS/hpJv4/qyqkW1zpKq6o0RHxR+NtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DM1bWqg6lOXQOdCGMQkq4JlVX4iXofjgTkyC0fQo8ItKoIhy0OB0cUgc3VEz90F2L
	 bjYQW5M3qHMHdUG4IVMkZkuh8SjZU/TwIWa4Z6nLXFDfS9Ky7YigzMdSwjmX5tjre0
	 XKucmffrnv/dNcBqd63tDuARQb0ZJSJH7sZUkbV5E02yjjnwP/ra7QkLOYf8L7VCiw
	 AQcDu2wT2po1F7DNW5ZMrArTs3QM1WnK8BbWM4pdf/YfZHQJdRN7wpiPibmRI6Pw6b
	 clX6U2nhXSIsGI4kUKlKd7Oqg+Q8u7sO6OA1RL+RoQEAcYTwQ7LAnVw9Natg0KXLdh
	 7aX/pe2s33/oQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 25 Jun 2025 15:38:44 +0530
Subject: [PATCH v2 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
References: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
In-Reply-To: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750846137; l=2912;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=HdlGU4uFigU94HS/hpJv4/qyqkW1zpKq6o0RHxR+NtE=;
 b=Qlb73GTCc1VHHWnU/DMqqg+miwrpmv0z+IewEwRtojn09RWtgOAYOybJdf/sdI/FuIBZZxt5R
 fAIvSL0ezJLCxrN3pcpmhwZzFd1vZXLZ+wUzfaq/MVMb0PybjttVv53
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the driver for Synaptics TDDI (Touch/Display Integration) panels.
Along with the MIPI-DSI panel, these devices also have an in-built LED
backlight device and a touchscreen, all packed together in a single chip.
Also, add compatibles for supported panels - TD4101 and TD4300.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..10ac24afdfbc43ca6913bf8a343413eed81f12ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/synaptics,td4300-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics TDDI Display Panel Controller
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - syna,td4101-panel
+      - syna,td4300-panel
+
+  reg:
+    maxItems: 1
+
+  vio-supply:
+    description: core I/O voltage supply
+
+  vsn-supply:
+    description: negative voltage supply for analog circuits
+
+  vsp-supply:
+    description: positive voltage supply for analog circuits
+
+  backlight-gpios:
+    maxItems: 1
+    description: backlight enable GPIO
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
+            compatible = "synaptics,td4300-panel";
+            reg = <0>;
+
+            vio-supply = <&panel_vio_reg>;
+            vsn-supply = <&panel_vsn_reg>;
+            vsp-supply = <&panel_vsp_reg>;
+
+            backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&gpd3 4 GPIO_ACTIVE_LOW>;
+
+            width-mm = <68>;
+            height-mm = <121>;
+
+            panel-timing {
+                clock-frequency = <144389520>;
+
+                hactive = <1080>;
+                hsync-len = <4>;
+                hfront-porch = <120>;
+                hback-porch = <32>;
+
+                vactive = <1920>;
+                vsync-len = <2>;
+                vfront-porch = <21>;
+                vback-porch = <4>;
+            };
+        };
+    };
+
+...

-- 
2.49.0

