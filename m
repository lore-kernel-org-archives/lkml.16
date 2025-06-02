Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721A314901B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871217; cv=none; b=GiMpc7tLRnzM2LDz4wcVrerRJquNfeVCjkSNiE43QhPFp4SSiLBi8GRmMSQZmL1CByvw4IP5UwRWYGydJxhiQAgbdrgiDKcKd04F6VXXRw2LcKGADZuH3PyYZGbfAoeY6qaPyS3M9D49aZosFEIRnXty4T6w8q6dsAAikPgipHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871217; c=relaxed/simple;
	bh=KYCRxiQL70L4+2PWY0E6du2ZC74eLxX3dPGCO9GJb/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3YdLvcsQT7xEJ9edCfDnriarzrHsXxGLYZaOibavmha4EPUfJEvABclB3N77AK0zFfHkmhTXUO5RowLxaP2d/yRTwhm/rakJQOQ1nhCS22b/fhB9uGfXn5mBxWIhWuWtOBFSp5A16GBixkmUqWt3WVa9FT4dcaaZb84HttcowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dwuCmyDz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dwuCmyDz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551fe46934eso5078500e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748871213; x=1749476013; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LKecjCGbso1LbBogQRI837OEfYyXk7pBW0fhUFW97Z0=;
        b=dwuCmyDzuY3wczeEpiOcqfMPKb86UpFHV1TU5bKB65w+89+uwjuj39+cd85/kxRg6g
         P4VyDm+78FqzaMwY+DR85yvwFRwgHtstiQpbGcLA/Kyqm5GeWrzmAmi2M+yVYm7GB4/5
         hBM6lC03ASmy7ViGqO7FfvEC90sx1cYnYFZPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871213; x=1749476013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKecjCGbso1LbBogQRI837OEfYyXk7pBW0fhUFW97Z0=;
        b=mf4yUN8qZT+OqzZwj3G2eKF2XLsOGsuhpqvtGUgJhQYdC0VkdmE3q/2z73YcFnbi0e
         wqK0x6Xl06UQQELqgWJ/HSzmoKHz4FNA2tef5IqRXE67nVPlmPkhUpmjdv2IYx3vTd3t
         X136X3XH06rVrHOSUVhpCUn9TMmFwnQXhS/w8Ft2xZELYG2cWsyJxFCKEARQyNnMEiQZ
         2Wr3tPA7TkEpB/ldFS2RjmfBzq3cbR456JbBTJKElfjqxTpabb3T0tqlq2fP0mYOx4GD
         YVQ0M0Y5a1wERaMlCR9NJh4LB1u4p88EtbWqb3RyHUxN8d17VFG3zlGru7rVKuXbaglm
         A5Ow==
X-Forwarded-Encrypted: i=1; AJvYcCW04lTnyVOLxr+E0+z3z40eOh6/0llfyv0vZV94bhFL+9FYfoEivmBkmIG0+P0ztFdabKL/38Tlqs9c88A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW8K99E2fD5p1a7vojnB+wTJMwK/LjORzQPlUi4w/K36s/Oziu
	xqsnbklL93+UjDcToqOCfBRKkbMP1BRACnN2NDihQzQSn535mc6w6d3LJdQcsuLAbh8e5JTGhId
	kr94=
X-Gm-Gg: ASbGnctbW34tWKboInMvXRdrG41Hm3HQB71NonybTRx6ZSB3bLk0e+OyzJ0KpDy8aNI
	vbmA1AcUO99WojExfit7KPQzroHxAH6GDwk56xwS54DCtc4PO/gssW/akX/j3h+u7ICuwzVlH0B
	T5HxUdxzcjGMIBtdX/64+xUl5rDprr7qt1vOs6c6Wt0Ytuu++kiGntG6p8uAoZAo10XCPMRjbAC
	VX/GYhytw9mdvUy+X5pfg68WQb4otg3whs7I005bVO5ipJjqP/2C872FNKfUjxqQYWZEHOTZbwm
	sZbihYMQiDFQ5cukFQMxxyer9aF967Qx3MSoFYhDcWDNWOcwjXAwm4Yryi+YsZ1WW6hjehB4RI9
	QWkyVVvkpomtNqZS7szL1zW8k
X-Google-Smtp-Source: AGHT+IFbyhWmcg5VloW+sBq3jmuduKhi1yABU8gXWMH87l57dZjYGn0JswEU/vwTS1WgscbYOd+fDA==
X-Received: by 2002:a05:6512:1048:b0:553:2411:b4fc with SMTP id 2adb3069b0e04-5533ba478f5mr3988792e87.10.1748871213161;
        Mon, 02 Jun 2025 06:33:33 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553402b5d44sm980922e87.144.2025.06.02.06.33.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 06:33:32 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55324587a53so6150095e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:33:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYBOBdDSATY9F/n+6NNlUj7MroneQVp9cwbFUgLapAyMee2UAqPDaqp5IBb811ppLTPcOGZtJFgvRo4eE=@vger.kernel.org
X-Received: by 2002:a05:6512:31d4:b0:551:ecf4:2cd8 with SMTP id
 2adb3069b0e04-55335b4524dmr5202823e87.23.1748871211916; Mon, 02 Jun 2025
 06:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
 <20250602-uvc-fop-v2-3-508a293eae81@chromium.org> <dba66347-7b6c-49b5-8d31-166845efd1a0@jjverkuil.nl>
In-Reply-To: <dba66347-7b6c-49b5-8d31-166845efd1a0@jjverkuil.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 15:33:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCttXAu0bJHG7L=Y4Y0LqfRQa=Y-wC8PKr1Pv7Hwpq6Txg@mail.gmail.com>
X-Gm-Features: AX0GCFugWcSvqTWPR3e5MqLoEg2ncrSKg_eltqcjsGw5OBv6lBxhcg923Rgn4hI
Message-ID: <CANiDSCttXAu0bJHG7L=Y4Y0LqfRQa=Y-wC8PKr1Pv7Hwpq6Txg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Remove stream->is_streaming field
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 2 Jun 2025 at 15:23, Hans Verkuil <hans@jjverkuil.nl> wrote:
>
> On 02/06/2025 14:59, Ricardo Ribalda wrote:
> > The is_streaming field is used by modular PM to know if the device is
> > currently streaming or not.
> >
> > With the transition to vb2 and fop helpers, we can use vb2 functions for
> > the same functionality. The great benefit is that vb2 already takes
> > track of the streaming state for us.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_queue.c | 11 ++++++++-
> >  drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
> >  drivers/media/usb/uvc/uvcvideo.h  |  1 -
> >  3 files changed, 12 insertions(+), 51 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > index 72c5494dee9f46ff61072e7d293bfaddda40e615..dff93bec204428b8aebc09332e0322fa68823fa4 100644
> > --- a/drivers/media/usb/uvc/uvc_queue.c
> > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > @@ -165,12 +165,18 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >
> >       lockdep_assert_irqs_enabled();
> >
> > +     ret = uvc_pm_get(stream->dev);
> > +     if (ret)
> > +             return ret;
> > +
> >       queue->buf_used = 0;
> >
> >       ret = uvc_video_start_streaming(stream);
>
> I'm not sure this is correct. See comments below.
>
> >       if (ret == 0)
> >               return 0;
> >
> > +     uvc_pm_put(stream->dev);
> > +
> >       spin_lock_irq(&queue->irqlock);
> >       uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
> >       spin_unlock_irq(&queue->irqlock);
> > @@ -181,11 +187,14 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >  static void uvc_stop_streaming(struct vb2_queue *vq)
> >  {
> >       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > +     struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> >
> >       lockdep_assert_irqs_enabled();
> >
> > -     if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
> > +     if (vq->type != V4L2_BUF_TYPE_META_CAPTURE) {
> > +             uvc_pm_put(stream->dev);
>
> This doesn't look right, for both video and metadata uvc_pm_get is called,
> but only for video is put called.

Please take a look at
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_queue.c#n195

start_streaming is not called for metadata nodes, only for video nodes.



>
> >               uvc_video_stop_streaming(uvc_queue_to_stream(queue));
>
> And this is odd too.
>
> > +     }
>
> My assumption is that uvc_video_start_streaming and uvc_video_stop_streaming
> are valid for both video and meta: i.e. the first time you start streaming
> (either video or meta) you call uvc_video_start_streaming. If you were already
> streaming for e.g. video, then start streaming metadata (or vice versa), then
> you don't need to do anything in start_streaming.
>
> Same for stop_streaming: only if both video and metadata stopped streaming
> is uvc_video_stop_streaming called.
>
> Please correct me if I am wrong.
>
> In any case, if I am right, then you have to rework this code accordingly.
>
> Regardless, you need to test various sequences of streaming video and metadata
> in different orders and make sure this is handled correctly.

I have tried streaming and getting frames. After some seconds the
device turns off as expected.

>
> Regards,
>
>         Hans
>
> >
> >       spin_lock_irq(&queue->irqlock);
> >       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..d4bee0d4334b764c0cf02363b573b55fb44eb228 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
> >
> >       uvc_ctrl_cleanup_fh(handle);
> >
> > -     if (handle->is_streaming)
> > -             uvc_pm_put(stream->dev);
> > -
> >       /* Release the file handle. */
> >       vb2_fop_release(file);
> >       file->private_data = NULL;
> > @@ -677,50 +674,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
> >       return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> >  }
> >
> > -static int uvc_ioctl_streamon(struct file *file, void *fh,
> > -                           enum v4l2_buf_type type)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -     int ret;
> > -
> > -     if (handle->is_streaming)
> > -             return 0;
> > -
> > -     ret = uvc_pm_get(stream->dev);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret = vb2_ioctl_streamon(file, fh, type);
> > -     if (ret) {
> > -             uvc_pm_put(stream->dev);
> > -             return ret;
> > -     }
> > -
> > -     handle->is_streaming = true;
> > -
> > -     return 0;
> > -}
> > -
> > -static int uvc_ioctl_streamoff(struct file *file, void *fh,
> > -                            enum v4l2_buf_type type)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -     int ret;
> > -
> > -     ret = vb2_ioctl_streamoff(file, fh, type);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (handle->is_streaming) {
> > -             handle->is_streaming = false;
> > -             uvc_pm_put(stream->dev);
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> >  static int uvc_ioctl_enum_input(struct file *file, void *fh,
> >                               struct v4l2_input *input)
> >  {
> > @@ -1323,8 +1276,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> >       .vidioc_expbuf = vb2_ioctl_expbuf,
> >       .vidioc_dqbuf = vb2_ioctl_dqbuf,
> >       .vidioc_create_bufs = vb2_ioctl_create_bufs,
> > -     .vidioc_streamon = uvc_ioctl_streamon,
> > -     .vidioc_streamoff = uvc_ioctl_streamoff,
> > +     .vidioc_streamon = vb2_ioctl_streamon,
> > +     .vidioc_streamoff = vb2_ioctl_streamoff,
> >       .vidioc_enum_input = uvc_ioctl_enum_input,
> >       .vidioc_g_input = uvc_ioctl_g_input,
> >       .vidioc_s_input = uvc_ioctl_s_input,
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -626,7 +626,6 @@ struct uvc_fh {
> >       struct uvc_video_chain *chain;
> >       struct uvc_streaming *stream;
> >       unsigned int pending_async_ctrls;
> > -     bool is_streaming;
> >  };
> >
> >  /* ------------------------------------------------------------------------
> >
>


-- 
Ricardo Ribalda
