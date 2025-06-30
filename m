Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35FE28C02D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293232; cv=none; b=l+jBx4qKhk6SX8Q1MfuNIL4mFOBhP/aETc2aj5DG5ApN6nQd8NSWxd+XiUaEa1fikc/8R5hKhwBehmNCjC0nBPNE//A31RVbYrbOtuEgpdu7YgD+odcs9xFwDlW5xde2FGagAYVTYPexG+1AV0ni5kbdD1+m1RA6sMzRS7zRk30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293232; c=relaxed/simple;
	bh=yqUXUVprqc4Kpn+kWKnhx6hx/ZsxT0W1igC+YxtmoeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGZreR0XaYYpUobCoEL7XHYIjrH2HKRCnVaak7HDNlDXOkCk0jQvosFKa+K4/mIEKVXy5MwLTTWcMF8mXuOJcRypBzLcis0Qeoxb8xIE08spJkqHRKAJqy4wtaGaLWxhWqa41Xvfe8CkxWrLNPDkaXcmqhX1tG4R3J9eIv2vXs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JDFYD35E; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JDFYD35E"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b6a349ccso2417620e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293229; x=1751898029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrE6GNKbVHGpnk0TTosO+XCb4jgeJmiva3zLbz/vTGo=;
        b=JDFYD35EU0sB6tAYVvw5+pubhRD3aQoWVVcapSQnqxwuDdThx+3RJBWSDrvhZjhFew
         fAZyQQuYAemqrb/GCp2hGuqe5EW1/DZM4uZOr6jcE4aWWDV4ODUVHqViTrBd0r/T+KwL
         E1oV7Lq/REP+GQo5V2pg2hjmDCk+UaE4N30mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293229; x=1751898029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrE6GNKbVHGpnk0TTosO+XCb4jgeJmiva3zLbz/vTGo=;
        b=BFRSqr5hcZ6MvUB6RnkI0IdIG61OcIK9ypvZXi2FXSYQtOVrlx/xQBhgQ1qIuhE7Dd
         vrJu9do0Mk9m/x9xIyHFfoks9ZMRgKCLByBQhw6ALGihC02LdMLq6MGHQeAmMs/mx/ug
         NdN9vhxkJrlJTanvLh600syuiZE/MEXMjYGzEl5Uc85ul2DSoIEIWsLWsN8M4SoSYuIA
         mhlmLMPMvs9/HsVpKBiPhUV0ac59WUtzczQTPU8M2epRti4G9bGD27u2h2t1PZZVZcTV
         QbMyzJH9ZrQkBe7ETJITqz/d+r01KF8gam9X3E3I6sMZoMuobUoqjfXfLXHxOe75Y3pP
         aRBg==
X-Forwarded-Encrypted: i=1; AJvYcCXLPIchCDeY0m/5se1jNBlxeuufEGBaY46tpTTlZWQvV7HFWH4JcxtnqhPG+PtlTiZED+w/p/naXPBdwu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynyYsc0bQivkX+2jI6QgVlW/0s4Xq1YwkgGkLooyhzYyUl6Q3B
	3FoBspZo/wcRwKT9MBUiXpf+GnLEFuDiI40tFQyXY9br8GjOe2aDG13Ctcj0cQvZbgHJT6t6AbF
	EuY5gVg==
X-Gm-Gg: ASbGncueWk9hYA+h3JCULKPd0IewckX3b5CtCD+fBHo3KPkyP5xVhQMTLsO/CSpsCp3
	4q6lyku7M4ltRUHqRlIEuPTyc2ecco31uZrINEEsS3r4+fAISQCgU7usjnAQg2/fp9sTE2sSoNO
	J4vL0Gv1/ewPT6wBQWlJAFRpVZWGDoCb2es6NCcdFiHyGuk0ha0qWdBil1vjGn9vaqHE8LLFBh1
	DoHvMOVr6Bsof+MuKUdCL9Rh12DITik90A1PGQNMyfvMPn5DdnU6cQIr8kOEOt/MoTod7ytAiLB
	wGKp2vMH24SZ3NCOtZLvvqF4wDXpTDJ38NRNxuwEzNQDKB/SnhxnNDg1NIJPjKUpeARt11y3UGj
	FJrrZ3JvEx10nDHbmc22afYPSRH9U4daW/Y0h1EGeMg==
X-Google-Smtp-Source: AGHT+IEYOZRia/C4/fIWKkA+Jh26ufRFDX2YpNeZrNnPKtM6B8Dh625OcdfNpk8ik/bJrSc3cPZY8Q==
X-Received: by 2002:a05:6512:3b96:b0:553:26f6:bbfd with SMTP id 2adb3069b0e04-5550b7e6e65mr4165857e87.8.1751293228668;
        Mon, 30 Jun 2025 07:20:28 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:27 +0000
Subject: [PATCH v3 2/8] media: uvcvideo: Handle locks in
 uvc_queue_return_buffers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-2-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
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

