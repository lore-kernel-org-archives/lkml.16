Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B4C1B412A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862702; cv=none; b=czYqIpxXUPbiDdBUokJBUumxRXINP4K8vAhk7LRx+5iz13aAsyropr10FZO0QNj6UqybOc2NmVJsAjUWWNlvGGJBU9miWhZCamPtmNM+JYrC8oIO4pwJSRmvEmJVVpxCxJo3AeUYEcxJlSoJD7cEe7Nmajg42zyl1AQ+jylCF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862702; c=relaxed/simple;
	bh=hNdnuh44B/F1hjK+F9l0HSaJdSwmz3eC9NCNEdhciPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0AOa+uab2v+JwUAxxTHlWqHKb9QRVMAsQfGhag+hDr5e7iPCUDp7rrTT/wQ59HWD+60FX+t8XiUHJQExAxE56brqyAVNWtStgmxmcZxjWI9Y7//v5HwgJT9EkSWaamHhu4xVdj0ns4q/NS/0v1NUjkpPP2FAOzg9foH9mjwFzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oTzhP6Sp; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oTzhP6Sp"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3105ef2a071so48915831fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748862698; x=1749467498; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IVIFALh9arlZ0GzLjKlBZ0OasfOj5lZdM76le7bw4Bc=;
        b=oTzhP6SpAcJYDWgV6eE7XqfNG1ZECPT7Q7CwcRrasaHnhZYu/43nNS/loTXVPdo3+O
         qawCAUJaBABVuiHd2dC7WuKkPyal+gbwlJtelKEDUz+7X9xKnVsK/ji90mvf1KQ3oYP7
         cCIOMwkO1P5umTvH5gF8PScr4QKcUjcWueww8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748862698; x=1749467498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVIFALh9arlZ0GzLjKlBZ0OasfOj5lZdM76le7bw4Bc=;
        b=CMvbmqHWmVLr/9fekah3kWfyAHnF7ikFxF/J5G1hKlgTJ1Xv5rnVMUwjQm8kzXnm89
         T6KcoaRFP7eP/FZnfwEQ6Dq+yD0b7xYsqEGLqGTBuFK3bBYva+Bne1rNceMYqWsLin7A
         3DVWttctm05/0Du9fqfMBDxny0ZVJPRAvL0/jAOyflKF7AvxxLV92BP2XFbOYSwn3/NU
         TKi7SFx6EkgR2Hgs6jvI9WZDTA+lMdTEEHitQK1GjOEwAtboQgkhBajtP4WWs72hp4mz
         KJCufEZ2CyOibI0c2cp9YYxZSDg70AwXPehZXYpenPUe44MBfXK0PJ5WiileywlgWBKP
         F4xw==
X-Forwarded-Encrypted: i=1; AJvYcCWwHyml5zSjtFnN6ss9RpGAa0ICULG7cjtgft9Ns3/zj/7DYj3JDJ/SblHPZqpa8EOi2d0ltZM8B5j7+yM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ9uW65BCs1e6Z1EbHmd76i1aVtWLU4/js6RQgvVX1OA2vLaJk
	tDriSZpoOH8gPv5Rx32cDLXHvfP/r/T4gjWCl10PARq1+k1+z9q6poESXWkFGH1ak2J2YuKIAWJ
	MmWU=
X-Gm-Gg: ASbGncuuU8hxM0PwKWbVqlb8DgC0x2GD7SnKAM7Z+Y7tGgCM0esH8RLeduFAMKv2o0M
	uCforhIu1dteeLaUwcT87jL/VN6/+m4CwK5G8CyDKw1mnt5vMCaU36KVI+XssbQfRPikYcEkd1W
	q9zSF9jRGJXzN3/PniL7wxCO2Ao6tOxM0N3hc92Vvh+m/8nC5uIckhZ7wahpCZR+x287P1JGe8/
	EGKebi08A4Surutl2J6GWLgsLRoRJAg6FfgIo0d2n1qiUGsPmid12C8Y7UJY57d7CuKHHmvAEQj
	ubjcZXIXyfrgZS1UHut1z5Yo9OefMZjlTktbciTSO/9Hz9M83+hO41cM2Pe72cldyctmqcBJYsR
	dmDYHOA3rPEwW9Q==
X-Google-Smtp-Source: AGHT+IGUyE/nTabYHpVulXFVhOGVdjAp8T3fwkyCkfljpDtzy2rHX53F9l8kWIcPEXsbk1v3zQEYKw==
X-Received: by 2002:a05:651c:4206:b0:32a:7386:ca13 with SMTP id 38308e7fff4ca-32a907b6b0cmr30288631fa.22.1748862697878;
        Mon, 02 Jun 2025 04:11:37 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b1a86csm14746251fa.12.2025.06.02.04.11.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 04:11:27 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5534edc646dso463911e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 04:11:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkDXAK5jkS37ipvx7jnl40XbvuETxmOlVJfgHKnlGnvgxbqYHPTKMBC0Y2TPJ2eQGqZPS4PzsgOakdUDM=@vger.kernel.org
X-Received: by 2002:a05:6512:158e:b0:553:291f:92d with SMTP id
 2adb3069b0e04-5533d1b9382mr3248824e87.57.1748862686655; Mon, 02 Jun 2025
 04:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
 <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org> <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
 <b88a8847-6e19-4d5e-a847-5deee69ab7b4@kernel.org>
In-Reply-To: <b88a8847-6e19-4d5e-a847-5deee69ab7b4@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 13:11:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCsXNu2xa_ATGUJbKY_t7xxXgSGdpZMf+P4LT+x3qcP1tg@mail.gmail.com>
X-Gm-Features: AX0GCFtWelR45Zu24ZuT095kB3Y-gdxCQlx3vPsZ1dozrH4C2vT7gf0b3-vwRzk
Message-ID: <CANiDSCsXNu2xa_ATGUJbKY_t7xxXgSGdpZMf+P4LT+x3qcP1tg@mail.gmail.com>
Subject: Re: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 13:07, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 2-Jun-25 12:27, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Mon, 2 Jun 2025 at 12:11, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 28-May-25 19:58, Ricardo Ribalda wrote:
> >>> Right now we cannot support granular power saving on compat syscalls
> >>> because the VIDIOC_*32 NRs defines are not accessible to drivers.
> >>>
> >>> Use the video_translate_cmd() helper to convert the compat syscall NRs
> >>> into syscall NRs.
> >>>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
> >>>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
> >>>  include/media/v4l2-ioctl.h           | 1 +
> >>>  3 files changed, 5 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> >>> index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
> >>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >>> @@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
> >>>  static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >>>                                   unsigned int cmd, unsigned long arg)
> >>>  {
> >>> -     /*
> >>> -      * For now, we do not support granular power saving for compat
> >>> -      * syscalls.
> >>> -      */
> >>> -     if (in_compat_syscall())
> >>> -             return uvc_v4l2_pm_ioctl(file, cmd, arg);
> >>> +     unsigned int converted_cmd = video_translate_cmd(cmd);
> >>
> >> It looks like something went wrong here and you did not test-compile this?
> >> video_translate_cmd() is private to drivers/media/v4l2-core/v4l2-ioctl.c
> >> so this should not compile.
> >
> > Hmm... Actually I am pretty sure that I tested it on real hardware.
> >
> > Did you miss the EXPORT_SYMBOL() on the patch?
>
> Ah yes I did miss that, sorry.

My bad, I doubt it till the last second if I should split it or not :)

>
> For the next time please split core changes out into their own
> separate patches.
>
> In this case I think the core changes are not necessary instead
> you can just do:
>
>         unsigned int converted_cmd = cmd;
>
> #ifdef CONFIG_COMPAT
>         converted_cmd = v4l2_compat_translate_cmd(cmd);
> #endif

I believe this should work as well:

unsigned int converted_cmd = cmd;
if (in_compat_syscall())
  converted_cmd = v4l2_compat_translate_cmd(cmd);

the compiler knows that CONFIG_COMPAT=n means in_compat_syscall() will
be always fails.

If it is ok with you (and it actually works :) ) I will use this version.

Regards

>
> Regards,
>
> Hans
>
>
>
>
> >
> >>
> >> You can use v4l2_compat_translate_cmd() but only when CONFIG_COMPAT is set
> >> otherwise that symbol is not available.
> >
> > I tried now without CONFIG_COMPAT and it built fine.
> >
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>>
> >>>       /* The following IOCTLs do need to turn on the camera. */
> >>> -     switch (cmd) {
> >>> +     switch (converted_cmd) {
> >>>       case UVCIOC_CTRL_QUERY:
> >>>       case VIDIOC_G_CTRL:
> >>>       case VIDIOC_G_EXT_CTRLS:
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
> >>>       return ret;
> >>>  }
> >>>
> >>> -static unsigned int video_translate_cmd(unsigned int cmd)
> >>> +unsigned int video_translate_cmd(unsigned int cmd)
> >>>  {
> >>>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
> >>>       switch (cmd) {
> >>> @@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
> >>>
> >>>       return cmd;
> >>>  }
> >>> +EXPORT_SYMBOL(video_translate_cmd);
> >>>
> >>>  static int video_get_user(void __user *arg, void *parg,
> >>>                         unsigned int real_cmd, unsigned int cmd,
> >>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> >>> index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
> >>> --- a/include/media/v4l2-ioctl.h
> >>> +++ b/include/media/v4l2-ioctl.h
> >>> @@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
> >>>  int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
> >>>                              void *mbuf, size_t array_size,
> >>>                              unsigned int cmd, void *arg);
> >>> +unsigned int video_translate_cmd(unsigned int cmd);
> >>>
> >>>  /**
> >>>   * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.
> >>>
> >>
> >
> >
>


-- 
Ricardo Ribalda
