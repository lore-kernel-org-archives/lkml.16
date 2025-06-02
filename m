Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF0222155D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869590; cv=none; b=IxWu+BW2bDlUkJMgfu5rkHgLUlhYP5ZorpJabJDS81q1c18hosJZf7ALW454aYSkCpWtk0XoTZ06GnOFU/8zoafvXmQbJBH30Xn4UDyIOwfdM0Y5RpcUpu33hFis5ixGQjtpusP03fZkrDoK12tG6zzG6+RgAR6ru+9fywLjbu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869590; c=relaxed/simple;
	bh=WyZB+LaC6SBQm0YqnCnNUB4EQV0vgX/c2EeK3V1jKcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvHXVrJCLRiMvD5dYcL9MMAEcS6ETJ+IIRczEO+fVMrz554xzFuvYpumVGrHCEWqYuI9xP3OGsyMQZ4xWbgjPBHoawnPPWn+vt9vLniXd5z0ck88r1Awdj/x2YqJpDW/lk6ciXMXmbP7Z4SBM3oIeyneMgqReTq6kWVO6F/OaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mYYbbbNj; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mYYbbbNj"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551efd86048so5169478e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869587; x=1749474387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY8e7u8bpTQHL+5kLl+cCW4+6IGB1TDp/jXS+nQKriw=;
        b=mYYbbbNjnKh9iczJ5A4kGABVF1t7ayghYNIp6HRLl/rmVSeLnIBCwlkgk1HBo7cMCh
         5jyAxC1wS2D/X5GSFBOJzkHJMsEBr5gxkppIuCKkn/tkQgjk+kRtboMrn24C0BfBv3Gy
         OD5v6OJmiE3hFZAfR9/ShVL0rOkH+alk0F1yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869587; x=1749474387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SY8e7u8bpTQHL+5kLl+cCW4+6IGB1TDp/jXS+nQKriw=;
        b=E8ukqlCYaNUbup+3kazT04sdyOQ7u7KA1OPeABXE/y4H/T+itaBurEYLSvknZDCJ6x
         4IM1ZloFgnxzfvFLXM9OGEqfiAMki6ORFkydgp1oiBnSWcbHTneniC/a4TNSgU4KyUtY
         fUEuJEpQDoJV60xSwpdDVlTdUVC2BKxcJY81pgxJ8RZhpc+8zfFW1JnZXFtx1HP3lVhp
         nAAEfZVgSuQl+TU3aI8jbY2Gs6tZhq14ttPzmz3rHN1tEWlX93xY0CdHz0NuFCM+5GhN
         2KVSaYJ4hYKNrh4U5VLgH96s3WQcvOaXK8KI7ckQTJ1f2xgVzmoqIKWVcD7qPKlpuH6+
         KjfA==
X-Forwarded-Encrypted: i=1; AJvYcCX1tWqDIFpL/ikjeByqlvH4+tfl0IDKJmoFQ2e/DvANOV5DhevTJNhM2VjIZ95qCdEaX4Eh3UgQsNHGOZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/ltadCGDgGSxQkRoKGRsjsWcEmELPgdd916EonxkyQLfX0ec
	z6a4EmJ+33qYbEF3cOe/uPopU8pegMZ4MdEvEC9Pdl8pXYefE3RnWxWpMG9HoExKQg==
X-Gm-Gg: ASbGncv+/1Xdem6mQ1HBXaMdacyjCbChTITidvBkp0xpdYnz37bZOAWEq+/0VV+Dhup
	+H8QZJzJLo92Q7fhH+5+Vc7XqPjfs9QOcpyvRwRUmnwszGvLG5WAGl0vNy8SybCaPLpVURgVJ85
	O177/YmJzbCp8zqF1Ke9g+D9f+W+8CSo+WeBK9dQk8uitYbq6P3E+5oI2JeB09ot7JCwEOE98yq
	wap24DfNK/mLwnZaBP/ErgIGovXhV1yVChz9tOo9BS0MlV8Q4T9o0XpZj5rlQwf8Esfgg7eDglE
	rWBaqZEWdzGngzm6sOkCdm18vBjVDD/t8cm0gqeWFeuQDCRvB6Et4xwyxecSC2d9hBaY5uw0kXH
	OZmZPG602nFtM96qrBzG0bRBjmsFuYfPy2/E8
X-Google-Smtp-Source: AGHT+IETrZAakF9qfxZnmj0tcsM8DSjhCMOB3EfS1qAjcEZh33ISM8jTG+USPdJ6WLT1BS+E/CAXBw==
X-Received: by 2002:a05:6512:3d25:b0:553:3945:82a7 with SMTP id 2adb3069b0e04-5533d160fe8mr3856420e87.12.1748869586379;
        Mon, 02 Jun 2025 06:06:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:16 +0000
Subject: [PATCH v2 4/9] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-4-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality. The great benefit is that vb2 already takes
track of the streaming state for us.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 11 ++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
 drivers/media/usb/uvc/uvcvideo.h  |  1 -
 3 files changed, 12 insertions(+), 51 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 72c5494dee9f46ff61072e7d293bfaddda40e615..dff93bec204428b8aebc09332e0322fa68823fa4 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -165,12 +165,18 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	lockdep_assert_irqs_enabled();
 
+	ret = uvc_pm_get(stream->dev);
+	if (ret)
+		return ret;
+
 	queue->buf_used = 0;
 
 	ret = uvc_video_start_streaming(stream);
 	if (ret == 0)
 		return 0;
 
+	uvc_pm_put(stream->dev);
+
 	spin_lock_irq(&queue->irqlock);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
 	spin_unlock_irq(&queue->irqlock);
@@ -181,11 +187,14 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void uvc_stop_streaming(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
 
 	lockdep_assert_irqs_enabled();
 
-	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
+	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE) {
+		uvc_pm_put(stream->dev);
 		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+	}
 
 	spin_lock_irq(&queue->irqlock);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 49cc64dd7e2e737f431b9df9df68921d9c543751..100cff47ecc5ffd9941e22fec24756abda1f015e 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	if (handle->is_streaming)
-		uvc_pm_put(stream->dev);
-
 	/* Release the file handle. */
 	vb2_fop_release(file);
 	file->private_data = NULL;
@@ -677,50 +674,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
 }
 
-static int uvc_ioctl_streamon(struct file *file, void *fh,
-			      enum v4l2_buf_type type)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	if (handle->is_streaming)
-		return 0;
-
-	ret = uvc_pm_get(stream->dev);
-	if (ret)
-		return ret;
-
-	ret = vb2_ioctl_streamon(file, fh, type);
-	if (ret) {
-		uvc_pm_put(stream->dev);
-		return ret;
-	}
-
-	handle->is_streaming = true;
-
-	return 0;
-}
-
-static int uvc_ioctl_streamoff(struct file *file, void *fh,
-			       enum v4l2_buf_type type)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = vb2_ioctl_streamoff(file, fh, type);
-	if (ret)
-		return ret;
-
-	if (handle->is_streaming) {
-		handle->is_streaming = false;
-		uvc_pm_put(stream->dev);
-	}
-
-	return 0;
-}
-
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
 				struct v4l2_input *input)
 {
@@ -1321,8 +1274,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_dqbuf = vb2_ioctl_dqbuf,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
-	.vidioc_streamon = uvc_ioctl_streamon,
-	.vidioc_streamoff = uvc_ioctl_streamoff,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_enum_input = uvc_ioctl_enum_input,
 	.vidioc_g_input = uvc_ioctl_g_input,
 	.vidioc_s_input = uvc_ioctl_s_input,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -626,7 +626,6 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	unsigned int pending_async_ctrls;
-	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.49.0.1266.g31b7d2e469-goog

