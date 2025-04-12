Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF754F81
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744449320; cv=none; b=nvDxuZX+whydDaSpTSkffmr/d3iSyhDXMPXNmfei2TZD9mNxDHl41e7Z89DWdbgAAY/czHWljfS3f9aTXBmIO03491ENyILt8fZjR7pGTAj/zWC5md10emYbkQGddABHx6M3q0Ts69EsJcGrFlYbgbXUUdCXhT9LGAP1VYM+4Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744449320; c=relaxed/simple;
	bh=ofhA1sVhNkZBmeSVit0ptFCY906BqKaILguQvfyVaRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9BYcZsa3KOfAI17p+IE6VU+S8Gvk/A0AHTvt5JOGOlG5Eh3kdqiwqojyvfcDEIBEsMAzutEDoxtdCfyAX3kDB1TQkpM5GIT2ofOYeMUCwCWj0aXv4FPT0Gm8Eos0CgugLh4QfXvX59fQs33ffkYsNljmmtu+lw3wiH3rhilgPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nn9MxXm1; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nn9MxXm1"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso1097797241.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744449317; x=1745054117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbIUHCmcAX0DkYjFh/o6M5S/0HjNuCssHAp5/9byzKQ=;
        b=Nn9MxXm1Qkn55hVQGeEKO7BgJzElxjWB/L/H1U0qyeQoRhMZNHOZBZQiJ2kmwoyTgo
         iO2fZJG6un71g1cZXv9f3XSr45GHOy/PRHtQKOrv2LPwLI7aMKCjwKMTBUa9NiLRPEEH
         7r5VMNVD/yqyF0rV5hRsSr6ptyTeBWB6eioE2G+jfMFdruzGi+QlH5MlzZrHghri7GrP
         kLFWPvqchHD4X3RzSurgjf1Xgb2eQqh41d50KIlzN5sl+2n9bSuulSEz+etlG4hUMIi4
         b/9ZdYU2d58gAdE4FKGE+vPAaxes86AAOpB91PKPrI5TUczAW87wregv+74xwoVE18A4
         cbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744449317; x=1745054117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbIUHCmcAX0DkYjFh/o6M5S/0HjNuCssHAp5/9byzKQ=;
        b=p5Rv92t95iXE5nOWQGsYEB2DpvD5va3/Dvx/FaKlnKPT7MSnOgtBKJ/V7qZvrUnjAn
         Nf9UJ+V0a4R34eMyYMdrqft0se12dOt2ABjuBLsljE32L5jFvYRON1KTMdeX7LOU7cKM
         EPnq57OWBaf9vsijy+O1isrgUcLf+xh4L0y+dxXdjmwsyvV2xs6Nj8g1MXRwx9t3ilV8
         YVnoUXlF3lKK78S3ZQCWLwrHFG6CKmBMpY5SVex/VADt9IbCauqoL1+B0HbpbZKLNbRb
         Ijtqsn8nX57ZnzKjlxlPvIQcQxGQ6yYZUyHnhXfkxrYNW1Nnp+H5v0ZkTT7CjXIjyMvc
         9+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/GgqQXQ5vpxxERdjKzJuI4UZwtYpgaDO1uwjxD2wmsTzqJOKJ6RJhg7B00bK++KxJo3tPcszK+n5Hsa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAv3dQuGSJjD3nA7n+OF1RoeS0qajV9Svg6u+0IF732R4n84pX
	1KEjWydwhm5FIX8BVjZ5lSjLhNKzxalNm+jF5wKuKPMKda4rzWKDD8wyC4I9A61HoSReyLMIO1Y
	5AsqDXDCmaH+R0IU5ZhAeTD9LHCz/tQGyrV4=
X-Gm-Gg: ASbGncvl6WMR5ByAdu0ZhOWBkNizU5y+m1dihE2gtml28IB4NbuG2nQmsNJ/VQyI+XF
	M3o35KcV7n8P1hXj95TSarlLpV3/Pr1CSkI36eOT1/UBWdJ4kgC+pSpxABp9zrpC7a6KWm33Rx3
	gvgpnDktKoEu8TLC2+qLHNBA==
X-Google-Smtp-Source: AGHT+IEBQGFsZi7n8KNE2IfV+nuOxMHsAwhATBG8kEn0jBgAbA7ZVcCE2F06V2SZhSD8AWnbzwk/8bz8M/Moca6BKyo=
X-Received: by 2002:a05:6102:5046:b0:4c1:9439:f70 with SMTP id
 ada2fe7eead31-4c9e4ee6672mr3764722137.6.1744449316860; Sat, 12 Apr 2025
 02:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2d42decac5194c2c8d897b0424f0dcf3@honor.com> <Z_fYsyEA9hSEOoxp@kernel.org>
 <CAGsJ_4wACEvWe-Fcx9fShkF8okEVb3srGDVCn0v0QjALq7nneg@mail.gmail.com> <bdf6988006d546d498ccb2b7c14c6fe0@honor.com>
In-Reply-To: <bdf6988006d546d498ccb2b7c14c6fe0@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 12 Apr 2025 21:15:05 +1200
X-Gm-Features: ATxdqUFW6diTcCQvnjYzGU35F1q8ZAKLmhonTwYVQRoLOohz_odZsQebh12L9R4
Message-ID: <CAGsJ_4xDc_5q8dBYVq-Ga0iKJD9pTQdYSHrKw8R=1RHNb4+r7Q@mail.gmail.com>
Subject: Re: [PATCH] mm: simplify zone_idx()
To: gaoxu <gaoxu2@honor.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"surenb@google.com" <surenb@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yipengxiang <yipengxiang@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 8:34=E2=80=AFPM gaoxu <gaoxu2@honor.com> wrote:
>
> >
> > On Fri, Apr 11, 2025 at 2:42=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Apr 10, 2025 at 12:03:00PM +0000, gaoxu wrote:
> > > > store zone_idx directly in struct zone to simplify and optimize zon=
e_idx()
> > >
> > > Do you see an actual speed up somewhere?
> Almost negligible. my simple code tests showed the patch provides an aver=
age improvement of ~0.02%.
> Thus, in the Android 15-6.6 kernel, I confidently retained the original z=
one_idx function.
> (https://android-review.googlesource.com/c/kernel/common/+/3578322/2/mm/p=
age_alloc.c#770)
>
> This patch only eliminates 2-3 assembly instructions, making it challengi=
ng to
> observe measurable performance benefits.
> However, since the zone struct includes CACHELINE_PADDING (reserving unus=
ed space),
> adding a new member variable does not alter the size of zone. This makes =
the patch
> effectively zero-cost while achieving a cleaner implementation of zone_id=
x.

The struct zone contains many CONFIG_ options to include or exclude
certain fields.
If we're confident that our new zone_idx doesn't increase cacheline
usage for all those
cases, this seems like a worthwhile cleanup. Have you checked the numbers?

> >
> > +1. Curious if there's data indicating zone_idx is a hot path.
> There are several functions in the memory management code that are freque=
ntly
> executed and will call zone_idx:
> rmqueue()->wakeup_kswapd()->zone_idx()
> alloc_pages_bulk_noprof()->__count_zid_vm_events()->zone_idx()
>
> The patch (https://lore.kernel.org/all/20240229183436.4110845-2-yuzhao@go=
ogle.com/)
> will add new hotspot paths, with the details as follows:
> __zone_watermark_ok()->zone_is_suitable()->zone_idx()
> zone_watermark_fast()->zone_is_suitable()->zone_idx()
> get_page_from_freelist()->zone_is_suitable()->zone_idx()
> __free_one_page()->zone_max_order()->zone_idx()
>
> Although The patch (https://lore.kernel.org/all/20240229183436.4110845-2-=
yuzhao@google.com/)
> has not yet merged into the Linux mainline; it is already included in And=
roid 15-6.6.
> >
>
> > >
> > > > Signed-off-by: gao xu <gaoxu2@honor.com>
> > > > ---
> > > >  include/linux/mmzone.h | 3 ++-
> > > >  mm/mm_init.c           | 1 +
> > > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > > > index 4c95fcc9e..7b14f577d 100644
> > > > --- a/include/linux/mmzone.h
> > > > +++ b/include/linux/mmzone.h
> > > > @@ -941,6 +941,7 @@ struct zone {
> > > >  #endif
> > > >
> > > >       const char              *name;
> > > > +     enum zone_type  zone_idx;
> > > >
> > > >  #ifdef CONFIG_MEMORY_ISOLATION
> > > >       /*
> > > > @@ -1536,7 +1537,7 @@ static inline int local_memory_node(int node_=
id)
> > { return node_id; };
> > > >  /*
> > > >   * zone_idx() returns 0 for the ZONE_DMA zone, 1 for the ZONE_NORM=
AL
> > zone, etc.
> > > >   */
> > > > -#define zone_idx(zone)               ((zone) -
> > (zone)->zone_pgdat->node_zones)
> > > > +#define zone_idx(zone)               ((zone)->zone_idx)
> > > >
> > > >  #ifdef CONFIG_ZONE_DEVICE
> > > >  static inline bool zone_is_zone_device(struct zone *zone)
> > > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > > index 9659689b8..a7f7264f1 100644
> > > > --- a/mm/mm_init.c
> > > > +++ b/mm/mm_init.c
> > > > @@ -1425,6 +1425,7 @@ static void __meminit zone_init_internals(str=
uct
> > zone *zone, enum zone_type idx,
> > > >       atomic_long_set(&zone->managed_pages, remaining_pages);
> > > >       zone_set_nid(zone, nid);
> > > >       zone->name =3D zone_names[idx];
> > > > +     zone->zone_idx =3D idx;
> > > >       zone->zone_pgdat =3D NODE_DATA(nid);
> > > >       spin_lock_init(&zone->lock);
> > > >       zone_seqlock_init(zone);
> > > > --
> > > > 2.17.1
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
> >

Thanks
Barry
