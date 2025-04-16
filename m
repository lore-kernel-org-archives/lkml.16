Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D258018C03F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789734; cv=none; b=aDjWMZULTUsdX3C6ytOZmiqPMCrb396bYoZvHjuSu2lz46xj6TGUvwcORBzdFOTNqdxwRiTwv2zggYUHNyp8rLGuJIPepR3af/Ak4m8SIBLBABhKoiNrnEcV73cLKZz9wo5DZTC8xYW9rJ5Gg4K54exPSjyYbjKl0R/MLmLuB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789734; c=relaxed/simple;
	bh=iVqagJr9aJ+HclUicbnRR1i4oxRuH6YtLWi3eX2VXC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFdW4geQsh0qXl7suJ4jsPr86Ctfiio9nOyucVjACDGQc8c3SlDP2kiAVHDQgrxWauVDztUDXqkwtSwnpK5eiR71g+HJXyxW48fSUWQ7r8s/7RPoTukBCieECPFHHrPdjqhHJnmAt8wFi0wJF6SUZ1shyJSOw+tJIROGlS/gK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyASfKfD; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyASfKfD"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so481484241.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744789731; x=1745394531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyV7NSNEAVoyLMhl/ZYfvyA50ZgGTsXuVFPalj5U1c8=;
        b=LyASfKfD2nu3Ca1IU7pQ9kfew5IWcFq0IMzP6sAyM9OibHWz+lESAnSn1m7GJcFBaJ
         aPJcOWlBRRoLLYoexIgKMyZLXBu7+rIklqGKikHko21qWoSBc35wH7LG726ymanMenMs
         Unwt8e9TOvG9YuC05NbePaBoeN0a5H7+uC7sv5QAyDBAeeUekJ5MY6Z9zgcd3vV9QA8c
         xexBVg4aBgfFbDnXIXXx5ndQVkGqvQqzPcnqemSjO0xBt+CrseJMuoEGI6seL1aFWxVQ
         wGmHZm/b/KAEt8qGhjPnejKt4xbgNY+6gY6d/PU3HsJGG7HtouFXe4W+Nx8+jMXNVmZD
         lSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789731; x=1745394531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyV7NSNEAVoyLMhl/ZYfvyA50ZgGTsXuVFPalj5U1c8=;
        b=v5WO672ay1CmWgqus0qEv8camL8GqoeTvhOy0E7x6X/4+A1DA6TeRrskW0Y5qSPnLI
         Do39sStUzWZHkC+mobC+gqTUNzaa7iVrKJ+kABc0Zwxv6fOzPI1V6n36aA3tmBvb3LTz
         Lbsq2ruVPa61Y4fFDW+geW+7OH+tIL2WlOsN7Y0YDM1x0m9/XBjhzd+sPBgt5gUPh4/L
         AudjLSs2mhQcLPvYDl9aRtJh2LJG+0seh8qUpuJWdaltO4CkovmbnTxoFPr6vbm4YBz9
         SZ8owz/B3BewAAFxjBKEq4m1Jmzo4gUvh4eMsinUH+O48IIJ+cvJGU+8cn4aQdxShETB
         VGvg==
X-Forwarded-Encrypted: i=1; AJvYcCUgelhZwckcMDmfeYtYk4Ccogw3kMZKkasLpazsNnMiT8/JajAavTFoeZJ/ZlGSVt26XzpPzw1A2Ipvx8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR3+aqXmiSc8ZBdrsDge+/T59mlnHkojV4gt+ADu5kAhVKgtDN
	W0Lo39RcGiaxZggtaK9psc7C7AFjuBS/qJpM+4CVfrBlYX6iwfaw974krGVA3kxLmakDPEL2Kul
	+PlHOmcM+HSSyI+5Dnd3uMKhJHB0=
X-Gm-Gg: ASbGncvc/jaOVOIdxRzrElsQFJWgO7skTHK0AA+XWyF9JQ2GtjQjRq+coHICzEnDvv5
	r1T+20WNty14hVkKVsN0f02dBeO5NOLunAlhBOgG7AgRwGanpBTjpc/jhd7D7k3Z2+8QcUI7nCC
	diCIVKq3FOMIUCSwSQaEra7w==
X-Google-Smtp-Source: AGHT+IHJV5MIND7VjTur2PvUkLR7tbC0UWfpgC5/T6rBoCvXM9oiPQLPWmmLQgIyQdB+KzSfS0m8wEw7Rnf5i7m4woI=
X-Received: by 2002:a05:6102:3101:b0:4c3:346:29ef with SMTP id
 ada2fe7eead31-4cb597d1cf8mr222369137.11.1744789731571; Wed, 16 Apr 2025
 00:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412085852.48524-1-21cnbao@gmail.com> <F7DF65A3-ABF1-43C0-B4F2-DC0EBB2B1668@nvidia.com>
In-Reply-To: <F7DF65A3-ABF1-43C0-B4F2-DC0EBB2B1668@nvidia.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 16 Apr 2025 15:48:40 +0800
X-Gm-Features: ATxdqUEBfwrh1CuxGybuxs6d2Tz8XKF3y1m1Q4prVjmiNEfg70ItcMYK-EHHnjA
Message-ID: <CAGsJ_4yRq6iBPpWLdbcknGLGUCEBDsc05rAeMuK8HRAwnpg2Zg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying processes
To: Zi Yan <ziy@nvidia.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>, 
	Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 12:31=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 12 Apr 2025, at 4:58, Barry Song wrote:
>
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Promoting exclusive file folios of a dying process is unnecessary and
> > harmful. For example, while Firefox is killed and LibreOffice is
> > launched, activating Firefox's young file-backed folios makes it
> > harder to reclaim memory that LibreOffice doesn't use at all.
> >
> > An exiting process is unlikely to be restarted right away=E2=80=94it's
> > either terminated by the user or killed by the OOM handler.
>
> The proposal looks reasonable to me. Do you have any performance number
> about the improvement?

Tangquan ran the test on Android phones and saw 3% improvement on
refault/thrashing things:
                                                   w/o patch           w/pa=
tch
workingset_refault_anon    2215933          2146602            3.13%
workingset_refault_file       9859208          9646518             2.16%
pswpin                                2411086          2337790             =
3.04%
pswpout                              6482838          6264865             3=
.36%

A further demotion of exclusive file folios can improvement more, but
might be controversial. it could be a separate patch later.

>
> >
> > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >  mm/huge_memory.c |  4 ++--
> >  mm/internal.h    | 19 +++++++++++++++++++
> >  mm/memory.c      |  9 ++++++++-
> >  3 files changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index e97a97586478..05b83d2fcbb6 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -2264,8 +2264,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct v=
m_area_struct *vma,
> >                        * Use flush_needed to indicate whether the PMD e=
ntry
> >                        * is present, instead of checking pmd_present() =
again.
> >                        */
> > -                     if (flush_needed && pmd_young(orig_pmd) &&
> > -                         likely(vma_has_recency(vma)))
> > +                     if (!exclusive_folio_of_dying_process(folio, vma)=
 && flush_needed &&
> > +                         pmd_young(orig_pmd) && likely(vma_has_recency=
(vma)))
> >                               folio_mark_accessed(folio);
> >               }
> >
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 4e0ea83aaf1c..666de96a293d 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -11,6 +11,7 @@
> >  #include <linux/khugepaged.h>
> >  #include <linux/mm.h>
> >  #include <linux/mm_inline.h>
> > +#include <linux/oom.h>
> >  #include <linux/pagemap.h>
> >  #include <linux/pagewalk.h>
> >  #include <linux/rmap.h>
> > @@ -130,6 +131,24 @@ static inline int folio_nr_pages_mapped(const stru=
ct folio *folio)
> >       return atomic_read(&folio->_nr_pages_mapped) & FOLIO_PAGES_MAPPED=
;
> >  }
> >
> > +/*
> > + * Return true if a folio is exclusive and belongs to an exiting or
> > + * oom-reaped process; otherwise, return false.
> > + */
> > +static inline bool exclusive_folio_of_dying_process(struct folio *foli=
o,
> > +             struct vm_area_struct *vma)
> > +{
> > +     if (folio_maybe_mapped_shared(folio))
> > +             return false;
> > +
> > +     if (!atomic_read(&vma->vm_mm->mm_users))
> > +             return true;
> > +     if (check_stable_address_space(vma->vm_mm))
> > +             return true;
> > +
> > +     return false;
> > +}
> > +
> >  /*
> >   * Retrieve the first entry of a folio based on a provided entry withi=
n the
> >   * folio. We cannot rely on folio->swap as there is no guarantee that =
it has
> > diff --git a/mm/memory.c b/mm/memory.c
> > index b9e8443aaa86..cab69275e473 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1515,7 +1515,14 @@ static __always_inline void zap_present_folio_pt=
es(struct mmu_gather *tlb,
> >                               *force_flush =3D true;
> >                       }
> >               }
> > -             if (pte_young(ptent) && likely(vma_has_recency(vma)))
> > +
> > +             /*
> > +              * Skip marking exclusive file folios as accessed for pro=
cesses that are
> > +              * exiting or have been reaped due to OOM. This prevents =
unnecessary
> > +              * promotion of folios that won't benefit the new process=
 being launched.
> > +              */
> > +             if (!exclusive_folio_of_dying_process(folio, vma) && pte_=
young(ptent) &&
> > +                             likely(vma_has_recency(vma)))
> >                       folio_mark_accessed(folio);
> >               rss[mm_counter(folio)] -=3D nr;
> >       } else {
> > --
> > 2.39.3 (Apple Git-146)
>
>
> --
> Best Regards,
> Yan, Zi

Thanks
Barry
