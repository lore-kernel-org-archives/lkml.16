Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA394209F38;
	Tue, 29 Apr 2025 21:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962408; cv=none; b=VGVg3rtOWfoEJFrQ/plisTWbkByFJwlT7Scl9tG2HHrLVk5JTc30MFp4ViTuG9kSLpEADbQuYckrclgZiRbNHopLrTEDS84OazY+RwZKjRqVE6ADt64Ke+GGu/w3DQjqclEDOy4NDvYAAwUIquDUt6r8k5g5PEm3DxzYEr20tbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962408; c=relaxed/simple;
	bh=6mxHfDNN6d54IDqPzz076/so/02XPohT9GkMaAdXVBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLPVGPui6K1wFlGmxO2mmirdwxNna7IRxpb4YM5c9YMg7vT+dTgSQRLpGuRH4QEnDsKYVQPaJdbw87mSbavPj/VkwzL2eCiqdSJfg7O6crUFqeHXXQr0dxmyiheEDTrcENXtIb7ltH1WXBODSmUzOiffNpCCUlne2iyYwGrPejY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=q9n274RZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="q9n274RZ"
Received: from [192.168.78.162] (254C2A1C.nat.pool.telekom.hu [37.76.42.28])
	by mail.mainlining.org (Postfix) with ESMTPSA id C3547BBEE6;
	Tue, 29 Apr 2025 21:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745962398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95GjtIoWmh+5x+UcRGDdFxUlqj3e+LKZ1ibB4skVWd4=;
	b=q9n274RZE9o6iqOFA6fWnTdj3+tIcJFUrwPJ4fqUVToNOUd4xfh8FR6WdqZq3l5AE8H9Sn
	tJKiVAwgb4ce5WBNXrA7C+mLVB0uIWxWhOIO4tVOvm5/C4FTiznLwGI+K2nTE7Ys4b/Oi1
	JChE8b9A1+WECmBmb7i9GyG2ojLdm1kWZQSnmeFLOBY7ZWgywolX9TlGCiYnRpa82gl5jr
	y79P5gp+mB5v+nqz3vZ1qTis6q9v+yjbMYvTlKfCJ3K0j9K1X39Nh66j39IGy+ZhfWYdVE
	t7ZfY1Lun0M3e+Jxt/BF+ieJHPR9NsTeHd6KnHnbJcM47zByfSuvOdkmDtra9w==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 29 Apr 2025 23:33:14 +0200
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add BOE TD4320
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-lavender-panel-v2-1-fb467ff81bac@mainlining.org>
References: <20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org>
In-Reply-To: <20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745962395; l=2014;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=6mxHfDNN6d54IDqPzz076/so/02XPohT9GkMaAdXVBM=;
 b=orbLsEjiaS/LkLTeDWiJk9qhrpEiV6rQ0NggtJfqxvbV2Z59YBm4cRBr85+AT7PjpSvq4YRo8
 Y/M0OzhszhVAbD9pryHNj+SKvzMhU4G7e+s9G9kWPyI0WFxUc7UkonI
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document BOE TD4320 6.3" 2340x1080 panel
found in Xiaomi Redmi Note 7 smartphone.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/display/panel/boe,td4320.yaml         | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..49e34ae4a058ea2e11a9c399068064d38451c51f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,td4320.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TD4320 MIPI-DSI panels
+
+maintainers:
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
+
+description:
+  BOE TD4320 6.3" 1080x2340 panel found in Xiaomi Redmi Note 7 smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: boe,td4320
+
+  reg:
+    maxItems: 1
+
+  iovcc-supply:
+    description: I/O voltage rail
+
+  vsn-supply:
+    description: Positive source voltage rail
+
+  vsp-supply:
+    description: Negative source voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - port
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
+            compatible = "boe,td4320";
+            reg = <0>;
+            backlight = <&backlight>;
+            reset-gpios = <&tlmm 45 GPIO_ACTIVE_LOW>;
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
2.49.0

