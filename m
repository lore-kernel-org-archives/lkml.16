Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB4A1FA165;
	Tue, 11 Feb 2025 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274279; cv=none; b=egWRmIVv/0XTlBcf9urmNGwR4wlRE6gVqRTxUV+acyULKdFCZgpIoc7dwNX2uir5SuVwFm+MfUmyDhyT4A+uwBVwI2mAPZWWo2Q7WkbcHYYlRypyLFR10KWj8ycUGIEKJNJ/K+5nad4j7qH6AWgoG7I5LKUuNX2eUyJoOrB1Crc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274279; c=relaxed/simple;
	bh=1blVE50JLGY1NZ5lRXIT4Y/pMISIL1X/dC/cJ9LqPAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrLg4youpbJaDk2kMmvoaUD8AJU9r4RBW4sJNwQLWVa1HLrf31cQlLP/caT/PCfN2bPhiOKg5A/LCdNFhuMoMGj55PyfVjRVEU2GM6OsVN7PD9zRpFTwhbpLAss8aWLppAATgINjrA9wBUOse4/g48NGAvMzpylV2KlHFm2tB2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kOpRjjYM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kOpRjjYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739274273;
	bh=1blVE50JLGY1NZ5lRXIT4Y/pMISIL1X/dC/cJ9LqPAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kOpRjjYMhtXgmXvG9+mO0EsEoYtOddONqEUsg0WFZbS6kB5sl6TslmYIDiusbBKlz
	 1LfsUCMCBxHfF24s+nBN96Q6KVmCrrl4K4bwUQGP3nJJ0lQBK8YmLU+BrQOWZKk+YD
	 //FIIbQHyC9ldmrdRn7IMVJewkLgQY20aPE1AfEUhCwPfrOPW48QwJvuLnBi+qOfrF
	 WnDgJ/xCEesQD2tTe7NbzDax+HSURlOpYReSWALchDxoXp8vZ9ldPh/4+TCg3y8Uxy
	 OCuSmnmQ7Ulak6lCfi44PirH4K879HSNWRAbojJNSFVoa6GfeG0IfESQwlgw9Uok0H
	 iApzGPgvDWsWw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC3AC17E1539;
	Tue, 11 Feb 2025 12:44:32 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 1/2] dt-bindings: display: panel: Add Himax HX8279/HX8279-D
Date: Tue, 11 Feb 2025 12:44:28 +0100
Message-ID: <20250211114429.1519148-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211114429.1519148-1-angelogioacchino.delregno@collabora.com>
References: <20250211114429.1519148-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Himax HX8279 is a Display DriverIC suitable for driving LCD
MIPI-DSI panels.

Describe this DriverIC and the Startek KD070FHFID078 panel found
on newer revisions of the MediaTek Genio 510/700/1200 Evaluation
Kits (EVK).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/panel/himax,hx8279.yaml  | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
new file mode 100644
index 000000000000..d66191398f50
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx8279.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX8279/HX8279-D based MIPI-DSI panels
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The Himax HX8279 is a 1803 channel outputs source driver with MIPI
+  TCON, which generates the horizontal and vertical control timing to
+  the source and gate drivers.
+  This DriverIC is most suitable for 1200x1920, 1080x1920, 1200x1600,
+  and 600x1024 panels and outputs full RGB888 over two or four lanes,
+  single or dual, MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - startek,kd070fhfid078
+      - const: himax,hx8279
+
+  reg:
+    maxItems: 1
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  vdd-supply:
+    description: Panel power supply
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - reset-gpios
+  - iovcc-supply
+  - vdd-supply
+
+unevaluatedProperties: false
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
+            compatible = "startek,kd070fhfid078", "himax,hx8279";
+            reg = <0>;
+            backlight = <&backlight>;
+            enable-gpios = <&pio 25 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            iovcc-supply = <&vreg_lcm_vio>;
+            vdd-supply = <&vreg_lcm_vdd>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.48.1

