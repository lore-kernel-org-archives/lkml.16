Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61024889B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277957; cv=none; b=qHHJx2qNz6vv+Uhmj9HIt6aG4ycF8F5aWpaHnIYfrfebzCGhRW4bBSeSB7u1j6wd5hH5l7WNN3BWXmphFpl8irycdTxM5M3h3T3KzmPKj8+1u/A8cQ0Hu6SqK2t8Hg7ejc4Chpno0VOkhldpGp9mfE0k6qbcT9RrPXPX3YaJuSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277957; c=relaxed/simple;
	bh=cND8KnHFqjASahdvxji0sLcbPl2XO4nal1045B0qiPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFZ9hxX52A9qOouKIGIlCDCy+QlbPyW5XUnjGB7Qs0GqwZ/mK3zqsgUmkiNJ3U4dPyqikE2L4mBNtxsL9Fo0QuisutcLRX8Dq6Uhhk2QYT7YWX9QvRCkd813/yMIOUR4KxHj/FsduGDeP7jLa5mMuwAY3nmpTz6ZPkZ0Eg+v2NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lkaUtHQ7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lkaUtHQ7"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553a66c3567so7395e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751277953; x=1751882753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5W/aCkH5j3ZLhBzUnk4+o0iMGbCFsEB9QPytpHfm7c=;
        b=lkaUtHQ7s6Qovu0Bu7CWOB4E6beA1euHJmtgrce8hLSQ8LiIkRu76mRVQdyVokoohk
         TJ6MSZ+ER+ZmRptxNls6FS5wGJTvYSIpEIB+AELMjNucYJLcNUQ++9Y0q94mXYxg0FPe
         Eivf961N6XtYs9YQf2HRf45c4HJMOr/pNtNrzmjESmgR76SMjibSrllt7mk/WBPWuF32
         nZKoSJOmx1+Y8gQl0TDDhQbH0a61+ypj/H6p21KLpngImdoGPUSMBDwFvCN6wtFixt1j
         4zT4fiUExe2S+fDp6FQc+Wsc/LCR2GkwrXmoeTCFQRqc3NEEZDa5q2SAkA5orQtAFK2K
         iqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277953; x=1751882753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5W/aCkH5j3ZLhBzUnk4+o0iMGbCFsEB9QPytpHfm7c=;
        b=CcftQQZU85FwFY41GsVSsKqyEsIyLYgGk7KrNQKac+KLa0VDiHdfzaXTt5KtIcunim
         QnUEeFm9hKdCHCIzbfRNUdMROHGftW6tKMZvQqgNTwy3XSx1dDpa/+PCKlU4i3DV/14h
         tw/0Nq+oEOIkgTdH6rJdgSJCs4vey0ROYDlgjpDPouCMJ8Ys0qTDdM6rKTGgmmbG4dPW
         vVD5GpxvbxOAHzma1/mu/Ve29GtoNMs7oUP9t2TPhzIJ1JHF72nrhmTgXb4e2tCf+CKm
         L1WuK5bx9S1uabqqhO//9S5MUdxEBr+6sezby/elwu+gwFOegqpohfD+IuG+29wOmkEU
         q0QA==
X-Forwarded-Encrypted: i=1; AJvYcCVirzkmGTGVx2kPk9yOrswSKoZQ7YgUssXE9aCjYS9BTjkda5ATBTpaIRS/hP+Y2zC0fkC3HasmNDeIv2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc87ypaXBR99P3RJAz9QqKHUx46ftFAlfvyLJTqF6EznD52pVm
	/xkls4NMrkMY1NFqGC8I2mIgK8m5eEgkDWpPtMwteOkYRfPE8JcABx6WsUW02TymbbC1nj5Q3c1
	LFP6CK87f8WXFN/IGTYjVMEmy+rn6XqqNgN1a84X7
X-Gm-Gg: ASbGncuvuVtHndPt8xTfIjIhp7Yq1voOwaLTcDpnJ8+ShICh4dYh9MH7Z+sw0dBm3Im
	9di4cPcwDRIXbjZxpw0sXRAF8122Zo8D31OFh16lirPRqoK9B2IS0F75qi/NSAGUylsXPqSlFv9
	tzX+QzmFGd4gdppdmyv/CIxd5/MCCPZMkQ9jYVPzPr419e7L3LIJvMEi4YqVAkeb6cj/hiPyg=
X-Google-Smtp-Source: AGHT+IEehaw/D/wnspUhLXMrazPF9xkSjn2yt6Mt9vV9dtn4BkBRGAGPcuzi4KGS7PFJfVQUk50Qzwro6et5OzesapA=
X-Received: by 2002:a05:6512:228b:b0:555:4de:c172 with SMTP id
 2adb3069b0e04-55513fc99eemr271882e87.3.1751277953101; Mon, 30 Jun 2025
 03:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com> <20250625095215.4027938-1-gprocida@google.com>
 <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
In-Reply-To: <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
From: Giuliano Procida <gprocida@google.com>
Date: Mon, 30 Jun 2025 11:05:16 +0100
X-Gm-Features: Ac12FXxmNoP6PvMu6OOoOXG12Jh_6-R_MmbOZXUFBdsR8S9d8WpM8vXppST1XSk
Message-ID: <CAGvU0HnzfLxGhLT3Se4wNvyzEkpTKmd8ATFFgBRBVNrOKDXcgA@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: order -T symtypes output by name
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

On Sun, 29 Jun 2025 at 18:51, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 6:52=E2=80=AFPM Giuliano Procida <gprocida@google=
.com> wrote:
> >
> > When writing symtypes information, we iterate through the entire hash
> > table containing type expansions. The key order varies unpredictably
> > as new entries are added, making it harder to compare symtypes between
> > builds.
> >
> > Resolve this by sorting the type expansions by name before output.
> >
> > Signed-off-by: Giuliano Procida <gprocida@google.com>
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
> >  1 file changed, 26 insertions(+), 3 deletions(-)
> >
> > [Adjusted the first line of the description. Added reviewer tags.
> >  Added missing CC to linux-modules.]
> >
> > diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/type=
s.c
> > index 7bd459ea6c59..51c1471e8684 100644
> > --- a/scripts/gendwarfksyms/types.c
> > +++ b/scripts/gendwarfksyms/types.c
> > @@ -6,6 +6,8 @@
> >  #define _GNU_SOURCE
> >  #include <inttypes.h>
> >  #include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> >  #include <zlib.h>
> >
> >  #include "gendwarfksyms.h"
> > @@ -179,20 +181,41 @@ static int type_map_get(const char *name, struct =
type_expansion **res)
> >         return -1;
> >  }
> >
> > +static int cmp_expansion_name(const void *p1, const void *p2)
> > +{
> > +       struct type_expansion *const *e1 =3D p1;
> > +       struct type_expansion *const *e2 =3D p2;
> > +
> > +       return strcmp((*e1)->name, (*e2)->name);
> > +}
> > +
> >  static void type_map_write(FILE *file)
> >  {
> >         struct type_expansion *e;
> >         struct hlist_node *tmp;
> > +       struct type_expansion **es;
> > +       size_t count =3D 0;
> > +       size_t i =3D 0;
> >
> >         if (!file)
> >                 return;
> >
> > -       hash_for_each_safe(type_map, e, tmp, hash) {
> > -               checkp(fputs(e->name, file));
> > +       hash_for_each_safe(type_map, e, tmp, hash)
> > +               ++count;
> > +       es =3D xmalloc(count * sizeof(struct type_expansion *));
>
> Just a nit:
>
>            es =3D xmalloc(count * sizeof(*es));
>
> is better?
>
> > +       hash_for_each_safe(type_map, e, tmp, hash)
> > +               es[i++] =3D e;
> > +
> > +       qsort(es, count, sizeof(struct type_expansion *), cmp_expansion=
_name);
>
> qsort(es, count, sizeof(*es), cmp_expansion_name);
>

That's a fair point.

However, in the gendwarfksyms code, all but one of the sizeofs uses an
explicit type name. The exception is sizeof(stats) where stats is an array.

I'll leave Sami's code as it is.

Giuliano.

>
> > +
> > +       for (i =3D 0; i < count; ++i) {
> > +               checkp(fputs(es[i]->name, file));
> >                 checkp(fputs(" ", file));
> > -               type_list_write(&e->expanded, file);
> > +               type_list_write(&es[i]->expanded, file);
> >                 checkp(fputs("\n", file));
> >         }
> > +
> > +       free(es);
> >  }
> >
> >  static void type_map_free(void)
> > --
> > 2.50.0.714.g196bf9f422-goog
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada
