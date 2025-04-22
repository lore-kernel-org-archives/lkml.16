Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA348634F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745362230; cv=none; b=kRKtM0vl4/fUHdoZ/rmQBzMXvrDH1kM1iM+oOHv54XFb67ko63AFjFfEmkllNfQGELEa4izXCyDBEQ0PB/DTxKcwtMsnE7/ROYXxsG8FUoJddgG//EA8s13fLnteertelpiSyRRtxVyMhNmuoKHOZtnimVLlmNYOfR1DNoj4JpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745362230; c=relaxed/simple;
	bh=a4EcOav03n+HBGzNSNuTxKZNDu09J/N3p9II0SkD8xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfazYyLWpEgRKI/cMjDi+cyo7eAVm1VFYP2EUSpi8JXnKBa12zlChNam1h2F4cn8BQQ+JZ+jcZxaL/I0Xkss5/zq6nhG9dbuZFl+UxWS+FP6nO8oV1UJYefAZ6dqNecyfD5bBO/7t9F+U573WtORXxSRIUuMa3HXvz8iz4Zf4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VkRbpU87; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VkRbpU87"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso56293831fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745362226; x=1745967026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oZCFkPT9VQDSYU37yasnvmuyi6JQuptLSL8TbX1/xkM=;
        b=VkRbpU87IB2WUGmVLF6WAabnc3Ak9eNMrbJuNyMMR+8nRfcAqx+YXAKMYN1cZZXzBo
         W3HlkC02O9167AJjF4zLhr3Pq/Xpgd0heanHwuPh/HXhZvNN9zrXazgNFrkfPnnfk6A0
         Cru87A0Y4r9vlXNb0iPercg1N+A/vsq85IFLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362226; x=1745967026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZCFkPT9VQDSYU37yasnvmuyi6JQuptLSL8TbX1/xkM=;
        b=iUZNnr+digB/qEqYxf7VDA/6Rf6Xi5NYeVL4JpiwxggVlESZ0Ndi4O/sHR6eA9Fpe8
         8wkFGNDeR/k9wn6nFpjscqAj3H4c0kgEPcSYBdooco82hCxjQuu5mkrB6LatlK3aFIZs
         i9gGoBrUq7p98EVJbMPTXph+L1QiNUpnsgrrdvIP2cnDjCX29Y6U+6MqPgQAKKjnpAjT
         P89Iq/yVnvAJ0DHjjupcdbATaERiMoY2snrEKERRZThTeJ5/AbaIVDIaCEC5FUDpXWoo
         XWnQQsuhf9XlySP5k7oE47LNIStgrg8E6xCiiCN8vP0lf8Wzua9zwkyIIIgBhg03oNc0
         k+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWejszhHNSErzjEzC5AMjMVD58hRthfWUld08kHGNCOPxdTwtkn8bLiihCpxfuoLSdOaLuByuWWohwdx2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI4WActGTpFriB3jGpUjQ4A+u4J5IZysjljUCQEZXVFw5YgFtT
	WaWKbAUhtWHnLm/BZRJPPosGeMIzTiCqRkC40xhc9nTiQoFLdXYseDpzeUeMKNCjvUCIPPZwTgC
	quw==
X-Gm-Gg: ASbGncvcRePHVYN7ZckTRQn7MjKPDIT/AIRxjrGSjSaYlr7UveJiZ+itDf9OeIydYdY
	FFnanOfoA1jjX44t8lgvborm5vg9LYp0pFW8tppYvg4PbZUgafDS91jsLULeNUxUrWTitYtFRnN
	Ep28KfE9u1fGXbiPGz3q8GsM4w6TyVHWKWqSMztwmw/2UePu5F7FjEaj4bHVGq55UlEJRFXmhr9
	tUZ8wJD4LARLarRFCSwO7s51HC5fFfK2gkZkyFggTj0yLXy8/EN13RZFkmQNveqim2zLx7LjXu3
	JPQtUB9VD5RYB6PKu7fZbNHn89KeUiaBA4RlOSVuSzJbB3vQW16fHDzhUvnB/g6R4D689JjOkpU
	mGnhWDhs=
X-Google-Smtp-Source: AGHT+IHXnN3J5wzvGOEHLLsyuXVgbaQ+0Nkg3SKsAVx+qGdI2ALjsuPABqlSZIEAx7imJP8nBAZ6yw==
X-Received: by 2002:a05:651c:1511:b0:30b:bdb0:f09d with SMTP id 38308e7fff4ca-31090553ee1mr60553171fa.32.1745362225951;
        Tue, 22 Apr 2025 15:50:25 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d4aasm16312991fa.90.2025.04.22.15.50.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:50:25 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso56293571fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:50:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxwVcTEeLKDaj0KrGTX9JLSU1cgrALbnd9qd4KcneHpwZEkpC1JJOdgpMr8BKbUtaR885exiTJwmgd8J0=@vger.kernel.org
X-Received: by 2002:a05:651c:220e:b0:30d:e104:b594 with SMTP id
 38308e7fff4ca-31090579a68mr48817081fa.40.1745362224964; Tue, 22 Apr 2025
 15:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org> <20250422180630.GJ17813@pendragon.ideasonboard.com>
In-Reply-To: <20250422180630.GJ17813@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Apr 2025 06:50:10 +0800
X-Gmail-Original-Message-ID: <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com>
X-Gm-Features: ATxdqUHelesrjtdLbpQ4wqs-_HLIDR_oOasDUe41GrOFPkA28vVRIy-nBpD1INE
Message-ID: <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 02:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Mar 13, 2025 at 12:20:39PM +0000, Ricardo Ribalda wrote:
> > uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> > have not yet been probed. This return code should be propagated to the
> > caller of uvc_probe() to ensure that probing is retried when the required
> > GPIOs become available.
> >
> > Currently, this error code is incorrectly converted to -ENODEV,
> > causing some internal cameras to be ignored.
> >
> > This commit fixes this issue by propagating the -EPROBE_DEFER error.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
> >  1 file changed, 19 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
> >  #endif
> >
> >       /* Parse the Video Class control descriptor. */
> > -     if (uvc_parse_control(dev) < 0) {
> > +     ret = uvc_parse_control(dev);
> > +     if (ret < 0) {
> > +             ret = -ENODEV;
>
> Why do you set ret to -ENODEV here...
>
> >               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> >               goto error;
> >       }
> >
> >       /* Parse the associated GPIOs. */
> > -     if (uvc_gpio_parse(dev) < 0) {
> > +     ret = uvc_gpio_parse(dev);
> > +     if (ret < 0) {
> >               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> >               goto error;
> >       }
> > @@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
> >       }
> >
> >       /* Register the V4L2 device. */
> > -     if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
> > +     ret = v4l2_device_register(&intf->dev, &dev->vdev);
> > +     if (ret < 0)
>
> ... but not here ? The code below is also not very consistant.

For all the "external" functions I was looking into populating their
error code to probe(). Other drivers (check vivid for example) do
exactly this.

There is more value in returning the real cause of the error (ENOMEM,
EINVAL) that the plain ENODEV.

>
> >               goto error;
> >
> >       /* Scan the device for video chains. */
> > -     if (uvc_scan_device(dev) < 0)
> > +     if (uvc_scan_device(dev) < 0) {
> > +             ret = -ENODEV;
> >               goto error;
> > +     }
> >
> >       /* Initialize controls. */
> > -     if (uvc_ctrl_init_device(dev) < 0)
> > +     if (uvc_ctrl_init_device(dev) < 0) {
> > +             ret = -ENODEV;
> >               goto error;
> > +     }
> >
> >       /* Register video device nodes. */
> > -     if (uvc_register_chains(dev) < 0)
> > +     if (uvc_register_chains(dev) < 0) {
> > +             ret = -ENODEV;
> >               goto error;
> > +     }
> >
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >       /* Register the media device node */
> > -     if (media_device_register(&dev->mdev) < 0)
> > +     ret = media_device_register(&dev->mdev);
> > +     if (ret < 0)
> >               goto error;
> >  #endif
> >       /* Save our data pointer in the interface data. */
> > @@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
> >  error:
> >       uvc_unregister_video(dev);
> >       kref_put(&dev->ref, uvc_delete);
> > -     return -ENODEV;
> > +     return ret;
> >  }
> >
> >  static void uvc_disconnect(struct usb_interface *intf)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
