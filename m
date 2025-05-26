Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1931F4C85;
	Mon, 26 May 2025 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748259868; cv=none; b=L04Ov8ezekZi1l0x+kJhQg0WLNtiAPfIa1Y6HooBMASeF9SomI22OdJgVWqUfHXqWyJY/u383rCd9FyyH1NsnRoyUg4zwd+6vOvYmkXUuyErkCa8ncO/fsrgCXbG7FNBW4ROgbnEdXJFEhnGJeGe32jsTm3v0thqBR9DIJitzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748259868; c=relaxed/simple;
	bh=Qnk8ApjKHe7cIi2nAfJHQjcWlleZ4gTm+u7X22VKTFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpMzWX/DdKahtznFL7aOUW5WFwXhpgtZKWz3WJ9/17BOpV9vER1rkhIsAQEJWu1Gn+bnzTxK9xNJUVyji47SIBho+NK9fhrm/sbHX7W6yQ/hvyKnSRMhOc6OtImUxvUCxh6yGfOFIoH4evIezcsNLxRcVAylrbB4H8Vt1Ss7DUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHVWNGYo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHVWNGYo"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-604bf67b515so1038863a12.0;
        Mon, 26 May 2025 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748259865; x=1748864665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
        b=FHVWNGYoG373WpJceF6vHKHnmlv3nbfnNweR4OgbYKkvIzc5VJ7J4Wqacz9PBDZ2nm
         hL7XWoZ0dNYZXlpbOzmwROknoLG80UPkryo+1bSvMfJESuPIkdtjPGQStwjkKMMtmSfP
         YKAHYi6WOcOBeH7D6QtTTMVhzmTWAgkwYDEgH4Ze2nESIvi5CBKZB/F/YZ7xtAkTQKpL
         wub9CXGn6tN0ktWFk85o8Ekv2ElR9RTX7j3fkzvrqv/nt4IKbgIVBkkE+H54wFpnpeCM
         m3VKm+oz5WLkC2EmYIdvLj8qxTWP2KKxa2cUb4CmkMcv7RayLB1FSWQybmxg2seXgfRd
         D+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748259865; x=1748864665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
        b=md3G76wWP9P9mn2Rrx/eZUmTyDpULbCI5iLuTUtKu/SFPBt89dGEGF0de1C4qDJo6u
         i0eEFRtDu8YHG+bmjgMNb4t44VjGF0vCzBZrOhRzFZr15JyQ2FyeTT1Lg1CQvxN4nFxT
         bCXveSHmd1t/hgdOBSRDDEhzzOX7Z1xKuJIvIIwAsU0DLhKoVHH0WRf32kpZAfIvBTvc
         o0EsPhvuRLql2J2LQHR2hZAJ452FtZuIFmwj32gAgG85czp/DKIkwPD3IGPo9a57OQyU
         fapBuFhj9hNzwX3Pproks2NGGSWgHcph5sxKiDZAVk/DLUS3tSfDbWPrDLST0xSf2ume
         zwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJYx8H7JIBPq4DkAlEgfVV7I6SoE01xG/rpOBBEi1qd0EnilmYBu5hTSopPGuqQRDVe9qoEDxcpgWO@vger.kernel.org, AJvYcCWY4r++H2xhW7VilesvfadqfPcUSsoqvLHFB38t3WyhXSmgnZYtA9eiLTakTYUFnrD+c31FfDi/ABhANTYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKPxrdhJZH1PN+z3qXfRm5pv87g4cj0gWKuRPpKXjsbHSBDrz
	eihVmk7+0Vb3tq3u6tFVaLe2NwHBIhhSr4R2XIX+w4h4PzUkmCAvYQdd
X-Gm-Gg: ASbGncvaduS+GKJbYFr5TwlR+sbMRmlB2hziu2Tl36ToFpTDIH7iinE5VwccpWwBvGR
	Vu1cwBVeEhGdqnGnssGZS5PFRTXYmZQ/WXxtgEQFkgL1O/9yTCMpROAk296z0YZTCtUwCd6XHGK
	4fbmBgFOp02cb8DxB8Ak3hUt9foCAb82o+2Lwoaz9c4bJGrStdPSGaWpZixPU/W1nsiTXaAVtem
	yL4J44zuNQWEql3T4ThAbXW7+SZ9rfpBf0/y5Hv1zxo01+adzRs8O6oQsftAGr3yHaPQhvkisvI
	aG3Sa0yKEQ4tiDB/1JrCvWyHpMk5Lw6oxOroWMKQVI0=
X-Google-Smtp-Source: AGHT+IFYB3Pg37qMXd511oOswKyKu832PASjC/HqGqTJ9l4yNAY5MqCpfKzCopQR9urjsfAbZT5/CA==
X-Received: by 2002:a05:6402:90b:b0:5fb:868b:5a59 with SMTP id 4fb4d7f45d1cf-602da8ddecbmr6735163a12.32.1748259864556;
        Mon, 26 May 2025 04:44:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f1be3sm16270716a12.5.2025.05.26.04.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:44:24 -0700 (PDT)
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
Subject: [PATCH v6 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Mon, 26 May 2025 14:43:52 +0300
Message-ID: <20250526114353.12081-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250526114353.12081-1-clamor95@gmail.com>
References: <20250526114353.12081-1-clamor95@gmail.com>
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

