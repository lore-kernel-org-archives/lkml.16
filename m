Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776328B50A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428843; cv=none; b=aq6VVx09KenOwoqiaT+IXkpB7vsQTw3HcsbG9/EZq7y+FOwomNGBb5V0kbfXnfLGUu9KT9isZN7fO5Ek6SplS+Mskyk/OD6q4RS9xUjxwp2OKER4V7PAb5DRD5PEjZsDRc02i3D9nbYUyAbcxBX1EFT3K0o3qXBAgTyO9omtvhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428843; c=relaxed/simple;
	bh=ftFIstl1yhNalSsorIejsk2ReNc21T86IDQ90JSWiFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkTNn/ltZ7JYuNcGLT0pOkEtE69Z3Qt1WI+ZrG45q2l67YafZMYaJJ+6e7xdFC5Y6PPhjM7IGbTguprLWF2E5AnuQIKl/V2PwR9qL+Pq9W2RRzVkEdTYm+V6FVNUqK8ll1mKIropqMsEom0s2O5+3204TWZDFP7fBmDGYOEyyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=n8ugwoI0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="n8ugwoI0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso805955e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428840; x=1746033640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAANU+XIZrUPIW6CAFfax2bnLKgdooprA5iPXyYE/lQ=;
        b=n8ugwoI02w5vKryJrkJxom4A1SfUp1SyVRWdYDDHaFsfO/rjST/TXaPwQmEgKoJHq0
         MVUfw348BP5iZ3DPepWAEWYOScLedzSWopEqX7hM+2rsDZdO1DEDJ2RS9DYb9+bT9o+a
         eWRcY7sp6B5qwvNAh0xVLoNDC/doyDPDBJkCp1oEZR3KzBgjDvO9NXyMolcqvLwTe0/p
         +VvBwOqMUfzqVpdDHQvp/xHlhE3RQbOOH+d/Fw3/hvJMHdWMdDOOXO4/TbtdRXMb+rBY
         cG/pUr3jDSE+OQXQfV/QRzLW0uue0nUiAb3Dt2Gbc94jkUZiMLfxfrbTowawNuPqOZhE
         i3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428840; x=1746033640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAANU+XIZrUPIW6CAFfax2bnLKgdooprA5iPXyYE/lQ=;
        b=sOIGy0GatYAdEsGDtkq9V2SGo1UhCfNXW/IssqUeL9TEK/w/YKQhiISpoTQl0bwJID
         DNF7fUnT25fITSSOtlXFHelIoCbtss1TOYKLdaAWtAej9B4HYCUQNBUIxtuVp8We8ceT
         WaRiqfAVxOwgQpCLy0DrxrbuDo4oP76bZkOWeh3BUPCxpU8e45m/M3X6k9GNfIsQqTSp
         BuMbJIXZ7wuWp2VLt05Z5FMxlwhrm+utDE7EzmRwTlr4nqSYfQ1jPBf3/V0SoAb/t2A/
         hMVV+PMXeM92MU5My+s4znHMGc0VaVCRCKP3gZOHf+KehkA22TCG6UrWfqjWMaaCLGcm
         lBVw==
X-Forwarded-Encrypted: i=1; AJvYcCW2058C2qIIQe8tBrJhKuZ4a5jmKt8Rf8eZ71yu1/mQcxu55aBekB3OpqqHOEb5RTZZNy/Ek3an7c8k/Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzACC12YFCokkRIjktJTe26G3DYuOzuCyFGn+/Tkd8hkWuW4M4Z
	SzhYULqkUi7RCHbcg9+uHLwdPYhR6BGe7axQQh7wqaDOZsJn1ILA1kZL92ZG1IE=
X-Gm-Gg: ASbGncsTixe3ERIKUu8ThqelxGj0a4eiWTxFJReCAv+0vtatxHNY9KdbgPSvTMoiHhi
	6N+ZQZl6y3Uhp5p4eQ7rkG89wU8GtolkKoMK1wmNQU0JChNUsqEU1xIA6+zwD+9cXGIme6Ji/sc
	Qtoa1HDn1lrU6LaaDk2cHrMN/6QQDv3faCjCah7Rz3pNRTGNT8qw3l7IyJgL4tksM2QmtXdOfE3
	tifGK95wpHiuaNfrEybEIIUU26syRoBbv31iXYjcdZg+/Ljqk0FgLDUL5Q9mdhZTrAoHilMb7Up
	/JWl1P72VMlfE7j+hrWVYy39YIdUFCx3
X-Google-Smtp-Source: AGHT+IE6A6rGDK5+UwA4nNVAweDZRFVgbHEtVUgwIxRZIYBtxVB2yx8gDbY5T8+UpwH9WyHnBKi/mQ==
X-Received: by 2002:a05:600c:a363:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-4406ac0a8b4mr165209425e9.20.1745428839881;
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:20 +0100
Subject: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
and BCM2712 / Raspberry Pi 5.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..b86534f2689f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi HEVC Decoder
+
+maintainers:
+  - John Cox <john.cox@raspberrypi.com>
+  - Dom Cobley <dom@raspberrypi.com>
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
+
+description:
+  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
+  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
+  boards respectively.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm2711-hevc-dec
+          - brcm,bcm2712-hevc-dec
+      - const: raspberrypi,hevc-dec
+
+  reg:
+    items:
+      - description: The HEVC main register region
+      - description: The Interrupt control register region
+
+  reg-names:
+    items:
+      - const: hevc
+      - const: intc
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HEVC block clock
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-codec@7eb10000 {
+        compatible = "brcm,bcm2711-hevc-dec", "raspberrypi,hevc-dec";
+        reg = <0x7eb00000 0x10000>, /* HEVC */
+              <0x7eb10000 0x1000>;  /* INTC */
+        reg-names = "hevc",
+                    "intc";
+
+        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&clk 0>;
+    };
+
+...

-- 
2.34.1

