Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4EF5477F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745281452; cv=none; b=hGD+AjmCynQ2fxSATrP0OAKCPZJGFYje39sltTVkb9sWLBeg4wubdoneQ7Tza2PUWvEDhWx69qrE0We5K8a3ybYmzvc6fW1zPlBZLvkD8G+v8A+CBfMdgw28NgTSW0SRcXe7/UWVyNfeAsuY8p/tN5BX9agzgDWbcJ6UrCTz2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745281452; c=relaxed/simple;
	bh=u52bVrB/pZ0lfovnX74KF6WwBxpQoIaVYqukYlfqcMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVYOWdGoEpJ0by8yM7ZXVwjV4OAGizaIj8WuG5CWz2eFTzMAiH9Il7l6sVNuCPr8Mc+G1N1QR2RsPXTroaVAy9Xn3wQDAAJD+vXb5iY+jUn5i84sbIpzQ6ZuHloYhNMwj7R59VPahnsq9eg4iMSAGtII/vR5HDo04iv7NooHOk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IJkuwugS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IJkuwugS"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54af20849adso4357812e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745281448; x=1745886248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hfCnlXym9eZAbX+zdYaRO3WcEjSZxfzTyz2pRkP+wp4=;
        b=IJkuwugSTnesjMEO730y97podEUNN1hDhZ/zzMIimojY7gEwNtDI8/7VVWUeGsEKa4
         NKzm6PVGAGl0nw/ybuQ/9J+TCI98DwTuTQiZl3dAtlj66ScWVxmDqfvppxT5aQtZc/w8
         9mqTN5wIYawAu/2md9PD3EVuXiMYu6a6VgFBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745281448; x=1745886248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfCnlXym9eZAbX+zdYaRO3WcEjSZxfzTyz2pRkP+wp4=;
        b=Zr6Sq//kqYBwDydtVo0AwXP36zO+ysLt7LDTuoMBo4ySTbUSYMPpzxFd262h3//Sji
         W9iFDYkgJU3AcafbdX7aI9UdgoSt2IW02MRHEKhDOVCY1vdSCZiJ0zo5/h8hkYMkpBDW
         NQOFDM7enxmokUvJnRP7mAhlEInPVxJEShu3beHxDGGpN2Vqg3OIM8z9kLUT3/If2u3m
         nh1hILVq2t0TdZcCDDyQzfECzb8l5eb/9hGMYqDsh4GB+DDBm6xfqmLjnEcKtF/cmg1v
         6DiHc5qHinLHH/Hj802SrRxATfVVWaZBdrIVmPtoBMOOGvEez3iZ/kP66ZWkjrvg2TwX
         9siQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtvmdGIZmOtX6KgDusEvjN/i3SqVXbPN5LaC+YHSceJXy6Aao8e09sabM7fBa41dz4826FuasvCHFPgZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOFl9xru0vxL4qe9AtiiRlgeOGE7Q4iTjNbi5s2vCuQDCz/4w8
	+20ixhTxEvoE9Uqji84m3s/FCzSaG84iw0m2qo9Usa9JeZsTi6+CiuBn/9WvsrryQI65YzPJwSk
	=
X-Gm-Gg: ASbGncvkcceCB7fFVwl2OSLZR/JSQEFyDqkFHGCAkMLx0krpbz++p5imNtLR3D8DM8i
	LtobTJq4V1G+OasrUNaWsOh11O5nIbaZ1UPnpFCcAda29bUYRFeNR9xNvaZ4lWU9k/oiMWIUvQH
	QjZGKXR62V6HEabQelP5MmAbWIr8t7Ndky1AGzSqnUDeAvd3mKbxCum4/uZ0+Ldi/uezGQrKfdw
	LmQzkDgGdbUwNd3AN4hNaH3vLkKohrciosEsjSYJ8gWmwgRC0KwAXdrtCfWVBZ30YoNIuVQPkk/
	W3NtaQ8zW9ElG45L+ySa5DlR7MfgIYOLsd8XCX3xz80PlO3I2dW5ldLOd2L8nj08l56GPPU5sMZ
	EEF5tIQz2RKO0jg==
X-Google-Smtp-Source: AGHT+IGfO+zD9k8Bx1AJuL3kqdvG66KZfor3hqk8IJbtxcvXeAbFFu9ZS/uVpyv//A6Qk8W5Bfmq2w==
X-Received: by 2002:a05:6512:15a5:b0:548:878b:ccb3 with SMTP id 2adb3069b0e04-54d6e7f267amr3552888e87.25.1745281448524;
        Mon, 21 Apr 2025 17:24:08 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540d3bsm1059403e87.72.2025.04.21.17.24.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 17:24:07 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b10956398so5317515e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUD6B9SijqFo741m7dn5/2yalaplRa0IZG6F3yVlZjzEo8OJ6wAUV0SoR1qOFPVnIYcxquCPr3SXHQP2MM=@vger.kernel.org
X-Received: by 2002:a05:6512:3995:b0:54a:cc10:1050 with SMTP id
 2adb3069b0e04-54d6e789b2bmr3360285e87.15.1745281447045; Mon, 21 Apr 2025
 17:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org> <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
In-Reply-To: <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Apr 2025 08:23:52 +0800
X-Gmail-Original-Message-ID: <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
X-Gm-Features: ATxdqUGV9UNm6rsWa1b6fT7zaIeRsrhtYZHR863_Li8k5tC_mUahvNyGq--RUEU
Message-ID: <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> Thanks for the patch.
>
> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> > This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.
> >
> > We initially add support only for orientation via the ACPI _PLD method.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
> >  1 file changed, 52 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -15,6 +15,7 @@
> >   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >   */
> >  #include <linux/acpi.h>
> > +#include <acpi/acpi_bus.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mm.h>
> >  #include <linux/module.h>
> > @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> >
> > -int v4l2_fwnode_device_parse(struct device *dev,
> > -                          struct v4l2_fwnode_device_properties *props)
> > +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > +                                      struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct acpi_pld_info *pld;
> > +     int ret = 0;
> > +
> > +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> > +             dev_dbg(dev, "acpi _PLD call failed\n");
> > +             return 0;
> > +     }
>
> You could have software nodes in an ACPI system as well as DT-aligned
> properties. They're not the primary means to convey this information still.
>
> How about returning e.g. -ENODATA here if _PLD doesn't exist for the device
> and then proceeding to parse properties as in DT?

Do you mean that there can be devices with ACPI handles that can also
have DT properties?

Wow that is new to me :).

What shall we do if _PLD contradicts the DT property? What takes precedence?

>
> > +
> > +     switch (pld->panel) {
> > +     case ACPI_PLD_PANEL_FRONT:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> > +             break;
> > +     case ACPI_PLD_PANEL_BACK:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> > +             break;
> > +     case ACPI_PLD_PANEL_TOP:
> > +     case ACPI_PLD_PANEL_LEFT:
> > +     case ACPI_PLD_PANEL_RIGHT:
> > +     case ACPI_PLD_PANEL_UNKNOWN:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> > +             break;
>
> How about the rotation in _PLD?

If we agree on the orientation part I will extend it to support
rotation. It should not be a complicated change.

>
> > +     default:
> > +             dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
> > +             ret = -EINVAL;
> > +             break;
> > +     }
> > +
> > +     ACPI_FREE(pld);
> > +     return ret;
> > +}
> > +
> > +static int v4l2_fwnode_device_parse_dt(struct device *dev,
> > +                                    struct v4l2_fwnode_device_properties *props)
> >  {
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
> > @@ -833,7 +865,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >               dev_dbg(dev, "device orientation: %u\n", val);
> >       }
> >
> > -     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> >       if (!ret) {
> >               if (val >= 360) {
> > @@ -847,6 +878,21 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >
> >       return 0;
> >  }
> > +
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +                          struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +
> > +     memset(props, 0, sizeof(*props));
> > +
> > +     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> > +     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> > +
> > +     if (is_acpi_device_node(fwnode))
> > +             return v4l2_fwnode_device_parse_acpi(dev, props);
> > +     return v4l2_fwnode_device_parse_dt(dev, props);
> > +}
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> >
> >  /*
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
