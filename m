Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15AF28E613
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455100; cv=none; b=asVNDkk/glwXVl6cAGZHn86VTxqq/FQ2oRt0GlOY0kAdHy49tK6GJR/hw/R2JLKZKy/CY528rCQeZ56hXU1XWjvdIjlqSEUFINCYE5OVCkcG5204Cq0RXFyoy37lMVF/zvZYLexQ++vN+TeO/IZlOyPrJCzoR7fKMZxZO00LnVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455100; c=relaxed/simple;
	bh=2f6SktVhzvBFpgR1QtGNdHQVCvywmEcSZBqzBzwzFe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZSUN7Tr8qJD3FiVUjux/wcPBC2A6f9KzK6HHzsmQFYkbxiSsmkuGfjsVRufzmJWJeU9R+Rc46P3ktDiismJGNyjJ41OighDtQwECxtdKw6qpuZc/D9Fiz8Fxw6mxcr52OkXZLIFKaGnbGfIzq4P5dNg23LF9zqilI2zXM4UVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sw1JDG/i; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sw1JDG/i"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so8402e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455097; x=1749059897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqTrMRI5OIQAm7mZwle2g0uzyDFHgfV3lxxsg/wvy3w=;
        b=Sw1JDG/iX/na7gkgP396BXwVLHaN9t462D4FFBOK1QFwkQYb5HgGCpj7WObjB2nW26
         YvkKPl4rPTDPgoSbhDNbtaFnKYdqiB9sc/Y99+hlh3dQdTsSeLvCZDCHgWfxWIWkZYV8
         ZWj2bnZU04ZiGjgblea5eyiVDNWO6F6ppjA7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455097; x=1749059897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqTrMRI5OIQAm7mZwle2g0uzyDFHgfV3lxxsg/wvy3w=;
        b=dCJz2EGbiieuyQ2lZirUlSM4u8iytjVIBGwQ9Ck3be8+xa+JiJUScIw8YMFsNVhgui
         UWx2nwJ5y+UpVWTTf+8oFILN/FsX38pCHTT4CJAg+7Flv+G3eIEK7jT5TR8/R/XTAz/K
         koCLj7lh8NsY3oTll6h7dAd++DI9HLyYVYAfvA3EECqCO+CMkE6EZHRF37FbotFzA/eY
         PuFIVcHPjDJFmEB2s0AwyOMtA6ZzFouB1U7qMjWzbxt2h/mDXApY3DBQgPQURvl1ANO2
         OkNojg0pFtmdR1i3YQ0PweILW4antcxUBZwR4xteiD113NKM9eBfefl+HzFVqPbJYuRL
         ++Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW20PL52lA1v0SO6cHkMMsbEwdwiq/wwqb6AC+3QG3zfGfjbsJ9W1nCNJnRhNtMvqQ/REJ9/vFFVG/o2ws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgy536z1Ub+n2nPI7mA7HPEOzmRXvQpDc0l3mhuGpoXkxnUvQ9
	jQafV3zFepdcztj8TWGDghs8Bp+0pt9fhQiMj5w+zPwXABfC+nqETPdDXKwqFSOe1A==
X-Gm-Gg: ASbGnctvTYJMIVODHC4iS+S/gtpM2ovEHQh0EYwWmm7HkdpPSV3/dawgG3YYZ+iwRtB
	ny+0Anw0qqRFP00Mg0SPpxDlWCbubQFKlFd9RUZlUXQGhVx+UfcT9H4qNX9VzavmBerh8nG5XGd
	HpXDgezFyLhRiCkul/k6GA9ZMT+KVLKMwDtMI1pfAs/zAONInO3zF9k6D9TWtSLr1JOC9z6Bqkn
	/VTlsWmAq66Hr7pvrNKGI+4hrCH44ysH/qf8mwXnf/XJ05xYrAb2doJc9OtPQy8JwUySeYhu/Ed
	7wFP3ZN7+UOZsBtGvQHoFrUBqTPGn/ubUyN/ANWwiJX2uqUlk4pU6Ijqer66EadMBrP6SKMOft5
	EwYaAkbtBcpjHQTE7hiD5Qx1sYQ==
X-Google-Smtp-Source: AGHT+IFLbRdcK50b32H+0EevYHhTFLdC4eKjsez3lYSIcEs4Sn6AmtjYSRVxhWJ+sOP5xI2Ue4MToQ==
X-Received: by 2002:a05:6512:1112:b0:553:2f4a:7479 with SMTP id 2adb3069b0e04-5532f4a7696mr1156331e87.9.1748455096802;
        Wed, 28 May 2025 10:58:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:58:02 +0000
Subject: [PATCH 7/9] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM
 logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-7-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
X-Mailer: b4 0.14.2

Instead of listing the IOCTLs that do not need to turn on the camera,
list the IOCTLs that need to turn it on. This makes the code more
maintainable.

This patch is designed to be a NOP. Non relevant IOCTLs will be removed
in future patches.

Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 117 +++++++++++++++++++++++++++++++--------
 1 file changed, 93 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 2c6f3cf6bcc3f116bbdb3383d9af7d5be9832537..e7373a2ae3c37ca02f9076773154901a603820ac 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1264,42 +1264,111 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 }
 #endif
 
-static long uvc_v4l2_unlocked_ioctl(struct file *file,
-				    unsigned int cmd, unsigned long arg)
+static long uvc_v4l2_pm_ioctl(struct file *file,
+			      unsigned int cmd, unsigned long arg)
 {
 	struct uvc_fh *handle = file->private_data;
 	int ret;
 
-	/* The following IOCTLs do not need to turn on the camera. */
-	switch (cmd) {
-	case VIDIOC_CREATE_BUFS:
-	case VIDIOC_DQBUF:
-	case VIDIOC_ENUM_FMT:
-	case VIDIOC_ENUM_FRAMEINTERVALS:
-	case VIDIOC_ENUM_FRAMESIZES:
-	case VIDIOC_ENUMINPUT:
-	case VIDIOC_EXPBUF:
-	case VIDIOC_G_FMT:
-	case VIDIOC_G_PARM:
-	case VIDIOC_G_SELECTION:
-	case VIDIOC_QBUF:
-	case VIDIOC_QUERYCAP:
-	case VIDIOC_REQBUFS:
-	case VIDIOC_SUBSCRIBE_EVENT:
-	case VIDIOC_UNSUBSCRIBE_EVENT:
-		return video_ioctl2(file, cmd, arg);
-	}
-
 	ret = uvc_pm_get(handle->stream->dev);
 	if (ret)
 		return ret;
-
 	ret = video_ioctl2(file, cmd, arg);
-
 	uvc_pm_put(handle->stream->dev);
+
 	return ret;
 }
 
+static long uvc_v4l2_unlocked_ioctl(struct file *file,
+				    unsigned int cmd, unsigned long arg)
+{
+	/*
+	 * For now, we do not support granular power saving for compat
+	 * syscalls.
+	 */
+	if (in_compat_syscall())
+		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+
+	/* The following IOCTLs do need to turn on the camera. */
+	switch (cmd) {
+	case UVCIOC_CTRL_MAP:
+	case UVCIOC_CTRL_QUERY:
+	case VIDIOC_CROPCAP:
+	case VIDIOC_DBG_G_CHIP_INFO:
+	case VIDIOC_DBG_G_REGISTER:
+	case VIDIOC_DBG_S_REGISTER:
+	case VIDIOC_DECODER_CMD:
+	case VIDIOC_DQEVENT:
+	case VIDIOC_DV_TIMINGS_CAP:
+	case VIDIOC_ENCODER_CMD:
+	case VIDIOC_ENUMAUDIO:
+	case VIDIOC_ENUMAUDOUT:
+	case VIDIOC_ENUMOUTPUT:
+	case VIDIOC_ENUMSTD:
+	case VIDIOC_ENUM_DV_TIMINGS:
+	case VIDIOC_ENUM_FREQ_BANDS:
+	case VIDIOC_G_AUDIO:
+	case VIDIOC_G_AUDOUT:
+	case VIDIOC_G_CROP:
+	case VIDIOC_G_CTRL:
+	case VIDIOC_G_DV_TIMINGS:
+	case VIDIOC_G_EDID:
+	case VIDIOC_G_ENC_INDEX:
+	case VIDIOC_G_EXT_CTRLS:
+	case VIDIOC_G_FBUF:
+	case VIDIOC_G_FREQUENCY:
+	case VIDIOC_G_INPUT:
+	case VIDIOC_G_JPEGCOMP:
+	case VIDIOC_G_MODULATOR:
+	case VIDIOC_G_OUTPUT:
+	case VIDIOC_G_PRIORITY:
+	case VIDIOC_G_SLICED_VBI_CAP:
+	case VIDIOC_G_STD:
+	case VIDIOC_G_TUNER:
+	case VIDIOC_LOG_STATUS:
+	case VIDIOC_OVERLAY:
+	case VIDIOC_PREPARE_BUF:
+	case VIDIOC_QUERYBUF:
+	case VIDIOC_QUERYCAP:
+	case VIDIOC_QUERYCTRL:
+	case VIDIOC_QUERYMENU:
+	case VIDIOC_QUERYSTD:
+	case VIDIOC_QUERY_DV_TIMINGS:
+	case VIDIOC_QUERY_EXT_CTRL:
+	case VIDIOC_REMOVE_BUFS:
+	case VIDIOC_STREAMOFF:
+	case VIDIOC_STREAMON:
+	case VIDIOC_S_AUDIO:
+	case VIDIOC_S_AUDOUT:
+	case VIDIOC_S_CROP:
+	case VIDIOC_S_CTRL:
+	case VIDIOC_S_DV_TIMINGS:
+	case VIDIOC_S_EDID:
+	case VIDIOC_S_EXT_CTRLS:
+	case VIDIOC_S_FBUF:
+	case VIDIOC_S_FMT:
+	case VIDIOC_S_FREQUENCY:
+	case VIDIOC_S_HW_FREQ_SEEK:
+	case VIDIOC_S_INPUT:
+	case VIDIOC_S_JPEGCOMP:
+	case VIDIOC_S_MODULATOR:
+	case VIDIOC_S_OUTPUT:
+	case VIDIOC_S_PARM:
+	case VIDIOC_S_PRIORITY:
+	case VIDIOC_S_SELECTION:
+	case VIDIOC_S_STD:
+	case VIDIOC_S_TUNER:
+	case VIDIOC_TRY_DECODER_CMD:
+	case VIDIOC_TRY_ENCODER_CMD:
+	case VIDIOC_TRY_EXT_CTRLS:
+	case VIDIOC_TRY_FMT:
+		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+	}
+
+	/* The other IOCTLs can run with the camera off. */
+	return video_ioctl2(file, cmd, arg);
+}
+
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
 	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,

-- 
2.49.0.1266.g31b7d2e469-goog

