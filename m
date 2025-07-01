Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE026C387
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360682; cv=none; b=NTN5I2ai82p8mBenl7EbHQVCftdHsPjqeXj+8qKdyK9OTbBlTrWkIIC2lYtjEXRSmrE7SL3idxPIjjLh/XwGRxGDYX1RY/F5KMmT/4Ru2bS8QloA+4syRlxamzE5ClPrY7eh5f29g7EBpcdI9qwlbdh9Dlf20wqBL9V1Fx1vo78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360682; c=relaxed/simple;
	bh=o28C31JrBgAZEzAB1O4WLZDzarIKJHFMpSuZuTBwEc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNrwoTDS6SfIfY4kXIma69Wl0PX00iFVUELHJIco5KbmmR25WoMTep4v5iA41b+fGkvbF79uP/1oUcjKwttLtTv0Z2TOSPdoVeFeuI+8Mdp+EYBh7A0ARPEDkm48GlpgSC5PC8KNaol1Q8s8HsYc90QejWDM4a+AJBWkmdr2mwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zrim28Nv; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zrim28Nv"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553cf020383so6037174e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751360679; x=1751965479; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xkMPKxlbdTBTKL3fl2oC7mwIlMxs96dPn8+iiFtM8yw=;
        b=Zrim28Nv00nzmp4uRo1Ibe+axaeRHmcg+ivcmqIMcgWa8xFVkursiUjEyz7vYIKaF0
         nXmS+nqQzm1V7j8thEe8pZjiKDErFV4Q9RPsSAUeInCdSZYN09HFC2N9AT07z1OCtfl7
         aPimB5SU42eTpn19hkY/kPJ4fokv7x+gWRdts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360679; x=1751965479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkMPKxlbdTBTKL3fl2oC7mwIlMxs96dPn8+iiFtM8yw=;
        b=eLIuryFLmwgu4+S8w7WlsvJP94CqEong1gjU2dKg6LBKE/KLyOCwrFqJkMVD8WdKnU
         cao0eKOMze/g7Ve4HLH30/x07+0+L9pXzRrqJtHMqL3aNSMVyylRY6BzXkETm1Mghuzo
         gS3kU6nEbdUuIBH0imxkEvszOvXY7AaRZc9kog410gqUFIXdx6rpmXNcspKIk2eOKCS/
         zHt/hMt1zetaUke7NhzMZ2vSsW3D23wP/aA1sgD86H2bBjPX68rtW1i3F+BsP/K0S8jF
         5QgLzAAlNrlEr+IN6FSPhViMv1VrRJIZ9dr3u3WjZ+Qkhd4R69u90cgp6k6qJMf8Y9/x
         za/g==
X-Forwarded-Encrypted: i=1; AJvYcCU+aPytYqvQPNIgAZlQ8hAiinClb7YU/IVWDOAFZDwq9gFZlak9+lAtxx1yb504C5hT4Xw/AlPRy5tTxXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZtGaxHjGyzXsqBEQRRiRgF4sulK0Gj1EIihxqUOA1mgZ3Rxl
	68AiDqobkBQGcCXemEOGtjXE7CVdk/SjAtOQ7pQEX4oc/oMZmf8Xf4ZmM9uo/Lrx1pIW7k6dK4F
	AHbI=
X-Gm-Gg: ASbGncvzTKZuNLqM9017gyQxD4eDby9Q3UZe85ya2RBDNaq/Cl5N3jpyaBHPcvA3udX
	rVzyegxqPwB+jPc4bzQfAJDBa5GpoBgAAKcTfJTmZlSW3fzMhk4EQp57WkUbvDa54iWDx6dusQb
	UiNs2vmjSpM/IVB/QOO4woc4l9UEtE/9MfhU5jeI8Jf4otwieOp3F2ptP1UjiERhcjLvqdLWoW9
	pep4w2GQI68hT7ZB9m17TqGuPtU0IjsLWhy8BlHAFXWIDXHg7pYebWhPVvXug8jJCOLicYADhI3
	Iq7a5jhfRgX1fzFjT+RfFhuBC5v+aTiEYmKd+F1fg+rX1+EgCNaVcFESWbRJcxFt21alusn5YIL
	jQIjxH9Y0WEYNroKTv2tfF9y1
X-Google-Smtp-Source: AGHT+IFxXqtb41iqP/HlKyJS5Po6p4JyNJ5fEzC+uM+4RevHHjItATGjx38OjDwuahpESpt3rICTbA==
X-Received: by 2002:a05:6512:224b:b0:553:25f4:695f with SMTP id 2adb3069b0e04-5550b889f53mr5151612e87.20.1751360678839;
        Tue, 01 Jul 2025 02:04:38 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b95c2sm1744618e87.129.2025.07.01.02.04.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:04:38 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553cf020383so6037155e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:04:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPDzfyDoebSE/XJkPxhFqhPobzvULhPJfswsbXgNED4Ahg70pv6xFzNTcxDYYJS5SUSvvJs7s1YRqmFUY=@vger.kernel.org
X-Received: by 2002:a05:6512:6c6:b0:553:cf7d:7283 with SMTP id
 2adb3069b0e04-5550b9ee0bemr5279219e87.33.1751360678000; Tue, 01 Jul 2025
 02:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-2-5710f9d030aa@chromium.org> <1ac49bd3-1b65-4611-8c90-92fb2c2ffd4a@linux.intel.com>
In-Reply-To: <1ac49bd3-1b65-4611-8c90-92fb2c2ffd4a@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 11:04:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCuRLVtT54ZxxAh6031OLg422VApsocvOTCOnavQgifTaA@mail.gmail.com>
X-Gm-Features: Ac12FXx3IMpNO_E1OyIfv6p5Mqhpq1vAIqrVG416DGyoC75C25dyBDZ2PZqW7zo
Message-ID: <CANiDSCuRLVtT54ZxxAh6031OLg422VApsocvOTCOnavQgifTaA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] media: v4l: fwnode: Support ACPI's _PLD for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Thanks for your review!

On Mon, 30 Jun 2025 at 09:06, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> Thanks for the update.
>
> On 6/5/25 20:52, Ricardo Ribalda wrote:
> > Currently v4l2_fwnode_device_parse() obtains the orientation and
> > rotation via fwnode properties.
> >
> > Extend the function to support as well ACPI devices with _PLD info.
> >
> > We give a higher priority to fwnode, because it might contain quirks
> > injected via swnodes.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >   drivers/media/v4l2-core/v4l2-fwnode.c | 85 ++++++++++++++++++++++++++++++++---
> >   1 file changed, 79 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..379290ab3cfde74c8f663d61837a9a95011b5ae0 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -15,6 +15,7 @@
> >    * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >    */
> >   #include <linux/acpi.h>
> > +#include <acpi/acpi_bus.h>
> >   #include <linux/kernel.h>
> >   #include <linux/mm.h>
> >   #include <linux/module.h>
> > @@ -807,16 +808,65 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
> >   }
> >   EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> >
> > -int v4l2_fwnode_device_parse(struct device *dev,
> > -                          struct v4l2_fwnode_device_properties *props)
> > +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > +                                      struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct acpi_pld_info *pld;
> > +     int ret = 0;
> > +
> > +     if (!is_acpi_device_node(dev_fwnode(dev)))
> > +             return 0;
> > +
> > +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> > +             dev_dbg(dev, "acpi _PLD call failed\n");
>
> I'd do:
>
> acpi_handle_debug(ACPI_HANDLE(dev), "cannot obtain _PLD\n");
ack
>
> > +             return 0;
> > +     }
> > +
> > +     if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET) {
> > +             switch (pld->panel) {
> > +             case ACPI_PLD_PANEL_FRONT:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> > +                     break;
> > +             case ACPI_PLD_PANEL_BACK:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> > +                     break;
> > +             case ACPI_PLD_PANEL_TOP:
> > +             case ACPI_PLD_PANEL_LEFT:
> > +             case ACPI_PLD_PANEL_RIGHT:
> > +             case ACPI_PLD_PANEL_UNKNOWN:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> > +                     break;
> > +             default:
> > +                     dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
>
> Similarly:
>
> acpi_handle_debug(ACPI_HANDLE(dev), "invalid panel %u in _PLD\n",
>                   pld->panel);
>
> > +                     ret = -EINVAL;
>
> Should this be an error or should we simply ignore it here (and maybe
> use acpi_handle_warn())?

v4l2_fwnode_device_parse_of() returns -EINVAL for a similar situation,
so I think it is better to be consistent and return -EINVAL here.
But I agree that acpi_handle_warn() better suits here than _dbg.

>
> > +                     goto done;
> > +             }
> > +     }
> > +
> > +     if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET) {
> > +             switch (pld->rotation) {
> > +             case 0 ... 7:
> > +                     props->rotation = pld->rotation * 45;
> > +                     break;
> > +             default:
> > +                     dev_dbg(dev, "Unknown _PLD rotation val %d\n", pld->panel);
>
> acpi_handle_debug(ACPI_HANDLE(dev), "invalid rotation %u in _PLD\n",
>                   pld->rotation);
>
> > +                     ret = -EINVAL;
> > +                     goto done;
> > +             }
> > +     }
> > +
> > +done:
> > +     ACPI_FREE(pld);
> > +     return ret;
> > +}
> > +
> > +static int v4l2_fwnode_device_parse_dt(struct device *dev,
>
> I'd call this v4l2_fwnode_device_parse_of() as we're parsing OF nodes
> and properties here.
ack
>
> > +                                    struct v4l2_fwnode_device_properties *props)
> >   {
> >       struct fwnode_handle *fwnode = dev_fwnode(dev);
> >       u32 val;
> >       int ret;
> >
> > -     memset(props, 0, sizeof(*props));
> > -
> > -     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "orientation", &val);
> >       if (!ret) {
> >               switch (val) {
> > @@ -833,7 +883,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >               dev_dbg(dev, "device orientation: %u\n", val);
> >       }
> >
> > -     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> >       if (!ret) {
> >               if (val >= 360) {
> > @@ -847,6 +896,30 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >
> >       return 0;
> >   }
> > +
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +                          struct v4l2_fwnode_device_properties *props)
> > +{
> > +     int ret;
> > +
> > +     memset(props, 0, sizeof(*props));
> > +
> > +     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> > +     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> > +
> > +     /* Start by looking into swnodes and dt. */
> > +     ret =  v4l2_fwnode_device_parse_dt(dev, props);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Orientation and rotation found!, we are ready. */
> > +     if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET &&
> > +         props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             return 0;
>
> I think you can remove this check without affecting the functionality.
I want to avoid calling an acpi method unless it is strictly
necessary. The check is not that ugly... if it is ok with you i'd
rather keep it.

>
> > +
> > +     /* Let's check the acpi table. */
> > +     return v4l2_fwnode_device_parse_acpi(dev, props);
> > +}
> >   EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> >
> >   /*
> >
>
> --
> Regards,
>
> Sakari Ailus

Thanks!

-- 
Ricardo Ribalda
