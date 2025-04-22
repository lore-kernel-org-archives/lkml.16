Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB326D4E3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361327; cv=none; b=ct0U4lOLsdz8VXtL8fP1kyG5hAXIdNinSt6rrUndgg+j8ajrp6DyGheW4oF5sWENworfZihC3+p3XNi+9YCgtWptChUa+sHUfVQlNJqYjGuE/H9+dMGo3gXw/gGNSomPkmjwz5lU3FQRCfZh6FbewWyk7bD32iPCyLp159s2EpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361327; c=relaxed/simple;
	bh=qRekH6R/El0In+C0U93oyIPC0KY9/RSZc7MPaQOtdb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPbhT8BFTzdnRmJy7vc7F9hThwU8wuPrlIk2eRHV+LJUqF31tAMNiU2TwWWfVTP2ju8+g0F8bmzR8XmPpA5zpWB6BsdNsKfiTxeaukGq4H7AnW6ApvEnKf01Uews8f8vPSGTBdVBtvcXusZ/pUykY2uuCwWHIVDxU7XHRwPiUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSzilnHa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSzilnHa"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d42884842so7381628e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745361323; x=1745966123; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+1OwQffmoWOZiK+v3GN4nUgP2aMHL/nD/L2tk0hINuY=;
        b=NSzilnHaIYcQ6SL0gC8K1LHqR/QLulxBw+4cvyVJUGMs1JKjTpqTp8tihLIP71hSF3
         Vklay9pbMcWorEWb9SBPjGLJbrQX7zEbbCWIzcDDtiT9Nt11i5s+uRZ+gv+PeJHE6GxY
         KhZSO6tOwzxZzC9fssGfBvHfpTj95INE41cqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361323; x=1745966123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1OwQffmoWOZiK+v3GN4nUgP2aMHL/nD/L2tk0hINuY=;
        b=kZjxfTi5WCG/slpOmZfSlS9AdAr6QZ1CT63OyMPk5PpN8e/R/fGGAwxtn8nBV0kqaI
         9kPjW1SJuXLb+Pj+U3SkdphOV+32/Hry2xTG5texUDFNPTwIZ9djtQfvhtUj8pICDh5k
         DnnwHm0E230djh+sCLv4M9/A9qlCsDzn/+ib73H5QAYvippDsdTbfJ/UBEcgJMWGtOE0
         eRIICo30e/10CQozCC+1vzVYv0iSzv3OidJ12nzLcxzuz7FLCeKCyZM4tON2Ue9r/9wX
         rqs9RXDp1f+MXEBfQZPI1ztqIGYCKkq8MYeiCh5LGdsIYRBwBTDkFLfZr/9eaZukaeCw
         zS/g==
X-Forwarded-Encrypted: i=1; AJvYcCUsbAuvXZGY94+xoX5kkjqhDEGOKjvPeQ+V/Z79oYv6nGios1IuLHax8D1QS9yD7EeOMCfiA7yM611Xnj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrYeoapleTZEKi2QMr3yZNcadaU2ZfWdfmb/cWx5tQQM1/7oKX
	mF7k/nDJfvlXcZJVJEaQ7KgTwcKj+nrt8wnVR0gPIg9hCBT+n3/vzHbqfzrncGSoxIYbp1s3ZNx
	hsg==
X-Gm-Gg: ASbGncstAq02ZT8hMFlPu0zYnR3eTbkCxf3uktTUnIstzAiQLkkjzZuFZy5b47qKyF2
	5PPBHxKwTR8WhahvVc88DqLMYPwk6FiHfEe5hGARK8d+Em0xSFtEajh5BR0Bx0wdOFGtBNQWnYp
	Zt7ROXH2me77YM5n/FjytfsZjrNupf9sf8d/HSzgEhN7hD5t9jFogH8v8OhJ4WCR0DEHMbDe2fS
	rpcJ+APTIgE1SZN1yunEVlUYYqRUGtzaD7FVFQ3pfWKoq43wpGdJtH5hoyPJftsNH192NzYvJCE
	wyNpmIWWOnfYhQuY5ept3zqjw8FMsKxx+3FS6//WRphyhDvfzI4pn42sDOau8M712CGCIQQVWna
	yFVuua9AyuqJSJZYqSQ==
X-Google-Smtp-Source: AGHT+IHNavarKqwVtvLka3yM5xyp1yAzqCiPFHwmVAwY18n+p4SzgTos9ggoNXL0Qnfn1eLiN0FkMg==
X-Received: by 2002:ac2:51c6:0:b0:54a:fa58:a6f4 with SMTP id 2adb3069b0e04-54d6e62a2b8mr6074668e87.24.1745361323446;
        Tue, 22 Apr 2025 15:35:23 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e52436bsm1335983e87.9.2025.04.22.15.35.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:35:23 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30de488cf81so57051551fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:35:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgrDM8YO17SrBZtSUglfSP5L8slpz8eIo6sFzDL7Rpl3faAl9V1trnOO45gmehf4HOR0hT4ipuuFunaWA=@vger.kernel.org
X-Received: by 2002:a2e:a99c:0:b0:30c:6f3a:dce9 with SMTP id
 38308e7fff4ca-310904dc6famr51168381fa.10.1745361322526; Tue, 22 Apr 2025
 15:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-6-1a0cc595a62d@chromium.org> <20250422212824.GQ17813@pendragon.ideasonboard.com>
 <CANiDSCuOaZ9bnd20tGLWzOA7cGA2q+oKdGktvouT-8+cUkHF1w@mail.gmail.com> <20250422222517.GU17813@pendragon.ideasonboard.com>
In-Reply-To: <20250422222517.GU17813@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Apr 2025 06:35:08 +0800
X-Gmail-Original-Message-ID: <CANiDSCv3om=6puzMVC0OYAqsKGdH+JJQ-unmizhRmYLyTfKxkQ@mail.gmail.com>
X-Gm-Features: ATxdqUFRRVRmeagR9-6yuKs1PFlrDu1BvYYrOr34vEdivXpSYxBiSNwRKoK-z8A
Message-ID: <CANiDSCv3om=6puzMVC0OYAqsKGdH+JJQ-unmizhRmYLyTfKxkQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] media: uvcvideo: Factor out gpio functions to its own file
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 06:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 23, 2025 at 06:20:09AM +0800, Ricardo Ribalda wrote:
> > Hi Laurent
> >
> > On Wed, 23 Apr 2025 at 05:28, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > Thank you for the patch.
> > >
> > > Hans raised an issue on "[PATCH v3 2/8] media: uvcvideo: Factor out gpio
> > > functions to its own file" (part of "[PATCH v3 0/8] media: uvcvideo:
> > > Implement the Privacy GPIO as a evdev"), asking if GPIO handling should
> > > still use a uvc_entity if it moves to a evdev. There are implications on
> > > this series too. Unless I'm mistaken, I haven't seen a reply from you to
> > > my last e-mail. Can we please first finish that discussion ?
> >
> > Are you referring to:
> > https://lore.kernel.org/all/0dfb780b-f2dc-43ed-a67d-afd5f50bb88f@redhat.com/
> > ?
>
> I was referring to https://lore.kernel.org/all/20241125214523.GW19381@pendragon.ideasonboard.com/

I believe the three of us agreed to remove the entity. Am I missing something?

>
> > Is it an open discussion? I believe we agreed to remove the uvc_entity.
> >
> > I posted v4 back in november. In that version I remove completely the
> > uvc_entity:
> > https://patchwork.linuxtv.org/project/linux-media/patch/20241125-uvc-subdev-v4-6-51e040599f1a@chromium.org/
>
> Should I review that series first ?

It would be nicer if you follow the order of what Hans already merged
in the uvc tree. And if we *need* a change, post it on top of it
(unless it is a bug).

HdG and I have gone through multiple revisions, tested it, solved
conflicts, and reviewed merges.  CodeStyles and nice-to-have are
*very* painful to handle this late in the review cycle.

Regards!

>
> > > On Thu, Apr 03, 2025 at 07:16:17PM +0000, Ricardo Ribalda wrote:
> > > > This is just a refactor patch, no new functionality is added.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/Makefile     |   3 +-
> > > >  drivers/media/usb/uvc/uvc_driver.c | 121 +-----------------------------------
> > > >  drivers/media/usb/uvc/uvc_gpio.c   | 123 +++++++++++++++++++++++++++++++++++++
> > > >  drivers/media/usb/uvc/uvcvideo.h   |   6 ++
> > > >  4 files changed, 133 insertions(+), 120 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> > > > index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..85514b6e538fbb8284e574ca14700f2d749e1a2e 100644
> > > > --- a/drivers/media/usb/uvc/Makefile
> > > > +++ b/drivers/media/usb/uvc/Makefile
> > > > @@ -1,6 +1,7 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > >  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> > > > -               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
> > > > +               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> > > > +               uvc_gpio.o
> > > >  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
> > > >  uvcvideo-objs  += uvc_entity.o
> > > >  endif
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index da24a655ab68cc0957762f2b67387677c22224d1..b52e1ff401e24f69b867b5e975cda4260463e760 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -8,7 +8,6 @@
> > > >
> > > >  #include <linux/atomic.h>
> > > >  #include <linux/bits.h>
> > > > -#include <linux/gpio/consumer.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/list.h>
> > > >  #include <linux/module.h>
> > > > @@ -792,8 +791,8 @@ static const u8 uvc_media_transport_input_guid[16] =
> > > >       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> > > >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> > > >
> > > > -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> > > > -             unsigned int num_pads, unsigned int extra_size)
> > > > +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> > > > +                                 unsigned int extra_size)
> > > >  {
> > > >       struct uvc_entity *entity;
> > > >       unsigned int num_inputs;
> > > > @@ -1242,122 +1241,6 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > >       return 0;
> > > >  }
> > > >
> > > > -/* -----------------------------------------------------------------------------
> > > > - * Privacy GPIO
> > > > - */
> > > > -
> > > > -static void uvc_gpio_event(struct uvc_device *dev)
> > > > -{
> > > > -     struct uvc_entity *unit = dev->gpio_unit;
> > > > -     struct uvc_video_chain *chain;
> > > > -     u8 new_val;
> > > > -
> > > > -     if (!unit)
> > > > -             return;
> > > > -
> > > > -     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > > > -
> > > > -     /* GPIO entities are always on the first chain. */
> > > > -     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > > > -     uvc_ctrl_status_event(chain, unit->controls, &new_val);
> > > > -}
> > > > -
> > > > -static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > > -                         u8 cs, void *data, u16 size)
> > > > -{
> > > > -     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > > > -             return -EINVAL;
> > > > -
> > > > -     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > > > -                          u8 cs, u8 *caps)
> > > > -{
> > > > -     if (cs != UVC_CT_PRIVACY_CONTROL)
> > > > -             return -EINVAL;
> > > > -
> > > > -     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > > > -{
> > > > -     struct uvc_device *dev = data;
> > > > -
> > > > -     uvc_gpio_event(dev);
> > > > -     return IRQ_HANDLED;
> > > > -}
> > > > -
> > > > -static int uvc_gpio_parse(struct uvc_device *dev)
> > > > -{
> > > > -     struct uvc_entity *unit;
> > > > -     struct gpio_desc *gpio_privacy;
> > > > -     int irq;
> > > > -
> > > > -     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> > > > -                                            GPIOD_IN);
> > > > -     if (!gpio_privacy)
> > > > -             return 0;
> > > > -
> > > > -     if (IS_ERR(gpio_privacy))
> > > > -             return dev_err_probe(&dev->intf->dev,
> > > > -                                  PTR_ERR(gpio_privacy),
> > > > -                                  "Can't get privacy GPIO\n");
> > > > -
> > > > -     irq = gpiod_to_irq(gpio_privacy);
> > > > -     if (irq < 0)
> > > > -             return dev_err_probe(&dev->intf->dev, irq,
> > > > -                                  "No IRQ for privacy GPIO\n");
> > > > -
> > > > -     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > > > -     if (!unit)
> > > > -             return -ENOMEM;
> > > > -
> > > > -     unit->gpio.gpio_privacy = gpio_privacy;
> > > > -     unit->gpio.irq = irq;
> > > > -     unit->gpio.bControlSize = 1;
> > > > -     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > > > -     unit->gpio.bmControls[0] = 1;
> > > > -     unit->get_cur = uvc_gpio_get_cur;
> > > > -     unit->get_info = uvc_gpio_get_info;
> > > > -     strscpy(unit->name, "GPIO", sizeof(unit->name));
> > > > -
> > > > -     list_add_tail(&unit->list, &dev->entities);
> > > > -
> > > > -     dev->gpio_unit = unit;
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static int uvc_gpio_init_irq(struct uvc_device *dev)
> > > > -{
> > > > -     struct uvc_entity *unit = dev->gpio_unit;
> > > > -     int ret;
> > > > -
> > > > -     if (!unit || unit->gpio.irq < 0)
> > > > -             return 0;
> > > > -
> > > > -     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> > > > -                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > > > -                                IRQF_TRIGGER_RISING,
> > > > -                                "uvc_privacy_gpio", dev);
> > > > -
> > > > -     unit->gpio.initialized = !ret;
> > > > -
> > > > -     return ret;
> > > > -}
> > > > -
> > > > -static void uvc_gpio_deinit(struct uvc_device *dev)
> > > > -{
> > > > -     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> > > > -             return;
> > > > -
> > > > -     free_irq(dev->gpio_unit->gpio.irq, dev);
> > > > -}
> > > > -
> > > >  /* ------------------------------------------------------------------------
> > > >   * UVC device scan
> > > >   */
> > > > diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..30e3e6dd22cbc9cfee420dde7f7f64dbdce499b9
> > > > --- /dev/null
> > > > +++ b/drivers/media/usb/uvc/uvc_gpio.c
> > > > @@ -0,0 +1,123 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + *      uvc_gpio.c  --  USB Video Class driver
> > > > + *
> > > > + *      Copyright 2025 Google LLC
> > > > + */
> > > > +
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include "uvcvideo.h"
> > > > +
> > > > +static void uvc_gpio_event(struct uvc_device *dev)
> > > > +{
> > > > +     struct uvc_entity *unit = dev->gpio_unit;
> > > > +     struct uvc_video_chain *chain;
> > > > +     u8 new_val;
> > > > +
> > > > +     if (!unit)
> > > > +             return;
> > > > +
> > > > +     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > > > +
> > > > +     /* GPIO entities are always on the first chain. */
> > > > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > > > +     uvc_ctrl_status_event(chain, unit->controls, &new_val);
> > > > +}
> > > > +
> > > > +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                         u8 cs, void *data, u16 size)
> > > > +{
> > > > +     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > > > +             return -EINVAL;
> > > > +
> > > > +     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                          u8 cs, u8 *caps)
> > > > +{
> > > > +     if (cs != UVC_CT_PRIVACY_CONTROL)
> > > > +             return -EINVAL;
> > > > +
> > > > +     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > > > +{
> > > > +     struct uvc_device *dev = data;
> > > > +
> > > > +     uvc_gpio_event(dev);
> > > > +     return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +int uvc_gpio_parse(struct uvc_device *dev)
> > > > +{
> > > > +     struct uvc_entity *unit;
> > > > +     struct gpio_desc *gpio_privacy;
> > > > +     int irq;
> > > > +
> > > > +     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> > > > +                                            GPIOD_IN);
> > > > +     if (!gpio_privacy)
> > > > +             return 0;
> > > > +
> > > > +     if (IS_ERR(gpio_privacy))
> > > > +             return dev_err_probe(&dev->intf->dev,
> > > > +                                  PTR_ERR(gpio_privacy),
> > > > +                                  "Can't get privacy GPIO\n");
> > > > +
> > > > +     irq = gpiod_to_irq(gpio_privacy);
> > > > +     if (irq < 0)
> > > > +             return dev_err_probe(&dev->intf->dev, irq,
> > > > +                                  "No IRQ for privacy GPIO\n");
> > > > +
> > > > +     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > > > +     if (!unit)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     unit->gpio.gpio_privacy = gpio_privacy;
> > > > +     unit->gpio.irq = irq;
> > > > +     unit->gpio.bControlSize = 1;
> > > > +     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > > > +     unit->gpio.bmControls[0] = 1;
> > > > +     unit->get_cur = uvc_gpio_get_cur;
> > > > +     unit->get_info = uvc_gpio_get_info;
> > > > +     strscpy(unit->name, "GPIO", sizeof(unit->name));
> > > > +
> > > > +     list_add_tail(&unit->list, &dev->entities);
> > > > +
> > > > +     dev->gpio_unit = unit;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +int uvc_gpio_init_irq(struct uvc_device *dev)
> > > > +{
> > > > +     struct uvc_entity *unit = dev->gpio_unit;
> > > > +     int ret;
> > > > +
> > > > +     if (!unit || unit->gpio.irq < 0)
> > > > +             return 0;
> > > > +
> > > > +     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> > > > +                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > > > +                                IRQF_TRIGGER_RISING,
> > > > +                                "uvc_privacy_gpio", dev);
> > > > +
> > > > +     unit->gpio.initialized = !ret;
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +void uvc_gpio_deinit(struct uvc_device *dev)
> > > > +{
> > > > +     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> > > > +             return;
> > > > +
> > > > +     free_irq(dev->gpio_unit->gpio.irq, dev);
> > > > +}
> > > > +
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..aef96b96499ce09ffa286c51793482afd9832097 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -683,6 +683,8 @@ do {                                                                      \
> > > >   */
> > > >
> > > >  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> > > > +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> > > > +                                 unsigned int extra_size);
> > > >
> > > >  /* Video buffers queue management. */
> > > >  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> > > > @@ -829,4 +831,8 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
> > > >  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> > > >                           size_t size);
> > > >
> > > > +/* gpio */
> > > > +int uvc_gpio_parse(struct uvc_device *dev);
> > > > +int uvc_gpio_init_irq(struct uvc_device *dev);
> > > > +void uvc_gpio_deinit(struct uvc_device *dev);
> > > >  #endif
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
