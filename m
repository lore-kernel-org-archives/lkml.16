Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377388C0E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744961233; cv=none; b=ggPbIYFQTsGsHDv0FwDekS9CKsZmmIFI9BwqRRJmaIdllFq1HMNHZzVYYGxE9uKgaOmdp9slKZam93Ux8O7fV9QIQrg6onlliArn3TW6j3YLwecV3HUs5j9hdVe9V0bg5EgrQrJ52a/i01q3I8YJsjcG4APAj+f8d81U7cu3KJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744961233; c=relaxed/simple;
	bh=z5iyiv40X8PeWYFHYVA/ERYJYqfeZUoKd/FliDuVOf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pr0AcKVSysI6JaquYkbEdd3Q+zBkbPYBQmXrpTwACOqm2GILxBNoEQ2jkggsYyuDkB//z2U2X/K6N7vW7ZOIFPXCPHbYIn2ybhYa53Umfvannpy8wS2BrBVQfx25bSPcCK0Wah3nD07g08oR9UC8iNZKAd9c1PnEc+0BHoP7uWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoE4YAhZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoE4YAhZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso2727008a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744961229; x=1745566029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ur1I8SSe3sqk/ILCSVotezrbGQVvGr3AU3XeIQQrGcA=;
        b=IoE4YAhZz2yf2FzUoBSQfvXv/MByn4jPfZ9sgjnG9afm3vXcH3647ssV8FnUOC4IBm
         xt1skunXua5erAouQ2ts9AObJQVB7KRbUtgGbuOBjiNTuH2xExMaXpZ4yfwrqY53eTf7
         kAcjFhGb7L5MF01REj5CmI2Wzv8ULPFZ8zi47C1l4NHvLmQbPVOpiiHHZ4IMEJJV8JWP
         SeqUrnb2JULgTZlO157wsUeVpJmJQG2k9DEn2KXHYKHAj5nd3bu19YXcklei68BjUPOl
         4ssO26y4sbMWTcQrzD1YS4y8XSUNkvZ0UJolaPNxGrDGt1cmWy6RtG0RSBdcGu/HOKSL
         S6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744961229; x=1745566029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ur1I8SSe3sqk/ILCSVotezrbGQVvGr3AU3XeIQQrGcA=;
        b=kgOCoj3mtVyqrhYqI+8wugDJ8xO01BR1Tjl8qt//gKtQRieQL+UQGQ18C7Wpj+Vi57
         6sqrp5xeo+0JQc5oORfNqxB0GjvDwoxU/9bZXhYKTrelnEs/brzU3dq9IjemMFrh60bg
         GafeWqVE3s0StxQAwIGPdlRTOSAC9dEfIqz5NG5lsSEBhfZYHdeP5QiNkOTBeExvGt3z
         mNk31orkHgEtCvbKgWmnJfgzDruK2IiRmDO1kWdFMx6bNZu9MAQTvRs8BJpMKKnJkhxH
         CBv8ugoULiPB50A5Y5Ezkip0MetjU3Ic70Z5JmhFNK3zAwgjEti5M24jk8lYmVzuPclX
         oD/w==
X-Forwarded-Encrypted: i=1; AJvYcCVHhuH8teYBb8UKjL2W0onOl0bh2u48RYYJc+eKdlN8XazRA6YYbDwqx3t0JKQW4XItWgN3dieF5suEGHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHXDvZRps/+VOqmgfgHxFI2u431G3s3PcTS8AopirX65fcS9z
	96np8S9NqOEIO8VHdJh07bjR9eCIl3Vtyk1zk5CmF/NaLcnti8RTr2G1hj/Z7mHvbkSXSU6vFMr
	F3t+s7Zi1YszrTBI53txQxT7DoBU=
X-Gm-Gg: ASbGnctb7/hZTkdZX457ZazpJPFql3QjGTTm1iT4Rz70YnCDq3VqMy6Izdh7ilJMF2O
	2L6BimbW5hpb2nYdj1Ue+q0bvnCFsgoWA52xr5XdJ6Wf3kMLznOJHwQfL5NXXosgf0YLCd3a9Yu
	70+au+pP85pa7zWQj0s8PFGgz9
X-Google-Smtp-Source: AGHT+IFypqS8ZLgIGdco7GWLrZEhryDxXpYox3JOsmUe5Fj2OMmtvGFHZPrtTGgWs7KGsalOPjaVbfsiaX1POHbpzQQ=
X-Received: by 2002:a05:6402:1ed1:b0:5ec:6feb:5742 with SMTP id
 4fb4d7f45d1cf-5f628593f03mr1230917a12.16.1744961229221; Fri, 18 Apr 2025
 00:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417124908.58543-1-ioworker0@gmail.com> <20250417150237.ba3bbb3f55f992c692932841@linux-foundation.org>
In-Reply-To: <20250417150237.ba3bbb3f55f992c692932841@linux-foundation.org>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 18 Apr 2025 15:26:32 +0800
X-Gm-Features: ATxdqUGK3j6TDCMeHYmQT5Dh8-Y6ClSXGCwhqTJFo19RKCQSHL4h3SrivClMaNQ
Message-ID: <CAK1f24nCWXgOonOpiJ0mEk+-rvGt4WN20yri+wi6-eMf3rf=4w@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for folio_test_large_maybe_mapped_shared()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Mingzhe Yang <mingzhe.yang@ly.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for taking the time to review!

On Fri, Apr 18, 2025 at 6:02=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 17 Apr 2025 20:49:08 +0800 Lance Yang <ioworker0@gmail.com> wrote=
:
>
> > Add a compile-time check to make sure folio_test_large_maybe_mapped_sha=
red()
> > is only used with CONFIG_MM_ID enabled, as it directly accesses the _mm=
_ids
> > field that only works under CONFIG_MM_ID.
> >
> > ...
> >
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct =
folio *folio)
> >
> >  static inline bool folio_test_large_maybe_mapped_shared(const struct f=
olio *folio)
> >  {
> > +     /* This function should never be called without CONFIG_MM_ID enab=
led. */
> > +     BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
> >       return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
> >  }
> >  #undef PF_ANY
>
> I don't get it.  Sounds like we're adding a compile-time check to check
> for a compilation error which would have happened anyway.
>
> If folio_test_large_maybe_mapped_shared() is only used with
> CONFIG_MM_ID enabled, then do
>
> #ifdef CONFIG_MM_ID
> static inline bool folio_test_large_maybe_mapped_shared(...)
> {
> }
> #endif
>
> ?

Hmm... we considered using '#ifdef CONFIG_MM_ID' for
folio_test_large_maybe_mapped_shared(),
but since this function should never be called without CONFIG_MM_ID
enabled, compile-time errors might be the way to go -- and a compile-time
check here does the trick ;)

>
> Or, as "_mm_ids field only works under CONFIG_MM_ID", make it
> not-even-present when !CONFIG_MM_ID?
>
> --- a/include/linux/mm_types.h~a
> +++ a/include/linux/mm_types.h
> @@ -438,7 +438,9 @@ struct folio {
>                                         mm_id_mapcount_t _mm_id_mapcount[=
2];
>                                         union {
>                                                 mm_id_t _mm_id[2];
> +#ifdef CONFIG_MM_ID
>                                                 unsigned long _mm_ids;
> +#endif
>                                         };
>         /* private: the union with struct page is transitional */
>                                 };
> _
>
> or
>
> --- a/include/linux/mm_types.h~a
> +++ a/include/linux/mm_types.h
> @@ -436,10 +436,12 @@ struct folio {
>                                         atomic_t _pincount;
>  #endif /* CONFIG_64BIT */
>                                         mm_id_mapcount_t _mm_id_mapcount[=
2];
> +#ifdef CONFIG_MM_ID
>                                         union {
>                                                 mm_id_t _mm_id[2];
>                                                 unsigned long _mm_ids;
>                                         };
> +#endif
>         /* private: the union with struct page is transitional */
>                                 };
>                                 unsigned long _usable_1[4];
> _
>
>
>
> I dunno, it sounds like something hasn't been fully thought through
> here.  It's hard to say because the changelog is unclear.  Perhaps
> start out by fully describing what problem the patch is addressing?
>

In patch #14[1], we rely on IS_ENABLED(CONFIG_MM_ID), so we need:
1) Some dummy functions
2) The _mm_ids field to remain present even when !CONFIG_MM_ID

This patch is intended to ensure that incorrect calls to
folio_test_large_maybe_mapped_shared()
are caught at compile-time.

[1] https://lore.kernel.org/linux-mm/20250303163014.1128035-15-david@redhat=
.com/

Thanks,
Lance
