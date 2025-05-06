Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE9927AC4A;
	Tue,  6 May 2025 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524034; cv=none; b=H+qffiNCy55dl3aQy/3T9AiyfPkMF/2/8tkQ0YHxziCcBVElaOoEZzAqoCyuKieP2dtG8J5ohgp50YG8pDZSeVznhBXo8j8DYD5RWD088jh5WIj7j4toehPGC2i87XbmR7jLw1/7tiGzNbI+2KQwY6xP51urJdSJpy14tc601Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524034; c=relaxed/simple;
	bh=Qnk8ApjKHe7cIi2nAfJHQjcWlleZ4gTm+u7X22VKTFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIG2QoFxsWUM2o9EB3CVv1KxZl8gaWcZGZPrgroGfGJG1Wp+oN4rMn3j/ZWlR9UwFIHGO9D1r0ld+sXWK4tobptKX+Cu4TtamTymI6xMtt/gQiSzRLLwdcYfnq/+vsZ7PebwSurSMZ6XVSvZMJvUo0ia9ASiYLAdj8XLycWOKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7Ruh78o; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7Ruh78o"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso164596166b.0;
        Tue, 06 May 2025 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524031; x=1747128831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
        b=D7Ruh78oXIkMnzcehoKfpdh05ahiTcbMr7bApCcK+tiH+DtjQ+Fj0XAetzy08IibHa
         +koczC05V2dMyWbrTWnjHfISfKV7uUgeDmtEjUfPA+io6sNEwYO7U63xGs9XeFzu0X1s
         DMFiG4Bi/puqtMaHN/+8pYFbpG8CZDu2Tl/3g/XlaAUBgOXWnobI/tUnGoayhOFCMrT7
         6E3BacANMnLqC1lzjRxsU5iEFt7V4w2nKTKZ3DIvL5dYLKUSqDAYjWLMPgxEsS0JPNot
         Wh0U4rA5qbUI+WRFTM5ddSConFOugBwRiEq53RJnoq0EAfhbPx6+0gFVXpmOqLsz7S1P
         EkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524031; x=1747128831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
        b=hg+0zt3sD2k10ASzedF+bVBlzt3t1bvFW2IaWjHL+XwDOgvBlkmzE1yt9LkwsoLN4G
         2mAlg323ENGaBLC0Xlxj+PaRD6uZtZpYGSAqX6otK0BhK779fTJVPVuM3/3OgzbsLy6U
         a6PXYnfcFjG+wMNCRTmhyCrdyMqEqXkxRus2TOGYJmJdQROrSNDopvVgY+3sE9PjmtbP
         OgcHiF/UQFw3aqgpzKbnN36Xhr9hrjEfTpuhQjOhTkh/kCgSwXXBgax6wRBR7gGa+wv6
         qmrYv0dHYKC6fhc9ZpkxbCqmu57qgfP9XpeASg5ng/yRDAPqR0qmikmal5Pq+7Zgel5s
         YA3A==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9FyhdTFiWVAeJvNZryEQ/YNBB0jUcGOMADydCim3ekrM7eXd8jWTaP3iz0OJJeey12bIwgwxzvRB@vger.kernel.org, AJvYcCXkMhDHlnPDo8CxT+eBVXW7P670QY5ffK0b7YANbbByLrFCIwJN8efu5MwbPKmJst9cKFGgd7om1AIdsjSi@vger.kernel.org
X-Gm-Message-State: AOJu0YzLIj9fupL/8tNLEzjyNhUoNRcBGyZOGcBYjwwZa92IJrAAe59J
	N8TIqs/LF7krKQPFP7BdRoQ4ZMwEhhXtjKJang4ul5F2zrwdAVzK
X-Gm-Gg: ASbGncuKZYGIWL1AhmjnJk29DR4AK8PbwO427nET0iQLv0jOnZq72G080SdrIoDxPn6
	8xudjhoChv95I+hCTaP4l6i6nNe6fUKONRzEwm34z2RlJJf+XbvwIUCscKRVtuJK/cKt9qCHdic
	gUT3YgbC3fWn4xR2TqseEYJVarvbnT7+5KV8HV8bntRw+2Hq2sPorbbAs9yj/pyf2mhhm1QYap2
	RO4kgv/5/O8h1F9/Q5t8lmIJA/4K+n6rHJdOidJG6cCaeRqKOpnHe/CAq04wat6qQhGqwbO6H7y
	6dR+/5QwgQ7T45WXz4+cf/LCEuBr4y3l
X-Google-Smtp-Source: AGHT+IFtCBcr7dFXi8hYBmPOb4L/CnUpKjpcGPLBRC3hn7FKEobypbJ4vI4+M83ZIMj8oevyLZNh3g==
X-Received: by 2002:a17:906:c142:b0:ace:c416:4231 with SMTP id a640c23a62f3a-ad17b470739mr1692264466b.12.1746524030821;
        Tue, 06 May 2025 02:33:50 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1e1292696sm25594666b.111.2025.05.06.02.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:50 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Tue,  6 May 2025 12:33:39 +0300
Message-ID: <20250506093340.106575-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506093340.106575-1-clamor95@gmail.com>
References: <20250506093340.106575-1-clamor95@gmail.com>
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

