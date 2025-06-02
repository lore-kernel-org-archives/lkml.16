Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6BC21FF22
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869156; cv=none; b=FeiAAqMGOXnZxQVONfXW3qUOzFCXulyUBPaK/7Xnq1HqTvV7qktZ3yqU1wbcrUr2HyMRZNzX9zN6X5hgMF63UOPEvDMfdBxu8Q+cXTjHA+yLThChFykLGKsfvR67U0OFBhvjbAaxjKbGP5DL7yJGXcOHaHdwBVTj+4LNi4NrCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869156; c=relaxed/simple;
	bh=FGQS/DPv/UfUtSlsCQ6Vvh4EyONjnUMmQIJCXsOyPcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfEmKQcHQ/kBTNjRhmRq1RLRbMHHHTM85ca8e3cC26OKF2n3TIbHnAD21sQMaC/Mfa/GLmkIIxELANz6vqWP9C3hPv30a7MrUGGAvtW/UuOMuKFi4rmGfCCpIKCbpp5EAbSNsWKzMFjq8VNvBAQb40FBMsACNTLooqAuc+1nJ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B3myRb9y; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B3myRb9y"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54acc0cd458so5398761e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869153; x=1749473953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToC+Tc0dmXcPfX/TTDxCxEcN/r59cEY9PxQCySvBfGI=;
        b=B3myRb9ybenA/oQbk7UzqtOVkZbBywmaWMxqBNc4aXFLXkob9QXrNlGcPUt9vmjdML
         I58F8eA7z/6SXPKurqtdSziOqbp56/bfBU1gVuPWAYV6jotVoRcfQk9l5Agbn2ClIN1D
         DXIuCFf/TYnRnKe8bo65C9BoLPV0zPK8ltf1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869153; x=1749473953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToC+Tc0dmXcPfX/TTDxCxEcN/r59cEY9PxQCySvBfGI=;
        b=eMGfdzldO6uGZ8DQA5yUdCcxl5N5fcjCoIhiLhzTRDyLIH2rwy786tGYQ7T/7HvBug
         LtrSRMxCN53LS6P6uVU1gYKCFNAWMbGsSyEwWNJl8g2buvPGqdqygcNnCPiiktZQbCF5
         s9rLT17TcpL+4Fr5y+h8MvDDjkPuEcPvpEpKhsu7VwUHxbX5p9YnUJY5skTW9pBCv741
         PvUlODBhNy/EiXZLUec3TYlqxmTFMvqgvHg26g0vOa5nktTd4K+2xggczvsSIe+CFBO0
         dSFdUjJ0G6i2oVdsiW8FKvPWkKmAxv/ba0xYh9AbX45yZhyt4WgoDQeNI7Ze3VzFC843
         KmZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhOSL4TGMjdTmUkGyKw7lof8P7BTgvBGd+JXRTLVKNsmyebvUZtLQqQXcHSowI4ynlBjIn+2cQX3h8KRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO1trTdTACEUV8Z8sUDfiOlYzzrZBjNGETRUwCH6rp8JishLbg
	a1OWNRgUzBnKpedbcxxa51NqF/iFVpk6c4oyOb9cQRWsFqItPtgZ/zfLunwALQTkrA==
X-Gm-Gg: ASbGncu4J9/ToyZNRxBWLIBhU9LM7918ElzEtCRk4D4MDdWvYLIh13tIhba0PfI7p6L
	2DKfIWzr1ujiAUjv5bAEdWga769kp6ztUX5gdbSN8bXTecWRZUH60JdeXbV2LKjliW6l4/1sekv
	wgqsXtsNa3PBbquFnsRDa45pJZ8bDfYQOBaaS12LhA3pM7Lk3vzAzQ9eviE3q7T3lK0hMvclxtr
	p0Ew599iy78FQNdUftwk1Usc00vs5nYIE36nVzCSEQmqCFmYnmNm7oB8V/SjHb/1GgmJ6dEMte0
	ZGNSborDLqX5m7wdNS+JzmEy/fWrUz3U9H0QSfnMtuWH6yX/2/UPNXhuhisqz8hkzuVix1G/4Yq
	r9FL7DZI7JYNnreY40YaYzIyoDg==
X-Google-Smtp-Source: AGHT+IFdCNN4YdbC1Vdbn+B7IdgBUiXxK5TObG5L1wn0bDYUQJ6e5TVqvDwWnb2mlTLtx31JnwUl8Q==
X-Received: by 2002:a05:6512:1318:b0:553:3332:b652 with SMTP id 2adb3069b0e04-5533b8fcdf3mr3719422e87.23.1748869152987;
        Mon, 02 Jun 2025 05:59:12 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379377a8sm1601140e87.239.2025.06.02.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:59:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 12:59:04 +0000
Subject: [PATCH v2 3/3] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v2-3-508a293eae81@chromium.org>
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
In-Reply-To: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
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
index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..d4bee0d4334b764c0cf02363b573b55fb44eb228 100644
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
@@ -1323,8 +1276,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
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

