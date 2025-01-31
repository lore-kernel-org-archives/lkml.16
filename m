Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B75514F9CC;
	Fri, 31 Jan 2025 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738305872; cv=none; b=HnKI2fMlNHYPrtjIlt4fApAAWvjRwBFHFcLr7k+EUz5W4Zp7/pSD7VqW3yfhjqSgG+v9VnF6I4ftqwU5y+J4IsFMvUrWKY4CB+YOd0cMvL5ZjY24SD8OY67BMPUOlb3YDBZYhgglNcN0znAzzawn06MVZ93Urytyj6rN9z75hKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738305872; c=relaxed/simple;
	bh=3WgAbT0ve3KCH1i/XCMRSlAMOwhKD4qGl4AeVigIEAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f75MfSQ5CGSQgmADCRTfbxjfBvbSyfsIwl6/6ChrbAc3qQXwu70AKlsCMIWwxXfIeLTUalay30VkH59BtVWrJvM54E9AnmfsqQR24gXFtY8SbLPEJENrlNQIha+CGT8/Ll/rEmjQQnpNY6eLj4BUKWQRAwH/cfV0xCjbpvRQUO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkPNxR+I; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkPNxR+I"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so2833367a91.2;
        Thu, 30 Jan 2025 22:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738305870; x=1738910670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1vbTosznX/93FTUwC4S9oeX4Wcs8MPx5CjhjQszTJM=;
        b=WkPNxR+IeWfZ9fdbKjKP4tu0tysKzBHcMJBAqFljqLy6p8vh7RtXSO9HejmVDZXF6V
         TLL9Ow5CHtw07MQK9UMKt/wOQvsTUP4aat2bKlaJbfXPpFChE+jMkzO7zQp3uptV5ADA
         nH3IWP/hYtNECKyofNQhwIO5OaHzgZYSKXimWpwB9AAcBuGyTQTQ7uv38WhRI8NsmYqG
         nryU2UDK70ty01YJ14uSdu2pAIgquGsymK20qpwULGnbNNkutlzDGqK+MhzqD1CJ07VW
         unSqSU9owwebul9M49BvMFH6Q4bsgazvYtIGWQ16CUTmj0U1tkuJx35wqt+dZKByvNQh
         RgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738305870; x=1738910670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1vbTosznX/93FTUwC4S9oeX4Wcs8MPx5CjhjQszTJM=;
        b=JtpB5g5pQUvObiH0IduVM9nDPNnwi2TYsYDMss2RAVmJa2jNtDBeur0hXsszmo2bZO
         AEZuV30GmkRe2+IjTSSgmC+got/3u5AgWzWJmd07UVp4bOMy2jMAfiRU6PC+shRwYDfz
         uZaAhgYhA0S4WllL6B3PdkJ+Cy1B4DO0gMsHBLcCUZ7Sorpv0lqa8LXdvV57OzEpc8in
         ViadcrzUDSDV/t1KgMrzLjKxTW5rgkpT5LliAiBieyfRUcqOdAkSCYLwRTKmlUd556Ny
         BmPBH64ZwNPa7PI7YmIXKdxFvIfs82VZs3qYGy37LhSSthUp3G0rsTpflB/xVzRL4m9T
         gQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnheVOJ+7ssVNWyopYoId+hX/61UjrRZ692wruum/z6NXefzha4paVMHLOh6QJEq8ddfnlrhJ9TTVI@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDtEfy7nOJwCWETq2LnTG5+9ZcyQABnIg3p0p/76kpxHgbSp+
	LGgVRoRbDYWzwKta2ustsTZYB+dixZcR0OaVtKqq3SieKCZlpTr7RLoxL67C
X-Gm-Gg: ASbGncum8UnSQrMlQ93NeLSu7rT56P5QfH7u6x14kGDjbcccygIkH5ftkRTkJxsAksU
	071kPzuG/CrCvji4GFRDNd5e1ZZyXUVNWev+zlI1ydbNm3uW6G4ysCw4RDF4e1z9uovtbq0cv9+
	OWym8WK2EfA9VihLhU9xHHGiHGfRqYEmtvUuJyYCXUB/aqHeBU1DWkNXZk7wVvSwxqEQF6N3f5p
	GYUBJUyLCmy5MR1FeHY6xVNqYrrHsDxCBrotSh3/ezHE8cXEETIh4Zxuv+ziIDkYgP3UyiH+GR5
	0RLMjRHWc6ma166mj9ZthNih63o=
X-Google-Smtp-Source: AGHT+IHGxUlsGhp7wUUYra3XimaYEg10mWNL1Fr0GHj4XpVFVFx3iKAmpTXnQfZxrOWWPh9zbbR/KA==
X-Received: by 2002:a17:90b:3a08:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2f83aa7c6bemr18833079a91.0.1738305870147;
        Thu, 30 Jan 2025 22:44:30 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfc0ddbsm5098947a91.45.2025.01.30.22.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 22:44:29 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add generic MIPI-DSI/DPI panels
Date: Fri, 31 Jan 2025 15:43:53 +0900
Message-ID: <20250131064354.4163579-2-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131064354.4163579-1-kikuchan98@gmail.com>
References: <20250131064354.4163579-1-kikuchan98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a binding for generic MIPI-DSI/DPI panels that require
initialization with a simple command sequence before use.

Although the `panel-simple` binding exists for generic panels, it is not
suitable for panels that require initialization via their communication
bus, as such panels cannot be considered "simple".

While many dedicated bindings exist for such panels, the generic panels
are not complex enough to warrant a dedicated binding because they only
require a "simple" initialization before use.

This binding addresses that gap.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../bindings/display/panel/panel-mipi.yaml    | 244 ++++++++++++++++++
 1 file changed, 244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
new file mode 100644
index 00000000000..681614333d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
@@ -0,0 +1,244 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-mipi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic MIPI-DSI/DPI Panels Requiring Initialization
+
+maintainers:
+  - Hironori KIKUCHI <kikuchan98@gmail.com>
+
+description:
+  This is a binding for generic MIPI-DSI/DPI panels that require
+  initialization with a simple command sequence before use.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - panel-mipi-dsi
+          - panel-mipi-dpi-spi
+      - items:
+          - {}
+          - enum:
+              - panel-mipi-dsi
+              - panel-mipi-dpi-spi
+
+  reg:
+    description: DSI / SPI channel used by that screen
+    maxItems: 1
+
+  power-supply: true
+
+  io-supply:
+    description: I/O system regulator.
+      No need to set if this is the same as polwer-supply.
+
+  dc-gpios:
+    maxItems: 1
+    description: Controller data/command selection (D/CX) in 4-line SPI mode.
+      If not set, the controller is in 3-line SPI mode.
+      Disallowed for DSI.
+
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+  display-timings: true
+
+  reset-delay:
+    description: Delay (in ms) after the reset command
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  init-delay:
+    description: Delay (in ms) for sending the initial command sequence
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  sleep-delay:
+    description: Delay (in ms) after the sleep command
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  backlight-delay:
+    description: Delay (in ms) for enabling the backlight
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  port: true
+  reset-gpios: true
+  rotation: true
+
+  backlight: true
+
+  init-sequence:
+    description: Encoded initial command sequence.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+
+  firmware-name:
+    maxItems: 1
+
+  dsi-mode-video:
+    description: Enable MIPI_DSI_MODE_VIDEO.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-burst:
+    description: Enable MIPI_DSI_MODE_VIDEO_BURST.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-sync-pulse:
+    description: Enable MIPI_DSI_MODE_VIDEO_SYNC_PULSE.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-auto-vert:
+    description: Enable MIPI_DSI_MODE_VIDEO_AUTO_VERT.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-hse:
+    description: Enable MIPI_DSI_MODE_VIDEO_HSE.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-no-hfp:
+    description: Enable MIPI_DSI_MODE_VIDEO_NO_HFP.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-no-hbp:
+    description: Enable MIPI_DSI_MODE_VIDEO_NO_HBP.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-no-hsa:
+    description: Enable MIPI_DSI_MODE_VIDEO_NO_HSA.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-vsync-flush:
+    description: Enable MIPI_DSI_MODE_VSYNC_FLUSH.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-no-eot-packet:
+    description: Enable MIPI_DSI_MODE_NO_EOT_PACKET.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-clock-non-continuous:
+    description: Enable MIPI_DSI_CLOCK_NON_CONTINUOUS.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-lpm:
+    description: Enable MIPI_DSI_MODE_LPM.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-hs-pkt-end-aligned:
+    description: Enable MIPI_DSI_HS_PKT_END_ALIGNED.
+      Disallowed for SPI.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - panel-mipi-dpi-spi
+    then:
+      # SPI mode
+      $ref: /schemas/spi/spi-peripheral-props.yaml#
+      properties:
+        dsi-mode-video: false
+        dsi-mode-video-burst: false
+        dsi-mode-video-sync-pulse: false
+        dsi-mode-video-auto-vert: false
+        dsi-mode-video-hse: false
+        dsi-mode-video-no-hfp: false
+        dsi-mode-video-no-hbp: false
+        dsi-mode-video-no-hsa: false
+        dsi-mode-vsync-flush: false
+        dsi-mode-no-eot-packet: false
+        dsi-clock-non-continuous: false
+        dsi-mode-lpm: false
+        dsi-hs-pkt-end-aligned: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - panel-mipi-dsi
+    then:
+      # DSI mode
+      properties:
+        dc-gpios: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "vendor,some-panel", "panel-mipi-dsi";
+            reg = <0>;
+
+            port {
+                mipi_in_panel: endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0{
+            compatible = "panel-mipi-dpi-spi";
+            reg = <0>;
+
+            spi-max-frequency = <40000000>;
+
+            dc-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+
+            backlight = <&backlight>;
+
+            init-sequence = [
+              01 11
+              00
+              04 b1 01 2c 2d
+              01 29
+              80 00 00 00
+            ];
+
+            width-mm = <35>;
+            height-mm = <28>;
+
+            panel-timing {
+                hactive = <160>;
+                vactive = <128>;
+                hback-porch = <0>;
+                vback-porch = <0>;
+                clock-frequency = <0>;
+                hfront-porch = <0>;
+                hsync-len = <0>;
+                vfront-porch = <0>;
+                vsync-len = <0>;
+            };
+        };
+    };
-- 
2.48.1

