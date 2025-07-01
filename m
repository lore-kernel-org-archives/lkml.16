Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4D1DED52
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368410; cv=none; b=d2TXee8K5mCf/cnIj0x1ohEStksL8tcVUjFWwhEctPF4LdTL0Cf+CFR0FvNcHm/Smc+5goAYf9+M//IGQnUzu5T7BxG5GVP+tOcxsJp8eRU9iD9wAgEUx4aekGYo9W6ucHFB8ERWaBiYlJKQlVzGk6L4sTc/ddDWEg4XYkdEqyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368410; c=relaxed/simple;
	bh=FeqVp2yCUZ3ij1peE3WeZz1cWGh+QgySUCT2N/2Xbjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOG8vWbL5IVQUJtryMzPw/JWPgs6kD7pVwc93b0NBT4aIfUDDRpGXbk9hOCsF/3rdQaQbNHIzG73LdFKTCHY/y9Neep3HSk79WW9Ac2NvjdfITaXWmW/+A6UJg9eJwMGLLCBcI1MUBPnYnJIXqiW4XXDdkkI7DH92trMWDFbL6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=li9eqiCg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="li9eqiCg"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b82f3767so3591838e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751368407; x=1751973207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bGjQ61S1++mVkf3/jYVKvuXkIa1IOFszhbgMmRDC9tQ=;
        b=li9eqiCgH9LxeSIz1EwaVdkA6DiCz8HcgNLroR1mtLkcCpyH0q3bTkwjCGpf2etIh6
         Wt0wLSZbYWXWq3wNjvR7T+7tAf14asIqRPvj1Z9CeIOEAbnUzhpGkxdndf7xQshM6n7b
         7YDWBCa2nmaMFipFUkVHdoe08XACcCH0XJh1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368407; x=1751973207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGjQ61S1++mVkf3/jYVKvuXkIa1IOFszhbgMmRDC9tQ=;
        b=GUh0NwLtodEa1XX240JqIjwLJl4ezGoNAkkBBTX+YG8ZFmIseAukUFyYqmyaw+n0Sw
         WUa+qFhY1lkI92/WRxgmIDkwJGpq8m3HHP8wkCqugj6V56biljs1G0looCvOx6AUc5kH
         gdI+cCCwK6Ra9EEo/bYrBZbWUmgY1RTu0cqNvnZNWQQddiblXH1ildAo2MLO8lNxAYpe
         VlcZLM2Fe02WudG/+g1J7sj84+wYl7EjeT/huQT39/T5qY6B1k3UlOp0seCXkRaAnhQq
         v7+SO4Fd9L2UdtJSPbON7mU4n483cD31dh2OQ74RH3N+mmCumrerisjdIrqmIP/hXA28
         NeNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO5xGKYAbV9Cl2xNdv+31/Fe/DYxKaKzLcbDbWxKKoxEOTekj2EN0JRHWGl8r1Y2QMhMNLWrpWg+Yawss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVE8CJF04vhVUPo4xtUrqTOZFpRn41a8XGemBAyAmVdpgWRH++
	HmEAi8ShPdEVBCAcKG/cyomLmGnlovtB3BFi9V1chFKd7U2UdHv4JIvLlMl9IqzgbZ5Cd3ICaCu
	+gXWdTg==
X-Gm-Gg: ASbGncuTyPuxp0RA7TsKiFxzfF3/O5XHmQYM8x4XZrblFnfNNu4cPkL5RFKcQ+3rttx
	BD4u6rqwq+DyS1Ip7jqgE3lvRm/1wyBpuhWZiHgr3yZgc0sYeUL/ib462ml+FDlN+JQYNSMERXJ
	BLTOpYTHRd3FaiAEpwtqlGSlV/zb6LUta27kXtA1LFxDzQ80jUFw8Y9YtG1q7KKaXINNlSWj3zJ
	CUKtxw9cZGjagKWXUzL+9NtXtAOVaoUgcAW6oVzgfAvK9L0P1Smp3NVeAMZICOp6aA6kxdGBby9
	X8agppRwmhq1/nkbVNSXomM1mdo6gOCckgYje9PooWhDTnzGLrcS0yHNvJP1+lhzGiACcGjdgSf
	fNHc3K1wg3Ta35xkAbnKeH/cy
X-Google-Smtp-Source: AGHT+IGy9koaLnCNLnxmgHw3F41oz8FBNf/QTftto29HT7G1xcneOphMenvvBsuMhT3Qj9c2bSKZbg==
X-Received: by 2002:a05:6512:224b:b0:553:cf38:5ea1 with SMTP id 2adb3069b0e04-5550b87b62cmr5806274e87.15.1751368406489;
        Tue, 01 Jul 2025 04:13:26 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b8e17sm1781621e87.107.2025.07.01.04.13.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:13:24 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10594812so3694134e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPkxNLhtU2WUCGAjnwZ39EufXVXCgUTBtE+alQqw07m5PPtS2v2INfM7H341OOb29dKpQJ/XucwXlMJHE=@vger.kernel.org
X-Received: by 2002:a05:6512:224b:b0:553:cf38:5ea1 with SMTP id
 2adb3069b0e04-5550b87b62cmr5806214e87.15.1751368403239; Tue, 01 Jul 2025
 04:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org> <20250629181246.GE6260@pendragon.ideasonboard.com>
In-Reply-To: <20250629181246.GE6260@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:13:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
X-Gm-Features: Ac12FXyUB7J2CzeHXupatytT-Rncr6S6tZS3kWRK4b67_iOG9R3ef-6_Er_0YxQ
Message-ID: <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] media: uvcvideo: Add get_* functions to uvc_entity
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

Hi Laurent

On Sun, 29 Jun 2025 at 20:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Jun 05, 2025 at 05:53:03PM +0000, Ricardo Ribalda wrote:
> > Virtual entities need to provide more values than get_cur and get_cur
>
> I think you meant "get_info and get_cur".
>
> > for their controls. Add support for get_def, get_min, get_max and
> > get_res.
>
> Do they ? The UVC specification defines controls that don't list
> GET_DEF, GET_MIN, GET_MAX and GET_RES as mandatory requests. Can't we do
> the same for the software controls ? This patch is meant to support the
> UVC_SWENTITY_ORIENTATION and UVC_SWENTITY_ROTATION control in the next
> patch, and those are read-only controls. Aren't GET_INFO and GET_CUR
> enough ?

V4L2_CID_CAMERA_ROTATION has the type UVC_CTRL_DATA_TYPE_UNSIGNED,
that time requires get_min and get_max.
We can create a new type UVC_CTRL_DATA_TYPE_UNSIGNED_READ_ONLY that
fakes min, max and res, but I think that it is cleaner this approach.

>
> >
> > This is a preparation patch.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
> >       if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> >               return ctrl->entity->get_cur(dev, ctrl->entity,
> >                                            ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_DEF && ctrl->entity->get_def)
> > +             return ctrl->entity->get_def(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_MIN && ctrl->entity->get_min)
> > +             return ctrl->entity->get_min(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_MAX && ctrl->entity->get_max)
> > +             return ctrl->entity->get_max(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_RES && ctrl->entity->get_res)
> > +             return ctrl->entity->get_res(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> >       if (query == UVC_GET_INFO && ctrl->entity->get_info)
> >               return ctrl->entity->get_info(dev, ctrl->entity,
> >                                             ctrl->info.selector, data);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -261,6 +261,14 @@ struct uvc_entity {
> >                       u8 cs, u8 *caps);
> >       int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> >                      u8 cs, void *data, u16 size);
> > +     int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> >
> >       unsigned int ncontrols;
> >       struct uvc_control *controls;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
