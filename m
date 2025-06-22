Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32415C2FA
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750629770; cv=none; b=d6YNPH9vuEOML7zsHaRKlvw3Yi8k1nwSG+WzFkANq0mhGS9HnxW4eQc508B2oE0206Yr0Y9/KtMSMstlmvypFYMprhx2q5teCEmzA/rGAZSURx2JhSOAlPTuu6ex2/JVjDGEL1U8Q/ni/+SeUUQG/YrW6vzYyeqR5YYyTGUaAak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750629770; c=relaxed/simple;
	bh=RdeSytjFriCiVDqBfoNbrlxAhjFgOopRBXO/wo/M1mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJwgEGPZxBUko/GIQfESOtOga1cPewaTqvh44RfiAcX+LfcDcpOs1uaHDiGvb/3HTldJjNRi5JLpb67ghiCJ4LHPJQfFaFX0/adkzHrfs5zv7drKeyjms65+O7RQCvekB7Fpj5HlsVu12FDZJbO4bDFOSxH98Yno1bGyFS/YkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com; spf=pass smtp.mailfrom=mandelbit.com; dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b=Yujk1BfB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b="Yujk1BfB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so27626875e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1750629767; x=1751234567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt+OHlPcCexBjO5A/XepCZN5Wsx0OmQnDmQwiH7XPK4=;
        b=Yujk1BfBXh1Hx4egKv1XE6NncR75xuF0DbXQQna4aq2FI6/VIGIm57JlKf7T5r3u0u
         qjur+7hteEcJDKkM7Kj/oQW/z9UvjZfVKGDKESuPsQBLCikN97im5P+eYZsSxkNSoNTU
         qaNJQGe68V+9eyqYqqBP8vVBT1bl3NA/lFq47pYSAxRRJ5jTWcBg5pBYjMYT4qMysPiO
         s+IP2g0s3pcBgqnLe5cCy0FPfZ0dhtPlFUFa9nhGHUMiWdFGjSJ9JITSw+qn8YBYMUCv
         j7SeU4gfpJw0soCKbVLdfm7BS18phyhZ33+hYc2sTqy4fVXGHragJp7/p9iHN/OHCtzg
         IzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750629767; x=1751234567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bt+OHlPcCexBjO5A/XepCZN5Wsx0OmQnDmQwiH7XPK4=;
        b=FdH/Snrdn0gedQacIg9Gdwe+VY4Bo+jK4c1hheR5gNdyzSRiRg7h4DeXFW8UeEiLVd
         g+mZSfkYVrH2YN/ABATUuEBhmf2NCsdezz5tumoF1fwcpjejIg4uFrdvlU6a3JfXkQnY
         7FTzsnkx2o2LiCC72hHQ7SMxT5+plzZUtHnJcJP2fYr3DJUFohuB1j7I22tgjK0m4t0w
         DN9fY6vaZc183Fll7PMcilJDGPvcPNASPoCK7nVYb5/sX6WkPPOxSY2dN27IZr4JIdJr
         TBw7zSUhvb+9tqLoai3UOUxTq9ieVZ6cSBN2VeSpHmuqoj+edJw55EpA708O+BnQZRGz
         9Gyw==
X-Forwarded-Encrypted: i=1; AJvYcCWH+rc1TXnYMcIaszwR24172cyE5tX0whyz1tLwYK0QCFRwDSVUO/RIr3VyXx2ecLjooJQ4bd6bhQNWPJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLixZQHc+nMPgCrr5SybMMZLe7KqW8OCDHNgT5DTfzFld1JYux
	m8GVsEBWFBa/V3FdE39b2/CEkmCe79GagdxJcPi8ZSdZlkCIt5d60p+mHhpidP831+o4OEhD69K
	U5kM6
X-Gm-Gg: ASbGncsuM8UjITtlUr5ydDqvR6bC1An/kQYQX8w8u/AFORnTfve+wlsrCO/XuDuG7GS
	y0F3uSHzBIxR7AtYz6YlPHAoBdgqtRZRNb+cx4pMENy5mkOfKli3cmuINF/ZtwsSPRgXNgya9aw
	Ky9sVZJgG4gcDSup3UZ5rakQT49nGN+KOX6qIJPevJWKjZ3W3QCttNjAismcm30WcRs3wd7+G1q
	2F4/3vxxyq/38y/Wa6RZ9rLynqPZUDQJIDRBS2eHj+u2PZER1DO8GSqSErnuXicoURNkzk2lUea
	CmJFsQNavCnzbnU0+FmSHefOs2P01vQodFObF2WCIr3YpuTIZz/rtKDDrX+bgfVd/w5trdVlDvI
	0n+f+i/i4VIw=
X-Google-Smtp-Source: AGHT+IG0a+UKdfnjGI/Td/xknJ1CyetEZyT4JlqjGWXzeF8pdWoW25Vrb2Ox6m/940MfdEHPG+11yw==
X-Received: by 2002:a05:600c:8b85:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-45365e6dec5mr96663895e9.15.1750629766977;
        Sun, 22 Jun 2025 15:02:46 -0700 (PDT)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:c4de:19cc:e05:213f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b4bbsm122759295e9.15.2025.06.22.15.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 15:02:46 -0700 (PDT)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH] gpiolib-sysfs: fix use-after-free in error path
Date: Mon, 23 Jun 2025 00:02:21 +0200
Message-ID: <20250622220221.28025-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When invoking device_create_with_groups() its return
value is stored in `data->cdev_base`.
However, in case of faiure, `data` is first
freed and then derefernced in order to return
`data->cdev_base`.

Fix the use-after-free by extracting the error
code before free'ing `data`.

This issue was reported by Coverity Scan.

Addresses-Coverity-ID: 1644512 ("Memory - illegal accesses  (USE_AFTER_FREE)")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/gpio/gpiolib-sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 956411fc467a..c4c21e25c682 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -741,6 +741,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	struct gpiodev_data *data;
 	struct gpio_chip *chip;
 	struct device *parent;
+	int err;
 
 	/*
 	 * Many systems add gpio chips for SOC support very early,
@@ -781,8 +782,9 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 						    GPIOCHIP_NAME "%d",
 						    chip->base);
 	if (IS_ERR(data->cdev_base)) {
+		err = PTR_ERR(data->cdev_base);
 		kfree(data);
-		return PTR_ERR(data->cdev_base);
+		return err;
 	}
 
 	return 0;
-- 
2.49.0

