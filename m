Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A546222576
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875124; cv=none; b=So4IA0OZlhtnSuatk8yOiAyVUe+AiabK484bRq5SGLgK30dKZqY14Y4cljOCvDkYlRNK8QOztdbqlwfZTj38q7f4+1fGisnFsNbOuWCUnchVcAZ604DWuq3/8sTBr7Wv9UhVBnu9vDOEy+JpYkrM1kwSbNmBGvc5jeY8pFrccDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875124; c=relaxed/simple;
	bh=poPgeSp9ZmGZQ6GeaEB5A104ggQ242XLyEILS9Dvwck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSSscAuwfMxkI8mJwgqvVgMZWjXwu8iAIglZjirNHz/K01EGDjTdpz1OcT1QQ4V7qMdC/h2ISAifg9B38LmRSqtZAQrHcWl/ZvyYzxz87zO6oeQ6EF/SoIgTRjzgIMg1bxrpzazx4EC4X8CJ4jmk/ndt8jqCltw00cmRUSYr1LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nhdhOzKC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nhdhOzKC"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55324062ea8so5900839e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748875120; x=1749479920; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DM2pVl85i85Pi3qXUGu2fRylJB2o+wDvgXnwohKyoNM=;
        b=nhdhOzKCqajqPMTxk37VOuY/ZA3MRGn0+AIYXzpPoDjlDDQDCJIZui3s6IcZwwQmL7
         viLHuyKxOWDs8U8thu/yalswzhTak9HzlvFrlIp2KgOZ2f4rGOTUzMWz5bfpISP44cUv
         0xoFxwdkbEzqRCnbfD46+9B1DiE9Q0IOwubbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875120; x=1749479920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DM2pVl85i85Pi3qXUGu2fRylJB2o+wDvgXnwohKyoNM=;
        b=MTTRY5EZ5vcCQc6/1ZMpFr1V2iz0zFS7oRluxwDNzwavPHQBGisxR+n7xpdlHcx8BL
         h6x8P2gSXt0S79hAces8MgH6Y1OhdSGlm5YFIa99DUOqYlxanHXaPC3p8qtbmZbafiM0
         dFQjhX2/nQwE/nE0MPkoLaadvPSE3zM12woIUrgdfcVuk/RAfGOnNyC+3maj06utmQKT
         fpjDWlFQP+8nnOMT2FivujwZ1A4xnTC4DWiYp09wxILIFXBgUbX1BzFoVUb9gxLl6KsR
         hIOjkybWYUEXPo+9Pm+qW7lw1ae3W+AM48sT1nnDoZfwQSi3STPpoxmVJ+HjXFO++hAE
         qrIA==
X-Forwarded-Encrypted: i=1; AJvYcCUXkqiMWo1h96A9dSyk+11u7QYPxxdc9j9qpFaN9d0Wf5MmsTaen0JkGpaAqZA2xRhqaPn9JTr4VOjJxCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PDkMPUf46aKKWnfxo8v8THIBEUnJmcN86llTx6jFkM33SNSp
	Uklu1t7gvtIY2zIUZA6xGe2bCHY0htdhlIAuwt2oy0PDqaZUkZ99h6Lso/iKbRK0Qbb+9Sp7Un9
	RAyw=
X-Gm-Gg: ASbGncvegoaUZfORjDw+CIW2CSkmCVba+XR6zDKUZ3RRzKDtaTrnnUEWxmzQRrC5u55
	R7/+QeKotylyhTlQjW3PJWahio1AVcCcqQoy9QmZhWcZLqvZ1Gyxq7lDs+O8j8Gie/lnif+7Zo3
	T69HDoq7MZvCj23HBJ73EjcSkWmQD35JzMGXKpCchtgCI38ScEedgysxhYJcLp3Nd5aj7bk5n8x
	czqiFWeMcfQBXQjwtc7YRks0EU/fnxeO0aOMxk+zKp+VYB2VbOiUYBOEuWsQ7f+1QxJNI5VzdAe
	BTn18nxuuMUvxHAqDVIdyZThJaOeS5uxw2ibg2hA2xZgQOkuUnq8uF4vEf6hhKv4ClCg60Wt7MW
	4DZG6jwewfA/u/A==
X-Google-Smtp-Source: AGHT+IFcazKSxwmXXCINJg2qaKLJpkiXRvOJQl3v35WL1FyI/cvUei8uqykJQiB7397YqGv6r57dVQ==
X-Received: by 2002:a05:6512:132a:b0:553:2ce7:a201 with SMTP id 2adb3069b0e04-55342f5d0cfmr1914136e87.19.1748875119975;
        Mon, 02 Jun 2025 07:38:39 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791ce93sm1639959e87.175.2025.06.02.07.38.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:38:38 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55324062ea8so5900786e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:38:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmokf4en6tpOWFPgIU169HbboNID27+vDYEIBdeuKsFWJf37xVvOQzCXwJuv12hntaWVclitpx5I4T304=@vger.kernel.org
X-Received: by 2002:a05:6512:6d2:b0:553:2f40:3704 with SMTP id
 2adb3069b0e04-55342f5be5dmr2332489e87.13.1748875117227; Mon, 02 Jun 2025
 07:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
 <20250602-uvc-fop-v2-3-508a293eae81@chromium.org> <dba66347-7b6c-49b5-8d31-166845efd1a0@jjverkuil.nl>
 <CANiDSCttXAu0bJHG7L=Y4Y0LqfRQa=Y-wC8PKr1Pv7Hwpq6Txg@mail.gmail.com>
 <663123d4-9ac4-4c8d-bc88-d4e197786199@jjverkuil.nl> <20250602140235.GE23515@pendragon.ideasonboard.com>
In-Reply-To: <20250602140235.GE23515@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 16:38:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCtyyJ9fHko5r2eFK06V7Mhrti1zTBfQ2h_GmNF5EDcU+w@mail.gmail.com>
X-Gm-Features: AX0GCFu2aSQuRkg0kAhurtLY6wLhvHv6d-nNMYEXGrKxT0LacwjkIkLOKyQOL4E
Message-ID: <CANiDSCtyyJ9fHko5r2eFK06V7Mhrti1zTBfQ2h_GmNF5EDcU+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Remove stream->is_streaming field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent, Hi Hans
> > If this isn't fixed, then at least add a comment explaining why you test for
> > != V4L2_BUF_TYPE_META_CAPTURE before calling uvc_pm_put. It's not obvious.
>
> Agreed.

Maybe this is better than a comment?

diff --git a/drivers/media/usb/uvc/uvc_queue.c
b/drivers/media/usb/uvc/uvc_queue.c
index 72c5494dee9f..7f9d731df32c 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -39,8 +39,6 @@ static inline struct uvc_buffer
*uvc_vbuf_to_buffer(struct vb2_v4l2_buffer *buf)

 /*
  * Return all queued buffers to videobuf2 in the requested state.
- *
- * This function must be called with the queue spinlock held.
  */
 static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
                               enum uvc_buffer_state state)
@@ -49,6 +47,8 @@ static void uvc_queue_return_buffers(struct
uvc_video_queue *queue,
                                        ? VB2_BUF_STATE_ERROR
                                        : VB2_BUF_STATE_QUEUED;

+       spin_lock_irq(&queue->irqlock);
+
        while (!list_empty(&queue->irqqueue)) {
                struct uvc_buffer *buf = list_first_entry(&queue->irqqueue,
                                                          struct uvc_buffer,
@@ -57,6 +57,8 @@ static void uvc_queue_return_buffers(struct
uvc_video_queue *queue,
                buf->state = state;
                vb2_buffer_done(&buf->buf.vb2_buf, vb2_state);
        }
+
+       spin_unlock_irq(&queue->irqlock);
 }

 /* -----------------------------------------------------------------------------
@@ -157,7 +159,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
                uvc_video_clock_update(stream, vbuf, buf);
 }

-static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
+static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 {
        struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
        struct uvc_streaming *stream = uvc_queue_to_stream(queue);
@@ -171,25 +173,29 @@ static int uvc_start_streaming(struct vb2_queue
*vq, unsigned int count)
        if (ret == 0)
                return 0;

-       spin_lock_irq(&queue->irqlock);
        uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
-       spin_unlock_irq(&queue->irqlock);

        return ret;
 }

-static void uvc_stop_streaming(struct vb2_queue *vq)
+static void uvc_stop_streaming_meta(struct vb2_queue *vq)
 {
        struct uvc_video_queue *queue = vb2_get_drv_priv(vq);

        lockdep_assert_irqs_enabled();

-       if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
-               uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+}
+
+static void uvc_stop_streaming_video(struct vb2_queue *vq)
+{
+       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+
+       lockdep_assert_irqs_enabled();
+
+       uvc_video_stop_streaming(uvc_queue_to_stream(queue));

-       spin_lock_irq(&queue->irqlock);
        uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
-       spin_unlock_irq(&queue->irqlock);
 }

 static const struct vb2_ops uvc_queue_qops = {
@@ -197,15 +203,15 @@ static const struct vb2_ops uvc_queue_qops = {
        .buf_prepare = uvc_buffer_prepare,
        .buf_queue = uvc_buffer_queue,
        .buf_finish = uvc_buffer_finish,
-       .start_streaming = uvc_start_streaming,
-       .stop_streaming = uvc_stop_streaming,
+       .start_streaming = uvc_start_streaming_video,
+       .stop_streaming = uvc_stop_streaming_video,
 };

 static const struct vb2_ops uvc_meta_queue_qops = {
        .queue_setup = uvc_queue_setup,
        .buf_prepare = uvc_buffer_prepare,
        .buf_queue = uvc_buffer_queue,
-       .stop_streaming = uvc_stop_streaming,
+       .stop_streaming = uvc_stop_streaming_meta,
 };

 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)



-- 
Ricardo Ribalda
