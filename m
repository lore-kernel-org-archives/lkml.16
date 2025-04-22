Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EAF18B47C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745363918; cv=none; b=LhQzxNUqAZKwkp7qqvBIDP3h9OfIU75sqK7e9LM3AhI86MOguPj36Vy81xRnfufkQuSqNOxCguUNrO7lPqtS/VCkVgwkEz2wUUDsEw/Kyg5ulBH1zMCiOjpAXytv2iFcPj48STPM92XKT3Wn9Doay3wUyzJamh9zBHP5N2GmO6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745363918; c=relaxed/simple;
	bh=QuB8Gjw+RfSX/s5bV7YLthr8S4ItqWWROGytUMe/6qY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wvc9FcGLSw0Y/0Y95yDK2g7HlDDPdIVXwbE/ovF8AuzoDuiy4RL8+QBUAhhoiEzgj+2ENZAbn5SZAMF+3AEG99/p7nFdxAveBPUJINnAoN/iUO+UfO2rqLmeSxwPlQJptStI9sa+Hzy+GxCV2Om3HcbrOtycCQMHdVLqBbD2Mg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X5xIHtyT; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X5xIHtyT"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso56489801fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745363913; x=1745968713; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TzfZueCNs06IErw8Nx2tIZlpeBLYieWxJQnlfkBvHwg=;
        b=X5xIHtyTnkIq20lCNULDZ/xkXugbRMUm90xAe2WvGGLejIwchUdJgt//OclWAIjR8N
         BEY27HoQGhbspNeUUMNEFv4l7gj6Xv8YuVH/CjiVXJIYvtPC9skgGepDxcm8Pq+g/tRG
         ATgATCUWau9VtoObYyvSzjIfBFpsCRgSmcTOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745363913; x=1745968713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzfZueCNs06IErw8Nx2tIZlpeBLYieWxJQnlfkBvHwg=;
        b=o//zhH1BKQD958dMmMwfxBCmtD8dL6TYt3Hh/r0WcrED08vJKhU9EatqGbnq3rMNaM
         Tsr0Hh4zIHAm5o0DievGjl+2wPyNpfavusCfahqQc9TbQK5UgPG8bVAWstwAl+qPAW/m
         t8QCGg1DGrtEuQqLWIUI1Vn8YKhfMepNbR2QrqyjhAZ0B+dTCAHHorUPi5ol0qKBRnaD
         7SyTo1M4+ZYhuGnuF0l+BRjqMIDcw9+VqlRR5m8V00upoweZ+82Vxm3+A1Cc7LKvXcuU
         TpgqJVIq88Pr5cclEoVqX1a6aHPj3+n0BubVgEsX9x05JyKtsTFMO8fFDLRa3fjLecqN
         tWsw==
X-Forwarded-Encrypted: i=1; AJvYcCVJLGkFjiccAR2XOlTLm5uwtd0REzKryDq02ZiBN0ILNftyCpPG2DMia72C6iSgbDF4L5nh97xVC38dCF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtSSnwQVpOcfTFa9OhUB21kc6ojoOYNp7dVFl1F8JhWdfnjp/
	PKo82Bv54qU+uiGo9KbJbhvwvX13KrOd2F+DN41nqdFApJufzbQ/prT2rhcJdwNmbgyAkTIvI/o
	73g==
X-Gm-Gg: ASbGncuiLHUDAhkd2xsNISnRzMjAuO/B6RxfFDdXDXm40WhTYaXcDgJtJoAuQIn5kWT
	KKmNFuyNIdjj98NIWR+/ZeHdPADTNngDBfaHjFR+e4y7tJy1prD/kjK7F1iurorDTGXqWuDc/te
	KlteZB9qad6DUKKu7V/bnlggLTvxuBu8V8Hulu7bvtrQQRXM+8XdwF+A/pS3BqyASxx3dPFIxPD
	8h4rzJ9/oIaPs6n3yj9tbZiVXz0+tgVNG9N9/UDle1A2FeD4Y6NsWDkIfnDp7q6Ipu3Wau17dHB
	NH5Cc81nKbDa7BvDoj22AhJMdoLtILqtFJjzLh1KgBv6YHJorEqb0IV9mamWR2Zf0Hb9FXTUMdP
	TJgMluICgsjFrygGTOQ==
X-Google-Smtp-Source: AGHT+IHCiH3AIMmiCA3LBNpT2FuYLk4cUeh3Zk0/tsdlsEOZJDGChpZmy52Ac3K27+T/Vhji8L2J2Q==
X-Received: by 2002:a2e:a888:0:b0:30d:69cd:ddcf with SMTP id 38308e7fff4ca-310903d1a72mr57780741fa.0.1745363913270;
        Tue, 22 Apr 2025 16:18:33 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907827b2sm16681221fa.28.2025.04.22.16.18.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 16:18:32 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30db3f3c907so51951451fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:18:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrIJnSf9e3uunWx7VhH/HDl5UTv5KqcaXcwWgcR33s41L6xdK6CHPZhN252wZN+SLHLF65DDDW4a/0QOI=@vger.kernel.org
X-Received: by 2002:a2e:bc82:0:b0:30b:b908:ce1e with SMTP id
 38308e7fff4ca-31090553f0dmr68294081fa.29.1745363911890; Tue, 22 Apr 2025
 16:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org> <20250422180630.GJ17813@pendragon.ideasonboard.com>
 <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com> <20250422230513.GX17813@pendragon.ideasonboard.com>
In-Reply-To: <20250422230513.GX17813@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Apr 2025 07:18:18 +0800
X-Gmail-Original-Message-ID: <CANiDSCssyAVoyvsiO8thGwUFc_boA_jhBxYDif32Hxh40fhf-Q@mail.gmail.com>
X-Gm-Features: ATxdqUEDSEbHKCZeCwxeZY8tESjmDWJXIzIiNSsM2g3Q15qo52D4m0v7Y_22dXw
Message-ID: <CANiDSCssyAVoyvsiO8thGwUFc_boA_jhBxYDif32Hxh40fhf-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 07:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 23, 2025 at 06:50:10AM +0800, Ricardo Ribalda wrote:
> > On Wed, 23 Apr 2025 at 02:06, Laurent Pinchart wrote:
> > > On Thu, Mar 13, 2025 at 12:20:39PM +0000, Ricardo Ribalda wrote:
> > > > uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> > > > have not yet been probed. This return code should be propagated to the
> > > > caller of uvc_probe() to ensure that probing is retried when the required
> > > > GPIOs become available.
> > > >
> > > > Currently, this error code is incorrectly converted to -ENODEV,
> > > > causing some internal cameras to be ignored.
> > > >
> > > > This commit fixes this issue by propagating the -EPROBE_DEFER error.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
> > > >  1 file changed, 19 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
> > > >  #endif
> > > >
> > > >       /* Parse the Video Class control descriptor. */
> > > > -     if (uvc_parse_control(dev) < 0) {
> > > > +     ret = uvc_parse_control(dev);
> > > > +     if (ret < 0) {
> > > > +             ret = -ENODEV;
> > >
> > > Why do you set ret to -ENODEV here...
> > >
> > > >               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> > > >               goto error;
> > > >       }
> > > >
> > > >       /* Parse the associated GPIOs. */
> > > > -     if (uvc_gpio_parse(dev) < 0) {
> > > > +     ret = uvc_gpio_parse(dev);
> > > > +     if (ret < 0) {
> > > >               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> > > >               goto error;
> > > >       }
> > > > @@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
> > > >       }
> > > >
> > > >       /* Register the V4L2 device. */
> > > > -     if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
> > > > +     ret = v4l2_device_register(&intf->dev, &dev->vdev);
> > > > +     if (ret < 0)
> > >
> > > ... but not here ? The code below is also not very consistant.
> >
> > For all the "external" functions I was looking into populating their
> > error code to probe(). Other drivers (check vivid for example) do
> > exactly this.
> >
> > There is more value in returning the real cause of the error (ENOMEM,
> > EINVAL) that the plain ENODEV.
>
> Yes, I got that, my question was why you override the return value of
> e.g. uvc_parse_control() or uvc_scan_device() with -ENODEV, but not for
> e.g. uvc_gpio_parse() or v4l2_device_register(). There's no explanation
> in the commit message regarding why they're treated differently.

Because it is less risky that way. There are plenty of examples where
the framework functions return code is passed to probe().

The uvc_* functions might or might not work this way. When I do that
assessment for every function I can post a different patch. I thought
that this approach was safer, especially if we are cc-ing stable.

A note in the commit message would have been a nice thing to have I agree :).


>
> > > >               goto error;
> > > >
> > > >       /* Scan the device for video chains. */
> > > > -     if (uvc_scan_device(dev) < 0)
> > > > +     if (uvc_scan_device(dev) < 0) {
> > > > +             ret = -ENODEV;
> > > >               goto error;
> > > > +     }
> > > >
> > > >       /* Initialize controls. */
> > > > -     if (uvc_ctrl_init_device(dev) < 0)
> > > > +     if (uvc_ctrl_init_device(dev) < 0) {
> > > > +             ret = -ENODEV;
> > > >               goto error;
> > > > +     }
> > > >
> > > >       /* Register video device nodes. */
> > > > -     if (uvc_register_chains(dev) < 0)
> > > > +     if (uvc_register_chains(dev) < 0) {
> > > > +             ret = -ENODEV;
> > > >               goto error;
> > > > +     }
> > > >
> > > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > > >       /* Register the media device node */
> > > > -     if (media_device_register(&dev->mdev) < 0)
> > > > +     ret = media_device_register(&dev->mdev);
> > > > +     if (ret < 0)
> > > >               goto error;
> > > >  #endif
> > > >       /* Save our data pointer in the interface data. */
> > > > @@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
> > > >  error:
> > > >       uvc_unregister_video(dev);
> > > >       kref_put(&dev->ref, uvc_delete);
> > > > -     return -ENODEV;
> > > > +     return ret;
> > > >  }
> > > >
> > > >  static void uvc_disconnect(struct usb_interface *intf)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
