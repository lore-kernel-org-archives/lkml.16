Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C61586C8;
	Thu, 27 Mar 2025 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093549; cv=none; b=eWwWFY5VX3aWs+KOS8e1bVeyNllSo8JJHL2ul3jERjBdov1luCTrAqKeB3d6Ig2jRl8v0ErL0PIJTgAjv0KAMaolsdBMvbzSn5nlI36bw0nV8V5bMzxrV33QAaKrZbZawY7oCo1h4J7eFTlfs9VFt8nranC4KJhfcPXpXM0qrzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093549; c=relaxed/simple;
	bh=wLOB9y4DPXrEOgyrYWOp5459K3Z4tRh8BQGjKP8S8V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTbIHm3AIhBO7y85myjs0t7qgZgxZJJxdVGCLFvWkAY40pSiREbY+OsdBI6gCG4sDlXDKWGhZHcmtf9LtwyTN4cy1JqXztTrG8UItBZitYwuuAN/ACrZa+D7fOmjeVnhQ5sVGYeDczYEJD82VEgezzeyon0odszqcAF0vuGFCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtaKKGqQ; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtaKKGqQ"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-30bf1d48843so11177591fa.2;
        Thu, 27 Mar 2025 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743093544; x=1743698344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gp0Fu3ouz4uc6KpA7K7Yg17pL+gYDllzv0em80pWIw0=;
        b=QtaKKGqQpOaDZATfClnHrNAHCJIFRkUsaXQSukHHMM8AA/6v/D9JmYjOYft/vAmnTv
         +ZEVk2yHyzz22TdNEPAkMPFVJhm0pMMwnMjBWRprJyKpqMMYdKdOCQk5JKrDrzYcvwvh
         Bk9PmJXYQzLVdQLqNSrn9CgJI6m116wBhkjH/p+cts4nHgz+7dSnbG7s83gbUbE2Alve
         Wr5OQhDB9pLa6G/rwEHMNwHwyZiJBPRpn7tvG6tk+KY0pnacCLPpBqxCaP/gRh8vC+Xd
         YeHYg1ofTlpA0aGPIZRSNAqlrVP1ESsMHaXNZc6SgrRYM3Mi+i6Sa8MEdVUlpLeKsanG
         wrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093544; x=1743698344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gp0Fu3ouz4uc6KpA7K7Yg17pL+gYDllzv0em80pWIw0=;
        b=otlhei4dmvWW4NpT+Qyy5bziURXe5fPg7PyNmkfhGJrsVtlZ6l3ItoM8glgVC/OaOL
         YbyvGfrQOmd8V8oqfMP4VTc7f8oZgcg4jMmJbD0IKUx63us7Hx68gKUhj35kUgcKjcZG
         Lcpzpzspuk05gGKoN6PVwqjiAAxoRWP01vgeHPe7tWFLgOq/5tkIO1NZa9WNpadzOd87
         wLuCkv5DFIlsZkM2MMnQKJSC+aAYZ3anLRm76gc+PTfOHU7s4+JxR/PeF8FW/q7Se5Ts
         kcZuczH26MEkBdQMWaVX5cA+FBdySguGHAkqyx5E3ovEIhinzFXHLV9aphWoUu2KsRcg
         mG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVq+Sg1IhFf3ruU8Am1oyt75N35pgiPJu3sI+5f3i/s6fYij0OBNrBpFzIc1MLcs0/0nwIJyRLrtub4Kafz@vger.kernel.org, AJvYcCW0Yhraiom6rl0BM1kgYyS0RlPMo/suTdGr+rTxEdl0kOgK+y1/aM31oc9Q4B/sViI5k346HoO6r9My@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu8p+U+laxydXWb1huTxAFgf2FjU5l3EpO/c2MzNbzuYs4K4nQ
	O+O/8Q7FMfMm8HRofgan+BaD630WkShBjia6vSxCk61ulI288aRY
X-Gm-Gg: ASbGncsOMDpsP3NN6e7NKNxCinDloqHKhm4+hevM8h/lL9yWoqd2vnDR6KZbIW/5gY5
	Z8Y+d49h8hPjGIYSTZAc8K0W3FDizKXbHYuozRmNTBTNj+fX5RwS0kFsdaIN3nHooaNQdZ7pIcV
	jMqfy6yrPuO9mUcGHaajkDxFWL7FGN9y7CBW6SfslhvJ7bzHM375rg7zOKPob9tiCfap/MPZPzC
	sPPqMUb37g3n/zvqHWKfsuMwDytr/Ik9c+/vCksoXwGJJ4qgzfYM512wmug0D5G632GD1GDZTpe
	6hDfDt2zluiKyL4ZGv31Vkc4jCcjQx7t/+xhAinUWn1gg31dTOjxFX+T9g==
X-Google-Smtp-Source: AGHT+IFQwu1Y68UvrgupbE2Y9sQpN7MLE/jssxGsoGgiHHOFdcRsTbQNTBxX/oUs5XurF+hk2bd7oA==
X-Received: by 2002:a05:6512:23a9:b0:545:27af:f2d1 with SMTP id 2adb3069b0e04-54b012532camr1744900e87.44.1743093544034;
        Thu, 27 Mar 2025 09:39:04 -0700 (PDT)
Received: from pilotmaintrash.lan ([178.34.180.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957feedsm10150e87.110.2025.03.27.09.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:39:03 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Visionox G2647FB105
Date: Thu, 27 Mar 2025 19:37:44 +0300
Message-ID: <20250327163750.986815-2-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327163750.986815-1-sanyapilot496@gmail.com>
References: <20250327163750.986815-1-sanyapilot496@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DT binding for the Visionox G2647FB105, a 6.47 inch 1080x2340
MIPI-DSI CMD mode AMOLED panel used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Xiaomi likes to use different panels in various revisions of the same
device. A factory panel even can be replaced with another model in a
service center.
So, the power configuration of this panel is similar to
some Samsung AMOLED panels, e.g. samsung,ams639rq08, which can be found on
other sm7150 Xiaomi devices. Even though Samsung panels weren't used
in sm7150-xiaomi-tucana and toco, the described voltage rails exist
(confirmed by schematics of the device).

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/visionox,g2647fb105.yaml    | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
new file mode 100644
index 000000000000..49dcd9b8f670
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,g2647fb105.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox G2647FB105 6.47" 1080x2340 MIPI-DSI Panel
+
+maintainers:
+  - Alexander Baransky <sanyapilot496@gmail.com>
+
+description:
+  The Visionox G2647FB105 is a 6.47 inch 1080x2340 MIPI-DSI CMD mode OLED panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: visionox,g2647fb105
+
+  reg:
+    maxItems: 1
+
+  vdd3p3-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: I/O source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd3p3-supply
+  - vddio-supply
+  - vsn-supply
+  - vsp-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
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
+            compatible = "visionox,g2647fb105";
+            reg = <0>;
+
+            vdd3p3-supply = <&vreg_l7c_3p0>;
+            vddio-supply = <&vreg_l13a_1p8>;
+            vsn-supply = <&vreg_ibb>;
+            vsp-supply = <&vreg_lab>;
+
+            reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.49.0

