Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DDD153BD9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819432; cv=none; b=m5dY9/jgHM+tWk+Hd2GSFb8JT3IvA51+SHNfqf7EQ1Ox4Ya2Pxpxw7y6IaoiFpjQWlS/yDTRdwZxV2k1NXVThOcPh3HquN1asvDf/v5/UxksJNBWsa7XrQHgrS2o7bEVaJnLf0Y1xygEaQzMBJlhyKjeiU6tfTe9KiiUuvHxixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819432; c=relaxed/simple;
	bh=Qvzebave4bb87r54HVfRq1tPLeB+K+3lDpKsRKaaZ3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z24eeo6lR7PxS7CRogK0lVHoQ4zIfzBgJuTjUus92aXb0rtUtX8gT5Nz5rQBwW7h9i0dl+qLSs4+rwfNuBE7v3FuhVLNGLTBXzucvkyiggzsByc5bI/2m4+uY+Juce9CNi2IeMdzd0/egvzeDnETaNflmydEJegumW60ZSMVcq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I+cqH6DS; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I+cqH6DS"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47e9fea29easo3271cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746819429; x=1747424229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vTa7RtCHjxieC6hTOF42B8Cm9AsQcKEy9wOP2glWys=;
        b=I+cqH6DS5PiTP+N2pFBa/YdTBkKW5ryrmlKK0vTaV9GFz4YRCUQnKuGNdNfZXoKDLC
         CaA+VvsNE0rZsRmQp4xVQy4oN7+P0qfWiRUczbQn0HxZnJQdgteDJYEnaeqmXzpujWNv
         s33/3c8XDZyEWJp0kw8RysD2IwYxQt45/SCpsMXQLqQF3e0s71Ht5sHhd4e6HdSLuUd5
         I6tl/gS6+h6PcmItxST/fNOyjzxgaOc2AJ37muc0iKtW9cSUh6kQTfehPybWp81GF4w/
         tocUMN6XvBZuyVREOhfpih67jcEq6ptP4LsTS2nQcxxDdc7O9oeeoGqvY+08ixZDxJIV
         X28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746819429; x=1747424229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vTa7RtCHjxieC6hTOF42B8Cm9AsQcKEy9wOP2glWys=;
        b=nNV2X+vDwcJe9OhhvWyTE12TxUt65BQrsp27tcFXgADG8sx7sNQzOjVqepMyyq+2M7
         GnmUAvJCGn5YRMDw5DLkPURG4D8KIJ/W9X+zLVVRlGgSp4oewVgikboSO9McFtat1IwD
         LA7hSxWU/KQzeelB341oeN0+4n8IpyIx6tSnuTZeBR3sO4jNCNBMaIOVFOojnyyfHWek
         6Qsjh+ldAh+7qXroCMdHBrHlJHmQp66TAUJ2oqkfOFcvZu1IOkkcAAvTTu9TGzACIcQQ
         cs30/64MV+iHIyTTyboGwDq6hPR4JkqkrQbEPnVelfV2hCc890qpjYimoxoqpzEKuwyp
         onMA==
X-Forwarded-Encrypted: i=1; AJvYcCU4OhsxocyjjXHXaYfx4O/jePxspbCTlaQIO9Ol7IoYvsPARl98drGanSnSToE5wpzPJlMl8OPdE3EXx38=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZq9XYM7720GIi8WYKEf8+5OmQ6KPXt6hWP3ahT5cKCTAhDmDX
	L4z3J+jg/RU7W8jlZo2g88Z1z3wVc+2+Kn64XCPRc1n/8Qb65SO9DtlwbEZbJv+M2fpa+gN/JJh
	5kDFkc39ZXMgDQIawTi5SUEovu3lCyl74ymOS
X-Gm-Gg: ASbGncv1LRjF8cj6yJIL2B9GllrNVBGuN8M+7tavjQF7av1LmXBryK5q+wL/8pZeMiZ
	H++fKu8VgdfEjX8yfidwCu6D9fSr6kXgzZbQbCzXvRxFcfSiYRf6ZBmwqgdtNngVoo2SZAEmqmK
	43C4bZB7oo1e6F2QsBEeeLMhdZMvkEj5g=
X-Google-Smtp-Source: AGHT+IHxwdhepzhm9r4/VsjN1+OHVF5JZWVhbaKD3NJOFLFfHNJGUKeQRwNxPIm5hEZATtnjyhd24FOFu+BCJTxlq7k=
X-Received: by 2002:ac8:5f85:0:b0:47d:cd93:5991 with SMTP id
 d75a77b69052e-494612f9bdemr576991cf.21.1746819429277; Fri, 09 May 2025
 12:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <20250509173929.42508-1-00107082@163.com>
 <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
In-Reply-To: <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 12:36:47 -0700
X-Gm-Features: AX0GCFti7bNqGFrfEJY-DR9yB3WqRlM7xrBhfUKajVDVf17WhbO-8Pm_9O-kOeM
Message-ID: <CAJuCfpHB8T8daanvE_wowRD9-sAo30rtCcFfMPZL_751+KSs5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between
 read() calls
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: David Wang <00107082@163.com>, kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:33=E2=80=AFAM Tim Chen <tim.c.chen@linux.intel.co=
m> wrote:
>
> On Sat, 2025-05-10 at 01:39 +0800, David Wang wrote:
> >
> >
> > Signed-off-by: David Wang <00107082@163.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> > ---
> >  lib/alloc_tag.c | 29 ++++++++++-------------------
> >  1 file changed, 10 insertions(+), 19 deletions(-)
> >
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index 25ecc1334b67..fdd5887769a6 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -45,21 +45,16 @@ struct allocinfo_private {
> >  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> >  {
> >       struct allocinfo_private *priv;
> > -     struct codetag *ct;
> >       loff_t node =3D *pos;
> >
> > -     priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > -     m->private =3D priv;
> > -     if (!priv)
> > -             return NULL;
> > -
> > -     priv->print_header =3D (node =3D=3D 0);
> > +     priv =3D (struct allocinfo_private *)m->private;
> >       codetag_lock_module_list(alloc_tag_cttype, true);
> > -     priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > -     while ((ct =3D codetag_next_ct(&priv->iter)) !=3D NULL && node)
> > -             node--;
> > -
> > -     return ct ? priv : NULL;
> > +     if (node =3D=3D 0) {
> > +             priv->print_header =3D true;
> > +             priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > +             codetag_next_ct(&priv->iter);
> > +     }
>
> Do you need to skip print header when *pos !=3D 0? i.e add

Technically not needed since proc_create_seq_private() allocates
seq->private using kzalloc(), so the initial value of
priv->print_header is always false.

>
>         } else {
>                 priv->print_header =3D false;
>         }
>
> Tim
>
> > +     return priv->iter.ct ? priv : NULL;
> >  }
> >
>
