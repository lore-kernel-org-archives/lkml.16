Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A714E2C2;
	Fri,  7 Feb 2025 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945369; cv=none; b=HoWycsj924TI/6AkqoNd530CVkaj/0/0PtAiDtibmXRBbzGTiKYrF9LfOOAtnQTzomNVZ3JR7qJt3x92qt6xaC/AK50jZKUkvgzfMPYWXW2yO+kpB61/fijb0dlddklTD0YMtIAAripGtGoLlbkBmKuWuh7KCWrgklpfle4wS0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945369; c=relaxed/simple;
	bh=WsW4sJ9uxm43lHLyN92viVq/iZ4gai0sRD6kALPbI0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIxs1kw8ItDChlGhK2qcCfyxFFz5cb+l9BvGYBeN/RePti4Ai5ip15HGclpwjMdeKKiRW8QdOdqJB2WThgi/Vxk7zE9+zPtlBgx5C8EM4Gab85sPxiOhGHLe+zJF6PpZ7zfBXGL0Ifnrn+CzGjmVQANTpi1QnHxVbxEPdqrCaoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GdhLQSCJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GdhLQSCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738945365;
	bh=WsW4sJ9uxm43lHLyN92viVq/iZ4gai0sRD6kALPbI0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GdhLQSCJ4XakKdTJY+JWBBvMw+EUcloUYxms+eNdLMI5rMtu2ZNfxyciKZbwcUeF6
	 ivTWs+y3QDTD6J7Txc8a1b3Pk3r3D5I9x3gkEbHXZVSmh013DIWcfdGoLcIclk6ZrZ
	 SNoAB6gTRwLWQxtyIEHL/iJ4xrjCJjRwIxu60eV6MT7pQlM2Q1Lezt84sjDlbjTj3n
	 kYBZTv+1dTSGjDmAxkZuRZ0Y+T6y/IFfamt3+nb+2loBVRgHO/AlyWWxSX7l36OoLN
	 VXXnrKgWDj/aUxoM4HMKETpQCYeMepYcODmIjLo8KI1oh63A2fR9rhhHYW982UPUGA
	 qC1hdeZrNp66A==
Received: from jupiter.universe (dyndsl-091-248-211-114.ewe-ip-backbone.de [91.248.211.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB88A17E0F9F;
	Fri,  7 Feb 2025 17:22:45 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6A6C4480034; Fri, 07 Feb 2025 17:22:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 07 Feb 2025 17:21:47 +0100
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Raydium RM67200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-raydium-rm67200-v2-1-1fdc927aae82@kernel.org>
References: <20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org>
In-Reply-To: <20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2453; i=sre@kernel.org;
 h=from:subject:message-id; bh=WsW4sJ9uxm43lHLyN92viVq/iZ4gai0sRD6kALPbI0c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGemM1W1N84+1RMvP/knmvl326xAAYuR1IEDq
 Go3GsIPZUPv24kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJnpjNVAAoJENju1/PI
 O/qaUYMP+QFiMbxpJfWrCQRr74eSxmz+yHdqn9K+tnnrfVAcm2X1KKtTIX9FiUc4g8LuRvDMCIH
 ul5xNkEDHpYkEzTOntexLwLXvoTdIr8kNYGXtJB8rFBmtNuus2t3JEKTrHWnV7Fpvbolf4GuPHr
 90ecxBpbqdr/lp6gOE6wjoXBd0p69S+p5zDeLMv+Qc8UUA/iRGCusg41+Db37Kaa7ZNzy74Qa5T
 tNwTXkmf82TaHc2qNETJgiU26raN6lJGz0xcWpl2KclvFAl4Vw+/m/YtB8BGxVH3pTwY0DvDrhk
 u2ncZCjoYLdMLSn39BLfFp2wJmMkezJlb1KCAvElMRLHSRj9J9gfvVMe0cfZGqwHBfu7Cus9I2e
 hM4uRQOt5pEzjlOQdval3sPLreiGmm8o+isB9srqU9OD4O2eKp1Zp0U9k2ejL/INwgqJ4JU0F1z
 7cRelF4EH0l5AS2dp9gJVI2jR7nsAaXEo87a8+7qimu+SQF8151HEyf4K0TvErTXoMELP43RFeb
 90FSNLsCqJO9UC/AVwHmubdogoY5iWdv6u4P2c20IB7wfpJg4qoEwoLLMraLuuQRKbFQKMcIyz4
 2MNgaQ1tLbwK10tRiavEbcn8ADZBZ6hqw14O/4b+zrX3eTBgZcYOWUiOee6FmWum615TTnKpK8f
 O9ONuWnBkbotjbLzuxs8y2A==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The Rockchip W552793DBA-V10 display/touchscreen board contains a
Wanchanglong W552793BAA panel, which in turn is using a Raydium
RM67200 MIPI-DSI controller. Add a DT binding for the DSI panel.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/display/panel/raydium,rm67200.yaml    | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..54c9c0ef45ecc730c722fb152390db4e6c45aab9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm67200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM67200 based MIPI-DSI panels
+
+maintainers:
+  - Sebastian Reichel <sebastian.reichel@collabora.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - wanchanglong,w552793baa
+      - const: raydium,rm67200
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: 2.8V Logic voltage
+
+  iovcc-supply:
+    description: 1.8V IO voltage
+
+  vsp-supply:
+    description: positive 5.5V voltage
+
+  vsn-supply:
+    description: negative 5.5V voltage
+
+  backlight: true
+  port: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "wanchanglong,w552793baa", "raydium,rm67200";
+            reg = <0>;
+
+            vdd-supply = <&regulator1>;
+            iovcc-supply = <&regulator2>;
+            vsp-supply = <&regulator3>;
+            vsn-supply = <&regulator4>;
+            reset-gpios = <&gpiobank 42 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel0_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.47.2

