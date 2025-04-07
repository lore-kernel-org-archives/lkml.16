Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0374F2288EA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017194; cv=none; b=IjJTeHJSgpaVJJM/JSCmHvwpLfyF4rq7coJgwVf2cc1ug3Ux6HRJiaKs74a8nVzyVXzBUBgiuJJQ7y3L+cWGDlI03BUQtK8LpGKxlRXc8iStKIMpIGqP4dQSj4SdmBcKxdb3M43fXlyYKqEdZ/vA1AGQXAPC8Z/venV7rBz749g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017194; c=relaxed/simple;
	bh=ffRvJE/4BkyQpmYML9g9ITvn94Gn2ipUOTX9D0Ct3KU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRKHppPiB5GFNOo2U7jAoK8Cge0a8Dg659hyulcuyLIhzgi1WAWSmkVy4JfTynZ+nwp2y8I0WPE9a4c7SyqM/diDOSipdwmhodMv3V+MSEzVzLNyvKa6V9TvoOnMgoQHQrWOYcP69P93ZEjuroMfxObFA/oA0s5xeSIEH/OF8S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QxwsdBE7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QxwsdBE7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efc4577so2162847f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744017191; x=1744621991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhCv4j7CCOy4gHHp9VAGi9s30D/BhAAdMeNmK1XUyNQ=;
        b=QxwsdBE7x+tpJhCP2ds+dEbRaaA2e6jOX0RSMcxkGd3lkUtEpDyGHZCZSlq3MlNOLR
         gXolXH0Cz+w4hsQAVuAU9jH7Y+JvC94jLNHgcXdkHjeHMgAbuEWrq5nIraMiDJzf4UM0
         Dmb/XSG82n9ozfJl/Vwga+rVg734IVZjCh39PkH3blK14KHZTsxAyrzn4DfkvO3DbeIx
         K/eQHKhKLJi2tr+zjPXrxk1VezVTfGVHHmGI/5S/G4HNF4Cq7YGtsNPbtAYFsXrNjEP4
         Sj1AuxyD4VgkqE0dKCc3sVqlQKcS4pQ6ISZuDVjQEyChm4AegStM3pjS9BxH2Xjaqt+K
         EsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017191; x=1744621991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhCv4j7CCOy4gHHp9VAGi9s30D/BhAAdMeNmK1XUyNQ=;
        b=wWd1Ui2F7XXtQ7Y8JiR1HU6zjLNUZoVit7jqK3SB7lZwPqA1OIc1O/OSshRd8jG9Pu
         78UUNqusUzcNWQJRb3ARqQbxtvFy7Q75cKduLDBr+X9Y1+z4vrBFr98y8aHrRdPKkR76
         Mojhq/MPJhl3mnypRkn/sAe0UWM71CsKlYKVKEVCDco+q9IgD6I1UVQyCyYH7pRv19uA
         9ZuW4f4C1wWxnuRu7j+T2d0jksS7GKYwMted2W6l+KZXbGWE0U7zpykmQwkFLlMZve8Q
         ouUB1VC3qplQjliGYlxHwXlkWTCmeYfrsIpQji02Rsxge7w2VO62UIa+xrg2nngNE+DY
         4/HA==
X-Forwarded-Encrypted: i=1; AJvYcCWjEWdYHMLi/b3XSBJIz+9XDTiKMIidS+x5AACL7LYKkixqarokqkF2tZAknLPwNCFGxBoUZmgdvCjT3Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1DP2g3ImWNqE5SGDiErXiaVE/ffqu8fNNVTg67vrCH8SMXyXn
	sSa1nOXoR6jAyiDd7CSz8XAe1UW0Q9WlJpRraXeEaiEfIUl4BY60A3RcY8wsc4c=
X-Gm-Gg: ASbGncu7KPF/BoEJyNIKRUFG8JbfVQw95IbNRjyxRWugttffBi6lCrhH/fbtLXVQWDr
	SxstF69reDJ0u6hk2PxMchxXiIUGV97wvPxpV/ihLkK1bfLT+oZ3Qwokz/M9GwhHqhu/OsrCJ3S
	LqmGjxdABi4haiNepLoM3BPVs+KJg2ol3B71OkWWcqtuI0FT0X41TSkQNzhjZHnMtl6l86vdxnx
	T/MS34NfxXxacd/MXN4uIQf9fXQHYLmHr0uf6g24cc6cmvYbEnuijUwtJ9L4n5DdP4ncjeQ8U1O
	fDnj49EIkNM/JlEFiK9Tgz9E0pM9XV3Y6slMlKxRz3DsLWCsfwH5drN2xKl6IoMSpbH1ZYVJGiX
	E5l3gwunk4A==
X-Google-Smtp-Source: AGHT+IGs5HlrDGvZVZkhmSuKrijT1Ug79ZSuEMbsX26TOBZ6vvC2KpIvx52Q7XQg7DUkZOdtIJ+lyA==
X-Received: by 2002:adf:9dc7:0:b0:39d:724f:a8bf with SMTP id ffacd0b85a97d-39d724facb1mr4328926f8f.4.1744017191269;
        Mon, 07 Apr 2025 02:13:11 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a9bcfsm11673977f8f.33.2025.04.07.02.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:13:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 07 Apr 2025 10:13:07 +0100
Subject: [PATCH v4 1/2] media: dt-bindings: Add OmniVision OV02E10
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-1-211e3e6fae90@linaro.org>
References: <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-0-211e3e6fae90@linaro.org>
In-Reply-To: <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-0-211e3e6fae90@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add bindings for OVO2E10 a two lane MIPI CSI, two megapixel 1080p RGB sensor.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/i2c/ovti,ov02e10.yaml           | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4ac4e11a16c8bb7a53db0c44289b1004dbdc282a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV02E10 CMOS Sensor
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  The Omnivision OV02E10 is a 2 megapixel, CMOS image sensor which supports:
+  - Automatic black level calibration (ABLC)
+  - Programmable controls for frame rate, mirror and flip, binning, cropping
+    and windowing
+  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
+  - 2-lane MIPI D-PHY TX @ 720 Mbps per lane
+  - Dynamic defect pixel cancellation
+  - Standard SCCB command interface
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov02e10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    description: Active low GPIO connected to XSHUTDOWN pad of the sensor.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov02e10: camera@10 {
+            compatible = "ovti,ov02e10";
+            reg = <0x10>;
+
+            reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_rgb_defaultt>;
+
+            clocks = <&ov02e10_clk>;
+
+            assigned-clocks = <&ov02e10_clk>;
+            assigned-clock-parents = <&ov02e10_clk_parent>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_l7b_2p8>;
+            dvdd-supply = <&vreg_l7b_1p8>;
+            dovdd-supply = <&vreg_l3m_1p8>;
+
+            port {
+                ov02e10_ep: endpoint {
+                    remote-endpoint = <&csiphy4_ep>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...

-- 
2.49.0

