Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493EB25B31E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352331; cv=none; b=Kfj6l8O3GF8Lub6ihSClccT+MccFnozxKY7yeoiuPZpsFNMBkJR0nLrpin9v+XiEeir2wTO8jKOAjQyUFPYp8ydJoYSkv+98vdqrnbMomFBlsWxHrelJIcYyaznx+oDHGRFxNGCAwCktOIkS99FTg7kfdxL7GY54Xo5E08D2tfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352331; c=relaxed/simple;
	bh=PvzBPmJzhk7/IJxcpwht8QvcuAIPS9riiN7xib6R3SY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1t2g+xoH39WrYGxVTP1s7n7uvjCyS48ebv0EbY1Lv40Pvo28r1hVu3VebSq0xoQ8K+4K84vQ43iKmyhVgO5xPgEVVj4iRWecCJ1ypZMsUAE0PRAZ5G0F1DTXNIf9gnujBElV/mjnCPgnCgzG7eCt3kJ0vcFWmnLtTDWOxSLKWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ltGk97A2; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ltGk97A2"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-555024588a8so3017449e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352327; x=1751957127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqqRfEOXg2jWas5fsy2pOgHyxsxuUlHa0I3FSs4Ep3Q=;
        b=ltGk97A2UfVrljRalSNOiV+Rof/mrWCtsHqYDe07xdQgW0ibPypsRbhnBP0WKacf7s
         0qiaHb202WvAPRLwfP/xGySy5mUBmLt913aQ5uS798orZ9CVOPH4RitwfLHGO+ApWW2S
         TpeiTtk4mBChMhULVYddpH3lUm7HvEHc9sztw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352327; x=1751957127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqqRfEOXg2jWas5fsy2pOgHyxsxuUlHa0I3FSs4Ep3Q=;
        b=mPDL2PZFuMGutZdLCJ4adYTSkB4otcehwwbGifRTIKqV0zk+rwyDbgaai5iekcejvh
         Crt0c+1fRJwfgne7AqwP920HYpvsX5EX+U+93zoLkmuGORtBxdyxsbrd7KXlvECcCnRJ
         F5IkgM6+6UbqTjJbzejWxS41VC7czU7RpsQ4slpnziIDWtltrN0lbJPgZxqRYYrCimsH
         m+/3lYLRhqVm2A4m+28yqjQhyihdpwxTU+nl0pwJzYsHkF+iNgQETwKziLg9MlXq2r5U
         PzKOWdM5YqJcP/shZzFWVcV/muuJmXoXxUp9nGob0gE7Lg0heDsgmrO98GaPZhizSfS5
         B4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUsawC9LK8O1QYyPVdjmuYt0/vbgrmXy/deorVX9p3KMgG7yhOEhHcemYaugWlM9GcFR/BrcPtR9zoFArE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSvG4LQOQiubNSdNOanY/gnjxY3zHpj1/Cxt7JKJQgUKWaiSWg
	06Q0VV0PkDQCxJoUxx0RGWSPTFIuNFsxIeHmpwllKo8pWZA8Fj5HJmoQ/6q3b3IOlA==
X-Gm-Gg: ASbGncug6s7x67yKloynCQw0T52Rtbe0EuQXBwa0at3P2d4A3XliKfv+dD5wpLHgLJG
	eefcUL1GHgBV2Hp9dlg34FjKIMfTN1Fi7O9J2ltMrKmALq4IZXOrcUIi4+4Ra8bL1yaS0YQ6mLN
	7VQOxIoWOYsDHwo8iiUkpSL8ivaNaIf8zDfypEKKg19brYN6CBZkcJaVUYlVzxtDelZOOQOi+J6
	SwHB93JagE6RI2NyjXO3CL+SZvephvhJI0u0XdXukKGTlV5WiX7nezH0Q29oCvhbHReEmFKeR7E
	jO3SnZNR/dSdSJtRG4eZ3fTIRasdOWIoN27o2ndsbGzxzP5FAjSMaO3apVy4Ni1EZnByqFfkcoM
	LHoWvYN0NC62AKm11dZMW9uWkAod7JJx4c0mDi8MkXA==
X-Google-Smtp-Source: AGHT+IHgQk5ifT43dRnxlWLw7XjRiZQPhcJoHtpDWw68OclgLWRSgzhN0ymKBlBDC7lKG/Ur6B5olQ==
X-Received: by 2002:a05:6512:3083:b0:549:5866:6489 with SMTP id 2adb3069b0e04-5550ba224f5mr5229844e87.47.1751352327026;
        Mon, 30 Jun 2025 23:45:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:18 +0000
Subject: [PATCH v4 6/7] media: core: export v4l2_translate_cmd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-6-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

video_translate_cmd() can be useful for drivers to convert between the
VIDIOC_*32 and VIDIOC_ defines. Let's export it.

Now that the function is exported, use this opportunity to rename the
function with the v4l2_ prefix, that is less ambiguous than video_

The VIDIOC_*32 defines are not accessible by the drivers, they live in
v4l2-compat-ioctl32.c.

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 5 +++--
 include/media/v4l2-ioctl.h           | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 650dc1956f73d2f1943b56c42140c7b8d757259f..d4c147ea52903290c93fad5c2d1be59807d64614 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 	return ret;
 }
 
-static unsigned int video_translate_cmd(unsigned int cmd)
+unsigned int v4l2_translate_cmd(unsigned int cmd)
 {
 #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
 	switch (cmd) {
@@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
 
 	return cmd;
 }
+EXPORT_SYMBOL_GPL(v4l2_translate_cmd);
 
 static int video_get_user(void __user *arg, void *parg,
 			  unsigned int real_cmd, unsigned int cmd,
@@ -3426,7 +3427,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	size_t  array_size = 0;
 	void __user *user_ptr = NULL;
 	void	**kernel_ptr = NULL;
-	unsigned int cmd = video_translate_cmd(orig_cmd);
+	unsigned int cmd = v4l2_translate_cmd(orig_cmd);
 	const size_t ioc_size = _IOC_SIZE(cmd);
 
 	/*  Copy arguments into temp kernel buffer  */
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..82695c3a300a73219f262fb556ed61a8f09d273e 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -679,6 +679,7 @@ long int v4l2_compat_ioctl32(struct file *file, unsigned int cmd,
 #endif
 
 unsigned int v4l2_compat_translate_cmd(unsigned int cmd);
+unsigned int v4l2_translate_cmd(unsigned int cmd);
 int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd);
 int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd);
 int v4l2_compat_get_array_args(struct file *file, void *mbuf,

-- 
2.50.0.727.gbf7dc18ff4-goog

