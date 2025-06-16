Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BFA21B9E1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087495; cv=none; b=IzCX25+S41n4tVngPvBYRf+sBRdgyc3aixMpVVrVTzYkUDzgPyhjd/cXYXqrJSEFxoecjMcq8EFz0pvigWHZG6+0zAoC2UPS9724aTRtYSDaR2RJ8fej7h6h94Jjys0F1S+6pEyLLORdR5gf3CcxnSUxwRD8QhVjyb3QobaYD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087495; c=relaxed/simple;
	bh=VGZlRj6/JcwGJbMiaypib+l9NN/rmQAaBEPvRRaTVBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4hdORb+blcqJ6v+v9OIbwXHKEt24GP8wgVlLfGtueB1Ak0oxmfSI0FJqJodqB0Y3BuEeZG75CZjalYQOV1nhySWbR4fnIBwN4+0iZ1pcv19l031yScKbOejugv4ZgQrCjBDJCFRWDdhp0D0aj/S/qTo/bkaCILsrt5tv22Yfgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RhPPWsqH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RhPPWsqH"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5856193e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087490; x=1750692290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFtgHVBVDAiEdle9lZJFG2R1x3eYipPxmgDmF+7JNFQ=;
        b=RhPPWsqHxtq4+OqHpsdDShBiAe/MEic2koNEHS6RVs70VkrOdN56IHyH2sMtEvA1kS
         MTqs3uRNncTkTaKUpyBWP0e5UJ8kSia8cjqbM2pC3j/cDMODQ2pHCl/XcBVVoWgNZPlG
         IAySsrf5eAhA/Tm3fKqRRlDxGvhmAi4OY6dkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087490; x=1750692290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFtgHVBVDAiEdle9lZJFG2R1x3eYipPxmgDmF+7JNFQ=;
        b=OUGDbd5P9vrJtRAv4M4DJKMEp4zB0rZ7mMS6/ElNghd4ucrCbvoOokWB/ScI5k1iwc
         hX6/CUl43Z8JhyjO1LOdn4DsQowR+USiY2tXIfVK/nxNnW6Y57z9LvjRSbR5/Uh9rsIc
         /ONq7O3781whZHVZ9Mvnyzdus9CQ33+R9hD4ywOp7dtXcIYPNzkMUHPTevEuIzHdoT9R
         122kOAGcC9OGZUf+u/EctO1ZnPjucTgiw+Yf8kPJMROiL9sce5nZKkI/cQdj0Wa8B9FV
         tgFOKzuqN0AD6IebAqquuTGRholSRa7yh4UrJoWqQR9mB1jK3wAQC6tTO9LKgIBm9tkE
         Ygsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCqwg6N1FhwZkyU0jOpi5v7hRaNMiRGA5mwUJuhMGSm4mTLUp3zMwGOYM4YzJ2QLJy12J31xwx77bhzRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrPzWFbxv/uXwGZR1Xb8Dqh3k/h8ig5w+kNxSKCdcTQU3G+9J
	wtA2qUi7+GALixj9bg0EfS5dN1qTIvvkM3O0PfQUp8zG6hUXA1IKFTYk58hcIkbTEg==
X-Gm-Gg: ASbGnctODgs5lvWIfuIODHJ9gOVPlgaqBO5t2h3q+i0bU9xdqIn62EmhG5jQJ4XxBIf
	vbRNB5QEtVg1w7nJR0D8ujCrxBMMTP7+CXpE68rMj62PmfEC9ESqvoWtsGtENpuS6kO+MtHuJzk
	ysC8txkdwhWYKMWdAP1Y1ZVSzd2C/9Gl+EeB9Cc9p6rdwcfJ6jEYH2EOafZrMvzNZrN9kBSOYup
	RAsRmj6fgdR7qcIAAWqdLcnMsWSR3fIdmozBaB4JAZq3l/yVtaV0b6gxBKJPAg4hmVtAFOdu+pM
	VvfGv1LUyD577OSkI4X9U4auBemWJTL525zszKitAb6qfZ9a7NOMyHMjGx9uDyYF1g2rHi1R15l
	fNt+ydFxn2xHs/tIyCIHpmB0TAo24ixQUA95Euag0QA==
X-Google-Smtp-Source: AGHT+IE/FVVFHkk8r0qUiuV09HgPvz9c2KwY2zvYctVzIMzTqcOZ9wglaIh2OnOY2oJ7FgI4vkXuLg==
X-Received: by 2002:a05:6512:3090:b0:553:a4a8:b860 with SMTP id 2adb3069b0e04-553b6da30fdmr2585034e87.0.1750087490428;
        Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbcf5sm1564271e87.190.2025.06.16.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:24:39 +0000
Subject: [PATCH v4 2/5] media: uvcvideo: Handle locks in
 uvc_queue_return_buffers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-uvc-fop-v4-2-250286570ee7@chromium.org>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
In-Reply-To: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

Most of the calls to uvc_queue_return_buffers() wrap the call with
spin_lock_irq()/spin_unlock_irq().

Rename uvc_queue_return_buffers to __uvc_queue_return_buffers to
indicate that this is the version that does not handle locks and create
a new version of the function that handles the lock.

Reviewed-by: Hans de Goede <hansg@kernel.org>
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
2.50.0.rc1.591.g9c95f17f64-goog

