Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729821A00FA;
	Sat,  3 May 2025 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265331; cv=none; b=LPVDjVUxe6f7Uw0VSCMRSsDMbCU2RIHMQ/U/KEG0gSIrKNsLsA9EH3M3jgMCOiiuNFbKm0YMdvfh7JDLPSeFhNlASTpoTuEdwP9eUY6MpSpXfqGSstDm9SlMPiv2dJDxfl+XKvOWxph2dEzSY5i3YOE9ZSN2XdhR8JLccrlI428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265331; c=relaxed/simple;
	bh=S6bpBIuGgveLdzdWwhjezZy/9OGuE1zqVKbRKt3mA6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORkzvhfxiTzsGKcr+5DuywC/QoredhjiWQOVkoSP8AYZ9vp45rSp+T+SdKtm4PFLTuHT34MQATBJNBrv7AgYjju+ghjWecGrUgvva8lA5AERmk7zsDYag7DMDJmgLWQwnr8Tp+yb27DlmzNmT8EYTuokg+2B6/1MA+rapu6Xqdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOinEa0J; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOinEa0J"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso592475266b.0;
        Sat, 03 May 2025 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746265328; x=1746870128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZ5+vrBCZf3qnHzGM1XFaeuPMPVV5JXl/VDzCLGAaZ4=;
        b=nOinEa0JfORVKYvPJzwKU5d+sAGKKLt/E5bJJN2TMNjozgmvVdlsoESZSUOmJcm45B
         CLStfTLO9s6REjlcMagjUDckccLzjDVJCB+cdahgTHpppjQkO0sW6KkcgJl27V5l28hO
         JfCu0ALgSlxalPOVasbqYpmt7hOkqhJV5fnUH4BXutmD8S7YttGO44Uu53Zvuj0Fuqdo
         lpSIaL6JZPLi1X+wbkKltMLuGhESTxTNIV+l5LcyaZArJO3WGJZPzX3IbFiFyYCmCJdD
         ZTviimOl95xEcKKL1uvNA5J9f+B2fEHaceydegbbsW2mGiOfG6uQ392Tt7b98AV8dMWS
         bHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746265328; x=1746870128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZ5+vrBCZf3qnHzGM1XFaeuPMPVV5JXl/VDzCLGAaZ4=;
        b=XfQZ3oFCoFz/6fLXr8Skd70m2zEkNqckfXJlpbDJ1ZgNj2V6m/JuPH8CYZkr3t1q/m
         9clIvpGvFxKTg04uZ8S7dNWQxCT4qzdpPiOiHB6LpTo3hKcexcl+7Bxze77REW9AyGRm
         7g0CZaNaJaMFmVsG89ByYUR362mjao7uwrXC7mIOEeb8y1Az6Ff/2aogrfTaCg1tUJI0
         aOc3x2Bgvt1VmCiac1eLZmNM3QTiP0omiHLap1eO+r5OZEP6BD5JgmVifk3WBdKLzotT
         ktcpuwrlPl7Tev/YYcYuiQqpXq2aj/xIjdsRARiGqkcrQCTkzZKMYtiZcs2fEH4yypkY
         R7UA==
X-Forwarded-Encrypted: i=1; AJvYcCWDP3cmbabkJX3Ugrh6B/TixUJE2EUFQwFX9nVhVw7txB+msvLm+qM18nlBuUuVZxsG6Z7i1C/OvImNmWAM@vger.kernel.org, AJvYcCXBvcyRNrTe5m1X4BLag6TS/zOsDJrTrAHTdkHwhO+jD86o+0NPl+gNG4VL0P8YOiLBcWjLULtoG68j@vger.kernel.org
X-Gm-Message-State: AOJu0YykP1QajAZ/h4nUznwSzyeXLO8pc9TUIe3ulasmDoSvd/n3inlL
	DxgyVjI5iahXTFNIDysxXQGYDN4xvAEYibdGa01qFj+sLaJ/j2ac
X-Gm-Gg: ASbGnctM3AEq3G0UnzoXemV/M3HnHDMcNNdm5EQyyC2byZVqcVhBngBktKZSA8Mq3PU
	Ygptwlh0Vnvv2pcFR04UyImv1zMrQewWJY7TyVqASXDg/ZWA54mctrEinMAEN82WGd6kCTUsYd4
	668cHPy+XogwbQ5046xiRaBOK3+i6StXcxujAEOyP3uNt/XjGrV7YsXGq2SwH7J5HDYCVqd2Fzg
	Y+2x1TdBnLaCvobHMh32NIZGcTY1hpZGr7jgdSoG1Rf7KpsSINJSqMMMPrfUgpRGReo7B8x4O6h
	qoFnRK42yyDIve6jbl9Kckw+gJAG3HuW
X-Google-Smtp-Source: AGHT+IHOzKPlJItoJ2PZSsnElU1LHSxd4nGGa24z7iLVS4zGmCRUu3tnn13Jw0QCR3K5wa17W6B1rA==
X-Received: by 2002:a17:907:948c:b0:ad1:7858:a775 with SMTP id a640c23a62f3a-ad1a49afcdbmr37783766b.28.1746265327414;
        Sat, 03 May 2025 02:42:07 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 02:42:07 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: display: panel: Document Renesas R61307 based DSI panel
Date: Sat,  3 May 2025 12:41:46 +0300
Message-ID: <20250503094149.29201-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503094149.29201-1-clamor95@gmail.com>
References: <20250503094149.29201-1-clamor95@gmail.com>
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
 .../display/panel/renesas,r61307.yaml         | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
new file mode 100644
index 000000000000..7673decb71dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -0,0 +1,95 @@
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
+
+...
-- 
2.48.1

