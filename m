Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C707214A94
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591631; cv=none; b=YWeRjZZMGhGAOCRS1kAXmd5EpCEK46BT5+d+di5LOsz1y4JIvY5uXpXJKOkyRnXuJ5PlU1mS6k1KXZ9mXr+LesLszcxFNS36JpQb+3bFHct/CuPgDd2jeGOMBzz+wOC56+OlSJcfvAePUHI4+3jX/TJ+64MxoYLl56w9cUtokxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591631; c=relaxed/simple;
	bh=S3ZKwf7JSNa7j75/HJ88Ydtg5YT4MI9/wq/yIT9hH8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SWDd5RB6E4Dafd1Q80Gd8YVAI8H7OiQvAyna3OAATjw8wTJaz1WUUe4kX1Vt+Vn8L6VerNCKjH14JDiNOh1mNKfM046w4UtvQ7DwINVJqOLoxJS5wxJ2L4qtl/s/5McrZv6Gnh4K0eaK/o8mTPP8zH+9vTAgjf7SgZL4ev6LQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8Wda7tI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8Wda7tI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c266c1389so983403f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591627; x=1744196427; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YueQKe2lSUKqMx1zyYBOOeeoHDIXSSV+ljXdbDAQySQ=;
        b=D8Wda7tIemBqg2KSebuoRUNQJudUOvOSRsCMOONhIVtzjIQqWG7S9ddf3Z8r1RIfaZ
         lb4E9xzO1jSpo30637KfsDBmw2Flf9rMLKfhwZi1G/K8KqJBkIczpuT304qqzDIUYZwp
         Q/PFDWa+ip1ryTHjZvJ9jijx5158SiQTym5d0Xb+eB/+ykMtk+/zw7nTJZBSNIUiqvpQ
         RvQ44YKYicyxU9AfnUdDu5nnGJUp2YEkmAwepko9eEle2fqCyK02p0TuHfe74BUByoc2
         UFSaUKB2/b8UlahrE6QeAmdmzifccnZULLVx1IODWE8Ehp6JEQj61OXtri81BFhgxPhM
         QoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591627; x=1744196427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YueQKe2lSUKqMx1zyYBOOeeoHDIXSSV+ljXdbDAQySQ=;
        b=hPUADpckmzN8de3gYyGZDzOm46aqnK9rVgQFkr5rHt0Et4HR7Zc0MObA9/VE8/Jv+7
         J4HbFrob8gAnHdYyKhMdSCU4kyTb9jdz1wChnIBzF82JMggXdDYj/bgwyhLXhDuuGu1q
         LoEnsS+INSc6Kx3PuZJvO2y0dNAinUbxh4e4dO2RaPyEkDjNzogX0Wm5C7UCEu7A+HUI
         n5mlcqybv1Q4bNzW0luSNrMx2VaBpn26KgJbn2BmbS72EBMerx4gi+izHHhGmQT5Bu5v
         x1G+oGXXcr6zvr0iCp4tmXyqY+N5WLAoKHAzPiCBPjwA7+FeFz3g0nFRthP6RyK49rUN
         YS7g==
X-Forwarded-Encrypted: i=1; AJvYcCUhqUfaOXgoYoLY6UL+9dmThsUcneET4U3c/JSNejY5vaytl6tjvsD250FxeXgOWb03dt/jPWMy8MQvKWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx98Vs2OqqBdGLgkyQV0rrm8HT9VbwiS+kW8Fsf54gDxqH9urCm
	RQazSmcRdYlgSGYGxrznl1aBD24M1AcrinmZ6yZIjrRRpnko+7EZuewPsx0klfw=
X-Gm-Gg: ASbGncu4v9B5onGh5mxekww7jFMQN3wkIM2FtqIL8aTpVKUGGY+zzIp+vpkWzPn10EE
	xoEcAxyfCZ29pco3ync0OkzAraFRiVbtViwFeykUmWO50toj297MWX5u+cp60I25nWQJmWglIh8
	otXbpcuVQdbtBiNLzWEhFtjE8DGaNmGl+7Oss1qq34Qcqy7O4ydT02jyNYDGonWiQSUKIf7gxZ+
	0rJiFz9x6OMWPLGWz9KT5lruvQQMpWPYScCHf/A6A9/bbV4nqrqjlCvKGQzCbeQrQ70sIn/7aU0
	hHMAV8MX0xvQZ6HHTvupfliXawI6yPlNDuz5FHrQokC18L0dT1DT7yawvc2L
X-Google-Smtp-Source: AGHT+IHvGT9STHY8C/CRWfPYi1GAudkPumuwpzo+YO6OzhKYGIHwkNQif12PUb6Nnfzjdo+udYpI/g==
X-Received: by 2002:a05:6000:1789:b0:391:4999:778b with SMTP id ffacd0b85a97d-39c120e1bedmr13908429f8f.28.1743591627519;
        Wed, 02 Apr 2025 04:00:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b7a41b4sm16391473f8f.85.2025.04.02.04.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:00:27 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:00:24 +0300
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
Subject: [PATCH] drm/vc4: release firmware on error paths in vc4_hvs_bind()
Message-ID: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call rpi_firmware_put() on these two error paths before returning.

Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4811d794001f..41e9d0aff757 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1678,6 +1678,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		hvs->core_clk = devm_clk_get(&pdev->dev,
 					     (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
 		if (IS_ERR(hvs->core_clk)) {
+			rpi_firmware_put(firmware);
 			dev_err(&pdev->dev, "Couldn't get core clock\n");
 			return PTR_ERR(hvs->core_clk);
 		}
@@ -1685,6 +1686,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		hvs->disp_clk = devm_clk_get(&pdev->dev,
 					     (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
 		if (IS_ERR(hvs->disp_clk)) {
+			rpi_firmware_put(firmware);
 			dev_err(&pdev->dev, "Couldn't get disp clock\n");
 			return PTR_ERR(hvs->disp_clk);
 		}
-- 
2.47.2

