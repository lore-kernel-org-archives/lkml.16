Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B832A18EFD4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330280; cv=none; b=CF4mcFKJeWM1CAzZS9CzGucuYgMz7wt9YPlHSxFRmmQr2U4xGvmWKkJ7fOcEUFr8ZxnRZcPnbDjdtrLF2uKyAyZoSEfsXfdhp3Y2XmeE307Hhd/RhaNnhJWteyNxAR/k0MAFjmIVMGNOSGsvf0cuKmI6UkSWPFMOvRs0EL9hhvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330280; c=relaxed/simple;
	bh=ZXk1wLam2oUcrrFv6359PEpcsC9uGdSoZxQ4ves0j9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsXqInLsr0Lt2SRPEwz0NSuGlrd4ZljHpftxQCjrN9WBWqMT2BAPxCGOZoUMZ8h+FR8lOs2T/VWI6nrzdpNABuo5AWnkU95Z7afIxMxrx/62VrNqictrJamSmfOtX1FgDSCnbu6ob9OdR4pK8Sa7SZPbHmxtXbzPd65zeyWDh80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vp6b0if1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vp6b0if1"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10594812so639121e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750330275; x=1750935075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ua1gNCTgzdG0JQCc5w/KwYLgFMFIgL+/dOz36UNSltQ=;
        b=Vp6b0if12fLXYaKOoiu+A0fzDxGYG4r2MoVCnQ5tGSvgYot0Kd0+H0k9X/mixMnNqt
         RMLb7am50q0WhsUkljhrEvgSOjyxE1/fcY4ACriax7i7YjURMvJCwpCYIzL55EBAkS5/
         4muQZKHbCKpjs9SKR9OXrZM9FKQhCeY3JkyiP5bvQYQI7PLDJgiXCDCrUreteUmmAX/E
         OndzlCarhncpIBvY22HOKiNq9c5MXeugUC5TlaHckEDupQiWqK+PWsM9Rw1N+LdNuf/p
         UIJHrlgV/I7xPEEIy0j1hS4/K08Mur1l6+H9REIwYNR+78+wNv4VYC5ve5CutMMUVFyg
         Tvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750330275; x=1750935075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ua1gNCTgzdG0JQCc5w/KwYLgFMFIgL+/dOz36UNSltQ=;
        b=ojFNLnYNXJ/eiNuhNSR0lSFzORx0tkVd9znVAo3zlpQKw63jtcsQrflZQyCbFJcS62
         M65Kthlo0K0OKpIZOfMXl69DQ/dx2pq5dTo21Wi5zcsx6Harr3XyAcfvz8jbOPnz52mM
         h3gROSAyoScoYNTHE+xC/3hPDf89YEqGbZ0CpO1o5yni6PQBcxpwCjnPRbkn3PkxfxNn
         COgYbYo5HWMXdIpnCTLzD/KwZPHBaS439tRBU1CKHovUazwZd7J/pBzsxxMWmpDPyBIW
         KnfH0O28RlOUyO9gr4JSZZYj+98xtqsSN1gzwdy3jy9Reck7XGIm5fHRFVxWzLMGxu6r
         zGyg==
X-Forwarded-Encrypted: i=1; AJvYcCVbQXZ5XNGWuqpWhbXpJy3vEqTn+AajtHSb7rVLEJYI/vV3rEI1XOOvmaCZ2jn9tHx3L5cXXxl5dctdx3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7PFATViR1XlmzjVPqSgOCWvL7k5C69N2Ck8sUYdRyc/QalO47
	g/Z14oXARnSsnNRGdt8SMqZLHvKWjbD3CMHJSwzLMMAToTIjvzk7dCRk9jMd06aijZc1J18kP3a
	TGBEUePtGaMLCPspS3IjDXloo4s8ravA=
X-Gm-Gg: ASbGnctLR35YvMI448Xis7FPuNmaDFcOf4s1SsNTSKJk6ZwFBBnWo9A5BL54eD7So5X
	75LzuFs8fQVSIjW+f9o1zJ3Qou3O8D6HTd79cCTbEjMIF0KxY8XA7oi9D5kTPx78Um5XT04due/
	NB5wrYKxl7Q0okY7HP42SemXgYAzyzv4lDgeUN1MdCd3U=
X-Google-Smtp-Source: AGHT+IEcC9XKcPnzRsY5fZPW3Ba8e9epTwtd1ys23Gr/nfk11GBISYJI4XGB9I5wHqOMxJD/Fy+KcBuc3y3mz9lMDKQ=
X-Received: by 2002:a05:651c:211f:b0:32b:4932:d646 with SMTP id
 38308e7fff4ca-32b4a2fefbamr58668761fa.13.1750330274439; Thu, 19 Jun 2025
 03:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-1-ryncsn@gmail.com> <20250514201729.48420-21-ryncsn@gmail.com>
 <aFPoiuJcBGl2E3sh@MiWiFi-R3L-srv>
In-Reply-To: <aFPoiuJcBGl2E3sh@MiWiFi-R3L-srv>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 19 Jun 2025 18:50:37 +0800
X-Gm-Features: AX0GCFtnks6A47_toiJoOLHTM8ALLAKwVOekmxWGslXx1lIUdiccswFRVBycyr8
Message-ID: <CAMgjq7AoJ+m64e2rWFFjU943D8kCZoR_e+Hd8LnT3bAy=gTT_w@mail.gmail.com>
Subject: Re: [PATCH 20/28] mm, swap: check swap table directly for checking cache
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Yosry Ahmed <yosryahmed@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Barry Song <baohua@kernel.org>, Kalesh Singh <kaleshsingh@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Tim Chen <tim.c.chen@linux.intel.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 6:38=E2=80=AFPM Baoquan He <bhe@redhat.com> wrote:
>
> On 05/15/25 at 04:17am, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Instead of looking at the swap map, check swap table directly to tell i=
f
> > a swap entry has cache. Prepare for remove SWAP_HAS_CACHE.
>
> But you actually check both the swap table entry and swap map entry in
> this patch, or do I miss anything?

Hi, Baoquan

>
> E.g
>
> if (!swap_count(si->swap_map[offset]) && swp_te_is_folio(swp_te))

Yes, the count info is still in the swap_map now, I'm only converting
the HAS_CACHE check to use swp_te_t here. We'll remove swap_map in
later patches and use the swp_te_t solely to get both info.

The reason some checks are added to check the swap_count is that:
Before this patch, `swap_map[offset] =3D=3D SWAP_HAS_CACHE` implies the
count is zero too. So if HAS_CACHE is moved to swp_te_t, we still need
to check the count separately. The overhead will be gone very soon in
a later patch.

>
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/memory.c     | 12 +++++------
> >  mm/swap.h       |  6 ++++++
> >  mm/swap_state.c | 11 ++++++++++
> >  mm/swapfile.c   | 54 +++++++++++++++++++++++--------------------------
> >  4 files changed, 48 insertions(+), 35 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index a70624a55aa2..a9a548575e72 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4314,15 +4314,15 @@ static struct folio *__alloc_swap_folio(struct =
vm_fault *vmf)
> >  }
> >
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > -static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
> > +static inline int non_swapcache_batch(swp_entry_t entry, unsigned int =
max_nr)
> >  {
> > -     struct swap_info_struct *si =3D swp_info(entry);
> > -     pgoff_t offset =3D swp_offset(entry);
> > -     int i;
> > +     unsigned int i;
> >
> >       for (i =3D 0; i < max_nr; i++) {
> > -             if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
> > -                     return i;
> > +             /* Page table lock pins the swap entries / swap device */
> > +             if (swap_cache_check_folio(entry))
> > +                     break;
> > +             entry.val++;
> >       }
> >
> >       return i;
> > diff --git a/mm/swap.h b/mm/swap.h
> > index 467996dafbae..2ae4624a0e48 100644
> > --- a/mm/swap.h
> > +++ b/mm/swap.h
> > @@ -186,6 +186,7 @@ static inline struct address_space *swap_address_sp=
ace(swp_entry_t entry)
> >  extern struct folio *swap_cache_get_folio(swp_entry_t entry);
> >  extern struct folio *swap_cache_add_folio(swp_entry_t entry, struct fo=
lio *folio,
> >                                         void **shadow, bool swapin);
> > +extern bool swap_cache_check_folio(swp_entry_t entry);
> >  extern void *swap_cache_get_shadow(swp_entry_t entry);
> >  /* Below helpers requires the caller to lock the swap cluster. */
> >  extern void __swap_cache_del_folio(swp_entry_t entry,
> > @@ -395,6 +396,11 @@ static inline void *swap_cache_get_shadow(swp_entr=
y_t end)
> >       return NULL;
> >  }
> >
> > +static inline bool swap_cache_check_folio(swp_entry_t entry)
> > +{
> > +     return false;
> > +}
> > +
> >  static inline unsigned int folio_swap_flags(struct folio *folio)
> >  {
> >       return 0;
> > diff --git a/mm/swap_state.c b/mm/swap_state.c
> > index c8bb16835612..ea6a1741db5c 100644
> > --- a/mm/swap_state.c
> > +++ b/mm/swap_state.c
> > @@ -266,6 +266,17 @@ struct folio *swap_cache_get_folio(swp_entry_t ent=
ry)
> >       return folio;
> >  }
> >
> > +/*
> > + * Check if a swap entry has folio cached, may return false positive.
> > + * Caller must hold a reference of the swap device or pin it in other =
ways.
> > + */
> > +bool swap_cache_check_folio(swp_entry_t entry)
> > +{
> > +     swp_te_t swp_te;
> > +     swp_te =3D __swap_table_get(swp_cluster(entry), swp_offset(entry)=
);
> > +     return swp_te_is_folio(swp_te);
> > +}
> > +
> >  /*
> >   * If we are the only user, then try to free up the swap cache.
> >   *
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index ef233466725e..0f2a499ff2c9 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -181,15 +181,19 @@ static long swap_usage_in_pages(struct swap_info_=
struct *si)
> >  #define TTRS_FULL            0x4
> >
> >  static bool swap_only_has_cache(struct swap_info_struct *si,
> > -                           unsigned long offset, int nr_pages)
> > +                             struct swap_cluster_info *ci,
> > +                             unsigned long offset, int nr_pages)
> >  {
> >       unsigned char *map =3D si->swap_map + offset;
> >       unsigned char *map_end =3D map + nr_pages;
> > +     swp_te_t entry;
> >
> >       do {
> > +             entry =3D __swap_table_get(ci, offset);
>
> entry is not used in swap_only_has_cache() in this patch.

Thanks, it used in a later patch so I must move it here accidently
during a rebase, will defer this change to later patch.

>
> >               VM_BUG_ON(!(*map & SWAP_HAS_CACHE));
> > -             if (*map !=3D SWAP_HAS_CACHE)
> > +             if (*map)
> >                       return false;
> > +             offset++;
> >       } while (++map < map_end);
> >
> >       return true;
> ......snip...
>
>
