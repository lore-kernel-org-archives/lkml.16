Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34055219313
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646366; cv=none; b=tSAF7907dgJgT+7ltBQvxHDMtikk7ChwyflteGXHFlESdOoyir6M7opyjotO0L/LCsU/g9rdyJXTqpXCg5dvcWz5f0cWbGDVcJJ7AR3IXa/NXyv++ACSwm00DEitr9iGPXssi6kTPNy1ia1QCd/vLaVuuzlqCKpreIlKmNGkbIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646366; c=relaxed/simple;
	bh=u0HID6qYCpqSqHWioEM+G4moZPLWcoMb4wYUJNV4vEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NFT/SYbmff7hsw9X/z2yFUU7XeOgGbDt3Kj7IRVbjL/9Zb7AIw1g6tEW/KJuye7LOPi/ea3HNR6n1DNxMAUZe2v/CrNjfR069F8bw5JXMDY4ihrtJI/HGCV58krbYaTIDioGoAqIbMuDq7fWsnSijuton0ppGdP6Q0Z3u7xA7tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EFaELeMD; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EFaELeMD"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2c76a1b574cso775575fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748646362; x=1749251162; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lu3lG7YwnE3Dy5Hk9HzoUTq4JNREs+Ad6+efkztPKBw=;
        b=EFaELeMDCRNQUCiBgwX3C+ilQV4QG2hYciIfg6staWVJqh7GohQG5Rd207leHol1SN
         3qr+9RhO8tURZy1eaLZWWgvWpy6Hf/juFceY/ZmkNt5ywp9w0kSMTag6YzNT4bN5S323
         DscqfokGo6LSCBPsWo/zyqCPQu3HxHBCujK4zYN0GgKn2nYD85C490ttE0yOaWfmj0bT
         dyYLAvecsrUtIH9TFxFT0WUnzR3CglN7/o37P0vqivBeJutdhIVqMSzimb2VXoXOjisU
         Dp/YCYI8X4yIeWD8a0ewdOMMyk23++vco2GyTUJDC/u1MT+rk7mn92sGd3TbwQ26QG9R
         EQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646362; x=1749251162;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lu3lG7YwnE3Dy5Hk9HzoUTq4JNREs+Ad6+efkztPKBw=;
        b=NVKpU2l80h/hqhLdmpZu1hm1eNTsS+AHfzzrI8Obd6dCflW+eVJ+kN399yDzQZ4sVp
         fiiMJv00Woo5Z2wXRo1F2WjcCjXOy5d0mK40dQQl1wzgWXJd6g6ZCkTf6YbHOWYU+kzX
         7LTXjhqXVlIxDqEVwkNEYshkq9JWkEMkm+HaCL+6/lLzxTERfQ2UfWhZsEqfwUQ+tpZ8
         +UphCliPzFG7wWMYxna6n/3p9e5EY3nsCeaRECpmE+m1rLAvW8HUsewH9+0DovdgXBMW
         a4g7njMhsySEb8P9Nwtp3qDk/xsboSKBerApX3sEJApvxZk0B7QBvttMFa4Adz5WXPht
         ozHw==
X-Forwarded-Encrypted: i=1; AJvYcCUXP6jipUVIy+7A6p5lbin2DK4z2rCV9Rbcrb7JClVa5+kYGcaIFi2Dy9P6V5YdBlyo4VJ4iIzuWiZrGfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQztyIqNBru3+uHVF2ixMfy66lPlq3oU6ehnYk8JbPQzy9qzFY
	EXZqsNg/3JiO8yfnXaeV9nrwxziZHXdyol+iQWP1CUD2i0NvfbnkCzcAKgzjezmGfHc=
X-Gm-Gg: ASbGncuV4+rPbVdCoM44W3xuPQWchvxW+O+0CbmhnjZWL/VbQLlkd1YM69hRSPQNRuS
	pVFEb02TQqDWyQmNnNZNgyOWo8uO2oRhmR/sLjBZoNDeYbX+nJowHqkKI1Ka70g3ESQ+CQwE6/0
	gFRq3BIZoFKAb8yxfwvdPYppZXG7ve92MJRJc+MkiquVslTtSdQw6FWS5WgVQLswrRVvbf8OGwd
	+tGIIdKUuKwK69N6Ni5kADtzzqogh2YlcWzzEpXL2YyWXrmEtTXth3fph9sSWSzYL5GWyQMTy1S
	+SLF41BktsRIJwuD6sBoB9lntmfv4A26Dfq+MiFVut7ifhEFDjNM7sD1xA==
X-Google-Smtp-Source: AGHT+IGIfCYtq5fK/ESbkdB6n1mCNo1Fi5i3xpYNU/514FpGxlSOur50JOAQ5a1k03Rg97LdT5qmVg==
X-Received: by 2002:a05:6870:6129:b0:2c2:27c8:5865 with SMTP id 586e51a60fabf-2e92a1704dbmr2163763fac.9.1748646362032;
        Fri, 30 May 2025 16:06:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4b52:4054:714f:5bf2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e906c13c13sm844388fac.45.2025.05.30.16.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 16:06:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 30 May 2025 18:05:42 -0500
Subject: [PATCH] dt-bindings: display: convert sitronix,st7586 to YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-devicetree-convert-sitronix-st7586-to-yaml-v1-1-c132b512ec57@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMY5OmgC/x2N0QrCMAwAf2Xk2UDt6Bz+ivjQtakGtJUkjMnYv
 1t8PDjudlASJoXrsIPQysqtdjifBkjPWB+EnDuDdz64MDrMXUpkQoSp1ZXEUNmkVd5Q7RLmCa3
 hN75fmJeQZ79MYykRevAjVHj7z2734/gBmil6kHwAAAA=
X-Change-ID: 20250530-devicetree-convert-sitronix-st7586-to-yaml-db5d82b63ffa
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4106; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=u0HID6qYCpqSqHWioEM+G4moZPLWcoMb4wYUJNV4vEU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoOjnPJNOumLdu2oWPK7+HGRz/nw/m4yuJZvoPh
 zz8WLXIIZOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaDo5zwAKCRDCzCAB/wGP
 wIMFB/4xRAdGwwnFCldEWPft/VX5czF06rng9hS/bcgAKoX/DX4N0uECuHJFnaBzDgRWSokoswA
 9mZQNFSqDC+M0UDwrrEZP8HMFfzyhMKW2YRgjH3keUhJo+wbq0eRmDMtWZtxQ/S9PUFXpsvRkZk
 zgBRtdUrKYGg/GLFSaZ/B7p00+Z16XTFvOs70WcJB+ryF894IzjYuUM2EsLy9bJeIjpnQrXVNvJ
 VblpcsXHDKCVGGaeOaF5fhQYUQ7WMdQ3Ks7BG5z1rlbV9swht7F4/d50h+P+7/EoDHbeaLZAapE
 AkYwIUOpaGrWneqUcMbON8nRpK8t6zGm0ifgFY66EKB85r5+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Convert the sitronix,st7586 binding documentation from .txt to .yaml.

Also added a link to the datasheet while we are touching this.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../bindings/display/sitronix,st7586.txt           | 22 --------
 .../bindings/display/sitronix,st7586.yaml          | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 62 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7586.txt b/Documentation/devicetree/bindings/display/sitronix,st7586.txt
deleted file mode 100644
index 1d0dad1210d380849370738dbfb6a7b0e07773e8..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/display/sitronix,st7586.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Sitronix ST7586 display panel
-
-Required properties:
-- compatible:	"lego,ev3-lcd".
-- a0-gpios:	The A0 signal (since this binding is for serial mode, this is
-                the pin labeled D1 on the controller, not the pin labeled A0)
-- reset-gpios:	Reset pin
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-
-Example:
-	display@0{
-		compatible = "lego,ev3-lcd";
-		reg = <0>;
-		spi-max-frequency = <10000000>;
-		a0-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/display/sitronix,st7586.yaml b/Documentation/devicetree/bindings/display/sitronix,st7586.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..566aaf1aeac81657d3a425f1c585894a3a6f82d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7586.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7586.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7586 Display Controller
+
+maintainers:
+  - David Lechner <david@lechnology.com>
+
+description:
+  Sitronix ST7586 is a driver and controller for 4-level gray
+  scale and monochrome dot matrix LCD panels.
+  https://topwaydisplay.com/sites/default/files/2020-04/ST7586S.pdf
+
+$ref: panel/panel-common.yaml#
+
+additionalProperties: false
+
+properties:
+  compatible:
+    const: lego,ev3-lcd
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 50000000
+
+  a0-gpios:
+    description:
+      The A0 signal (for serial mode, this is the pin labeled D1 on the
+      controller, not the pin labeled A0)
+    maxItems: 1
+
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - a0-gpios
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "lego,ev3-lcd";
+            reg = <0>;
+            spi-max-frequency = <10000000>;
+            a0-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0d59a5910e632350a4d72a761c6c5ce1d3a1bc34..58e9591f46c7b3f7621c5a4b66f469ae2a9f9cd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7815,7 +7815,7 @@ DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
+F:	Documentation/devicetree/bindings/display/sitronix,st7586.yaml
 F:	drivers/gpu/drm/sitronix/st7586.c
 
 DRM DRIVER FOR SITRONIX ST7571 PANELS

---
base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
change-id: 20250530-devicetree-convert-sitronix-st7586-to-yaml-db5d82b63ffa

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

