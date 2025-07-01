Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CB719F130
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352328; cv=none; b=HckcD153+RI+6muxirOhIZ7Vt0QC3q49fm5zWtIxSX+lar05QtlL1+uWQozRTgDzmzdsDqKLOoZqpbamRwQRaa8htITdDNAfuoaiDE9fyHjS2ryts+3jchAd0Y/Fp2oaPAa5JBzyAnZrybx9Ph8+OZZnzHm01SaQY7GvoEkPJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352328; c=relaxed/simple;
	bh=yqUXUVprqc4Kpn+kWKnhx6hx/ZsxT0W1igC+YxtmoeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBRZBbbl4g43D7s2eONQx1bxzPr+jgusw1dSaRJtTM7lsEpan0+sNeHkLoVK+oGZIntXWMAsDZS0ZalWsHZxRnndSejG4WoiuALxCMBFRNFrGGrP0Bs1zQZMeMpPWfLsgnTwQiN7I0LT9VORDxORqDSJazx7JIiXucM934ouTIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SQ4I4m+6; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SQ4I4m+6"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-555024588b1so3348444e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352325; x=1751957125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrE6GNKbVHGpnk0TTosO+XCb4jgeJmiva3zLbz/vTGo=;
        b=SQ4I4m+62UjAXXXbkoJ0BDJxo4teoFxgg2PHJ0GiP+3Y5TFdFKqwGnaaX7r7zs+ZI0
         WoWo/1FEUI4n1qjIIK4/q4XSXkxqHzlyhpFPVZQx2JsGQmFKAPKd8CEkiGFbY3a0ICsK
         +i2aKOtX5vJUOhwKb0ag0iYZXNUYkQl6KC/ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352325; x=1751957125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrE6GNKbVHGpnk0TTosO+XCb4jgeJmiva3zLbz/vTGo=;
        b=cDkFND/J5b7jiGvfwhZyssa/1EGc0/a5CdGRT2JL+4O867pCuLcMjOcREICZWhM0Pu
         WH0+fsiA5HG7lfO8DNa6Xwnx1T71V3KJ9L8TOzE1pZCrJg/lILjvGjIHG3q/QKIC9tsX
         2QH+WYj2Me2kR9jsns5isbx7PenrQ5kAQk81yVW3M61qQa4GR4kDZbJxGlrGvCDmue+P
         HCnD8J/5+mIU8G1BWilNd/gi630uWoWeV1FqpKkYfnwxw3ubyLySVdCuDpBTBG3dMOaF
         /Yw2YJWBhUhIrGQpETVL6bWFpQmkibJxRzpWPQ403cQSE8aISKAmr4I/E7YO0BEm48D0
         jZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVRXACo56vg0w3QZrSWGXWssRrGuqUbmBN02gXurSp1EvxcMrSRnjMZwOZzdM+IR7M6aMqOvwvCdyTGBDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhitiJcDV2FPxLW8chzEtRpHYLmA/wqiCfVuXGHZ9CywTAEv6d
	a75i1FYx9jNGQK49ISW+snQlobhSMG2I9euHT0TbpbrTnObjLDkfCZjlP3iicK2evA==
X-Gm-Gg: ASbGncu8jJfaVdomIkHXOvlgZDo2gZxWcxVovsVAV6cPc/Rm/gLAhYWASrW2K/MDGPH
	rzfXa3o8n2kOkgMtnvQSSzowueqQ1wDx5jxP8hLwTzNMFPkiREkIbfqkjBZg6S+33HdhWHlG1Ov
	Ai/yci8gwSRdFWqnVNGVEDkIYNWlIZH9SCFSjaDpURqhiB4jOwp/LFM8xr1//G96wFrBrPVEoP3
	AkRVEgPuAjNUudLh91GRk/moLUeb7AhA7ddIa2U1BqJd8LPFNwxZi/USPRX/akKG8+ul7Kp/wa+
	tZSBkFB1R2TRequaYDRJCF443wPeHQe4BpaBCJcNzaHEmpHax7uYdPtj56b3YN1j+idYWr3BTXi
	MU46z7pCcTOqGv6SDjjnMmAQdVKeRkKOgRxdSgxTdSnDhMQE9k71g
X-Google-Smtp-Source: AGHT+IHY76y/ZDISkpxUl6amnEu/t94jj6fApWTdAJWcSYw0wJUfwh4U1PILUm61fBldVaiwf60NWw==
X-Received: by 2002:a05:6512:3d22:b0:553:2e59:a104 with SMTP id 2adb3069b0e04-5550b8cfec0mr5233484e87.37.1751352324890;
        Mon, 30 Jun 2025 23:45:24 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:14 +0000
Subject: [PATCH v4 2/7] media: uvcvideo: Handle locks in
 uvc_queue_return_buffers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-2-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Most of the calls to uvc_queue_return_buffers() wrap the call with
spin_lock_irq()/spin_unlock_irq().

Rename uvc_queue_return_buffers to __uvc_queue_return_buffers to
indicate that this is the version that does not handle locks and create
a new version of the function that handles the lock.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250616-uvc-fop-v4-2-250286570ee7@chromium.org
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans de Goede <hansg@kernel.org>
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
2.50.0.727.gbf7dc18ff4-goog

