Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3862820CC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420832; cv=none; b=bzE/ddT9XKFuhIqV229XpVwSypJdIIaitxLc2jkLgm5AkX2haAxT2suV6h8ObkePM6JNSmPBRTeFs+YlBJTFcxfAfeO+IW83tL6EJ4H9KFP82B7nRBiBT60Bkuq31nle3aTHxv/3AtYRVkLKaIsWktEfAWQFDdKlMS11v4+PIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420832; c=relaxed/simple;
	bh=IdBv6YTztLBcPUzjy+NEEOJavwBudUE5lS8WbW9sTd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pxxj6dDk1ptjGQxJnAVMZ9E86cSRh6kD3sEGDE3JKXvwm88iI6L8NcM5T4fVk4bVqHDChOZqTMJjhIb9+61NPmTqF3RAHMcgk0fIEbtkuSCtppEH7Ruu5DKFI8wJwp7cHhyueYdF3hMkxv+BJ/5wi0wEt4nvTu+nPoNTIHXBrLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIdqFxWQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIdqFxWQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso31897005e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745420829; x=1746025629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le4FePmuI1cf2O7gbMot632SfgGL/fcYU/XLeIWLsAo=;
        b=PIdqFxWQDNJ+M/5Mf2PomlyweVOQLjnSLrlHZSo4VofxBlE3aR0XuMf4cctfU4MoxL
         hZy0Yi6ud1bj85wsIagc+DrwfqYeNZWn/Tw99roamlAf5sQ9+/Ij1wrE/WQU14EgIICl
         IgFF2Bpf32wFUq3OE8hxbczyZ8sK4W2J2UWmQapQVzczpTiBDLiBVCM1kqVqKvRNarOv
         yvVS0oH/3ine5dojMWVsotZqUMK+pmC/FSXrTpXLmXa8J2j1Mht2gilXZFayE+1MoaMg
         MbhAO6sBEul5NgXYeY64xZthcB577ZyM/Gu1pk/COSVyHdEeskBCtDedN/FTXtOb9DTq
         Hb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420829; x=1746025629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le4FePmuI1cf2O7gbMot632SfgGL/fcYU/XLeIWLsAo=;
        b=AK1PItGCKUeN4rMPKAr8MgIAFld0I0Ma1lmwG9cqEHm+fXpYBWXeqnu7h1zbaAEsQc
         df8iiR1LeYeqCxFP4vC0kkk9EmYVlFSryxo+RDTIQmrHhS+8T+unKEBwOfKUGp5Ma40Y
         wXBH0T6e3sRyyIIwCLRF2SkKCukt+kRbJ8etG1C91TmGVZtPZK1Rp8jh60m2/htgmvsS
         +ylfwiRSuEiLMtD/2k2q8gj1MviBYCPSJ70byr1DiNr8Bndu8MCCy9a6kJPZPKK8bGN3
         8RWLSbzjt23+nv9wmUDCcYjQrjS/HGdFVqguLycWCb4ulfGvtx7kqQ2rq8BWbLDB5w/t
         qGww==
X-Forwarded-Encrypted: i=1; AJvYcCXtVFeHQU9/xxFYf0too4RbXXywG+IJYEXNHlN3S/rVjocyyGb9HKVH60Jk6fjuizWYa1rlBjxEvKZp0lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSKgNyCk3lfDMxF/CUhUFA58l2FsBDhee8XGLIGoiK5ke6bHvd
	7f6zf4X1rDc+0LBwMPmnmibC1rnB6TXr20A/7WQV9CcZojsrY6XeQR5SINJjMrO/Pv15x2F3+CR
	7el09VmX9xva3zINW980dbW3HLvY=
X-Gm-Gg: ASbGnctwPHWb5O4HZR2m9T5VT7ehfu+bA2hFWdNtFTlO3S6d4/N0+Pd+OREhVzCJF8T
	QkOydyp8oeoZntuWb631YQYmth5gVzr+QObftoxhq64I36IwiXE0gqy0JrrqwlSxcTDWP3ROaLy
	2Gf+ahGfuFlsZ0sjnQoR5ZQA13y0sm42f8hI+bzg==
X-Google-Smtp-Source: AGHT+IHTLuyTdeudidq8XkvasdRpWK3D2wAaxDhiCe0Sw2GOJduNkztOVqdOUHOfktMaHaz+WhVIPKHWgI1wGZvBA3I=
X-Received: by 2002:a05:600c:4f0d:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-4406ac2194cmr185955755e9.30.1745420828986; Wed, 23 Apr 2025
 08:07:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
 <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
 <0981c1fe-05d2-4bab-a0a4-6dc5666d98d7@suse.cz> <bb701616-26b8-41f0-8a19-0f76b2a64deb@suse.cz>
In-Reply-To: <bb701616-26b8-41f0-8a19-0f76b2a64deb@suse.cz>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 23 Apr 2025 08:06:57 -0700
X-Gm-Features: ATxdqUHC-VVGLPrDjeNr0MwBJPmCNhVA75DFkOqY9-G__yUUy3LNBUkEhKvgj78
Message-ID: <CAADnVQ+bDD8T6trgGePCUbjAcz36x1P0RqhNy0nRju_ULiw+mg@mail.gmail.com>
Subject: Re: Linux 6.15-rc3
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Dave Airlie <airlied@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Sebastian Sewior <bigeasy@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 1:03=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 4/23/25 09:14, Vlastimil Babka wrote:
> > On 4/23/25 01:37, Alexei Starovoitov wrote:
> >> On Tue, Apr 22, 2025 at 4:01=E2=80=AFPM Dave Airlie <airlied@gmail.com=
> wrote:
> >>>
> >>> > Alexei Starovoitov (2):
> >>> >       locking/local_lock, mm: replace localtry_ helpers with
> >>> > local_trylock_t type
> >>>
> >>> This seems to have upset some phoronix nginx workload
> >>> https://www.phoronix.com/review/linux-615-nginx-regression/2
> >>
> >> 3x regression? wow.
> >> Thanks for heads up.
> >> I'm staring at the patch and don't see it.
> >> Adding more experts.
> >
> > Incidentally my work on slab sheaves using local_trylock() got to a pha=
se
> > yesterday when after rebasing on rc3 and some refactoring I was looking=
 at
> > sheaf stats that showed the percpu sheaves were used exactly once per c=
pu,
> > and other attempts failed. Which would be explained by local_trylock()
> > failing. In the context of rc3 itself it would mean the memcg stocks ar=
en't
> > used at all because they can't be try-locked. Which could make benchmar=
ks
> > unhappy of course, although surprising that it would be that much.
> >
> > What I suspect now is the _Generic() part doesn't work as expected. So =
consider:
> >
> > local_trylock() (or _irqsave variant) has no _Generic() part, does the
> > "if (READ_ONCE(tl->acquired))" and "WRITE_ONCE(tl->acquired, 1)" direct=
ly,
> > succeeds the first attempt on each cpu where executed.
> >
> > local_unlock() goes via __local_lock_release() and since the _Generic()=
 part
> > there doesn't work, we don't do WRITE_ONCE(tl->acquired, 0); so it stay=
s 1.
> >
> > preempt or irq handling is fine so nothing like lockdep, preempt debugg=
ing,
> > watchdogs gets suspicious, just the cpu can never succeed local_trylock=
() again
> >
> > local_lock(_irqsave()) uses __local_lock_acquire() which also has a
> > _Generic() part but since it doesn't work, the "lockdep_assert(tl->acqu=
ired
> > =3D=3D 0);" there isn't triggered either
> >
> > In fact I've put BUG() in the _Generic() sections of _acquire() and _re=
lease()
> > and it didn't trigger, which would prove the code isn't executed. But I=
 don't
> > know why _Generic() doesn't recognize the correct type there.
> >
> > --- a/include/linux/local_lock_internal.h
> > +++ b/include/linux/local_lock_internal.h
> > @@ -104,6 +104,7 @@ do {                                               =
                 \
> >                 _Generic((lock),                                       =
 \
> >                         local_trylock_t *: ({                          =
 \
> >                                 lockdep_assert(tl->acquired =3D=3D 0); =
     \
> > +                               BUG();                                 =
 \
> >                                 WRITE_ONCE(tl->acquired, 1);           =
 \
> >                         }),                                            =
 \
> >                         default:(void)0);                              =
 \
> > @@ -173,6 +174,7 @@ do {                                               =
                 \
> >                 _Generic((lock),                                       =
 \
> >                         local_trylock_t *: ({                          =
 \
> >                                 lockdep_assert(tl->acquired =3D=3D 1); =
     \
> > +                               BUG();                                 =
 \
> >                                 WRITE_ONCE(tl->acquired, 0);           =
 \
> >                         }),                                            =
 \
> >                         default:(void)0);                              =
 \
> >
>
> Oh I see, replacing the default: which "local_lock_t *:" which is the onl=
y
> other expected type, forces the compiler to actually tell me what's wrong=
:
>
> ./include/linux/local_lock_internal.h:174:26: error: =E2=80=98_Generic=E2=
=80=99 selector of
> type =E2=80=98__seg_gs local_lock_t *=E2=80=99 is not compatible with any=
 association

That explains why I and others couldn't repro it yesterday
no matter what we tried.
We're still on gcc-13 and this bit wasn't triggering:
#define CC_HAS_TYPEOF_UNQUAL (__GNUC__ >=3D 14)

Upgraded the compiler and can confirm everything.
