Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF013B7A3;
	Tue,  6 May 2025 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523653; cv=none; b=OE1UKMcD/ZKTHz2syNQbmJfrwYMNdCB3U8dR/3mFWQgJbh3hfo+o+OZ3lGyG9WEBPWBc3JrKwaQWBf/AmF6z8OUV9TzdbIgFhlwf9lTi7nexbdEpa8JzCxvfI5svTyYfGjTpRNKs2+fFv+AbtyzipR9BIVli2B6aBvyhjQE/Uxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523653; c=relaxed/simple;
	bh=9/V5aTRRIfGw6pWz8xn0QQl9tO/zZCAJ1J+dAHE0VNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CibhVFqGH+m1ONIKW0DNtPLbTrcbn0JeLcqSJ0Tfvi3sDJJMxEMUUpf9LhZ1UnYxxVfR76DNxx4iJvh8G5X9Hmhy+xGzs4pe06sRtMuWJ+n1/5My9sqg6t9/myH7qi8huWTRP8aQ2qubuXiD0w42RIFVJ5AL4RRg9j+Lbf4I7VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gerdg/Ox; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gerdg/Ox"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso7583665a12.3;
        Tue, 06 May 2025 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746523649; x=1747128449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGu7LhU0yuQjvrQRuLffc4jYy8h9uFV4UIKwGLQkBLc=;
        b=Gerdg/Ox96MgWVMpKNEoPWfW+jHpHONPENxEIyeeFfh9Y9LUkZ6fbz8vR73gTjwF+U
         FAiMQSJwHLQ1Tt0TyvyMH+FVvf2lUv5YGsDZotwSXmVm65IOsX6VIIlEJDZG9y0I6TdC
         LTQrNj+rfMeNNTj7ChNL/bFl/GicQdZAp3eXvzQNunfOigjMEOL7c6heMptAzqnaBLCK
         pF+Uqw2QC1q3mfGELLeq3+nL6XhVWbTxT/gjzUJd4qCPYvPHfM7+wSZKMqLJaixHbEr/
         JLnKeWaNhmYy2DNFFF4SD4btCLGXjTmLlv0zt6FqS5qqRXMl4jg7j+p4jjqJim3yxlNM
         2dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523649; x=1747128449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGu7LhU0yuQjvrQRuLffc4jYy8h9uFV4UIKwGLQkBLc=;
        b=il3akXAYJj1UPIuOMVFeiNDXMtJVdNb8CA8TElLIteUKMzagLsqd79cwEcyUn2+F6k
         kJX68KlrKGlysi5uNr548rdXCwWsHuaq/csBrXasx051LGJrJkxcB+gIXFM6tqObI6x9
         PN6fV+BuGJVXYR1TvB1yMwd2YmmltJwp0Z1Dk+Q4bEdwQ3vEPO/xCBuz/6q3KbyUT4PP
         7rEe9VBxBX1YkZm5z2/rR/xN3tA4bkOJFt3RHuw5A9VSK6mRzYx84Wphsujmnlx/uVIZ
         Zg++jzucinb432pk333ohRsBi8B+3UrKtDYc4p/4vOyL/ETSh7XbzJt4PYIMkuSjgF6P
         wiLg==
X-Forwarded-Encrypted: i=1; AJvYcCUAfaefuy4MW7+32qcXe0yvYlZjMX7F9bqXM5PXACq2tJdRi9IWqrWjFx2nheM7GAP6N/+OJbGtHAduBh2/@vger.kernel.org, AJvYcCX0TAXZtDxSq2H00NgUic5Ul/FbQu9Wnxl1Ih2erp5G5njVKXOozKAI0/P4+mkfC2O7jmKftE02LVpK@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvfWGwYcABSA5qzEKGqgZW/c2l3QJ9UQMU0Ri9E9E3/pRqg4l
	EzdtGgKvoXc3i8DssfMOzbUdxOCHbowXDhFK9RfJVfq8xjipLGYC
X-Gm-Gg: ASbGncvkVZq+mjoftdavEtf5cW2VJbLtqFS107ZCCsnSwVFMOKLpL7BGiJxdT7+aCBW
	32O1nXySZl5mIsOrC4Hzg2GRRBXKHCsamIZN5EMypnk6Ln1FyMx2tCSt80BYFiePJEeIHyMm15W
	3Cpm1Seka4Jxews3CkK/U/Hj711f7X9SNZ0Xr56GaTqnBWu6G4zICtUjJj+uS2tOUd58VitnL8t
	/u7CsoazoDMbrboy92fUaOK2z+SmaoYBH/a5dz5FtMx/Q7zWE2rcynD6FyWAZpJFJJreQkBNGG8
	3hgLRy20y67JT2VtmAdqIBiw60atJj9X
X-Google-Smtp-Source: AGHT+IGhIlN7H6wg1elqqV9jwrYvYXb1edROSQNCTGiGLRJV0RIHV1Wsa8r1kfwlEzYBRxgYX34WYw==
X-Received: by 2002:a05:6402:4408:b0:5fb:3a35:b92d with SMTP id 4fb4d7f45d1cf-5fb700a3992mr1831361a12.20.1746523649051;
        Tue, 06 May 2025 02:27:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:27:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
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
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Document Renesas R61307 based DSI panel
Date: Tue,  6 May 2025 12:27:15 +0300
Message-ID: <20250506092718.106088-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506092718.106088-1-clamor95@gmail.com>
References: <20250506092718.106088-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R61307 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/renesas,r61307.yaml         | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
new file mode 100644
index 000000000000..90cce221c0d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R61307 based DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The Renesas R61307 is a generic DSI Panel IC used to control LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # KOE/HITACHI TX13D100VM0EAA 5.0" XGA TFT LCD panel
+          - hit,tx13d100vm0eaa
+          - koe,tx13d100vm0eaa
+      - const: renesas,r61307
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator for main power supply.
+
+  iovcc-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
+
+  renesas,gamma:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      0 - disabled
+      1-3 - gamma setting A presets
+    enum: [0, 1, 2, 3]
+
+  renesas,column-inversion:
+    type: boolean
+    description: switch between line and column inversion. The line
+      inversion is set by default.
+
+  renesas,contrast:
+    type: boolean
+    description: digital contrast adjustment
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - port
+  - backlight
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
+        panel@1 {
+            compatible = "koe,tx13d100vm0eaa", "renesas,r61307";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            renesas,gamma = <3>;
+            renesas,column-inversion;
+            renesas,contrast;
+
+            vcc-supply = <&vcc_3v0_lcd>;
+            iovcc-supply = <&iovcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.48.1

