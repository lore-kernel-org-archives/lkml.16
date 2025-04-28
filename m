Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F525374EA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745822751; cv=none; b=ViVksZG4BKX3YGj5TLATNTVS9obww/Cb4zp1AkWS2N0WZk2Hl6fy1kH9k7kHOmfECSCEao6QlUGKpImAWKT8Kyq3Ks0CCZ3Nb1j6wu5twxEveLDlafJxv/kqCcUAuQHrfH+wMs9RldW0oyhhLV2dDDMjgF6tqLCILJGmYwZ0mWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745822751; c=relaxed/simple;
	bh=NZnot282Sw73fA4nRHstVLTjCUKuzrasAbA9WCCVI6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N/kwPXczutQ5y+qAKEmjtdxvXkJTHN7a7uE3w8VReKaGKbkTbgi15n6Lss5sPRMfJjUr5zWjNTqkMlKOHmrUIwIEt7SWnKzZ94XJrappmIA2wD+Hw4yNUFLJ3ivppvSM3jMnVOaGpM736c2zkxlo6pQc8jWDHcjsvUFdO6G8Ye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAqLAq7r; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAqLAq7r"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30db1bc464dso45637491fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822747; x=1746427547; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvJuk4BZmmxEKWyZyDPqEsq9L6oKvjH94wTjuS2k+ng=;
        b=RAqLAq7rABu3wa3mcDyIIz8X259km2LeL1/I+Us7ZDTYgIcQ9mYZNbyDcAq3vE9lBt
         vCkni/vtGHg6k1bgyYD3ObqXh9jEvURBj1kZ8f5PYPbUmNTTWxJSaYg2lgOlKo85AKVC
         SwK41pEBvRf+OxtMXpll5Wdj35YyQ7pBLMPFPqhsWha+WeG3z2KB7ZrZIx6NPiqVnwzJ
         sMRQKxbasWMs8Sq4YFROChNpQlzElLmQt6SyAXdJJTX1/0dtUVQaIOj3XsqftCypUkQf
         6nQGkU2qFeMhnM/rvOZAUCU8OmmWaDQrPhKXIJy3Q2hMxb++s7VqROGtmf7RLivrdyiS
         OwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822747; x=1746427547;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvJuk4BZmmxEKWyZyDPqEsq9L6oKvjH94wTjuS2k+ng=;
        b=NQhZEQIFqJRAMgr2kPdlgbyte3HtlEpIT7z66pakYImqIwYti5rYMUWiKyIuMQQanO
         Wb0sj9h4LehP31udgTYXlqvoyafIqLhqR1zlfV/JDiZOVdoZ6ERJe7KQSiMPC0wMUl7R
         ZG/MMD78o0xPpfHnVRXu3qIsRS41dP6qfFrYD6s184x+tjS64vmIirYIzdpofk+m0IyA
         JB4UDNAIs38ri2bUA6Uv52w9QwZdXJ1+rfi6U3zyp807Tr70+jYW2zdcDQ8cCijxs5/u
         1T0CvmwPjzYawaFReZAHdgHq3ckfqtZnRa4ZN6HScLJQht6xrv/1zeZJd6I0IAZWjsRC
         h7Tg==
X-Gm-Message-State: AOJu0Yz3M+oAgsc0y8zq4J43J1PAOtxWHFSV0A8jubewMJkX8109JWvE
	S7IJXSqhManOMI6zu7zWZ3NYcv2+1iVigpQEFz3iuhZ5D0WskSwV
X-Gm-Gg: ASbGncuRlCt3FjdKjFgzgrnWxFzwGKkFPO5whiNlB/70Z4amykaBhZGOtih5esKr50S
	kTUwAxYRDXt9+/3WR7aO8r1B5XWQy4hRKZ8HHXomGonRanvvRFsvmXsqCFnq8v3q1qkQaFBTf5l
	aR/87daT/X1rOAML67oZZqY48dKrXAMxF/kmP0pX9PmwtNWOU14JywlZ9X29aO+YWc7jQ6KD2Bh
	oE6YW5yxIzHU3N/CkRb+rvRW6RcLikifI5/F9HjHmhtfFdCmFb3V8kKmGuWkrLFJzD2j3ADrnJM
	6xBInnZamz2vtp0gRJGyRs0expxBNoZuln45szjsrX9pT2XSd/fnu4ewo0jrBTFC7Y33nVpDExF
	4VhTyz9FOiXC3Fxh4MR8=
X-Google-Smtp-Source: AGHT+IGYWJCzb7KLaPmkOKmB1Zd09utIb9ZyHI5CpHBL5TA65DDBl8lF1AMdN3x0deJK3vhckX78kg==
X-Received: by 2002:a2e:bc15:0:b0:30b:c328:3c9a with SMTP id 38308e7fff4ca-319081d9f33mr36354851fa.29.1745822746887;
        Sun, 27 Apr 2025 23:45:46 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b95f4csm21336731fa.88.2025.04.27.23.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:45:46 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 28 Apr 2025 08:45:33 +0200
Subject: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAwkD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMT3eLMkqL8vMwKXaNkwzQziyQTMwszMyWg8oKi1LTMCrBR0bG1tQC
 ACDjrWgAAAA==
X-Change-ID: 20250424-sitronix-2c1f68b46866
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8199;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=NZnot282Sw73fA4nRHstVLTjCUKuzrasAbA9WCCVI6E=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoDyQTh/vxVa3v6mq1flqMwWIqmxEIBAm725I4b
 6g/Y0ThW96JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaA8kEwAKCRCIgE5vWV1S
 MhQxD/9ogj75NL+4cg3UdMabuF60YVeCpNTsbrnedMW8bH9L51sz5CrYrsQHGmd84ABQ4sS2Y4F
 /ddqrWMYiUWAS2FkKVQvDdeAYkYOW+oESsr/nU+WrlwqPT50ZOr2foJEQx1UKV/f5RMda8eAnSY
 RMZlUclUxFjjUUohIfAamGJTd/ivHsaeTOL9vzXSlK0CT+BZNktrvuMpFKTbiFKWIyjfqaik8c5
 IjmRg6t23s9iGpoFjLO558oD+CHw9pjfR/+vQ9tsxZI2MidU5Udc2B1suJbytq8TLfPox/61EXQ
 rWaRFYzbrVO6CXJiILi3jl2dXgoPHL0zW+6Lr96P5NAzbFFSUOpCArcLGWjTiGXRxQpuACRDbEV
 i7DkSq2obnsR+hj7Lx8xoZoZlJfgYFjBmAciG5OCtuO94j7k2vKfz6enpJRhvXdd5k4iglkgztM
 zGGkeeetbmWDKEaD/nOHq8qlQUPJR0IRmvHZukbePq0Cj4CQOfRkVcgqWLkbfLB9tcbf/38oQvo
 HDZItcGIbfka4pMy9BiiqJBWbBe+9ODZEEl8eVix3Th/6MSRW0jskNPK9Jy+QICp+wtxx7fXpu/
 fiASLdBtsf0ZcdSBEeLynGNUrDR6CTfOxFYY2r7XTsh653vuouNB51DTtq/gKEdEgJds3t9pHxI
 E8Gdo+ZhvXb88tA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

We start to have support many Sitronix displays in the tiny directory,
and we expect more to come.

Move them to their own subdirectory.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                                     |  6 ++--
 drivers/gpu/drm/Kconfig                         |  2 ++
 drivers/gpu/drm/Makefile                        |  1 +
 drivers/gpu/drm/sitronix/Kconfig                | 40 +++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/Makefile               |  3 ++
 drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c |  0
 drivers/gpu/drm/{tiny => sitronix}/st7586.c     |  0
 drivers/gpu/drm/{tiny => sitronix}/st7735r.c    |  0
 drivers/gpu/drm/tiny/Kconfig                    | 40 -------------------------
 drivers/gpu/drm/tiny/Makefile                   |  3 --
 10 files changed, 49 insertions(+), 46 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81b81cc68ca2482f2965b801693ff8a43bbf2053..6b2d3d4c467b8b360317437027e20c4014c97a21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7680,13 +7680,13 @@ M:	David Lechner <david@lechnology.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
-F:	drivers/gpu/drm/tiny/st7586.c
+F:	drivers/gpu/drm/sitronix/st7586.c
 
 DRM DRIVER FOR SITRONIX ST7571 PANELS
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
-F:	drivers/gpu/drm/tiny/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571-i2c.c
 
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
@@ -7707,7 +7707,7 @@ M:	David Lechner <david@lechnology.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
-F:	drivers/gpu/drm/tiny/st7735r.c
+F:	drivers/gpu/drm/sitronix/st7735r.c
 
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3921772ae61214e6ac0337edc147a46af0010070..cc7385c334eb6ad484688d9eb483c2c6a9c39e11 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -385,6 +385,8 @@ source "drivers/gpu/drm/xlnx/Kconfig"
 
 source "drivers/gpu/drm/gud/Kconfig"
 
+source "drivers/gpu/drm/sitronix/Kconfig"
+
 source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index b5d5561bbe5fd72f3915e6a52f325fdb79c7981e..70510620f29c874e376c795fb05d426a0faae05c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -221,6 +221,7 @@ obj-$(CONFIG_DRM_TIDSS) += tidss/
 obj-y			+= xlnx/
 obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
+obj-y			+= sitronix/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..97d9504e1e90c6eb40e8865ca3cfd17613567274
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -0,0 +1,40 @@
+config DRM_ST7571_I2C
+	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
+	depends on DRM && I2C && MMU
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  DRM driver for Sitronix ST7571 panels controlled over I2C.
+
+	  if M is selected the module will be called st7571-i2c.
+
+config DRM_ST7586
+	tristate "DRM support for Sitronix ST7586 display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	help
+	  DRM driver for the following Sitronix ST7586 panels:
+	  * LEGO MINDSTORMS EV3
+
+	  If M is selected the module will be called st7586.
+
+config DRM_ST7735R
+	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
+	  LCDs:
+	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
+	  * Okaya RH128128T 1.44" 128x128 TFT
+
+	  If M is selected the module will be called st7735r.
+
diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..bd139e5a6995fa026cc635b3c29782473d1efad7
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
+obj-$(CONFIG_DRM_ST7586)		+= st7586.o
+obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7571-i2c.c
rename to drivers/gpu/drm/sitronix/st7571-i2c.c
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7586.c
rename to drivers/gpu/drm/sitronix/st7586.c
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7735r.c
rename to drivers/gpu/drm/sitronix/st7735r.c
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 9fa333709828f78f5fe5639f7ce40117455ff046..7b97411b0c477823da8fb28fc210e580c8bee186 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -198,43 +198,3 @@ config TINYDRM_SHARP_MEMORY
 	  * 4.40" Sharp Memory LCD (LS044Q7DH01)
 
 	  If M is selected the module will be called sharp_memory.
-
-config TINYDRM_ST7586
-	tristate "DRM support for Sitronix ST7586 display panels"
-	depends on DRM && SPI
-	select DRM_CLIENT_SELECTION
-	select DRM_KMS_HELPER
-	select DRM_GEM_DMA_HELPER
-	select DRM_MIPI_DBI
-	help
-	  DRM driver for the following Sitronix ST7586 panels:
-	  * LEGO MINDSTORMS EV3
-
-	  If M is selected the module will be called st7586.
-
-config DRM_ST7571_I2C
-	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
-	depends on DRM && I2C && MMU
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_KMS_HELPER
-	select REGMAP_I2C
-	help
-	  DRM driver for Sitronix ST7571 panels controlled over I2C.
-
-	  if M is selected the module will be called st7571-i2c.
-
-config TINYDRM_ST7735R
-	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
-	depends on DRM && SPI
-	select DRM_CLIENT_SELECTION
-	select DRM_KMS_HELPER
-	select DRM_GEM_DMA_HELPER
-	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
-	help
-	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
-	  LCDs:
-	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
-	  * Okaya RH128128T 1.44" 128x128 TFT
-
-	  If M is selected the module will be called st7735r.
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 0151590db5cbd80aebde0629afd03f47b83c3045..4a9ff61ec25420e2c0a648c04eaab7ca25dd5407 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -6,7 +6,6 @@ obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
-obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
@@ -15,5 +14,3 @@ obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
-obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
-obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o

---
base-commit: ef6517ac5cf971cfeaccea4238d9da7e2425b8b1
change-id: 20250424-sitronix-2c1f68b46866

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

