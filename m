Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6322EAE6;
	Sun, 13 Apr 2025 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744543454; cv=none; b=gi6RZL00G2rxVtIOCEQClKoyBmfWjm3ryHgtVYM6SL4WER8o7Sp/Lqgfw1pfnJ5+JxvYjnpenjeQnLDxJdtO6dJDMK9mYBJgkScALziYRLEm2/wFCrYtmkwkxlrZ8C3+UzrppEcjzGtdVPqPVS/N9lZBg5NNK5tp6BvpDrPttV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744543454; c=relaxed/simple;
	bh=UYty+LeaH4KQ6W1Va8JsDCw8e/ZbmAEjY3vO0gYWe5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSBvo714BvwxmNdQsfhoDIUIj/EP/g0T7uw4oQofoMueW5EoJYc9QytJcTcy+zQRnM0D1XKTSaP+CXkOSgQl8oU+nPcTdgsV0tZMKA141YnedQVhCR6BKxeg80x+gyK3jHNXWdbTwge/M3PJP4O0bxTDiQ+shuOO/T0+PKo7B48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGsMPfJu; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGsMPfJu"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3b12e8518so572097966b.0;
        Sun, 13 Apr 2025 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744543451; x=1745148251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjOM95fm1yVEjV9ys9LW6FSvq+ho9hkw/imzPFIIlXA=;
        b=BGsMPfJu+eIL0It2tC/x7+2GJvyywC/W89mW25y/tPQXLxib6LTiuI86kavVqixlp9
         G9A5DNrbXMoMazXhilgQoCervYzj3UOJ6KXNzzLWAKIav7ZPorCy1ClKvt9AzJOXUwaJ
         PK+NGTBFnHuhB4+Ui1e3a/Wcj/N5AEV2JJxHqiU7J/t7MMFywrjoUJ7W/pc5kxU2+5xT
         1QsBW3jpl5ne09Zcx1FRySS883sw+S/8PgJNx4PAhDFbR9Xl6OSqMhurEPKS1zqkmExy
         rZsytGSo44WKJM+WKyHAT2ksfEQBJ+3NjT7r1sIMQipYaqaykoW0MPE/dZDDxyH24Lmw
         mI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744543451; x=1745148251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjOM95fm1yVEjV9ys9LW6FSvq+ho9hkw/imzPFIIlXA=;
        b=ebsBY3JUm612tSrp5LUa9FuIYyu3WpiMugMx+cnD6qzi0b5vaqc10duWnAID29oe4g
         8cZ6Cv/aXHJwCntG2j6Y7CvjKjRilBAtdDyqgDh+jtqKGB0304Z9ocU7c3hfnDiDYJBr
         7J1DUOcWVXABUAXko3nhpJW8e82PtPhVSZzU62H+baE4kpaV8x9eyo7znoFAFZpOF0nW
         S57+L3JCDWoELdWEgtL/e7Nj896+cVk6RaEF9FM7Wcr99ZjaQDlh/SlG8miNNPnBfTSy
         n6A/PcyIqwf430sOFFQq06vUwZZE0GeWCjIPOmXoqOojEAQGqC0OCA2Tl3Stz2120Dy7
         llLg==
X-Forwarded-Encrypted: i=1; AJvYcCU0i1Bgm3rphwvI5nwp+tTxFApBolzLTFjktXdNWkOEwWYILBBhRyNNdpoN/zhNIe6zkOID4QWvn5k1Ftf3@vger.kernel.org, AJvYcCWLJyEKfGkj395jITTDnapsJxDRC4oVy+SYTfFrF3/it3GvQVJp2dmTyIOKrAnkqEgU0ejzZi0UK6AI@vger.kernel.org
X-Gm-Message-State: AOJu0YzCGbbEqS27HHHtw2BTYH8hUlFTgs7ctzyi/kX+rymPjGZhzRNT
	wVVkDhj9PvBbUguMi16So/oitzQiMVWIhAvPJ5wP9UDDLVeWEwiK
X-Gm-Gg: ASbGncvM0CpkJ8/qT5e1TO27dGwD+iq1lbAlbKwT3W+NbTX4AuiTIgcBIrkfK8bdhQJ
	8aYlo6l8Fx91CZwzbpReEdy0O4OqlTXHn7PAz+r4TYNttNNkQVW97D8/XZsciBirvryzcmQQ7yN
	lsUuamWJIwMhT3bxj6BosM06lBQl9Vwstp8s3SoTxHdhFZusi8eeyQZXrfNNq7mLgSChifuQvjk
	eCcKJbtrSitj8dY1qilSfVasFenX5yeUerkFsUPqmzRW0xZMajjNBN3eNBzHFsYY0XSFeW+9Cfi
	WEl3MqmMbDve/tQbBIqf4Ussp1Nt83W7NfJWfWkFuKM=
X-Google-Smtp-Source: AGHT+IF48B0org9fI292KWudE0JfjDywUs60JfFMrUG4ufUZmtoEpqXk6c+34TImFvFKTJJseY6e+A==
X-Received: by 2002:a17:907:3ea7:b0:aca:a1c9:d155 with SMTP id a640c23a62f3a-acad3430e5dmr685779766b.11.1744543450945;
        Sun, 13 Apr 2025 04:24:10 -0700 (PDT)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4110sm733529766b.91.2025.04.13.04.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 04:24:10 -0700 (PDT)
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
Subject: [PATCH v1 1/4] dt-bindings: display: panel: Document Renesas R61307 based DSI panel
Date: Sun, 13 Apr 2025 14:23:58 +0300
Message-ID: <20250413112401.12543-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413112401.12543-1-clamor95@gmail.com>
References: <20250413112401.12543-1-clamor95@gmail.com>
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
 .../display/panel/renesas,r61307.yaml         | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
new file mode 100644
index 000000000000..a98d2d2e02d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -0,0 +1,93 @@
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
+    enum:
+        # KOE/HITACHI TX13D100VM0EAA 5.0" XGA TFT LCD panel
+      - hit,tx13d100vm0eaa
+      - koe,tx13d100vm0eaa
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
+  renesas,inversion:
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
+            compatible = "koe,tx13d100vm0eaa";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            renesas,gamma = <3>;
+            renesas,inversion;
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
+
+...
-- 
2.43.0

