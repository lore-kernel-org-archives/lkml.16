Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA61E98E3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086306; cv=none; b=iVljCkNX9d2eckmUk1pCoj5aW3YpbjGLb6v9NbTw2Q7VwXT2kL29cGzqo6WY7SEUtbVrLUIVWzjWLXt/G3fuUu17dGak4cY2Nqk6AnojyTII8GLtCGG1gb2OkBwYViZMYFhyCJ1QNiXfUwK2xnkLzNqRZi7fPxZk2IGDXFgHk+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086306; c=relaxed/simple;
	bh=xEEEFe2DCXOIcoLFyj2eBlLVjU/+jvg+u7CPfzyUFAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rw6R81zs5iQle69uHXeIKv4FgfAxkdQbsihUmp+7QJbtn57rmMlh8LFYMxt9SShM5a1hPV/KcJftBdGwjXv79xtb2Xt+GsueAUBHV0iaIiFVVdeFvn6EdRrOZanvinEMkWiel43SNPkZk5esMQJpTwLEVfwWMSXXS3OORwEaYik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V04j0MLf; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V04j0MLf"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b3c292bb4so34136321fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750086302; x=1750691102; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7CmiRg3wf48axsfuxxvYfT6/rUXvgOviud+TRcFYhmo=;
        b=V04j0MLfsiu+W8z7jpzYo38sKfiD2EkcrIGVpRIoq3fUX9gSBGoLCo01HU97fENSAO
         IwyIQ2m8DXQHQIVwoVNqey0NixqcCT8uPMm4NioMTnyTwb4+Iri+tDlcd6oIOkejn0ub
         f/wjG5ipNx4uRA3cTfPsBfJCGNbWXvN0zjaBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086302; x=1750691102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CmiRg3wf48axsfuxxvYfT6/rUXvgOviud+TRcFYhmo=;
        b=ZgONObZ7wWLOaO5PyFpVgrWPifsqjF4pduI4wFxf9twU++HksbnpzqpFtkGUmXv5ab
         I3zKofceJZqLZhNfQSAfs5sZ1rtdF73UwQlChjZNGPSLBExwCMb7v3dkz5KC6qtvVR2B
         kQfvrMcqbkyqVKe/031Tn2+CaxyUM3y55jkPZ6oN39emi+loVgpwyeiZTXnLmuipxu2X
         1rn2QCIgoAO4tDzZGlL21/qIbvR17pbz8RZavn7waGJ2WuIKbhEzrzSqO6G0aXgxkGGF
         i8SPn50nU/X80TCxb72r6hsSMKkQUAKHwbDo6UQTeiD/FmYmijQ/uEQ9blqfrlVbXKh+
         milg==
X-Forwarded-Encrypted: i=1; AJvYcCUwnTkeBM0RsVovSpSPNAD+DP8P8TYAjnHBGQqgs/HL/3S7QNA2dupLeJtsuQSl2D5fa73H/8UxS99RAtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3GN3iXfqJ3Sh0So+xxFtSoJAGOwRhPcj8E3H9tbL8H8lBbZ7
	TZmOxZjbPMpscmDeWtkounl6fqkTUf3zZViKkhbHCPE4A1vRfscDb2pNPbNzKUZFP0vSFxYnkzm
	78Gw=
X-Gm-Gg: ASbGncvx8arevCJb/YMlXGiAK7XccAOwVq1C2N+X1DV1qlQlf0XfLaes1GS3yYyKY1B
	blHj7bnh7t/clroLa0QUnpuR9bunD2mQRcjk/KesCT/b4MwY4h3vsjpyQ8i8/6BGSlT6aCcS0lX
	0S30XkIYZzOqhXeKrE2IH5UkANUgQ48NItTGKbdvmewwdqrSq2+v3sL4L1SFYc4JIqp+OMW3AvS
	66uR7cPx1DIYgRMZy69NmofKVQjWhV8ePvlV6Q/E3a/n0K1Or0rgf/LYGG83PZmardNAhiYcKi/
	9fHXAMpQ1YsEsPeYETvJrhw15EHp/C20sdCPlWVpxqsbtTBcKmBTr6AweKB7X8fMT7vjiUn+qz5
	u+XoH+vYTPMbCpwkRzNBswdHNiwzbdgYrk8g=
X-Google-Smtp-Source: AGHT+IHJebo4jMq9X8yFfptWGp7w/ui07OP3LBplKGSbo2j1aIwODhmA5vnJ4DSEZ1SHCGVhZFCjHg==
X-Received: by 2002:a2e:a011:0:b0:32b:2f5a:2144 with SMTP id 38308e7fff4ca-32b4a5f96cfmr11865741fa.41.1750086301849;
        Mon, 16 Jun 2025 08:05:01 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3304e964sm14656481fa.12.2025.06.16.08.05.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:05:01 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553644b8f56so4738002e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:05:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQxE4Y2oCwOA6fJpzdCJvho5KHl8Jf6wm3CKqJW/RDwYfF7yhCx2XqkusREZMetxYaXbV2kJ6pJ2G2EXk=@vger.kernel.org
X-Received: by 2002:a05:6512:39cc:b0:553:3770:c912 with SMTP id
 2adb3069b0e04-553b6f42a3fmr2460867e87.47.1750086300514; Mon, 16 Jun 2025
 08:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
 <20250604-uvc-meta-v6-4-7141d48c322c@chromium.org> <d1e5942b-f8e5-42c6-98ae-d346927df3cb@kernel.org>
In-Reply-To: <d1e5942b-f8e5-42c6-98ae-d346927df3cb@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 17:04:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCtXmXYkv3b_62iegTFOxBVrGUv9+mbioxvQvPsadwBpqg@mail.gmail.com>
X-Gm-Features: AX0GCFuHFKUi-9B4I3CPVjTQKDuL0NpKPYCYgWNg_SuaoEaEGMlQPtEEXLBpmJ8
Message-ID: <CANiDSCtXmXYkv3b_62iegTFOxBVrGUv9+mbioxvQvPsadwBpqg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 16 Jun 2025 at 16:38, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 4-Jun-25 14:16, Ricardo Ribalda wrote:
> > If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> > MSXU_META quirk.
> >
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_metadata.c | 72 ++++++++++++++++++++++++++++++++++++
> >  include/linux/usb/uvc.h              |  3 ++
> >  2 files changed, 75 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index df3f259271c675feb590c4534dad95b3b786f082..cd58427578ff413591b60abe0a210b90802dddc7 100644
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
> > @@ -188,11 +189,82 @@ static const struct v4l2_file_operations uvc_meta_fops = {
> >       .mmap = vb2_fop_mmap,
> >  };
> >
> > +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> > +
> > +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
> > +{
> > +     struct uvc_entity *entity;
> > +
> > +     list_for_each_entry(entity, &dev->entities, list) {
> > +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> > +                     return entity;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +#define MSXU_CONTROL_METADATA 0x9
> > +static int uvc_meta_detect_msxu(struct uvc_device *dev)
> > +{
> > +     u32 *data __free(kfree) = NULL;
> > +     struct uvc_entity *entity;
> > +     int ret;
> > +
> > +     entity = uvc_meta_find_msxu(dev);
> > +     if (!entity)
> > +             return 0;
> > +
> > +     /*
> > +      * USB requires buffers aligned in a special way, simplest way is to
> > +      * make sure that query_ctrl will work is to kmalloc() them.
> > +      */
> > +     data = kmalloc(sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     /* Check if the metadata is already enabled. */
> > +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (ret)
> > +             return 0;
> > +
> > +     if (*data) {
> > +             dev->quirks |= UVC_QUIRK_MSXU_META;
> > +             return 0;
> > +     }
> > +
> > +     /*
> > +      * We have seen devices that require 1 to enable the metadata, others
> > +      * requiring a value != 1 and others requiring a value >1. Luckily for
> > +      * us, the value from GET_MAX seems to work all the time.
> > +      */
> > +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (ret || !*data)
> > +             return 0;
> > +
> > +     /*
> > +      * If we can set MSXU_CONTROL_METADATA, the device will report
> > +      * metadata.
> > +      */
> > +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (!ret)
> > +             dev->quirks |= UVC_QUIRK_MSXU_META;
>
> Since we set the ctrl to enable MSXU fmt metadata here, this means that
> cameras which also support V4L2_META_FMT_D4XX will be switched to MSXU
> metadata mode at probe() time.

Not sure that I completely follow you. D4XX cameras will not be
switched to MSXU, they will support MSXU and D4XX with the current
patchset.

>
> So even if cameras exist which support both metadata formats, since we
> switch to MSXU at probe() time, disabling V4L2_META_FMT_D4XX support,
> the uvcvideo driver will only support 1 metadata fmt per camera.
> Which is fine supporting more then 1 metadata fmt is not worth
> the trouble IMHO.

If we only support one metadata, we have two options for D4XX cameras:

A) Switch to MSXU: apps that expect D4XX will not work. I think this
will mean breaking uAPI.
B) Keep D4XX and ignore MSXU: apps that work with MSXU will not work
with D4XX cameras. I do not love this but it will not affect my
usecase.


If you are ok with B) I can start the implementation. But I still
believe that the current option is more generic and the extra
complexity is not too excessive.


>
> This means that Laurent's remark on [PATCH v5 4/4]:
>
> "I would prefer if you could instead add a metadata format field in the
> uvc_device structure (I'd put it right after the info field, and while
> at it you could move the quirks field to that section too). The metadata
> format would be initialized from dev->info (when available) or set to
> the UVC format, and overridden when the MSXU is detected."
>
> is still relevant, which will also make patch 3/4 cleaner.
>
> The idea is to (in patch 3/4):
>
> 1. Introduce a dev->meta_format which gets initialized from dev->info->meta_format
> 2. Keep the quirk and if the quirk is set override dev->meta_format to
>    V4L2_META_FMT_UVC_MSXU_1_5 thus still allowing testing for MSXU metadata on
>    cameras which lack the MSXU_CONTROL_METADATA control.
>
> Doing things this way avoids the need for the complexity added to
> uvc_meta_v4l2_try_format() / uvc_meta_v4l2_set_format() /
> uvc_meta_v4l2_enum_format(). Instead the only changes necessary there now will
> be replacing dev->info->meta_format with dev->meta_format.
>
> Regards,
>
> Hans
>
>
>
>
>
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
> > +     ret = uvc_meta_detect_msxu(dev);
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
>


-- 
Ricardo Ribalda
