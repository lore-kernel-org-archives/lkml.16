Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AB9274FE2;
	Tue, 15 Apr 2025 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696768; cv=none; b=gQxz+d1EZSjV2uXcSnb/rp4JFBBBTQ5DUVkoZ2M5Nz7k4htJKdENTqXvTsYoXkmQwjJdgojb0xaeh8zX4BJlkg4waJ3Yr+JjNtRX0fT6GO6pX7kvG+bSZ7BvKOuLIBUTsD2Wom2SnHZs+N21YHCPRyHR9saHfCqPacOu2RhShmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696768; c=relaxed/simple;
	bh=ErAJptKe6TjqvTV7sbXPcZTT3k+iErgPyt0n2TpvVKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFK5NL3jLUJt8qG8emhH7ctH+JSBPuwx8qpc9xmjAcG72CJC3pgJHKQ+cgycvfOatcPQGeo1QtElp6673+pne87fVRl/9LAvpM8S1NjXSjeiRkHk+z772FoRFh0H164EQfh//J3gm0Hmx5f4urPjP2BB/yPuyPcSC53o1aRCqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moX6sR2r; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moX6sR2r"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bee278c2aso63878201fa.0;
        Mon, 14 Apr 2025 22:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744696765; x=1745301565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLdEzSuylgtZwcH9L3QftHbXB4fESiVriulAmrXqI3w=;
        b=moX6sR2rHPolJIsC1NRqx01xS43RMGM5cXN7rcLT52ntJ+HmLR5JS+XSPG/UBPXBPb
         h9xLzQ13eMIiK5ttwfqBg45LmRjKCj+Yj53VqfBGdUpUBX/+4GdilQXUe6STIeYZG6XZ
         Rsu3e4PoI87lN++GRWb2mPabVkgWkVcZFc7+u0pVzF+PcI9DovcaLvt8CSEju9HijZ/Q
         9FX2iREBiZMvsJvLr2tDpxExi6dtz+eYxN2a11+J66kbOZrdwYF0lCnEB8eokMmU9e38
         LInHW3SZXHGrlYn+YS0uwBYRLbEUrRNTHPoJBuCxdnfiiGz5NtdIuxAOFePXsZ8aTqVu
         WnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744696765; x=1745301565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLdEzSuylgtZwcH9L3QftHbXB4fESiVriulAmrXqI3w=;
        b=f1xu+Fcdvu8cYO8aRtk+rgeMJIPbC0xdcZ1j6teEfks/Bs0jsjklIhsZkbDktkeyXF
         Wpa06PqDv902CxPm9N5eeBoUDnF3+rqCEKcKFPt+37G7BHKCeV3DpJXw5OFz7c5VVZvO
         lweSvvR3iUfO+RJzEzZBIg3TP7vrOnkRGxzZQSHDk8jCzBnIPjA0Oz3cxHj4Obb1dW/l
         MbSsJWhAaWBi/F1Uofo34shAY18o7qfV6X5tLFEfSAeH+BCSx1ReOgx/jynF/VXcHLl0
         5hjlm9w3T8JJP6lqAFBxboANcAWd4brox7KDfvH4/qAqKKU1Y3myrzKxuiiqd7ZOKx4D
         ZB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyNeIb11s9l1o31I5/kRsb+AGcmT2Rpmk1u8TX94MglfbJ3lxzeJaOw1S7TYxPuRr+ehgCCM9/Qohw3FAF@vger.kernel.org, AJvYcCXHln1J/SCPBJDJRT/y3J0PUKvsXRHhIMWPRebLZH9GuINpoqgZlGKHsVa/sUGVkEKIVHUe8vi5dy6+@vger.kernel.org
X-Gm-Message-State: AOJu0YzXDuTXWfZDG1n4H7jPW3cvSeR8RmMgfr8959Kk1oN8oAAHQXGt
	wVQtd5QGVGauXNvB/P7uCGWiQ254FTnzRCiZYEmpShuEL0xFfmoa
X-Gm-Gg: ASbGnctashzN5m4P0muqLM8STKSg8oKUKC1PBVKKf1415oo3AlsMzlkYpbQvjq3rVx5
	78+SBwdX7q+u2/q0e00Az14o7HgmzbiVWTZTwhvYdR9u3uYCoYmEpc8Gi9/xeriCpcKMoCmHy44
	Sx4MhnBth+8AuiSWPpZx8fNBNQo1Nsj3lsezjSHnXKH8hVniobNiedpa2afZZjF5D7/bGRHn7an
	dBt7h94Ln+JECBJUpi0+yRwZqC1+hkkjUoPq4hzL7+Tqb6B9/Iko2e+4aAdK9U7d7nNR6JctdBJ
	Pxz54zsovrW026+tsC+Bq3iYbiSwrG9Jo4ymEKszGHmDAOWWdSea4q2S4clkZleTeBAM9Koo67g
	vJ+siVQT6
X-Google-Smtp-Source: AGHT+IET5zzLesZUrEu33lPL8P5dBAg/QVS4Jpe1rh2nr0Rn9Qty18Ked3yqaWsZ8qqK/asO1pUQdw==
X-Received: by 2002:a05:6512:2149:b0:549:903d:b8d8 with SMTP id 2adb3069b0e04-54d5965bf73mr532479e87.8.1744696764802;
        Mon, 14 Apr 2025 22:59:24 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238820sm1325471e87.80.2025.04.14.22.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:59:23 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 15 Apr 2025 07:58:58 +0200
Subject: [PATCH v4 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-st7571-v4-1-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
In-Reply-To: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ErAJptKe6TjqvTV7sbXPcZTT3k+iErgPyt0n2TpvVKQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn/fWo0zd25bxNICZsEqGnaKpkxFttyKHkD+lWq
 BFLvieFhgmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/31qAAKCRCIgE5vWV1S
 MhVyD/wPRR1pC3Uih9CKvymXMl51XJr6AUsF8qCTwS7srgLpRjrVa+DTNTnhsNOZIYv6grdL9qE
 pHDnF5CdwkygG4ppbiXIF46jWOLPQKv4pV29gkIMezHZcSQ5IYSlIOPMu73EgQQ2coRjFzpiI3+
 pGv1UQD/a1vMJETYPetDDdRgXGc8BxQzcPiopigxd7f81XQyYvDp3gMGXz6qMxDGN/UlS2qNgtb
 JrLFhK0lWHS6Mm0kgq+7gT0Jv25SXENfkcSUOgbfk9+ntovHDIkqmKwa3U0RDsF+eh7+TYE8jzz
 Czs2t+cmBZeEfqjSeP40XC/Ldv7pqFXpxihEMDStnc0xO7CfW6GemZMGGhBVH9pIlZ4qywiVGim
 7d6JbR3VKvp/uG+HUcs6MTTcOFTXZ1pnwGlDtvad9L2+9opiFzeTxYB8vOh4YXJu7Lsxc/MQnLw
 fXW2WD/TuQ74sUY586UCiGO0eEcox53Vi5VuzMqRzX7vp/WvN8ddTe/pt+RSTZjhbiky5E53bTa
 o+LfBNUcBAPmPzFrlwtjWaGfSSS9XaQLOewieizjBShkQfiFCCp+2TFKlFC3o8VQFp3PrPJNJSm
 Z0D3JIsrDsmtNZZm2d/kX8PqenqkllBtfX0WY1sYSAT9Mx1B9Z5zhGgFUd4DBayrmreEWKCY089
 VxjTrrNmMbMcDeg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Sitronix ST7571 is a dot matrix LCD controller supporting
both 4bit grayscale and monochrome LCDs.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571.yaml          | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4fea782fccd701f5095a08290c13722a12a58b52
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7571.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7571 Display Controller
+
+maintainers:
+  - Marcus Folkesson <marcus.folkesson@gmail.com>
+
+description:
+  Sitronix ST7571 is a driver and controller for 4-level gray
+  scale and monochrome dot matrix LCD panels.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7571
+
+  reg:
+    maxItems: 1
+
+  sitronix,grayscale:
+    type: boolean
+    description:
+      Display supports 4-level grayscale.
+
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display@3f {
+        compatible = "sitronix,st7571";
+        reg = <0x3f>;
+        reset-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+        width-mm = <37>;
+        height-mm = <27>;
+
+        panel-timing {
+          hactive = <128>;
+          vactive = <96>;
+          hback-porch = <0>;
+          vback-porch = <0>;
+          clock-frequency = <0>;
+          hfront-porch = <0>;
+          hsync-len = <0>;
+          vfront-porch = <0>;
+          vsync-len = <0>;
+        };
+      };
+    };

-- 
2.49.0

