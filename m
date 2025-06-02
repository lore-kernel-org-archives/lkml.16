Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E8BE6C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748860088; cv=none; b=Fhk4ZDZCrk6fkr4FPRlmq1DaMhiG+H8sHYNTRV/rMk9FNGqjCgTo+V5UMArCtxxa5SKgcQpYH15nlRH2ZFbBlfijeS8+UB6TQJBkVVBVx26jaEIqUnkpCW7zWxspontQiTeGUmvGu6KhjleZcu6FA7Wm4sNoaSmDFrZ+aat+vtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748860088; c=relaxed/simple;
	bh=Z1Oaw9PYh4rAiOMggpsLlXotaotYo6wDSbLMVBxFYnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVrboi5JpbDOb/h9PBRkr6dJAAoXgkxoB/5OkYxPcZB9E2z1uGVc1ahcNKi5SBh3uKWdQQ/Zzp2/FcWC3BYtev5QvVf33WHOKvtBSSXLp7jWq+cGbrvMSNr2YdGo7inDKM5Gj2oX62ATyuGTyh985jSui1CsF9O1N++EqFQD4Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ehE0AqZk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ehE0AqZk"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-551efd86048so5006024e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748860085; x=1749464885; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3eFHenNabcyPxNBLH8XYBq5FpRR6YY+YC341Og5xruM=;
        b=ehE0AqZkXst1LOr0+14tbi7/k/EnFQv/qzn9CSgOjWgqL1zMGvi+Ihofr/MJHKpXFB
         lxtTYETFMnUvwGuFJsYL7I9KYsUOYgpO96hnxDlF9cvaR3HHxFSaxh8yvX+FPP/ZRR4A
         s0LpYHsWAutBBhnitv+natrFeuZB1UQDRzUBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860085; x=1749464885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eFHenNabcyPxNBLH8XYBq5FpRR6YY+YC341Og5xruM=;
        b=eQpvLdLec1u4hV7mrkRaXpxfn6sivbmBU3P5zrJexBFW4vnxwub+EDTH+FtS9omnOW
         LWn84JkPUzi9b8+sQqMpk30voTVkV4ihte/RNQiylZ82T00ZMPFZgObk9vpzIFLwzZOV
         YiMEn+ugdAzuLlgyE4TxbEtEowFaG5oCqKjV4Pp5+k/seSbUIe1SVeZHTThX0xg0GVD1
         SCmFQC5o3SKpIK35vdHmX8+SKOM4hcdxebh/s61oNpueB8ecnxXuNp4cryhLinhFDc4J
         xQjPIoqpU8PReWF5vbnaXfigFWwluXgRiXo13TCYv7I9QaNxxMhKyErBsp/PIeX9NBWi
         WXYg==
X-Forwarded-Encrypted: i=1; AJvYcCWA2I5FE+NxAfqPMHj8UvguMJn23nGl7GMosK2f/L8X3OLzcaKVQjIxqUVUzoIhqbe1mdrCTYELKKYXXDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3LlH8MYSWFqL62Y3ZMIgXuFRS90DjhBQjkMuXoYhoShz1go/U
	Z5XDzMdcbz9wYvF3AVo2juYXsuAuoXgiGGzD9Xv/Kg1ZHkhHiFMTPxjnloJ38rXggKfuFNiwCwv
	D11A=
X-Gm-Gg: ASbGncvHWB8JaJxnBnMADz2tfz5M2OAJvORcZ2EkNpBgzda0gaO86kd4dYWIrjKroBx
	OBBy4pS0549COyW7N26IVB/MxSm2KATCng9GGxezG+MiCon02a3jBFlgihRT/wOgXXLsw2SnEZh
	jr9o7dliC+KyIvqb94eJzvo/YvVVsYMecXlPqDBrL4Gp6TWaAmsfR7q5jfvLlqmOy8j/LYTitQU
	a0biNBK3Icv40D5SuBz7hmzvhyQGSy/apMqXKTYSj1EMd1G0MAGWkFaUO8V4TmfYNM+dq3WF7XU
	W6IMe9/asq9e+ZnJIPp+VdQADbM9pxg7XUBbtGCZFD9Bk6jrjIOy3YVClFDIIpd/k/6sXeSCPxY
	gL0xHSHCUZ0ex6nOxzcnlyjVx
X-Google-Smtp-Source: AGHT+IFksKEJA8tsp+T8V83nQ56Y70qNYvTRPRKXliU++iXpwoGJmH0wd15p0MpCx/p1nEHEgK+4Ew==
X-Received: by 2002:a05:6512:690:b0:553:2f8c:e615 with SMTP id 2adb3069b0e04-5533d16100amr2988676e87.11.1748860084658;
        Mon, 02 Jun 2025 03:28:04 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910313sm1545345e87.111.2025.06.02.03.28.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 03:28:03 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55350d0eedeso140070e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 03:28:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNtx4XZyFNyOy70mCMsM8LCl36igE4ZwEiRqYLHfwdORo1sIUNSUPe7ugoZg254UPXjPRg6Q3zoY7bxSQ=@vger.kernel.org
X-Received: by 2002:a05:6512:224c:b0:553:36b7:7b09 with SMTP id
 2adb3069b0e04-5533d1c7bedmr3190132e87.54.1748860082823; Mon, 02 Jun 2025
 03:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org> <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org>
In-Reply-To: <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 12:27:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
X-Gm-Features: AX0GCFuWZkQQBhJx8R0DIICEHhbKF2Pg_-NYAADMPgrknh4YsG2c63DBYFa185s
Message-ID: <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 2 Jun 2025 at 12:11, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 28-May-25 19:58, Ricardo Ribalda wrote:
> > Right now we cannot support granular power saving on compat syscalls
> > because the VIDIOC_*32 NRs defines are not accessible to drivers.
> >
> > Use the video_translate_cmd() helper to convert the compat syscall NRs
> > into syscall NRs.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
> >  include/media/v4l2-ioctl.h           | 1 +
> >  3 files changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
> >  static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >                                   unsigned int cmd, unsigned long arg)
> >  {
> > -     /*
> > -      * For now, we do not support granular power saving for compat
> > -      * syscalls.
> > -      */
> > -     if (in_compat_syscall())
> > -             return uvc_v4l2_pm_ioctl(file, cmd, arg);
> > +     unsigned int converted_cmd = video_translate_cmd(cmd);
>
> It looks like something went wrong here and you did not test-compile this?
> video_translate_cmd() is private to drivers/media/v4l2-core/v4l2-ioctl.c
> so this should not compile.

Hmm... Actually I am pretty sure that I tested it on real hardware.

Did you miss the EXPORT_SYMBOL() on the patch?

>
> You can use v4l2_compat_translate_cmd() but only when CONFIG_COMPAT is set
> otherwise that symbol is not available.

I tried now without CONFIG_COMPAT and it built fine.

>
> Regards,
>
> Hans
>
>
>
> >
> >       /* The following IOCTLs do need to turn on the camera. */
> > -     switch (cmd) {
> > +     switch (converted_cmd) {
> >       case UVCIOC_CTRL_QUERY:
> >       case VIDIOC_G_CTRL:
> >       case VIDIOC_G_EXT_CTRLS:
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
> >       return ret;
> >  }
> >
> > -static unsigned int video_translate_cmd(unsigned int cmd)
> > +unsigned int video_translate_cmd(unsigned int cmd)
> >  {
> >  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
> >       switch (cmd) {
> > @@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
> >
> >       return cmd;
> >  }
> > +EXPORT_SYMBOL(video_translate_cmd);
> >
> >  static int video_get_user(void __user *arg, void *parg,
> >                         unsigned int real_cmd, unsigned int cmd,
> > diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> > index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
> > --- a/include/media/v4l2-ioctl.h
> > +++ b/include/media/v4l2-ioctl.h
> > @@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
> >  int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
> >                              void *mbuf, size_t array_size,
> >                              unsigned int cmd, void *arg);
> > +unsigned int video_translate_cmd(unsigned int cmd);
> >
> >  /**
> >   * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.
> >
>


-- 
Ricardo Ribalda
