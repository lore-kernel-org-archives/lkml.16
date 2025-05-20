Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE84242D89
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751654; cv=none; b=H8T2tcSlh++LnKS0DM7nt7vHxQQzc3weMc+7cVBCwmqGRoT4UOmw629vIo8iQP8MNPfKkNsDHRsUGtYCLWrgjGyvUfLpVTXv/4GDYohiXZqb1C6bOU9bTgVdsZDl4FX6gC9NV1Ixh6fub4eCC4OXp65ISN9X72laDRr9Y9SQXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751654; c=relaxed/simple;
	bh=pUkqCPI9QwC01P8lVL9uJA5wXPW4QfoUL7u02fQS+Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dSMNTW/mGDn7WzwpGmSRV6Td4zPhoFy8YtTLR7LhMDHX9VDjX/b5phUsAAnRJapB1KRsvzxgPZwzqkHNMNukZs7cEjmeaoczcBkeKOe+emJ2uBYoEWlHlYlB3687pEyM/O7HfCrYm7eeFiHgl72VG8SZ4ij6ycXSJCO3GyHV4SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2bba:d77b:9240:3c4e])
	by laurent.telenet-ops.be with cmsmtp
	id rSa32E00R4GqtyW01Sa4as; Tue, 20 May 2025 16:34:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHO2R-00000002bgm-1Jt7;
	Tue, 20 May 2025 16:34:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHO2d-00000002Nn4-3LGJ;
	Tue, 20 May 2025 16:34:03 +0200
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
Subject: [PATCH v2] drm/sitronix: Remove broken backwards-compatibility layer
Date: Tue, 20 May 2025 16:33:59 +0200
Message-ID: <20395b14effe5e2e05a4f0856fdcda51c410329d.1747751592.git.geert+renesas@glider.be>
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

Drop the broken mechanism and the old symbols.

Fixes: 9b8f32002cddf792 ("drm/sitronix: move tiny Sitronix drivers to their own subdir")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop backwards-compatibility instead of fixing it.
---
 drivers/gpu/drm/sitronix/Kconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index c069d0d417753bcf..25cae32e5c3ec113 100644
--- a/drivers/gpu/drm/sitronix/Kconfig
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -10,10 +10,6 @@ config DRM_ST7571_I2C
 
 	  if M is selected the module will be called st7571-i2c.
 
-config TINYDRM_ST7586
-	tristate
-	default n
-
 config DRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
@@ -21,17 +17,12 @@ config DRM_ST7586
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	default TINYDRM_ST7586
 	help
 	  DRM driver for the following Sitronix ST7586 panels:
 	  * LEGO MINDSTORMS EV3
 
 	  If M is selected the module will be called st7586.
 
-config TINYDRM_ST7735R
-	tristate
-	default n
-
 config DRM_ST7735R
 	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
 	depends on DRM && SPI
@@ -40,7 +31,6 @@ config DRM_ST7735R
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
-	default TINYDRM_ST7735R
 	help
 	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
 	  LCDs:
-- 
2.43.0

