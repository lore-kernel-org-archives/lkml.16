Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B07B16A94A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841286; cv=none; b=sqed6HzCGSoGbis/bnAFSkInuicXbdX49zczX8s+Kwqt68VGgCokG83Unullt5i96xA2LGI7adpSzX0OiuNEWmWjTYRTay46Ahp3x93K6BgcrzESArrDhdWWp/77/OlWABZ0cMlkuIXGnHovaU3mNyb2g2foAAGeiKE8ORD6NUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841286; c=relaxed/simple;
	bh=+aWfaGGDWbe62RdwD4rb+fi+Nea5xSOKU64qIFi3d2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVqkiY4gevnmKkScqCP0NlUTX6/O6qi8cfqbky184erP/UCH5dOJtoLbXpk+2zzjRGKQxqmvBndWt3cgvnd0+PsTs0boeiCc8yoVtmxpu7G3MHgTH+oijNQEE8tOIi6Biy2+MgwdkW7SJUYWELQjkrc6JLL66xWsNd1QdfyYujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L1+i0Rvq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L1+i0Rvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745841283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNGiKinNboqHxR9CdTc8YCDZ3mrOVSAAWaNM8DqteYk=;
	b=L1+i0Rvqy8/bpwunU59Wkemuw3pPxXJVp6Wul9q5Fl+rhMG0VwiUhGP9JNNGH2pxl4yqQC
	wrioDXEOrbSyy0ndYRmlkiF/LvQmEmOsh5F0LNROQgc7uUDF9K7SUKqqAuKIrQQUhoyqLC
	mrCh6XvKGtBhSOCuT+Rk5oNa0Qqzva0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-XW4H5QpOPo6K24tDg0PUkw-1; Mon, 28 Apr 2025 07:54:42 -0400
X-MC-Unique: XW4H5QpOPo6K24tDg0PUkw-1
X-Mimecast-MFC-AGG-ID: XW4H5QpOPo6K24tDg0PUkw_1745841281
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5f4ca89d37fso4288844a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745841281; x=1746446081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNGiKinNboqHxR9CdTc8YCDZ3mrOVSAAWaNM8DqteYk=;
        b=p1kzxJkT2q+1lkbaWTJONTSdAovsW2oZLUxbzeDHwP2A5jHhc1yc3zUkuhOc0xV0mn
         /Ly3xSvxCbedkoyHPUgaWfkjImYUUaSSgUiWx5zbjurTiBJIad7DMOSQ3V/96+U6zKsl
         QhifbhdYB79Sn6oPLpo1uyauJkvKftbKwDAXSLPOk0cJuw2W+kMdnZpO4XA6zEgH6UeE
         nN+/DIwdLlwHGFpIIS6Xp/qfhhiE3vjX6wxbslZpfXq6AMgXz2Y3YUiAB4T77Xup2Wbj
         iH0/bCV0gzOjZ0KkJyyQpiHJfgHetxpsOWkSrcIaV7Z9pzEdBNHbNSm0U6kBeVw6IZAv
         Sy2g==
X-Forwarded-Encrypted: i=1; AJvYcCXD7LdBPgGtClAVRedpKX/tlbSeTcmytTxohh3XUuOq7CoHa6OFVKYIM0Br77HNHAKh/YscOCacZ8TCxSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiAr5u8XEHnuHB+a4sJGuXd1ITjnBC53BZTG94OqGePw5swPEW
	4tFv11FYofB9thDlrgYXbi25nVyt71nydPiLTsryaSxliYG9nfNWc/2tfF57WbsFrtfEPltTqV4
	0YjQQdEvRto6ojgQni39Ss0w8tnDhFCsHQEK3p2PjuVY4NoVcZS2STUoQVWG17w==
X-Gm-Gg: ASbGncvH1g9tByvmWRnsKu8ysIG6/z/Kf13pMQ0vTyJQj0tCQvj3ohlfxFZye6vxTe1
	pPYStCkM5/uZJTGEapo089I3qfsZgJ3wrq3A9EtjM2BW1ChDujUxJps1TtjP7DPTl1fVnhjEkAp
	hXwsDbOwBpb4WlB2IwC2kJx/lMATFWpyaOBfBLL9OwMyFi501QcTgGViWeKXOS3CrkBL6v/WHNM
	XU1hObgdKTTWplQMu5cYLPsp+/2wQCM6iM5Oe8Cv+VE/y9sPJ6wkfSoeBzxfDIbmNVQKRFE/7+D
	27pM8lEh0gZ7OoQ=
X-Received: by 2002:a05:6402:35d6:b0:5f3:4ac5:9bc0 with SMTP id 4fb4d7f45d1cf-5f7398390a2mr8112278a12.25.1745841280724;
        Mon, 28 Apr 2025 04:54:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvqRWhAs7Q01aqkNjkZNv9RFgYHhS9YJpdpS4uVZhVhJUvyWf8RtqElOsz+arF10yEJHNIwQ==
X-Received: by 2002:a05:6402:35d6:b0:5f3:4ac5:9bc0 with SMTP id 4fb4d7f45d1cf-5f7398390a2mr8112252a12.25.1745841280321;
        Mon, 28 Apr 2025 04:54:40 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fe5c1sm5743777a12.17.2025.04.28.04.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 04:54:39 -0700 (PDT)
Message-ID: <300e71dc-27f0-4193-a99f-3f6880add883@redhat.com>
Date: Mon, 28 Apr 2025 13:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
 <20250327-uvc-granpower-ng-v6-3-35a2357ff348@chromium.org>
 <20250422203753.GM17813@pendragon.ideasonboard.com>
 <CANiDSCumGeLf8qsWbnrJ2bjQEkQNM_-fD66ZDMG_ig-7XmvWcw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCumGeLf8qsWbnrJ2bjQEkQNM_-fD66ZDMG_ig-7XmvWcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 23-Apr-25 00:58, Ricardo Ribalda wrote:
> On Wed, 23 Apr 2025 at 04:37, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Hi Ricardo,
>>
>> Thank you for the patch.
>>
>> On Thu, Mar 27, 2025 at 09:05:29PM +0000, Ricardo Ribalda wrote:
>>> Now we call uvc_pm_get/put from the device open/close. This low
>>> level of granularity might leave the camera powered on in situations
>>> where it is not needed.
>>>
>>> Increase the granularity by increasing and decreasing the Power
>>> Management counter per ioctl. There are two special cases where the
>>> power management outlives the ioctl: async controls and streamon. Handle
>>> those cases as well.
>>>
>>> In a future patch, we will remove the uvc_pm_get/put from open/close.
>>>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_ctrl.c | 37 +++++++++++++++++++++++++++----------
>>>  drivers/media/usb/uvc/uvc_v4l2.c | 39 +++++++++++++++++++++++++++++++++++++--
>>>  2 files changed, 64 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>> index cbf19aa1d82374a08cf79b6a6787fa348b83523a..3fad289e41fd5a757f8dcf30a6238c694fc4250c 100644
>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>> @@ -1812,38 +1812,49 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>>>       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>>>  }
>>>
>>> -static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
>>> -                             struct uvc_fh *new_handle)
>>> +static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
>>> +                            struct uvc_fh *new_handle)
>>>  {
>>>       lockdep_assert_held(&handle->chain->ctrl_mutex);
>>>
>>>       if (new_handle) {
>>> +             int ret;
>>> +
>>>               if (ctrl->handle)
>>>                       dev_warn_ratelimited(&handle->stream->dev->udev->dev,
>>>                                            "UVC non compliance: Setting an async control with a pending operation.");
>>>
>>>               if (new_handle == ctrl->handle)
>>> -                     return;
>>> +                     return 0;
>>>
>>>               if (ctrl->handle) {
>>>                       WARN_ON(!ctrl->handle->pending_async_ctrls);
>>>                       if (ctrl->handle->pending_async_ctrls)
>>>                               ctrl->handle->pending_async_ctrls--;
>>> +                     ctrl->handle = new_handle;
>>> +                     handle->pending_async_ctrls++;
>>
>> As commented previously, your usage of the handle variable is confusing.
>>
>>                         ctrl->handle->pending_async_ctrls++;
> 
> I believe what makes it confusing is the function arguments.
> 
> Would you mind if I send a new patch introducing:
> uvc_ctrl_set_handle() and uvc_ctrl_clear_handle().

Ricardo, if you do end up making this change, please do so as a follow-up
patch on top of current uvc/next so that we don't have to drop the whole
series and then rebuild uvc/next from scratch.

Regards,

Hans




>>> +                     return 0;
>>>               }
>>>
>>> +             ret = uvc_pm_get(handle->chain->dev);
>>> +             if (ret)
>>> +                     return ret;
>>> +
>>>               ctrl->handle = new_handle;
>>>               handle->pending_async_ctrls++;
>>
>>                 ctrl->handle->pending_async_ctrls++;
>>
>>> -             return;
>>> +             return 0;
>>>       }
>>>
>>>       /* Cannot clear the handle for a control not owned by us.*/
>>>       if (WARN_ON(ctrl->handle != handle))
>>> -             return;
>>> +             return -EINVAL;
>>>
>>>       ctrl->handle = NULL;
>>>       if (WARN_ON(!handle->pending_async_ctrls))
>>> -             return;
>>> +             return -EINVAL;
>>>       handle->pending_async_ctrls--;
>>> +     uvc_pm_put(handle->chain->dev);
>>> +     return 0;
>>>  }
>>>
>>>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>>> @@ -2137,15 +2148,16 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>>>
>>>               ctrl->dirty = 0;
>>>
>>> +             if (!rollback && handle && !ret &&
>>> +                 ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>>> +                     ret = uvc_ctrl_set_handle(handle, ctrl, handle);
>>> +
>>>               if (ret < 0) {
>>>                       if (err_ctrl)
>>>                               *err_ctrl = ctrl;
>>>                       return ret;
>>>               }
>>>
>>> -             if (!rollback && handle &&
>>> -                 ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>>> -                     uvc_ctrl_set_handle(handle, ctrl, handle);
>>>       }
>>>
>>>       return 0;
>>> @@ -3222,6 +3234,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>>>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>>>  {
>>>       struct uvc_entity *entity;
>>> +     int i;
>>>
>>>       guard(mutex)(&handle->chain->ctrl_mutex);
>>>
>>> @@ -3236,7 +3249,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>>>               }
>>>       }
>>>
>>> -     WARN_ON(handle->pending_async_ctrls);
>>> +     if (!WARN_ON(handle->pending_async_ctrls))
>>> +             return;
>>> +
>>> +     for (i = 0; i < handle->pending_async_ctrls; i++)
>>> +             uvc_pm_put(handle->stream->dev);
>>>  }
>>>
>>>  /*
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index 1d5be045d04ecbf17e65e14b390e494a294b735f..8bccf7e17528b62f2594c0dad99405034532973d 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -697,6 +697,9 @@ static int uvc_v4l2_release(struct file *file)
>>>       if (uvc_has_privileges(handle))
>>>               uvc_queue_release(&stream->queue);
>>>
>>> +     if (handle->is_streaming)
>>> +             uvc_pm_put(stream->dev);
>>> +
>>>       /* Release the file handle. */
>>>       uvc_dismiss_privileges(handle);
>>>       v4l2_fh_del(&handle->vfh);
>>> @@ -862,6 +865,11 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>>>       if (ret)
>>>               return ret;
>>>
>>> +     ret = uvc_pm_get(stream->dev);
>>
>> Shouldn't this be done before calling uvc_queue_streamon() ? There's
>> another PM reference being held by the ioctl handler, but if the code is
>> refactored later, it would be good to make sure we resume the device
>> before starting streaming.
> 
> I was trying to simplify the error handling and, as you say, the ioctl
> handler already holds a reference. I do not mind sending a follow-up
> patch changing the order.
> 
>>
>>> +     if (ret) {
>>> +             uvc_queue_streamoff(&stream->queue, type);
>>> +             return ret;
>>> +     }
>>>       handle->is_streaming = true;
>>>
>>>       return 0;
>>> @@ -879,7 +887,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
>>>       guard(mutex)(&stream->mutex);
>>>
>>>       uvc_queue_streamoff(&stream->queue, type);
>>> -     handle->is_streaming = false;
>>> +     if (handle->is_streaming) {
>>> +             handle->is_streaming = false;
>>> +             uvc_pm_put(stream->dev);
>>> +     }
>>>
>>>       return 0;
>>>  }
>>> @@ -1378,9 +1389,11 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
>>>  #define UVCIOC_CTRL_MAP32    _IOWR('u', 0x20, struct uvc_xu_control_mapping32)
>>>  #define UVCIOC_CTRL_QUERY32  _IOWR('u', 0x21, struct uvc_xu_control_query32)
>>>
>>> +DEFINE_FREE(uvc_pm_put, struct uvc_device *, if (_T) uvc_pm_put(_T))
>>>  static long uvc_v4l2_compat_ioctl32(struct file *file,
>>>                    unsigned int cmd, unsigned long arg)
>>>  {
>>> +     struct uvc_device *uvc_device __free(uvc_pm_put) = NULL;
>>>       struct uvc_fh *handle = file->private_data;
>>>       union {
>>>               struct uvc_xu_control_mapping xmap;
>>> @@ -1389,6 +1402,12 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>>>       void __user *up = compat_ptr(arg);
>>>       long ret;
>>>
>>> +     ret = uvc_pm_get(handle->stream->dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     uvc_device = handle->stream->dev;
>>
>> Ouch... That's not nice very :-/
> 
> IIt is nicer than changing the returns with breaks, believe me I tried
> :), and it is more prone to errors.
> 
> I thought about the CLASS, but it is not worth it with a single user.
> I believe the current code is a good compromise, but I might be
> biased.
> 
>>
>> If you want to use the cleanup API, I think we could use guards with an
>> init function such as
>>
>> struct uvc_device *__uvc_pm_get_init(struct uvc_device *dev, int *ret)
>> {
>>         *ret = uvc_pm_get(dev);
>>         return *ret ? NULL : dev;
>> }
>>
>> You can use DEFINE_CLASS() instead of DEFINE_GUARD() to control the
>> arguments to the init function. Users of the guard could do
>>
>>         int ret;
>>
>>         guard(uvc_pm)(dev, &ret);
>>         if (ret)
>>                 return ret;
>>
>>         ...
>>
>> Another, simpler option would be to replace returns with breaks in
>> uvc_v4l2_compat_ioctl32(). I'm tempted to do that in this patch, and
>> switching to the cleanup API as a patch on top if desired.
>>
>>> +
>>>       switch (cmd) {
>>>       case UVCIOC_CTRL_MAP32:
>>>               ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
>>> @@ -1423,6 +1442,22 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>>>  }
>>>  #endif
>>>
>>> +static long uvc_v4l2_unlocked_ioctl(struct file *file,
>>> +                                 unsigned int cmd, unsigned long arg)
>>> +{
>>> +     struct uvc_fh *handle = file->private_data;
>>> +     int ret;
>>> +
>>> +     ret = uvc_pm_get(handle->stream->dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = video_ioctl2(file, cmd, arg);
>>> +
>>> +     uvc_pm_put(handle->stream->dev);
>>> +     return ret;
>>> +}
>>> +
>>>  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
>>>                   size_t count, loff_t *ppos)
>>>  {
>>> @@ -1507,7 +1542,7 @@ const struct v4l2_file_operations uvc_fops = {
>>>       .owner          = THIS_MODULE,
>>>       .open           = uvc_v4l2_open,
>>>       .release        = uvc_v4l2_release,
>>> -     .unlocked_ioctl = video_ioctl2,
>>> +     .unlocked_ioctl = uvc_v4l2_unlocked_ioctl,
>>>  #ifdef CONFIG_COMPAT
>>>       .compat_ioctl32 = uvc_v4l2_compat_ioctl32,
>>>  #endif
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 

