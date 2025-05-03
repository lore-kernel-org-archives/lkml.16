Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6657E23CE
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746260034; cv=none; b=UKvex35zET42xe/FRUq83nkYjv0QQ7QoEMj1BfWOtQfngCkdMOmNbiqUpyWtjfc7d1Jn03VJ8YheKKVzxiMwGqN1TUo7T7IDwqHbqj4eFYsVwUupS5c2b4944AhptYFIAd8D4KO1Dpt4cutyvCU9nUH4U+sV9fBmtyHwGYSllCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746260034; c=relaxed/simple;
	bh=owgqsJPUhQVJigfpn3+1SLtLjqMBYTNE/puBPwv/h6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nmq+JyA5Fc+VVlRuDz80KHdYx+Kxvr5mbLDm0t0mtnlzCkQhe8rQqZgaMmuvl3m2OMAdMQZbuQXeNpkwzSGKnYH08bLJXhvwCn/mXg/KQwVh+Dc4/rIJeVPianqbg4Csc7qzGYRmN918KFQcVU6yjhDCpkWGZhcE0lTp53zczw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0YHgLxi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0YHgLxi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549963b5551so3207477e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746260030; x=1746864830; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8sWrBJj6gfHpTqpyh7pT+JCavfPofDc7ziZnIEFASfM=;
        b=l0YHgLxiHmMvJpyp/wAFlk6IZFQlOuK/LlGEtbBdNFqLDaITObo+RCJ6Tx6IyOey90
         G/AKdD51CVZgRn70TY0cQGL7NQo0t2K8Pwrj2bAFT7ZAtxmMs6sDHnm0d/OoSzIZDiQR
         a00031qnDblyF1jaiiPP36jKBErI/vC0GjMpRlPzAdFsr1zZmGZW6AIlHoijtQW5rGad
         FSYm5em5UZL+qvXCfPolzuBNIVRaUlb1s4L+YogrYRMr0o1FycYUtgd69a8cm6Vft9Qz
         9OwXCCVuGAJU6EaUJ/ILWSJzAF3nvkAblCRinqleMnHOaQIn4ijUK2oKts19MywgNV8P
         VJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746260030; x=1746864830;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sWrBJj6gfHpTqpyh7pT+JCavfPofDc7ziZnIEFASfM=;
        b=UWKJgPTuuWfb1pOfNLKxbLRI54s1mJ/4UZZA6yNut3kLD2J+FmX+mlHZkVrlugbSUc
         DDanG+ljTkgR671iRwjF10XE8s/mPf7kzmXlFv/xKLlCGQGkxnPoqo6/neUC7s0Gmp5+
         yqdwqKF3K/CLXsrQgbP0G2E2xZPxOCmGPvOHjDQcOtt6CR0OBCdhG3stGhJdfgYKnnpL
         kzAAyZLXTeg1Mh+lTwg7rBHkNybHZWHUYNSrSKs0EVRfzrVktPu8m1QTsiFob3FErMBG
         ml1PTYLAPSsgyb6nbArdk6DNnx+ll9lwn/hoc0mxa74epyZiVcttCXwIf2TLtlJkegDV
         eRBw==
X-Gm-Message-State: AOJu0Yx0PBQwVK0OUzl4eD+lduTlaVc2AxiPq4GoTUMn7y5eChsvQw1u
	6ctAmPHAVM+inwuwhlFoMOjfltJMfreiQQGEzCyk8UUOlFyBQLkW
X-Gm-Gg: ASbGncvDTmRWseFH9XVZQ9nCWyotEoP6+SCxRMM8/ZKySO0EXtHH8WYtdCJgoNYv7Gi
	Ga1N6ojG1sp/VxmXAXn9b1NwHwUM14+ja/CepEJFEoUDJtpg7FxpINQoDJXDBXgQIt51C2O2oU4
	p3ThgE0oeXL/Q50mXo3S9p0HLlsOIF9JGOvO3GAsLzQjPruWbMP1qwEJMreha30bdg4agfA4wau
	///k9OwFtyA/UWviu5b2mAu6K8teXl4I/jfdAmQnAd+3RUUTdnysBX8TKedUxxW5rszanB0J4+B
	1lggPoH+MJ2e65lm11TpJsXj9SgsfKGNdszF4sZVa0xOgiIdMYelGFifCxU+oNNhkp1rM/YxXzm
	zsMbp+2qtbG+Crj0gi1i9
X-Google-Smtp-Source: AGHT+IHTURik6XJQXQtn9hy97s6kSGrL10STZD54xof5ds1w3TV4rLWUJ/qTkZwS/Pa9E2+vZoQpjQ==
X-Received: by 2002:a05:6512:b23:b0:54e:8db5:68eb with SMTP id 2adb3069b0e04-54eb2444e63mr465250e87.28.1746260030156;
        Sat, 03 May 2025 01:13:50 -0700 (PDT)
Received: from [192.168.1.129] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f18fdsm687959e87.188.2025.05.03.01.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 01:13:49 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 03 May 2025 10:13:40 +0200
Subject: [PATCH v2] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-sitronix-v2-1-5efbed896be2@gmail.com>
X-B4-Tracking: v=1; b=H4sIADPQFWgC/0XMQQrDIBCF4auEWdeiYqztqvcoWRg7SQYaLRokJ
 Xj32EDp8n88vg0SRsIEt2aDiJkSBV9Dnhpwk/UjMnrWBslly5VULNESg6eVSScGbXqljdZQ7++
 IA60H9ehqT5SWED+HnMV3/SHmj2TBBFN4cY5bI66tvY+zpdfZhRm6UsoOoV/naaAAAAA=
X-Change-ID: 20250424-sitronix-2c1f68b46866
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8517;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=owgqsJPUhQVJigfpn3+1SLtLjqMBYTNE/puBPwv/h6A=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoFdA1Cr+4oA21qO27FVpfOXqgHyV+EglRt85d/
 kE0UeisDlaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaBXQNQAKCRCIgE5vWV1S
 MruFEADQzo7S4p4nptwGvkLPg42H41vt5oIKxwk1Wwh9Kn2+xosYI8iLBRCMLtasNBdT1hmekPd
 jaRRcHQ47irU6HVtjcqH99hZoU+fvI+IA9OpiQiZ4bNi5q7BRM71ybmu97R8wqylEQtPSuR78PE
 pDjSluomn8BxEiq7gmWG0idUDHBFxvSqOIDuw96duW71vgDXR8BDUQXi9qSGwP3UPdxFMiCT+dx
 HmB69tWHRJXruAXbeyalkBBQbt/OHhjInULN7CszLQWKDm6WSbNACV9FTuFgDgTtyRXmG4wC5P5
 oJF5kj84yClAchD62tuiZ+vFmprsNhRk3wkv4ASQnTOV45tbynUpdyQeHKyJJNLqv8Psie5+JVz
 v2T02vgTE45URrbX5xuXDTl8oepAESZiN6xFZRL1upOpyKp8f0sOlnbZjnD1JgF3Vv9H1bNokDI
 QAiA/vX2KOeksBUKb8m1qbRLy9IC45TLUE6cqmEgPjURHbsX9Psttgna5dKz+ZU6xTrjqnTJp6x
 RmBUhi9oGEwIJookFn0L3RN42MofrwUf546xVo5aiPLJCiYOBzYBsi7IlhqOt6pCzyJ/4sBEWnW
 C0qGkGyiamzMK13DZNhlkxgGEwZGYd5jfZ0v6RlLV9arSJRMZ+t3M9YGXzWXlxqnNAf8OSwsobU
 Tpl52L4Ezyzsuow==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

We start to have support many Sitronix displays in the tiny directory,
and we expect more to come.

Move them to their own subdirectory.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Rebase on drm-misc-next
- Link to v1: https://lore.kernel.org/r/20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com
---
 MAINTAINERS                                     |  6 ++--
 drivers/gpu/drm/Kconfig                         |  2 ++
 drivers/gpu/drm/Makefile                        |  1 +
 drivers/gpu/drm/sitronix/Kconfig                | 41 +++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/Makefile               |  3 ++
 drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c |  0
 drivers/gpu/drm/{tiny => sitronix}/st7586.c     |  0
 drivers/gpu/drm/{tiny => sitronix}/st7735r.c    |  0
 drivers/gpu/drm/tiny/Kconfig                    | 41 -------------------------
 drivers/gpu/drm/tiny/Makefile                   |  3 --
 10 files changed, 50 insertions(+), 47 deletions(-)

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
index 0000000000000000000000000000000000000000..25cae32e5c3ec11399a12f1f2bb2ede91c27d4d4
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -0,0 +1,41 @@
+config DRM_ST7571_I2C
+	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
+	depends on DRM && I2C && MMU
+	select DRM_CLIENT_SELECTION
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
index daa1adbb1b43325d644ae13f3cabfc1bb01ff4d8..6d1b3e2cb3fbd8630864824ae985897b9d8095c7 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -199,44 +199,3 @@ config TINYDRM_SHARP_MEMORY
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
-	select DRM_CLIENT_SELECTION
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
base-commit: e782ac936941cff4c5580bb5cc2ec0e91468068c
change-id: 20250424-sitronix-2c1f68b46866

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

