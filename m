Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1031B3940
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871230; cv=none; b=LMGj7SO6xaARKLFe7sGC+ktbyxCOMw5xL091HWFmnqO6PymteKS/hFvOKPFBtYwAjKG6chohcghRLBcK1Z7itrciBvctN/ekXKj48wArFhutJ9lDTS0S+CccAZ8LvXfJwW/m3eOLOalASYQIPYoKX1WGfP9DTZGX5CkKEONSC2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871230; c=relaxed/simple;
	bh=aRKoQkZZYmYD1Sv+2br17G+hh/hc34lUfhzKeuyAwqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUsMcrD+8GzK4XgOUq963CUQnIBftDyRFWpp1p0OdtbvKryDFqHfmzPO0ydzpG9958JmvjiLV+NX0w3G6ZTMB+4xQNvLVcDzYMoJlXhLzdurujM+2xZYCm6oqQ2pmHoK/zszvfkxbzDkTG3YpieEsB9MzgEwczF9A7vfmUGwK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bPKdJySm; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bPKdJySm"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e436c59113so11811286d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871226; x=1739476026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLiRmOcwA1idWAVNELvJurrBOZqCiiYJCTe0RaR+hYk=;
        b=bPKdJySmjgLba6pi2Y44bjZRKMIA1IERZm6UZnGRuEuYChTaP1rUw6eZ4ywtXrnZE7
         cxuLetArkAnRgSHOD9EvC9WoNRbNQA35ESm5xTOKsb+CBlb7qk/ynzBI6kFcSTTljFZ6
         Jpti3UcdwnggiNiBn9TsTExtWJglEa+K/Y3+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871226; x=1739476026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLiRmOcwA1idWAVNELvJurrBOZqCiiYJCTe0RaR+hYk=;
        b=bQXE7xOXezjhXRpcXYQfPAyfUR1heV3kdoGTa4fP0e/Dx3y4/v/xJ3iUuLxOMLk7xo
         o1x9msr2ps3Um6UPBcBBYEjhKBugkX7GZx/gQxfQ4ILdGizGBzjHXsrao0Sc1NLnElYd
         Nk2BgIGMH8ZxyJ4ve20AU2v2KpTeTpcJELkdMPMsdOuo0iiBHIpGnB8VwjuF6caItk++
         aGOXqsscRg5LZKpsdYj8YtQKvx9QbYAfA1G5NRzXPL94QeId3/1Efe9Nmd2Jc48KpuGg
         9h3Txlmjv2Us34Awkc5uYkJXb3tR/laeKFPmXO7SES0Du14PIb9wIa1AaRqanvde5KdO
         TdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiumBoC+wpL4cK/qoUkuTFQ0LsG/wZgYWBoXmnDI2TPEVLZftIVcw/scfZJRu6pzU/IB7OS2FzfMwF63g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY4xmV/ZQatDimFWMSBQdFkBLt+Fr6imgVk2EeGgRm4e7Cli3f
	SAHz8TsWlOm89AR6Vf4uIAuncJj2DI2lgpRHFP8arvBqwV5pbhgblD3bvomVoA==
X-Gm-Gg: ASbGncs3TzCFzrsF2wa2xhzI+cvlKqoe0O3C+A4x0GrP8uD6o9WYbEyeTQ9OwEaKCzQ
	8MmefzOsP7TGPV0YDwS3exTQiScHMNFEGa8ZiOP7TlEBKaHlh3r+lFgqYYxa0QJpcb7P6ChaWjP
	BVYQSvo7TDS4h+ULlMfsSYJE5TlbKfCNErY0/XlvfGt/Vsl0bmBffvrnjo1VGzHz81YuhPdX6ZG
	8NeEvl2MVDB4kbExH45xmyihNf2p+GvgZPVS/ZURkm3sTCkqcRfNANbKUViUItCBPCnefxvSjOF
	Htsnk2yaSNuVtK1gOEDC1JhBsBKqvjNB8/kdwVnXf90EIZf6Qz+lrSziTE1hhQnf6Q==
X-Google-Smtp-Source: AGHT+IFFqKBkieX7B5cGuScAV3fcm2qgHZHWhFPwNknUK/MPH4E2HL2JpSlxFJSxjVNCFYakE6XUbA==
X-Received: by 2002:a05:6214:5016:b0:6e4:2963:1d8e with SMTP id 6a1803df08f44-6e445702cdfmr3077496d6.35.1738871225814;
        Thu, 06 Feb 2025 11:47:05 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:05 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:03 +0000
Subject: [PATCH v3 4/6] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-4-32d0d7b0c5d8@chromium.org>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
In-Reply-To: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now we call uvc_status_get/put from the device open/close. This low
level of granularity might leave the camera powered on in situations
where it is not needed.

Increase the granularity by increasing and decreasing the Power
Management counter per ioctl. There are two special cases where the
power management outlives the ioctl: async controls and streamon. Handle
those cases as well.

In a future patch, we will remove the uvc_status_get/put from open/close.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c | 26 +++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e58476d305e..97c1141a45b3 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
 
 		if (ctrl->handle) {
 			WARN_ON(!ctrl->handle->pending_async_ctrls);
-			if (ctrl->handle->pending_async_ctrls)
+			if (ctrl->handle->pending_async_ctrls) {
 				ctrl->handle->pending_async_ctrls--;
+				uvc_status_put(handle->chain->dev);
+			}
 		}
 
 		ctrl->handle = new_handle;
 		handle->pending_async_ctrls++;
+		uvc_status_get(handle->chain->dev);
 		return;
 	}
 
@@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
 	if (WARN_ON(!handle->pending_async_ctrls))
 		return;
 	handle->pending_async_ctrls--;
+	uvc_status_put(handle->chain->dev);
 }
 
 void uvc_ctrl_status_event(struct uvc_video_chain *chain,
@@ -2815,6 +2819,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 {
 	struct uvc_entity *entity;
+	int i;
 
 	guard(mutex)(&handle->chain->ctrl_mutex);
 
@@ -2829,7 +2834,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 		}
 	}
 
-	WARN_ON(handle->pending_async_ctrls);
+	if (!WARN_ON(handle->pending_async_ctrls))
+		return;
+
+	for (i = 0; i < handle->pending_async_ctrls; i++)
+		uvc_status_put(handle->stream->dev);
 }
 
 /*
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 5d4e967938af..63d1d06d3ff6 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -670,6 +670,9 @@ static int uvc_v4l2_release(struct file *file)
 	if (uvc_has_privileges(handle))
 		uvc_queue_release(&stream->queue);
 
+	if (handle->is_streaming)
+		uvc_status_put(stream->dev);
+
 	/* Release the file handle. */
 	uvc_dismiss_privileges(handle);
 	v4l2_fh_del(&handle->vfh);
@@ -832,8 +835,10 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 		return 0;
 
 	ret = uvc_queue_streamon(&stream->queue, type);
-	if (!ret)
+	if (!ret) {
 		handle->is_streaming = true;
+		uvc_status_get(stream->dev);
+	}
 
 	return ret;
 
@@ -851,7 +856,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	guard(mutex)(&stream->mutex);
 
 	uvc_queue_streamoff(&stream->queue, type);
-	handle->is_streaming = false;
+	if (handle->is_streaming) {
+		handle->is_streaming = false;
+		uvc_status_put(stream->dev);
+	}
 
 	return 0;
 }
@@ -1388,6 +1396,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
+	guard(uvc_status)(handle->stream->dev);
+
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1422,6 +1432,16 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 }
 #endif
 
+static long uvc_v4l2_video_ioctl2(struct file *file,
+				  unsigned int cmd, unsigned long arg)
+{
+	struct uvc_fh *handle = file->private_data;
+
+	guard(uvc_status)(handle->stream->dev);
+
+	return video_ioctl2(file, cmd, arg);
+}
+
 static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
 		    size_t count, loff_t *ppos)
 {
@@ -1507,7 +1527,7 @@ const struct v4l2_file_operations uvc_fops = {
 	.owner		= THIS_MODULE,
 	.open		= uvc_v4l2_open,
 	.release	= uvc_v4l2_release,
-	.unlocked_ioctl	= video_ioctl2,
+	.unlocked_ioctl	= uvc_v4l2_video_ioctl2,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
 #endif

-- 
2.48.1.502.g6dc24dfdaf-goog

