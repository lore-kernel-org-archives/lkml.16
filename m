Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F75033F6
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 04:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746849801; cv=none; b=i7yUQJAMdXmFua7PXdT+6g+puLX/dvTwW1OyAMVz0b0KbcPATNq4A07NFyLtlU8HB/WZtUAIcE++LYaLnKwc/gFduZi/GcW88ZZbkhEtxEVZvSwfoQf6z6abSGjM3dwuQdvZcZrfjTTACYSSkwiph6dxTd02KByZfAhx+3coVrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746849801; c=relaxed/simple;
	bh=t+G7iGtz51NCSD+MuoQy0TNL4V8+uERvHQKDik2c+ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj4AE2pex5tzI8KxxlpYiPvdzspIep29VWAaEuj7gcAV+7I8HKOe4GC54EQYMgNREoFtHYJFsznTn4+ceylTjRFi/0pC708HYNA3pkgBT4ObhyG+7rJj6mJZj52rMN+jWGqYP32yXmhYFWHZunA72Yl1FQPSVRL5UhbRFr88CQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k2lJzSdc; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2lJzSdc"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4774611d40bso121621cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 21:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746849798; x=1747454598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dvp7VCvFDKnx/a5kWY4TFIakrGqMlV1KSWlgl2jF3rk=;
        b=k2lJzSdcsPAAShhUzLjgj6AblmOF99DUiU8kOLC6lHgsOu7arc8HNfUGN8QCSUD6n6
         X/H0kIx66TSFNNbxDbw2aoOV7Wordh/Cgf7urS7efXGxrjLddVeEMwsweE6WxvUuhkh/
         E7dJkUzZtmZfq2hMUUzANla5H/rUY6aLbRN7OtTv7Z83MVNrOFtmxjT9G3qO8l0jD0FX
         nI/eDqTeeCsY1XO84YsvGuxxngku/61Z7Z67ld5j0yyfjOuwYsWi5BEbfTnsMouriEmN
         RgMom4kPjf4SHOXaWVKgp7n9gHefJlFayv1lL4q65F5bD+6lpwu4HYMv9CPg+zg9nn9I
         Km4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746849798; x=1747454598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dvp7VCvFDKnx/a5kWY4TFIakrGqMlV1KSWlgl2jF3rk=;
        b=YSQE6TlgVZHYuGj7hUnctsLeNfcqIDAVwzPIcMcMxVinaAQRs7Ga1dLmLE0IuXSiJy
         6CDejI584V1mybNS84kXjdU/FEL8VSz+sE8EwgDtcOaM+fK6IbQ+LTKIcwnATM95dVFF
         auhJYeO52KLxiZQap/DHbSK+nIBLdV/ecxNoA2HzxHDhWl1Mvv4OcvnfobdespbV22Ep
         dF1spwV6jsqsZyyfn5S3Mxmf0VqMQ6tRRCvQ7drqZVeNesXJINYjdC9rnnrbNmK2JZle
         mkA3W0MAJm3OUZz5SKtMAlQplsfvYxaz4b1sB+0CqLSxAsUTfYGv7iGFnUt/W8ZfWoZH
         1o9w==
X-Forwarded-Encrypted: i=1; AJvYcCUOInaj/ZZMkwxOo+ISlM45o+XFSh6vdRGe8VYR4TTD0rghMdA0kq9n0VoBvjn5muEF/s1fbBcULgGKhnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIz3m/4gmFtcUfc8w+9HdT/XIVHmC7LtxEhcIfkmHWxQb26e4U
	wE7P1d08TUPJKR90LFcFkBZ99aUFMrKQJQUK/rAf1cynovYkNJ4+rZFPeySOrUh9md8sEU9EfyM
	auWqfmB1L3ds8hvjGMuFFCNfGICpSVV7V9auO
X-Gm-Gg: ASbGncuMXwyGSb/VtMoWoeiqYEKjnDtTCKsrcAM6yKVRNUC+/zCk/bXSdoEtQvBqDwR
	qDgAhTJW9aILgeWvLIGBiRkUAEOk7l9xIwhlEEG6hXkcg7pXbPmIef1Ix+WUUTRU1MiONlVLfLq
	eADubNc85gPzfvCfZdpAUOm1zyyq1vEh4GYOfU6ALhbicqmx/jQbI5Ra4t6MVz1m8=
X-Google-Smtp-Source: AGHT+IGa6MCZkC7TJO9+WiK45ItxubNoVxnApGxNlmqwtd4qdWS3wVJjqSuWv2sanSl5OfbToCZ9VTmOoruwm2aV73M=
X-Received: by 2002:ac8:5ac7:0:b0:477:c4f:ee58 with SMTP id
 d75a77b69052e-494611a9033mr2461021cf.24.1746849797569; Fri, 09 May 2025
 21:03:17 -0700 (PDT)
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
 <CAJuCfpFLqTR=KfkstR-iRQvE7ZQMsr9=jXj6C4VdFq-Ebq6mvQ@mail.gmail.com>
 <3cbaf905.ef7.196b82bdcc9.Coremail.00107082@163.com> <CAJuCfpHuYHJh6yM+na0WLi3Lb910m73Xth8N3ZBnJKpAW5Qxww@mail.gmail.com>
 <7bb65ee6.129c.196b857cdb3.Coremail.00107082@163.com>
In-Reply-To: <7bb65ee6.129c.196b857cdb3.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 21:03:06 -0700
X-Gm-Features: AX0GCFsLYORsD96opZgIs85f1ii3lyJmLrotI3rCOLs3ZebES_QUF9_QvaGjKQ0
Message-ID: <CAJuCfpE670s5=QAbuqCLB3XuOkfL=L44r93cwJdrhHn=bYNd-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between
 read() calls
To: David Wang <00107082@163.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, kent.overstreet@linux.dev, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 8:58=E2=80=AFPM David Wang <00107082@163.com> wrote:
>
>
>
> At 2025-05-10 11:30:50, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Fri, May 9, 2025 at 8:10=E2=80=AFPM David Wang <00107082@163.com> wro=
te:
> >>
> >>
> >> At 2025-05-10 05:15:43, "Suren Baghdasaryan" <surenb@google.com> wrote=
:
> >> >On Fri, May 9, 2025 at 1:46=E2=80=AFPM Suren Baghdasaryan <surenb@goo=
gle.com> wrote:
> >> >>
> >> >> On Fri, May 9, 2025 at 12:46=E2=80=AFPM Tim Chen <tim.c.chen@linux.=
intel.com> wrote:
> >> >> >
> >> >> > On Fri, 2025-05-09 at 12:36 -0700, Suren Baghdasaryan wrote:
> >> >> > > On Fri, May 9, 2025 at 11:33=E2=80=AFAM Tim Chen <tim.c.chen@li=
nux.intel.com> wrote:
> >> >> > > >
> >> >> > > > On Sat, 2025-05-10 at 01:39 +0800, David Wang wrote:
> >> >> > > > >
> >> >> > > > >
> >> >> > > > > Signed-off-by: David Wang <00107082@163.com>
> >> >> > >
> >> >> > > Acked-by: Suren Baghdasaryan <surenb@google.com>
> >> >> > >
> >> >> > > > > ---
> >> >> > > > >  lib/alloc_tag.c | 29 ++++++++++-------------------
> >> >> > > > >  1 file changed, 10 insertions(+), 19 deletions(-)
> >> >> > > > >
> >> >> > > > > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >> >> > > > > index 25ecc1334b67..fdd5887769a6 100644
> >> >> > > > > --- a/lib/alloc_tag.c
> >> >> > > > > +++ b/lib/alloc_tag.c
> >> >> > > > > @@ -45,21 +45,16 @@ struct allocinfo_private {
> >> >> > > > >  static void *allocinfo_start(struct seq_file *m, loff_t *p=
os)
> >> >> > > > >  {
> >> >> > > > >       struct allocinfo_private *priv;
> >> >> > > > > -     struct codetag *ct;
> >> >> > > > >       loff_t node =3D *pos;
> >> >> > > > >
> >> >> > > > > -     priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> >> >> > > > > -     m->private =3D priv;
> >> >> > > > > -     if (!priv)
> >> >> > > > > -             return NULL;
> >> >> > > > > -
> >> >> > > > > -     priv->print_header =3D (node =3D=3D 0);
> >> >> > > > > +     priv =3D (struct allocinfo_private *)m->private;
> >> >> > > > >       codetag_lock_module_list(alloc_tag_cttype, true);
> >> >> > > > > -     priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> >> >> > > > > -     while ((ct =3D codetag_next_ct(&priv->iter)) !=3D NUL=
L && node)
> >> >> > > > > -             node--;
> >> >> > > > > -
> >> >> > > > > -     return ct ? priv : NULL;
> >> >> > > > > +     if (node =3D=3D 0) {
> >> >> > > > > +             priv->print_header =3D true;
> >> >> > > > > +             priv->iter =3D codetag_get_ct_iter(alloc_tag_=
cttype);
> >> >> > > > > +             codetag_next_ct(&priv->iter);
> >> >> > > > > +     }
> >> >> > > >
> >> >> > > > Do you need to skip print header when *pos !=3D 0? i.e add
> >> >> > >
> >> >> > > Technically not needed since proc_create_seq_private() allocate=
s
> >> >> > > seq->private using kzalloc(), so the initial value of
> >> >> > > priv->print_header is always false.
> >> >> >
> >> >> > But we'll start with first call to allocinfo_start() with *pos =
=3D=3D 0,
> >> >>
> >> >> Usually but not always if we do lseek() to a non-zero position befo=
rehand.
> >> >
> >> >Actually, this change will break the lseek() case. We can't always
> >> >assume that we start reading from *pos =3D=3D 0. Current patch will f=
ail
> >> >to initialize priv if we start reading with *pos !=3D 0.
> >> >priv->iter should be tracking current position and allocinfo_start()
> >> >should detect a mismatch between *pos and iter->pos and re-walk the
> >> >tags if there was a position change.
> >>
> >> seq_file works line by line,  I think even if it support lseek, seq_fi=
le would still start with line #0,
> >> since seq_file have on clue the byte size for each line.
> >>
> >> I will check the code,  make some tests and update later.
> >
> >Ah, yes. You are correct.
> >seq_lseek() will traverse restarting from 0:
> >https://elixir.bootlin.com/linux/v6.14.6/source/fs/seq_file.c#L323.
> >Position jumps are similarly handled with traversal from 0:
> >https://elixir.bootlin.com/linux/v6.14.6/source/fs/seq_file.c#L194.
> >
>
> Actually I was expecting EOPNOTSUPP when lseek on seq files, surprised to=
 see it works...... :)
>
> If seq_file somehow skips start(0),  then nothing would be displayed sinc=
e
> priv->iter.ct would be 0 and `return priv->iter.ct ? priv : NULL;` would =
return NULL;
> But I think that case  would be  seq_file's bug,   starting with 0 is kin=
d of protocol promised by seq_file.

Yes, I think that is the correct assumption. Even pread() with a jump
in position should work the same way, restarting at 0.

>
>
> >>
>
> >>
> >> >
> >> >>
> >> >> > then print_header will be initialized to true.
> >> >>
> >> >> After the first call to allocinfo_show() print_header will be reset
> >> >> back to false.
> >> >>
> >> >> > Will there be subsequent calls of allocinfo_start() with *pos !=
=3D0,
> >> >> > but priv->print_header stays at 0?
> >> >>
> >> >> Yes, there will be subsequent calls to allocinfo_start() with *pos =
!=3D0
> >> >> and priv->print_header=3Dfalse, which is what we want, right? We wa=
nt to
> >> >> print the header only at the beginning of the file (node =3D=3D 0).
> >> >>
> >> >> >
> >> >> > Tim
> >> >> > >
> >> >> > > >
> >> >> > > >         } else {
> >> >> > > >                 priv->print_header =3D false;
> >> >> > > >         }
> >> >> > > >
> >> >> > > > Tim
> >> >> > > >
> >> >> > > > > +     return priv->iter.ct ? priv : NULL;
> >> >> > > > >  }
> >> >> > > > >
> >> >> > > >
> >> >> >
