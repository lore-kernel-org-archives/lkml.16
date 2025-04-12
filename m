Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED2B20296A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744480454; cv=none; b=L0HXYSWllvAROcB1bycoL046Tg6wU3vZronNPwxQdgZtkDKE4TKJ/276F++d0urhoWRlId/JMU/81WenwxlzpX9eIqzNnyKUGZqaWvmToaupwkSuhUjsG1takMWU9t4HVoSC7sU7fBtCWrlNRkk1TM/Niyzj+UYDYtDp/FgwWb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744480454; c=relaxed/simple;
	bh=W0ugzeaoQWdS5wdejHVARpLTSFsPc55dN7L+NhqSt6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S4NpWsqILXNOQZtuWPNFfUwp/8/judG6fE14LrJqY1b4jzD/wTPwU0QfvsUSzV2W+lgQsx9mq+DqkO9ex4AB4YKRKCssQm70f52FPcipb1dvYW+yQI4qWtwhlwlLsexEZTWgdkkA0sEn05T+fDkeLMrzkoUbvIrP5KE2IY0KMMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKWjcrgF; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKWjcrgF"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47745b679a4so532491cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744480451; x=1745085251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+swTvs1bMwk0dAlVOfDZ90gSAfKDS6pnqb80rHKJ+c=;
        b=BKWjcrgFESK0BhuDX/CyDsklDOp7TY8Ba4KHyd7V2Z0ipTHxGdoBlULJ9/RIc6DIdw
         uqI50Ny/Q2TWwJsc8D5lrNFIXPRG+g5sXVgkvGze9AfANz29cWxtJKkNpyJle70X158U
         kCk/wJ541y+ErAYrsQlrUR9NlwyYCvkZAEPkg/uKnZ2pGIYVKRrhkkVoDJJa0p8hW4AT
         HH9jfkEz+H/QTxkxxNBakUsbLDezqjiPhOwU6WZtQ4iuQ3pBM3ivtfN1b0kk4/newn7t
         3fqjtJc90PUpUQJ1VceV0b3YB7rOZsOWY1epDka87ky6K1t23fvWmcuTRJVU8/5kBpsg
         oPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744480451; x=1745085251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+swTvs1bMwk0dAlVOfDZ90gSAfKDS6pnqb80rHKJ+c=;
        b=ivqoc06TPRSfyYOgVZ29hOwqipARoTIiIjCxYpsl+hEaSSE75t2sP6JNpgHlf8YzJm
         F5dz3UY36nIUx0opXt9SNFWlkaGGSZPuZlLiBntc6mDdWNX80WR8raPBiMu23+qaYW0K
         I+6h0aFeaUDdYHkORE50nzOHcrqjfU3xDKg3W/2G7Glfn9xjNNk9irsQlzkHq67CZcI3
         z7zNWVI6+HR/GtT0dvnI1FArKITCHVlaFsT9P5a8l0NUbjXWXchZH4AEG87NpTa959Rg
         8KVTyOKMv+unlQj9JLSkqT/jqyk0UeulBSzmxRfPV2NEm82/uaVh3lj6pPUJ5amsNz+i
         ynqw==
X-Forwarded-Encrypted: i=1; AJvYcCW6e2NgX76UL5aEbhOBm8pNB73BI4SrpY3ATgne5urFANBuGYFT4jC9wDn3AV4CM77puVQ04LApZoERv+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtvgpQVA8AAP72+PZSwMRCRp9go74ALoJrWaLxGbWsW6wQ0rnZ
	QVjUY1T5oJqLeqGY/N+6HWPiaa4Ae9545IhzTbIFO7Laa5Wj6Ls=
X-Gm-Gg: ASbGncv+eaNSM+7JmEeKruybulcozHkY9/q2iuey7N7b2xWLjgL9JzfDwrNx9DXTo22
	ICACWASvrbEfasm8KKpBRhtOLDASoxuVjSSn8p+hd6dUZDUiqBE0sZ4innAlaGKK9Ff4fELWu2V
	EgJ4aqP9Cn85L3V81nApAdi9IkkeVnApcVEtkvejbaL4gqK6Zj43D4IcOBffTLH2If0PYRY+iZl
	oT8WnPysG+jLF1gsrgdTVK6jsArKBwe9IINJxFlvjD0CWEP3YaVLOPl9nDsquJKwA196JW4gPY5
	LuwogffJrCabrYqrcgttpbvubfAye7zB1Tga9lab641qV7Iv
X-Google-Smtp-Source: AGHT+IEL1SqJ5F06hbFN3Y1JvHG2PLyceL1Lc10guuRTd0YVFxZ2IuhOYNTle1a61WyixhDH669LQw==
X-Received: by 2002:a05:622a:3d3:b0:472:1d00:1faa with SMTP id d75a77b69052e-479775de243mr38040611cf.13.1744480451119;
        Sat, 12 Apr 2025 10:54:11 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc0e57sm43012951cf.65.2025.04.12.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 10:54:10 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	lumag@kernel.org,
	tzimmermann@suse.de,
	dianders@chromium.org,
	harry.wentland@amd.com,
	u.kleine-koenig@baylibre.com,
	airlied@redhat.com,
	bskeggs@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/nouveau: Fix null pointer dereference
Date: Sat, 12 Apr 2025 12:53:56 -0500
Message-Id: <20250412175356.3123901-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of drm_mode_duplicate() is assigned to mode,
which will lead to a NULL pointer dereference on
failure of drm_mode_duplicate(). Add a check to avoid npd.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
---
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
index fd2150e07e36..f39a7028933a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
@@ -229,6 +229,7 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 {
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	const struct ch7006_mode *mode;
+	struct drm_display_mode *drm_mode;
 	int n = 0;
 
 	for (mode = ch7006_modes; mode->mode.clock; mode++) {
@@ -236,9 +237,11 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 		    ~mode->valid_norms & 1<<priv->norm)
 			continue;
 
-		drm_mode_probed_add(connector,
-				drm_mode_duplicate(encoder->dev, &mode->mode));
+		drm_mode = drm_mode_duplicate(encoder->dev, &mode->mode);
+		if (!drm_mode)
+			continue;
 
+		drm_mode_probed_add(connector, drm_mode);
 		n++;
 	}
 
-- 
2.34.1

