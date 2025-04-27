Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB481FF603;
	Sun, 27 Apr 2025 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745086; cv=none; b=GW9Yvm01iCo6RZi9UJvgwOQlWti4UduGq3P+enTHMEO7okMnx3wVUcYPuMjxUlEyK/vzNEXezmvoELW9IjPOdfYUYzyWcEwWGBWqPAeth97io79Sj6MzSkWKN+9A2vjx3mfynLSJv/hqF7yIESHQci/6esQrJDuhoE/dacDowmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745086; c=relaxed/simple;
	bh=rLSKQ1asDTNhO5B/izUawAE1MMvNz5upM8rDt891q8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLGymCcHeeoawToirb0+jymUvJBfFT+1rH3duASedJIcvV28+rcX+UmelyiSWcC1Lv7Bbfl9+jd3MM7NJCkc95Sohiv0plsJcQtC1NH8gTM/6XRasdlI03kfDHVmmui7u0xlp2LHnbvDdkAfC7RSD9Qq+kgwkZclQMUkTSkEk/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nDrEQXBM; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nDrEQXBM"
Received: from [192.168.80.162] (254C2712.nat.pool.telekom.hu [37.76.39.18])
	by mail.mainlining.org (Postfix) with ESMTPSA id 144D9BBAD2;
	Sun, 27 Apr 2025 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745745076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/17gyGjoNnK/er1nxCSklg7YJaA8S5f+P6ovINRH7sw=;
	b=nDrEQXBMiec0ebUITRNj0RaslqCXA3wFUuVqJ8M7korG5FGVjDvw+9IGr9jYDNlKUQEE2z
	ESjqAp/X599UAewQuwsWt6J2ilCSEQN2vLF8VczlDWV15LjtyNZpTEVGhurxXCH151b1II
	iqxtkL6KbMN38qlz9ErJJTLVHcxMBccfzB+GLCcZsZ78xdsWFB/R3zpdOHBXS5xhHelgs2
	G+Kn3HqGpGRRYc1XZwXmlzitRZdva7STY1/OV0o5UVFTZtBsS6o1mzEi6Ny72sv+JWmWqz
	KcLW1fBwblleExGqzwBMpp2m/PfxN5tDCx2FN4Cge0oNlU8dyHqjeqwNFI3eaA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 27 Apr 2025 11:11:11 +0200
Subject: [PATCH 1/2] dt-bindings: display: panel: Add BOE TD4320
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250427-lavender-panel-v1-1-b2611674166c@mainlining.org>
References: <20250427-lavender-panel-v1-0-b2611674166c@mainlining.org>
In-Reply-To: <20250427-lavender-panel-v1-0-b2611674166c@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745745074; l=1812;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=rLSKQ1asDTNhO5B/izUawAE1MMvNz5upM8rDt891q8s=;
 b=1W1wSCluk194NTWwwjo9qPc1ESUmyJvgoqt6BeNTBMfqeP/Q/Pd9unn+lX+RiNWV51J2YEIwQ
 esfKvI9rxm6Dwrxy58hQcwWlTohdbB0oG9xT76WfLzgQLTXSle3Goim
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document BOE TD4320 6.3" 2340x1080 panel
found in Xiaomi Redmi Note 7 smartphone.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/display/panel/boe,td4320.yaml         | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..65da1c392cafbb7cd3ce32e347fba1b9244c1ad8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
@@ -0,0 +1,55 @@
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
+required:
+  - compatible
+  - reg
+  - reset-gpios
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

