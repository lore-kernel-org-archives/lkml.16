Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081EE214213
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225959; cv=none; b=ApWPxN6IBgrhG74Q22KsQh2l0gNi8Ga9KZ1bnus6JBeclcfo1RmrgEFTjKKQkrJantJvfuJg3f2pAhR28f02TJ10gDtaq/s8kaRXBdqHt38tf2Z3X9YcmhiqSPnyjRXe5etdfB/tIw7sLyX6Z4OMd3aR4bpVMgz9SQJmYyosCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225959; c=relaxed/simple;
	bh=iTnzPuRaYyj5cKyjFNCF9Og56U+2a+HJyq/LlGJtBMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BvN+FUi45MTMXdV55wJp9xAKFR/fKvpFaqP5uqezR/6Br0+KtfInf0BFemIEscEqbqRF8oOKEigRgzp+FRxwXohh/MauopMMxSgSU+4RpONUjv0mAjFRlQrVKv5xMw7PhkfzWomJRfb6Li+ainBC3n1bNtycRv9jaGz77y4iJmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ5VLf3P; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ5VLf3P"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2882092b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745225957; x=1745830757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJt22UoxXb5se2qcHLgjOMoqAZDai1RFkWwTDCGzVRA=;
        b=iJ5VLf3PziuvZeQkOzheRj10JKtA3ae6yY12QkYXiPG/Gy7om6oUkHtJOIQupszuc6
         4wLvaXoQIQhZqtWuQ+rlGjiFU3kehIzMNiDW6jGPdKfBl4jXVCT+C1I1KB6wfmwWdDkE
         pEWy8XU8xWd0aJnXj6iXsf4YQ1gdglpRiK0D0Wc971YszFw53vX8fuYF+TAeymHMKsSS
         V8b6EATMZRcZiaCLdDRg4FysjD8VHFrOxhgSGaOkesiS/dVkQSuZ3tXV6ghDX5twrJqP
         XxmaujoeNd3gYDHLeC3RQIKUKa48tL/Mxpnw4bpSYHN9bBJGOakvs6LCpKFlFRIa5LXd
         5o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745225957; x=1745830757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJt22UoxXb5se2qcHLgjOMoqAZDai1RFkWwTDCGzVRA=;
        b=WDvUknNS7Wh4M10a3bGrBfcvhYRum8NvLo1cjP7cWyiZfsKuGuc+IQCQKOsBz82jDx
         i8ir63MBVQFJ+WMp247vOG+o5eiYYjBD0aZeaMbElZ9R0Tzo5F7/AfuCx4P33z3BReYC
         24U9Ht8Ya14GUs1HFxW1aKxH8ZR6OnnVSyEttNbEk8Uqx6mD9FosSwXfm2sYiAoi7MuO
         Dgv5dXXILvbQtqNHJq0Ria8YABs2s12EjuifUerwsUlLWoKRYgIW4Si5wB9R1zLrljKa
         9nMnGszf3ulMpDPujszqGJKyQTIfOUrsqsBiycSATIn8hppgEr/S85oO3x9VdLPq+3pB
         v6OA==
X-Forwarded-Encrypted: i=1; AJvYcCUcTBAl/lG2SVOZO1QqFVw89H14JX5OvXIQmj91C6fwkP0UKr/kS8xqWc6i0pzMYRMBRKGM4srtY9xJQnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEBAnLbnJxKj1XCf0vh5pjvplMz2/OPuDRAVfaw07wxctpxevH
	xvHNKmv79dTIBZR5oM/4ShRRKnqhaA3K5WZuiAY4dgEaQm2HBiuG
X-Gm-Gg: ASbGncuk4dR/fXF/9S3r4io4hZg3TCVtnpqyXM0Sus3kCQ8R5PzXB9GZcO9HeObtr3u
	ZlzjCSN02ywdK7ROfEn8et43I6KaTOq5+B/oQ0opfUAag6QZ8jiQETAsEyL/2CLzYL+O36VfYyN
	oFS4+JzfzoibL75AlWSPHPvqFQUViIKtyv9a2Edc/vCNfHZk9etAH41LXq5q8GP039SSD3sduQa
	XoMppbUAIUNddd8edlsZls/hU001q9SOvxDYhAhgtI7nRV6VPIgMLee9uw+CLxLvuqp/GrvGAj8
	J7Damq/GTjVwetDzCnKUTn5kkFAL29xVcI6SYywK6iUOQsf/KQoq5lPjA0M=
X-Google-Smtp-Source: AGHT+IH5Wf2H5/XfeVWo/gM8JBViwj+Bhcr0UREOSEQDI8YTwTqKmFyv0rFYQoa0bheieT8p1RmNfw==
X-Received: by 2002:a05:6a00:18a5:b0:736:4110:5579 with SMTP id d2e1a72fcca58-73dc14537f0mr14483327b3a.2.1745225957159;
        Mon, 21 Apr 2025 01:59:17 -0700 (PDT)
Received: from localhost.localdomain ([115.99.204.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beb0dsm6082879b3a.33.2025.04.21.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:59:16 -0700 (PDT)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	mcanal@igalia.com,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jagathjog1996@gmail.com
Subject: [RFC 1/1] drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor and .debugfs_init
Date: Mon, 21 Apr 2025 14:29:07 +0530
Message-Id: <20250421085907.24972-2-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250421085907.24972-1-jagathjog1996@gmail.com>
References: <20250421085907.24972-1-jagathjog1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor to use drm_device.debugfs_root instead of drm_minor for
debugfs file creation. The driver can now initialize debugfs directly
in probe(), before drm_dev_register(). This also removes the use of
.debugfs_init callback.

Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
 drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
 include/drm/drm_mipi_dbi.h            | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 89e05a5bed1d..66f292c48a78 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1488,17 +1488,17 @@ static const struct file_operations mipi_dbi_debugfs_command_fops = {
  *
  * This function creates a 'command' debugfs file for sending commands to the
  * controller or getting the read command values.
- * Drivers can use this as their &drm_driver->debugfs_init callback.
+ * Drivers can call this function before registering their device to drm.
  *
  */
-void mipi_dbi_debugfs_init(struct drm_minor *minor)
+void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->dev);
 	umode_t mode = S_IFREG | S_IWUSR;
 
 	if (dbidev->dbi.read_commands)
 		mode |= S_IRUGO;
-	debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
+
+	debugfs_create_file("command", mode, dbidev->drm.debugfs_root, dbidev,
 			    &mipi_dbi_debugfs_command_fops);
 }
 EXPORT_SYMBOL(mipi_dbi_debugfs_init);
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 62cadf5e033d..351d2a5b9f27 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -115,7 +115,6 @@ static struct drm_driver ili9163_driver = {
 	.fops			= &ili9163_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
 	DRM_FBDEV_DMA_DRIVER_OPS,
-	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "ili9163",
 	.desc			= "Ilitek ILI9163",
 	.major			= 1,
@@ -182,6 +181,8 @@ static int ili9163_probe(struct spi_device *spi)
 
 	drm_mode_config_reset(drm);
 
+	mipi_dbi_debugfs_init(dbidev);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 0460ecaef4bd..94466dd8db9f 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -267,7 +267,6 @@ static const struct drm_driver panel_mipi_dbi_driver = {
 	.fops			= &panel_mipi_dbi_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
 	DRM_FBDEV_DMA_DRIVER_OPS,
-	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "panel-mipi-dbi",
 	.desc			= "MIPI DBI compatible display panel",
 	.major			= 1,
@@ -384,6 +383,8 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 
 	drm_mode_config_reset(drm);
 
+	mipi_dbi_debugfs_init(dbidev);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		return ret;
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index f45f9612c0bc..88a9c87a1e99 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -230,9 +230,9 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 })
 
 #ifdef CONFIG_DEBUG_FS
-void mipi_dbi_debugfs_init(struct drm_minor *minor);
+void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev);
 #else
-static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
+static inline void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev) {}
 #endif
 
 /**
-- 
2.20.1

