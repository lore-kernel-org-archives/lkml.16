Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0C48460
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269064; cv=none; b=XB5ZU012JXsMtNz2M+K8fEWHVH3/x7HTfz9SQGeXTtcr70/tQdbe+BUYswUpy8xGhPBxqHGDA0Z/tgp+5BQ/nVIVdTUQioGN7LzE7es4l4gfl2trdqrfiqHA6FRJlQUpqyzAxIxHHZA25r2EAdAnLfxzxZZs2WYgfim5fx/dqqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269064; c=relaxed/simple;
	bh=cuPtAl70DsIAdto7tODFdWELXw3QIDw6d8jyOYNKrxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHp+9PUANxsDyg84a8adpBkiGYWJcFj/5VvWVe0hipS7uATFJKEPGXWq8Sq7LBWrujGPgebZWX10MFmwzI2+fGyUeWM7T+PGWyDC3CVE3dtJkCW2VgsuvDWIj5A7haksE8paV+Hbav/kOL4ZyHcffrp1qfet7ZoWGypcz6dcXT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lDCTKBbW; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lDCTKBbW"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b0d638e86so3909881e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748269060; x=1748873860; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=raAeqcWcFDwjO1XVy3sHjLwVxrUwawrB+c5wzY4h6ig=;
        b=lDCTKBbWLviJJotK9LtuDRHyjBgwWRd09o6Ht3xImKwkBPTcERvq5BIAjYMuEq1qZc
         93lEHHaWg72KD+Z8oG9aj8HtP3Yd9U8VOKSd2Zy7syssKOlbRHjlgHewwHcZ/RHrQSqJ
         xO3cg6mMdT+D1Y36ughAzJ+c0f/U4hZM0E564=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748269060; x=1748873860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raAeqcWcFDwjO1XVy3sHjLwVxrUwawrB+c5wzY4h6ig=;
        b=Pz+s4+6ODcWdyhCOwt+5PyepSnH0WnK18F1AjNpVu2tqsZU9e0Yp1t8ohsiEsWQRw8
         qm25SmerpkwiELoQmqdg2lKUirKCUQlxcgQooE5cnAdZ/5OX1VXCT2wBVpfWrPEkqIsD
         qjevc8zzdXKWf7JHoENxkI1Il4GHaNx6vNQ57+dJ+z9j1CMDMEoWDiqYLkcS0U66Ek2r
         N8zEdDUhKbZ9NKWtDqtAkA/ry2Xss0ggxzrkeDw2WNgNz5JYSLD85rWvA8krt4LoE6qZ
         AcqfV8Rxa9HGKVWhzUj7cVwHdjLQ3IGJdMHqz8K1Ndv6pk5mIVlhBT8APBZKUuRNAz39
         xsqw==
X-Forwarded-Encrypted: i=1; AJvYcCWdb3KTFtvBN2ytLeq7PvFkeDtYoSSLIqzW6Uc/WTuW9h30gS9TpeL06GrfaETvIuxvYWZNI5RBNIfsnFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpREOQZx3BtGZGe7C+Ygqgyd7Ves2ASsUNaYyzpQKo9iUSTY/R
	OS58Fr/Hu58Qa0IhjuGB6X6SDpNz5ZWWB+mpPA/OqmyZOTTJYp6Nbxc9YL/iIMxjOSO/c98A0FD
	v56Q=
X-Gm-Gg: ASbGncs8d1gstlt2daa0OK+S9L7FYCyIA9R5jBXG/tUrNwcAbgV1ta7C+T9IMUY+Bu+
	DbJjW9DEqx3Jh7N/lU+RCTZW/+dlW3NeuKUL14R2viTd5v4rY/eOYCXzRCRlgdFmYgerwjEQTa5
	eijW+6g3rG9b+Gy9SJUpqTL1vbzeskmUks4AW/0dFk5xP77LgbleBDUDOyFCyTNxTXfCNE8wS/z
	bAj8pJpq0Z1eZ5sy5Z/J13H5NUFcrpaQD9uKruRQ5tWdeBtRzZnfd1PF79e9bvMdTE5lBldUNWr
	ZRKPICiIE+Cy/8eZ1Pr3OXBPLWSW13SYc2EmScE8Zg/xV5AJG+nDPuS2XbmPXFxnhJ7NWPeDEBT
	Pzu5iwtalGbZiLA==
X-Google-Smtp-Source: AGHT+IFnOVc77XmzvNnpamn120rJfh/7KNNXwqcdJ5U9FKnkepPA60SF2kuexTRiQBF53T06FxyHgw==
X-Received: by 2002:a05:6512:3b8f:b0:54d:65e8:31e0 with SMTP id 2adb3069b0e04-5521c7a831cmr2456585e87.5.1748269060208;
        Mon, 26 May 2025 07:17:40 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc7d8a4bsm3213367e87.115.2025.05.26.07.17.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:17:39 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55220699ba8so2164532e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzDHQ8Tm5gCMtTcDzKG7r7EYkEEwv6TIRu4nu5IBEwHQKF88gswQJ3nyHh3kjTb4hIQPZFJXhp29gpNMs=@vger.kernel.org
X-Received: by 2002:a05:6512:ba6:b0:552:21b9:8bab with SMTP id
 2adb3069b0e04-55221b98dc0mr1726710e87.38.1748269058492; Mon, 26 May 2025
 07:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-4-f79974fc2d20@chromium.org> <20250526140209.GP17743@pendragon.ideasonboard.com>
In-Reply-To: <20250526140209.GP17743@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 May 2025 16:17:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCv-U_suiOQjF5iaPzBw_mZ9uxPDNqyr4CAi5WtWGEX0ng@mail.gmail.com>
X-Gm-Features: AX0GCFuKM1Q7H0R6OuSws2HvXrAAdO7EuxMEZWgM3pjt66_hxx74imqyluzNgpk
Message-ID: <CANiDSCv-U_suiOQjF5iaPzBw_mZ9uxPDNqyr4CAi5WtWGEX0ng@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 26 May 2025 at 16:02, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Apr 04, 2025 at 06:37:37AM +0000, Ricardo Ribalda wrote:
> > If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> > MSXU_META quirk.
>
> Ah, that's why you introduce a quirk in 3/4.
>
> I would prefer if you could instead add a metadata format field in the
> uvc_device structure (I'd put it right after the info field, and while
> at it you could move the quirks field to that section too). The metadata
> format would be initialized from dev->info (when available) or set to
> the UVC format, and overridden when the MSXU is detected.

I assume that there will be plenty of devices that do not have the
MSXU_CONTROL_METADATA control and have metadata.

With a quirk, users can try enabling the metadata without rebuilding
their kernel. They can report it to the mailing list and they or we
improve the driver. The contribution barrier is lower.

Another issue of the dev->info would be that D4XX devices will not
support the MSXU_META format. I'd expect userspace to prefer
supporting one format instead of 2.


>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_metadata.c | 54 ++++++++++++++++++++++++++++++++++++
> >  include/linux/usb/uvc.h              |  3 ++
> >  2 files changed, 57 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index fe2678fc795d7fd5a64e8113199012f34c419176..776d280f34afad515594a873acf075acf0438304 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> >  #include <linux/usb.h>
> > +#include <linux/usb/uvc.h>
> >  #include <linux/videodev2.h>
> >
> >  #include <media/v4l2-ioctl.h>
> > @@ -187,11 +188,64 @@ static const struct v4l2_file_operations uvc_meta_fops = {
> >       .mmap = vb2_fop_mmap,
> >  };
> >
> > +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> > +
> > +#define MSXU_CONTROL_METADATA 0x9
> > +static int uvc_enable_msxu(struct uvc_device *dev)
>
> uvc_meta_detect_msxu()
>
> > +{
> > +     u32 *data __free(kfree) = NULL;
> > +     struct uvc_entity *entity;
> > +
> > +     list_for_each_entry(entity, &dev->entities, list) {
> > +             int ret;
> > +
> > +             if (memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> > +                     continue;
> > +
> > +             if (!data)
> > +                     data = kmalloc(sizeof(*data), GFP_KERNEL);
> > +             if (!data)
> > +                     return -ENOMEM;
> > +
>
> A comment here to explain how the control operates would be useful.
> Reading the code I assume that GET_MAX will indicate if the MS metadata
> format is supported by reporting a value different than 0 (is it always
> 1, or can it take other values), and SET_CUR will enable metadata
> generation. I suppose the first GET_CUR call catches the case where it
> has already been enabled, are there also cameras where it can't be
> disabled, and where SET_CUR would fail ?
>
> > +             ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id,
> > +                                  dev->intfnum, MSXU_CONTROL_METADATA,
> > +                                  data, sizeof(*data));
> > +             if (ret)
> > +                     continue;
>
> Can there be multiple MSXU instances, or can you break here (and below)
> ?

I think it is safe to break. Thanks :)


>
> > +
> > +             if (*data) {
> > +                     dev->quirks |= UVC_QUIRK_MSXU_META;
> > +                     return 0;
> > +             }
> > +
> > +             ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id,
> > +                                  dev->intfnum, MSXU_CONTROL_METADATA,
> > +                                  data, sizeof(*data));
> > +             if (ret || !*data)
> > +                     continue;
> > +
> > +             ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id,
> > +                                  dev->intfnum, MSXU_CONTROL_METADATA,
> > +                                  data, sizeof(*data));
> > +             if (!ret) {
> > +                     dev->quirks |= UVC_QUIRK_MSXU_META;
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  int uvc_meta_register(struct uvc_streaming *stream)
> >  {
> >       struct uvc_device *dev = stream->dev;
> >       struct video_device *vdev = &stream->meta.vdev;
> >       struct uvc_video_queue *queue = &stream->meta.queue;
> > +     int ret;
> > +
> > +     ret = uvc_enable_msxu(dev);
> > +     if (ret)
> > +             return ret;
> >
> >       stream->meta.format = V4L2_META_FMT_UVC;
> >
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -29,6 +29,9 @@
> >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > +#define UVC_GUID_MSXU_1_5 \
> > +     {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> > +      0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> >
> >  #define UVC_GUID_FORMAT_MJPEG \
> >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> >
> > --
> > 2.49.0.504.g3bcea36a83-goog
> >
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda
