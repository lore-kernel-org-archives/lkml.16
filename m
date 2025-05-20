Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E6FDDAB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744834; cv=none; b=XBfp8mM5Df5DqMcFX5C/+aWkShXcVsMxuSwEGcuOYp0ZrKfPgLqilcbtZ/yUP9q/6LV/2yUDY/X1YPEQDJeqDW/lPtU25ImAUxwOvvFWdeCLpaWCz4nzL22KqATPMNVdRXO02+Vcd6ORCgn5h78TtgYw0eOiWMltQuz4DiMnmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744834; c=relaxed/simple;
	bh=SPEPZrzQkNSoq4fcbmSQ+umxM6urkRvQ52y2PdGX1dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZFijWtMI8NHRBmV1UsWBDmuQBZHrM1KclMvGOd+U/+TDZcdV7wtrwzZ0sT05CgRRCSE31Yaub3OKlTXvGkH2PTdgcub1UI2OcK3uiyA3evCNUJBIQjN1l95tn0BlsBYk6yDTxegnjF62zkHyPCMWHyMyYA2Gz9km2A1Yu7mLww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a55:e9b9:b3a5:760c])
	by michel.telenet-ops.be with cmsmtp
	id rQgP2E00H09zvkf06QgPXW; Tue, 20 May 2025 14:40:24 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHMGR-00000002Xmu-0Onv;
	Tue, 20 May 2025 14:40:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHMGd-00000001Kbv-2IxB;
	Tue, 20 May 2025 14:40:23 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/sitronix: Fix broken backwards-compatibility layer
Date: Tue, 20 May 2025 14:40:19 +0200
Message-ID: <1682cd80989f9ab98a7a9910a086a3a4d9769cc6.1747744752.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
the old symbols were kept, aiming to provide a seamless migration path
when running "make olddefconfig" or "make oldconfig".

However, the old compatibility symbols are not visible.  Hence unless
they are selected by another symbol (which they are not), they can never
be enabled, and no backwards compatibility is provided.

Fix this by making them visible, and inverting the selection logic.
Add comments to make it clear why there are two symbols with the same
description.

Fixes: 9b8f32002cddf792 ("drm/sitronix: move tiny Sitronix drivers to their own subdir")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
arch/arm/configs/davinci_all_defconfig must be updated after this has
hit upstream.
---
 drivers/gpu/drm/sitronix/Kconfig | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index c069d0d417753bcf..8b3565b8eca3918e 100644
--- a/drivers/gpu/drm/sitronix/Kconfig
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -10,9 +10,11 @@ config DRM_ST7571_I2C
 
 	  if M is selected the module will be called st7571-i2c.
 
+# To be removed once all users have updated their (def)configs
 config TINYDRM_ST7586
-	tristate
-	default n
+	tristate "DRM support for Sitronix ST7586 display panels"
+	depends on DRM && SPI
+	select DRM_ST7586
 
 config DRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
@@ -21,16 +23,17 @@ config DRM_ST7586
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	default TINYDRM_ST7586
 	help
 	  DRM driver for the following Sitronix ST7586 panels:
 	  * LEGO MINDSTORMS EV3
 
 	  If M is selected the module will be called st7586.
 
+# To be removed once all users have updated their (def)configs
 config TINYDRM_ST7735R
-	tristate
-	default n
+	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
+	depends on DRM && SPI
+	select DRM_ST7735R
 
 config DRM_ST7735R
 	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
@@ -40,7 +43,6 @@ config DRM_ST7735R
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
-	default TINYDRM_ST7735R
 	help
 	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
 	  LCDs:
-- 
2.43.0

