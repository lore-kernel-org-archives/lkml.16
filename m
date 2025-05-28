Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBD128EA63
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455101; cv=none; b=IZZ+z8sjvuY6kG+6XwuKvwN6HS7QKBfmJgs9aslrWcQlccBeMUD4L176nkDfaQne6JK6kt8MqGaRBFKS6LyrPuv+59Lx049XyLKb7ZvFyc6OmoOqseKYqNBiLu7UfxxU56BCpkAN0oGjYPBBWDODFdOYb9foQaU1SI3tF+Obj/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455101; c=relaxed/simple;
	bh=0tY2vHO1hSHETEU5NJ28ZPlV9OSEuEIkkxCtmk8GL9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PV15SBUfa/8dbgc0unE0b1AzqccrObXxL00T6jNqBsQP5ky+cNoV72pIovhiW5YhYB/H73aMrIVTAYc4d58z54Chgmfx/iWN+kCxl6qcu4RcCmJK50UoCISXZGFN7f1aWACEHwJ5aTkHrfe1o3bSsLBPbDxqMZALZypLt7RVO4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dz3ENNmK; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dz3ENNmK"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54998f865b8so1486e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455098; x=1749059898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGJ1fPweFHWMTsg0HgqwvAn1DtJjgjoW0O70zAHXxoM=;
        b=Dz3ENNmKoU+mAMXgz8KIWjqTGBN8zmTObQjYBzI21qU84i+VLiF7YKYLToF5nTOjRk
         VmNnVcYhbjTF9BmG4rtUHxu8vc95ritG9Am2+O8OQp4F28KNENBECNk5oQUZGyk/YEkD
         Db5pxNDQcgO8wZ+ftDnMw0n+A9J7HswAOqd74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455098; x=1749059898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGJ1fPweFHWMTsg0HgqwvAn1DtJjgjoW0O70zAHXxoM=;
        b=ecrDJYSXZX0M3ghPVMIH3ny39YNrlk6djU/121fXm86rasLDyoiVzHe8daCcf0Q5bd
         7IbFy9kpmGoDcRsOOb9zVzPKsIVmxRC72vZi9mjpPCcbSWBw9C1fuQMKfdQRChkSJpAO
         PQllXB4lYeLUVSiWJPCLmDGTeDbmt/YJnotv0vf0TWULTjx6xyqlMH33oUfHcH5bgNxS
         9rFiykyxeIpzM7kEwiLimnpHWGKoBN44pXQuUGcZpXCYx4v8IExIsprBrja1Qld1C/am
         rQPWMFWdm9rorTAfnr21rU+t0NHjZtTw/r2Jjf77+7r5E+aFcjvC4xk3EiwUGKIuguEX
         lVsw==
X-Forwarded-Encrypted: i=1; AJvYcCUQO2podO6KPcy2LOuLv89dB3s39plaRF6n204rZKqHSVpr5nEMeifV/uMfaOdllsxuW3NYgt2469ZZqSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkz7wHU9mNnFnT8F0elgV4dPwhTL+cmYsegUqssXuA0wHkvv8m
	2DHXXr5YP6IURqXP2h8tXw9Xl0nfSOb9YCnmnREMkT1x9RZuFNLmpnB+fPqvbAhaYg==
X-Gm-Gg: ASbGncvI9aFhAQ807Wm4VHTt12Z+2tSCxWzdHuD8z8eA2wCtHThXpNIRCqGopM4fk9Q
	g+Yn3B3d0+yY2gfGnBK4rPJVsaguzexmL+i/MejYkBraQQhHBlgMn/vNDYY2tzTgL1iEqK0LAkJ
	Zn9njzkJt2BD02ihWu+EY3iJpEhbH+EpzQXzpU6TSnapCKPb2ojDbItSDJ19HGkaHfUulmqdKqR
	W/aYEcE431wYBnpZazbFmc0lUqLv/QKTCETwYtKdZlc2tpXmb2xBHe/S4W2HVCPRfmTelA4xNwd
	9E3stGVw+PpdAfO6KGwBX0AHzHLhlXOrrkQ9sh7mNHztcjBqzayEu9CTyFmifNGmlkM+yHImFkL
	P/lbIFo+iigpxwmytWj3zfe5ulw==
X-Google-Smtp-Source: AGHT+IHg4uwY5pHE8HQz7g2AWH8xW287i0HnJpxZMDaAgSGjEn7J8TG2eBQXfzqvF/9EN1laDtI8Ew==
X-Received: by 2002:a05:6512:2388:b0:553:252f:ade9 with SMTP id 2adb3069b0e04-553252fafc9mr3783218e87.4.1748455097777;
        Wed, 28 May 2025 10:58:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:58:04 +0000
Subject: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Right now we cannot support granular power saving on compat syscalls
because the VIDIOC_*32 NRs defines are not accessible to drivers.

Use the video_translate_cmd() helper to convert the compat syscall NRs
into syscall NRs.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
 include/media/v4l2-ioctl.h           | 1 +
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
 static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
-	/*
-	 * For now, we do not support granular power saving for compat
-	 * syscalls.
-	 */
-	if (in_compat_syscall())
-		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+	unsigned int converted_cmd = video_translate_cmd(cmd);
 
 	/* The following IOCTLs do need to turn on the camera. */
-	switch (cmd) {
+	switch (converted_cmd) {
 	case UVCIOC_CTRL_QUERY:
 	case VIDIOC_G_CTRL:
 	case VIDIOC_G_EXT_CTRLS:
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 	return ret;
 }
 
-static unsigned int video_translate_cmd(unsigned int cmd)
+unsigned int video_translate_cmd(unsigned int cmd)
 {
 #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
 	switch (cmd) {
@@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
 
 	return cmd;
 }
+EXPORT_SYMBOL(video_translate_cmd);
 
 static int video_get_user(void __user *arg, void *parg,
 			  unsigned int real_cmd, unsigned int cmd,
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
 int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 			       void *mbuf, size_t array_size,
 			       unsigned int cmd, void *arg);
+unsigned int video_translate_cmd(unsigned int cmd);
 
 /**
  * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.

-- 
2.49.0.1266.g31b7d2e469-goog

