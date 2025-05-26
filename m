Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105C160B8A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269262; cv=none; b=MBVq1Mjg+e6pkojhWI/8g+Ib3xrXEXbbB9aFHNPNQN4J8VujwSMyRiApQM5KXZFdPDJuLhgh58pto+aWw1uJXNbn0rgm6H0YOeph96qxkJrQlYVab4JkIv3/wKS2p1qJ6tARTQ+hAIPOWGZw6G/IW1zMfwyXhw3/TGkSAbPoTA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269262; c=relaxed/simple;
	bh=+GvBLwbPHR++3tn+n2fPvyA3fxxa/O2uiSFIuiOXqDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d53FVyKQKQiVK4x8/DrcuSsapA61OyxH/FBal3YomMUOFBA2RRMaTXIj9T3Bbm2rLZAEBzQ6t2PJ5fsIaU2mWlYywF/CTPwkjHN6OUebgUbIWB3mNfLKNRwyoxmnjqQIm0jbKW+FChfHdI159v5QNDVAgW/sPxJG7MzP0pqJ/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PLQbcGYF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PLQbcGYF"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-552206ac67aso2707758e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748269259; x=1748874059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMWFOmADnSkPCqAEpOs4Z7SgARh/mv/ohxEMBVEoCkM=;
        b=PLQbcGYFiy1YWsw1PqQAWxIRXGXVi6HTHF4bMyYJhT8WPilzrRxnh1XMq4WJR5X+yh
         Zi9xm2h3yatJM6KY3O7ACnf5AGoyNccr6BYQrW827F07IY4Cu5SKLeyowY5D69pKscZO
         dKdOlPBN09zDIMO/mMB1pf6OKm+GD7Ld5bwv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748269259; x=1748874059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMWFOmADnSkPCqAEpOs4Z7SgARh/mv/ohxEMBVEoCkM=;
        b=Y3taMwWIrtsmdzi4m0KxjoAol58W0CIoUD5d2AzIgqYI0Jv1IoA19Vzx8WHN+dutk7
         xBLvQaI2iLYm/bwquVQe4O3mRyj40faJ9kc2UacT5GtvznDaSJnK7hcK5zdX9elmYV+E
         kyCGRlBKb6ZO/AYRGftAdUG+HjA69JrFeBMZl0hORdo70W8nKuRRQ+7P9Wk3ECDlf0qG
         jOLdVQkamPLmQ0laIq2XsjlhUlGMb6aaXzg0v9+5qeNX3HEpR0RnNebYoAWzXXyXBwac
         VKYLwyLQrsZ5zcp4yfJ/AQ2ZPD7YmBnsfC/KXnmAWjldTK6V81w46A2rjudHLoC24rR9
         2fCA==
X-Forwarded-Encrypted: i=1; AJvYcCWRWae+v3LY4QZ6gFhhcqk2onbKoTHy0LshtNfAoe2o6X21EY+hKsetfYCqqmHatloQWvBaOaFNNwgIj0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJtCfR38YKZT9mH5lKkcAn3qXWnpvAxhALCxo3kX33ikj3z5H
	fyW/L2hmiOldow7U75a7hbvDkC1uIyABEHDHOrlJJTGspRWsuJXy/RMhcm65VkSm18MzQPykKt6
	fJw4=
X-Gm-Gg: ASbGnct5i961TwIsM+exSDiEGDCmCQAZquGqaBss/f9/bC2RbUhX5UHEdX8ifk/GCk5
	go81W3Lk6SbbDFHRvpp15iGZm7sNsDhck8ZMLlUqfF7kotUSZD+roYoKdTbK9ElflZ5ki4eRmrM
	c8FQKaodhQypgQptiHn1a6fJ/9IIKAZG7jw88NjlAUFRzRVW9mE08dF0Dh1R8DR5UtcFyHNLkcb
	oFe2Wo6K5ff+7PxMaKXB0gyzk8sEhhh4R36LL0ijAeF7nV+1sN5GqSpHGzEY+Aj2ayjiCT+Xa24
	WPPd/vK2pHtruC2H069CG/tyq+UIoCER64vANpcccunj98lRn2joVUmCDJ0/s4Ksvg1gG10ywPS
	6DaIYN63D/f0nHg==
X-Google-Smtp-Source: AGHT+IElmPV4B1VaM3GUdAal64POT6rDzr9ha7Z0B6mt18c7CHuiwHYbNqr0vnTbT15Pum9vmveBTA==
X-Received: by 2002:a05:6512:3b9d:b0:54f:c5cd:ce4f with SMTP id 2adb3069b0e04-5521c7b2bb9mr2401902e87.6.1748269258972;
        Mon, 26 May 2025 07:20:58 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55321f79afcsm449814e87.35.2025.05.26.07.20.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:20:58 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54d6f933152so4039254e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1GdRsQiKOO4mDaM86zi/lSdKSBzeVgJThV6urr43Jvb5RoEnW1K21CBkl/yYpnesE2md39/CvNqFjqgc=@vger.kernel.org
X-Received: by 2002:a05:6512:3b99:b0:550:e31f:1d2b with SMTP id
 2adb3069b0e04-5521c7b2c03mr2553491e87.7.1748269257163; Mon, 26 May 2025
 07:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org> <20250526134946.GN17743@pendragon.ideasonboard.com>
 <CANiDSCvPG_3qc4Emhat=NdRZXsmNDD0pwh182bXDFK2TgYN_ug@mail.gmail.com> <20250526141323.GQ17743@pendragon.ideasonboard.com>
In-Reply-To: <20250526141323.GQ17743@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 May 2025 16:20:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCvyBW2Zq6o2hbwQBOEPukryAgkqnfQhk7=zrdi7K5fF2g@mail.gmail.com>
X-Gm-Features: AX0GCFvNO8tsQGO1aHgP4sO3xXb2JpJ4EjmeQmbHw4vX4sNtOKkjz6mtFR1XHGw
Message-ID: <CANiDSCvyBW2Zq6o2hbwQBOEPukryAgkqnfQhk7=zrdi7K5fF2g@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] media: Documentation: Add note about UVCH length field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 May 2025 at 16:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, May 26, 2025 at 04:04:03PM +0200, Ricardo Ribalda wrote:
> > On Mon, 26 May 2025 at 15:49, Laurent Pinchart wrote:
> > > On Fri, Apr 04, 2025 at 06:37:35AM +0000, Ricardo Ribalda wrote:
> > > > The documentation currently describes the UVC length field as the "length
> > > > of the rest of the block", which can be misleading. The driver limits the
> > > > data copied to a maximum of 12 bytes.
> > > >
> > > > This change adds a clarifying sentence to the documentation to make this
> > > > restriction explicit.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > > index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
> > > > --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > > @@ -44,7 +44,9 @@ Each individual block contains the following fields:
> > > >          them
> > > >      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
> > > >      * - __u8 length;
> > > > -      - length of the rest of the block, including this field
> > > > +      - length of the rest of the block, including this field. Please note that
> > > > +        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
> > >
> > > "the this value" looks like a typo.
> >
> > Thanks! Will fix in v2
> >
> > >
> > > > +        never copy more than 2-12 bytes.
> > >
> > > Are you saying here that length can be larger than 12, but only up to 12
> > > bytes will be copied (when both SCR and PTS are present) ? If that's the
> > > case, it would be better to fix the driver to clamp the length value to
> > > the number of bytes actually present in the buffer.
> >
> > As the documentation says, this is an exact copy of the UVC payload header.
> >
> > Assuming SCR and PTS, for devices that have metadata length will be
> > the real length provided by the hardware. but buf[] will only contain
> > 12 bytes.
> >
> > Replacing the value of length with the actual value will be a uAPI
> > breakage. I do not think that is a very good idea to change it,
> > considering that this number is used by parsers.
>
> Do you think there could be userspace code that relies on the value
> being larger than 12, even though the metadata after the standard UVC
> block isn't present in the buffer ? Are you aware of any particular
> implementation of such userspace code ?

Userspace code can use a value bigger than 12 to know if the actual
metadata has been enabled or not.
I have been using that to test my code.  I would not be surprised if
there are more userspace implementations like mine.

There is no reason to break uAPI, especially when it is documented to
behave like that.

This patch is just a clarification of the documentation. I would have
loved to have that clarification when I started working on metadata.

>
> > > >      * - __u8 flags;
> > > >        - Flags, indicating presence of other standard UVC fields
> > > >      * - __u8 buf[];
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
