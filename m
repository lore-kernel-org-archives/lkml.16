Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5257DA82
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291162; cv=none; b=tvfxY6tOPjO1s/a/PKcvV5r8l+r9lXFxSjvH2SLkAFsqK5dcieAayPzfMKMQmu7nkm6sxLi6tbsGivyL9V0LXYp5936ZFka5znj25QTE1d9fnCYWnSBDU3CffsP5zXWuaTuSAB6ap710Yffyd+uNtYZ0x3pq/iPc8aCcuOJ1OYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291162; c=relaxed/simple;
	bh=Hm2MbwnXKGaJY2SHxo57MJJ3f6qfhV7R4lhuAtejQEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF3/YtE9vxY6bIVTc7fWRLBgNo2wU1Zh4LKluOuRh1kF+Att3nvyc9rj74sZYZJv9ypvJIBrj1eXq1a1e5ifMtGTIYVLwAupLwA4eV2kJyamIEwe1HkxBGBOWQE/ov4XZcWJ4bkortY6qI2xgOxIWxWkQKikdSATwB0M7cQnbT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4s/41yj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4s/41yj"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-554f9a46164so8015e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751291158; x=1751895958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWmIrVh084A9jSFONPMpFqcwNwUZcNanqciTXj5s4zw=;
        b=U4s/41yjZbvcqUJ8z9Dgo4L4piFHwwV+7mVljl87BsuCPpZsYrV7R+dzgNnuAIqhXx
         jruH7+/JoQC5tO2iQ01lKTMrJDI6vhTml0ctGJqJGrwFRUJXlPb8iLlL4375IsjjYuUK
         0+fpdQyVyfXCGzT2hEq43wEAF2ZL3j4xPPo+MhsE7HYDPFeHBk6pzwAXPaPgcs03A4qv
         eHIgIOPfrJI8cPsvkwhHM6+hVvTbIFu2/FvS/PoOs7tggcEW2jAdwbRtiL5vntIDDjG4
         DH/4HuJ57HJjYoSJ3Rr/VxJp8Mlz2nkExR6NZxyDXUEul4UBxLzQjQWMsrTc7nxgYJP3
         t5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291158; x=1751895958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWmIrVh084A9jSFONPMpFqcwNwUZcNanqciTXj5s4zw=;
        b=pfuBzGDtuNRwifBhsRmumpTOo4XC0v0fCrlD4/YX5Y5KIKy25cnO5f8ZXZO2J0nIMS
         mDCx/w6zNjWFBZpJ7W2iIEPZGENIARn3WCOwUk0Zulfp1XK4qyeMlRE1P/EPIZZuCOhp
         VUdopz8c9rK9FvYB2eC8j41J9ufXUxO4n7kLtJ1x4UOcs1XuQxgRiGEkJIo4w59R6Uof
         yYHcVRZexv4ZW9A6HELT0JNgFUkko+T5Y/+4mOUAC7Uq31l5k2Cu1YBbLrfkD9fnDdKi
         egCvNwfmywajzpkDsIYaPkzCHnDonY8nPXyqfcDDmedIpteegJbDXBrmdfAc/sLf0BkU
         FZow==
X-Forwarded-Encrypted: i=1; AJvYcCX2gmnq9pV3gMqJFeCqSq/6OzeXm3QiID8iH82PnpioKpiSxeSR/LjS3mDEMIE62+LPlX3EJ7MKP4+SC/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbphQ8x3gMRDhwNUUCv5gIARieaI3gz8OPeDKpEEeqkoGT1EKS
	j4KSt7e2fuKQRgRqGJgRw/ih9sRpommhfKHNwlnU1cRAntCivbneRJ8scyBbnuPdcqkM30Crx2B
	eOszqS2wdSNjJRdsYol5LA58OqscS9rrMFUBrF+rV
X-Gm-Gg: ASbGncuGFNEeJxULyHDdObppLxQdbpGgjMFCPMHXbF+14LIq8h9KPX1YWvAjggYZ2HZ
	LOeMpc7Grl5Xr3oOIUo5MFd1wnTGzBV8R9sN1bjlKwXG8BITd0byvk1gktQrDwWqbvyzZqT0gdB
	1VeeFIQ5+RNVyNGlZ7KmFBEKmqLRGmv1LYviwpE0xC1UfKinKaCWUAUyVOBFWS2BO8AGOhx/QT
X-Google-Smtp-Source: AGHT+IH05ue31sjxr2KdVgJP17Yc3pASLUVWnVUjo0re10D86rxcIxDQG9NNQHSZ1qpfo2acDCIsZpKWq8UAcdAUe3c=
X-Received: by 2002:a05:6512:2445:b0:553:24cf:79c with SMTP id
 2adb3069b0e04-5551404736bmr276292e87.7.1751291158014; Mon, 30 Jun 2025
 06:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com> <20250625095215.4027938-1-gprocida@google.com>
 <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
 <CAGvU0HnzfLxGhLT3Se4wNvyzEkpTKmd8ATFFgBRBVNrOKDXcgA@mail.gmail.com> <CAK7LNATp1n2c9RqNoe0oztRtLoMy8JqHF1KqSRsj5avp3vjHCQ@mail.gmail.com>
In-Reply-To: <CAK7LNATp1n2c9RqNoe0oztRtLoMy8JqHF1KqSRsj5avp3vjHCQ@mail.gmail.com>
From: Giuliano Procida <gprocida@google.com>
Date: Mon, 30 Jun 2025 14:45:21 +0100
X-Gm-Features: Ac12FXyRhPKA7k9LFq_9lXtXeBu0I63z-ojiqb2OMdNduBkpVKUo_WdgJg-YSnA
Message-ID: <CAGvU0HkKacQKB1q9NWcqChLGoMB+1vu9UdqYc+tBRbTTc3++GQ@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: order -T symtypes output by name
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Jun 2025 at 14:24, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Jun 30, 2025 at 7:05=E2=80=AFPM Giuliano Procida <gprocida@google=
.com> wrote:
> >
> > Hi.
> >
> > On Sun, 29 Jun 2025 at 18:51, Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
> > >
> > > On Wed, Jun 25, 2025 at 6:52=E2=80=AFPM Giuliano Procida <gprocida@go=
ogle.com> wrote:
> > > >
> > > > When writing symtypes information, we iterate through the entire ha=
sh
> > > > table containing type expansions. The key order varies unpredictabl=
y
> > > > as new entries are added, making it harder to compare symtypes betw=
een
> > > > builds.
> > > >
> > > > Resolve this by sorting the type expansions by name before output.
> > > >
> > > > Signed-off-by: Giuliano Procida <gprocida@google.com>
> > > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > > ---
> > > >  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
> > > >  1 file changed, 26 insertions(+), 3 deletions(-)
> > > >
> > > > [Adjusted the first line of the description. Added reviewer tags.
> > > >  Added missing CC to linux-modules.]
> > > >
> > > > diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/=
types.c
> > > > index 7bd459ea6c59..51c1471e8684 100644
> > > > --- a/scripts/gendwarfksyms/types.c
> > > > +++ b/scripts/gendwarfksyms/types.c
> > > > @@ -6,6 +6,8 @@
> > > >  #define _GNU_SOURCE
> > > >  #include <inttypes.h>
> > > >  #include <stdio.h>
> > > > +#include <stdlib.h>
> > > > +#include <string.h>
> > > >  #include <zlib.h>
> > > >
> > > >  #include "gendwarfksyms.h"
> > > > @@ -179,20 +181,41 @@ static int type_map_get(const char *name, str=
uct type_expansion **res)
> > > >         return -1;
> > > >  }
> > > >
> > > > +static int cmp_expansion_name(const void *p1, const void *p2)
> > > > +{
> > > > +       struct type_expansion *const *e1 =3D p1;
> > > > +       struct type_expansion *const *e2 =3D p2;
> > > > +
> > > > +       return strcmp((*e1)->name, (*e2)->name);
> > > > +}
> > > > +
> > > >  static void type_map_write(FILE *file)
> > > >  {
> > > >         struct type_expansion *e;
> > > >         struct hlist_node *tmp;
> > > > +       struct type_expansion **es;
> > > > +       size_t count =3D 0;
> > > > +       size_t i =3D 0;
> > > >
> > > >         if (!file)
> > > >                 return;
> > > >
> > > > -       hash_for_each_safe(type_map, e, tmp, hash) {
> > > > -               checkp(fputs(e->name, file));
> > > > +       hash_for_each_safe(type_map, e, tmp, hash)
> > > > +               ++count;
> > > > +       es =3D xmalloc(count * sizeof(struct type_expansion *));
> > >
> > > Just a nit:
> > >
> > >            es =3D xmalloc(count * sizeof(*es));
> > >
> > > is better?
> > >
> > > > +       hash_for_each_safe(type_map, e, tmp, hash)
> > > > +               es[i++] =3D e;
> > > > +
> > > > +       qsort(es, count, sizeof(struct type_expansion *), cmp_expan=
sion_name);
> > >
> > > qsort(es, count, sizeof(*es), cmp_expansion_name);
> > >
> >
> > That's a fair point.
> >
> > However, in the gendwarfksyms code, all but one of the sizeofs uses an
> > explicit type name. The exception is sizeof(stats) where stats is an ar=
ray.
> >
> > I'll leave Sami's code as it is.
>
>
> This rule is clearly documented with rationale.
>
> See this:
> https://github.com/torvalds/linux/blob/v6.15/Documentation/process/coding=
-style.rst?plain=3D1#L941
>
>

I can follow up with a change that adjusts all occurrences. That
shouldn't take long at all.

>
> --
> Best Regards
> Masahiro Yamada
