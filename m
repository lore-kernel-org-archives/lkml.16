Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A1254B1B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746823609; cv=none; b=W7qZ7C4INiZSi/4256avaS3SSd9YPtR8Mn7eJto7fMZmQkgzSVyi/FHkUqspfUOwyEgyV3I2YzE2PS8QR+vQ8UPAJJxThHnN6SsmhNEeezoL29RrQ4Tbdnvpxr1A/OkFaf31MiYvywjsSThtX5yFJImFJ4IDL4uWYmk7sUXu85A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746823609; c=relaxed/simple;
	bh=AEaAHK2qDrjKS+nWpyGksPHVLDMyoXHpj2h/8amikpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDkvW81QtWX85+9iOef4YXFMgslo10rbYqo2AV0ysH5/jBnz7tJJjh3ECALG6rOowM0AuBoK6pw5lEHKK9UrPP1ZZx1Ac6zRRCdEh1ow6hisLOJOUVwNADPPa85T7k2tJPi0fK5tCyMGtaSxz+K2tfXn4jbJ1PRdPlApv6tmHUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lbU7xTZW; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lbU7xTZW"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47666573242so83581cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746823606; x=1747428406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMwdV78Do/D0NTWsn0pPOqDldUmgRqLJqXDySmxsUFk=;
        b=lbU7xTZWHsi48a63Oq7y7cQ4liuiNf0UKnREiuu7JaoOM9wg434zdFSMbkWkX8VspC
         9hwqdnwtVtxcpgzU425xBnWJhvANBKk/+0H/P6x/NMHm6/3YbV+HQB1xCBorJCXuMDje
         5FX6bMw1mZO5RHy/HHYOnbyih+bmfkz0vYtdY7lyjrqHKvdQZuTkmeCxw5wKat+XvRts
         ai7BxyvNeNSPmQj8EYiNY2FGX1GA6/kcPlRfaeoT8eq34FvqN20Vfe8QCahFPLtllPro
         Gdv00k2o/lsbt07W3+5XfKUdJLqvpAuFrjH7gGFRWGbjmj/17ZB99F32ABbIpwUAqOIB
         i+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746823606; x=1747428406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMwdV78Do/D0NTWsn0pPOqDldUmgRqLJqXDySmxsUFk=;
        b=rr0ilvriRYxQn4lCXMlt7NaMToYJjW7rLTnChBVqvfKGhYJm/wzZuz5t5qei/oU8Hp
         /giUTPH1ml0k1/rRCHaMtvtWjNitet1GaOeInAq33d5nqhL/KhMxhds/+dKCwptTQmYF
         2sHglFjl1rGvwD0VZA92yNEFyVaNADMi8v102sZ6S458GoHSRb6q8kYCIxnm+yUpPUnf
         Ec4FJzvzytP4A0dUxrVF3q2p4MQ8soZQLg4JwKyHSfrBNIFVV6oYDpyRfyUkP+9GOeJq
         uVKsK7gn9QNMV5GMEJdWMA9G+c7zCcnP/7X+mVex9DYJQgX81k8dP3S0R7HUXr16EgSU
         1Lrw==
X-Forwarded-Encrypted: i=1; AJvYcCWXuSigHHpZkg8SptO2XzV7f7YSeLQiZmWf7PmSBz8nglKs0ctoH8uuTNcbDQVUHq6Uk700W5Ufq4XDPNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQzNbFmetERmmJeqORo8d6aLxPK8TwqCormeA3ZJV7mqLMJfaH
	yUBw7oDwcsN5Fvmr8HD5md8SfSIB/jC3MAGQyRmhnfddrlrebVOujxtM7mpwbiho1O631HCkg0T
	TYdZviD41dXs2zQPwk+vGuBAZkKMEKmSDj/Bm
X-Gm-Gg: ASbGncvJHFMuKft9ISSjnEioFY7kbgdJhxwgvYpymfRL0OPs8chg7NhLeCzHNRpu+Fx
	tPJbLdOIELQfXxcU7BZdrchUfkKrbvgf1xH58QwH+or+X8GkK1Nql+4eyTZy0vCfjTDvLC4SgtD
	YMvN4s40yw4zF0XBYLucTyMhpko4krbrA=
X-Google-Smtp-Source: AGHT+IH6jfC0LXpfkycrb/+0Yn4u2q8VMq0XT3FpWUL56TTu6Gwn5Q722UotafbWRl5Fq7XQJ8taCtPABVRNAmb/iIE=
X-Received: by 2002:ac8:5d10:0:b0:476:f4e9:3152 with SMTP id
 d75a77b69052e-494612f9be9mr936421cf.25.1746823605969; Fri, 09 May 2025
 13:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <20250509173929.42508-1-00107082@163.com>
 <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
 <CAJuCfpHB8T8daanvE_wowRD9-sAo30rtCcFfMPZL_751+KSs5w@mail.gmail.com> <294d0743c0b2e5c409857ef81a6fe8baaf87727f.camel@linux.intel.com>
In-Reply-To: <294d0743c0b2e5c409857ef81a6fe8baaf87727f.camel@linux.intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 13:46:34 -0700
X-Gm-Features: AX0GCFthQheh3sKufeKBFzfQvnT3bFILXkW0UXHqoFTmEB5sdEQigCntENja8Fk
Message-ID: <CAJuCfpF=u-LpR6S+XmwPe8a6h4knzP2Nu5WFp=Rdvqa14vOzDA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between
 read() calls
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: David Wang <00107082@163.com>, kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 12:46=E2=80=AFPM Tim Chen <tim.c.chen@linux.intel.co=
m> wrote:
>
> On Fri, 2025-05-09 at 12:36 -0700, Suren Baghdasaryan wrote:
> > On Fri, May 9, 2025 at 11:33=E2=80=AFAM Tim Chen <tim.c.chen@linux.inte=
l.com> wrote:
> > >
> > > On Sat, 2025-05-10 at 01:39 +0800, David Wang wrote:
> > > >
> > > >
> > > > Signed-off-by: David Wang <00107082@163.com>
> >
> > Acked-by: Suren Baghdasaryan <surenb@google.com>
> >
> > > > ---
> > > >  lib/alloc_tag.c | 29 ++++++++++-------------------
> > > >  1 file changed, 10 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > > > index 25ecc1334b67..fdd5887769a6 100644
> > > > --- a/lib/alloc_tag.c
> > > > +++ b/lib/alloc_tag.c
> > > > @@ -45,21 +45,16 @@ struct allocinfo_private {
> > > >  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> > > >  {
> > > >       struct allocinfo_private *priv;
> > > > -     struct codetag *ct;
> > > >       loff_t node =3D *pos;
> > > >
> > > > -     priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > > > -     m->private =3D priv;
> > > > -     if (!priv)
> > > > -             return NULL;
> > > > -
> > > > -     priv->print_header =3D (node =3D=3D 0);
> > > > +     priv =3D (struct allocinfo_private *)m->private;
> > > >       codetag_lock_module_list(alloc_tag_cttype, true);
> > > > -     priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > > > -     while ((ct =3D codetag_next_ct(&priv->iter)) !=3D NULL && nod=
e)
> > > > -             node--;
> > > > -
> > > > -     return ct ? priv : NULL;
> > > > +     if (node =3D=3D 0) {
> > > > +             priv->print_header =3D true;
> > > > +             priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > > > +             codetag_next_ct(&priv->iter);
> > > > +     }
> > >
> > > Do you need to skip print header when *pos !=3D 0? i.e add
> >
> > Technically not needed since proc_create_seq_private() allocates
> > seq->private using kzalloc(), so the initial value of
> > priv->print_header is always false.
>
> But we'll start with first call to allocinfo_start() with *pos =3D=3D 0,

Usually but not always if we do lseek() to a non-zero position beforehand.

> then print_header will be initialized to true.

After the first call to allocinfo_show() print_header will be reset
back to false.

> Will there be subsequent calls of allocinfo_start() with *pos !=3D0,
> but priv->print_header stays at 0?

Yes, there will be subsequent calls to allocinfo_start() with *pos !=3D0
and priv->print_header=3Dfalse, which is what we want, right? We want to
print the header only at the beginning of the file (node =3D=3D 0).

>
> Tim
> >
> > >
> > >         } else {
> > >                 priv->print_header =3D false;
> > >         }
> > >
> > > Tim
> > >
> > > > +     return priv->iter.ct ? priv : NULL;
> > > >  }
> > > >
> > >
>
