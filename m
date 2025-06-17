Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9B92D9EDE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158598; cv=none; b=ounWxt5htZZ8n+23yBVL7JxJhDLeg7PPW8dNUJxQUZBf2G9E88R+diCRvgnxmIx5nJBffiuN7l9+RaqbncKjQe09zlSOBH27KH7wZZ5btuA7FKNjmxNV6QgZGnXGVohLaV7BmmuqpCf7OpUr3vkeGpjuxt4mvD0oTrptP02ixb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158598; c=relaxed/simple;
	bh=3iABfpoY3Y0mGanrAe+hXLbHOqil9tZWsE5h0Errohc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edMEDZKEJbA5x8mLhoVW8nW7KDJ6UqIbo1WGG+cYApn27dkQS8/kWB/bUxh5aNtEsiwqzryYD2kD02y6400sv4MPUD6Qh6TPwhZMy2BKs2fuaGou2B/LGO5N419cSpMwdgiokn4ipohPKVMHR7K28ZXwFT6BkZWUMdJfc8MRMkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OrBcyEHS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OrBcyEHS"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7058208e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750158595; x=1750763395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/xVAGKUYkaeSZvFs9ozze0xQ8vJD4D6EzU0DgFzpE8s=;
        b=OrBcyEHSdP9PXo2jr7IWlyJ3KJHYDaNIrsSvXqifRdLH3P/tPF94QYjDpxQCOmddS5
         zIkUckTEhC5xHEFJ2HinTpyJjuSVMCcgQwW24Rad/zcN9xHuVo9KTjZpaFsob6o8zni5
         Pl6Q+2jzVvJqyclO0+KeKOOpWEz9OvgYp32Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750158595; x=1750763395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xVAGKUYkaeSZvFs9ozze0xQ8vJD4D6EzU0DgFzpE8s=;
        b=wnWNXw16LPyrlVsKPnxsaxmCAFtkQv/kHY+mxIQnDKRtitMO3747tXAdcPoy9ixHd8
         PGNbhQL2lD7U568PMNSHiR5hOv4KN/1EmxF1zt6e7jiNS3NUu8Mkt2uT92NUqxl4G9+e
         YmDIuUuGeOL7DDgb2Hh8DFiMbXE3+y8Oj3F2STTet0ae8kDGNoBDj9BDLfuWSWpC0S4r
         6P0PVt6PV8lBiS/Bid3GA+UIxNqCkA7GwxVdQRk56rGIGbP+YvgpjDIA4Cgpg0bh3Q25
         ubzXTC7HDO3dvyV77MFK9Sv4ZL85mW83j7X7aH8myQtPraF0w5w4ZyaEKUUvWH+0PYyL
         molg==
X-Forwarded-Encrypted: i=1; AJvYcCUyat84v3szSZwLjYs8ha0CN0cN9daNe49noFyr6mdM7QjZE0aMcSVkr+6ULBS8Byn25HNtjR9Gn+Ydwp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvf+UeB1Ew5uyN4/ek4Bmm4vrJ0dLxdNEG+PXERlW1tqoiHEC
	uB7PHMYwUYajSGVihZ/LWjvaPPMtqLtiE1TQSWuR9lor2o4u4JC/vzoTn+HiCviPrHiZgsaugxL
	UY6g=
X-Gm-Gg: ASbGncvLBlOHSvj9fnaCQglSdJGXEdwldcXeUXsKws3TYrU00dDMo3fQ6yn1ZRaFWlW
	ll4h2zTZ1sx+xFJhRhL2uj2n750kY8JHeboqe5Y9MG7lLcyXoShpOVdok18yqDZjqWa/zBQQeDq
	jtQaiAMwKkaajKKV8vS2Wj/0wMfk10LhUPmzYaByYlPhEfe0bs8I7YUEnPx86FHYKUtQXLL5c19
	T+M3i1WKO1mS3/d6vq7f+WZMxc9XMq/W89Ur6KXaFDbaLL+4JKUHIhW2Fe7Wy4G9iUz6K8q0umB
	rbR13ZLpkdkOuw8CVNX4FcfDd6B6oIheOl/fZMmR/Z9wFRGGI143UkVaeWlWxCl0qyZVJvW/oVg
	zl4/cz0CtW3gZNNvf0InqQVhK
X-Google-Smtp-Source: AGHT+IEJo+ttUdaGJstFyS0QWfw/CMR+R661E4d0on7DeGCu6+xECynLj22Dkz3/l8+ayf5LXIF+fg==
X-Received: by 2002:a05:6512:e99:b0:553:ac33:ff34 with SMTP id 2adb3069b0e04-553b6e6d325mr3353345e87.8.1750158594539;
        Tue, 17 Jun 2025 04:09:54 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f75a0sm1877918e87.219.2025.06.17.04.09.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:09:53 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5533303070cso5202032e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTSLyJa9qnon9yMane3MtTQG5L49d4l3uuYLu/6xSDNra2UaqmArb1HyFhDFmQJf3DF9JmUdLpyUQcnt4=@vger.kernel.org
X-Received: by 2002:a05:6512:2351:b0:553:330e:59da with SMTP id
 2adb3069b0e04-553b6f5a965mr3157365e87.53.1750158592973; Tue, 17 Jun 2025
 04:09:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-5-250286570ee7@chromium.org> <CANiDSCur8zys_CSZC9+-QdD0U556A7HLLdSN8mJuOpXm+Ls8Wg@mail.gmail.com>
 <20250617100730.GA10006@pendragon.ideasonboard.com>
In-Reply-To: <20250617100730.GA10006@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 13:09:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCvfbB+wwFqNGJKBbSGNhXWvxxK=dvGuej7VmHc+hAUNEA@mail.gmail.com>
X-Gm-Features: AX0GCFsrYvLMa-VmDVbj6JS2jtMAUXpZqw4PEB6foGSUqQfRugJhp1UBgzTyc50
Message-ID: <CANiDSCvfbB+wwFqNGJKBbSGNhXWvxxK=dvGuej7VmHc+hAUNEA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: uvcvideo: Use prio state from v4l2_device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 12:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 16, 2025 at 08:30:08PM +0200, Ricardo Ribalda wrote:
> > On Mon, 16 Jun 2025 at 17:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > Currently, a UVC device can have multiple chains, and each chain maintains
> > > its own priority state. While this behavior is technically correct for UVC,
> > > uvcvideo is the *only* V4L2 driver that does not utilize the priority state
> > > defined within `v4l2_device`.
> > >
> > > This patch modifies uvcvideo to use the `v4l2_device` priority state. While
> > > this might not be strictly "correct" for uvcvideo's multi-chain design, it
> > > aligns uvcvideo with the rest of the V4L2 drivers, providing "correct enough"
> > > behavior and enabling code cleanup in v4l2-core. Also, multi-chain
> > > devices are extremely rare, they are typically implemented as two
> > > independent usb devices.
> >
> > As the cover letter says, this last patch 5/5 is a RFC. We can decide
> > if it is worth to keep it or not.
> >
> > The pros is that we can do some cleanup in the core,
>
> What cleanups would that be ?
>
> > the cons is that it might break kAPI.
>
> Multi-chain devices are essentially multiple video devices inside a
> single USB function. They are exposed as completely separate devices to
> userspace, having the priority ioctls on one chain impact the other
> chain wouldn't make much sense to me. I think we should drop this patch.

Ack, let's drop it.

PS: Do you know about a multi chain device that is commercially
available? I would love to buy one for testing.
Also do you know any "output" device that I can buy?

>
> > I checked in the debian sourcecode and I could only find a user of
> > PRIORITY for dvb and was optional.
>
> We could discuss deprecating the priority ioctls overall if we think
> they're not useful (and used) by userspace. I was however considering
> using them in libcamera though, to prevent other applications from
> modifying the camera configuration behind the library's back.

For the record:
From: https://codesearch.debian.net/search?q=VIDIOC_S_PRIORITY
If I am not wrong, this is the only relevant usecase:
https://sources.debian.org/src/zvbi/0.2.44-1/daemon/proxyd.c/?hl=1523#L1523

O_EXCL does not work for you?


>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 2 --
> > >  drivers/media/usb/uvc/uvcvideo.h   | 1 -
> > >  2 files changed, 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index accfb4ca3c72cb899185ddc8ecf4e29143d58fc6..e3795e40f14dc325e5bd120f5f45b60937841641 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1728,7 +1728,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
> > >         INIT_LIST_HEAD(&chain->entities);
> > >         mutex_init(&chain->ctrl_mutex);
> > >         chain->dev = dev;
> > > -       v4l2_prio_init(&chain->prio);
> > >
> > >         return chain;
> > >  }
> > > @@ -2008,7 +2007,6 @@ int uvc_register_video_device(struct uvc_device *dev,
> > >         vdev->fops = fops;
> > >         vdev->ioctl_ops = ioctl_ops;
> > >         vdev->release = uvc_release;
> > > -       vdev->prio = &stream->chain->prio;
> > >         vdev->queue = &queue->queue;
> > >         vdev->lock = &queue->mutex;
> > >         if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db..5ed9785d59c698cc7e0ac69955b892f932961617 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -354,7 +354,6 @@ struct uvc_video_chain {
> > >                                                  * uvc_fh.pending_async_ctrls
> > >                                                  */
> > >
> > > -       struct v4l2_prio_state prio;            /* V4L2 priority state */
> > >         u32 caps;                               /* V4L2 chain-wide caps */
> > >         u8 ctrl_class_bitmap;                   /* Bitmap of valid classes */
> > >  };
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
