Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A743421D3F6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087494; cv=none; b=Zymt62mRj3d4KrabQ/K9/jC1beJMIbJCECk4C0kzMVMkTFpXCNFeGk5OR1zWoK02YNXVfUsWXk8l47+3b1JcHWoyI1cJ0VUeD/bzEZjVLsUDHTgln90aw59BawMbCCxZUGRLxpVHFUQarvHmmPX8CMVNIHITXdS4M/iMTk4IFXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087494; c=relaxed/simple;
	bh=YNM6SC/3f9qdtfvtAokd8Rbd2G9MsDu7yOrOJtV0lds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHY68Nih1TFqxT5H3ZKtV7B3T475zMAVMovXnLNhjgUEZzC032HQ1KVX1STLjY/9nYBnP8zjzwoqaNLsDjAi27zgNmrk5V0r4viPKBN8WbP3ar3Q8HrbXObNBQWovsV+w6jGCEr5arZpSHHUtOtwBb50kh82U8SNce+GcKEsRmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jPioZOL3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jPioZOL3"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b82f3767so2222149e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087491; x=1750692291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bL7hot4FBJzREHKHrPXsR0LSAke8lGbxnqSPSSYelSM=;
        b=jPioZOL3/4aerhtPkjPJ09sDd3p2JSMo//8h/dE8kFcqhhaouDMww6vXDKOYyG0gAW
         5we7x+Q3wRZRKjGvsA7RPJpEnHWZYQ/zyV1/CbRkzEJwU42G6SfgYrH4GA0tBxZYWkPJ
         vlInU90VZImQEEmsWvEtMhq2ylqd01UtzToZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087491; x=1750692291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bL7hot4FBJzREHKHrPXsR0LSAke8lGbxnqSPSSYelSM=;
        b=wx5cpzIjQ/8Cna9lLqJjZsq9zaoj3lUG9lKNVNl7y+AHFDQRuDmFIyqCfv5sMfgw3b
         LNORodr0VW+Km55AJRvNNhbHkbZGfhMfCycvkOTuG1SOMb1at1HYIbGgHChuQ2+u9qE9
         DNUCfaQNOGfqQ8unVlU2ruf57CUYNgxyJhx3hwLHD80t/TkeMD5uBD56wcozTzHSCUkQ
         ZRA3JlGwVoi7GeiPsn9Z3wnxnYgEpMdj0tcxarUDoPy+Eh0NUpALb8T8ucIby4zJSdZF
         hglZDBHIZlY0BatyJ6QEDnTVJvAgRIiM9/O9cv9QAxGLkMNUJ4Y0yxchDWWnJgMWDBI1
         y44Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQCAydLO73ZZHycMs0sBE8Vcn5K5sQYc0ax8bbtgqZIfb9N6LcG1n5M8xH3ZfyIP+mAerKbiR9z6gRGcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTAa+7joPGKjMDp1UTcCOHEVo0iZDqsGNg3LU2WU8c5I9goV6
	Nn9bQJTjvksQ5/s6v5Hv9SUuyz1SeLDbmJI0PbGltW58jeVKEdDafzHktZox0zLWYg==
X-Gm-Gg: ASbGncssblXuEb3r0KcoRTwVo64GSUBo/VZdBavGva8KNdKiWLI1neN2FCKpP/GbhDe
	hHq42l2Gnxraa1x9YF8xIFS3XbQRQW00e49DJrzY+XATuzdS5DrgmGQQ0/v4iAOplmoQw3reLns
	DMSPgefVX6U0wpLO2kRsLhsubOgNoNgraByayQdF4zoJk5uA4G+M19LaIEy0Y+ZQ4kJ4J+DjSwu
	13tmSmy5I3Y+7JL6pJnvH01Vx66C5d5PaCjALOv5JB1xp66bRVtQADfRv/dZWrZkdB11Iv/Gwzf
	TW7Q6Cx4N53sH+4znX2FmaB6wI0e/s0etuBUGYrG4R52h4h4/IHselXKeX+bnOYnRnL/1UWwady
	nVgP27RNVBshmVeyZzdNnwp3f88fKZUC/gUxPInURGA==
X-Google-Smtp-Source: AGHT+IH+Gmpu945v+B4LkNCzmEN/GTk4iTMc0teczqPmw14ut29lEvpIT8mqXZPgypA7dvrm2NRPNw==
X-Received: by 2002:a05:6512:3b11:b0:553:25f4:695a with SMTP id 2adb3069b0e04-553b6e8af12mr2442376e87.22.1750087490794;
        Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbcf5sm1564271e87.190.2025.06.16.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:24:40 +0000
Subject: [PATCH v4 3/5] media: uvcvideo: Split uvc_stop_streaming()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-uvc-fop-v4-3-250286570ee7@chromium.org>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
In-Reply-To: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

uvc_stop_streaming() is used for meta and video nodes. Split the function
in two to avoid confusion.

Use this opportunity to rename uvc_start_streaming() to
uvc_start_streaming_video(), as it is only called by the video nodes.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
 		uvc_video_clock_update(stream, vbuf, buf);
 }
 
-static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
+static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
 	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
@@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return ret;
 }
 
-static void uvc_stop_streaming(struct vb2_queue *vq)
+static void uvc_stop_streaming_video(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
 
 	lockdep_assert_irqs_enabled();
 
-	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
-		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+
+	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+}
+
+static void uvc_stop_streaming_meta(struct vb2_queue *vq)
+{
+	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+
+	lockdep_assert_irqs_enabled();
 
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
@@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
 	.buf_prepare = uvc_buffer_prepare,
 	.buf_queue = uvc_buffer_queue,
 	.buf_finish = uvc_buffer_finish,
-	.start_streaming = uvc_start_streaming,
-	.stop_streaming = uvc_stop_streaming,
+	.start_streaming = uvc_start_streaming_video,
+	.stop_streaming = uvc_stop_streaming_video,
 };
 
 static const struct vb2_ops uvc_meta_queue_qops = {
 	.queue_setup = uvc_queue_setup,
 	.buf_prepare = uvc_buffer_prepare,
 	.buf_queue = uvc_buffer_queue,
-	.stop_streaming = uvc_stop_streaming,
+	.stop_streaming = uvc_stop_streaming_meta,
 };
 
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)

-- 
2.50.0.rc1.591.g9c95f17f64-goog

