Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7942BDC11
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019648; cv=none; b=aODoSYGxxhXJ3ne4sClc6JTDTf3iCr/GBO8fRC//6SbRuElA353eNX20/SzflfW1f0Tg40sb9jW4s0TNMifbw0N6EU9MMFOn+7G9x6/NmjstyddNbKjJiikkIuISN8cOIhOQwS7IYUItblraZxuvFecfdRB7sZF/hInww90Cgds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019648; c=relaxed/simple;
	bh=zhuGDkkhJS7I8pqhd1IcnO9NCLxsLpxBsArw1hys9IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uH0BzCcixE2alRxCcnG7cC7dHiggf3hjhsLdh4vJlQjY3LDsIwg/EAWtBvUE3IrIxVekTtnFP/HoaoWy1lumFaFcEJMK+nMhZ2YzqCfrmWkW8+PPKVKkf+SDMYB/m+zmuYXmM8P5GovjMxPcJ3BGeWYkQMnMWokhBfPt/DI9/iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=xkpy/Cha; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="xkpy/Cha"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1494923f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751019644; x=1751624444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlCbMuzexlv10E5zuaL1lN5uwOtPNIH7IK7UYUCTH4s=;
        b=xkpy/ChabsZyR6/hwcni+tp6jpCN/9E+qJLWYVeKDqD+rdwk1oPDd7d+zp1cRpisYu
         LqZEdunGPivRLplPnxxwi/seGOKbeCNYwpvstNomjr1yLwFAXCNw67ln5Y5agqtW/S7Y
         3g4ehIcEVYZRyFQ1Dqi/wLKQOsJlXXOKeXurTpL5lOOQNuLBP4OpDCMrAhJc4tPfzsAn
         qpoyhbqyViUdJYFAugkuli2xSSkbSh2ySZ/NIncvlW3BDU5gcvDiB1eUyvv83ed0LjYb
         fFJU3+ES+hI0lFRpb/41bQsldYom2zT3DPNDnXAJYrFaNd7jyj07hwPkO9fulVGN8+Zu
         LGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019644; x=1751624444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlCbMuzexlv10E5zuaL1lN5uwOtPNIH7IK7UYUCTH4s=;
        b=H1azI2B/3AvIYyZlb8Wnuqoj2iQAJQrKRalnfPO1+eNWLmnXtUoueyI7Kj8y0c+haI
         UryO9+0OuAQJ+N82BTwpmLxDmscanff+FqrUJdsku4pZ/ncHsZwjpeGdbURF4IxTR5H+
         Z3bqdPMejYl5YDruWFhntQ2noLD3s65Nc+Y7nwPzcyU+c/tAdhvvBKFQFhcqec4SXCab
         tT7GFIWbamIQlxmorCe/VPmbKVg+FvBRa3DllHzId9/NnivDWWjLBvUI8ZcJBQJ9x9kO
         wnFZc74B+V/lXFkZOsT2ZP5aPpvsXOqy2UC18YguzR7ln8VtYyCbIxhnmE5UlxztI4rk
         HbkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLhW9H9BchP9Pm6OtdfpCYfL/u2TXuEGsGI4rQYrt2o+xNjvyYB7ApYICmA1hJ/b+RjhQ7QivJUFrVNO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzACNd/OXtSOdHW242DlC4I0w3vyPk0idCKP+5EZFQpGfQ6B1u9
	3KR+B1dvR30k43JO16OoJ20Iya14vXu5OkzMEJRL6+QzdmzxT5Twj67CsC2+MF8T7LM=
X-Gm-Gg: ASbGncuWk6YVwzeVZ/Fa71K6EHNNkJeMDdfPPLsRP9OT8zKCz91Q9IEo9aOh7Wzm9C1
	8RqP1FXP+vkDjn82hodf2QJ+2fFM2nY5paWsvqSkRrIwWorUyULoHz4g7Zjn1A7NFipvsTuFzgc
	wC+i1Wa3wrzc/5kEyauZxmhNyZAraiPEn6Axg0uhCU1wRiq9ZdndlXDiWkuZZsPKzV0vbRwX3Pd
	BlCFqzaDi8mS0cPMr5S4+Sgpv+qLeqd7TPKpjI20MbKc/8+AU2r0Kde28nR9J+l/Ei7DgnhlYUV
	wvdiW6C4JZRZiBXswNSSC7kToRLSQS+2ursgxbexh65aCVwGVpFcZFpXkMf8gsuUZygbRlnkW+p
	MtxY=
X-Google-Smtp-Source: AGHT+IHad6lA4a76jkzQzgcDir8P2oxGoibcmqO0xkXRw8HFUVJ8tR6hDzxp1ls+/RojmaB8/xq1Rg==
X-Received: by 2002:a05:6000:2082:b0:3a5:2875:f985 with SMTP id ffacd0b85a97d-3a90066afb5mr2808811f8f.59.1751019643890;
        Fri, 27 Jun 2025 03:20:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:1a4a:198c:c191:f3d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm2331700f8f.12.2025.06.27.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:20:43 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 27 Jun 2025 11:20:36 +0100
Subject: [PATCH v2 2/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-leds-is31fl3236a-v2-2-f6ef7495ce65@thegoodpenguin.co.uk>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
In-Reply-To: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751019641; l=4978;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=Y6HqHEdvYmDTfde8WCMrHIoL7OYunCUZmqOz72jZEQg=;
 b=Lw6Z+9WTPTahGM8jLLuckyw+9mV6swF+niWSYrARAE+0fRjRLzmHfxPpnRj/nH7b2ZvbcP066
 +2sC7LDpNcoD/JO+9P4RgapkEvzx58zeyl/9qQtfU/3LPHQf/qcYXtp
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

From: Lucca Fachinetti <luccafachinetti@gmail.com>

Keep the old maintainers field as is.
Add datasheets for reference, NB that I was not able to find an
up-to-date, funtional direct URL for si-en products datasheet
so they were skipped.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
---
 .../devicetree/bindings/leds/leds-is31fl3236.yaml  | 101 +++++++++++++++++++++
 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 -----------
 2 files changed, 101 insertions(+), 52 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml b/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f26340850647d1c642fb345b7cf90764200e13ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-is31fl3236.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: is31fl32xx and Si-En SN32xx IC LED driver
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+  - Lee Jones <lee@kernel.org>
+
+description: |
+  The is31fl32xx/SN32xx family of LED drivers are I2C devices with multiple
+  constant-current channels, each with independent 256-level PWM control.
+  Each LED is represented as a sub-node of the device.
+
+  For more product information please see the links below:
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
+
+properties:
+  compatible:
+    enum:
+      - issi,is31fl3236
+      - issi,is31fl3236a
+      - issi,is31fl3235
+      - issi,is31fl3218
+      - issi,is31fl3216
+      - si-en,sn3218
+      - si-en,sn3216
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[1-9][0-9]*$":
+    type: object
+    $ref: common.yaml#
+    additionalProperties: false
+
+    properties:
+      reg:
+        minItems: 1
+        description:
+          LED channel number (1..N)
+
+      label: true
+
+      linux,default-trigger: true
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#size-cells"
+  - "#address-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        s31fl3236: led-controller@3c {
+          compatible = "issi,is31fl3236";
+          reg = <0x3c>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          led@1 {
+            reg = <1>;
+            label = "EB:blue:usr0";
+          };
+          led@2 {
+            reg = <2>;
+            label = "EB:blue:usr1";
+          };
+          led@3 {
+            reg = <3>;
+            label = "EB:blue:usr35";
+          };
+        };
+    };
+...
+
diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
deleted file mode 100644
index 926c2117942c4dc200fcd68156864f544b11a326..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
-
-The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
-constant-current channels, each with independent 256-level PWM control.
-Each LED is represented as a sub-node of the device.
-
-Required properties:
-- compatible: one of
-	issi,is31fl3236
-	issi,is31fl3235
-	issi,is31fl3218
-	issi,is31fl3216
-	si-en,sn3218
-	si-en,sn3216
-- reg: I2C slave address
-- address-cells : must be 1
-- size-cells : must be 0
-
-LED sub-node properties:
-- reg : LED channel number (1..N)
-- label :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-
-
-Example:
-
-is31fl3236: led-controller@3c {
-	compatible = "issi,is31fl3236";
-	reg = <0x3c>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	led@1 {
-		reg = <1>;
-		label = "EB:blue:usr0";
-	};
-	led@2 {
-		reg = <2>;
-		label = "EB:blue:usr1";
-	};
-	...
-	led@36 {
-		reg = <36>;
-		label = "EB:blue:usr35";
-	};
-};
-
-For more product information please see the links below:
-http://www.issi.com/US/product-analog-fxled-driver.shtml
-http://www.si-en.com/product.asp?parentid=890

-- 
2.48.1

