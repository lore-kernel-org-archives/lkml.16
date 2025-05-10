Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3187BA27
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 03:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746847864; cv=none; b=azDfbsjkSgeTdsFXXI81pq2Uq+ahlrONenF9v+ayZ7kgcUlmKBBEGiJ1fkRoHHQMLhuHAJiU6rKjKxkNzkmae0FnqHzqRvmTM3+HL9DlDjBQAs4/oFO5567UJgWLY6h4/BnQ9oBXrglE6k8xZ1brRnLzh908m9q6FXvLMxdeyaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746847864; c=relaxed/simple;
	bh=yHfPpaz4WoW4QV4ea/eBvd8nOOUC0mPFz2ZVber3AiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIvWuxgzNNY5sDVs9KPg+WG62KztH5tZtvc2fJcsDjWUmaIjleCreu2QeI+yR13lyQSSAza4j75NBEanbBgSdu4DtOXhm1+pEAbEkf0iH6YPbxSqE5nLd3HXuvOwko7YxQQk5rfp/dMlz8zcdARPKbYT0ZNGIz6zQ9JyX/PrXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IroJaUro; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IroJaUro"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47666573242so154701cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 20:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746847861; x=1747452661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxC/mzAUv+WLp2bqkAOe0LlzGx41xiGaA3xtnTEbHto=;
        b=IroJaUroZMys92oeSLp/kqvR+s43FVJsOaRUw03ZebWnvEkjHlcKw2TPnXTG6R+9H7
         2mEA4EhkcGzLH52PCiQM6PS021HIPucdxnHahDj2SclXFNEhXI3J30/RcquCi/mWhXpc
         1pHAjrdt5MjUuHzfO9k6qLc8yQgMP3cGc4vkzAlCx2igv96J/CYy52cTe8D7k1PVlN7U
         aJtEI9h3A5otQowg4PSEY7zmHw1YsauUmXFPel6ClQa1B7AlmAjOOSnm4nAvFN2SRwVV
         Iv0hJBISHV0GFKBB8lGr8KRm60vOxdlLU0tS95Qrpyiti/c6LnadVEiVNXYHejR51fiz
         s+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746847861; x=1747452661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxC/mzAUv+WLp2bqkAOe0LlzGx41xiGaA3xtnTEbHto=;
        b=FQ58AWc8m/bwtXK0I//yWPAl/+hsFzOqXoFD9vDP43x1VvVwOki4H57gNZ/Z/MK6Hh
         lHIEqxrjjJnRIzr70LmcsSwRGHdHnIUl/SSSWLf+GESs11iz1yoW3viCz+c4/Xyn/4c/
         0upHt28llOk+6vzjPeX/BIscvv9FRHPkNji66QI2BvJtWk7+nWY4PdNW16CUbvvi4r/v
         COaRinbm4CFV8Akt5ZUwN9p8FwJAvz3em9ZbHwoG2TAGXq1X5eNbS0YT8kgQzw1/9sfw
         hdrV30f1Nvs9yWYWKnSfaD/q4jt9JKjuYkDoLdjOMcW70qzvbTOD1mEWn1gxN30hnl/8
         HWog==
X-Forwarded-Encrypted: i=1; AJvYcCXZQLFUFtu3pVgFOX+bIoyUU1/3ICUvqbM/oQEno0tYp8wDLeJbps5r4+w/TRJ3OD1hjL42AUimfiiC54A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMz2S5ZycgHUvt2pDVmJEAkiWdI0GAwJ9KLlWQEXocWtQIF+PF
	c0bYf/czf/7eem3DO/qyiWvvQseVKf18gKN8d7em0WQ/8hv8mS+VP9SYAWVKahMRP/FtiSuELgu
	42aqdnruvGFcZOEHSK3JXT+r4HPiPWgiXiuaG
X-Gm-Gg: ASbGncugtnc5TlkwEz3/NIOmBkJesRR2asatDkrj2xUu5B3g1UH9wv2FJVTzBV/JF49
	YZMq/+9r2kqGF9Zc02F693vi9jb48+pmMiAspTM6pvIdep7slfN/M3Xf8liQCTe1cuSIwWt6qf2
	EqDgdoKH7YNv0AFAj3kmEcKs1POHb/Y/8=
X-Google-Smtp-Source: AGHT+IFGMaC9OqkxFNOPZKLQA5bM+AqNuwWWMAveWL+IGAFF7qDQwggjNqRbcq9N+nQeXDrOPW2xGU801kG98ywgtGo=
X-Received: by 2002:a05:622a:54e:b0:467:8416:d99e with SMTP id
 d75a77b69052e-49462f90a7bmr1032861cf.21.1746847861271; Fri, 09 May 2025
 20:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <20250509173929.42508-1-00107082@163.com>
 <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
 <CAJuCfpHB8T8daanvE_wowRD9-sAo30rtCcFfMPZL_751+KSs5w@mail.gmail.com>
 <294d0743c0b2e5c409857ef81a6fe8baaf87727f.camel@linux.intel.com>
 <CAJuCfpF=u-LpR6S+XmwPe8a6h4knzP2Nu5WFp=Rdvqa14vOzDA@mail.gmail.com>
 <CAJuCfpFLqTR=KfkstR-iRQvE7ZQMsr9=jXj6C4VdFq-Ebq6mvQ@mail.gmail.com> <3cbaf905.ef7.196b82bdcc9.Coremail.00107082@163.com>
In-Reply-To: <3cbaf905.ef7.196b82bdcc9.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 20:30:50 -0700
X-Gm-Features: AX0GCFsQsRL9ga96UAA-qchFPMnhNROUHcHBnwyvG4zLqJF0vdTeFZc6RBnaKRU
Message-ID: <CAJuCfpHuYHJh6yM+na0WLi3Lb910m73Xth8N3ZBnJKpAW5Qxww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between
 read() calls
To: David Wang <00107082@163.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, kent.overstreet@linux.dev, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 8:10=E2=80=AFPM David Wang <00107082@163.com> wrote:
>
>
> At 2025-05-10 05:15:43, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Fri, May 9, 2025 at 1:46=E2=80=AFPM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >>
> >> On Fri, May 9, 2025 at 12:46=E2=80=AFPM Tim Chen <tim.c.chen@linux.int=
el.com> wrote:
> >> >
> >> > On Fri, 2025-05-09 at 12:36 -0700, Suren Baghdasaryan wrote:
> >> > > On Fri, May 9, 2025 at 11:33=E2=80=AFAM Tim Chen <tim.c.chen@linux=
.intel.com> wrote:
> >> > > >
> >> > > > On Sat, 2025-05-10 at 01:39 +0800, David Wang wrote:
> >> > > > >
> >> > > > >
> >> > > > > Signed-off-by: David Wang <00107082@163.com>
> >> > >
> >> > > Acked-by: Suren Baghdasaryan <surenb@google.com>
> >> > >
> >> > > > > ---
> >> > > > >  lib/alloc_tag.c | 29 ++++++++++-------------------
> >> > > > >  1 file changed, 10 insertions(+), 19 deletions(-)
> >> > > > >
> >> > > > > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >> > > > > index 25ecc1334b67..fdd5887769a6 100644
> >> > > > > --- a/lib/alloc_tag.c
> >> > > > > +++ b/lib/alloc_tag.c
> >> > > > > @@ -45,21 +45,16 @@ struct allocinfo_private {
> >> > > > >  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> >> > > > >  {
> >> > > > >       struct allocinfo_private *priv;
> >> > > > > -     struct codetag *ct;
> >> > > > >       loff_t node =3D *pos;
> >> > > > >
> >> > > > > -     priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> >> > > > > -     m->private =3D priv;
> >> > > > > -     if (!priv)
> >> > > > > -             return NULL;
> >> > > > > -
> >> > > > > -     priv->print_header =3D (node =3D=3D 0);
> >> > > > > +     priv =3D (struct allocinfo_private *)m->private;
> >> > > > >       codetag_lock_module_list(alloc_tag_cttype, true);
> >> > > > > -     priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> >> > > > > -     while ((ct =3D codetag_next_ct(&priv->iter)) !=3D NULL &=
& node)
> >> > > > > -             node--;
> >> > > > > -
> >> > > > > -     return ct ? priv : NULL;
> >> > > > > +     if (node =3D=3D 0) {
> >> > > > > +             priv->print_header =3D true;
> >> > > > > +             priv->iter =3D codetag_get_ct_iter(alloc_tag_ctt=
ype);
> >> > > > > +             codetag_next_ct(&priv->iter);
> >> > > > > +     }
> >> > > >
> >> > > > Do you need to skip print header when *pos !=3D 0? i.e add
> >> > >
> >> > > Technically not needed since proc_create_seq_private() allocates
> >> > > seq->private using kzalloc(), so the initial value of
> >> > > priv->print_header is always false.
> >> >
> >> > But we'll start with first call to allocinfo_start() with *pos =3D=
=3D 0,
> >>
> >> Usually but not always if we do lseek() to a non-zero position beforeh=
and.
> >
> >Actually, this change will break the lseek() case. We can't always
> >assume that we start reading from *pos =3D=3D 0. Current patch will fail
> >to initialize priv if we start reading with *pos !=3D 0.
> >priv->iter should be tracking current position and allocinfo_start()
> >should detect a mismatch between *pos and iter->pos and re-walk the
> >tags if there was a position change.
>
> seq_file works line by line,  I think even if it support lseek, seq_file =
would still start with line #0,
> since seq_file have on clue the byte size for each line.
>
> I will check the code,  make some tests and update later.

Ah, yes. You are correct.
seq_lseek() will traverse restarting from 0:
https://elixir.bootlin.com/linux/v6.14.6/source/fs/seq_file.c#L323.
Position jumps are similarly handled with traversal from 0:
https://elixir.bootlin.com/linux/v6.14.6/source/fs/seq_file.c#L194.

>
>
> >
> >>
> >> > then print_header will be initialized to true.
> >>
> >> After the first call to allocinfo_show() print_header will be reset
> >> back to false.
> >>
> >> > Will there be subsequent calls of allocinfo_start() with *pos !=3D0,
> >> > but priv->print_header stays at 0?
> >>
> >> Yes, there will be subsequent calls to allocinfo_start() with *pos !=
=3D0
> >> and priv->print_header=3Dfalse, which is what we want, right? We want =
to
> >> print the header only at the beginning of the file (node =3D=3D 0).
> >>
> >> >
> >> > Tim
> >> > >
> >> > > >
> >> > > >         } else {
> >> > > >                 priv->print_header =3D false;
> >> > > >         }
> >> > > >
> >> > > > Tim
> >> > > >
> >> > > > > +     return priv->iter.ct ? priv : NULL;
> >> > > > >  }
> >> > > > >
> >> > > >
> >> >
