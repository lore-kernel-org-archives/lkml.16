Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55127A41
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825358; cv=none; b=Z23hTJHEh5Stlw+HceBv6SDvkD8JadnruyB+swjt84+/PDXOMg7+tF2hYDEr+tkIKxDECsUIXGYLPJDnYykA4GXD9YoX3Z6VL73UGCWaq8i3quWM0ch8BcbQaRT+aS2/RhFiwmPL5ThLbo5L+FY4ulE1lfDZPtmhzkHenE986+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825358; c=relaxed/simple;
	bh=pvG3cpknOP/lYzb315MlppaA32rBeoorpQy6YQn7/jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1yJREzBDhn6ySex4fKYRvccnLdHhzWkTKVXp0JjbPmJy27sBa34d0/3ASEgdsT41VvmsqFod8EtPhbNje79vI8EpJqAQvKEsiv3jq2r1j3AQyTsglfrOtkGZRIiL/0/ubMaCC9B0YWUMCTzXkpmAn5YCTawHFZeSVCTvcOUPMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j5jIoFA2; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j5jIoFA2"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47e9fea29easo38621cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 14:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746825355; x=1747430155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zks2UDxpKAAIwE9vwOMhQgfd7dJMn6QwKhXVuj/MAUM=;
        b=j5jIoFA2gfpJQ8wMRQQrxc8K3s0P4+ayrAoPUXCyNcXoCwnvH7LlosUFOBC77ah9iL
         X7YtExst/Nj+XI0F2pbwrVAKl9bzncVfmbhcRe3O7F7akpLWyA/26Nzk2dmfsIONx0t9
         8SzWtN+MyiwMqBQSxjqbBVZSjWB1KZqnQPNfrqj/IyU2892ZH18PHGYAxGXZmasBV3ez
         XtHCFA92M4cgwHGiowoUMj0A63yDsNIX2J3cqulHUM9w/39i2pop8lj3pt6rQUDznO5T
         PUFoou+RGSUG/v+7oMC6tNFFwLWeYNjuFua9zQVNsQk6gwu2jL71shc59v8ufyxKIuee
         kSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746825355; x=1747430155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zks2UDxpKAAIwE9vwOMhQgfd7dJMn6QwKhXVuj/MAUM=;
        b=vhYjc82+dr6A2QKjwuLugKVsSKTC8C60rfwQVhsSDL1wOd5i/RJwPuBNT/mT8Eflc/
         L/+3jzMbDyuv/dMZ5KONRsURcV84Ar5GLQA+bMHO961L/clNlTXmFan0nvJzIdPoI4Q/
         BpGCnqM24hBC8bE1KzGCYZH7XUekLiy03DZR9F9pP1ewhu9mhHQrTDcvj3nTAJbE+A8H
         7ifQcpTzqaYr0E44TuwOgiDpbqHy9kdY5R2nmcld/GF3AolW2VBdsHnQENUgO3q0Spnn
         fL3iCEnAESW0nS4dclLQl8NN2/j4ARY7K2kTg+fcAVDBWTADOYyWNOwxdDIDOwpOb10Y
         uySw==
X-Forwarded-Encrypted: i=1; AJvYcCXf6Ul6b8JE/DDHAPohaocIwtc0RvfeHkyajcZizi8cpvUjLbSLiTezMW25fNRu0t1zIgSlK05jDZQLxUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4OEU4PVju1PAQjcd/89iStzcCvxnokDDZHIS0jpjnfY21IDmI
	+YvIyXp3WYNGQ9Hx376okoIFvThi8P7oy93tEFjBUGQoum4a/QQ1N1EFnS55C4yByxRYU/auXtd
	qWHUjF7lgUGm3QxFxn5CKCINTbGtJRdTFqCjj
X-Gm-Gg: ASbGncsSlfAs6MRjzDvRhGAGKMKmstQf0gr1QBDgYCkyWf17bGj1mcPMaWEatlN1fn3
	4yluaP6fc4PswobME5yCL2PwGQEf6ZtlpjgKzj9one66UfQnCMOHo1gkDYJ1CwJnsnUTXjU7+N+
	GdjJFSQpBIIS7eOMdkTaXS4eCdWy2jRiw=
X-Google-Smtp-Source: AGHT+IGUhxFmii7Q5/XDSbv8/CTslm1sdE9Xmzl9GrkcOz9ThZBXF8Us++3DNgGn3B84Bb0oly97rTFfFJeRUp/F54U=
X-Received: by 2002:a05:622a:1a82:b0:476:f181:efeb with SMTP id
 d75a77b69052e-4946110541bmr1265301cf.16.1746825354587; Fri, 09 May 2025
 14:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <20250509173929.42508-1-00107082@163.com>
 <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
 <CAJuCfpHB8T8daanvE_wowRD9-sAo30rtCcFfMPZL_751+KSs5w@mail.gmail.com>
 <294d0743c0b2e5c409857ef81a6fe8baaf87727f.camel@linux.intel.com> <CAJuCfpF=u-LpR6S+XmwPe8a6h4knzP2Nu5WFp=Rdvqa14vOzDA@mail.gmail.com>
In-Reply-To: <CAJuCfpF=u-LpR6S+XmwPe8a6h4knzP2Nu5WFp=Rdvqa14vOzDA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 14:15:43 -0700
X-Gm-Features: AX0GCFshryVG_JYj2Ron9JFNOnQXKXLnYo9eIyMWK7Xd04CyjIPVZiVJhGz52xs
Message-ID: <CAJuCfpFLqTR=KfkstR-iRQvE7ZQMsr9=jXj6C4VdFq-Ebq6mvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between
 read() calls
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: David Wang <00107082@163.com>, kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 1:46=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Fri, May 9, 2025 at 12:46=E2=80=AFPM Tim Chen <tim.c.chen@linux.intel.=
com> wrote:
> >
> > On Fri, 2025-05-09 at 12:36 -0700, Suren Baghdasaryan wrote:
> > > On Fri, May 9, 2025 at 11:33=E2=80=AFAM Tim Chen <tim.c.chen@linux.in=
tel.com> wrote:
> > > >
> > > > On Sat, 2025-05-10 at 01:39 +0800, David Wang wrote:
> > > > >
> > > > >
> > > > > Signed-off-by: David Wang <00107082@163.com>
> > >
> > > Acked-by: Suren Baghdasaryan <surenb@google.com>
> > >
> > > > > ---
> > > > >  lib/alloc_tag.c | 29 ++++++++++-------------------
> > > > >  1 file changed, 10 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > > > > index 25ecc1334b67..fdd5887769a6 100644
> > > > > --- a/lib/alloc_tag.c
> > > > > +++ b/lib/alloc_tag.c
> > > > > @@ -45,21 +45,16 @@ struct allocinfo_private {
> > > > >  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> > > > >  {
> > > > >       struct allocinfo_private *priv;
> > > > > -     struct codetag *ct;
> > > > >       loff_t node =3D *pos;
> > > > >
> > > > > -     priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > > > > -     m->private =3D priv;
> > > > > -     if (!priv)
> > > > > -             return NULL;
> > > > > -
> > > > > -     priv->print_header =3D (node =3D=3D 0);
> > > > > +     priv =3D (struct allocinfo_private *)m->private;
> > > > >       codetag_lock_module_list(alloc_tag_cttype, true);
> > > > > -     priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > > > > -     while ((ct =3D codetag_next_ct(&priv->iter)) !=3D NULL && n=
ode)
> > > > > -             node--;
> > > > > -
> > > > > -     return ct ? priv : NULL;
> > > > > +     if (node =3D=3D 0) {
> > > > > +             priv->print_header =3D true;
> > > > > +             priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype=
);
> > > > > +             codetag_next_ct(&priv->iter);
> > > > > +     }
> > > >
> > > > Do you need to skip print header when *pos !=3D 0? i.e add
> > >
> > > Technically not needed since proc_create_seq_private() allocates
> > > seq->private using kzalloc(), so the initial value of
> > > priv->print_header is always false.
> >
> > But we'll start with first call to allocinfo_start() with *pos =3D=3D 0=
,
>
> Usually but not always if we do lseek() to a non-zero position beforehand=
.

Actually, this change will break the lseek() case. We can't always
assume that we start reading from *pos =3D=3D 0. Current patch will fail
to initialize priv if we start reading with *pos !=3D 0.
priv->iter should be tracking current position and allocinfo_start()
should detect a mismatch between *pos and iter->pos and re-walk the
tags if there was a position change.

>
> > then print_header will be initialized to true.
>
> After the first call to allocinfo_show() print_header will be reset
> back to false.
>
> > Will there be subsequent calls of allocinfo_start() with *pos !=3D0,
> > but priv->print_header stays at 0?
>
> Yes, there will be subsequent calls to allocinfo_start() with *pos !=3D0
> and priv->print_header=3Dfalse, which is what we want, right? We want to
> print the header only at the beginning of the file (node =3D=3D 0).
>
> >
> > Tim
> > >
> > > >
> > > >         } else {
> > > >                 priv->print_header =3D false;
> > > >         }
> > > >
> > > > Tim
> > > >
> > > > > +     return priv->iter.ct ? priv : NULL;
> > > > >  }
> > > > >
> > > >
> >
