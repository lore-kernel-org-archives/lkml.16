Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308C8285411
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289998; cv=none; b=DmY/fcoMQWfPcu/s8CfvOR9O9kU1snToGmF5VsrBygrskUv+eSX27Wlb0vA3NTfGlD8QzH/z+zpkUPa4/kkZorzwfB2fMaDChmRZD6mx9/P6LIrlQnch+ew7H2VmZWH5OHBxBwI8iQKERRq6uMlaZ4I4fXQ1i/FlZnx1JX6G11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289998; c=relaxed/simple;
	bh=M1gIl4A5i8ayEO1pxADobOUImr5L3pLVRkhSls5BvUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDc2qNZG16mJ7Mz4yHrr/v5hRjbKYebGoLNRq7lG70GtibVtkQ0/xakUw+ArZeqNOk7E3UvRMJo3mSDE8gRYKPaPJZKGLbdsURu9POMGN+1hrGfLjvX8jDqWfv/l1rtSBpnp4M/86Lak26EQCSFxuwS24R48Kvu1Lk5Ao/ZRxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dThvMR7u; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dThvMR7u"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so2251834e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751289994; x=1751894794; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYKy3F2tRQ3p0Wg9vlb3oxo+88BM8VahKr4/uuCEpwI=;
        b=dThvMR7uX/bVR5DfZCnDEI4egKtp51q9GfTHWQyQzKf/p8eQoKN1CkgJV6cE0hCx0i
         tUGuoZepaFXq5Y0fK7w5VxME3Z1Cfvq/ZA5815SEwsfw4FuRjQ4cnbheXn6ASiAYZHMD
         +4fJUoPCombN9lVolBea9tVn9pOOp+u89/kyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289994; x=1751894794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYKy3F2tRQ3p0Wg9vlb3oxo+88BM8VahKr4/uuCEpwI=;
        b=EDBjZAkKVvAD5VMj7ZNGL8vq6TUXnZOhiTTbwYk2vgq2xzDAmNd7lZHAvTeMcAbLli
         cinmYW0phagmiH4TMxHnlNKRS9dR5Z+wpbw8kEtAske1AJ7CfCKwfQ2xwAXoTOi7bCbs
         E+ETV4Zrvx4wr4E0C46UxhTC47Dv4B2tq0vk22fzUEcAmISU2OR6pcZEWzkwyeA969GP
         pXYzvL0lS7dmQRgC0axpd1KuL594v6SF/tsBfFErguGpMCwFoihGYRqEn+EMB0p9WWPA
         kSvuF2Sbqy1zczUlpnoDAOCW6VNZjIAeHBGg8KQ0d1dQCqjNk+yRO3pO5Ya5OU1woOD/
         WJIw==
X-Forwarded-Encrypted: i=1; AJvYcCXAiw2QYFHqZXqp28k/NosrJPQLZIQAyQG2IMKKtC2QV0X73OKgmlRa1efkQK1+zVyUA24mD1vwPHxPebU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaO8Do3o6QeqrMbq5uAeDDG4O4VxS3PT2p34JbftjHBzWqPcbg
	+86B6yCAOXbctcxHiJJwidqIK9YxE8M7cYtoo2EGqO1Fct2Ms6pv8ivUPfX9QwevPNhvgpM6KjE
	Q3yxmzg==
X-Gm-Gg: ASbGncsSF1eHUbqmEJNQmg/N5B7qW0WcRfbmMNKTogCh8XGcW1HZ/uJBrQ741TOZlkV
	ZOBCL5p4RZQpLm4HHBJ1vKJPbu0JTzf/JSkmoeow+tK+XqglQK4oLr0t+1JEFCItTkSWU4VVzY+
	Ntd9zUFJtJDC1VvGaXNMXF+ZtPPQocsFbXRI/f14ApmH8v6U3p46gz9YjWYUlztd22THBhmiSSQ
	D49mybzAKsAKrSPZLBe4A7wKxdh+FIoppvj2580llZQ7uELxd0+jUkeUS/0+uEO96KOLcN5oS2V
	zNVqJjkw+bOM7lwd9IuLGoaq1fn/htdFZX3KaOKHWJj9Ryh7hr9LNrsSyp4pmGsOB4OH72twjrp
	gL47/lRs9vkmVP85piVD0jbvnPCFCI2/Q0wo=
X-Google-Smtp-Source: AGHT+IH/7fzzqQdGBYkjxSZDji63S4kqYqG87Zj4NB08FAlTJfWjS7MW6gww+QBPF4DmjN7dJN13dQ==
X-Received: by 2002:a05:6512:3b1f:b0:553:a5e0:719c with SMTP id 2adb3069b0e04-5550ba1bba9mr4622891e87.51.1751289994200;
        Mon, 30 Jun 2025 06:26:34 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2c4f3asm1433070e87.146.2025.06.30.06.26.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:26:33 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b60de463so2408205e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZXsFjDa8a0ht3Y4bfJGcNIrceze8b2tjeWeBSQE7rIim9NKaQ2lTZM3IQ/Gau5eYHdgGTB1F7S5YC0Sg=@vger.kernel.org
X-Received: by 2002:a05:6512:b1c:b0:553:ae51:1066 with SMTP id
 2adb3069b0e04-5550b82a987mr4432157e87.12.1751289993106; Mon, 30 Jun 2025
 06:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-3-250286570ee7@chromium.org> <04e10cfa-f1b1-4327-b0ca-c66f8450d42f@xs4all.nl>
 <c97af8e7-5c11-45f4-838c-d934b0a379c1@kernel.org> <20250630131004.GF20333@pendragon.ideasonboard.com>
 <d449ae59-11a2-436e-a51c-cf2fa3657ba2@kernel.org> <20250630132438.GC23516@pendragon.ideasonboard.com>
In-Reply-To: <20250630132438.GC23516@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 15:26:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCvAtKJdwLONx1crMOB5So8qgcSheEwYnxBggN3y11LkPw@mail.gmail.com>
X-Gm-Features: Ac12FXwvKUIA629DH0E0JvIObI7A8b82i8Me-5Azyiq6zhmwYQ-DqwoYZeZa2es
Message-ID: <CANiDSCvAtKJdwLONx1crMOB5So8qgcSheEwYnxBggN3y11LkPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] media: uvcvideo: Split uvc_stop_streaming()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 15:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 30, 2025 at 03:12:38PM +0200, Hans de Goede wrote:
> > On 30-Jun-25 3:10 PM, Laurent Pinchart wrote:
> > > On Mon, Jun 30, 2025 at 02:59:05PM +0200, Hans de Goede wrote:
> > >> On 17-Jun-25 11:27 AM, Hans Verkuil wrote:
> > >>> On 16/06/2025 17:24, Ricardo Ribalda wrote:
> > >>>> uvc_stop_streaming() is used for meta and video nodes. Split the function
> > >>>> in two to avoid confusion.
> > >>>>
> > >>>> Use this opportunity to rename uvc_start_streaming() to
> > >>>> uvc_start_streaming_video(), as it is only called by the video nodes.
> > >>>>
> > >>>> Reviewed-by: Hans de Goede <hansg@kernel.org>
> > >>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>>> ---
> > >>>>  drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
> > >>>>  1 file changed, 15 insertions(+), 7 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > >>>> index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
> > >>>> --- a/drivers/media/usb/uvc/uvc_queue.c
> > >>>> +++ b/drivers/media/usb/uvc/uvc_queue.c
> > >>>> @@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
> > >>>>                  uvc_video_clock_update(stream, vbuf, buf);
> > >>>>  }
> > >>>>
> > >>>> -static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> > >>>> +static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
> > >>>>  {
> > >>>>          struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > >>>>          struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> > >>>> @@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> > >>>>          return ret;
> > >>>>  }
> > >>>>
> > >>>> -static void uvc_stop_streaming(struct vb2_queue *vq)
> > >>>> +static void uvc_stop_streaming_video(struct vb2_queue *vq)
> > >>>>  {
> > >>>>          struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > >>>>
> > >>>>          lockdep_assert_irqs_enabled();
> > >>>>
> > >>>> -        if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
> > >>>> -                uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> > >>>> +        uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> > >>>> +
> > >>>> +        uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> > >>>> +}
> > >>>> +
> > >>>> +static void uvc_stop_streaming_meta(struct vb2_queue *vq)
> > >>>> +{
> > >>>> +        struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > >>>> +
> > >>>> +        lockdep_assert_irqs_enabled();
> > >>>>
> > >>>>          uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> > >>>>  }
> > >>>> @@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
> > >>>>          .buf_prepare = uvc_buffer_prepare,
> > >>>>          .buf_queue = uvc_buffer_queue,
> > >>>>          .buf_finish = uvc_buffer_finish,
> > >>>> -        .start_streaming = uvc_start_streaming,
> > >>>> -        .stop_streaming = uvc_stop_streaming,
> > >>>> +        .start_streaming = uvc_start_streaming_video,
> > >>>> +        .stop_streaming = uvc_stop_streaming_video,
> > >>>>  };
> > >>>>
> > >>>>  static const struct vb2_ops uvc_meta_queue_qops = {
> > >>>>          .queue_setup = uvc_queue_setup,
> > >>>>          .buf_prepare = uvc_buffer_prepare,
> > >>>>          .buf_queue = uvc_buffer_queue,
> > >>>> -        .stop_streaming = uvc_stop_streaming,
> > >>>> +        .stop_streaming = uvc_stop_streaming_meta,
> > >>>>  };
> > >>>
> > >>> I think there should be a comment stating that the metadata stream
> > >>> expects that video is streaming, it does not start streaming by itself.
> > >>>
> > >>> Something like:
> > >>>
> > >>>   /*
> > >>>    * .start_streaming is not provided here. Metadata relies on
> > >>>    * video streaming being active. If video isn't streaming, then
> > >>>    * no metadata will arrive either.
> > >>>    */
> > >>>
> > >>> It's unexpected that there is no start_streaming for metadata, so a
> > >>> comment wouldn't hurt.
> > >>
> > >> I've added this comment while merging this series and I've now pushed
> > >> the entire series to uvc.git/for-next .
> > >>
> > >> BTW it seems that both uvc.git/next and uvc.git/for-next are in
> > >> use now?  With uvc.git/next seemingly following media-commiters/next ?
> > >
> > > As far as I understand, some jobs in the media CI use the next branch,
> > > for instance the bisect job that tries to compile every commit uses the
> > > next branch as a base. We therefore need to keep the next branch
> > > up-to-date, mirroring upstream.
> >
> > Ok, so we have the next branch mirroring upstream and then we
> > use for-next to merge new patches as I've just done ?
>
> Sounds good.

BTW the auto-mirroring from media-committers has not been enabled. Do
you want it?

>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
