Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8060289833
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312331; cv=none; b=cg9ZckrzRQqfg5MdlPc8xJdrmM0AHIIWRLzUxinWZOBInenSM516MbyOxUXz3tOByJON1I1QUzQ8xXqWOkTxtzFpLKRG9ce8VLzWk+MtLWAtnX03Ms4eQEaJ21u+x5VSCcWvPgNqq/Nd1isewn1G2qkqbMLPyn2aVqkUWDDGvxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312331; c=relaxed/simple;
	bh=zqOedF4W1acrWB83NCr7yyAwoGHaZafCuVP1mY07zac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZEwl0vNbEE86qbMr1PsY8kRHvEA1vzBTILRrgM15+bHzGOUIzll8Cb6xomXMmBbbbIM1PQnwBX1NY3kpZdi1rukxtHd7MTam3vqcETZXzxb4hf5OwMrNRhcR5iz6idsjcwRp1dOFvTh2dhVISyahI5XFpmeiJ1MxKIYB3FCjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z1cpISws; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z1cpISws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751312327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oD0tbuaxponDHy3qN8C0494OXCQwyjvpmdeqroxPwDw=;
	b=Z1cpISws0bTVZvtwdts+ADir7f524GkwuBdd62hSAySTKdOUWDAy8WRsYvy8jrRRAhAFsi
	sLM2pCNlnfETiF3n+9rYTocWi5CYOE0VDK2j6YGB5TP0q8kwiCoAU61P0TDJD9Vjlxkn9P
	Kr+QDq9oQ82NHBm14/zmuDd0p8e5+PE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-Y42qkeVIPS6zIxIN0hm3BQ-1; Mon, 30 Jun 2025 15:38:46 -0400
X-MC-Unique: Y42qkeVIPS6zIxIN0hm3BQ-1
X-Mimecast-MFC-AGG-ID: Y42qkeVIPS6zIxIN0hm3BQ_1751312326
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df4d2a8b5eso27161355ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312326; x=1751917126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oD0tbuaxponDHy3qN8C0494OXCQwyjvpmdeqroxPwDw=;
        b=hLqi6/Mrrzm6Fyrk7M4GXytaJPLhL+m51iVD5uy7qbJXiL6TlrHH6/tg35CxzdxHKh
         8SV/fuorNGFu6JkKjzXzU/jMtz6kLFaF7v5naslFFtRKGjpCiAQ5hw2AacD6iCvibHWS
         g9RztU6BKOPe2fRuyhWqZjff9upvQ0qI1z7SEt5z3w/7B0yT///aHqCTs9K+oz8xqGX8
         ezAbi1/3S8YFiZUJDGPRf+mnHayU54XqfHEv5BxA0r5y/yqojoalgtsiMDzPe5nreRIF
         dQGaebd1wimLzbsE4gKYZS6+Z5phuJyte+QL37NRdLbYDtd0ZBHHD+QzOKMkutWl0faR
         YXvw==
X-Forwarded-Encrypted: i=1; AJvYcCVDt/RCPGvKKUug3y5WZTkF84uBXDNAeuJtKN2BzTWVlib6ep5j6twwVtdbUE5Hey+xt74knRYuh/kJCCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDSrtMzU//7IG5N/sbf5AMsvkdGl0ws8IIza72o+LaCd5XkcB
	Mk4VXmUJk2t3DSpwuXA9wxPQs1wVwGmTcjMlML6AdqkKMFpBjd9QnYqgP2TSXx2PWc5MmKuPiJp
	RXYTZeLwVx5XgJXbOpi+eL7GfNh8+YIICxUZ2grq75l2mbdRy9pBE9Ca+SD96zCZAibZL1hITJ5
	vd5cW5dKBaDvL63ohAOtoWP2E4pqQ8s2sW8NCJKy0r
X-Gm-Gg: ASbGncu0cUtes+uDy8NiYULy6sl41a1M+NHXTisv6Fixz2qIJteswf/HrXP7kZoUbBf
	owv5ldaIELMIAaMACJqD1fAH9OUyRQ4gHeVKdMx1a+JwNhBmQJ53AIFafpyrE62WlrFst+p2weH
	JILCfXrFzQNz0ZMRdgACYXicHn8P9NrOJ09A==
X-Received: by 2002:a05:6e02:1527:b0:3df:4024:9402 with SMTP id e9e14a558f8ab-3df4ab78488mr158020555ab.8.1751312325685;
        Mon, 30 Jun 2025 12:38:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj63Zu4chAlO3nwkmxFrLIHzXRdPp9LE0n5nOyaxxe57ddbJANgCo/i9LGvy3628nLn9G8EqMjdjEnVj3VXIg=
X-Received: by 2002:a05:6e02:1527:b0:3df:4024:9402 with SMTP id
 e9e14a558f8ab-3df4ab78488mr158020135ab.8.1751312325311; Mon, 30 Jun 2025
 12:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630150107.23421-1-desnesn@redhat.com> <2025063041-concur-unrefined-9dba@gregkh>
In-Reply-To: <2025063041-concur-unrefined-9dba@gregkh>
From: Desnes Nunes <desnesn@redhat.com>
Date: Mon, 30 Jun 2025 16:38:34 -0300
X-Gm-Features: Ac12FXyAkCe4-5qlTdVi7CFbvyYmzCuJiAW0H_xcfUV1Klx2no50cvU9ATC726Y
Message-ID: <CACaw+ezWFLhE8=Uc4bHYWu9yF8-ncADZ3oRMMe1t2HaQ+UhNyQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
To: Greg KH <gregkh@linuxfoundation.org>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Greg,

The compiler is sane, but I ran into this while backporting fixes to
an old codebase that still uses C89 due to legacy support reasons.
Furthermore, you're right; there is no guard() in my code base, thus I
had to backport guard() with the old mutex lock/unlock calls used
prior to guard().
Indeed - will focus on all of what has been said on the v2.

Thanks for the review Greg,

On Mon, Jun 30, 2025 at 12:42=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Jun 30, 2025 at 12:01:06PM -0300, Desnes Nunes wrote:
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
> >       struct uvc_entity *entity;
> > -     int i;
> > +     unsigned int i;
> >
> >       guard(mutex)(&handle->chain->ctrl_mutex);
>
> If your compiler can handle this guard(mutex) line, then:
>
> >
> > @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >               return;
> >
> >       list_for_each_entry(entity, &handle->chain->dev->entities, list) =
{
> > -             for (unsigned int i =3D 0; i < entity->ncontrols; ++i) {
>
> It can also handle that line.
>
> Are you sure you are using a sane compiler?
>
> confused,
>
> greg k-h
>


--=20
Desnes Nunes

