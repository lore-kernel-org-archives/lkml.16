Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BF22A7F4
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997930; cv=none; b=sCOtLnt0G4iF1/WRrFtW2gCI01IdkrM02ZRW8bB7PBnY+GckMBgcshgRCIeJBCjrHPiaAzVpfgriyrWpdctIggppdHtkB/EjxBNyWCftkl48t/+B3whCw/NeY1z97RPF4VXdo5vAM/MZYjs+Ky22i4zCrEdzs8gS67ND7QemX9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997930; c=relaxed/simple;
	bh=+7x8E4JVOl0BMoLyN3u4e+/xsogRji2QWQnJHu10K9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8Y8zYo8aFCXgVLbkDyTRPZ91GP3BjD0p+A9SCw/jrlcTGJgVsOdsmyYPIhxXpyrKqNTRtTieIY9obDRRInzlpB7ycRm905DtC5a2pHhjcg1tzZRHrZEgwtooStgXiEhkHByoqDjNQ/zPixGSshijpe+yeMNqJd7lV2ostQWmGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBbPu1z3; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBbPu1z3"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so11314675e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747997927; x=1748602727; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71mj/4e4v16Jj1WjDwVwI/Op91TJ/LzlHRMMlGe5K4o=;
        b=aBbPu1z36MFhVfPxOgZzvxGYUUPXbzP9pPZuBymaElH8/dwJfwifRtD7/R+zqj9OVA
         AXE0wt23ocCcaInGG+FB0japNXtHNaL7KDVE85WitlXzJ5zFuqY2KXdpXdWt+TdGPsiE
         vx0Yur0kxogFSva+Y9p9WRgC944A7JmwGMLy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997927; x=1748602727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71mj/4e4v16Jj1WjDwVwI/Op91TJ/LzlHRMMlGe5K4o=;
        b=fti+D60cUuOng5FjyAbrBbhVspXcSEPxZ/FwVqZZfqdAnnaP7r2yhv83eWr0FgBbYk
         rumTQYU7dmgvTVvVCKyZC2Hk7x/egZgwWYUtryMHall+kQyVHjjq1GIGUzhr4NOWi5oC
         Wj2lwUsEAVMVIxwxWqp0U4CwlBPhY6Qxe2RAi7FLoJC7OOEq8MBavZ7RBvsf2IQWcit8
         llXKvV+NF6iCyguJRCdZqgzF0LHgyunNbQmOICW7uYA3Fw5znAetE4q0xiS+baveznDY
         Tt1HJ/NiBGPHN8VQhkLChCpvPSVqeaTF2SfS0Y9p1fmWFv55B1OeqxsVhjLc97L/nI6X
         YLow==
X-Forwarded-Encrypted: i=1; AJvYcCW2stVzrsEvAuoi90oPkZBTgXGYi7aqh9uQVgjiMncJIcIV75MCEUnaC7MsnTpypZsU79OElRgIsQKuQtI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/RoMY6XSKozblx8+x3S3+bmrrW59K5xxzcoyFb2OyIhdbXVnN
	r9vO8PqnLqFh2acxE/lGdL4eMksLB5XtFftVtkTWjbOHuaaVlHd4IHz7FurtrAVLTmfbZAhA6jm
	Y3G3oig==
X-Gm-Gg: ASbGncuLT6aUPMvROOheGN2Vf20kfqE4VBYexGALleCGKx0chvN9dUm1THm7FC/7sc9
	SIRZWjNVn7ZEL15sfVTHL6kOwx/K1IujPaKGskWt/ELx8UGPURwCcxZfg2vdlfeyJbEGoht7UIi
	3QQKMYkKWHPTXOAyLRaf+Tkjs6nP1c2Mk4Y8vo2uhR7ZoFfYYfutF4vtFTiWcMDZsY09KpgJjYa
	vpHfZ6L0BOIG0I1vkiWZzC+gtaMhbo1XlwDdI5aOi4W/MoUWQ6hR3m65G+m+yDwDQ5UnG0hhBR6
	1+McwNcX7tXJMd2+yhrAUg/4LECI49Rt5loqWfXJ+QuPqpOuGPwko0b597+J7+ZWpiBU2yA+261
	DXNmkR+VS3ILRSzVajDy4SR+G
X-Google-Smtp-Source: AGHT+IECEPovqRDeBSYKfnY36X2J6Zc/yzXhGc5YG/4w9afZ88H1rNnX8MLpkF5wz078qnkeJ8fbJw==
X-Received: by 2002:a05:6512:3e04:b0:550:de26:1f23 with SMTP id 2adb3069b0e04-550e71bb785mr11471088e87.16.1747997926661;
        Fri, 23 May 2025 03:58:46 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c334sm3788333e87.213.2025.05.23.03.58.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:58:46 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so11314657e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRSQzV6lNdp8oGyoQqBTeD4HvLtS2Mx0rJ/VK6GcYmGaZIWw7cA3fXxuVVSkoxdVxE6W/Y9FcB/V8UDAA=@vger.kernel.org
X-Received: by 2002:a05:6512:159f:b0:550:e575:3923 with SMTP id
 2adb3069b0e04-550e71b667amr9786746e87.15.1747997925442; Fri, 23 May 2025
 03:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org> <20250523085341.GA7516@pendragon.ideasonboard.com>
In-Reply-To: <20250523085341.GA7516@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 12:58:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCuuaJ9AOr9nGc+GN5UhHs2b0CCZvEnF1Qdw2vn9yo_uXw@mail.gmail.com>
X-Gm-Features: AX0GCFtscgEu8lGhLD0b0uVltUbbjyvKq2QaZ5IbmNBRKIs4PPY0XzwdFe1MRdE
Message-ID: <CANiDSCuuaJ9AOr9nGc+GN5UhHs2b0CCZvEnF1Qdw2vn9yo_uXw@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: uvcvideo: Refactor uvc_ctrl_set_handle()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 23 May 2025 at 10:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, May 09, 2025 at 06:24:13PM +0000, Ricardo Ribalda wrote:
> > Today uvc_ctrl_set_handle() covers two use-uses: setting the handle and
> > clearing the handle. The only common code between the two cases is the
> > lockdep_assert_held.
> >
> > The code looks cleaner if we split these two usecases in two functions.
>
> It does indeed. Thanks for pushing for this :-)
>
> > We also take this opportunity to use pending_async_ctrls from ctrl where
> > possible.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 65 +++++++++++++++++++++-------------------
> >  1 file changed, 35 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 44b6513c526421943bb9841fb53dc5f8e9f93f02..26be1d0a1891cf3a9a7489f60f9a2931c78d3239 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1812,48 +1812,53 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
> >       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> >  }
> >
> > -static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > -                            struct uvc_fh *new_handle)
> > +static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> >  {
> > -     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > -
> > -     if (new_handle) {
> > -             int ret;
> > +     int ret;
> >
> > -             if (ctrl->handle)
> > -                     dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> > -                                          "UVC non compliance: Setting an async control with a pending operation.");
> > +     lockdep_assert_held(&handle->chain->ctrl_mutex);
> >
> > -             if (new_handle == ctrl->handle)
> > -                     return 0;
> > +     if (ctrl->handle) {
> > +             dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> > +                                  "UVC non compliance: Setting an async control with a pending operation.");
> >
> > -             if (ctrl->handle) {
> > -                     WARN_ON(!ctrl->handle->pending_async_ctrls);
> > -                     if (ctrl->handle->pending_async_ctrls)
> > -                             ctrl->handle->pending_async_ctrls--;
> > -                     ctrl->handle = new_handle;
> > -                     handle->pending_async_ctrls++;
> > +             if (ctrl->handle == handle)
> >                       return 0;
> > -             }
> > -
> > -             ret = uvc_pm_get(handle->chain->dev);
> > -             if (ret)
> > -                     return ret;
> >
> > -             ctrl->handle = new_handle;
> > -             handle->pending_async_ctrls++;
> > +             WARN_ON(!ctrl->handle->pending_async_ctrls);
> > +             if (ctrl->handle->pending_async_ctrls)
> > +                     ctrl->handle->pending_async_ctrls--;
> > +             ctrl->handle = handle;
> > +             ctrl->handle->pending_async_ctrls++;
> >               return 0;
> >       }
> >
> > +     ret = uvc_pm_get(handle->chain->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctrl->handle = handle;
> > +     ctrl->handle->pending_async_ctrls++;
> > +     return 0;
> > +}
> > +
> > +static int uvc_ctrl_clear_handle(struct uvc_fh *handle,
> > +                              struct uvc_control *ctrl)
> > +{
> > +     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > +
> >       /* Cannot clear the handle for a control not owned by us.*/
>
> While at it, I'll add a space before */ when applying.
>
> >       if (WARN_ON(ctrl->handle != handle))
> >               return -EINVAL;
>
> But actually, as the caller guarantees that handle == ctrl->handle in
> both call sites (renaming the function makes this clear), can we drop
> the handle argument to this function ?
>
> If that's fine with you, I'd like to also change the
> uvc_ctrl_set_handle() function to pass the ctrl argument first.

SGTM, let me know if you have time to do this or if you prefer that I do it.

Cheers


>
> >
> > -     ctrl->handle = NULL;
> > -     if (WARN_ON(!handle->pending_async_ctrls))
> > +     if (WARN_ON(!ctrl->handle->pending_async_ctrls)) {
> > +             ctrl->handle = NULL;
> >               return -EINVAL;
> > -     handle->pending_async_ctrls--;
> > +     }
> > +
> > +     ctrl->handle->pending_async_ctrls--;
> >       uvc_pm_put(handle->chain->dev);
>
> This will need to become
>
>         uvc_pm_put(ctrl->handle->chain->dev);
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +     ctrl->handle = NULL;
> >       return 0;
> >  }
> >
> > @@ -1871,7 +1876,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >
> >       handle = ctrl->handle;
> >       if (handle)
> > -             uvc_ctrl_set_handle(handle, ctrl, NULL);
> > +             uvc_ctrl_clear_handle(handle, ctrl);
> >
> >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> >               s32 value;
> > @@ -2161,7 +2166,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >
> >               if (!rollback && handle && !ret &&
> >                   ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > -                     ret = uvc_ctrl_set_handle(handle, ctrl, handle);
> > +                     ret = uvc_ctrl_set_handle(handle, ctrl);
> >
> >               if (ret < 0 && !rollback) {
> >                       if (err_ctrl)
> > @@ -3271,7 +3276,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> >                       if (entity->controls[i].handle != handle)
> >                               continue;
> > -                     uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> > +                     uvc_ctrl_clear_handle(handle, &entity->controls[i]);
> >               }
> >       }
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
