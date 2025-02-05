Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05871519B4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769390; cv=none; b=ML0u3+9pJDUvHkt/S4MmLdkFAxGtlsqbFwy0rNoYPzM7nQpOTo3wAXby0X7kgHmkF2Pkl7wKAhGI2kTxNI0gszU7w3e5zQsguNCWqdz80Eml1VK6Hid79RK3+Ki99V39pJlnQ5I704dYOmFq+ab2coE6F+GrdWFgl0MYd22hhhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769390; c=relaxed/simple;
	bh=FvXY0J6HFmz+F4kGGhdiUtByaCV/93S7mXHV8f989j8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZENCqlvV5EMQbL8C4KmPqwe8ycGrIctmclhL7EFAtoSkf/4r50AxI38rglLAHzgcNDOHCcr0/PsWOVxnl2zD1+scc2X5j3BNH0jPft/Y9g7u/oBa3h9uF1328wMCxjkJg5jxb0w0NyM1S3COyz0M5Vm2v838flHTLqXGiSe+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=esxjg95g; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="esxjg95g"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3652531f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1738769387; x=1739374187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=esxjg95gxLvoL4tfhbUY+MXrYWaZG52vA3YB9LDe45kATW8TzQ6Di9tvF1iUim3o8B
         /WgNjBvhPa+rmWw80lJW3lBaP4cXiJd/1G1kHhCe0HNdCD21hd5g5P+SNfruYh21OZKN
         +AkurBHF2ueds0jGGnX5YMGz7gZ6shHMUgI7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769387; x=1739374187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=iRRdkY6mZErZBZxTS1xn54q+TaWAJ8xZ6rYdQkQGqNYu2NyfzTk3qFEaB1OLbDO/f1
         qdv0bN491fpe8awavfuNf8stHR/vMvE9cjZ1EtI3fuMy1Y0E51lzLv1FjttMdE+FmwrC
         DTafZrXyb0UvHWRVUyCUFQAlucvfY0EsSdy7wRfDizzZyh/URVS/318dqza3XhxJYeAU
         qphRhPwWspNeNZSUUH1PAyYyQ+ORzRfm9ykpgUIw0y7RI0bRa8LTYgSCHDmPfsbuFocC
         Y4C64W9sc9O5nmOxkmLldNzgCl5quoRGZQtpNMs7QTjYGEmRsigRr83VosmP8PVSSbPc
         WsHg==
X-Gm-Message-State: AOJu0YwuNb/9JjHErKVTTg8ZVtv1CbczmmjQ1HTqTTCPgKxWKpDk9Bez
	Rjk+CJxd9lKprAWYegxxFvK3EZ0cTRI2WhL8QUFUPQJV5s3C5PCj1r2EjJC1oOrolLUnF3/5KAI
	Q
X-Gm-Gg: ASbGncv39EDpnC3+wg+JrS9p2mnZEpInIktc9ioQZX4POO1Pv1JyOXrUJ9Wxxgppz6X
	bXLTtwGwyM8afj6/TIQLmted7InKecxELXteFbBTTUWZttcKKwTN7l9lpibpwzDPWbYN3nq2Vfh
	Yb4x1Qvfr2fRM1ct0VdHMYMkTSlTPnVYUT5ecE52cKSKsA/olOZ3HbsdObXo5cLZxu+if8Zs3Ei
	tzl4crcBcEuXxP1LB35cyXys7t9nCyb+WdCGumD4pSVRq3IQ/tBwLg6xQJD6mL5NnNFF3xcrZ/t
	GzdPpOjxLPSa6TDZAn/2WjELzntsmbOBiMJ00i/n71faj9HB3Lc8fo2w
X-Google-Smtp-Source: AGHT+IHUegMKoF3Uu+JDrnonpKTLGgAqfUbpAC5vcQvzwsUpc+CNMtcSoxp8JpOvJyhpCCI3zm2NQA==
X-Received: by 2002:a05:6000:1868:b0:38a:4184:151a with SMTP id ffacd0b85a97d-38db48fdf85mr2428469f8f.37.1738769386468;
        Wed, 05 Feb 2025 07:29:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf999747sm4475386f8f.19.2025.02.05.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:29:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Wed,  5 Feb 2025 16:29:36 +0100
Message-ID: <20250205152942.954381-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use aperture helpers to remove all generic graphics drivers before
loading mxsfb. Makes mxsfb compatible with simpledrm.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

---

Changes in v3:
- Add 'Reviewed-by' of  Thomas Zimmermann

Changes in v2:
- Use aperture_remove_all_conflicting_devices() instead of
  drm_aperture_remove_framebuffers().

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65..e5eb644b54ae 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -361,6 +362,15 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
+	/*
+	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
+	 * located anywhere in RAM
+	 */
+	ret = aperture_remove_all_conflicting_devices(mxsfb_driver.name);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't kick out existing framebuffers\n");
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.43.0

