Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75C71A5BB1;
	Sun, 13 Apr 2025 11:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744543457; cv=none; b=m52+ci5DkmWuMmXqkoJQOccZBTMF+WiGFUgTe/n8b+iCBJ0oq+j+Xn3Z8sclV8Hsj6nCyCMmEq6Y6w0LkFZhqSFaElkFjqcOGor8ZSGhVwTRdfRVHXzDvRT6JztyB/jPmWUjYSpLBbfQ2Jag+ho6e8KFK0eevEDwUz9P9czXsVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744543457; c=relaxed/simple;
	bh=e44JDTurcj29T35AqG4HSWkYsmP/SkMUhCjVpRbE/jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBAuEEjWG2eu05KzKi3N0yMzo0PP8xd2xgjryOXX/qWgQ/muqfeaUblc0Vu1kIzk+bC+xx8laEPTH97YuoUXK+Pc5kcTyKJSDwLRN35eStpWs686yvFYTrJ9JINGwhvFLyEG6eS4WTXZJ80XQWQAg/Fh1YSTxvEs1YMDhEP5M9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL6mQtha; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL6mQtha"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac25d2b2354so544468666b.1;
        Sun, 13 Apr 2025 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744543454; x=1745148254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6Ds/WXwwOXS2LxRjboUIBqHnuT7BDVjPy/vBn9692k=;
        b=lL6mQthaQGKlcvw0sQ1KCXXp3ISOO+MECgduTBA5mGPuHZgc73LKwt8MaLYajHyl8I
         pfIcAMiaNzcyV4Jyr5w6r9+tLGWYnjEXsQn+VOUXM0KYCcQE2YaJl1HKFdlWi1lSrsO9
         frWlK5si3a9n/rignMpKxSDTqprZaYUS+K2evA1pMvtgp9Ish9X42/KfIC/p2nrW2fVF
         /fmZBX+X33ZGEfNs20F872x5s4AmXtx1hhojXW/xqLvkqrGxZfaemrP3mjTJRScsd+b6
         lYJg983vApLOWKoTU40XHUeqKkGM5Ja1D7PogvhnG7dEUn5aCOkvHBoOkVTOZWwffBsN
         PNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744543454; x=1745148254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6Ds/WXwwOXS2LxRjboUIBqHnuT7BDVjPy/vBn9692k=;
        b=v95Qs8yh0doYDh6/cE/av/iTV7ZwGFv5bffRRENJcZhnyNqQDtQ8Y3Kdh4897/Osz6
         ld3pJ+FikCdgUjWvuHQGPqWUeqvgOJr5HUz1VpOhKk8yudduTDowC4N5qgB1eSM+FtdB
         UpD6UoQFg0TuTNtkyJJ5o/zs+HB59kX/N/hLpfOEP+bL5RP/IfDEgeeaWPyvbH4kGZTU
         3oj9OMMBjlYINyl8NAQQErY7fbSj5YpAtdQh4XYgQw5ZnB6+Qv5urSHmIQ8BacRu9GJg
         LV7NJn8oLPG15ILRFOZ+ZVgoGQUFwZheu36Kpq6k4FJPdDOHSIONrhoHJxa4RLbRZMvZ
         51Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUoX45GVDrBR94fAKuwGUjez6l1EIVeO65wma+DY3x84s2IAb8XRp2sy25wvvdmBw8up6rl/2qQpwOc@vger.kernel.org, AJvYcCWC8pjh5RjB55AR4iiOIinlPHMjs5mtD/n1QQfiLl7czW+Vm9TcfzM4vT2OQL/kis8RpoSKnvUKFZbPfhBQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8rXwrfAkF4VEuKic3Ey8/tS1r8xj03kpP748Ejo87vlk+E0fy
	R/I6LpG24apsawtjty4k1e5tByrftE7zdaMEsw+9inz2sE8vTmSj
X-Gm-Gg: ASbGncviOgai3xGKhNS0iy7WWDQgBjUxeGlIDAyL4h8zKGxpE2umVIXFZ/CpAvYBfIH
	7W9nO/VHa8JH1vjV7jcw/vUh9j1RAk21WUhtEpDv38Gcjr8XCG1Pwr9CEalpElrT/rsf0OZTUGM
	juXU4oldXfGicgMoSqT7fLjqK+NX7wCotFrQnFN8yytPTiZMwph2ZlzvUfv2ll6/9tGbCRdd9wz
	51vVp2HcDqbnsFmMDoNUfZEYAE+GoT7diMCf1UlNoJNW5gJ+cJN6C+w4B4KX1mOjBwby2ssxBUa
	aSVv581wXriL37dHBdSd1MGcHCOis9tQ
X-Google-Smtp-Source: AGHT+IEciaIr06kOGR0nnPGbDPXpYxMvoKnc/ismTVRije+f6q0ejAbezKsUQPswyctMJNJNmBjphw==
X-Received: by 2002:a17:907:7245:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-acad34d88b2mr697806766b.31.1744543453888;
        Sun, 13 Apr 2025 04:24:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4110sm733529766b.91.2025.04.13.04.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 04:24:13 -0700 (PDT)
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
Subject: [PATCH v1 3/4] dt-bindings: display: panel: Document Renesas R69328 based DSI panel
Date: Sun, 13 Apr 2025 14:24:00 +0300
Message-ID: <20250413112401.12543-4-clamor95@gmail.com>
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

R69328 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/renesas,r69328.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
new file mode 100644
index 000000000000..1c1ce5ed6f2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r69328.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R69328 based DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The Renesas R69328 is a generic DSI Panel IC used to control LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # JDI DX12D100VM0EAA 4.7" WXGA TFT LCD panel
+      - jdi,dx12d100vm0eaa
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator for main power supply.
+
+  vddio-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
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
+            compatible = "jdi,dx12d100vm0eaa";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_3v0_lcd>;
+            vddio-supply = <&vdd_1v8_io>;
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

