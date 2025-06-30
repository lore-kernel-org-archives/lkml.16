Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB311624E9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312011; cv=none; b=XKPzDFTDhaykekxXkerMIplJcB0lDZdEX+VNzxp1od/GYvGkm+M8iRiLoJKREMaU7bputvIZRGJ1jCX88Pw8ASVZoN/6gf3JkkkdrQmeFtmQByC0Of+AdOl8RlFA7TX/jnW6Zm3tk538jjp5iVipLA+pqPtMM7sriY7oLMtviiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312011; c=relaxed/simple;
	bh=L1dWw3ul8yVaWeCdfKGPbkNq6yPKle7qYiNxccwTWIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciNNVjMInb0u50K3HkLlvmxdP/eJXtwfPgLksbkNmACPEyfHxr4hvNYybwwRHkks46qQX7VOYI3Bo5OsX9mWAum58waqVma2Q9A0xyBf0psJcqKoAZpHFd0ozvUyfPto6pOhypVJzbzq5fQbKdBJs6JWBV2nru0OX6oojqXWOL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QbK+FEdh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbK+FEdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751312008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLG9XHK+6+oCii41uDgkWY6xC+gN79cm3T8XpClkT4c=;
	b=QbK+FEdhOvMJAjk0BeCUtUdLkz5XhMmAOEEp31tY0lh2xuYQJ6ON55DhxWDcJIAD3cQuEx
	StVKcoOBoE10czjjM09DWQSBVe0LO6Ig1EccAexhu1xiHL8RXb6KD2/fkPl4qXkx0lb6dp
	oN5W71/TgT4/89FEacoUYsHsk/1if5s=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-70gxJcK9PFa7niJLW6r5Ow-1; Mon, 30 Jun 2025 15:33:27 -0400
X-MC-Unique: 70gxJcK9PFa7niJLW6r5Ow-1
X-Mimecast-MFC-AGG-ID: 70gxJcK9PFa7niJLW6r5Ow_1751312006
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddc5137992so27683795ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312006; x=1751916806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLG9XHK+6+oCii41uDgkWY6xC+gN79cm3T8XpClkT4c=;
        b=LAX1mXLADHD7Q2m0tFaXRxV3zJUIbYPufUy+9VdtQFXAHx8aIxyY6VIEkzxHYHLvTk
         j8tKdjOK8sTzoJDUkoqPgTml19cQnD4JRHob1T/9g6t9FQz6q52bcqBpVxtaLgqG4z47
         wTSOPiZcENxxkMI7Neo8wQx1/t4u9D8PATwx/cbZiZTTcgB4wQhsneYvucHvWkMGTUaR
         gzUBV8Sc0gU3riACSz1temBJO5lZNdwYqinVeiOXf+mn6jwwGzM8Wn6LUa+Dm9xWiAKV
         ODO8rGuaqo0oo1ao0oI+M6icrFm9B+s6cml64Z1pY76xDpv+ZPIr4TWsHxJsq/JwygMz
         PIlA==
X-Forwarded-Encrypted: i=1; AJvYcCVDpZ7mfxp6kJWBX9IjVFLbTHJPRKhBJqVkSqTriHymXo8fm7lYhx+B2Tc0jFAulN8kdrztTRWiaogibZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfyt9iY6nseAcXwo8awqJz6xVJYUa1rLEco3+GlNMoETdcpPni
	nOr50kE0ltmPEDtUOHIRj53oprEB0Mwu1Rci5uRxAHkAizFylGQJENg+1paoQm4bBX4Eeqa6ZDL
	jt7CtzRXGkyvcRLnqCuM7Sf+HDzNYYVOcTgEHBftRJXdL59zwZkTmYd6gh7c+wtDKvl8Syfmce8
	0cfGesuNMY6JWh9+WLr6g4w7rIqLL/LhxynaZSBkVZ
X-Gm-Gg: ASbGnct5+WzmQOR5WXmOrAJO2dS+gsjSNegb3UZYjMYJoi9uS+z6q9Po5klY6wEmslg
	o37QhxNukUsJMlBUuIlC+/Uh2JonIrtJGYr3OUsBwsy6Iuj8YS52v/XFEgzXRLY6bK3kfqi74F+
	hgWIPvGeLLRb3Tugz5JJpVugb5oXFJCHvcdQ==
X-Received: by 2002:a05:6e02:19cb:b0:3dd:cbbb:b731 with SMTP id e9e14a558f8ab-3df4ab4ba97mr150694495ab.9.1751312006509;
        Mon, 30 Jun 2025 12:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLhV90dERUX5Cd1c5ylxgqUOBdppuowz9AEfillEd98+IoEDDYoWIMv0J5NlnbYP/AW4Dv2idc1WkdgUvuL7M=
X-Received: by 2002:a05:6e02:19cb:b0:3dd:cbbb:b731 with SMTP id
 e9e14a558f8ab-3df4ab4ba97mr150694345ab.9.1751312006196; Mon, 30 Jun 2025
 12:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630150107.23421-1-desnesn@redhat.com> <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
In-Reply-To: <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Mon, 30 Jun 2025 16:33:15 -0300
X-Gm-Features: Ac12FXy--Z6I9HxATLzBVcIlb8GTaPJ1_nqz4ejlUIKc7XXzJzGy66npCNZsE3E
Message-ID: <CACaw+exN2qHSPpEmZBNBvXCkrzVUb_VCW7YfYYYaaLzNoOSebg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ricardo,

I triggered this build error while working in an older codebase that
uses C89 due to legacy support reasons.
Indeed - will focus on submitting C11 compatible fixes even when
working on older codebases.

Thanks for the review Ricardo,


On Mon, Jun 30, 2025 at 12:16=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.=
org> wrote:
>
> Hi Desdes
>
> How did you trigger this build warning? I believe we use C11
>
> https://www.kernel.org/doc/html/latest/process/programming-language.html
>
>
> Regards!
>
> On Mon, 30 Jun 2025 at 17:07, Desnes Nunes <desnesn@redhat.com> wrote:
> >
> > This fixes the following compilation failure: "error: =E2=80=98for=E2=
=80=99 loop
> > initial declarations are only allowed in C99 or C11 mode"
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
> > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index 44b6513c5264..532615d8484b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >         struct uvc_entity *entity;
> > -       int i;
> > +       unsigned int i;
> >
> >         guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >                 return;
> >
> >         list_for_each_entry(entity, &handle->chain->dev->entities, list=
) {
> > -               for (unsigned int i =3D 0; i < entity->ncontrols; ++i) =
{
> > +               for (i =3D 0; i < entity->ncontrols; ++i) {
> >                         if (entity->controls[i].handle !=3D handle)
> >                                 continue;
> >                         uvc_ctrl_set_handle(handle, &entity->controls[i=
], NULL);
> > --
> > 2.49.0
> >
> >
>
>
> --
> Ricardo Ribalda
>


--=20
Desnes Nunes

