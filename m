Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA31E32BD
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190640; cv=none; b=BCeeddTTDLAU5qDoy2JzN9V0Uv2gFCx5/+vo9mOExLnPvzpbDK0Hmamai9++iHox/x3ekm1+CJhZRvLMkkvjevuCT1DR4aZLYbybAP2ujiq292Y6u3+EkLLpViIko8VlKUfw+zT8KD2LunUQtWuouFvIiHXKUip7H9LhPhmU4As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190640; c=relaxed/simple;
	bh=ovi+GzfeToQ8hngRVjfkhuruo/I5b2tfj+ELyOgxyKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWtwsSo+WqJGvg82tAUCw8HbPDpLnJlMrguUFh0uaBzs+qmD8RXUnBa+IGejJdElDbGKy76Z5yQ/KPXuOdPsNdEd7/5w+IOOpAhrVAaeYyMG5bfdd5e0lK3M2w/a9H9E8hPPD0hruavS/qhcMny5/qdRi8pMIaaHQb8Ifgj/c5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=39G3vzpW; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="39G3vzpW"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467896541e1so73861cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190637; x=1738795437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV1NZrhmBoapAhga8suluhi2xpF68ROjpGqXcyJZnwg=;
        b=39G3vzpWUvXdG/4r56KsAUKyaOUY+KhZQUzA4Pmz5DrP5MmzRIUIvBqgt72xG5g5Fe
         dhvrIV/+l1C3cbbp/1BjJXw5m4jxyE6hC2FOPgADTApCyYw69dDlY1c8qqMUgRJlt5kX
         GF3CzCBrSk2zNtx772vewB8d8kq1HLfqRYhrUMozHdpL43FkbMKt7N5EuNCKcxE2sA9f
         6S73YCMGn4D6NF5iRo1LOZw8/mj/+bshypP52nVEC35eJeCocG/b4sbq2Dl8Wg4f2AkL
         o7VYFzRHaZ71jGHs/RDgUzYS28CuiCAlVQ6W5C/JqOBvn1wT53Xp6c6vHncpkTpX1azA
         hN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190637; x=1738795437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NV1NZrhmBoapAhga8suluhi2xpF68ROjpGqXcyJZnwg=;
        b=lclEmDHBg+B0miRMd+2WEmkf/2KTF39sZ1iynGuCUL9k9GW25fR0+DujsnoGjxvhM1
         QP6VkIHToi6arej8gS9mzuZAD08WbhVvKuKpKaLP3Sid3YCDvtgdC5hQSTn3AtQZikCk
         7Jf7QRNQPCo9GgM0pglsxsoJ7qAksyzkc1d/m+a752XozBt5++E1YBhZzP4t+xFJQE5L
         BmY7WptdmlhWTAsWyjk4D4pU4JTkQr/2Fu9mmjZ+0SWLqXOun7ZU6VIr/X7E/0zXzqSr
         cHlQUymmihxdRIQ4ULrCuA4jO9XqTHxudPGQ8HjHumB7f6MxxLCfvrX8hDeipvKa64UU
         22NA==
X-Forwarded-Encrypted: i=1; AJvYcCUzqfHpcodU43mHeIGaewEtIc6T6XJSOBXSgS8ble3ymWFi/oaA5DFElmTk0hE2qtK63xkzIY3d/HU6XLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3gLRg5U8b/pTa0T0kn90VkyX5lmPK/LejnPms+fb/STeBzd4P
	6sckArDXLNIQ+KdD9PGIJoiAm3XM9n5PPLctA5bPwL9/2mABhoezNMiRdndy/NUEKu+k9l9J4dB
	02/XRnC4CQtQGrISdAEpTonBvRiHS0q1EpPAB
X-Gm-Gg: ASbGnctq5NQn8M8h55GJ5zt118UIzC0OvFDUASUlcsCEnhdQL2Txm1DMstPw6CHRF2M
	2mbiTmW2yDfE4HgBVATVtEl/PRfF5N6OsaD1Nki4CLPDHDmXE8JMztAXRKhxgBmRTUD3zcg==
X-Google-Smtp-Source: AGHT+IG3T6DTF5v+oLGyYzoNXFHqkxY6CIsVLh/tMVZCk6tiToGciXyRwR194csL25uhdE9+C7DCdCNao23WVTOmM1s=
X-Received: by 2002:a05:622a:58c8:b0:467:84a1:df08 with SMTP id
 d75a77b69052e-46fdf6566f6mr267891cf.23.1738190636646; Wed, 29 Jan 2025
 14:43:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127232207.3888640-1-fvdl@google.com> <20250127232207.3888640-28-fvdl@google.com>
 <c961cc1e-897d-4b86-b123-b12a0c27f91a@csgroup.eu> <CAPTztWa8bL06fVDP-N3s1yqMLxFZfvDvVRpn5B5YZBJ3idru9Q@mail.gmail.com>
In-Reply-To: <CAPTztWa8bL06fVDP-N3s1yqMLxFZfvDvVRpn5B5YZBJ3idru9Q@mail.gmail.com>
From: Frank van der Linden <fvdl@google.com>
Date: Wed, 29 Jan 2025 14:43:45 -0800
X-Gm-Features: AWEUYZknBL0-ZlhTc29GRwr47Hak95j6j2l9UYyEKqqjLiuJyO254WkfZQumzac
Message-ID: <CAPTztWZV1+jmhKqiV-nLnjo4pbYmkNi2wWAVPc__M+rPGN0K=A@mail.gmail.com>
Subject: Re: [PATCH 27/27] mm/hugetlb: enable bootmem allocation from CMA areas
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 9:52=E2=80=AFAM Frank van der Linden <fvdl@google.c=
om> wrote:
>
> Hi Christophe, thanks for your comments. Replies inline below.
>
> On Tue, Jan 28, 2025 at 12:55=E2=80=AFAM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> >
> >
> > Le 28/01/2025 =C3=A0 00:22, Frank van der Linden a =C3=A9crit :
> > > If hugetlb_cma_only is enabled, we know that hugetlb pages
> > > can only be allocated from CMA. Now that there is an interface
> > > to do early reservations from a CMA area (returning memblock
> > > memory), it can be used to allocate hugetlb pages from CMA.
> > >
> > > This also allows for doing pre-HVO on these pages (if enabled).
> > >
> > > Make sure to initialize the page structures and associated data
> > > correctly. Create a flag to signal that a hugetlb page has been
> > > allocated from CMA to make things a little easier.
> > >
> > > Some configurations of powerpc have a special hugetlb bootmem
> > > allocator, so introduce a boolean arch_specific_huge_bootmem_alloc
> > > that returns true if such an allocator is present. In that case,
> > > CMA bootmem allocations can't be used, so check that function
> > > before trying.
> > >
> > > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Signed-off-by: Frank van der Linden <fvdl@google.com>
> > > ---
> > >   arch/powerpc/mm/hugetlbpage.c |   5 ++
> > >   include/linux/hugetlb.h       |   7 ++
> > >   mm/hugetlb.c                  | 135 +++++++++++++++++++++++++------=
---
> > >   3 files changed, 114 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbp=
age.c
> > > index d3c1b749dcfc..e53e4b4c8ef6 100644
> > > --- a/arch/powerpc/mm/hugetlbpage.c
> > > +++ b/arch/powerpc/mm/hugetlbpage.c
> > > @@ -121,6 +121,11 @@ bool __init hugetlb_node_alloc_supported(void)
> > >   {
> > >       return false;
> > >   }
> > > +
> > > +bool __init arch_specific_huge_bootmem_alloc(struct hstate *h)
> > > +{
> > > +     return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled=
());
> > > +}
> > >   #endif
> > >
> > >
> > > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > > index 2512463bca49..bca3052fb175 100644
> > > --- a/include/linux/hugetlb.h
> > > +++ b/include/linux/hugetlb.h
> > > @@ -591,6 +591,7 @@ enum hugetlb_page_flags {
> > >       HPG_freed,
> > >       HPG_vmemmap_optimized,
> > >       HPG_raw_hwp_unreliable,
> > > +     HPG_cma,
> > >       __NR_HPAGEFLAGS,
> > >   };
> > >
> > > @@ -650,6 +651,7 @@ HPAGEFLAG(Temporary, temporary)
> > >   HPAGEFLAG(Freed, freed)
> > >   HPAGEFLAG(VmemmapOptimized, vmemmap_optimized)
> > >   HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
> > > +HPAGEFLAG(Cma, cma)
> > >
> > >   #ifdef CONFIG_HUGETLB_PAGE
> > >
> > > @@ -678,14 +680,18 @@ struct hstate {
> > >       char name[HSTATE_NAME_LEN];
> > >   };
> > >
> > > +struct cma;
> > > +
> > >   struct huge_bootmem_page {
> > >       struct list_head list;
> > >       struct hstate *hstate;
> > >       unsigned long flags;
> > > +     struct cma *cma;
> > >   };
> > >
> > >   #define HUGE_BOOTMEM_HVO            0x0001
> > >   #define HUGE_BOOTMEM_ZONES_VALID    0x0002
> > > +#define HUGE_BOOTMEM_CMA             0x0004
> > >
> > >   bool hugetlb_bootmem_page_zones_valid(int nid, struct huge_bootmem_=
page *m);
> > >
> > > @@ -711,6 +717,7 @@ bool __init hugetlb_node_alloc_supported(void);
> > >
> > >   void __init hugetlb_add_hstate(unsigned order);
> > >   bool __init arch_hugetlb_valid_size(unsigned long size);
> > > +bool __init arch_specific_huge_bootmem_alloc(struct hstate *h);
> >
> > Why adding 'specific' in the name ? Prefixing a function name with arch=
_
> > is usually enough to denote an architecture specific function.
>
> True, yes. That should probably be arch_has_huge_bootmem_alloc, I will
> change that.
>
> >
> > >   struct hstate *size_to_hstate(unsigned long size);
> > >
> > >   #ifndef HUGE_MAX_HSTATE
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index 32ebde9039e2..183e8d0c2fb4 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -61,7 +61,7 @@ static struct cma *hugetlb_cma[MAX_NUMNODES];
> > >   static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initd=
ata;
> > >   #endif
> > >   static bool hugetlb_cma_only;
> > > -static unsigned long hugetlb_cma_size __initdata;
> > > +static unsigned long hugetlb_cma_size;
> >
> > Why remove __initdata ? As far as I can see it is used only in
> > hugetlb_early_cma() and hugetlb_hstate_alloc_pages() which are __init
> > functions.
>
> hugetlb_cma_size is now used in alloc_gigantic_folio(), which is not
> an __init function. However, you got me thinking: since
> hugetlb_cma_only is only effective when hugetlb_cma_size !=3D 0, I can
> just reset hugetlb_cma_only to false if hugetlb_cma_size =3D=3D 0 after
> parsing the commandline arguments. This will revert hugetlb_cma_size
> to __initdata, and simplifies things a bit. I'll make that change in
> v2.
> >
> > >
> > >   __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
> > >   __initdata unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE];
> > > @@ -132,8 +132,10 @@ static void hugetlb_free_folio(struct folio *fol=
io)
> > >   #ifdef CONFIG_CMA
> > >       int nid =3D folio_nid(folio);
> > >
> > > -     if (cma_free_folio(hugetlb_cma[nid], folio))
> > > +     if (folio_test_hugetlb_cma(folio)) {
> > > +             WARN_ON(!cma_free_folio(hugetlb_cma[nid], folio));
> >
> > Is that WARN_ON() needed ? See
> > https://docs.kernel.org/process/coding-style.html#do-not-crash-the-kern=
el
>
> Not strictly, I suppose, but if there is a CMA-allocated hugetlb
> folio, and cma_free fails, that would be a condition worthy of a
> warning, as the flag somehow got corrupted or there is an internal CMA
> error.  How about WARN_ON_ONCE?
>
> >
> >
> > >               return;
> > > +     }
> > >   #endif
> > >       folio_put(folio);
> > >   }
> > > @@ -1509,6 +1511,9 @@ static struct folio *alloc_gigantic_folio(struc=
t hstate *h, gfp_t gfp_mask,
> > >                                       break;
> > >                       }
> > >               }
> > > +
> > > +             if (folio)
> > > +                     folio_set_hugetlb_cma(folio);
> > >       }
> > >   #endif
> > >       if (!folio) {
> > > @@ -3175,6 +3180,63 @@ struct folio *alloc_hugetlb_folio(struct vm_ar=
ea_struct *vma,
> > >       return ERR_PTR(-ENOSPC);
> > >   }
> > >
> > > +/*
> > > + * Some architectures do their own bootmem allocation, so they can't=
 use
> > > + * early CMA allocation. So, allow for this function to be redefined=
.
> > > + */
> > > +bool __init __attribute((weak))
> >
> > Can't you use __weak ?
> >
> > By the way, do we really need a weak function here ? Can't it be a
> > static inline helper that gets waived by a macro defined by the arch,
> > something like:
> >
> > #ifndef arch_huge_bootmem_alloc
> > static inline arch_huge_bootmem_alloc(struct hstate *h)
> > {
> >         return false;
> > }
> > #endif
> >
> > Then powerpc does:
> >
> > #define arch_huge_bootmem_alloc arch_huge_bootmem_alloc
> > static inline arch_huge_bootmem_alloc(struct hstate *h)
> > {
> >         return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled=
());
> > }
> >
>
> Fair enough, yeah. I used a weak symbol because that was already used
> for powerpc with alloc_bootmem_huge_page(), but I can change this one.
>
> >
> > But why is struct hstate *h parameter needed ? Seems like noone uses it=
.
>
> Correct - I merely extrapolated a bit and thought "well, architectures
> might have bootmem hugetlb allocators that only deal with certain
> sizes". But then again, like you say, there is currently no need for
> it. I'll remove the argument.
>
> >
> > > +arch_specific_huge_bootmem_alloc(struct hstate *h)
> > > +{
> > > +     return false;
> > > +}
> > > +
> > > +static bool __init hugetlb_early_cma(struct hstate *h)
> > > +{
> > > +     if (arch_specific_huge_bootmem_alloc(h))
> > > +             return false;
> > > +
> > > +     return (hstate_is_gigantic(h) && hugetlb_cma_size && hugetlb_cm=
a_only);
> > > +}
> > > +
> > > +static __init void *alloc_bootmem(struct hstate *h, int nid)
> > > +{
> > > +     struct huge_bootmem_page *m;
> > > +     unsigned long flags;
> > > +     struct cma *cma;
> > > +
> > > +#ifdef CONFIG_CMA
> >
> >   #ifdefs in C files should be avoided, see
> > https://docs.kernel.org/process/coding-style.html#conditional-compilati=
on
> >
> > > +     if (hugetlb_early_cma(h)) {
> > > +             flags =3D HUGE_BOOTMEM_CMA;
> > > +             cma =3D hugetlb_cma[nid];
> > > +             m =3D cma_reserve_early(cma, huge_page_size(h));
> > > +     } else
> > > +#endif
> >
> > This kind of if/else construct in uggly, should be avoided.
> >
>
> I found this ifdef hard to avoid, sadly, I tried various ways to avoid
> it (If (IS_ENABLED(CONFIG_CMA), etc), but came up short. I'll have
> another look for v2, but short of trying to split off all CMA-related
> code in to a different file, which would definitely be out of scope
> here, it might not end up being better.

I ended up moving the hugetlb_cma code to its own file anyway, which
is a new patch at the end of the v2 series I just sent.

- Frank
