Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA87824BBE3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682480; cv=none; b=pEpX7qocHYYHJmme68DTHYDjWi2l/XJtT6G1VmpH21jPCatNAl6c9Q8eCI0MeplhmMfy1CCgg2Ckbvc9MzxeEF5GJrN8oNCITIaTk1G90hBrek9kmsLnS9bxasrjA+8VQdRQw4FQ9x1qodZlugeESl66FgKUYdQUVES4e1s1fMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682480; c=relaxed/simple;
	bh=2P6LBPdwOq7fYzi8nQocgxh6glcztrFZLRA1W+qMTOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CW921x+B0zPQEMgvkiU2NDgV8iZtNESmjE3TABM5jzVZD6y9ZresMV+OR0bAxATkbIDnPLR453bZfBVXtn0WzuJfTkWlu5zfyzW/L0AiGkHZLVt8m1EjujHZmG2btpTwkc19vf3PU+4iGKPJRS0Z4OPIsMHiUse/KOd2wohJWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bv6VdqyZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bv6VdqyZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso3944345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743682477; x=1744287277; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/jCevx24uOhH2Yv9CVXT91AbhBZfEmtWMRKLBjAx74=;
        b=Bv6VdqyZQjwxcMRu/u8fi2feGOvw8C3NrlrGn106GboN9CGqzrWvfMD5UKtQN7imZU
         ljyFKqnJWSbLcc8qoYz66uiHTa+2l/rmZ8GohSGrnz9sBEiCEqq6Nrn2En4PWpMQ5yrb
         GYi1dpVFli2eqiIXZQmpPBMN7BBjDSm9KrDERmCVFVzWGMhILk5UzVWftF4dCciQLauR
         hgVqEcVjlbTMnkYaa1oFstCLJFtzTje4CoIeQlvw8bhGZr9OYAOnB9Drquq885o81B5M
         zfINTJIeCEzlljF6RRqeKyUY6BQU8bc+E/e+93mojwwJGlek7/JeSmdp60stPMiQ6/fD
         G/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682477; x=1744287277;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/jCevx24uOhH2Yv9CVXT91AbhBZfEmtWMRKLBjAx74=;
        b=Gt6fQyaovLKIMbI8j4pwgPVHipA2wkixsC9kYEEOe/8mi+BLKkwVE9wA5lDfzavuOK
         og5ujDXbeA4GPKZq6kn/4GqmvBAjaHyqpZXXIWXhUeY5stQ5zF8/lUq3CSylzbzFUAb0
         dwsTL4cVpiwMzv1mGfSMcFkZAw0Oq5WYonwUdmVatUlnSsgk7u9JEmlKoP5HDDZjA3WM
         cNSlL7rdqQuqvLzaJcSONzrVHrl2PAVbvLxpLvCaCoxLqKZt0L3WV8WnLw1oXRqA+w/d
         voC5JpQwclhOcSsT0fk7GTKPdvBt8aWKi7vSjAfBoaQ7Kar/5WI+T177BG/lgpMW7Uvc
         Nhgw==
X-Forwarded-Encrypted: i=1; AJvYcCVTHM/ZOBWenyjY5uidVA1hyUmd7gSBCnqG6yT74cGWpasdTAYdo1z0jBNBodPBE2SSjW6B2sATKqTq0Mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnsZo75GU4c2XEgJyX8TLmc01DNre0YWHGH75TecA5n21KWPk
	RNOupy5IoiEmHM2YHttoH7Eu1uATg5IVQI8n85QWUfG8J57L/AyDDZ6pZyPn8h8=
X-Gm-Gg: ASbGncshykqHqixeEM9Ti06QbKhAVZ9rHWFTs3Zfrzugj5ZIrktgQZGbIH+2Tpeocvy
	itI9ZJX+5AhGKlF/nhU99Tj33ef8delDn3Uc8vDP6cFiwMIBr0Zh9PJGUJ1YPHJAl6zrcCq+FwF
	7sKL986mK9N00f8NOZisCXt9o+GQ6RHrf9TcXDzo2eKRTRE1ZOpagNo83mL3RMbjcJOPfV5wsSk
	co+RM0lYF0RRnlph6HIL5P7ZOrUJZZi5gx8ptlSPOUq4i/bGSOiintXjgT/py4mdfnQKvfLQBCg
	XXd2GXgWJKfLOvS7KXaNdByzmRrHcWRUqKD8qDGrwzqVnxRY8A==
X-Google-Smtp-Source: AGHT+IGkavCS1QLioI0A5um9YHakZm/b68w7/8yrhL34IDIj0Vn7SXOf+jbx8K2zNM3v9nUYnPtePQ==
X-Received: by 2002:a5d:5d13:0:b0:39c:1257:feba with SMTP id ffacd0b85a97d-39c303ba531mr1381065f8f.58.1743682477082;
        Thu, 03 Apr 2025 05:14:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30096b9csm1667479f8f.13.2025.04.03.05.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:14:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:14:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/vc4: release firmware on error paths in vc4_hvs_bind()
Message-ID: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There was a bug where we should have called rpi_firmware_put(firmware)
if devm_clk_get() failed.  Really, it's better and more readable to
move all the firmware code together so that we can release it one
time.

Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Use a cleaner solution

 drivers/gpu/drm/vc4/vc4_hvs.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4811d794001f..06aedd906d74 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1675,6 +1675,17 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		if (!firmware)
 			return -EPROBE_DEFER;
 
+		max_rate = rpi_firmware_clk_get_max_rate(firmware,
+							 RPI_FIRMWARE_CORE_CLK_ID);
+		rpi_firmware_put(firmware);
+		if (max_rate >= 550000000)
+			hvs->vc5_hdmi_enable_hdmi_20 = true;
+
+		if (max_rate >= 600000000)
+			hvs->vc5_hdmi_enable_4096by2160 = true;
+
+		hvs->max_core_rate = max_rate;
+
 		hvs->core_clk = devm_clk_get(&pdev->dev,
 					     (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
 		if (IS_ERR(hvs->core_clk)) {
@@ -1689,17 +1700,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 			return PTR_ERR(hvs->disp_clk);
 		}
 
-		max_rate = rpi_firmware_clk_get_max_rate(firmware,
-							 RPI_FIRMWARE_CORE_CLK_ID);
-		rpi_firmware_put(firmware);
-		if (max_rate >= 550000000)
-			hvs->vc5_hdmi_enable_hdmi_20 = true;
-
-		if (max_rate >= 600000000)
-			hvs->vc5_hdmi_enable_4096by2160 = true;
-
-		hvs->max_core_rate = max_rate;
-
 		ret = clk_prepare_enable(hvs->core_clk);
 		if (ret) {
 			dev_err(&pdev->dev, "Couldn't enable the core clock\n");
-- 
2.47.2

