Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE73221F03
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087495; cv=none; b=lRcQM2YrhTgJmg2oqo1Ajjsvax9FJVSBR7FRkbUtnxE0FMUjG3PKGk5HkLhWAa0UK0MTKh4PRrHdPG6nQOsJ4EL4ReEqXyieHds1qbF2+wm0IQlwCAJBoTe6v/qRdpcVLS1HJ42SSK3pfwvHYMXB4rgdGiZELs+j1Dfw7yU8WrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087495; c=relaxed/simple;
	bh=9kA30+57eWk0fVX8unbNgZkjlYMI/wsqPiSazmWfLtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iO0jEoOZgKuT+dFsP37w5AwBDCXKUB5NPd53Rtp7MMwsBuW+tEGaVWn5qce7SehCN2cyl7sfacC6e5bq0E7zJ0g+t5t4dX+/vNv1PR74epF/U5kBubOSNnA+Gca2Vem18t4VjKStNNvBtTtVeWenhCjG9aTE3/QQ2tAc8+lu1p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CAsTgGDk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CAsTgGDk"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e98f73850so4462201e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087491; x=1750692291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsPNlHsyKYu+Nk7YIKvEDwnjW+ZYrPSdNGA8EvMV2PM=;
        b=CAsTgGDkrg5zgIkRCLpa/kJpKeJbzKem9pvAx/E7JAM+K/h2Ac1S+8+Hou8r3h5ZdL
         td+RM2bR6UY5Dz/3SC/zijeHYipxmCxaOWxyELKnL3R0QWXresNFYZIXBQMWkaJXelRg
         FBX8zZ/2JMalFHVoOP0U5febEiahS6lTZ/rvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087491; x=1750692291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsPNlHsyKYu+Nk7YIKvEDwnjW+ZYrPSdNGA8EvMV2PM=;
        b=CImxNCZg0jlBknqHmrF6SJB4Dpvv7z1nLNF5TtUfKV1OvoDDZeuJVXxHgg981lzvD/
         vT4ohq7baNM69Nl+/Jj6vjYh8DVi1yPJtTjDZOcPOJozHcPmqqIq/a+sb4hLIe/luMlL
         uuVKIV3qQ5+RlVNWI6hwOtMT1aOodD4J4fOX6xLZ4h6DWTiHoow8bVv+dTqO2QMLMzCK
         qh7Jp3R2F6E3QBVE4uB9kEqmKw8te/L1pxld4aXJytoiCbFJ16FrryElGVQY6a3f9Y5v
         SvQ2JqM/j7TerTLF0PfdNVjhsnEn0C9pwcgiGmlfYdbrYw6J9Yo3yioWiMDZUavQq6Jr
         Q6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXuxBoxmeY+BZhaF3+PTMrou0XuGCjoGLDeJ1IUV8iE223Y2hxskkqm1qaTG4HFVWJNpSGIK3nOMnbgOw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMPRcovkczFx83L1Mu4eMYMMFM0mdbLd6FXRIQQW406FidojH
	PcgA8BbRY3cDb5etoHpPvTU/eYdqHW2Xlx1deap41RgpGLJYhNYPZUNRUmTLb3KnbA==
X-Gm-Gg: ASbGnct0mQ5JeJoYUCuDwREq9vXr5bqDSuVIsV7SrfhHE0eSWNGnsGa7ROC7kqu1QWm
	NryIiXhr5VdW/J4Z1FS9akAnnQGl7abnVMzcTtFnZUkYeFHIfftBWTFRInhE0oa3YuV7CrsqXT1
	UHkZxGIKdsGp9OxFxqKGf9CLcW6AELF1+KjpfVfUlg0ZkNqtl9nq4q2YL7+UV+F8TO27oGySX/b
	63eFCEnTKmrEfHbAdjHCFuGKNXCrfB4n2HATowTEvtc92ALErB6/HgICu4EfjNFjHiBQ+K4GzZU
	79MUdPmoUp2tGIxBPPh6QvzaUFXD9M/N+M8ZuPSf6oxgW278v/wKesEMkTY/T3f4pkY7HNDI0rg
	4CmSyYhCvpbTidV4XdQ20mnd/bHt8uWtgaYad+si2dA==
X-Google-Smtp-Source: AGHT+IF0Vzm6zGi8l3n7i0OflXc6dTdNk8cfglD8KGqDzscDTr0vc4XtOn3o3k7EBq/QfdcIE2AFfQ==
X-Received: by 2002:a05:6512:4026:b0:553:24b7:2f6f with SMTP id 2adb3069b0e04-553b6f45ccfmr2413522e87.51.1750087491329;
        Mon, 16 Jun 2025 08:24:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbcf5sm1564271e87.190.2025.06.16.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:24:41 +0000
Subject: [PATCH v4 4/5] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-uvc-fop-v4-4-250286570ee7@chromium.org>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
In-Reply-To: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality. The great benefit is that vb2 already tracks the
streaming state for us.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c |  9 +++++++
 drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
 drivers/media/usb/uvc/uvcvideo.h  |  1 -
 3 files changed, 11 insertions(+), 50 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3f357c2d48cfd258c26f0342007d1d12f1e01007..6e845705b3286348a60650eb262e620dc6039d60 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -175,12 +175,18 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 
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
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
 
 	return ret;
@@ -189,11 +195,14 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 static void uvc_stop_streaming_video(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
 
 	lockdep_assert_irqs_enabled();
 
 	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
 
+	uvc_pm_put(stream->dev);
+
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index d06ecf3418a988152c6c413568ce32e60040fd87..7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	if (handle->is_streaming)
-		uvc_pm_put(stream->dev);
-
 	/* Release the file handle. */
 	vb2_fop_release(file);
 
@@ -676,50 +673,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
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
@@ -1320,8 +1273,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
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
index b300487e6ec9163ac8236803b9e819814233f419..3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -629,7 +629,6 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	unsigned int pending_async_ctrls;
-	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.50.0.rc1.591.g9c95f17f64-goog

