Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D513D539
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 04:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751344823; cv=none; b=svY83VfbsvdVON44kfxJsh7yN+fta5SSo5ci2wVjGUJH1dQQ8WgUC2ggzDVkPOzh5OKrskTpQJ5g7Daz1/BsyqM2WOIanFHxPhrcxjVFogwbQMk+OSzmFg6IuWodGkuTOSqq7wZMk7cC32IceZxUPcrG7aQDhmC2fmpS/xaDSlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751344823; c=relaxed/simple;
	bh=CYmy2H6dallMLWHK/Xm8cQj0mMftS1YKv0q1HOUJcE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9/QHvUFJAWxM3wyzs4tlbKZ9uSJnmYFFgY4UL/SteyFYFcdLIswMnGO/XtmosQx8XDDC5Ocyanl43uC8Br9JDCG5PenhNWwhwaHnb81uH0HKhesvxIboea9QsJwrZ6GRpb+vtext0uhPzBr6VaoI69T+T03LIMv3uUwl4E5b90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DDbEIsbN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DDbEIsbN"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3124910e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 21:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751344820; x=1751949620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ttKaGOM1HLHnoSRZq1EsamPtO7ym6WKYXwUSXbl5tM=;
        b=DDbEIsbNmO2zh+/dXij8l9OLF3FjuWdzMHDmv9V2waTcPl2GbwojiKPfmMq9v7DJNS
         zlnq63y61kw4ru8o5xT+zpnq21hghTWedRaOEEbFP9B2+Y57Ujf7QoNmJPOTxaOmiPU6
         eRrLRlJlGgxL/PvggfUTpGo4d4TNB+yVG7FtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751344820; x=1751949620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ttKaGOM1HLHnoSRZq1EsamPtO7ym6WKYXwUSXbl5tM=;
        b=C9i20umpeXvA3vkJgKFj2T8eFSPf8/zLd42RVeGmYPu097XW0um61WGhi2kJFuqPAv
         3Al25YxE1YEnD68WMNmzLTfWssG3yJcRi1KWtSczIk6eiu2qdOQ3JBwz6wd8k0hsnN3B
         SOOGQrPRD3Hgjbwlicx6DHF3DzLDETotv+YKgQf1nOeLmOWz+EN+xCXMhg34/N7Jh4iU
         ySxl42jg8TJJbvEQ+pKlK7AjK1VdXC5qTSj4JEXy7HhaLTZGvJxJxMwouljaozU3W7+J
         hJ/p608mJYk++VZLT2VgxQB/AR1uiIv0PDLtZRki9WrMySxbQbKrfkrcuV5q8a4RNS9E
         6s7g==
X-Forwarded-Encrypted: i=1; AJvYcCVD4Lj4UIQLO4J87uu5sr8LuGDtqHkpzR75Jjcuk33UQC5cZXeOsN+0/xZlJv888b+Fq3zn/kisFFciPTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMtdHQCodi/Ba4wHRcJcWODb7mDiA+ukXBFnpB3TEqmP2gwHT
	6i525jyPEqTtGv4/uBZz4TnudHwC3Sm0r8WGVRZc8yINkxKoNsYFEibhHOI0KK3MY0PF1qtJSPr
	2rtarEg==
X-Gm-Gg: ASbGnct3GHIgUIJ3qWiFYwVTmvWtuXI4P9626tBdQCdmu/TEvbDJSxGeJuT9HgEq2I4
	GRnJsfARGN5qEBiP0avBYFbL3/sMm3hOJAB22CV/k/b5hFj7IM1Icna1KKc6Ah9Q6nlqTK/KnJl
	WF/s6aIaxfo6Eh8L+lnRSBaEHHoimKTXyLoEAowqK3hq3o2VIhlhLcRjfRdqwV7vYyihV9xIRps
	oNxFjERd/Ya5z6QRMnEwk5wZPUlu0mPU7oMtLYig6xs3vGo/wUotK6qkQJd+l0L6tcXPVHdu2XM
	6/KnLXZh/7dK9UuYyEPr6DYm+iN18a+kDrr8limBOfVwVaYkqjhhX0RYbbm+TwILRm7PZcaGlQH
	bOAJGUYWr7UQYNSZN4Kv48SBi
X-Google-Smtp-Source: AGHT+IEG4fXPqzSe/dbzKpy9xFuVdFDchCzbDgEIHbA/vLAKQoAj/9lAE/X74tocfFVulyZYkGb8Jg==
X-Received: by 2002:a05:6512:318f:b0:553:2868:6362 with SMTP id 2adb3069b0e04-5550b8b0f0emr4540081e87.26.1751344819771;
        Mon, 30 Jun 2025 21:40:19 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d9e35sm1655854e87.216.2025.06.30.21.40.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 21:40:19 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3124903e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 21:40:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0eDdOg/EdQg9JDOkct508SKUVn2DnR8umO68dYRBp4sYuzI9e5cr91lIXX8yOsT0iOSgAHog3m1MBOlU=@vger.kernel.org
X-Received: by 2002:a05:6512:6d0:b0:553:2def:1ae8 with SMTP id
 2adb3069b0e04-5550b8b0b26mr4937295e87.30.1751344818626; Mon, 30 Jun 2025
 21:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
 <20250630-uvc-grannular-invert-v3-6-abd5cb5c45b7@chromium.org> <20250630221439.GB15184@pendragon.ideasonboard.com>
In-Reply-To: <20250630221439.GB15184@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 06:40:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCvhqp-m6=Tijrk77KpHAQJV3XA5WpbYmprwhQaTsikwdg@mail.gmail.com>
X-Gm-Features: Ac12FXwBINTRyFxGvfZfPUmWTCRuWET0Fgjjg3b8Tw-xFADZ51wdeV9Hi008xwg
Message-ID: <CANiDSCvhqp-m6=Tijrk77KpHAQJV3XA5WpbYmprwhQaTsikwdg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] media: uvcvideo: Do not enable camera during UVCIOC_CTRL_MAP*
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, 1 Jul 2025 at 00:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Jun 30, 2025 at 02:20:31PM +0000, Ricardo Ribalda wrote:
> > The device does not need to be enabled to do this, it is merely an
> > internal data operation.
>
> How about the following code path ?

Ups, thanks for catching this.

I will probably rename uvc_ctrl_add_mapping() to
uvc_ctrl_add_xu_mapping() in a future set.

Regards!

>
> uvc_ioctl_xu_ctrl_map()
>   uvc_ctrl_add_mapping()
>     uvc_ctrl_init_xu_ctrl()
>       uvc_ctrl_fill_xu_info()
>         uvc_query_ctrl()
>
> ?
>
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff..350cd2cc88f872d2e8bd19e2b8fb067894916364 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1178,10 +1178,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >       void __user *up = compat_ptr(arg);
> >       long ret;
> >
> > -     ret = uvc_pm_get(handle->stream->dev);
> > -     if (ret)
> > -             return ret;
> > -
> >       switch (cmd) {
> >       case UVCIOC_CTRL_MAP32:
> >               ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> > @@ -1197,9 +1193,15 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >
> >       case UVCIOC_CTRL_QUERY32:
> >               ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
> > +             if (ret)
> > +                     break;
> > +
> > +             ret = uvc_pm_get(handle->stream->dev);
> >               if (ret)
> >                       break;
> >               ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
> > +             uvc_pm_put(handle->stream->dev);
> > +
> >               if (ret)
> >                       break;
> >               ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
> > @@ -1212,8 +1214,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >               break;
> >       }
> >
> > -     uvc_pm_put(handle->stream->dev);
> > -
> >       return ret;
> >  }
> >  #endif
> > @@ -1226,6 +1226,7 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >
> >       /* The following IOCTLs do not need to turn on the camera. */
> >       switch (cmd) {
> > +     case UVCIOC_CTRL_MAP:
> >       case VIDIOC_CREATE_BUFS:
> >       case VIDIOC_DQBUF:
> >       case VIDIOC_ENUM_FMT:
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
