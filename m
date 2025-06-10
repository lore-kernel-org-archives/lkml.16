Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD9BAD21
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539044; cv=none; b=ofeY6oyBeUecpzma71e96KUeSoniM40uv7mhXZ+JMqAX0gXrstzY5Tps56XCZAZ7zma6CqAMvsbgHzR0laohlXmYVnEi/rnW1KTzw9+cGSCReMrq2OVpu4cID6bL3JPJL0TPUM/ni43J5RKKAHZkqvFxDOc0LDDgDh2R94LoseI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539044; c=relaxed/simple;
	bh=SOE0EGxdT+ZoTFY+LYr7w9QEblNrOFYo+oRHrEAUMAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usJJ0UYbFbhUfd+BdxbNJ0e8S2B4QgxFl1Nd97s3BaU6KmrOc++OJlfrCaQmH4Ek8VeucinLlxfcfvzpYKkzZMIKFtZdcDnhD/vGftCmcxlJZXJEfrGIHxxCn1n9Pfoxzq3kBf1F2jkUWBAQ3Qkl8mARythO0O7VW0/FuYvpG8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5yU1G74; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5yU1G74"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso56989161cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749539042; x=1750143842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRxCgz3ov39f3NkO1C/Ste+6+jR42JfHSBXHuL3upq4=;
        b=N5yU1G74fBDgbAxdvoztrKG0wKqzsrV1d6uekhO04xvgjKUZQMl/Jj5BdiC2r1TtQl
         4ApVNzNX4lhKM1U6Dmu4BHc4B+z6uVAFtpNjK5qUR9IJaGd2eJt1rbtR/LRdgW1WCpR0
         OEtUZ5lWJuCTXAXMqKA66svHpGnJgp+2kVcVh/g88muca2vou1ZtIskZLcpKpEDdHIyX
         zpUBXDU8F2Z643+hOhG1rseAbqZYWyYJY0JqR8+uP4hLuyOTF2/r374eG8sM166Ge980
         47i0UQZcg25mcD9D/PdunWeZLKSDbtrvioVF3PtIEMmH/NksFTb+HirFnGnjSWFoOngv
         P+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749539042; x=1750143842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRxCgz3ov39f3NkO1C/Ste+6+jR42JfHSBXHuL3upq4=;
        b=tt/24ja/FJWz7AaCUe4ePNQZqqkJR/zP65ubvxJ7x/8nDMeRoTfmt+Uyoj6Nn5F3dx
         BnbF3TGA4ELc9UKnpMzloru4dLB5dPOTUl7IOmgb+6EbgTGKe2ZVUDMT3cIUdhKwNiAB
         VC/CkXbS2G71zhaiwLB+1W2cWasMVKUcHNWfYpZr1JW8NoqxR9fDHF88nF/tt8Vtm0Xp
         lGxRlnE3akskMAcPP/TJYCWNYGgE0ooHmZc4qmV7TTZpl3slXb5Z/rsCj0xromC4DnBt
         3n7FDh43hlUDk+lpoVyh1gIzd7WKSKs/GCzTnxSL75Tf+a3vIZgjkCLaZi197aUiCXbp
         nIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkJgClz6Akb76pgldleTntYaqZFgHRtecoeinTIh+D4NWYWQZrKUqFgasBiyER8H9FQ2/earejJnUFWDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeQfe+96E0M4bxqWQKSdvhctUJcfjpjeBVXP3B65ZVIN7Xxa0O
	0660oIq6Kihgh9EaMqdCPjYRp1/SWlZ4FXbqXdtAVEgg6uCD7/LJ1diD8F95tJujlpjw6JhkNnH
	tQLQ3DTn1Yf2am9X0eKQpbiXXpV+eMZmY5vmg
X-Gm-Gg: ASbGnctQx4C0Yxe+/0682w34mGlrqaWdLVdk8yw5SfgVBHNVZeXTPPGMt5rlqST09jb
	TSuzjXFEtoGxOwX/P6oEV9TAO5+rxKGOxfTul17y9/9HCLh/DHfnt77kqkhLd/Du/ayuu5klH98
	6OT/UCez3j8gkWUeyGemQ/ViB66VkgWSk/w9HkDk1sziRK
X-Google-Smtp-Source: AGHT+IHQS/YTqX0/RrUUYk+jBcicnmche2QaN2G7qxoFRaV8iI3I4823oDVD+CXzXXILw4YsvumYKvj6iy5XGekoduA=
X-Received: by 2002:a05:6102:5802:b0:4e5:9608:1298 with SMTP id
 ada2fe7eead31-4e7a5d9219amr2083010137.9.1749539029690; Tue, 10 Jun 2025
 00:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610035043.75448-1-dev.jain@arm.com> <20250610035043.75448-3-dev.jain@arm.com>
In-Reply-To: <20250610035043.75448-3-dev.jain@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 10 Jun 2025 19:03:38 +1200
X-Gm-Features: AX0GCFssF_BfaHBSnwwuRHl4g5EboG5sCNvwQwRg64OyRx_hLEwKVZyhAQ8jJH4
Message-ID: <CAGsJ_4xPq-eJ7JE-SFhhO2TboH8HKGifaYCwKw8cqd_2K=uD4w@mail.gmail.com>
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

Hi Dev,

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

I'm curious about the following case:
If the addr/ptep is not the first subpage of the folio=E2=80=94for example,=
 the
14th subpage=E2=80=94will mremap_folio_pte_batch() return 3?
If so, get_and_clear_full_ptes() would operate on 3 subpages of the folio.
In that case, can unfold still work correctly?

Similarly, if the addr/ptep points to the first subpage, but max_nr is
less than CONT_PTES, what will happen in that case?


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
