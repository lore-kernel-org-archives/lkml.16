Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B783B1EE7DD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745362715; cv=none; b=Kej08la5o7w3H1P34Prudha3l+qYBtLq91vIidrdjBH7252vb95UfM2LmCO2vq11aZSFpi0dZ+p7LNGg/d/nMEEw5kyYFRuHHIj/e/oBgIKua0hqky+1s7KIS3zhmLTepR97ujDQDJnWSTUAjtbBLu93A7QE+5eF7BuhuHGTX9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745362715; c=relaxed/simple;
	bh=Pa+ElDku3HZEpn1QYArw6VW4kZniyFsCxLJncEg08Fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTK/FRO6CK/dqdwpUy+TwGJSmvtDIB6ik1UpRn1hPOUIOz54E4gmWLgJ2mQ55YXhj+XOQ2IwodiyFcBETyW+CfHRxqUQxJe/zHZKYl3IBBOJknn4qh6C0Grgjb0GAGMuI+/wlm/vofLYcOu0q3AxsOpmogszEiytI9gFpVJI4OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gBk85uVK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gBk85uVK"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6672259e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745362711; x=1745967511; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4OQnvOrFidtEMyDdERF9VPf0SoeIDAXalyxRVjsmzwk=;
        b=gBk85uVKG6pUmaAUOEyQrp9VtzN3ZSxNf4oa0j2TbV2lA5tO1CpSmGCaAalApAeQgY
         a1s+rt9vLn6jfvyalS+Y/t5MoNuNLXOg7dIOew7qCYdZQkuaKzVapwporC2xaPxcOXcp
         1cfHYHFbi+HW7lNFHLOTU7psX63d9lJ59ayE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362711; x=1745967511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OQnvOrFidtEMyDdERF9VPf0SoeIDAXalyxRVjsmzwk=;
        b=sZNGM760+wsN5+2ZBXfHSC+Zbx5GMqi70OSrHlWiOy7f2v5uUVVjWmg0NhqMaYvONb
         vn7P6RtblO6Ym3AdSq5o5S8qUIr1/TWCZ3iu4HufatSqZfQRc8eVN+i8jd8dPo/xYWhc
         FyZfdLpUHi4tetUtDpFIfqxNEzSOz8HEn1q6BtH/rshEFbmpZZQjXrmcO1IfuvnRoE50
         /S9n6xRgDhxS24ncl0rSZyDwrnMXDkqX0Oyxm3lVzzxCyi+qRj1QS8nrEAY0RZeUrtcg
         TFJI2inRXy1pJGyp6ZJ+dZjeAXMIQp1kJQcPZQvicBsRkB9+kBZyraD8yegZjU4M2UKC
         O27w==
X-Forwarded-Encrypted: i=1; AJvYcCV0QNHIy+YNbhXTuFHHTgy6VPFsAl6uI9uhgpibNFJIsz0qBhP1QtG2JdTtzYPRB8gVk65uBFBv/49JylM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqVqLr0NQS4lv9sIyYqoRSr4LWVy5nddJgyQt1NhzWL3XCL3zq
	N1DLTq+a7GcuuxwAY63Zj16aKkcM0ehFn4/Fy476tECUjNll/wPR+04au0cqvIvCw5i0zOGUU5P
	FFw==
X-Gm-Gg: ASbGncty5VKsxyg1LcfhOiFa0drraB6Xb/xqCOgoq762vLaVzViVkMSVqObYXAQwwek
	S8Dqgo/kD2D21GGeLFfVrMrMX/D9za2ymoVdLk6o5lQ+28d6W6kgtSewUTMfj+oDSDr37P/zSAc
	qiMRXIraKmMME/THr4p+kfMqAaB2C44Hb/OXL5x93NX0LLRqSGeem48LOsOs2zGJ8MG/D2f7Sls
	7vTwn3CWV6mJ8ueUkmrQ1UUYWyn6oKmWMZr29jsNZ5+FYutZ3EjF4g9lYXwP1OmeLB97YHE2Vfi
	8nd/DUaTrIw1cR4gTy7NdBcHjKvY8zsVk4+qWgBSmc8lDACmewsQ1BeelLEaYKmWAuwf5WFRgkO
	jF6oNGq4=
X-Google-Smtp-Source: AGHT+IFfCzgdpWvf+WS00Io4kUZTkpnYftGak6EFSIB1uCqlm94E0Hrudh5r34xfZKhrSydemzV25g==
X-Received: by 2002:a05:6512:b28:b0:549:8f21:bc0f with SMTP id 2adb3069b0e04-54d6e635c64mr4696342e87.30.1745362710997;
        Tue, 22 Apr 2025 15:58:30 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f605bsm1330163e87.231.2025.04.22.15.58.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:58:30 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db1bc464dso55553331fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:58:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQ1uJeobOR20RMSPa2ayEmr7RbmAQzsvFQIJh6busmV6qBTJICGRkESIsCnwjrX9BaIBvBt4QHSPXpe8U=@vger.kernel.org
X-Received: by 2002:a2e:bc8a:0:b0:30b:c91d:35cd with SMTP id
 38308e7fff4ca-310904dac6cmr53318841fa.11.1745362709454; Tue, 22 Apr 2025
 15:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
 <20250327-uvc-granpower-ng-v6-3-35a2357ff348@chromium.org> <20250422203753.GM17813@pendragon.ideasonboard.com>
In-Reply-To: <20250422203753.GM17813@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Apr 2025 06:58:13 +0800
X-Gmail-Original-Message-ID: <CANiDSCumGeLf8qsWbnrJ2bjQEkQNM_-fD66ZDMG_ig-7XmvWcw@mail.gmail.com>
X-Gm-Features: ATxdqUG6Xg-z7IHemIoj9htdad3raPnhd_FVHcJFOflmS9hQbocKBKA2_rkMOwE
Message-ID: <CANiDSCumGeLf8qsWbnrJ2bjQEkQNM_-fD66ZDMG_ig-7XmvWcw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 04:37, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Mar 27, 2025 at 09:05:29PM +0000, Ricardo Ribalda wrote:
> > Now we call uvc_pm_get/put from the device open/close. This low
> > level of granularity might leave the camera powered on in situations
> > where it is not needed.
> >
> > Increase the granularity by increasing and decreasing the Power
> > Management counter per ioctl. There are two special cases where the
> > power management outlives the ioctl: async controls and streamon. Handle
> > those cases as well.
> >
> > In a future patch, we will remove the uvc_pm_get/put from open/close.
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 37 +++++++++++++++++++++++++++----------
> >  drivers/media/usb/uvc/uvc_v4l2.c | 39 +++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 64 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index cbf19aa1d82374a08cf79b6a6787fa348b83523a..3fad289e41fd5a757f8dcf30a6238c694fc4250c 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1812,38 +1812,49 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
> >       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> >  }
> >
> > -static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > -                             struct uvc_fh *new_handle)
> > +static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > +                            struct uvc_fh *new_handle)
> >  {
> >       lockdep_assert_held(&handle->chain->ctrl_mutex);
> >
> >       if (new_handle) {
> > +             int ret;
> > +
> >               if (ctrl->handle)
> >                       dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> >                                            "UVC non compliance: Setting an async control with a pending operation.");
> >
> >               if (new_handle == ctrl->handle)
> > -                     return;
> > +                     return 0;
> >
> >               if (ctrl->handle) {
> >                       WARN_ON(!ctrl->handle->pending_async_ctrls);
> >                       if (ctrl->handle->pending_async_ctrls)
> >                               ctrl->handle->pending_async_ctrls--;
> > +                     ctrl->handle = new_handle;
> > +                     handle->pending_async_ctrls++;
>
> As commented previously, your usage of the handle variable is confusing.
>
>                         ctrl->handle->pending_async_ctrls++;

I believe what makes it confusing is the function arguments.

Would you mind if I send a new patch introducing:
uvc_ctrl_set_handle() and uvc_ctrl_clear_handle().



>
> > +                     return 0;
> >               }
> >
> > +             ret = uvc_pm_get(handle->chain->dev);
> > +             if (ret)
> > +                     return ret;
> > +
> >               ctrl->handle = new_handle;
> >               handle->pending_async_ctrls++;
>
>                 ctrl->handle->pending_async_ctrls++;
>
> > -             return;
> > +             return 0;
> >       }
> >
> >       /* Cannot clear the handle for a control not owned by us.*/
> >       if (WARN_ON(ctrl->handle != handle))
> > -             return;
> > +             return -EINVAL;
> >
> >       ctrl->handle = NULL;
> >       if (WARN_ON(!handle->pending_async_ctrls))
> > -             return;
> > +             return -EINVAL;
> >       handle->pending_async_ctrls--;
> > +     uvc_pm_put(handle->chain->dev);
> > +     return 0;
> >  }
> >
> >  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > @@ -2137,15 +2148,16 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >
> >               ctrl->dirty = 0;
> >
> > +             if (!rollback && handle && !ret &&
> > +                 ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > +                     ret = uvc_ctrl_set_handle(handle, ctrl, handle);
> > +
> >               if (ret < 0) {
> >                       if (err_ctrl)
> >                               *err_ctrl = ctrl;
> >                       return ret;
> >               }
> >
> > -             if (!rollback && handle &&
> > -                 ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > -                     uvc_ctrl_set_handle(handle, ctrl, handle);
> >       }
> >
> >       return 0;
> > @@ -3222,6 +3234,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >       struct uvc_entity *entity;
> > +     int i;
> >
> >       guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -3236,7 +3249,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
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
> > index 1d5be045d04ecbf17e65e14b390e494a294b735f..8bccf7e17528b62f2594c0dad99405034532973d 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -697,6 +697,9 @@ static int uvc_v4l2_release(struct file *file)
> >       if (uvc_has_privileges(handle))
> >               uvc_queue_release(&stream->queue);
> >
> > +     if (handle->is_streaming)
> > +             uvc_pm_put(stream->dev);
> > +
> >       /* Release the file handle. */
> >       uvc_dismiss_privileges(handle);
> >       v4l2_fh_del(&handle->vfh);
> > @@ -862,6 +865,11 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >       if (ret)
> >               return ret;
> >
> > +     ret = uvc_pm_get(stream->dev);
>
> Shouldn't this be done before calling uvc_queue_streamon() ? There's
> another PM reference being held by the ioctl handler, but if the code is
> refactored later, it would be good to make sure we resume the device
> before starting streaming.

I was trying to simplify the error handling and, as you say, the ioctl
handler already holds a reference. I do not mind sending a follow-up
patch changing the order.

>
> > +     if (ret) {
> > +             uvc_queue_streamoff(&stream->queue, type);
> > +             return ret;
> > +     }
> >       handle->is_streaming = true;
> >
> >       return 0;
> > @@ -879,7 +887,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
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
> > @@ -1378,9 +1389,11 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
> >  #define UVCIOC_CTRL_MAP32    _IOWR('u', 0x20, struct uvc_xu_control_mapping32)
> >  #define UVCIOC_CTRL_QUERY32  _IOWR('u', 0x21, struct uvc_xu_control_query32)
> >
> > +DEFINE_FREE(uvc_pm_put, struct uvc_device *, if (_T) uvc_pm_put(_T))
> >  static long uvc_v4l2_compat_ioctl32(struct file *file,
> >                    unsigned int cmd, unsigned long arg)
> >  {
> > +     struct uvc_device *uvc_device __free(uvc_pm_put) = NULL;
> >       struct uvc_fh *handle = file->private_data;
> >       union {
> >               struct uvc_xu_control_mapping xmap;
> > @@ -1389,6 +1402,12 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >       void __user *up = compat_ptr(arg);
> >       long ret;
> >
> > +     ret = uvc_pm_get(handle->stream->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     uvc_device = handle->stream->dev;
>
> Ouch... That's not nice very :-/

IIt is nicer than changing the returns with breaks, believe me I tried
:), and it is more prone to errors.

I thought about the CLASS, but it is not worth it with a single user.
I believe the current code is a good compromise, but I might be
biased.

>
> If you want to use the cleanup API, I think we could use guards with an
> init function such as
>
> struct uvc_device *__uvc_pm_get_init(struct uvc_device *dev, int *ret)
> {
>         *ret = uvc_pm_get(dev);
>         return *ret ? NULL : dev;
> }
>
> You can use DEFINE_CLASS() instead of DEFINE_GUARD() to control the
> arguments to the init function. Users of the guard could do
>
>         int ret;
>
>         guard(uvc_pm)(dev, &ret);
>         if (ret)
>                 return ret;
>
>         ...
>
> Another, simpler option would be to replace returns with breaks in
> uvc_v4l2_compat_ioctl32(). I'm tempted to do that in this patch, and
> switching to the cleanup API as a patch on top if desired.
>
> > +
> >       switch (cmd) {
> >       case UVCIOC_CTRL_MAP32:
> >               ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> > @@ -1423,6 +1442,22 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >  }
> >  #endif
> >
> > +static long uvc_v4l2_unlocked_ioctl(struct file *file,
> > +                                 unsigned int cmd, unsigned long arg)
> > +{
> > +     struct uvc_fh *handle = file->private_data;
> > +     int ret;
> > +
> > +     ret = uvc_pm_get(handle->stream->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = video_ioctl2(file, cmd, arg);
> > +
> > +     uvc_pm_put(handle->stream->dev);
> > +     return ret;
> > +}
> > +
> >  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
> >                   size_t count, loff_t *ppos)
> >  {
> > @@ -1507,7 +1542,7 @@ const struct v4l2_file_operations uvc_fops = {
> >       .owner          = THIS_MODULE,
> >       .open           = uvc_v4l2_open,
> >       .release        = uvc_v4l2_release,
> > -     .unlocked_ioctl = video_ioctl2,
> > +     .unlocked_ioctl = uvc_v4l2_unlocked_ioctl,
> >  #ifdef CONFIG_COMPAT
> >       .compat_ioctl32 = uvc_v4l2_compat_ioctl32,
> >  #endif
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
