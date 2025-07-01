Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E527C272E41
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369230; cv=none; b=fh/EkC+tVIRwDjjW7KT99kp1Gzoy0ORgDTY/Z7zAtQjX4n4QcTAm0Rw359YOlN5uCUzmepoSsAnXpY5Or79r4l5+RPUQumaGKcHRlnc2kcmWvjimO3Rv8hdYUZHOThDVkvwtrEAwVo+SvujXyesMy3NGCKAp5edB3OQQjzvpRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369230; c=relaxed/simple;
	bh=ESXaDOI0ClJQb3/rnUaSslnZdyZvIXDxHVvhpQGw5jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvtQW6NuPyChG9bhqhoAt8rDJsQOic8Cjgund3MUUi/PMbFEZX9ZKQen8ROKzbJPRBm+zez3zQRU7po5hmUAye79bl4mCQEEmua1zD6Dnob76sU/H2kakUwLWfCjqRT3H9hIkdbMI8nOo3kIkH0KzNN6NmuEe0ZFViWaVmDRfHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pl67WSnR; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pl67WSnR"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55516abe02cso2730298e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751369227; x=1751974027; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOpbhHFXTgJjd1mQ2k57iBzGNrGLgGW/xPskwW5clgI=;
        b=Pl67WSnR43+g8je/qLv8BWNkYs1cXpsCI6jaZBqHsJ4OWgAvFTIonNN4h/mgzlu71y
         U14pNd5x4RIaIihYz9TNejuL+k3Y2h2PYUY+k+zj2fJuVRmHxUtup/03kbswdqaK8oZ3
         Ph2kKJ6Hxeqpi2qMCAVfsRY8ymKxho7inP4P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369227; x=1751974027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOpbhHFXTgJjd1mQ2k57iBzGNrGLgGW/xPskwW5clgI=;
        b=tYBoy+YvwpQduSVj7TG1k6q/XqBXXtv27cPkXBMy0qniUgET7oSmSrwZw9rTo6Mqq0
         53KdtnZ5j4BY3PjyECx7ElA+4leP9FPv595lycACws4iwTDL7KGbK10F9WEjOnYADLuz
         sS6lMc+6iDERzY5nfeWlYrR/rFH+HeohfqrECBpd6HQkerMuK4+OCkDv5Z5f9GI5jGb7
         2L4GUf9ZqG55ry7x/+dpFs/7Ee7FFfC0XYh+jcOrTokf4/DalDZgGlideZMfpM4nJVXE
         n9MJWHIrAJJkInku3bvW9VDFDVOopezXSp7IM1qzp4o1oL0dTkKC346tmhlnydYXv27i
         Qk8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKEOJ20JF0GXl2b8XERiTS9Yz5LkpFCfHsYj9AWWE1hiGA+L7F36WGKddZRXu2ocJPsalJu04kevUJKV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Dv/TMhiqIYN290DunX2jliGJ4G15m+XAbQATG7fF0Z5FBVgL
	DZzQ0DTCXpSTvdtE5dSH9NyC1ffSqBIwlgrgLih7m/DDNlG0OYGqietil6A4ZPiSX30rEaagLrE
	oKVZGcg==
X-Gm-Gg: ASbGnct2rOZvMqLlUlbd2KhmR12L9pn0aMUh7RuyOJY3YINf/KuDb5cQX5f3E57DtbB
	RCjpZyCBOFHHUwT9VT0gElpxjkL3Of+wuextP3a1+Hh4C9ZuoXg+idR9Pi1DXnWjp+/3SeMY4mi
	RFdGJ/Zecy6IQddS1ciucH0llvW2FKp3VeFd+CUPu8TYKwXv4X/jWLwPDijRWNXRtgBElEcE5nM
	9/t+THZJDX+7u2AtJRjvcjaHIZS11pU2l4Ys68cxm//0rVBid0B/LotbvcRDpEtQXXFCLAMt6kK
	wEox/s7i60+jF5QDQbqyRKnKWRjeOYMiWmLzNKGWpJn8p0VDwthLgJKAgEvJPD/sZqlkgyfdJ6P
	zV5kBb4azcLIsvEdv6nCfSBhj
X-Google-Smtp-Source: AGHT+IGLyo71PJe7ayMSY24kno/W/0KIN+PDlM/T4MejCapfN0hCJ2bNakQul7XhMc6NEWsRgQZ24A==
X-Received: by 2002:a05:6512:3f24:b0:553:2159:8716 with SMTP id 2adb3069b0e04-556235309fdmr615324e87.26.1751369226571;
        Tue, 01 Jul 2025 04:27:06 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24d130sm1808978e87.54.2025.07.01.04.27.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:27:05 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55516abe02cso2730273e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:27:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpmWhW4Ml3kyzGMBicICPEgzZvgvzSpKp4flwqXr2tWn1U1zISnzsDTk38GdqbyTWetB+tqGppRlZJMrE=@vger.kernel.org
X-Received: by 2002:a05:6512:3996:b0:553:2a16:2503 with SMTP id
 2adb3069b0e04-5562351cd2bmr643670e87.22.1751369224941; Tue, 01 Jul 2025
 04:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-11-5710f9d030aa@chromium.org> <20250629181440.GO24912@pendragon.ideasonboard.com>
In-Reply-To: <20250629181440.GO24912@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:26:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>
X-Gm-Features: Ac12FXzX2o2y2l8S2fLY5YNiZDeM3lsThn02nyBQ6azDUzOojOVrPSfT9VAdjyY
Message-ID: <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] media: uvcvideo: Add support for V4L2_CID_CAMERA_ROTATION
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Jun 2025 at 20:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jun 05, 2025 at 05:53:04PM +0000, Ricardo Ribalda wrote:
> > Fetch the rotation from the fwnode and map it into a control.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c     | 22 +++++++++++++--
> >  drivers/media/usb/uvc/uvc_swentity.c | 55 ++++++++++++++++++++++++++++++++----
> >  drivers/media/usb/uvc/uvcvideo.h     |  5 ++++
> >  3 files changed, 74 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 59be62ae24a4219fa9d7aacf2ae7382c95362178..5788f0c0f6604da06a7bca1b9999d0957817e75e 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -378,11 +378,18 @@ static const struct uvc_control_info uvc_ctrls[] = {
> >       },
> >       {
> >               .entity         = UVC_GUID_SWENTITY,
> > -             .selector       = 0,
> > -             .index          = 0,
> > +             .selector       = UVC_SWENTITY_ORIENTATION,
> > +             .index          = UVC_SWENTITY_ORIENTATION,
> >               .size           = 1,
> >               .flags          = UVC_CTRL_FLAG_GET_CUR,
> >       },
> > +     {
> > +             .entity         = UVC_GUID_SWENTITY,
> > +             .selector       = UVC_SWENTITY_ROTATION,
> > +             .index          = UVC_SWENTITY_ROTATION,
> > +             .size           = 2,
> > +             .flags          = UVC_CTRL_FLAG_GET_RANGE,
> > +     },
> >  };
> >
> >  static const u32 uvc_control_classes[] = {
> > @@ -1025,7 +1032,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >       {
> >               .id             = V4L2_CID_CAMERA_ORIENTATION,
> >               .entity         = UVC_GUID_SWENTITY,
> > -             .selector       = 0,
> > +             .selector       = UVC_SWENTITY_ORIENTATION,
> >               .size           = 8,
> >               .offset         = 0,
> >               .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > @@ -1033,6 +1040,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >               .menu_mask      = GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
> >                                         V4L2_CAMERA_ORIENTATION_FRONT),
> >       },
> > +     {
> > +             .id             = V4L2_CID_CAMERA_SENSOR_ROTATION,
> > +             .entity         = UVC_GUID_SWENTITY,
> > +             .selector       = UVC_SWENTITY_ROTATION,
> > +             .size           = 16,
> > +             .offset         = 0,
> > +             .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> > +             .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> > +     },
> >  };
> >
> >  /* ------------------------------------------------------------------------
> > diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
> > index 702a2c26e029a0655dade177ed2a9b88d7a4136d..60f3166addbeb7d2e431d107b23034d2d11a1812 100644
> > --- a/drivers/media/usb/uvc/uvc_swentity.c
> > +++ b/drivers/media/usb/uvc/uvc_swentity.c
> > @@ -10,10 +10,11 @@
> >  #include <media/v4l2-fwnode.h>
> >  #include "uvcvideo.h"
> >
> > -static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > -                             u8 cs, void *data, u16 size)
> > +static int uvc_swentity_get_orientation(struct uvc_device *dev,
> > +                                     struct uvc_entity *entity, u8 cs,
> > +                                     void *data, u16 size)
> >  {
> > -     if (size < 1)
> > +     if (cs != UVC_SWENTITY_ORIENTATION || size != 1)
> >               return -EINVAL;
> >
> >       switch (entity->swentity.props.orientation) {
> > @@ -30,6 +31,31 @@ static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entit
> >       return 0;
> >  }
> >
> > +static int uvc_swentity_get_rotation(struct uvc_device *dev,
> > +                                  struct uvc_entity *entity, u8 cs, void *data,
> > +                                  u16 size)
> > +{
> > +     if (cs != UVC_SWENTITY_ROTATION || size != 2)
> > +             return -EINVAL;
> > +
> > +     ((u8 *)data)[0] = entity->swentity.props.rotation;
> > +     ((u8 *)data)[1] = entity->swentity.props.rotation >> 8;
> > +
> > +     return 0;
> > +}
> > +
> > +static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > +                             u8 cs, void *data, u16 size)
> > +{
> > +     switch (cs) {
> > +     case UVC_SWENTITY_ORIENTATION:
> > +             return uvc_swentity_get_orientation(dev, entity, cs, data, size);
> > +     case UVC_SWENTITY_ROTATION:
> > +             return uvc_swentity_get_rotation(dev, entity, cs, data, size);
> > +     }
> > +     return -EINVAL;
> > +}
> > +
> >  static int uvc_swentity_get_info(struct uvc_device *dev,
> >                                struct uvc_entity *entity, u8 cs, u8 *caps)
> >  {
> > @@ -37,11 +63,22 @@ static int uvc_swentity_get_info(struct uvc_device *dev,
> >       return 0;
> >  }
> >
> > +static int uvc_swentity_get_res(struct uvc_device *dev, struct uvc_entity *entity,
> > +                             u8 cs, void *res, u16 size)
> > +{
> > +     if (size == 0)
> > +             return -EINVAL;
>
> The get_cur functions return an error if the size doesn't match the
> expected size. I think you can return -EINVAL if size != 1.
>
> > +     ((u8 *)res)[0] = 1;
> > +     memset(res + 1, 0, size - 1);
>
> And drop the memset.
>
> > +     return 0;
> > +}
> > +
> >  int uvc_swentity_init(struct uvc_device *dev)
> >  {
> >       static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
> >       struct v4l2_fwnode_device_properties props;
> >       struct uvc_entity *unit;
> > +     u8 controls = 0;
> >       int ret;
> >
> >       ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
> > @@ -49,7 +86,11 @@ int uvc_swentity_init(struct uvc_device *dev)
> >               return dev_err_probe(&dev->intf->dev, ret,
> >                                    "Can't parse fwnode\n");
> >
> > -     if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
> > +     if (props.orientation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             controls |= BIT(UVC_SWENTITY_ORIENTATION);
> > +     if (props.rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             controls |= BIT(UVC_SWENTITY_ROTATION);
> > +     if (!controls)
> >               return 0;
> >
> >       unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
> > @@ -60,9 +101,13 @@ int uvc_swentity_init(struct uvc_device *dev)
> >       unit->swentity.props = props;
> >       unit->swentity.bControlSize = 1;
> >       unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
> > -     unit->swentity.bmControls[0] = 1;
> > +     unit->swentity.bmControls[0] = controls;
> >       unit->get_cur = uvc_swentity_get_cur;
> >       unit->get_info = uvc_swentity_get_info;
> > +     unit->get_res = uvc_swentity_get_res;
> > +     unit->get_def = uvc_swentity_get_rotation;
> > +     unit->get_min = uvc_swentity_get_rotation;
> > +     unit->get_max = uvc_swentity_get_rotation;
>
> Why do you support GET_DEF, GET_MIN and GET_MAX for rotation only ?

Orientation has enum type. It does not require min or max.

For get_def I could use get_cur, but 0 is as good as any other value
within range.

>
> >       strscpy(unit->name, "SWENTITY", sizeof(unit->name));
> >
> >       list_add_tail(&unit->list, &dev->entities);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index d6da8ed3ad4cf3377df49923e051fe04d83d2e38..7cca0dc75d11f6a13bc4f09676a5a00e80cb38f7 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -45,6 +45,11 @@
> >  #define UVC_SWENTITY_UNIT            0x7ffd
> >  #define UVC_SWENTITY_UNIT_ID         0x101
> >
> > +enum {
> > +     UVC_SWENTITY_ORIENTATION,
> > +     UVC_SWENTITY_ROTATION
> > +};
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >   */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
