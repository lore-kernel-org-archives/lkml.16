Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A71D555
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544639; cv=none; b=IRAu6EjE5lVXwiWO5rWGNuoJmkdytO7CoyQ897IHFhuhZC953ibHdidIxg1+qSjJooI+BW4Q2q6bkgQ2hE3N0chd2iA3kT9e7WnOigP2OZWkX8YMPtD4hvFvdnft9LgxUIHuAFJ06b8z9FDNFuY9TrKIQxOWenYJb2CL25L6/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544639; c=relaxed/simple;
	bh=xqGrlbTFhq1egR6caYh16yXSML1bLir8w4flS/bi8s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moARn5IEq0H8zX13dT/tXOBx5ns3R+no7gY/V4JjiHz0jUtAVe6BYlLLD+0StoltEKp8Ldl+tsM0eVygF7amljxE/PGhpgPQdwAEWd3MJtYaBy/BTFqLAZVobaRs0oXuQAbc9WdUJXPt8jU193rWUb8tOxYw3Pjfy1pK9gH+e7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMUAyKtk; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMUAyKtk"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e771347693so2936103137.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749544636; x=1750149436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnar+GeWh3IDeNTEo/pLO1+fWay4pzszrojH85IBaoA=;
        b=ZMUAyKtkcf7oQk8wOpD6Bs9pXpOJaGBz39RNPPhGtRikhEeMfQwztHlq+X1TB4XoZA
         +PrX9FDgBdSyYpUYcdXJG95fl6wJ3UjpB2KwtGqMHM0gI+3QXGkDLGm9vG91GOfEFyxD
         RE6ld9JkM/nidIckBGg7QypnUVpC529OcAykjs9G4yop2TCIFv7HHlFhg6hGLFqk4arc
         cxdHe/CMv4LVL3btS89l/s/ekK5GyJBIE0Vl5ydsa8etvfLLBZRAjjj810t68WQT0+CI
         fZuBq+Nlktqluxv12cgVF90dG9fI6YE0iyfPFWrU21cXaDGBGmVFRhhSUozsjeoy3WhT
         xj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544636; x=1750149436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnar+GeWh3IDeNTEo/pLO1+fWay4pzszrojH85IBaoA=;
        b=i73wOSbL9Bg6p++C1z9f2/I054yJSf7ca9R7pkTNI5742c15uOGnBagGNQagF4OOVQ
         pcap63cP9Sg3MF87/nZTkGk9p2aaX9nD6wlWsOXouWp4P3ZX88juUhYbXFmGgZQ25XFq
         7ITScYtq7VMx0RDlSwrx7mP23xtBmE6zmUe0l1na7rzbXaqwr37VvgEfkFDmwXo5tOqX
         5sA/iHMnwSGxj9En7CEwcA/VUTWPDz73+gmR/cy1GdfQlDK7JBWpCJPH+86UtAXSpPd/
         s75KkOqVgkpg4cPCHYRviDRL+DMRF5zS6fErDqYPU52juyTrOE94uLPN1mfShHVgYfbt
         dp0g==
X-Forwarded-Encrypted: i=1; AJvYcCVKSIXCqirPzzLeC1hm8EO7iqcENp59ZJd4UHDq6LE8bDRLpO05aYnBvu5rY0LiJbxicYIifRa+Qi7fWnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0MNq1IOJN1CkyaKGgKr1tAi/8AhBVSQZI9jmNjuvl2esRvWz/
	rftc3Q+I09UEKE1+PmesoOSvDfsqLTfeS0YHGtwzTw6p9eQgd2vUjqxtKBDhpa4IWvxaaAXhMMY
	pFN5bNxYnitl3pBMdOXWJvh6TwDxgS4Y=
X-Gm-Gg: ASbGncthN20voaJ7ypZMgG7EK+zqu+Uy0T/g5F8Lq9vEddlgYkXsbRXJZ2N03os0hxn
	U//jHmPtv8MXFPjw1wHSfp1RJsZQj/kDDBsFOMkYgUHQnAXhhhQ6n2QxXcLjiDnA1XzCusUrAjM
	YiWPnGg+rNcItgEgWYzqu5HuGvKsVCCfspvQEZgqs0BRmU
X-Google-Smtp-Source: AGHT+IHAuCzPail3KyWEnUuOTHkl0YO3F1D2VwSe8uGoUSEXuglFPFY6oRR0/8GCZZvsxs5d/hq5WZkunJGfAfg9F3o=
X-Received: by 2002:a05:6102:3ca4:b0:4db:e01:f2db with SMTP id
 ada2fe7eead31-4e7a8041a72mr1174771137.0.1749544635885; Tue, 10 Jun 2025
 01:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610035043.75448-1-dev.jain@arm.com> <20250610035043.75448-3-dev.jain@arm.com>
In-Reply-To: <20250610035043.75448-3-dev.jain@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 10 Jun 2025 20:37:04 +1200
X-Gm-Features: AX0GCFvNQf_tJMRGWeweQukrOmZB5LYVa1rypl060qryW1t_FAIfNamJEbB--IY
Message-ID: <CAGsJ_4wZM-BqDD=06_7Gksj=NiMJF0oZhqjnYK5FhGwX+diyHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org, 
	libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com, 
	anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com, 
	yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com, 
	hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 3:51=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all=
 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and =
only
> do them on the starting and ending contig block.
>
> For split folios, there will be no pte batching; nr_ptes will be 1. For
> pagetable splitting, the ptes will still point to the same large folio;
> for arm64, this results in the optimization described above, and for othe=
r
> arches (including the general case), a minor improvement is expected due =
to
> a reduction in the number of function calls.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

The code appears correct to me:

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 180b12225368..18b215521ada 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>         return pte;
>  }
>
> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned l=
ong addr,
> +               pte_t *ptep, pte_t pte, int max_nr)
> +{
> +       const fpb_t flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +       struct folio *folio;
> +
> +       if (max_nr =3D=3D 1)
> +               return 1;
> +
> +       folio =3D vm_normal_folio(vma, addr, pte);
> +       if (!folio || !folio_test_large(folio))
> +               return 1;
> +
> +       return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NUL=
L,
> +                              NULL, NULL);
> +}
> +
>  static int move_ptes(struct pagetable_move_control *pmc,
>                 unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>  {
> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *p=
mc,
>         bool need_clear_uffd_wp =3D vma_has_uffd_without_event_remap(vma)=
;
>         struct mm_struct *mm =3D vma->vm_mm;
>         pte_t *old_ptep, *new_ptep;
> -       pte_t pte;
> +       pte_t old_pte, pte;
>         pmd_t dummy_pmdval;
>         spinlock_t *old_ptl, *new_ptl;
>         bool force_flush =3D false;
> @@ -185,6 +202,8 @@ static int move_ptes(struct pagetable_move_control *p=
mc,
>         unsigned long new_addr =3D pmc->new_addr;
>         unsigned long old_end =3D old_addr + extent;
>         unsigned long len =3D old_end - old_addr;
> +       int max_nr_ptes;
> +       int nr_ptes;
>         int err =3D 0;
>
>         /*
> @@ -236,14 +255,16 @@ static int move_ptes(struct pagetable_move_control =
*pmc,
>         flush_tlb_batched_pending(vma->vm_mm);
>         arch_enter_lazy_mmu_mode();
>
> -       for (; old_addr < old_end; old_ptep++, old_addr +=3D PAGE_SIZE,
> -                                  new_ptep++, new_addr +=3D PAGE_SIZE) {
> +       for (; old_addr < old_end; old_ptep +=3D nr_ptes, old_addr +=3D n=
r_ptes * PAGE_SIZE,
> +               new_ptep +=3D nr_ptes, new_addr +=3D nr_ptes * PAGE_SIZE)=
 {
>                 VM_WARN_ON_ONCE(!pte_none(*new_ptep));
>
> -               if (pte_none(ptep_get(old_ptep)))
> +               nr_ptes =3D 1;
> +               max_nr_ptes =3D (old_end - old_addr) >> PAGE_SHIFT;
> +               old_pte =3D ptep_get(old_ptep);
> +               if (pte_none(old_pte))
>                         continue;
>
> -               pte =3D ptep_get_and_clear(mm, old_addr, old_ptep);
>                 /*
>                  * If we are remapping a valid PTE, make sure
>                  * to flush TLB before we drop the PTL for the
> @@ -255,8 +276,12 @@ static int move_ptes(struct pagetable_move_control *=
pmc,
>                  * the TLB entry for the old mapping has been
>                  * flushed.
>                  */
> -               if (pte_present(pte))
> +               if (pte_present(old_pte)) {
> +                       nr_ptes =3D mremap_folio_pte_batch(vma, old_addr,=
 old_ptep,
> +                                                        old_pte, max_nr_=
ptes);
>                         force_flush =3D true;
> +               }
> +               pte =3D get_and_clear_full_ptes(mm, old_addr, old_ptep, n=
r_ptes, 0);
>                 pte =3D move_pte(pte, old_addr, new_addr);
>                 pte =3D move_soft_dirty_pte(pte);
>
> @@ -269,7 +294,7 @@ static int move_ptes(struct pagetable_move_control *p=
mc,
>                                 else if (is_swap_pte(pte))
>                                         pte =3D pte_swp_clear_uffd_wp(pte=
);
>                         }
> -                       set_pte_at(mm, new_addr, new_ptep, pte);
> +                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>                 }
>         }
>
> --
> 2.30.2
>

Thanks

Barry
