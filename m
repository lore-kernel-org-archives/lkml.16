Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EEA1DDA3E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109537; cv=none; b=lpmdfa0GIVLrN9x3wnQ5yEFMkIbl0tK/73AF7nKl8viI5h1CCe/NEVRFsS5IdXcN+lkfW5v8urNfBFUDXGNPSM92+8kUAA/YKLdoeFo2VVfvL1lYCl1fOxU5BDFqFKMGOlvJCLVZXxL2HwFthCW4n36yNBLD8Si9G312BuiyY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109537; c=relaxed/simple;
	bh=o2bqwnjVaa+pcIiHxw+CdotzCsYFTHn/UBcy6+qxLCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaenmJlJpqguwcO7TKNXnpOyP2rG4lpsy/mXDvLfLvX7x6b5HoTrPCKqq+QVOUMgl4LTbfdLiqkLeu4oilqDLRop9ofuYcnoWa2UNqlALPKTYeVFM+K3IJneA5P+7lnMrBOYtxOoWqUiIb+yJOFt1VGecDGfXw8FsCEuUIffzP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mve1XISW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mve1XISW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499bd3084aso1337952e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109533; x=1743714333; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gP/wJpgzvj2ghIqB9W7sRYUtUSWJTyT/OuFceuuvtno=;
        b=Mve1XISWwg5b2ieVUioK+az2cA428RCodgw5hBn5XzKGKqTsKH7WwWnk6AbEeUD6R/
         3BzEqVBkiYhYwwWCfnN6AkQdB/sU8U0ao2tUFgvXlNVhaL+cksRs5o6kdYcIlEWXv6C4
         xwiZQOJifFlrPEHTblBF/yzQkVxlkWo7Yy+iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109533; x=1743714333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP/wJpgzvj2ghIqB9W7sRYUtUSWJTyT/OuFceuuvtno=;
        b=B3xaE9vENp+2F4xnLH39hpVNcDqAC2M362MuorYFYeRlLLrpWgxOaUOnOvjhdbxruW
         yMVB2VGhef0u/RdrxT8cho3fTriYPh/Vj/lMgvVNeuqxzTFqO85VIPxVu4kf7iMwaTl/
         QPyMigG05E8eMntG2VZjRcrTdBIfgIWbMB6ppEFS/tlz06rpq2zxzgau4UBnnloIi3dq
         vXSN0BfrCrZmECsmc2zT2yg3v2VkZS+aqwLWRsQY7GTQ222KCAboDoVQJ0aeU43dtbSR
         lMaeXTD7R7uVOQTOZW+OorUn77FdopyKWVVmcpJ2cS2GU76y04qdAXiyIajHKoFFvdKX
         e6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWBqEMy+w/cGCyc/KYoeFu0zTzFgaCfyeyRklQYeWVgreQ+LiLRDhO7ZrPu0JS7L042+FQLbUhpoLFNHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjuYPQbOWtzKexabhaKR6ZArrCWmX2f5vQiIolWLjGoClJuBgc
	qvxfkvuqK+LNxE0zNY/xbYKHcgEggr2opKwxlY2yOc4e+MAjqxlzDcCwofyAVYW62dY75WSydVU
	jGA==
X-Gm-Gg: ASbGncsKZA2NergTgDpwQ+6cspp6zRYK8xCtChEZoIJvOKf3d6os9ZV8iC/6wUHhjoq
	0+i2KKPn75vYIVBb0H2t5pZXMMcYq8V7jcnEF7QNYeXjT8YRJwsgv7FTgSN2xl/9XL16B9Vwq/E
	itJHL59zc14NVyps9M+mqaZ2Ykn6UrrsGz2bfOOC7MOSZdv7aj1nV9roiES6Nf/YaXhYJYR0rw1
	Ziqy1YGBOyZHhNpSuo2EyMp6KiQgnn/zEzo1pfGinjU3udwl8Qe4ab9iWczaODIXXOzAqFdyyvz
	/H1XpRIgnNcVNoALVU7/yEhwGNwyun/+Td1IJ+0GimJ8BbpFIvowh8e0NNQvtgrkKo2Taby1ZJQ
	BgT9u3NQ=
X-Google-Smtp-Source: AGHT+IE3wJUtTUY9PqLejJtm+NS/Y0JbCKwoGsqEoQPelcYPkZqD0qpSOY5jBlPY1dlGRrJ/x+x/4A==
X-Received: by 2002:a05:6512:398c:b0:545:93b:30c3 with SMTP id 2adb3069b0e04-54b011d7274mr1997360e87.18.1743109533364;
        Thu, 27 Mar 2025 14:05:33 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094baeb1sm81499e87.18.2025.03.27.14.05.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso1761353e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcvFsNblnI6B9B/GhPjReaQbabogqli0MV2vySwQm4apH8qw3cynymlEMyNkTixjwCrWaeJNqj7XSDW1g=@vger.kernel.org
X-Received: by 2002:a05:6512:3d0b:b0:549:8b24:9896 with SMTP id
 2adb3069b0e04-54b011515cfmr2256856e87.0.1743109531886; Thu, 27 Mar 2025
 14:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
 <20250303-uvc-granpower-ng-v5-3-a3dfbe29fe91@chromium.org>
 <20250327175225.GA11416@pendragon.ideasonboard.com> <20250327175706.GC11416@pendragon.ideasonboard.com>
In-Reply-To: <20250327175706.GC11416@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 22:05:19 +0100
X-Gmail-Original-Message-ID: <CANiDSCvCDxqUCzeOOtneesGiBpXeyqHffT0pHrO4_FwBvkn0dA@mail.gmail.com>
X-Gm-Features: AQ5f1JpXhOizlkxjNiecVB_NqQs75rkyEcWjwgsedXTYAg-xKQo85wVZzs4U6tA
Message-ID: <CANiDSCvCDxqUCzeOOtneesGiBpXeyqHffT0pHrO4_FwBvkn0dA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 18:57, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 27, 2025 at 07:52:27PM +0200, Laurent Pinchart wrote:
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > On Mon, Mar 03, 2025 at 07:13:40PM +0000, Ricardo Ribalda wrote:
> > > Now we call uvc_pm_get/put from the device open/close. This low
> > > level of granularity might leave the camera powered on in situations
> > > where it is not needed.
> > >
> > > Increase the granularity by increasing and decreasing the Power
> >
> > You're decreasing the granularity, not increasing it.
> >
> > > Management counter per ioctl. There are two special cases where the
> > > power management outlives the ioctl: async controls and streamon. Handle
> > > those cases as well.
> > >
> > > In a future patch, we will remove the uvc_pm_get/put from open/close.
> > >
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
> > >  drivers/media/usb/uvc/uvc_v4l2.c | 23 +++++++++++++++++++++--
> > >  drivers/media/usb/uvc/uvcvideo.h |  1 +
> > >  3 files changed, 33 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 4e58476d305e..47188c7f96c7 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > >
> > >             if (ctrl->handle) {
> > >                     WARN_ON(!ctrl->handle->pending_async_ctrls);
> > > -                   if (ctrl->handle->pending_async_ctrls)
> > > +                   if (ctrl->handle->pending_async_ctrls) {
> > >                             ctrl->handle->pending_async_ctrls--;
> > > +                           uvc_pm_put(handle->chain->dev);
> >
> > Shouldn't this be
> >
> >                               uvc_pm_put(ctrl->handle->chain->dev);
> >
> > ? In practice it won't make a difference as dev will be the same for
> > both, but it seems clearer.
> >
> > > +                   }
> > >             }
> > >
> > >             ctrl->handle = new_handle;
> > >             handle->pending_async_ctrls++;
> > > +           uvc_pm_get(handle->chain->dev);
> >
> > Similarly, we should use ctrl->handle here too (including for the
> > pending_async_ctrls++).
> >
> > >             return;
> > >     }
> > >
> > > @@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > >     if (WARN_ON(!handle->pending_async_ctrls))
> > >             return;
> > >     handle->pending_async_ctrls--;
> > > +   uvc_pm_put(handle->chain->dev);
> > >  }
> > >
> > >  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > > @@ -2815,6 +2819,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> > >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >  {
> > >     struct uvc_entity *entity;
> > > +   int i;
> > >
> > >     guard(mutex)(&handle->chain->ctrl_mutex);
> > >
> > > @@ -2829,7 +2834,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >             }
> > >     }
> > >
> > > -   WARN_ON(handle->pending_async_ctrls);
> > > +   if (!WARN_ON(handle->pending_async_ctrls))
> > > +           return;
> > > +
> > > +   for (i = 0; i < handle->pending_async_ctrls; i++)
> > > +           uvc_pm_put(handle->stream->dev);
> > >  }
> > >
> > >  /*
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > index de1e105f7263..1c9ac72be58a 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -691,6 +691,9 @@ static int uvc_v4l2_release(struct file *file)
> > >     if (uvc_has_privileges(handle))
> > >             uvc_queue_release(&stream->queue);
> > >
> > > +   if (handle->is_streaming)
> > > +           uvc_pm_put(stream->dev);
> > > +
> > >     /* Release the file handle. */
> > >     uvc_dismiss_privileges(handle);
> > >     v4l2_fh_del(&handle->vfh);
> > > @@ -857,6 +860,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> > >             return ret;
> > >
> > >     handle->is_streaming = true;
> > > +   uvc_pm_get(stream->dev);
>
> Another comment: shouldn't you handle the return value (here and
> elsewhere, including where you use guards) ?

Good point... I guess I got excited trying to use the guards :)
>
> > >
> > >     return 0;
> > >  }
> > > @@ -873,7 +877,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
> > >     guard(mutex)(&stream->mutex);
> > >
> > >     uvc_queue_streamoff(&stream->queue, type);
> > > -   handle->is_streaming = false;
> > > +   if (handle->is_streaming) {
> > > +           handle->is_streaming = false;
> > > +           uvc_pm_put(stream->dev);
> > > +   }
> > >
> > >     return 0;
> > >  }
> > > @@ -1410,6 +1417,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> > >     void __user *up = compat_ptr(arg);
> > >     long ret;
> > >
> > > +   guard(uvc_pm)(handle->stream->dev);
> > > +
> > >     switch (cmd) {
> > >     case UVCIOC_CTRL_MAP32:
> > >             ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> > > @@ -1444,6 +1453,16 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> > >  }
> > >  #endif
> > >
> > > +static long uvc_v4l2_video_ioctl2(struct file *file,
> > > +                             unsigned int cmd, unsigned long arg)
> > > +{
> > > +   struct uvc_fh *handle = file->private_data;
> > > +
> > > +   guard(uvc_pm)(handle->stream->dev);
> > > +
> > > +   return video_ioctl2(file, cmd, arg);
> > > +}
> > > +
> > >  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
> > >                 size_t count, loff_t *ppos)
> > >  {
> > > @@ -1529,7 +1548,7 @@ const struct v4l2_file_operations uvc_fops = {
> > >     .owner          = THIS_MODULE,
> > >     .open           = uvc_v4l2_open,
> > >     .release        = uvc_v4l2_release,
> > > -   .unlocked_ioctl = video_ioctl2,
> > > +   .unlocked_ioctl = uvc_v4l2_video_ioctl2,
> >
> > I'd have named this uvc_v4l2_unlocked_ioctl.
> >
> > >  #ifdef CONFIG_COMPAT
> > >     .compat_ioctl32 = uvc_v4l2_compat_ioctl32,
> > >  #endif
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index fbe3649c7cd6..eb8e374fa4c5 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -766,6 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
> > >  /* PM */
> > >  int uvc_pm_get(struct uvc_device *dev);
> > >  void uvc_pm_put(struct uvc_device *dev);
> > > +DEFINE_GUARD(uvc_pm, struct uvc_device *, uvc_pm_get(_T), uvc_pm_put(_T))
> > >
> > >  /* Controls */
> > >  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
