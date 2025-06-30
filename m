Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4217628C037
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293233; cv=none; b=sd0IZxOQz/TLUb/IV8AsGfrO0ucrw6tLfaNEWvTBTLhWvIp1FWMi6HJEBgl9sMW6kk0SrqAtAMUE0PuS1Q7EbIo8t324MmuKdAOalqtyIBpO8N+j472w+fIB7ZdRr6OZqo9lVNooCyqO+q60jKZIqvnQWZC5PQBwMsrwYm8fIYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293233; c=relaxed/simple;
	bh=jhmtrOZynF97yPTl8KLNDy4e5vqCIcVcQhtc4QKka7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtfOWKq/mdiNkToQZP8fnwiRtRoDDsxQDR9Gc6VEZ9uD1QUPeAFG4sWLFZK1yDZ1+vGEM+oPkwRwbuzqpUdeenjKs1znCFhtcTxYWr3z/GhhQlwp3k4QfrPoxzMdzTWyfdCVIPQV8y70JqtyCu3hIhPHrZOJMWljNA3ZTYZRXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jtE9OauB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jtE9OauB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b16a0e38so4892791e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293229; x=1751898029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sXxnutuQNshAuN25MG1B9YNe5116VtrTWttVb+J9U0=;
        b=jtE9OauB0MsEkovMpZdAzt/njk0VSQjSeIPPTh30gkuTnExrcG+5QgXT0lGX7u8TjB
         49EBlpSI5p3QvLZAf2tSrYDLUoqz4mAeAQ4dRh/xstnlVxmJS4d9nIGhZ7k8Q7vh+Bq4
         AfO2DaJVIBdEz39Sv9Y2AgiZy3ngh+m9KZW48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293229; x=1751898029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sXxnutuQNshAuN25MG1B9YNe5116VtrTWttVb+J9U0=;
        b=CLHCh+xn+8jHoYiyoNyucfxLXjd+U6wHzgwEwMs0ijM+1w9YAhBIERVmOmrXvpBHpR
         VK9RBvaM1U8ryT4OYtJyWR03AWPGCfAmg8F5DM/rvIT25Ns1skHw5pboBU2yJVrri15+
         jAGaxJkteiXKAEKgfIeY0Hxp9vMN1qzpSJgbN/ZUMYvTuxjJ2q4cn82FZgZvubIkADpG
         kTLWI+5yS6r13lZmW4lMc8c2jcLKprGOuWmbcNQVttASIRtwhGfidRcvT9g7po03wr7P
         ObipSvoyJQhX/mnXUfWYxaoR6LkaYBMEYtT6PMAiUxqlyNu1l2qF7OtnFRDkUUNhAHvG
         bCIw==
X-Forwarded-Encrypted: i=1; AJvYcCVErzEVb4n8/DaYhprSm0BYll1qtyu93l48C9+Rsz2LUHiNaKpggxNdR9SlySReMQBGe8n6Hnz91iaqjmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylyLdhL/jevz+aoER4bsgPzgSCuyUNj/EAZZMVjdEUcnRDyhjN
	irUuAVq4+QtNFa10GAxuzYP8m0SPmEZ3cTPfcqZfSY7q+uOPO2ff6bihcnCHb1fcO6+9HkU+wv7
	jsyADjw==
X-Gm-Gg: ASbGncvEeaRLNQt17uiZqaMVSrs1agG2e7PNPhYNXKsUHKsaunFCnY7VPmaVEG2bxbY
	G08egxMR3+wEqOpjbmoqfAPuky+/OoBj6noBmhrRccYTTshsCqsNsOEhGa4myIgwOf8vh/YC7+k
	Nf0bDtFC75/6f0uUxnuOiyEwqSooV5xdmAUFWe/vCpElPd0OuweKPbuRuidH/zpsDpG728olG9g
	Elu4pwqRm7RsrcOlOaqWFIkFltKCm3l6jQeG1qx/Vl7GMA9O7H4Ga3L/Eqj8QtWhmK5+LqlQQYC
	1gG5jzIjGUFdvOXLjYZMifSOW0eOuSSjRDuPWd6sRRoxEqRZWmKNQPVvsuxSw2lWegzWHjkWkuY
	e0fMhgkiVOWWOLKr386onVtHVYOWY/wke9iUO58XeLA==
X-Google-Smtp-Source: AGHT+IHbcAPXvePe30HSj85z7toWQIzqZIuNPLHXcAnug7hR/AjGTbBMUa+1SidzHEMD1ZaaRXRakA==
X-Received: by 2002:ac2:4c55:0:b0:553:2cfe:9f1f with SMTP id 2adb3069b0e04-5550b7e9dcbmr5357754e87.6.1751293229195;
        Mon, 30 Jun 2025 07:20:29 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:28 +0000
Subject: [PATCH v3 3/8] media: uvcvideo: Split uvc_stop_streaming()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-3-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

uvc_stop_streaming() is used for meta and video nodes. Split the function
in two to avoid confusion.

Use this opportunity to rename uvc_start_streaming() to
uvc_start_streaming_video(), as it is only called by the video nodes.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250616-uvc-fop-v4-3-250286570ee7@chromium.org
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 8f9737ac729546683ca48f5e71ce3dfacbae2926..b11f56d62ec0495a8610580367486dfaa31c450d 100644
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
@@ -203,15 +211,20 @@ static const struct vb2_ops uvc_queue_qops = {
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
+	/*
+	 * .start_streaming is not provided here. Metadata relies on video
+	 * streaming being active. If video isn't streaming, then no metadata
+	 * will arrive either.
+	 */
+	.stop_streaming = uvc_stop_streaming_meta,
 };
 
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)

-- 
2.50.0.727.gbf7dc18ff4-goog

