Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2303527E04E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385730; cv=none; b=Ayt5G1CuzCmxAU7Ht4tERb6MclwLfdXtzYAq2P1IRbIae1LU8UFXPWzAiCXa8PH0Yhhs2MDvQRl35aaxgdkFcAcMoivd/hoCq3Vrpb9o0Ai9fd68jrCc5yosKuzdRT0LGXD3S8wDn6TiSWp8R9LCVPDEtVmFm8j/uIIVDLQR/Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385730; c=relaxed/simple;
	bh=oz5Q11pGlj4vDWckwpFb8BzvCiIWkmrxe+FdgamNqc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0lH+Baejuc2htPRLncmUefOfen9WSzP5svgtf3N/AMzRvDBu71BLQ9lrlaX6ipDcHVjC1pHSV9hqQwuvYxFn7wyLgxCPBX79o7mjN5Yu3lK+/Cl2A7PafvVIsD2g5HeZ73WsUWQ2HcraguCkaV+3yWYx7HyYRs8pd1KWfkP7ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=eoFkIUE8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="eoFkIUE8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453643020bdso51043645e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385724; x=1751990524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iLA9QEKpGtzeHbOjLTVI4kROQlKVNQ7ikP4TAnx9ok=;
        b=eoFkIUE8fxMfYY5VLg4eKPfVMdninL3IgBhjVjVpNouiN62RuXeqfBV9YPtNjqhPvB
         hTUtO2sXKnZfwIy+c8TOHnN89zTZaeR4RyX444JgtbJwe5cLwZ3vx7atRhpfjFw7/3aV
         sdK1r5/CR1dVW9+etpEc7qB9Ndbulz1noR9ewxyC0D6XxEMz3IKCHOceO0i2w7Qzwhur
         0c1IL+LNuR1zxSREB95jgQ098iHJubkat7hHRIE2sFPRTHC0kNpDP4eX8KxrN6xaweyT
         cu8mjQYM3X+WHn2jVdxVy+jTKEW/I0E2AbBKyudBGoBXLv4yMmMR/bsJdUh0ffbomJFN
         SndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385724; x=1751990524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iLA9QEKpGtzeHbOjLTVI4kROQlKVNQ7ikP4TAnx9ok=;
        b=Y4WGJda7jsGkM0vFyswYgG1HBsOGrj0kMGfQu+Tavkc8QRXMHHFYAaoQ4FphIqTOcT
         DljjDNh9NM/eaYbPY4NsUObmlPKbkvLjmtxGQQB9ImTXbKZXl9UPPrFWfo5WBSyME6uE
         U5M1yCVKHTjZkvyfgItqSDhGmytIfk2zhf82pZ+w2KjMNFG37AmxAktKkfVlWOWsHtHk
         7URQLx2UGkt0PAQDYzNrM0nRwkL1ndRWSgl5ivBC2QE+zhp/BJGG2RgyJqr9xF1jJ55+
         yPZ81A707Q+a5uwcmAEDDJp/JO3EaHEVkDU11i8ft3eeP4v/6r5T1OpSp/mMZ9kcMJLR
         kP0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrvnNOe3ShBADbdF/pYvGZ2wOJ3o6hfGhhTppYEbynZc6pRwdbqe+fTOa9jBd9C0me7dGXNEkpl804HeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxaCGYt+7ZSArkLxGMQDw9QH7cdl/InMUTJ1S6m/BMp4LO0Bup
	eVLMMaXeBDWdnMVrFg+dWBVpNS2taLJYPZnLjj6SvOLksM82Amin8t1kJdO4SxhEJ5AaE40+CJt
	9ooGY
X-Gm-Gg: ASbGnctL18eded1e7Fvi75K++mLiv9n1rJongplYf9ydgALegOHPoNJ3Vn0tXxqJLQk
	eaaenPf+ep6U45pr9QBDuq6Y6Ab3YmvBdfYXzNxAYBLaP7P3HCs6i1FYJVRx7zlcr+LUryQMuAV
	JX0pgmLaCW2dcviRUV9ZJ7RkDoTaNJ3U2HVX7W/HI+pGh3wGfepDI1avpomFj9aHWoHslX8i1QV
	xSKUI2GlQ37ovb81Ngvor4AgY49U4CAZcAEquFPA+wjFz925EnBAfyAOzuLrML4NP4e+sn8n9u3
	kA4gAo17DDYmTKynqYZYYvu/SMryJHI7Agn/2jbHPZ8iZ3UEgkUpnNP2GTSEu8IO
X-Google-Smtp-Source: AGHT+IGsO1Tqy1W8cXCWGy9JXBxthxXBveIor0Nz8eJbbhghY3Ud/EpiGA9Z8pt7et5bm6LvqUs4bg==
X-Received: by 2002:a05:600c:529b:b0:453:8042:ba9a with SMTP id 5b1f17b1804b1-4538ee8590bmr157396235e9.28.1751385723610;
        Tue, 01 Jul 2025 09:02:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:02:03 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:38 +0100
Subject: [PATCH v4 3/5] dt-bindings: media: Add the Raspberry Pi HEVC
 decoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-3-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
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
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Adds a binding for the HEVC decoder IP owned by Raspberry Pi.

Instantiations of the decoder IP can currently be found in
the Broadcom BCM2711 and BCM2712 SoCs.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

---

Updated based on the thread in v3 [1] with Krzystof to drop to only SoC
specific compatible strings.

This still feels wrong to me as this is NOT Broadcom IP - it is solely
owned by Raspberry Pi.

It is the same situation as for the Raspberry Pi ISP Backend where
it was proposed to have
  compatible = "brcm,pispbe-bcm2712", "raspberrypi,pispbe";
in [2]. That proposal was viewed as acceptable by both Rob[3] and Conor[4],
and the binding given a Reviewed-by by Rob[5].

Yes it is found as a block inside an SoC, but the same could be said
for a Synopsys I2C controller ("snps,designware-i2c"), Cadence ethernet
MAC ("cdns,macb"), ARM CPU (eg "arm,cortex-a53"), or any number of other
examples. They are all 3rd party IP blocks found in SoCs, have an SoC specific
compatible defined, but acknowledge the IP owner and use a common fallback
compatible where possible.

Please could we have confirmation that this really is what is required
by device tree?

Thanks
  Dave

[1] https://lore.kernel.org/linux-media/20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com/
[2] https://lore.kernel.org/linux-media/20240213104405.GB5012@pendragon.ideasonboard.com/
[3] https://lore.kernel.org/linux-media/20240215140058.GA4147262-robh@kernel.org/
[4] https://lore.kernel.org/linux-media/20240213-landlady-backstab-6e7da824c99a@spud/
[5] https://lore.kernel.org/linux-media/170932821578.3062059.18150159256247255021.robh@kernel.org/
---
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..fe3361bddd1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,72 @@
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
+
+description:
+  The Raspberry Pi HEVC decoder is a hardware video decode accelerator IP block
+  developed and owned by Raspberry Pi.
+
+  Currently it can be found in the Broadcom BCM2711 and BCM2712 processors used
+  on Raspberry Pi 4 and 5 boards respectively.
+
+properties:
+  compatible:
+    oneOf:
+      - const: brcm,bcm2711-hevc-dec
+      - items:
+          - enum:
+              - brcm,bcm2712-hevc-dec
+          - const: brcm,bcm2711-hevc-dec
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
+        compatible = "brcm,bcm2711-hevc-dec";
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

