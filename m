Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6951728D85E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293236; cv=none; b=S+ecpTxnGzrJ9SW0wsS34yZ5+yWz/mbcM/wK43qlgs262a/tze4s9MypLus5kS6oayklkasPFMiTqDNnWKY3bEzjID9qUZSu6oO3ms4q2AFoQUvmWd7K/9wBqSlYVIU9GkjzIjnj0DCCdc0pdkzjhmhetx3SgJsOrUdk/AyXrcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293236; c=relaxed/simple;
	bh=StIjsrDQQ94ySFohrFAOiuV4cwGsQ1ciljTg7HivbGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2wNaqUFMzdWoXYUPj1RODsiyDTlqefEn4QIydpQrIMgdruMV4pUCRLQ87etl7yh48DyuqIHy+9yry+uTdRvh+DLysu/lu/oNdvjfY+Bku5gX4ceWhlFR/Aa8DwIAUODssswwlc7cznXhR+saewENxztcaiNFc8GwefMg+ms7VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Or7EttL8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Or7EttL8"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5535652f42cso5335324e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293232; x=1751898032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAe7NPUv3UgqaitLxwSrpp8vWQyIkzVUxkP+DtxYy80=;
        b=Or7EttL8zMipdGyF4PtWh9cC5FhUZgnYaOQpD0HNumm3rorl6crQGWSDahFm7+WDc9
         i6L01cU/QplyT6QjEXze7ydmdZwPl5+A8brBnqcl4rJ2tuOrSR0wmuq1QcP7GTqi7BPJ
         D3AbzanRdJl8L50qqG92uQx+QgqB8UqqkEj04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293232; x=1751898032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAe7NPUv3UgqaitLxwSrpp8vWQyIkzVUxkP+DtxYy80=;
        b=ovFxqtvqvWzSaCP+celv/6Ii6MFejRQH28/rq+Xq26GYUMeZH4SLkn6UpOB58fL5hV
         fYdFiXpjbNCzJswyX0F5TNwPGodpCB+MlatOH2zUkPVQOoXiniiaiHDxmG4UfJuRGaTn
         RUfzS5bch3+cQPhdXX1z8srnCU9NIeqNSEOqAHoBFXHEgoxr1Mo++XHP4mnUAnAeB2oC
         hLbzQoSAK+fhlcGj6b8DjM8HG7zhMHyEycv8AImPn0bLbHQuM2fRBYsdX5hStmgyCRmi
         ZNEzROYwKoUjYUqqgl5nkRzUaJFzIOx3jS9juUg93t4/hAgSzWXDxXGEhenKDfnl0Ym+
         EdBw==
X-Forwarded-Encrypted: i=1; AJvYcCWAtlpitG0Ce5PEmH43NYcbOAInHBj9DLCi/ZzCMMyOt1fHUI1aFeZ1v2vcBsDCHvAqRDYCI4/6PnWMEHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhpz7+Mn0Pjoj1FYmREvG52zkgbp0u+9gKtuwWpErZbhiacVf8
	hvf5ICaSVYJaonopElsuwxEyA3wQEFaiAht/z3GrgCwx8IHZTbA8P7iOk14Isz6jIO0vcJmxXoY
	nqNE4NA==
X-Gm-Gg: ASbGncufncxU9F6X2/Ud0LIY/d/5NAR4b1WaO8ZfUz5DikCiV9ugNdDDNxQPQszw2Zn
	hwi85ELE5w0MZ704fPK6Ikgh/AkTk6d1pyneAVF59Ladd0G2FzMfC4hrSJrBDU56OqPBv31AUof
	Apc+TIMSpBXwLiUgKayKoMp8Ktor/5cTSPSqv/GLc/y5kLBJcklEyldZuSKPxhbzOZnik5Tu1Ss
	1gBxMjEL3f9gSKX1DO5D26X4ZxR0KoijMR9AciwoTewISEf20CAb3KVCD9KfWyT2wOwjOTHBPw+
	f7O8TzldrqGxPoVG9cFhHvKfKXcrvhT2j0fA7HhszfVb3D9pqmyeDtT8FdBquAxb3OEEdtX2w3D
	O/coWjLQxuvsJc86zVTtcgR2z5uJyp1+qmOc9/KH3KQ==
X-Google-Smtp-Source: AGHT+IH96wRX1j0FKyBt7CEEjQe/wEUSTI8G8V1XuwjaaQ7uyNNMf+G24gjYADezAvSI/USmW+h+mQ==
X-Received: by 2002:a05:6512:ea5:b0:553:a469:3fed with SMTP id 2adb3069b0e04-5550b7e7b6fmr4009017e87.11.1751293232320;
        Mon, 30 Jun 2025 07:20:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:32 +0000
Subject: [PATCH v3 7/8] media: core: export v4l2_translate_cmd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-7-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 5 +++--
 include/media/v4l2-ioctl.h           | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 650dc1956f73d2f1943b56c42140c7b8d757259f..1e22ca898ab77e581d78c1a618e1de0e57281cde 100644
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
+EXPORT_SYMBOL(v4l2_translate_cmd);
 
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

