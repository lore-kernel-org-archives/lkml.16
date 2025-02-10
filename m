Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B31248163
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203667; cv=none; b=oPv38Qe0KUO72bldBQGI753v7doaowIxVxJ+13Wr3vpRgxty5jDU/pSLWOQH/z3OcL6m9A2U6KC4phWfk3G1c2NubBUwiRnVDbehZrkuwmk3eXFtELFJ3OkWn29OhH6AwkU5BRj1BdbptzMWCImp4sqM4e4MsgA0ZUTubS2LNnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203667; c=relaxed/simple;
	bh=Pm5JicYMot7Tym1Zb0/aX5QKN/E+G+wocop1y+Xhx34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwtKzu2cgo2rpwjRcJVbLFlfJ2KzcJUgkJYtADDdgrC/oUyLf/rdkchWzG36pIKSJqP6Fc8LGl4iMPJPQNRr9kh7+oQbPogYhWoR00Q9FcKlzWL64VG6bbTe5wZUW+EypP6/Gc+ptQlzpUNqeWahfXvqIB1GonZNTNqsO2jEOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YVJPmCPH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YVJPmCPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739203664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77GL/tYmPl7+mQAdfsy5azygebvcP1znrXsaoed79iE=;
	b=YVJPmCPHozY8czqcmAH4C6+7WiZ6eahnKOBq15AQjw7E3xeMz2OjNlrbHrtlr+gSWTqq4n
	IhDwOgk3Jdw8NBzAarKR5i6qUC0ksDcbVj4nR7Sk+DQMYvaQ+8T8wGpnul06C9SGSy880/
	I7zjGHHwz5SN8fnLzRl1I+7PYSEqYM0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-pm98jNnMPAyT08SKSRPsfA-1; Mon, 10 Feb 2025 11:07:41 -0500
X-MC-Unique: pm98jNnMPAyT08SKSRPsfA-1
X-Mimecast-MFC-AGG-ID: pm98jNnMPAyT08SKSRPsfA
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ab7a3a033b4so162537266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203659; x=1739808459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77GL/tYmPl7+mQAdfsy5azygebvcP1znrXsaoed79iE=;
        b=uYiFfe7F9AG4XMs04tiw2ycIm+aNtw+ex8NMsIr9VxeF3E4hLxodTlJe1iOx/Q9MMw
         646oPOvh+maN7AcXGtluqH2MN7cqVUGIgfBsY6RZe2v2Owvf1N9tK+buUohCS0Gmei/5
         uRKiPzehrqsk7TCjfAUnjV7As7wW5wMfk68vhupwllZQdwDAWUTp0UkbbLUoQE30XD7f
         USbvSfReQ3nu/BjqtC1ZSbzrJMOZA+9tE8HLuRxFSOhlGY1p6GkO40aFUQhNoV2mDn8Z
         PxXrZOOBTX5ddPf2Td1AMQprGFHUP+FSBH7Xse1p0Xo11T1mpuon0uO9zxLcGDZM9Myd
         RrpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXUz19uzjaVJ4x1vIuNsOJu6E3jPQSh7P8j0P73sC0t26hq6Na18pXpzmrW8G0brJAklqhYMZXRNnsUu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXh1QsBrEZRxVKT9Dmjm6baoq8slAwJHoZpTapqx23kGJSETe9
	1zxWmWhIi85BKfuPhme19uuLc2fvfcd3ZVf0wWssmD15CYFKmuS2PnWn3wLZFd38EO8/UN9cIfx
	Cw68rwW4HsE3rYt1tsI4R8mGW89OKRnw7O7rJHUEpzK9GK4ZHdakD4iOL1LEF0Q==
X-Gm-Gg: ASbGncsbHLyJk6kVes6lXgwl1JPnCSr/GMXzk2b6IFRTCww6hymrJfk4nLIbSlLLRQA
	M8qytnPcCQ24+wGO2sUW37HrD1raI++icYkqIWBqPtsadSTUmIfTWhK+ql0nxMqewMhSW5NUq1o
	T8255NA8bAw/9x1E1IIU6NTjYgGTPXBKYUVLoOru1ypkf5ksBBZN1/17mtC42YYNhBqk0h4gJi+
	JPMtV/Nz5wSpvPjmIq2vNfLn8/ROau0T6GCUql3rKheuuk51SCUpNy6my8LecwBrCMc74q91LP1
	ZrnKoJV13zw956zyeiKSkrP/nEjHYLNROaoRXGLTnPkCDfHmVR9Rbw+c5DeJLN3q5XaMpORavKR
	ci5DvQrlR8nW3WS3xBoFKm6OZSI7io4Vm7bZtNswFH/6+Ra4MSPiAj3M=
X-Received: by 2002:a17:906:dc90:b0:ab7:bfb1:99c3 with SMTP id a640c23a62f3a-ab7bfb1a9d4mr534420666b.53.1739203658803;
        Mon, 10 Feb 2025 08:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLUgPZe8+WVFOm7+M26Lip/0MK3cHsXrNGEsuLT+IXXY6SoDI7mvOVYZYpW3234IkyWlg3Hg==
X-Received: by 2002:a17:906:dc90:b0:ab7:bfb1:99c3 with SMTP id a640c23a62f3a-ab7bfb1a9d4mr534415266b.53.1739203658299;
        Mon, 10 Feb 2025 08:07:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d9ca16dasm2302466b.180.2025.02.10.08.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:07:37 -0800 (PST)
Message-ID: <6b472224-0789-46c8-bfd0-7c1c4ea67246@redhat.com>
Date: Mon, 10 Feb 2025 17:07:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/17] media: uvcvideo: Implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Scally <dan.scally@ideasonboard.com>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 3-Feb-25 12:55 PM, Ricardo Ribalda wrote:
> This patchset implements UVC v1.5 region of interest using V4L2
> control API.
> 
> ROI control is consisted two uvc specific controls.
> 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> 2. An auto control with type bitmask.
> 
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
> 
> The corresponding v4l-utils series can be found at
> https://patchwork.linuxtv.org/project/linux-media/list/?series=11069 .
> 
> Tested with v4l2-compliance, v4l2-ctl, calling ioctls on usb cameras and
> VIVID with a newly added V4L2_CTRL_TYPE_RECT control.
> 
> This set includes also the patch:
> media: uvcvideo: Fix event flags in uvc_ctrl_send_events
> It is not technically part of this change, but we conflict with it.
> 
> I am continuing the work that Yunke did.
> 
> Changes in v17:
> - Rebase on latest media-committers/next
> - Link to v16: https://lore.kernel.org/r/20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org

Thank you for the rebased series.

I've merge the entire series into:
https://gitlab.freedesktop.org/linux-media/users/uvc/ -next now.

Regards,

Hans







> Changes in v16:
> - add documentation
> - discard re-style
> - refactor -ENOMEM
> - remove "Use the camera to clamp compound controls"
> - move uvc_rect
> - data_out = 0
> - s/max/min in uvc_set_rect()
> - Return -EINVAL in uvc_ioctl_xu_ctrl_map instead of -ENOTTY.
> - Use switch inside uvc_set_le_value.
> - Link to v15: https://lore.kernel.org/r/20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org
> 
> Changes in v15:
> - Modify mapping set/get to support any size
> - Remove v4l2_size field. It is not needed, we can use the v4l2_type to
>   infer it.
> - Improve documentation.
> - Lots of refactoring, now adding compound and roi are very small
>   patches.
> - Remove rectangle clamping, not supported by some firmware.
> - Remove init, we can add it later.
> - Move uvc_cid to USER_BASE
> 
> - Link to v14: https://lore.kernel.org/linux-media/20231201071907.3080126-1-yunkec@google.com/
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Hans Verkuil (1):
>       media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
> 
> Ricardo Ribalda (10):
>       media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
>       media: uvcvideo: Handle uvc menu translation inside uvc_set_le_value
>       media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
>       media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls: handle NoP case
>       media: uvcvideo: Support any size for mapping get/set
>       media: uvcvideo: Factor out clamping from uvc_ctrl_set
>       media: uvcvideo: Factor out query_boundaries from query_ctrl
>       media: uvcvideo: let v4l2_query_v4l2_ctrl() work with v4l2_query_ext_ctrl
>       media: uvcvideo: Introduce uvc_mapping_v4l2_size
>       media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
> 
> Yunke Cao (6):
>       media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>       media: vivid: Add a rectangle control
>       media: uvcvideo: add support for compound controls
>       media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
>       media: uvcvideo: implement UVC v1.5 ROI
>       media: uvcvideo: document UVC v1.5 ROI
> 
>  .../userspace-api/media/drivers/uvcvideo.rst       |  64 ++
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |  26 +-
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst   |  14 +
>  .../userspace-api/media/videodev2.h.rst.exceptions |   4 +
>  drivers/media/i2c/imx214.c                         |   4 +-
>  drivers/media/platform/qcom/venus/venc_ctrls.c     |   9 +-
>  drivers/media/test-drivers/vivid/vivid-ctrls.c     |  34 +
>  drivers/media/usb/uvc/uvc_ctrl.c                   | 799 ++++++++++++++++-----
>  drivers/media/usb/uvc/uvc_v4l2.c                   |  77 +-
>  drivers/media/usb/uvc/uvcvideo.h                   |  25 +-
>  drivers/media/v4l2-core/v4l2-ctrls-api.c           |  54 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          | 167 ++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +-
>  include/media/v4l2-ctrls.h                         |  38 +-
>  include/uapi/linux/usb/video.h                     |   1 +
>  include/uapi/linux/uvcvideo.h                      |  13 +
>  include/uapi/linux/v4l2-controls.h                 |   7 +
>  include/uapi/linux/videodev2.h                     |   5 +
>  18 files changed, 1058 insertions(+), 287 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241113-uvc-roi-66bd6cfa1e64
> 
> Best regards,

