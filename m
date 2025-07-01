Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCE24337B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352331; cv=none; b=DSysZ6JesliNH0Hns1GVKMwKVA+LV7Pp6W4yXiRHBQN6u8/MhSGfFBWXFQRt4lHAh6ZzDckXC/Xm7xv1SNfcraFV3xQ9yXwnABRVucCa/w4zD0W+rQK7thz1x29ivFMxNBTU88Q/HrCrmNq+GViYuFBKreKvKJ066HlwPVURbCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352331; c=relaxed/simple;
	bh=hUSTM0cz4lDmfgU98My5Gb8Nx4v9DP1TnSn7IZqRpUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLuS61j6Q/az+EKoCdfwFBNiGxMZfAfyVUUhdq2Ri6rbpFU9x5QZOb4NIvlBqzm7+L7d2YhK5pFjA3Bs1jhLkriomG65cnCpKHUTNapxbE8BIPH0aGc3YtVqgUwOd1xqiwwb8bLHIsTP1IWbYMkB7N5MeLbxD1Iyz3/LNtYoPsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a3Et2EUP; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a3Et2EUP"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-555024588b1so3348462e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352326; x=1751957126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnt386dfMPODMMm6G8wrSthRtbiPhPkQSBX13EJa6EE=;
        b=a3Et2EUP5QXTMZZnaOz3ydsC/HEf7oGUzD/O15CmPBqjPixL+S5K54zH1+NLAcLPW/
         kpEuGMSNhg4CnAsbU/MbGvP4TblksbgtqP8T9RQMxyVR1cqaiGqmT3PHiG1yezUTCIIa
         nHsttCAHFS+LA1qYM0/AoKcITlsZtOoV0XOnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352326; x=1751957126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnt386dfMPODMMm6G8wrSthRtbiPhPkQSBX13EJa6EE=;
        b=XIsq21O4ms1WXybOPZeGENthXvblDyMRpdL8VH/uKCtl9g+c/d2Cd8HN8ADn7jWHPZ
         zoc8cckbuy5YIPZjTy2ApWTjg18p6MWpwyhzLrB7mhSd+07zes8TRMluyA1iCxH4kmgc
         fMCqrzBkNkEp2c6s9pRS6C9Cuy8J1vdisE+BDozYsFlmFqDlwX8FJlbS3kNXis00GFrR
         afsylBcAnN/Er66skEGHQrH+wxFFisXfydEPaxI7EOTI8kKua7QNFdzG3RvwzHjqd9SA
         7fNDR+GNbxzP9RQp2ZgqP/GhnCDOWugo/lELoY1rxdZ7pdIEFkdqorknzSyYtg3810xl
         lW2g==
X-Forwarded-Encrypted: i=1; AJvYcCWLv7k1OI8EY8fB/LO6FM7NDms2ZyYYhYZ2xNEckZaqPNORpKBgWwoXw0Yf41xJtfRbR2Tlf+Lq4WAbJoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvdy8utuf0bEFdsToUCje+xkol6/n+LmUEY45DEBI7pbZBw3TL
	pmpE3qhA0xzICpqL2Kpgwmz7vR0owOrUVmLAMYyl+Z0EKOCztrJaGP5tlC7Md692kuqyxdpcvla
	mHjoG3Q==
X-Gm-Gg: ASbGnctjVPUTo8L2+XfXydlNVrh5bxMUE36TkV2xDcqR6+cWmrj4LP2opPbxO6dljzF
	L8V/fMTlQT/aOc3PAlgLh6fWDS8tOuaUPtiXxWsfPlgVkadWKThTtG7iZKLO6VrOWqcihnBlfs3
	qdO+HWD+lnU/1Ow75QqQJ0oZtzF2JqjiStBqPVC8T9tidui9sINY02ja8yaOAcx8jX8pDfx6VZm
	To0Br29njszlG2my3u4byt0M8svuSvlbXJ33lmkXqjsvt7QZ1CmsomF+6LQM3SJU59VP2N9m8np
	Nw9m0m3pplNHO/SSgdOL1lBQDJvZXxww2GUQkkjX597drauEihnfPiZK4u87tRpVnXl4Vjved+k
	mXphtWNGtWz13b5MP1tLh7ji8/lOkQ6YFXIefWYQGHg==
X-Google-Smtp-Source: AGHT+IH4VAWYadnkTABTwlDViNU8+AGBugAzVXxKx8UY3xTvmveCwSD8omN9bv03frtrJgumJ0kdLA==
X-Received: by 2002:a05:6512:104f:b0:553:2450:5895 with SMTP id 2adb3069b0e04-5550b81161amr6427078e87.4.1751352325958;
        Mon, 30 Jun 2025 23:45:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:16 +0000
Subject: [PATCH v4 4/7] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-4-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality. The great benefit is that vb2 already tracks the
streaming state for us.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250616-uvc-fop-v4-4-250286570ee7@chromium.org
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_queue.c |  9 +++++++
 drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
 drivers/media/usb/uvc/uvcvideo.h  |  1 -
 3 files changed, 11 insertions(+), 50 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index b11f56d62ec0495a8610580367486dfaa31c450d..790184c9843d211d34fa7d66801631d5a07450bd 100644
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
2.50.0.727.gbf7dc18ff4-goog

