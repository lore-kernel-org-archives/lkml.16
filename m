Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB3242D64
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747034124; cv=none; b=G4Qo4IgCdBiu215sgruEKW/4mjH6n8mzyelgliz/g5v+8q8ZknKS599WP5I1u+lPKcGwqrbl68cHG5b59pCwyiGsAkJDoYbDeHNGDHMaUs3kHSS42Ps+5ptnnJTMwtFNWHNThOFIiJVr+o62Hu07v/8v8RkPfL/TtHI8+oJdYlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747034124; c=relaxed/simple;
	bh=CLiO9Ve9S1ULV4vc7KBrQ1Gf/SwPIYYIBNr0FjAg8Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZsY9eXen/GiC76TFcCnJ3AgPF7BSPXuhy4nzWX7bTaCVWLA5BxddCdBr/xYea8yupzJe34ojwv3PrSnFaP3S4L317qSFIpQ2AItEE8rHbE3FRZVgEeciyiwX0rHFJpz3TIJI4F65q2yc6d+qnmWuCSL1626eWjdyTptUZon96xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlMVl3ds; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlMVl3ds"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54fcd7186dfso2120396e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 00:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747034121; x=1747638921; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5H9PCtqs7pSwDmGWl4jj80wvSQsw1NuyFxzjhTKO1TQ=;
        b=dlMVl3dsGsM3cv+yfSPi10Nr2ueWlwNNEVXgGGPF7fjKyQb/jTTog1hm3IzFNkmi64
         QuOND7xXL9kSZL9BV0ZIjep5HFi3Kkc/CUFo2XSNKuwv289SJD8BRY8XIHnBdFRb4qXr
         IWh589PO8xDIIQh+NyRY1mBOaQSew5n5KZJg/0LRYsESx5kBYWgxiBfyK61lPJoKbqXk
         zpK/eHav4IxHaobCI1jcNhYdmrnjoTtZofAVsIZBFTvZtYl2UtIksChED4KnyCjp/dYH
         z6uUP5IkTrixdyMq6kYyeinvg05rEtP9fJE0VHAoV9I0LbH9Qm902H/XD8Ltl/XSIxMO
         NjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747034121; x=1747638921;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5H9PCtqs7pSwDmGWl4jj80wvSQsw1NuyFxzjhTKO1TQ=;
        b=DFc0TiURbaMMvIeGLe0hQSo4DXODTIOqMKBVMTc2pA51mJkBdXjohzFqlmUkQJNl1S
         JIpX04zJMcrbUY0p2GWzC6CVokM8yvqNYnMo5/q1zwMb1cNcIp1TCtOeziklOhY5tIgj
         jvbdFJsKx76YIFcBARtTjIePjSH3+BnM+jbL6TyjOpj/k1LDblOGL83IkZLAIszgUVSl
         jl0Xm6ABfjHjShVMQb7Zn+drsubwYKqZLBUs0yv4yXt7gqEWEfZVHh1i6qFHRZg+qHYP
         KHplCghQLktMYm++n90M/FAnPs88padnyc9LgB2NHgiyCVOtHX5cbx8U/T9Wio99C5y6
         MjxA==
X-Gm-Message-State: AOJu0YxxYv5nGmgp2TrZAlJPeqXlxQ6YdmllFOmL4Xh4cIm8FDWTKpOf
	2BZL8L5m8tKw2xaH6w6eYijk1/pnuRCxDYz0eeKUUc5TRXUeL7up
X-Gm-Gg: ASbGncvw+46c74o0n4qLB22HggKbOyUfQRYSYs0lBDBjNJz1HipnGjA4m1YHPBU+0IU
	tNz4FSJA/LW4PvxEX2mKti1joW3eE5K6WgXBr34rSsMI8ywwfEVTmOkUI6KFadH0jJ6Yt1bgFdl
	rAvAi38D69BUe407zb/Wu31rSiN2l9x+xzHRe6Hc9XKluagwXAUUKjg5j5j9Q84r0lydpeqtlkT
	touhGBQSDpQ5jjQwEkkLSuRX9vLplfZgorojAelJKjZe1rncECLgNlH5JdAXzazIpjfObNvoVxU
	2RiJLqgBz2EIu8z3Gm0dGb4VNLLytGX5fcpCwnP2kFfFbehQ+RcERKx2IOtCHwTVmWBcNPP95nL
	2ye4HiqViT41eZf2iDxLs7KtCQb4m8w==
X-Google-Smtp-Source: AGHT+IG+WfSzwR+gxVxkYn9gVEsLYQ2zWFzk7qexVsbsxDALFIaD/vho/tC0vyTT9oNARLGDzXu0mg==
X-Received: by 2002:a05:6512:608b:b0:54e:8183:eaa9 with SMTP id 2adb3069b0e04-54fc67cdd05mr3918959e87.34.1747034120277;
        Mon, 12 May 2025 00:15:20 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bbesm1387855e87.154.2025.05.12.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:15:19 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 12 May 2025 09:15:11 +0200
Subject: [PATCH v3] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sitronix-v3-1-bbf6cc413698@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP+fIWgC/02MQQ6DIBQFr2JYlwYQKHbVezRdIH71J1UaMMTGe
 PeiSaPLeXkzC4kQECK5FwsJkDCiHzOUl4K43o4dUGwyE8GEYlJIGnEKfsSZCsdbbWqpjdYk3z8
 BWpz31POVucc4+fDdy4lv6z9ijkjilFMJN+eYNbxS9tENFt9X5weyRZI4RMXKkyiyqKCtoTGVr
 kGcxXVdf1qSZ4XZAAAA
X-Change-ID: 20250424-sitronix-2c1f68b46866
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8836;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=CLiO9Ve9S1ULV4vc7KBrQ1Gf/SwPIYYIBNr0FjAg8Ao=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoIaABrsM0FLYZaAi/kxfN8HubO9rwZDzwWliBS
 FQSg+zWiIyJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaCGgAQAKCRCIgE5vWV1S
 MkSHEACi9k7ra8wTUc51s36KTU9R1I8o3qon8bN+i/KqFEzo8OQmVcxNe9nvQOEctv7AL1fJSgc
 xl0qcTrzFnxKPpDoAyjqoqMG0g7gWpuo57xfJwH2ZdkwwFrmO1CjbS+gs2tHUapOHcgfm+w7rMY
 IGVJCWrsWEJmkfM2QwuCWR5iWahwdgFZt2cTnZ5Snn1uvW76PmwurM5XcP5Nwd7DoX3Y9oZKiJk
 erTdAh77gKrwZUJnNWVZikzfN9k+uRtpJlFRjnkebklMNUMpab+pBGrRBsYW8FoAXiwld9AwI9k
 NOwgBncwq3xGCYoErl2L6nqST+LqYL+8w5kOvBQJ//t+TBkNDcv3mbPb2hAmvPnIqa4HpOBlmXK
 DZaqJRNxzxT0qQ+hexPMFI3vkUKY04svXxjb6FBX79K9qljl7/M1djablF1s9VKQVMo3dP5+Ve5
 Awu5wf4ExrFSiPDmqfsKZOpXYiOgDQnWTH48sdO9hOcGqzCe2OjoVPhOgVYdcsoiPQc67r67HHF
 8CDeHAtZqlRRtz9E7h2Ec9G8ZIMOt6DqXleHf0ewLOHZDeLW087gbMht7GnVFB3sUPR4QlPnbj+
 CH6SOTHhcuOsgrHH3Kq5VqRZoReWU6i0EYsGSbNQr+RB9u1ShgixUZPsEAGmdCm6ZvfpdpOTd6T
 25Y6JbiZ1xs54XQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

We start to have support many Sitronix displays in the tiny directory,
and we expect more to come.

Move them to their own subdirectory.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- Keep old Kconfig symbols and let the new one defaults to it
- Link to v2: https://lore.kernel.org/r/20250503-sitronix-v2-1-5efbed896be2@gmail.com

Changes in v2:
- Rebase on drm-misc-next
- Link to v1: https://lore.kernel.org/r/20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com
---
 MAINTAINERS                                     |  6 +--
 drivers/gpu/drm/Kconfig                         |  2 +
 drivers/gpu/drm/Makefile                        |  1 +
 drivers/gpu/drm/sitronix/Kconfig                | 51 +++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/Makefile               |  3 ++
 drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c |  0
 drivers/gpu/drm/{tiny => sitronix}/st7586.c     |  0
 drivers/gpu/drm/{tiny => sitronix}/st7735r.c    |  0
 drivers/gpu/drm/tiny/Kconfig                    | 41 --------------------
 drivers/gpu/drm/tiny/Makefile                   |  3 --
 10 files changed, 60 insertions(+), 47 deletions(-)

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
index 0000000000000000000000000000000000000000..c069d0d417753bcf62343bd2456b5b98d60b730b
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -0,0 +1,51 @@
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
+config TINYDRM_ST7586
+	tristate
+	default n
+
+config DRM_ST7586
+	tristate "DRM support for Sitronix ST7586 display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	default TINYDRM_ST7586
+	help
+	  DRM driver for the following Sitronix ST7586 panels:
+	  * LEGO MINDSTORMS EV3
+
+	  If M is selected the module will be called st7586.
+
+config TINYDRM_ST7735R
+	tristate
+	default n
+
+config DRM_ST7735R
+	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	default TINYDRM_ST7735R
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

