Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79F3268FDA;
	Tue,  6 May 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523655; cv=none; b=A6dwlish6XrRAAo4tPZlRIYh0516CfZEJVIy5P5AzS2X+r6M85KvQ/VAGTglO95Bvu4ulBGVaK7J5mHOxDKBzpskpYzxgpAyhC5+pjYOSP6Ky+pf13zwz0xjjsFH5Hb34UAEo/ZrOOzR9mWAU8smby0p0Aq5AiNwHsoRJEm4z1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523655; c=relaxed/simple;
	bh=Y2OqYNAnBzFByu4hsQcFXOS4vWvZGpD9V5w7dfq/Efc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dhn0HHtPVDpq8icWDjAueJCVmnc10/azuO6OfJ/ydodMp2KcANAGp1d1FbqEymXX8AZY14EJ5x9v0y9qkrxqJP/JQguYmqzwVZ4y5OqojP5wfvu8Y7TLM3m+wSc+NELVr6IzB2A52ZMZrOzkHCg54cBIx9hAcTGcaG3LgXaaoqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZwxZvT4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZwxZvT4"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso10651875a12.3;
        Tue, 06 May 2025 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746523652; x=1747128452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxclTCAeGds8LLW1NM4RM1oKe/mjBCeJiTDF+lZAFTg=;
        b=BZwxZvT4uobFUE/iUyIBw6wbftHJZQjDv6FS9H7zrBvIHV45vnPyfPSjYd4VEyZCYN
         0u7M+Ianibf219L5aL4SAiavpDqoAj2ojKaA9c44H3NL/uDv3sYmjDZt7dR+3fj2S3b8
         gIlsli+K9S48gLWlxbjwfzRpE3jHbqws1Mt1eypiqPDK7Gysp2znXdxc3w8MSpbpOgiS
         EgfQlfC7IV1beHqKm5dLrQqCleBE38584CmldOQw/VIEb5KCpJTUor8QjJxUY2wITVqJ
         S1j1snabjZJqCByMURm3KO4Sa9F8+YBz93CpbgIpwXLxqeIP0c8EQE2kn8JTYaur4cki
         sFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523652; x=1747128452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxclTCAeGds8LLW1NM4RM1oKe/mjBCeJiTDF+lZAFTg=;
        b=tu0RJ9Kc15UIHu7zWeqveVWNR6l+DOMDfETAjsXfLtfo9FSBSmcPc/tdt5mbMwN4jk
         KOMrX9PLG+CGyNcBbX3pM5ULv4kBz7tJzL5s0KpR3dgIecLg9Bf+pnt69ZLIxXaKKa0l
         B84Yh0FSkY2qlOqQ4houy2UuIWEPfnbfe00DEZpqbvUJFO7M2TCaz4KTCREQJl5icMhM
         Lb/aMUFs9iEOqplY4wN+wdXXdeyMOac6FNC5hv5z/Ut99RyN/1tCDeIhr6c0S1kOfIOU
         sc9oO6eRxJXKSZ16WQnUDvu5r+poDXlkMKjDlIqfyL4GlkYzFKlBxaLu5hNs5WzHfIKg
         yq7g==
X-Forwarded-Encrypted: i=1; AJvYcCUHSm3RMVvCuNbuMZmcS/tOrZ+gFjIfrCq0aKxsKY98wmL2bR+DYOSGdy4ZJb2MClIXo5jvjMVJBjOb1zQS@vger.kernel.org, AJvYcCVq/bfQD7wbTqMZdRzfTnjA/TOYQ5QmrhwrGN2rrp0Iirpr10H/R/R45Y55hIgEyFgsh3XVFUJoMwGN@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhVU0EuCYNzv/OjwPP8nIM8MjuP7xCMfbr4HShEb8r1Q5tDyh
	Vm8Lm8QVIBCMCDXimUMHdqlHf/V/L/tEFpDuorVVozc3L/4Z6eD/
X-Gm-Gg: ASbGncukRRapWuCu/taqe1VmARhOXdpvLOsUZ5fJ8Dhg8kFbrjNV5Q2wNu0H4phwbgF
	G4OpkFHLsbX3vzBdrkQIBdZgE5TmIVgRlzcMJvHUTtbs4Tk2Di44EssFqIrjV55Tv+wOAFmZ2wa
	M7JoeCqvOm9+SgNsmpRqxbzg/yv0c8+9VLe3sDMjKgdNFVuLcx8uhOnSXtMK2xJadlRAzkqdVkg
	AxXFpFUOdzeYErfxkoyHBuNSqIcu3BZ5BgTsH48XvsEDIHcaoBMqsxvFVweXmv9xJYD/heWhOj6
	mUB39avo4yTM25tJQSIh0yaNCEY8mA6S
X-Google-Smtp-Source: AGHT+IEFa1KPCMcGzEyD/hRk7PS2SrHoUwG+ZO38xq62Xc1q1Y49IyeCT37K18iht/eL0s/iJUhdTg==
X-Received: by 2002:a05:6402:90a:b0:5fa:9222:e875 with SMTP id 4fb4d7f45d1cf-5fb700a2da1mr2080108a12.18.1746523651743;
        Tue, 06 May 2025 02:27:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:27:31 -0700 (PDT)
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
Subject: [PATCH v3 3/4] dt-bindings: display: panel: Document Renesas R69328 based DSI panel
Date: Tue,  6 May 2025 12:27:17 +0300
Message-ID: <20250506092718.106088-4-clamor95@gmail.com>
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

R69328 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/renesas,r69328.yaml         | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
new file mode 100644
index 000000000000..1cd219b510ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -0,0 +1,73 @@
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
+    items:
+      - enum:
+            # JDI DX12D100VM0EAA 4.7" WXGA TFT LCD panel
+          - jdi,dx12d100vm0eaa
+      - const: renesas,r69328
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
+            compatible = "jdi,dx12d100vm0eaa", "renesas,r69328";
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
+...
-- 
2.48.1

