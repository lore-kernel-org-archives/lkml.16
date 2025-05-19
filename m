Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125C41FFC5C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642700; cv=none; b=PzUaDCGQohIjbgE0B/wMw/KYPhpJofUK6P808ZmE1hrjhfyYAByZZ54sQEMAGzH+DIMHrwdTwYqiOgQ2BYtSO4ebEY3FgqGLZBkHvm+hNFvr4iHtx3Sw+SxvZaIZMuWR/c0aKMAmMBkG/DaJpeM2XD4nTiP6MWWfxFtLWBsrVdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642700; c=relaxed/simple;
	bh=vbufb0xMi+3AHol3o8fjUSYwWRHK53xCgB2lzYP6dLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6KpXqGXyqkmnnoxijXPbS3aQD7wQjzA9u1n0IAQDPpRr7vp9vtZnqijqAI0L2KdvtXGP1Hr9rzlAiltXec/9Nvp2UsVZ+ZZ6GUX8uWG8TxjcCR5VfODZ+4jI9233K4ZAMBwgL98RGI3ljFcuSW7JLzKPoA7OLFv7aFK46Nb5J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g70ThFu4; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g70ThFu4"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso3538652241.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747642695; x=1748247495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbOOM9CP485wFKiPk1vruZ8eJxSfyRZCjvhRHL5kUIE=;
        b=g70ThFu4hQNNQiVu5ntQQJpD78M6IzoK3YrFBF9yRF/ZgVEfeGso1Z3ZgLf5WyMt45
         j/Vvv7CNBGUjMHU7lZfrpJACAm/0dRu5n8pZ9DshU88qCvaAH3FygwvKt5Efg70YeW7b
         Cr5ZBMjauLM0uKyT6Y5RU56tiZNJRVTP9cLnLrghu5RaLFkQbJGrTm0aOmi0/+ScTS9U
         ApS1jI6vmOJ/fWye7+aD38WXo3n+urJlmL3mQBGJgEHli2jnOoBAMZH1fHzXQu27ln4F
         eRSA1mGvhu1vtWBmqbkWuHp2CI0UCru7zqNL/Wj1EWvwPrdDRg1hw2exM+x8yr20xSGh
         HCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642695; x=1748247495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbOOM9CP485wFKiPk1vruZ8eJxSfyRZCjvhRHL5kUIE=;
        b=H+oplNhSuCNDt9YcKYQYceKiQED96EUcSPmP2lQO4JQMgJItxW7PTrSUQOBHSY2K2o
         Ct9E2C38cWzlHBeOx/Nsh+/c4AdKzUBLs+7cfrLc+ppKWTtDe9hoHphOse8KigTH1V0r
         jeJ2OLOHvqKba/Prdy4/nHPLXDQ2zr60vH0qA418T/8EjUWQxSeYP92mLSrc6SD1o8l5
         p/zumC1Kai929ds4J3FE/1McWI6UpCxrAWwANMlHkXht5oiu94VH5qdZOApyPNLUcQZ1
         ESskkxukG5hIj7UdPmSDJ1L4cgS6tBznd9dZ9MGfxeeFUrGB/kWijrwtusSRk2swS+Fz
         MpIw==
X-Forwarded-Encrypted: i=1; AJvYcCVoMxQF0x1yPpwTqMBkQO+4dDE9Hlz6GH4FaCEu0aXGQZazR7NxhaUH266ETHmTj9kECa4GPWNWhRhd0As=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHa6f0/QaDK21kKs3JJFGxlbNSm6TGBYjd2W/RyEnOkPFQRP8X
	PzPEObZk8xnGE4velV+rHt7nQLvTj7EDlZWner9qA2SV5OpbCLiKsErBOt45K6IJ9KziMn+Z3Fo
	f8lr7Z6hrzZov1L7RhC+urVtO4kVUeuY=
X-Gm-Gg: ASbGncsYDfqF2hKwhGemD9gisDlcnfqccs4rqPIrUY4y5CcxR0abdjlsj6AoRxwc6PG
	PvBqP0v6qoMQURIp2Trpq6c6juzUddrJcxFyny8DPR8GBRTjCzrqcecZVdgXanh0JVMmmlqxNv0
	1RdrqyKApHdksRdMR/y+iWr6KEFrlF/RT3nw==
X-Google-Smtp-Source: AGHT+IH7iQQzVbWRey+QVYxMnupo0p0BVOmLHugayup+weA+w9NRvWE805nPWIhB2+xWOnSRHFrHqkxwxCGevdgKWDU=
X-Received: by 2002:a05:6102:739:b0:4e1:441d:be9f with SMTP id
 ada2fe7eead31-4e1441dc0c2mr5642964137.2.1747642694691; Mon, 19 May 2025
 01:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519074824.42909-1-dev.jain@arm.com> <20250519074824.42909-4-dev.jain@arm.com>
In-Reply-To: <20250519074824.42909-4-dev.jain@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 19 May 2025 20:18:03 +1200
X-Gm-Features: AX0GCFvtQEnIeYLu9V7MLy8rbigOz441xQQIk4cZgyQblXwGOW5lgY58IQJJ0lQ
Message-ID: <CAGsJ_4yY7OXm68vLvWL1Oh=315jR5bX4BDKsaKrqKhEfxVdibg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm: Optimize mprotect() by PTE batching
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, 
	anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com, 
	ioworker0@gmail.com, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, 
	christophe.leroy@csgroup.eu, yangyicong@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, hughd@google.com, 
	yang@os.amperecomputing.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 7:49=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Use folio_pte_batch to batch process a large folio. Reuse the folio from =
prot_numa
> case if possible. Since modify_prot_start_ptes() gathers access/dirty bit=
s,
> it lets us batch around pte_needs_flush() (for parisc, the definition inc=
ludes
> the access bit).
> For all cases other than the PageAnonExclusive case, if the case holds tr=
ue
> for one pte in the batch, one can confirm that that case will hold true f=
or
> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pas=
s
> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty and ac=
cess bits
> across the batch, therefore batching across pte_dirty(): this is correct =
since
> the dirty bit on the PTE really is just an indication that the folio got =
written
> to, so even if the PTE is not actually dirty (but one of the PTEs in the =
batch is),
> the wp-fault optimization can be made.
> The crux now is how to batch around the PageAnonExclusive case; we must c=
heck
> the corresponding condition for every single page. Therefore, from the la=
rge
> folio batch, we process sub batches of ptes mapping pages with the same P=
ageAnonExclusive
> condition, and process that sub batch, then determine and process the nex=
t sub batch,
> and so on. Note that this does not cause any extra overhead; if suppose t=
he size of
> the folio batch is 512, then the sub batch processing in total will take =
512 iterations,
> which is the same as what we would have done before.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/mm.h |   7 ++-
>  mm/mprotect.c      | 126 +++++++++++++++++++++++++++++++++++----------
>  2 files changed, 104 insertions(+), 29 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 43748c8f3454..7d5b96f005dc 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2542,8 +2542,11 @@ int get_cmdline(struct task_struct *task, char *bu=
ffer, int buflen);
>  #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>                                             MM_CP_UFFD_WP_RESOLVE)
>
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long a=
ddr,
> -                            pte_t pte);
> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long =
addr,
> +                            pte_t pte, int max_len, int *len);
> +#define can_change_pte_writable(vma, addr, pte)        \
> +       can_change_ptes_writable(vma, addr, pte, 1, NULL)
> +
>  extern long change_protection(struct mmu_gather *tlb,
>                               struct vm_area_struct *vma, unsigned long s=
tart,
>                               unsigned long end, unsigned long cp_flags);
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 124612ce3d24..6cd8cdc168fa 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -40,25 +40,36 @@
>
>  #include "internal.h"
>
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long a=
ddr,
> -                            pte_t pte)
> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long =
addr,
> +                            pte_t pte, int max_len, int *len)
>  {
>         struct page *page;
> +       bool temp_ret;
> +       bool ret;
> +       int i;
>
> -       if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
> -               return false;
> +       if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE))) {
> +               ret =3D false;
> +               goto out;
> +       }
>
>         /* Don't touch entries that are not even readable. */
> -       if (pte_protnone(pte))
> -               return false;
> +       if (pte_protnone(pte)) {
> +               ret =3D false;
> +               goto out;
> +       }
>
>         /* Do we need write faults for softdirty tracking? */
> -       if (pte_needs_soft_dirty_wp(vma, pte))
> -               return false;
> +       if (pte_needs_soft_dirty_wp(vma, pte)) {
> +               ret =3D false;
> +               goto out;
> +       }
>
>         /* Do we need write faults for uffd-wp tracking? */
> -       if (userfaultfd_pte_wp(vma, pte))
> -               return false;
> +       if (userfaultfd_pte_wp(vma, pte)) {
> +               ret =3D false;
> +               goto out;
> +       }
>
>         if (!(vma->vm_flags & VM_SHARED)) {
>                 /*
> @@ -68,7 +79,19 @@ bool can_change_pte_writable(struct vm_area_struct *vm=
a, unsigned long addr,
>                  * any additional checks while holding the PT lock.
>                  */
>                 page =3D vm_normal_page(vma, addr, pte);
> -               return page && PageAnon(page) && PageAnonExclusive(page);
> +               ret =3D (page && PageAnon(page) && PageAnonExclusive(page=
));
> +               if (!len)
> +                       return ret;
> +
> +               /* Check how many consecutive pages are AnonExclusive or =
not */
> +               for (i =3D 1; i < max_len; ++i) {
> +                       ++page;
> +                       temp_ret =3D (page && PageAnon(page) && PageAnonE=
xclusive(page));
> +                       if (temp_ret !=3D ret)

Do we really need to do PageAnon for each subpage which is:
folio_test_anon(page_folio(page))

since we have checked subpage[0] ?

> +                               break;
> +               }
> +               *len =3D i;
> +               return ret;
>         }
>
>         VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
> @@ -80,21 +103,55 @@ bool can_change_pte_writable(struct vm_area_struct *=
vma, unsigned long addr,
>          * FS was already notified and we can simply mark the PTE writabl=
e
>          * just like the write-fault handler would do.
>          */
> -       return pte_dirty(pte);
> +       ret =3D pte_dirty(pte);
> +
> +out:
> +       /* The entire batch is guaranteed to have the same return value *=
/
> +       if (len)
> +               *len =3D max_len;
> +       return ret;
>  }
>
>  static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t=
 *ptep,
> -               pte_t pte, int max_nr_ptes)
> +               pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)
>  {
> -       const fpb_t flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +       fpb_t flags =3D FPB_IGNORE_DIRTY;
>
> -       if (!folio_test_large(folio) || (max_nr_ptes =3D=3D 1))
> +       if (ignore_soft_dirty)
> +               flags |=3D FPB_IGNORE_SOFT_DIRTY;
> +
> +       if (!folio || !folio_test_large(folio) || (max_nr_ptes =3D=3D 1))
>                 return 1;
>
>         return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags=
,
>                                NULL, NULL, NULL);
>  }
>
> +/**
> + * modify_sub_batch - Identifies a sub-batch which has the same return v=
alue
> + * of can_change_pte_writable(), from within a folio batch. max_len is t=
he
> + * max length of the possible sub-batch. sub_batch_idx is the offset fro=
m
> + * the start of the original folio batch.
> + */
> +static int modify_sub_batch(struct vm_area_struct *vma, struct mmu_gathe=
r *tlb,
> +               unsigned long addr, pte_t *ptep, pte_t oldpte, pte_t pten=
t,
> +               int max_len, int sub_batch_idx)
> +{
> +       unsigned long new_addr =3D addr + sub_batch_idx * PAGE_SIZE;
> +       pte_t new_oldpte =3D pte_advance_pfn(oldpte, sub_batch_idx);
> +       pte_t new_ptent =3D pte_advance_pfn(ptent, sub_batch_idx);
> +       pte_t *new_ptep =3D ptep + sub_batch_idx;
> +       int len =3D 1;
> +
> +       if (can_change_ptes_writable(vma, new_addr, new_ptent, max_len, &=
len))
> +               new_ptent =3D pte_mkwrite(new_ptent, vma);
> +
> +       modify_prot_commit_ptes(vma, new_addr, new_ptep, new_oldpte, new_=
ptent, len);
> +       if (pte_needs_flush(new_oldpte, new_ptent))
> +               tlb_flush_pte_range(tlb, new_addr, len * PAGE_SIZE);
> +       return len;
> +}
> +
>  static long change_pte_range(struct mmu_gather *tlb,
>                 struct vm_area_struct *vma, pmd_t *pmd, unsigned long add=
r,
>                 unsigned long end, pgprot_t newprot, unsigned long cp_fla=
gs)
> @@ -106,7 +163,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>         bool prot_numa =3D cp_flags & MM_CP_PROT_NUMA;
>         bool uffd_wp =3D cp_flags & MM_CP_UFFD_WP;
>         bool uffd_wp_resolve =3D cp_flags & MM_CP_UFFD_WP_RESOLVE;
> -       int nr_ptes;
> +       int sub_batch_idx, max_len, len, nr_ptes;
>
>         tlb_change_page_size(tlb, PAGE_SIZE);
>         pte =3D pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -121,10 +178,12 @@ static long change_pte_range(struct mmu_gather *tlb=
,
>         flush_tlb_batched_pending(vma->vm_mm);
>         arch_enter_lazy_mmu_mode();
>         do {
> +               sub_batch_idx =3D 0;
>                 nr_ptes =3D 1;
>                 oldpte =3D ptep_get(pte);
>                 if (pte_present(oldpte)) {
>                         int max_nr_ptes =3D (end - addr) >> PAGE_SHIFT;
> +                       struct folio *folio =3D NULL;
>                         pte_t ptent;
>
>                         /*
> @@ -132,7 +191,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>                          * pages. See similar comment in change_huge_pmd.
>                          */
>                         if (prot_numa) {
> -                               struct folio *folio;
>                                 int nid;
>                                 bool toptier;
>
> @@ -180,7 +238,8 @@ static long change_pte_range(struct mmu_gather *tlb,
>                                     toptier) {
>  skip_batch:
>                                         nr_ptes =3D mprotect_batch(folio,=
 addr, pte,
> -                                                                oldpte, =
max_nr_ptes);
> +                                                                oldpte, =
max_nr_ptes,
> +                                                                true);
>                                         continue;
>                                 }
>                                 if (folio_use_access_time(folio))
> @@ -188,6 +247,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>                                                 jiffies_to_msecs(jiffies)=
);
>                         }
>
> +                       if (!folio)
> +                               folio =3D vm_normal_folio(vma, addr, oldp=
te);
> +
> +                       nr_ptes =3D mprotect_batch(folio, addr, pte, oldp=
te,
> +                                                max_nr_ptes, false);
>                         oldpte =3D modify_prot_start_ptes(vma, addr, pte,=
 nr_ptes);
>                         ptent =3D pte_modify(oldpte, newprot);
>
> @@ -209,15 +273,23 @@ static long change_pte_range(struct mmu_gather *tlb=
,
>                          * example, if a PTE is already dirty and no othe=
r
>                          * COW or special handling is required.
>                          */
> -                       if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> -                           !pte_write(ptent) &&
> -                           can_change_pte_writable(vma, addr, ptent))
> -                               ptent =3D pte_mkwrite(ptent, vma);
> -
> -                       modify_prot_commit_ptes(vma, addr, pte, oldpte, p=
tent, nr_ptes);
> -                       if (pte_needs_flush(oldpte, ptent))
> -                               tlb_flush_pte_range(tlb, addr, PAGE_SIZE)=
;
> -                       pages++;
> +                       if (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) {
> +                               max_len =3D nr_ptes;
> +                               while (sub_batch_idx < nr_ptes) {
> +
> +                                       /* Get length of sub batch */
> +                                       len =3D modify_sub_batch(vma, tlb=
, addr, pte,
> +                                                              oldpte, pt=
ent, max_len,
> +                                                              sub_batch_=
idx);
> +                                       sub_batch_idx +=3D len;
> +                                       max_len -=3D len;
> +                               }
> +                       } else {
> +                               modify_prot_commit_ptes(vma, addr, pte, o=
ldpte, ptent, nr_ptes);
> +                               if (pte_needs_flush(oldpte, ptent))
> +                                       tlb_flush_pte_range(tlb, addr, nr=
_ptes * PAGE_SIZE);
> +                       }
> +                       pages +=3D nr_ptes;
>                 } else if (is_swap_pte(oldpte)) {
>                         swp_entry_t entry =3D pte_to_swp_entry(oldpte);
>                         pte_t newpte;
> --
> 2.30.2
>

Thanks
barry
