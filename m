Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F3B1DED5F;
	Mon, 23 Jun 2025 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666534; cv=none; b=XxrbKKWWFWNDqCV0y9XuCcpIkPrbVDYNFNNPoVT2kOi3epm5oQeiScyH1+/JKuXQMntiCrKxDQozuQ13Bt7BQb8S0vpTeYcZ6QkQwxIlajMtlEXLIJgZpufwPsUPrXoGs9avfV68PYLQDQruVJOalmjNICapoj9rYcwwdHAbiHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666534; c=relaxed/simple;
	bh=Qnk8ApjKHe7cIi2nAfJHQjcWlleZ4gTm+u7X22VKTFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjPemKB6XGBHJOfbR6lVn5d+0XEkoOt25ykeJEd/xYVsMxLBu7evilrjrQvB5LZxswt6vz5oZ5DwTfsU+WO/iZurGu9rYfbw8I1nt8gUMv+Fv/acXflzF+FIknpJ8IYgWoITz3u9wbL/2SdnbQ3IeFq6SVptKsCO2IppYWHBYhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXy42Ybf; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXy42Ybf"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b584ac96so4033080e87.1;
        Mon, 23 Jun 2025 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750666530; x=1751271330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
        b=AXy42Ybfx4dc1Smf1/R88JwqlCSCewm5ZwEXjJ4lG11GKKjw8QmyAV0is1yiE95sN4
         3N2ByleJn18AWEDa3uZ+7JtonWUeo3hFrHaNlBBT/vaCeEFs70wWezUPDEnI8e16TRbR
         c8fsDnEuLSYbljoV17wqpTKXSxYoEV/cKWHtjWWPrE7T0Gy74dOzzjEpGhK43U5dFazC
         3dhVL2vxyoQnu7ZfxnBY1TSZaax6yaWHhsTnCkW2+P/w5m/cB7IKMHQUjGWXUI2qhm8L
         qZ7E4CCbG9hOw49Ee5Gn9UWO5EkeXABW7+u1tZbW0xhns0MB5en9htsGD82dJDXhP1jl
         bGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666530; x=1751271330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
        b=VsPzwxv6baZF/kj4XvXKpOyHT/+Qw098mUjDNJwTQe9+bR5KVqnDLTlY2RsrCZln75
         yUr628tQsDAgd4ykc9x8IZ8SquxqcNTV2kZwQz0nBWAOld93l6UbuG6JrEDAjU+C4vBz
         H2YYT3Pnq3aGwSbEOy1UGqPuPW048o92aV85is7Lv914md+AHz7h9yiayWab75iKg2OL
         QXP72pNQafAywrOv8uPP54aAt+Y6nPOaUqeRzqIdRnWkQpH1OIqn1Y/uNh1atZU2UQ/h
         6M1AukBhbpAYy6ArOlWmFEt2UjpomoKrXBJ4eIejIqaHo/VY4pqHYlJpwUIrWg+uBzE5
         ekTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZyWKhOcc9L/EH3OItjU9F5KQrmOwRl9dv/eNP2nFpzjWChZWmTEykfm5Sh4cSD3kV1WZkG/cA5/FoYrqe@vger.kernel.org, AJvYcCWgj3IN4sp0pNhKTlsovEZLmWNYHxITfvdIJZW4Ef074JdgO2yqpcMQ/fBdvgqhVBDDW2o0WhvAvy0X@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbyqd5yuvokfmTn3EfNOvANF/l9V8F/S0/Ge1y+cG4NchSDCn
	0uPVt7hA6f4RuvLGYRs9Osl5z3oeZmS2ZUP+zs1U3E018BklgCbIzbrLXTcmog==
X-Gm-Gg: ASbGnctmH+6xzmwVmk3k5WmLFJsVs2/z/tnIfk9bTev2ytq+lftvyrrSMkdJrnvJieS
	lt9vObmpjCwwYq6FbllEQHE/QeXa1xS+A5Bejr6eitRPo15DWtx05VZBUj6qpigsy/KyH2A6OEa
	ZuEhK8xgt/GhuiEmxYVQtoKEU2vvu/BByTzxI2lz8W6cEtgF90naHphQI3m0uxBRBF45U26rxtQ
	6Jko4gikL78zCvN+7TuzqNkUxqKw0wPHpZMWki+w0P0TuR9yL+2i3fdxjqZbC7utTX7xCwqiAlu
	Qq/ecMrymJ6pdO9gio4vGuxFmtujyKyb6tNIcpObAlROU2D9V9bz1A==
X-Google-Smtp-Source: AGHT+IF3QEi+k6EJ/xY0gmwMm2BjKyfzFhvFLowpbK8wmnngpEVMkOKV5dcDODOgqZ35fxin2tU5wQ==
X-Received: by 2002:a05:6512:220b:b0:553:260c:1b90 with SMTP id 2adb3069b0e04-553e3bfed7fmr3615305e87.32.1750666529626;
        Mon, 23 Jun 2025 01:15:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414483asm1308072e87.52.2025.06.23.01.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:15:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Mon, 23 Jun 2025 11:15:03 +0300
Message-ID: <20250623081504.58622-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623081504.58622-1-clamor95@gmail.com>
References: <20250623081504.58622-1-clamor95@gmail.com>
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

