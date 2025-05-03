Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A621DDA00;
	Sat,  3 May 2025 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265657; cv=none; b=i1aJ3uEcauzbFY5isLZ5r4gZ7Ehq6g2i+n9S9xQGwiQTylhVanqYXTv8w2LvFYWjKfYzLtL7Nq1DqdTQ8D+hd9i68+J80YsxuvEA3IIk30IrgaievMgOj0L98gk9qMoYkMzQCAy6prHF+DIStUOKBVCLzGH2L7EBkNV5L19xIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265657; c=relaxed/simple;
	bh=Qnk8ApjKHe7cIi2nAfJHQjcWlleZ4gTm+u7X22VKTFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AH3wyv5E/N/kGMj8A1bR5RNBmGid1F3yJF1NZqGh1iUf+vs+AwzWXR4BBg8GtYA10SEyJG40GPE9DROS8M9c4J3dNZYlVRGp+uEmUQKqwbcvwqLh9Ofk5OQL9ynVPn2v+PsCpFjUHLLCFbPEu9WQIagiBmWMhKiIpmAWegQEqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyyKQ+L5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyyKQ+L5"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acbb85ce788so682811166b.3;
        Sat, 03 May 2025 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746265653; x=1746870453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
        b=lyyKQ+L55OA66qNkOUjkUtotJmkIoR9PkzlqdkDNKR1Qe9PTwU13js0EDullEUrUGW
         poGTvHDXjSEflQ90qeETnq1iaipNxExMMpptzEY9S/AnjROXQOy//mQ3zOUjyjyZgM4o
         a/sCsHKCwX/ELEJW33NG7FByiOVvUJ+IUb01QIB1D0HYEfC2F8hqK0TeisfbTKC2Z7zi
         I1N9fAuHd+K6g8IjYttvGObKTSyrC+ioI884ke9wGHmUQYbwnp1qYy/seWcA3E7rBgDK
         d9Jl4MwMH24A8ZikvUVcYts+yXkaDLwxgLMkcJDwA2c2YdihFUB5/nQcrJFuRlgQyP71
         MrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746265653; x=1746870453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
        b=I+ggIHL+eECBCjP5gTXxBsbepbxhDVcx2w4JpX3lNhafQRCUi0F5QI+wxcdmTFJdxM
         xEM7aI7n8nMgXSL2rxYH08mlDgscqDJQwcDUT1Fg7nYPMYnajuHGm78PuPvTG+Q8ZbMt
         UZNzN7ONXYY0qUYXZtI//XQ6ZhARQL6yWonHA8yHdxBvpDxkINoYJkIhBV9TNYEkA2OT
         TMD2QhdOma698jBDunQq+ytxBH+wKoJzsLDItLcphvE8okMRbN1nX98Bo0ZiN1yzjAO5
         XahsSEg34vFAxQTJ8ey/PrZyoGoo5pT7MK18+09xd7PvmPXSdpS5n5OK1BvaC93kMa0G
         hLUA==
X-Forwarded-Encrypted: i=1; AJvYcCUGhsY+2VU+lSH40G9uIGLadAsX0knwyP/Z9NKukobK2fw761d7SGoiWBc5AQGC3GTDxUDkRcB9wNAG@vger.kernel.org, AJvYcCWrGCj5PfDv5Ek+zERFiSjqS+W7JuhOKlhEyo02qvSwfiC6TXdWiJr0X/t8G2bz+2YFTR+v3tponuwKdUIF@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTcoW848GMf7iQVrklP5GrkChrUrSl4bbI1KUWN1+SJ5RL8K3
	0dzQ1thCLefEDGTGgRIKUs9yQrzX69vVGUFnBI+Gyx/j7kbstqID
X-Gm-Gg: ASbGncsgAZ0VGirLvRqoMhztFzBeuZY04FAonKxtPYo+1Njg4Jjkno+dEEYsvikZ6eF
	JzStkV7mG9BfqrNuJth+tRmsaxAobDNDH4zfcjUotvjGy2z/SwmVitfAQBS32DV8QQ0m+juu5h6
	YquhfqQhMB/gryrhzXiCqn0XuUwUV8Nk3HJCC93MIeHYy05OyQJbO3qr4A+jsws594HL1VOB7NG
	PM2co7wDCcdPpl8gyX3xLkIUyAgzpluW8eNyviEs/3o934qPN3Qrlhx/Bfbmk1DYLxH0wVOmWsZ
	y2jua9G22iTQxM01xW5rDS0QaUbmebEi
X-Google-Smtp-Source: AGHT+IFBG03RjlGdyQOmaEyS5Gy0bqj87eUXFyUZvUOj08l5oGrUgJV9AjOPDZA2Fqt3gThVj1OXwA==
X-Received: by 2002:a17:907:2d1f:b0:ad1:8169:da0b with SMTP id a640c23a62f3a-ad19069aee4mr187627166b.31.1746265653036;
        Sat, 03 May 2025 02:47:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad188ea7f41sm174732066b.0.2025.05.03.02.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 02:47:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Sat,  3 May 2025 12:47:19 +0300
Message-ID: <20250503094721.29572-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503094721.29572-1-clamor95@gmail.com>
References: <20250503094721.29572-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Solomon SSD2825 MIPI master bridge chip that connects an
application processor with traditional parallel LCD interface and an LCD
driver with MIPI slave interface. The SSD2825 supports both parallel RGB
interface and serial SPI interface.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/bridge/solomon,ssd2825.yaml       | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
new file mode 100644
index 000000000000..e2d293d623b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD2825 RGB to MIPI-DSI bridge
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: solomon,ssd2825
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  dvdd-supply:
+    description: Regulator for 1.2V digital power supply.
+
+  avdd-supply:
+    description: Regulator for 1.2V analog power supply.
+
+  vddio-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  spi-max-frequency:
+    maximum: 1000000
+
+  spi-cpha: true
+  spi-cpol: true
+
+  clocks:
+    maxItems: 1
+    description: Reference TX_CLK used before PLL is locked.
+
+  solomon,hs-zero-delay-ns:
+    description:
+      HS zero delay period
+    minimum: 0
+    maximum: 1700
+    default: 133
+
+  solomon,hs-prep-delay-ns:
+    description:
+      HS prep delay period
+    minimum: 0
+    maximum: 1728
+    default: 40
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Video port for RGB input
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [ 16, 18, 24 ]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for DSI output (panel or connector)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsi@2 {
+            compatible = "solomon,ssd2825";
+            reg = <2>;
+
+            spi-max-frequency = <1000000>;
+
+            spi-cpha;
+            spi-cpol;
+
+            reset-gpios = <&gpio 114 GPIO_ACTIVE_LOW>;
+
+            dvdd-supply = <&vdd_1v2>;
+            avdd-supply = <&vdd_1v2>;
+            vddio-supply = <&vdd_1v8_io>;
+
+            solomon,hs-zero-delay-ns = <300>;
+            solomon,hs-prep-delay-ns = <65>;
+
+            clocks = <&ssd2825_tx_clk>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_input: endpoint {
+                        remote-endpoint = <&dpi_output>;
+                        bus-width = <24>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_output: endpoint {
+                        remote-endpoint = <&panel_input>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.48.1

