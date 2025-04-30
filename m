Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240581EDA06;
	Wed, 30 Apr 2025 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995802; cv=none; b=HKifN9iyasXwaIGVQ29zH1mv9pb+xnUtWcrnDaWZfFoDLkLcnlIFVVQlaY4saRdsyG0ojGUPdaU7i/l2rkh07utBkBt+0WxRYOdJ4dlQVVD2uYU4jkFqJJqsu7ioOa5/JY2OpwlHimkf42St8X9dvIk4zbp7zB1tQuIgpiOZArs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995802; c=relaxed/simple;
	bh=Yrjq3KiC4SyuUyZDeJv+obwTdwsiALvD7aJNIXes3NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1K9Na+UDu3vaWVy/VrBnTsBeGhrUORTGRvCbY81S8dvl134pTog5Hx8vl1Evy0lMxungFdyi+LNgMwP+K57yNX+BI6hqnwrZbYLlPRXaL0b0RcAZckTiFhmZ29wJ9X/2B/KWfy2quB1o0YmnUBlIigwIw7lgZ4Gc1AtG7BEulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5HHe0e9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5HHe0e9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso10299358a12.0;
        Tue, 29 Apr 2025 23:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745995798; x=1746600598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbjQwwuHMgpjqALka6f43qmTcJ4iQruX/pdPWsI3QQc=;
        b=L5HHe0e9wkMlTzuMouBgrgfPxy5IccRZUAPEBvuiAuRjc0mi+cesMNpR25IgeZC4To
         wu9cL6jcH4Nrql3Q+h6wi4+aZiawldrmxI7psdhwMrVLqo4BbrEWlh0RQ67KFGLVVtFT
         z9s44Ig8/2OapaDKqJnbz+ub49OHLRsjFWPCVNp/+5ciCNovwvZz2okW4oGgqlCx+Z5d
         4X32T0yPBMxRcXF4z7h6Loo85Y47ocJTGgvwQbPuvWvBzLkCfgBu1QaCRWN/JKj+DDqZ
         YGVkqRJD7S5Ti2FXhWE2NXFJ/I2v8DKZS8YNJBdHArm8rQo6xHnD5KW+YdVa1ucTSbE3
         zuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995798; x=1746600598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbjQwwuHMgpjqALka6f43qmTcJ4iQruX/pdPWsI3QQc=;
        b=enGTlOp5J175ctVL3HgOVQe5DWUioBo7ajpA5NiO67JkOdFeoKW06DG5K27bAEL6yX
         igHdJ4d/iKXPL4wwSFFKkmCXgOL9wR91aTrFQDXOEn3LJjB2MVwUldit9tjKiJSV84Fc
         HT3RXUSU8Osg2vvkpK0J8zAKhIJ7ssp9oMY9zqY1RgZR7KJadsH/Ct2Xmg1KuBf4JtTa
         xpyYrcBtQw6V1Hk3GTNEO1fmkx1FwJ+39kSesYs5icKmuUKLDHkr6lY2NIElfXdW7vMU
         c7M+w68pPDjC43k+hkqX7ziXHVXgyarr5AsHYAUyxltJf3a+rKoJSch+mcM/NNqf+bQJ
         J2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV0rjC7c4ax7aGthLjtKbkweTuO1Ta3ukeivZbirxY5rYpJEbtbgh7Qj8rXYxf8okE0CWkVFzq3wHRXl9aV@vger.kernel.org, AJvYcCWin1N7WwJ4wmWgYb1FrGlqxrnVwtgkksZ1Ac9eYkjw4gQ+ERtlCLzipCN9VXt8J1jwnMKCdyRD0HiH@vger.kernel.org, AJvYcCXbRM0mPqT3x5oAL/aAbiwHEw9gwvb+9lgvv04sicv1eZ2sUMaVr86pmn+f2eoSdFEi+X8PMVMrxzzL@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHT6LH26ma4azESKFl6DdUGm//jH5C6OHA9DjSqoaLgXSkC25
	aDxkmJccir6q5simm1tk7jDNswgYu+xai92xXUzHZO9hEQY/s2fs
X-Gm-Gg: ASbGnctwYuU9EVVPc6knjr+MRhr/LEbdwfjqLReQlXxxKpcU2t3oF0B/s6/gHjVsRzx
	V3GKzGqqTd4UODJR367M/0/ooMDcUdDyrCK/JNa7x4J7701bI1aSnZusYEkamXJSrkBEbYKNp5b
	XoNl1MlkTkYMnKc55yAigaD0wrVVe1LbVPXQY2ru0C1Wi49hbbpMJy8f9pczqEYiYLzUMUWSp2x
	5jEDfwSoX/oafB8sHvGtkfOeLMC8xAexWR16JqIHdLFN9tDNVMLaUD8dwqCd0pOo3sgCJVMNOZk
	Cx4iL7lBZ154WY4ywAPyfGnK3UNUVTAZX5WRNbl+GMki8AOLIPKkcqoxdR19hWENrJyMNTilRyf
	EaqcXRgL+5tM=
X-Google-Smtp-Source: AGHT+IESvRRUPhBQBjXhjcvQOQyfKP4SGb0RyhqDxU1qxEUoDViRxlt6MnoCuMInpFINZ7wksHoeLw==
X-Received: by 2002:a17:907:1c13:b0:ace:c2d4:bf85 with SMTP id a640c23a62f3a-acedc6ffb39mr235601366b.43.1745995798130;
        Tue, 29 Apr 2025 23:49:58 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm881222866b.73.2025.04.29.23.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:49:57 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 08:49:50 +0200
Subject: [PATCH v5 3/8] dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and
 BCM281xx bus clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-kona-bus-clock-v5-3-46766b28b93a@gmail.com>
References: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
In-Reply-To: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745995792; l=6917;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=Yrjq3KiC4SyuUyZDeJv+obwTdwsiALvD7aJNIXes3NY=;
 b=PHrZPT4tUc86zV0kl0ksLu6JAyWMz2+Gk1Jr17kKuXOgHIcrp/LMNp1yEetuarhOF0xadNE3p
 Z2f5AsnKGR9CAMyE428CcRPsXMRC6ZKLIoyjHWjB693HrBBryye9zqS
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add bus clocks corresponding to peripheral clocks currently supported
by the BCM21664 and BCM281xx clock drivers and add the relevant clock
IDs to the dt-bindings headers (bcm21664.h, bcm281xx.h).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Squash BCM21664 and BCM281xx bus clock bindings commits
---
 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   | 49 ++++++++++++++++++++--
 include/dt-bindings/clock/bcm21664.h               | 13 ++++++
 include/dt-bindings/clock/bcm281xx.h               | 19 +++++++++
 3 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml b/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
index e5656950b3bd0ad44ba47f0ada84b558e71df590..d00dcf916b45904177614c6f19a5df02abdf42f7 100644
--- a/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
@@ -40,7 +40,7 @@ properties:
 
   clock-output-names:
     minItems: 1
-    maxItems: 10
+    maxItems: 20
 
 required:
   - compatible
@@ -61,6 +61,8 @@ allOf:
             - const: hub_timer
             - const: pmu_bsc
             - const: pmu_bsc_var
+            - const: hub_timer_apb
+            - const: pmu_bsc_apb
   - if:
       properties:
         compatible:
@@ -86,6 +88,13 @@ allOf:
             - const: usb_ic
             - const: hsic2_48m
             - const: hsic2_12m
+            - const: sdio1_ahb
+            - const: sdio2_ahb
+            - const: sdio3_ahb
+            - const: sdio4_ahb
+            - const: usb_ic_ahb
+            - const: hsic2_ahb
+            - const: usb_otg_ahb
   - if:
       properties:
         compatible:
@@ -116,6 +125,16 @@ allOf:
             - const: bsc2
             - const: bsc3
             - const: pwm
+            - const: uartb_apb
+            - const: uartb2_apb
+            - const: uartb3_apb
+            - const: uartb4_apb
+            - const: ssp0_apb
+            - const: ssp2_apb
+            - const: bsc1_apb
+            - const: bsc2_apb
+            - const: bsc3_apb
+            - const: pwm_apb
   - if:
       properties:
         compatible:
@@ -124,7 +143,9 @@ allOf:
     then:
       properties:
         clock-output-names:
-          const: hub_timer
+          items:
+            - const: hub_timer
+            - const: hub_timer_apb
   - if:
       properties:
         compatible:
@@ -142,6 +163,11 @@ allOf:
             - const: sdio2_sleep
             - const: sdio3_sleep
             - const: sdio4_sleep
+            - const: sdio1_ahb
+            - const: sdio2_ahb
+            - const: sdio3_ahb
+            - const: sdio4_ahb
+            - const: usb_otg_ahb
   - if:
       properties:
         compatible:
@@ -158,6 +184,13 @@ allOf:
             - const: bsc2
             - const: bsc3
             - const: bsc4
+            - const: uartb_apb
+            - const: uartb2_apb
+            - const: uartb3_apb
+            - const: bsc1_apb
+            - const: bsc2_apb
+            - const: bsc3_apb
+            - const: bsc4_apb
 
 additionalProperties: false
 
@@ -176,6 +209,16 @@ examples:
                            "bsc1",
                            "bsc2",
                            "bsc3",
-                           "pwm";
+                           "pwm",
+                           "uartb_apb",
+                           "uartb2_apb",
+                           "uartb3_apb",
+                           "uartb4_apb",
+                           "ssp0_apb",
+                           "ssp2_apb",
+                           "bsc1_apb",
+                           "bsc2_apb",
+                           "bsc3_apb",
+                           "pwm_apb";
     };
 ...
diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7a380a51848ce100cbf94f9da2b997dbe3a65230..9f3614eb9036b5ce36b610fd7437338655a9cf97 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -25,6 +25,7 @@
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
+#define BCM21664_AON_CCU_HUB_TIMER_APB		1
 
 /* master CCU clock ids */
 
@@ -36,6 +37,11 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
+#define BCM21664_MASTER_CCU_SDIO1_AHB		8
+#define BCM21664_MASTER_CCU_SDIO2_AHB		9
+#define BCM21664_MASTER_CCU_SDIO3_AHB		10
+#define BCM21664_MASTER_CCU_SDIO4_AHB		11
+#define BCM21664_MASTER_CCU_USB_OTG_AHB		12
 
 /* slave CCU clock ids */
 
@@ -46,5 +52,12 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
+#define BCM21664_SLAVE_CCU_UARTB_APB		7
+#define BCM21664_SLAVE_CCU_UARTB2_APB		8
+#define BCM21664_SLAVE_CCU_UARTB3_APB		9
+#define BCM21664_SLAVE_CCU_BSC1_APB		10
+#define BCM21664_SLAVE_CCU_BSC2_APB		11
+#define BCM21664_SLAVE_CCU_BSC3_APB		12
+#define BCM21664_SLAVE_CCU_BSC4_APB		13
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index 0c7a7e10cb425ddb597392939cb218545a48bf22..8e3ac4ab3e16fb33a82259ccb82287fdfbb749bc 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -33,6 +33,8 @@
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
+#define BCM281XX_AON_CCU_HUB_TIMER_APB		3
+#define BCM281XX_AON_CCU_PMU_BSC_APB		4
 
 /* hub CCU clock ids */
 
@@ -47,6 +49,13 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
+#define BCM281XX_MASTER_CCU_SDIO1_AHB		7
+#define BCM281XX_MASTER_CCU_SDIO2_AHB		8
+#define BCM281XX_MASTER_CCU_SDIO3_AHB		9
+#define BCM281XX_MASTER_CCU_SDIO4_AHB		10
+#define BCM281XX_MASTER_CCU_USB_IC_AHB		11
+#define BCM281XX_MASTER_CCU_HSIC2_AHB		12
+#define BCM281XX_MASTER_CCU_USB_OTG_AHB		13
 
 /* slave CCU clock ids */
 
@@ -60,5 +69,15 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
+#define BCM281XX_SLAVE_CCU_UARTB_APB		10
+#define BCM281XX_SLAVE_CCU_UARTB2_APB		11
+#define BCM281XX_SLAVE_CCU_UARTB3_APB		12
+#define BCM281XX_SLAVE_CCU_UARTB4_APB		13
+#define BCM281XX_SLAVE_CCU_SSP0_APB		14
+#define BCM281XX_SLAVE_CCU_SSP2_APB		15
+#define BCM281XX_SLAVE_CCU_BSC1_APB		16
+#define BCM281XX_SLAVE_CCU_BSC2_APB		17
+#define BCM281XX_SLAVE_CCU_BSC3_APB		18
+#define BCM281XX_SLAVE_CCU_PWM_APB		19
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.49.0

