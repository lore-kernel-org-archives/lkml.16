Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F50D259CAB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479632; cv=none; b=TKUYG27jfqn+jsDERQmFRF+PsIhJ+aCat5XR9KL619lcsX2ZY8NZoiaWW4xiWmJx4RbyCa4wAXZUFpo6ijpUTyWgKIrC4z6Qdes8qkNPL3Weou+P1Zr3I60A922cLWS+ZqGDX+c+VlWpiqa13dwMmReX3+IzDx9o8C1zTlYTemI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479632; c=relaxed/simple;
	bh=i3wBGBn4gVrChGX5tMas+8u9RupFJTSeeGp5dq6Xf24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdtDjlkosQoVYfrQTKMTDagh17a8xbqYNPf6Oxf2upzMfvn16Oh4cmLQpahTiMtr99whImDSuscAKOrYT4pSL3kYjaXUt0KqakewPeNxtuxNu22fO29djkTMht+fY/C9oMVFGxDCORCDIHoR1DsvorFPa+pRNSWqtxqZyJ46RfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=mFIGm8cz; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mFIGm8cz"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7d8eb10c06so3206578276.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749479629; x=1750084429; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sRem6DUXALCMBVMdkPkqunnXTIQihy9/t+dbXKMENhA=;
        b=mFIGm8cz1X+IgEcioS0MntgCwtbTXK7W/A3QVjOsP+vVG6dC4L066d9k9DP84ilClA
         NJ6GZQm4Cs+wb2Zx/MOtRk6+b8Ysg0t/m+1QwF84Y2Ixvol3foR9B8u+xr+qwDKpwYrh
         792TP+jQRDi80Z5uFZCXjBcyTTiTz9/i07nJq/07Ztko2gxPdCMkfb3NbS2Un4n0mG0D
         sfxRF2IKDqjyDqYsh40RwjURQGMM6u/34YrgcY0ikcDI4ARqgRVFmzVz7ZRWjV3kqbBU
         PB+FB2utVyMD6po7LNAZ7fEDh54ybatStyHCjSM5pw46SzJrulXvxRn70KkzWCI4KnZ3
         TEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479629; x=1750084429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRem6DUXALCMBVMdkPkqunnXTIQihy9/t+dbXKMENhA=;
        b=HwUnj9P45J1g95MGGebmze/5avydFiM9B08XD5k9n3U+Z2f5M7DfnPRBOr9P1u8bho
         roLdnA2YTliU4arl4ZL783N6zS6CCxjHD1FTMipmZL42IX+n1luEjLVxl6QBwIPfNRY5
         ngHKKmAtC8RYvKVrv+kmfJBy+l36FOEgZ8MG4UcSvZDYIIJB2y5K1sQRyLecnyLBrS6+
         W94Q9Eq/y8vMaEJHhD8QLUJuaymJBXkLW0Y0bR/fCa7C+enBd+ixo5FBsJMUxuFLP1E7
         qbu8cx+tvGXV+4BpAJCvTcWMO56iPmZz5/mVpoWizRr7pWCZx8c73RSq6llSjYoaEMpT
         kjpg==
X-Forwarded-Encrypted: i=1; AJvYcCVznBMQt5lnL3Aa17a5Fck/OareoxQgRcYmy1VHFw7M8xZDIRlSVb75Ejf8VhQ/3YW/CIYqSBeK8vq2Hkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCybSh0J3byu128bBSImpM9iey6p2T5Fp1FVImt0GUa0lrniQk
	S1LyhpNuDMQcVZ5q7a7rVxLG073o8/3vhwwD/N4SWsPebFRIvshdNzQykzvMJ3w9BARMZ6icN7D
	Xw7ADZDG98eOYJVHKOoNK3qFmQQU9ZKdaU7UaS5DFgg==
X-Gm-Gg: ASbGncsr+TEO1plwPBCOMRQ3XSxekRn0iEWjnmXwBrKwEtk6s4XWxVC8OCBsefRawDo
	mRUJmni/Np9RJRVy4WA8oVkXtUq6KTde2zP/AfUdDLph7Ef2l0xkoqCzpZ8pY4NGO1Qvnj3pyqQ
	g/yqmvzYKQid7ywYeC8xFd6UNItv1OXN2ELiXKihPQdVW9vncw++eW1qQB815a49vr
X-Google-Smtp-Source: AGHT+IG1XJVR1tbSdYVEWb4FS9GgmPTyeQbC5abWxdU05n6qKza4L8IcMKs32v/CHUtfg34znpezTvSPYt1ejigyCiQ=
X-Received: by 2002:a05:6902:100a:b0:e7d:c56f:a871 with SMTP id
 3f1490d57ef6-e81a21ee9f8mr16917604276.31.1749479629037; Mon, 09 Jun 2025
 07:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org> <20250609003751.GD14545@pendragon.ideasonboard.com>
In-Reply-To: <20250609003751.GD14545@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 9 Jun 2025 15:33:29 +0100
X-Gm-Features: AX0GCFtDywSf6GaR04ACAWb_r7XEMRsKC-bKUld6TILW38C8e_WYvs7YAoWpTFY
Message-ID: <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent & Maxime

On Mon, 9 Jun 2025 at 01:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Maxime,
>
> Thank you for the patch.
>
> On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> > The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> > components, with the components being in the red, green, and blue order
> > from left to right.
> >
> > The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> > RGB888) with blue coming first, then green, then red. So the opposite of
> > what V4L2 means by RGB.
> >
> > Since the hardware cannot reorder the components, this means that when
> > selecting the RGB24 format, you get inverted red and blue components
> > compared to what you'd expect.
> >
> > The driver already supports BGR24, so we can simply remove the RGB24
> > format from the driver.
>
> The only reason I could think of to explain why the driver exposes
> V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
> with a non-standard order. I don't know what hardware would do that.
> Dave, Naush, do you recall why this pixel format is supported by the
> unicam driver ?

I've lost track of exactly what gets validated along the pipeline.
unicam_video_link_validate [1] looks to ensure that the V4L2 pixel
format and media bus codes match as listed in the table.

tc358743, adv7604, adv7511, and adv748x are all saying they produce
MEDIA_BUS_FMT_RGB888_1X24
ov5640 says it produces MEDIA_BUS_FMT_BGR888_1X24.

Is that an error in the ov5640 driver? If not, then both entries have
to be in the table to support all those drivers.

Looking at alvium-csi2.c and st-mipid02.c, both mappings are included
there (and RBG888 in the case of alvium).
Unicam's hardware doesn't care about the ordering as it just writes
the incoming data to memory, so having all the sensible mappings
between MEDIA_BUS_FMT_* and V4L2_PIX_FMT_* values makes sense.


My initial reaction though is that simply removing the entry won't
solve the problem anyway. You won't get a match between the
MEDIA_BUS_FMT_RGB888_1X24 requested by tc358743 and a supported V4L2
pixel format, so the link_validate will fail.
Swapping either fourcc or code between the two entries would be the
fix I was expecting.

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/media/platform/broadcom/bcm2835-unicam.c#L2151-L2169

> > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
> >       /* RGB Formats */
> >               .fourcc         = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
> >               .code           = MEDIA_BUS_FMT_RGB565_1X16,
> >               .depth          = 16,
> >               .csi_dt         = MIPI_CSI2_DT_RGB565,
> > -     }, {
> > -             .fourcc         = V4L2_PIX_FMT_RGB24, /* rgb */
> > -             .code           = MEDIA_BUS_FMT_RGB888_1X24,
> > -             .depth          = 24,
> > -             .csi_dt         = MIPI_CSI2_DT_RGB888,
> >       }, {
> >               .fourcc         = V4L2_PIX_FMT_BGR24, /* bgr */
> >               .code           = MEDIA_BUS_FMT_BGR888_1X24,
> >               .depth          = 24,
> >               .csi_dt         = MIPI_CSI2_DT_RGB888,
> >
> > ---
> > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad
>
> --
> Regards,
>
> Laurent Pinchart
