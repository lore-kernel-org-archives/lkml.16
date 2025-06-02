Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B72253FB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880417; cv=none; b=p52FFLU3Px40qpbTJ+Ek6uGCoXJ/Agep963FYDddkvrhSHsZkgM6sgzjIcMbDHGCjw4e4Gqy6bbPyvz5XDvTNDw0R2xc46Hjla+QSQs6WsgPXdMqsTN6mq514NaKN/BVpAhPe2bSzrvU+8FsYX/5n4CEBpKgtaEz5cgiQdiXbc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880417; c=relaxed/simple;
	bh=bpEYln/8wFdT/ptVY7qi+97NkzepeIhBhRswFy5rIAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GBu1mSQjVOdmEFz8LHMppjHzivI74Ora4ecqOy13G2Gs0Zu1zhFqv9FVS+v+fKvRjcku9oA9norlQAFG9S6/FtJsEAG7XSk/ezWHvqicLiL6+2vdBHRazJnBGpgFb6l88mcl7wvE1JpxzwcmP9Csn9hvYeJh/fSc7Od8YkeIlkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JETXxFjx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JETXxFjx"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55351af2fc6so280650e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748880414; x=1749485214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efP3IxJ2OLjk9HTtbcsKFWKXCw7ZfZSVYKNc3/G7w2U=;
        b=JETXxFjxs3sP+TPlEuvAek/mrZ94FLvSvHUjAHjMrbmQNEajIMT9jvwxWmCG2TGx2g
         NVEBcRmoWmA6kv7eRvZM5FFF0PRIi0GWh5FAW7GdmpAdmfcP4y0DHIhZO2IcADTdnZjE
         eC/wYQQ/d1bcdG54PWSdumJxYJjt6QGYPcImg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880414; x=1749485214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efP3IxJ2OLjk9HTtbcsKFWKXCw7ZfZSVYKNc3/G7w2U=;
        b=iOJkqcht9WSVHmz7AkEqjTXPUD5oGPlYGOPTqVuASy0ipB1vOh2srqMbdiOO60Db3G
         xXZig4DjGP0O7U0LzdvMqTq5eCe3G22D09mDBMYbVkxsg5kMkoX6HH6Xa4kqrHEjjaZK
         FX2n+vnmE/bnn54NCodr6xpk0ngQQa+uO4nlaBoELTsxQIFuORe7ff4ZTr3MkfsqjzU3
         QpNnw5loPuHD7idNUatoqduq9l2p4yE48lGgxeu7Tpp1CPAq48sj+wNInK4AQz5HyTIv
         QIB3KKi9uu6b60U3XXgqG5UduZYGsUqK5tewjqNo4yd7W4rXMawE1J+Zy4A15AW3y4wA
         RgyA==
X-Forwarded-Encrypted: i=1; AJvYcCXTwLnWDA5n+q9vL+8k1jytW8qj7hsRV2LFPomR4GzOFzRfT5yhvkuKZpiX47keB7bvKhoRdRFC3LCqXEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBpsRTLAmR9NBKR7WssmOYjdqqTKxxM/ujgQb3vEPa5U7XDUlQ
	E1JKErm9OG8ZmpzQ8NQK6limZKJzrDC+IZcb4EyuxwgzEM3OOHLEowjdQ8FgbQe1IQ==
X-Gm-Gg: ASbGncsyN+pi634KOshsJU6UUsVkgIfEIybau7bKn99Z72dWvHcE3oBi4rZnUTQ8X2T
	Vs3jujc2OTdLA3NQc/zPYlqwqn4Qu55iYBSglnsheYAMWWay3CV5LwYY88ttenOq3OqwYmXhvxB
	W+ig26fhVILn1wivgrblqtoMbKNxvK796eT15f0DFrzKPbPQfeS7+ZSbSLVIVcvu28B4HDzDxWT
	RclwxydPZ/amC8tBaNVEkz2g2E6AcGXxPpBXgexUoIUWIspaYmu2tIIi5rZj/hGMNCsy6jx4kYF
	kvjkvNAF8C7BjskpnlC6QW0ts27wMCBjkp05Zwjn5uyEoYY75BFdB57Ls35mYmJNYdhGE1XqTxh
	/sak1IyDO9INsq/3sWWg6ew6bMA==
X-Google-Smtp-Source: AGHT+IFQDTvJfIrCftEwU9zeJo4OFOcaIU2aCEdgUR2dSt6cy7LF8kw8+QhTXCXa1wdxZHtucUBDhw==
X-Received: by 2002:a05:6512:e9f:b0:553:2e3a:bae with SMTP id 2adb3069b0e04-5533d1b80edmr3477475e87.39.1748880414102;
        Mon, 02 Jun 2025 09:06:54 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533789ff59sm1685113e87.70.2025.06.02.09.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:06:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 16:06:46 +0000
Subject: [PATCH v3 3/5] media: uvcvideo: Handle locks in
 uvc_queue_return_buffers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v3-3-a99e18f65640@chromium.org>
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
In-Reply-To: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Most of the calls to uvc_queue_return_buffers() wrap the call with
spin_lock_irq()/spin_unlock_irq().

Rename uvc_queue_return_buffers to __uvc_queue_return_buffers to
indicate that this is the version that does not handle locks and create
a new version of the function that handles the lock.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 72c5494dee9f46ff61072e7d293bfaddda40e615..8f9737ac729546683ca48f5e71ce3dfacbae2926 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -42,13 +42,15 @@ static inline struct uvc_buffer *uvc_vbuf_to_buffer(struct vb2_v4l2_buffer *buf)
  *
  * This function must be called with the queue spinlock held.
  */
-static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
-			       enum uvc_buffer_state state)
+static void __uvc_queue_return_buffers(struct uvc_video_queue *queue,
+				       enum uvc_buffer_state state)
 {
 	enum vb2_buffer_state vb2_state = state == UVC_BUF_STATE_ERROR
 					? VB2_BUF_STATE_ERROR
 					: VB2_BUF_STATE_QUEUED;
 
+	lockdep_assert_held(&queue->irqlock);
+
 	while (!list_empty(&queue->irqqueue)) {
 		struct uvc_buffer *buf = list_first_entry(&queue->irqqueue,
 							  struct uvc_buffer,
@@ -59,6 +61,14 @@ static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
 	}
 }
 
+static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
+				     enum uvc_buffer_state state)
+{
+	spin_lock_irq(&queue->irqlock);
+	__uvc_queue_return_buffers(queue, state);
+	spin_unlock_irq(&queue->irqlock);
+}
+
 /* -----------------------------------------------------------------------------
  * videobuf2 queue operations
  */
@@ -171,9 +181,7 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret == 0)
 		return 0;
 
-	spin_lock_irq(&queue->irqlock);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
-	spin_unlock_irq(&queue->irqlock);
 
 	return ret;
 }
@@ -187,9 +195,7 @@ static void uvc_stop_streaming(struct vb2_queue *vq)
 	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
 		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
 
-	spin_lock_irq(&queue->irqlock);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
-	spin_unlock_irq(&queue->irqlock);
 }
 
 static const struct vb2_ops uvc_queue_qops = {
@@ -263,7 +269,7 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 	unsigned long flags;
 
 	spin_lock_irqsave(&queue->irqlock, flags);
-	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+	__uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 	/*
 	 * This must be protected by the irqlock spinlock to avoid race
 	 * conditions between uvc_buffer_queue and the disconnection event that

-- 
2.49.0.1266.g31b7d2e469-goog

