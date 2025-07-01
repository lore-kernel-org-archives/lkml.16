Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB6F17BD3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397977; cv=none; b=fQfKGwjqzrRFw9fs5XAqKeqGYfBO7mV6uLtC2WB+mDFIDo583mAkYWm85BOzEa9K6bV+1rtyKfStRQP1z/RMQKGWr34bRqeK1o2WeoQI4HQlsGXXqKDWF5aMCfsTLkBzEzmH9oKqiBoCfPjerbmnTcDKuBvMCUzZ25J1FLsHOh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397977; c=relaxed/simple;
	bh=cwajf2NZRN6+ve8yn+VW0OKQnhusAApLlfPHRPDUiGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3TgMK5zxOVtdWlIBQaKlJpDZQqJ+s88/5Qa9ffZy8QBXKyzfyLDOov+szI7z012arbMGHDHJ/HV5tkVp5Qq6YUtyeNx7IVb/TsXyrAhR6ITbsMFyWX2ksSFrdx3dLPv0u8xua0PQ3io5jETH9tjPkGh4AmbMbQ3OUbOgHhjXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e73TrTo4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e73TrTo4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b5165cf5so8126688e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751397973; x=1752002773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4utgEvH9OCXANPspYqWuw9qzjmvBfVTuyM3bVpcn8U=;
        b=e73TrTo4tX2wcISTKkiZyzwW3zqKemzEl64HA6QNPEmcdsRYlagpFf8LTq01ZbSxG4
         z2r0RQhSpB+TZSmpZjZxQVRqaGvsGJ1ZCQ8smbBOC88fdptwkYbIryIC/31LAMzMloD8
         j5ENzJ2yGqD+aIImG8Qqhd5gA/s6I9T06kFy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751397973; x=1752002773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4utgEvH9OCXANPspYqWuw9qzjmvBfVTuyM3bVpcn8U=;
        b=KAKCvA6HCa0FzWFWhNQXebv8iHVt+VaLmQhLAilJ0xdeWdCYnKEFUdv3FadAQydacZ
         BTa5wqvAEZgMFG7kFoIEeA03vS5+aBln8XnW6lqIQwCw3iAZnvWYfko5apQ0vBX84nPY
         76hF1uvfr5e2wWvRG2o/ZTgkIbnznPuOpIVLdIsszgo6puOrZ0sIB5Rs/QlOPA0ml9aI
         3aMVHh7iWI6mZ+yEBNvIXdsbAqgSABDlHlAqQldyVCMUJQZubQL3X70sLJTmV/wLj+Gw
         hQ7LZqIKCHSVWmDTDCo23i3534RFbtdtjBcj8Z/fDxPzNlFyxBeRwp2IUZkNM+ZEOanC
         nJVw==
X-Forwarded-Encrypted: i=1; AJvYcCUFEX2mewYCJrIdoA7AhmR5zZX2KZdQEmrsn+SON1wkmzQsMnzh4SF22xMuOKlozJBWOo1tVZxg2s04nAI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk8tJu7R7lc1Q6wfdAvWLKocqanQIc0Gij+o0kM3FNCZFKAOgj
	alTAPDnbVZU7F1OOUB5r9VngoOpE4CL8pp1GnSCJj2Q5/ZAaS2Esy6gwTO8k3RTOZGevzn5cDUK
	xZ0tOpQ==
X-Gm-Gg: ASbGncsfEhypdjbxdxT7J+mRBomjr3BThTZo9w0JtVovXDcmO1kRfXJyiSXohQVN4hC
	5jL6L4dgojDb1nJva/bZ2ksMOVecvIDh/FZZ8ZSQtOkDYQyi47J5yWeU25MI5tAelFF4t/Q9XGK
	ZoNF9bCvqPILnn6jUKDL/lPLDjKdNJiGMBNe8x2eoYNw2BGxxoVNpWIO0NLkigTK6LoYDlerqHq
	mvrag0Mtj3ahBA+edUOF6rELjrqSiWh16Esy+EgEJ6jXlqdU8E7DkgaBR8Q31Zs6DkxiPrR62Bg
	w+XgmmeRIPFyL/RuxI/Ipr/DMj41vXYqaIhA+xqvgdcbxs239IZt05q84AHIMNS8iVLrfs1WCqe
	K9rxmrXhinZFqnxiqTWasXq9X
X-Google-Smtp-Source: AGHT+IE+gjPO9W/1jGFcKiI4//dxZlyfNp+vALzu9hkNH2Ji0BsUm1EnwPPu7kuK8Pc29iOJTBthGg==
X-Received: by 2002:a05:6512:6d3:b0:545:225d:6463 with SMTP id 2adb3069b0e04-55628335cc5mr46748e87.42.1751397973343;
        Tue, 01 Jul 2025 12:26:13 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b255a51sm1927518e87.88.2025.07.01.12.26.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:26:12 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b5165cf5so8126656e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcnJTSlkDvdslK6a5jcOPSxsIkP5RsGlOAVASrkB6zliipvdO+sXAEZVq/z8rSjlszGnI7G0k6uTLozE8=@vger.kernel.org
X-Received: by 2002:a05:6512:1293:b0:553:2868:635c with SMTP id
 2adb3069b0e04-5562834a344mr50157e87.48.1751397972437; Tue, 01 Jul 2025
 12:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701145240.105959-1-desnesn@redhat.com> <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
 <CACaw+ex_T5xS9rw1651TV_z1myXxPGmtpeEB4HWA7S0xU+C9GQ@mail.gmail.com> <20250701184134.GC1936@pendragon.ideasonboard.com>
In-Reply-To: <20250701184134.GC1936@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 21:25:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCt5OZ8dAvZ7G_fic6eCaCsGvmnprjmG9p_9kLbv9cX76A@mail.gmail.com>
X-Gm-Features: Ac12FXwM6kmb2sRGcL5AthygUsvgAzOtk6TXflHlfutcb8FC2IwoXTjoll11H3w
Message-ID: <CANiDSCt5OZ8dAvZ7G_fic6eCaCsGvmnprjmG9p_9kLbv9cX76A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Desnes Nunes <desnesn@redhat.com>, hansg@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Jul 2025 at 20:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jul 01, 2025 at 02:20:53PM -0300, Desnes Nunes wrote:
> > On Tue, Jul 1, 2025 at 1:48=E2=80=AFPM Ricardo Ribalda <ribalda@chromiu=
m.org> wrote:
> > > On Tue, 1 Jul 2025 at 16:59, Desnes Nunes <desnesn@redhat.com> wrote:
> > > >
> > > > This avoids a variable loop shadowing occurring between the local l=
oop
> > > > iterating through the uvc_entity's controls and the global one goin=
g
> > > > through the pending async controls of the file handle
> > > >
> > > > Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM cou=
nter per IOCTL")
> > > If you add a fixes you need to add
> > > Cc: stable@kernel.org
> >
> > Thanks for letting me know
> >
> > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/u=
vc/uvc_ctrl.c
> > > > index 44b6513c5264..91cc874da798 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -3260,7 +3260,6 @@ int uvc_ctrl_init_device(struct uvc_device *d=
ev)
> > > >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > > >  {
> > > >         struct uvc_entity *entity;
> > > > -       int i;
> > > >
> > > >         guard(mutex)(&handle->chain->ctrl_mutex);
> > > >
> > > > @@ -3278,7 +3277,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handl=
e)
> > > >         if (!WARN_ON(handle->pending_async_ctrls))
> > > >                 return;
> > > >
> > > > -       for (i =3D 0; i < handle->pending_async_ctrls; i++)
> > >
> > > nitpick: I would have called the variable i, not j.  For me j usually
> > > means nested loop. But up to you
> >
> > Noted - I used a different variable name because I wanted to
> > differentiate the loops.
>
> Variable declaration in the loop statement is relatively new in the
> kernel, so there's no consensus yet (to my knowledge) on clear coding
> styles, but I would have simply used the same variable name in both
> loops, with two separate declarations:
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index 303b7509ec47..6b9486749c3f 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3299,7 +3299,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>         struct uvc_entity *entity;
> -       int i;
>
>         guard(mutex)(&handle->chain->ctrl_mutex);
>
> @@ -3317,7 +3316,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>         if (!WARN_ON(handle->pending_async_ctrls))
>                 return;
>
> -       for (i =3D 0; i < handle->pending_async_ctrls; i++)
> +       for (unsigned int i =3D 0; i < handle->pending_async_ctrls; i++)
>                 uvc_pm_put(handle->stream->dev);
>  }
>
> Is there a downside to this ?

The toolchain that they are using does not seem to like it, and there
is no benefit for having two initialization vs one.

(also makes the lines shorter... but that is just a matter of taste).

I don't really have a preference.

>
> > > I am also not against your first version with a different commit mess=
age.
> >
> > Third time's a charm then!
> >
> > Will send a v2 with the first version having this commit message.
> >
> > Thanks for the review Ricardo,
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda
