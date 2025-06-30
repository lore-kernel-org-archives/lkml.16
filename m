Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB121C161
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312190; cv=none; b=WkhPn204c3cR/u0Z5pkclBn19fhgOMe5bfAU3PpwGrr+nvBqxzH4QvkeQkf/OXT5GKcG+dWSr2DYKkhegeLNHEqI82pnILsn97u5ABzslMjs1cHMzNwAFMqqmObKgP3RlG6x0eOkfApCLcQxSc4AeA+iRXpTA9kAGQYfL1h1DTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312190; c=relaxed/simple;
	bh=5TpnHzgkPKZyd5eTFqOI9O+gnDg/EXjnpEK1/f1p6E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+vUrHv4gX90IjyOC9xwU6lfEGlvW+2PK6kAAkrU1EJypOESzJK80gbTAHiV0sDPMMvvpKGnt8RP279J0uYerdkK6CghwXJkW/eRB2ZItlGHHJRg5leNQjJ+7C9ZwZK72fn94BREyS1mciawb9H2S3QM2wcwuuPP3OOA9LUiAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZDf8xxCT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZDf8xxCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751312186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CTPK4eSk+4gUQuoW0j4Bt7UJobRVrOn0d8k/XSxzeA=;
	b=ZDf8xxCT8UbiNUQr/jrBAvKpTEdKYlmcjxAg0U/8X7GvSHyN+NIpFi6ozhiLijPFZW836t
	77z0BCWSKm+6ZetL3as65Pp7bIOYe9eRuXs1h3Se/huK+yLRtHkQJrwBrJrqtFQPDh5/mt
	WSLZoYvDIvX595Dymov+zEu7HGygM5E=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-Al2KbwheMda-NGyJV_eH7A-1; Mon, 30 Jun 2025 15:36:24 -0400
X-MC-Unique: Al2KbwheMda-NGyJV_eH7A-1
X-Mimecast-MFC-AGG-ID: Al2KbwheMda-NGyJV_eH7A_1751312184
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87595d00ca0so481194639f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312184; x=1751916984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CTPK4eSk+4gUQuoW0j4Bt7UJobRVrOn0d8k/XSxzeA=;
        b=qKdN0+cH45gnk9rO16C3hlfm6OcVwKAtGJKbk90jGmcEG4mOy5LIkO+r7WF8bOw+ij
         Oi0x2f70ChKHpjFkZbIKGdgkb5hY3fA8GCpCkzNU3YT3U7HuaD7eI1bg6x6IkPhxniLe
         4pkpMOAW+igQPZMAGth0bVJggp9Bd12BNIudFDBhFR73zCb33YcIlWl4c2Xu4gg4MG45
         thPjLcm284yKhC3nj7vQlWu9xTJCgGkaUy9AXNmISygffNtxFLfbwh6pnnnI+koIXcJF
         g4iIDkdc992OjMK98TbiQlpNJ6EqyTwdYTGTpdlBVXnt3lqrxGiCDSWmfhoY0gU+4Iab
         BsCw==
X-Forwarded-Encrypted: i=1; AJvYcCX/PtgugP2Zcx8iCvsfqtyQdi8dUsfFUc09Lcm+uKhJ4SGFSY7dJ48xz3QpFk1hyOnxOMcQnlCUAu0tBjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1vvPx3CTniR5tPNbs25dzp/cVYso60pfy7D9Vwk4DW9rA9e1X
	82TP8XrTzGX7wyFbZ7973u1zSh+cs4GvdpyJ5xAcGEoFpo33h0T3VgXslWUJG8MSlOHLB76rwab
	ZQNJxs8CSJJO2R/7tpTMTLkNPPjOxTICfZX4WRP8J8McDzJuiPg+l3/GAabnAnfDYVOkbWNOqVZ
	6up1zT8mS1Gvjokrfxwy7FiSVfmwT0iT6ho9QHdWe2
X-Gm-Gg: ASbGncugr9L7RzMMJOgDGiliXbC2XnufxO1YVuXtC4biiJLit03enry9FoEOrttpWCa
	aUADu1MRqi9e8G18XVvNHIn3SQ1S6PA2YYPU9kWXumZbTZTFhX4HMgnTv5/2vltTCxXe8n7oHPf
	4wUuucxoWQP5kDpsrWY/wAJW1Bop3GBKxJgQ==
X-Received: by 2002:a05:6e02:1a0d:b0:3de:12ff:3617 with SMTP id e9e14a558f8ab-3df4aba3729mr168365635ab.15.1751312183702;
        Mon, 30 Jun 2025 12:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5OBjWuB+7mTlohU1GRuvBqPPbNy8Toed/6n+NrVnrOZfDzHRQR/D8D4AhYbheg//ZhwLibndaBuuWngB1530=
X-Received: by 2002:a05:6e02:1a0d:b0:3de:12ff:3617 with SMTP id
 e9e14a558f8ab-3df4aba3729mr168365385ab.15.1751312183324; Mon, 30 Jun 2025
 12:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630150107.23421-1-desnesn@redhat.com> <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
 <20250630152952.GG24861@pendragon.ideasonboard.com>
In-Reply-To: <20250630152952.GG24861@pendragon.ideasonboard.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Mon, 30 Jun 2025 16:36:12 -0300
X-Gm-Features: Ac12FXyrTqbZkdz_CB2bOk0z33IvZdWhwaIYre1OeHTeEQcqtFwYYzxgNNpWDQQ
Message-ID: <CACaw+exXoVxeJz+3JdaW8peTo-zuYLez1Vw3+R4fpatjWVY7NA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, hansg@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

Yes, I did see that commit and will send a v2 to properly address the
variable shadowing following C11 standards.

Thanks for the review Laurent,

On Mon, Jun 30, 2025 at 12:30=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 30, 2025 at 05:15:38PM +0200, Ricardo Ribalda wrote:
> > Hi Desdes
> >
> > How did you trigger this build warning? I believe we use C11
> >
> > https://www.kernel.org/doc/html/latest/process/programming-language.htm=
l
>
> Note that the local declaration of the loop counter shadows the global
> one. I would have expected a different compiler warning though.
>
> The shadowing was introduced by
>
> commit 10acb9101355484c3e4f2625003cd1b6c203cfe4
> Author: Ricardo Ribalda <ribalda@chromium.org>
> Date:   Thu Mar 27 21:05:29 2025 +0000
>
>     media: uvcvideo: Increase/decrease the PM counter per IOCTL
>
> and I think it should be fixed (while at it, with an unsigned int local
> loop counter instead of a signed int) as it's not a good practice.
>
> > On Mon, 30 Jun 2025 at 17:07, Desnes Nunes <desnesn@redhat.com> wrote:
> > >
> > > This fixes the following compilation failure: "error: =E2=80=98for=E2=
=80=99 loop
> > > initial declarations are only allowed in C99 or C11 mode"
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
> > > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc=
/uvc_ctrl.c
> > > index 44b6513c5264..532615d8484b 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev=
)
> > >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >  {
> > >         struct uvc_entity *entity;
> > > -       int i;
> > > +       unsigned int i;
> > >
> > >         guard(mutex)(&handle->chain->ctrl_mutex);
> > >
> > > @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >                 return;
> > >
> > >         list_for_each_entry(entity, &handle->chain->dev->entities, li=
st) {
> > > -               for (unsigned int i =3D 0; i < entity->ncontrols; ++i=
) {
> > > +               for (i =3D 0; i < entity->ncontrols; ++i) {
> > >                         if (entity->controls[i].handle !=3D handle)
> > >                                 continue;
> > >                         uvc_ctrl_set_handle(handle, &entity->controls=
[i], NULL);
>
> --
> Regards,
>
> Laurent Pinchart
>


--=20
Desnes Nunes

