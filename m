Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652A326F445
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368833; cv=none; b=XzI5wdx82nsBvd/IB31L/TvirHvQZOacOzJQcruoCRK/sDO1t0WRsyF26mrHvo4SX2Wa/MeUHTYxQFwgqIRoNMluFQhHzOqeBtLHa7NxoX+axXx+EAFp3Bx4Qb2Zogy1eVVx2BGt2p7xBMJNJC5YHMfy7aprPHIQn5N32dAmdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368833; c=relaxed/simple;
	bh=9ksikN0iTD/GCWHlwVzlhstVFQF+DnzhexLRXUKHtb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gA72/cnLH5nDpf/JlkUd37vCRyl5V6i5NIyGEByXB6lO20Nlxd7uZzX/yTMx8vwaMSgNFpDSt55b7I4BdfK+g5GEhOw6udoSccctzHlnomWx2JQl3qx7ehBoXBpRW2aMG99lx22geRt5etkTsJdp5hmHB1A0icPp9/85CQg32hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XLZ1GENW; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XLZ1GENW"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553d52cb80dso5821559e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751368829; x=1751973629; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZwGCtkc+w6FZ7pTS+qyfMjlhro6+usoRehWf2lDots=;
        b=XLZ1GENWaTZHJsvjR1C6IgtMzwQPcaEStMHg7AXXcUAA1lg2uzHFy5/UOk2MjEvKLJ
         xmLydFIIBYjVCiSegySJRt75IqIrAQ3753zbhwX6bCzSiQluTjmiB5GdKaQDOujiIFko
         etJiBK2E/YvdXL8OgfSOVZefKi/lrtEAuM+wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368829; x=1751973629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZwGCtkc+w6FZ7pTS+qyfMjlhro6+usoRehWf2lDots=;
        b=r9LSSi2muX93pJJ8vd/SG/ay2kuSnKCkPEMU3zWopjngtPb9qorTRTSUdLjpcPIqfn
         HrORpsE67d/IGCHoBBbLXlcnNNxty6tWzDOqYdUjtPmaPuhn700Prq7Z4J4UL6h1bUhs
         sX1FGXgbzSvzfteFDpZrwLtc5kjhiGF0IClxuEra4os7unqznSxviS+Wluwt3+YX1KMk
         SDPROIbG2QHLhWtlCr6xqdd8QpnsRUhX2mNRRWAiPaMr48hzM0+RELO1oAJfxkMn3BSK
         3tps+CyzVQQFKHYtZyCKxo3vO9k1/9iatTPN7holgpdxwKVsHcWeBg4Hk0baqUzmwmpv
         8IMw==
X-Forwarded-Encrypted: i=1; AJvYcCVOhQUrqoxgA2/ROIYv7UP5ViXFDWGgj+3bFBAJ9q0PMmon7EHEKoEsOtMF4278t0xDycNFUT2AOyrF07c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywak33dP05a9EdSr14cf6DFLprhCx9rC/4oPq/AjnDdWyhbqYhc
	X6rpykHCvzmcJARcfQCWL/BFR0nUGcr88BQrBwY4mJb2h5deTRo5aleaoVR0aP+pWscaIXzWxND
	iCbPs/g==
X-Gm-Gg: ASbGncslAE15mgUyUiPMd7wPRsJortr75kAKqYphEnfM7pcX395CYdgN2+MxWb8ILGK
	pPGfk6eSMu3/lkafOFW0suQFId4oYY6jK0uQ+n94OnRHxct1TEUdNwL6HdXlh2Q97oYs8NDAZtG
	VXakLlSjDoUTzFCrpe1SSK8fZHIlPM4cfG1ddyM7Cc5vDlbX9LytpKgq/69/Q/2JTQ+pE7abOK3
	OWZv4BfuqBC438OE8RWZNxWaJd8reWJWLllRSSDLjYdgj8BDOHYtGY9FmzhId9D7t4vQPAXcJ0W
	lV4m5XIkUHgXBNCEflDfdxdSHZF/e7jDcQU1Iiwtc9bJYsJezYpWOLNpn5RohwCKg70p0ZkBNWt
	dNFuHmu1o0zz99CPDlCNyRt4y
X-Google-Smtp-Source: AGHT+IF1l2560OSVpEzGnTO7OC79mhiq0tD9bxpY5e5+/HShO/5H+ACBZg1sS6goswOfXvba1qOCbg==
X-Received: by 2002:a05:6512:ea7:b0:553:cb0b:4dc7 with SMTP id 2adb3069b0e04-5561f83e630mr933884e87.9.1751368829186;
        Tue, 01 Jul 2025 04:20:29 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ee8337sm16504151fa.79.2025.07.01.04.20.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:20:27 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so7201796e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRwrqLr2z3esZVH7FA7dtAn6U3LgwmJAzo2FbBqxLBVaHecELiT5tMRM2oJuha4PVg+uJNmRe3hdU8DL0=@vger.kernel.org
X-Received: by 2002:a05:6512:3f24:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-556235309fdmr606439e87.26.1751368826374; Tue, 01 Jul 2025
 04:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org> <20250629180534.GN24912@pendragon.ideasonboard.com>
In-Reply-To: <20250629180534.GN24912@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:20:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
X-Gm-Features: Ac12FXzZWFSV19mV0XJRYxH4cTBUxCR__A0Z2BgypZ23AIk9o_remHKEgYijnOg
Message-ID: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] media: uvcvideo: Do not create MC entities for
 virtual entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent and Hans


On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> I would use "software entities" and not "virtual entities" in the
> subject line and everywhere else, as those entities are not virtual.
>
> On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > Neither the GPIO nor the SWENTITY entities form part of the device
> > pipeline. We just create them to hold emulated uvc controls.
> >
> > When the device initializes, a warning is thrown by the v4l2 core:
> > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> >
> > There are no entity function that matches what we are doing here, and
> > it does not make to much sense to create a function for entities that
> > do not really exist.
>
> I don't agree with this. The purpose of reporting entities to userspace
> through the MC API is to let application enumerate what entities a
> device contains. Being able to enumerate software entities seems as
> useful as being able to enumerate hardware entities.

What function shall we use in this case? Nothing here seems to match a
software entity
https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html

Any suggestion for name?
Shall we just live with the warning in dmesg?

>
> > Do not create MC entities for them and pretend nothing happened here.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> >  {
> >       int ret;
> >
> > +     /*
> > +      * Do not initialize virtual entities, they do not really exist
> > +      * and are not connected to any other entities.
> > +      */
> > +     switch (UVC_ENTITY_TYPE(entity)) {
> > +     case UVC_EXT_GPIO_UNIT:
> > +     case UVC_SWENTITY_UNIT:
> > +             return 0;
> > +     }
> > +
> >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> >               u32 function;
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
