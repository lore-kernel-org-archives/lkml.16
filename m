Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3971D07BA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109502; cv=none; b=ijVnGGWQhXFJfBmysSplh3oob0a6+1eTS+oE9bX8M+5zDchQ9+QVvkEvtZFzhl8FA02dd/FTjrmpth7wXrY9+PVVE+6LCkdsAiNMi+OxRF/BHweFOedV4Qw0xcJ08qCDu9I5EJPepiTUgeJX8MH1QrlXcH/9yxU0FRQb9MvM7Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109502; c=relaxed/simple;
	bh=uwR8/t7sIdsF18i2//AWQRg0Q/ROjnh01+8dTIOWgYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfW/U634Hhbl7jWOWBK+dnc9eM3XH+PVDwTidpHP5ydm2T0NFP5pmdxQx9ci3eFnhQ9kPaYyI0c9ekcz0Ri860Fr4b4Fdl90zRRPcpvArsrV1OgOjZKcDvQ5c+jsKC6ltvYPQKdBj5/tn7nUsWoQubGjVPl6+C7XuNWjCKJSdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BPUW+Ocx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BPUW+Ocx"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54af09697f5so1385932e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109498; x=1743714298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v76bWlmH5fEA80rAfHXJpyek2P0fDmnWb9VSJAOO0oo=;
        b=BPUW+OcxGP4tvfWVd0SOrueoF2Tf5m8rYJHj65ROMQ50hfDkOgzNKGp6Mp9X85EQBe
         82wxEWrMB+tSlwmn0doySkxElvd/njra9P9Ux7ZR+nRQ8lDAGCWhMVjZlZOdaKNildPu
         JGFdTV6YUtW/uZMUC3RTTA2rroK/WsmAYtFFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109498; x=1743714298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v76bWlmH5fEA80rAfHXJpyek2P0fDmnWb9VSJAOO0oo=;
        b=MN0BvtSa+2kvkDici0yLj0ajrr4USYquzUHVTOcJDR40KvD1UdyVauI+8LsVp7i11E
         ryp6p0KtOgtCX75Avy2pNJmCYQ6+3Vu3IjUgktwoSXu2S5gnq/kUY1YbAbSiYADRJUnG
         JzghblBDBTEAoHbewOK9ZHa820yzBDIqDNLB8Vl+fLPu7+nzfKmAL477Y6M7eqEzAl77
         9a7tECGWkoViSr0kPkaPMGA3GRR19ZsQgs0BROIiKIL1LGg+JC0xIq0APtIliuPKwyha
         GQG+DJ4FTr6EFuc2/qB280ijAzJsX2uu7xBDQ0N0XJXi6mRtRw+9VNDiFkslxHKdMcR1
         CB6w==
X-Forwarded-Encrypted: i=1; AJvYcCWnUxamzobsjs/sQ1f55v1TXE/TBYXZDh2S4ohb4rae3uzuU5ScedY66b3AG+yfyemxNCUxkk3GkWSvCCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfXccRlIRO2rqJv80bhYZnF4snE2mXgqsqxVLaFTxDfGXPXyv
	BaBtqNe9tmiPk2wKO01WN1xdMILN8qSbQuMyTnfXwLxQb99LbvT+Gn8rDwv7mQV9Mr9DO7yJkRY
	=
X-Gm-Gg: ASbGnctL0OJYr8Ts5jKw9c1oUqv4jZOGKSj4sYkEzwuFY4JziBD6J0VzbTryx2eKL34
	T/jpxnZ7wj+G6gRDorXt6R/9qlECQVm/L231lUsks88Nm7LXayfKY44FtY2QPvfe+9OEADNkqL9
	kdiV25a4mmv/+kDRSmP//OtrgPAQmS35YcrAeuyzkcgisy/yKIEiXJEfhAbv5Fg8yf6dt8VxHjn
	Nf4IHs/QPgpgnhrmamCnKIFOp++BNbB+qH764KjzcgZ1ItZoDWVvdhKoteqWHqahacGkIdvh/5i
	P7hc3EgekHYhpl9N/gb+MJ4sT+xVzhcT7vuxxlehSRwStow6P2BqgW/cDRYj4/0wJCTxWGSKyWZ
	r5IsYB5Y=
X-Google-Smtp-Source: AGHT+IE9ze3WQJyrPtR4I6ZaYeBbdoOGD1WRGnA8qYsXoEXc09fTk8MVOoh97l/lBSu4zImSRzvBLA==
X-Received: by 2002:a05:6512:3e08:b0:549:5b54:2c68 with SMTP id 2adb3069b0e04-54b011d6355mr2122808e87.22.1743109497799;
        Thu, 27 Mar 2025 14:04:57 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c0c30sm81976e87.53.2025.03.27.14.04.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 14:04:57 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so1668994e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuBVcjyjgGd7qJwPgn8qcCT/sJhLrfoHC3W4zn1czyEcqr39pkTCJZXSdMF8bdqjtQvJyKcggjePJ5zX0=@vger.kernel.org
X-Received: by 2002:a05:6512:1115:b0:549:8cc9:67d1 with SMTP id
 2adb3069b0e04-54b01221f39mr1798987e87.38.1743109496515; Thu, 27 Mar 2025
 14:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
 <20250303-uvc-granpower-ng-v5-3-a3dfbe29fe91@chromium.org> <20250327175225.GA11416@pendragon.ideasonboard.com>
In-Reply-To: <20250327175225.GA11416@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 22:04:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCu4c6i+m7LJB5-_G2qc_XNguKb=JC1VKMmsRhkU9n7ipg@mail.gmail.com>
X-Gm-Features: AQ5f1JpQcnZzo6ViJh74lTA76yE155gIqk6ykMd5DZAwsQBBs79yYqwkKnDOYhw
Message-ID: <CANiDSCu4c6i+m7LJB5-_G2qc_XNguKb=JC1VKMmsRhkU9n7ipg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 27 Mar 2025 at 18:52, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Mar 03, 2025 at 07:13:40PM +0000, Ricardo Ribalda wrote:
> > Now we call uvc_pm_get/put from the device open/close. This low
> > level of granularity might leave the camera powered on in situations
> > where it is not needed.
> >
> > Increase the granularity by increasing and decreasing the Power
>
> You're decreasing the granularity, not increasing it.

I believe that this patch increases the level of detail. So it is
increasing the granularity... But I might be wrong

>
> > Management counter per ioctl. There are two special cases where the
> > power management outlives the ioctl: async controls and streamon. Handle
> > those cases as well.
> >
> > In a future patch, we will remove the uvc_pm_get/put from open/close.
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c | 23 +++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvcvideo.h |  1 +
> >  3 files changed, 33 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4e58476d305e..47188c7f96c7 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> >
> >               if (ctrl->handle) {
> >                       WARN_ON(!ctrl->handle->pending_async_ctrls);
> > -                     if (ctrl->handle->pending_async_ctrls)
> > +                     if (ctrl->handle->pending_async_ctrls) {
> >                               ctrl->handle->pending_async_ctrls--;
> > +                             uvc_pm_put(handle->chain->dev);
>
> Shouldn't this be
>
>                                 uvc_pm_put(ctrl->handle->chain->dev);
>
> ? In practice it won't make a difference as dev will be the same for
> both, but it seems clearer.

The last line of the function needs to be
uvc_pm_put(handle->chain->dev);

So I'd rather not mix handle-> and ctrl->handle. As you say, both
should be identical.

>
> > +                     }
> >               }
> >
> >               ctrl->handle = new_handle;
> >               handle->pending_async_ctrls++;
> > +             uvc_pm_get(handle->chain->dev);
>
> Similarly, we should use ctrl->handle here too (including for the
> pending_async_ctrls++).
>
> >               return;
> >       }
> >
> > @@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> >       if (WARN_ON(!handle->pending_async_ctrls))
> >               return;
> >       handle->pending_async_ctrls--;
> > +     uvc_pm_put(handle->chain->dev);
> >  }
> >
> >  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > @@ -2815,6 +2819,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >       struct uvc_entity *entity;
> > +     int i;
> >
> >       guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -2829,7 +2834,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >               }
> >       }
> >
> > -     WARN_ON(handle->pending_async_ctrls);
> > +     if (!WARN_ON(handle->pending_async_ctrls))
> > +             return;
> > +
> > +     for (i = 0; i < handle->pending_async_ctrls; i++)
> > +             uvc_pm_put(handle->stream->dev);
> >  }
> >
> >  /*
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index de1e105f7263..1c9ac72be58a 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -691,6 +691,9 @@ static int uvc_v4l2_release(struct file *file)
> >       if (uvc_has_privileges(handle))
> >               uvc_queue_release(&stream->queue);
> >
> > +     if (handle->is_streaming)
> > +             uvc_pm_put(stream->dev);
> > +
> >       /* Release the file handle. */
> >       uvc_dismiss_privileges(handle);
> >       v4l2_fh_del(&handle->vfh);
> > @@ -857,6 +860,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >               return ret;
> >
> >       handle->is_streaming = true;
> > +     uvc_pm_get(stream->dev);
> >
> >       return 0;
> >  }
> > @@ -873,7 +877,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
> >       guard(mutex)(&stream->mutex);
> >
> >       uvc_queue_streamoff(&stream->queue, type);
> > -     handle->is_streaming = false;
> > +     if (handle->is_streaming) {
> > +             handle->is_streaming = false;
> > +             uvc_pm_put(stream->dev);
> > +     }
> >
> >       return 0;
> >  }
> > @@ -1410,6 +1417,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >       void __user *up = compat_ptr(arg);
> >       long ret;
> >
> > +     guard(uvc_pm)(handle->stream->dev);
> > +
> >       switch (cmd) {
> >       case UVCIOC_CTRL_MAP32:
> >               ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> > @@ -1444,6 +1453,16 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >  }
> >  #endif
> >
> > +static long uvc_v4l2_video_ioctl2(struct file *file,
> > +                               unsigned int cmd, unsigned long arg)
> > +{
> > +     struct uvc_fh *handle = file->private_data;
> > +
> > +     guard(uvc_pm)(handle->stream->dev);
> > +
> > +     return video_ioctl2(file, cmd, arg);
> > +}
> > +
> >  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
> >                   size_t count, loff_t *ppos)
> >  {
> > @@ -1529,7 +1548,7 @@ const struct v4l2_file_operations uvc_fops = {
> >       .owner          = THIS_MODULE,
> >       .open           = uvc_v4l2_open,
> >       .release        = uvc_v4l2_release,
> > -     .unlocked_ioctl = video_ioctl2,
> > +     .unlocked_ioctl = uvc_v4l2_video_ioctl2,
>
> I'd have named this uvc_v4l2_unlocked_ioctl.
Changed in the next version
>
> >  #ifdef CONFIG_COMPAT
> >       .compat_ioctl32 = uvc_v4l2_compat_ioctl32,
> >  #endif
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index fbe3649c7cd6..eb8e374fa4c5 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -766,6 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
> >  /* PM */
> >  int uvc_pm_get(struct uvc_device *dev);
> >  void uvc_pm_put(struct uvc_device *dev);
> > +DEFINE_GUARD(uvc_pm, struct uvc_device *, uvc_pm_get(_T), uvc_pm_put(_T))
> >
> >  /* Controls */
> >  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
