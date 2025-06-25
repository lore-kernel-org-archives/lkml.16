Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8C2E06D1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883549; cv=none; b=T5N2SzN3IWyrS+ffdgrR/+zTkqgA5AdCglUmj+XeWnCAYK4pmn5gMOWfdQ4fIeU6HK+sQwNeXL11AgjrYxOuqyS6zZPY05r/5I4Wyu70urmgIa5LtMPZh1SP7vxxVGP0U3q4ReRPGNZ3o4mRMyZJGK1g1DjE/YuJT9eCmEKdMoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883549; c=relaxed/simple;
	bh=V1H77vjIowyrgyx1L2sPlLCmDxVAVzKy9Ihe1IyUPb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXhrCvM9BQtnVZJ8x6U2NDd+YgJdJTkj07xvsthN0L7e0jQ6WEBHwW9aLCV7VT04GtQObskndSmF6T8+kbwdFJaFhLOaIEUqvgiGQhnwj2YDXNPfezBNEBoyOjBwdTjeoEIHvt7kc1uDUq67Pe4okp3dIVq6tpE064kIgBFoO3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VstkG157; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VstkG157"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-714078015edso3230427b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750883546; x=1751488346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLFYUt98P2q0h/fZsXZ99NhjaWK3IxRzSYbzaWT17Y4=;
        b=VstkG157LAHA7EvzkXxJZIBGTy3TF3CKXY8T7EpcieJSFnCXDZIOlq4Yz224celtcq
         DZAVJFZhk5n69n7detolRa2LA1eqrHWnl+dnDFTFDjlBMUASNSUe4NYZO49WrNXkAk0G
         S4xLAyM2AgitA5hGvVshkzlICdcEfa76FlvMVsobAoCClto/aMXx+h366dfnEgF8A5OJ
         x0s/i1qdloZk/ETaNGDawu+qZJJj0Mv//5d/9j/6tLfNa2GsgQxoY9xusmzGpgNxi/8V
         qbLFQgDV0ST4wmD7FmJwDlBeHWH4pp0h3XzB1kWMyexkVT0FNx5fhPlIvxh+Y1i3XUSQ
         GjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750883546; x=1751488346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLFYUt98P2q0h/fZsXZ99NhjaWK3IxRzSYbzaWT17Y4=;
        b=dbBSf2BhgprrfxbPRQdRsbVa5eAaCmiUFAZovM4wwchJ4OexI1CZRWMi9xFmkLJN83
         bOkCnOoITzbRjSa4QniCNggtUFcVXhDC9e6wSbtF4O0yqldK+ZaUt+u+9hJji3ln38vD
         +153PLNkBrjzI2ee45ZRecHnE69P60ZpyV9ENdgm5KGM0E0psTIrkiYNXPcPCM5eKjWF
         XeambGcrKyCmczm8YdVN11RAvoFlrtvdqR3LoXgCbbkJYxE+7X+/t4S+9iQ5s6mc1ck6
         wa+Ot98y/Tz+PpMzNJs/mQi8RDUyxLOUnl1mOJvpu+/yHFYcvjcaM7RH0o6dJ5dz4z2p
         jvFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL2YIK0Cvfgir9P6Pt5TSqN8nT4W96M/vArH0y9vTQ159ICteqxUsEq0Wkhix1cEIo5Fx/AFvkBoxTl6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10kBVePBLHQlw5e4yOlI/XdnccsdoXHBsUMW5GtnNuYTkF0gN
	JEuBhZLGNXk5KcbYrimyl2WRMiwlNoNkADW/+Pct3rOc4l8ax+t4CY6blFfVyo82mjiuqjf2AlR
	qqmVhroR50N8auCrW3/u6lgNl0AJl74yUlXtOu790
X-Gm-Gg: ASbGnctxCJHm2ynB7OhYG02vDpFvxgIdIthQqSrzkmTUFbRKClD0mUzrqGlkzHl8T8D
	Eap9GLYJ5swktz7AGy/l7WbTBpsPJx8KytHSs7TjPrQZUsAmwhjGQGpU4695oBJbYV4oOVRWTD1
	L9YXWzCqn8fMeMKfyrO6jrpnr1vTUD5VAfo0Pe5URMGxGBEcVavF8htpEMzJYaiGnmjxd5vQo6
X-Google-Smtp-Source: AGHT+IHhfR6/VlJVSXraZCY/fQlZAWZbH/2E7bRPGkB0TTeVRkt1lIwuCEsaLSMizSmISjMwsYtat4LpSX+OYWyJJ70=
X-Received: by 2002:a05:690c:85:b0:712:e2b5:e61b with SMTP id
 00721157ae682-71406ca2e13mr70129327b3.13.1750883545165; Wed, 25 Jun 2025
 13:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620190342.1780170-1-peterx@redhat.com> <20250620190342.1780170-5-peterx@redhat.com>
In-Reply-To: <20250620190342.1780170-5-peterx@redhat.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Jun 2025 13:31:49 -0700
X-Gm-Features: Ac12FXzgcuNaEB-qFo3pCvx2b2klwV6rpJlAl6SRM316awXTv0oTOGmJj0ZOazg
Message-ID: <CADrL8HVZccikHRZ+PP4EfKQBkgXZ0E9S3GFtwWVYLD2NMhg7EA@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Nikita Kalyazin <kalyazin@amazon.com>, Hugh Dickins <hughd@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Michal Hocko <mhocko@suse.com>, 
	David Hildenbrand <david@redhat.com>, Muchun Song <muchun.song@linux.dev>, 
	Andrea Arcangeli <aarcange@redhat.com>, Ujwal Kundur <ujwal.kundur@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Axel Rasmussen <axelrasmussen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 12:04=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote=
:
>
> This patch completely moves the old userfaultfd core to use the new
> vm_uffd_ops API.  After this change, existing file systems will start to
> use the new API for userfault operations.
>
> When at it, moving vma_can_userfault() into mm/userfaultfd.c instead,
> because it's getting too big.  It's only used in slow paths so it shouldn=
't
> be an issue.
>
> This will also remove quite some hard-coded checks for either shmem or
> hugetlbfs.  Now all the old checks should still work but with vm_uffd_ops=
.
>
> Note that anonymous memory will still need to be processed separately
> because it doesn't have vm_ops at all.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/shmem_fs.h      |  14 -----
>  include/linux/userfaultfd_k.h |  46 ++++----------
>  mm/shmem.c                    |   2 +-
>  mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
>  4 files changed, 101 insertions(+), 76 deletions(-)
>
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index 6d0f9c599ff7..2f5b7b295cf6 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -195,20 +195,6 @@ static inline pgoff_t shmem_fallocend(struct inode *=
inode, pgoff_t eof)
>  extern bool shmem_charge(struct inode *inode, long pages);
>  extern void shmem_uncharge(struct inode *inode, long pages);
>
> -#ifdef CONFIG_USERFAULTFD
> -#ifdef CONFIG_SHMEM
> -extern int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
> -                                 struct vm_area_struct *dst_vma,
> -                                 unsigned long dst_addr,
> -                                 unsigned long src_addr,
> -                                 uffd_flags_t flags,
> -                                 struct folio **foliop);
> -#else /* !CONFIG_SHMEM */
> -#define shmem_mfill_atomic_pte(dst_pmd, dst_vma, dst_addr, \
> -                              src_addr, flags, foliop) ({ BUG(); 0; })
> -#endif /* CONFIG_SHMEM */
> -#endif /* CONFIG_USERFAULTFD */
> -
>  /*
>   * Used space is stored as unsigned 64-bit value in bytes but
>   * quota core supports only signed 64-bit values so use that
> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.=
h
> index e79c724b3b95..4e56ad423a4a 100644
> --- a/include/linux/userfaultfd_k.h
> +++ b/include/linux/userfaultfd_k.h
> @@ -85,9 +85,14 @@ extern vm_fault_t handle_userfault(struct vm_fault *vm=
f, unsigned long reason);
>  #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(n=
r))
>  #define MFILL_ATOMIC_MODE_MASK ((__force uffd_flags_t) (MFILL_ATOMIC_BIT=
(0) - 1))
>
> +static inline enum mfill_atomic_mode uffd_flags_get_mode(uffd_flags_t fl=
ags)
> +{
> +       return (enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
> +}
> +
>  static inline bool uffd_flags_mode_is(uffd_flags_t flags, enum mfill_ato=
mic_mode expected)
>  {
> -       return (flags & MFILL_ATOMIC_MODE_MASK) =3D=3D ((__force uffd_fla=
gs_t) expected);
> +       return uffd_flags_get_mode(flags) =3D=3D expected;
>  }
>
>  static inline uffd_flags_t uffd_flags_set_mode(uffd_flags_t flags, enum =
mfill_atomic_mode mode)
> @@ -196,41 +201,16 @@ static inline bool userfaultfd_armed(struct vm_area=
_struct *vma)
>         return vma->vm_flags & __VM_UFFD_FLAGS;
>  }
>
> -static inline bool vma_can_userfault(struct vm_area_struct *vma,
> -                                    unsigned long vm_flags,
> -                                    bool wp_async)
> +static inline const vm_uffd_ops *vma_get_uffd_ops(struct vm_area_struct =
*vma)
>  {
> -       vm_flags &=3D __VM_UFFD_FLAGS;
> -
> -       if (vma->vm_flags & VM_DROPPABLE)
> -               return false;
> -
> -       if ((vm_flags & VM_UFFD_MINOR) &&
> -           (!is_vm_hugetlb_page(vma) && !vma_is_shmem(vma)))
> -               return false;
> -
> -       /*
> -        * If wp async enabled, and WP is the only mode enabled, allow an=
y
> -        * memory type.
> -        */
> -       if (wp_async && (vm_flags =3D=3D VM_UFFD_WP))
> -               return true;
> -
> -#ifndef CONFIG_PTE_MARKER_UFFD_WP
> -       /*
> -        * If user requested uffd-wp but not enabled pte markers for
> -        * uffd-wp, then shmem & hugetlbfs are not supported but only
> -        * anonymous.
> -        */
> -       if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
> -               return false;
> -#endif

Hi Peter,

Thanks for this cleanup!

It looks like the above two checks, the wp-async one and the PTE
marker check, have been reordered in this patch. Does this result in a
functional difference?

The rest of this series looks fine to me. :)

> -
> -       /* By default, allow any of anon|shmem|hugetlb */
> -       return vma_is_anonymous(vma) || is_vm_hugetlb_page(vma) ||
> -           vma_is_shmem(vma);
> +       if (vma->vm_ops && vma->vm_ops->userfaultfd_ops)
> +               return vma->vm_ops->userfaultfd_ops;
> +       return NULL;
>  }
>
> +bool vma_can_userfault(struct vm_area_struct *vma,
> +                      unsigned long vm_flags, bool wp_async);
> +
>  static inline bool vma_has_uffd_without_event_remap(struct vm_area_struc=
t *vma)
>  {
>         struct userfaultfd_ctx *uffd_ctx =3D vma->vm_userfaultfd_ctx.ctx;
> diff --git a/mm/shmem.c b/mm/shmem.c
> index bd0a29000318..4d71fc7be358 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -3158,7 +3158,7 @@ static int shmem_uffd_get_folio(struct inode *inode=
, pgoff_t pgoff,
>         return shmem_get_folio(inode, pgoff, 0, folio, SGP_NOALLOC);
>  }
>
> -int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
> +static int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
>                            struct vm_area_struct *dst_vma,
>                            unsigned long dst_addr,
>                            unsigned long src_addr,
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 879505c6996f..61783ff2d335 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -14,12 +14,48 @@
>  #include <linux/userfaultfd_k.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/hugetlb.h>
> -#include <linux/shmem_fs.h>
>  #include <asm/tlbflush.h>
>  #include <asm/tlb.h>
>  #include "internal.h"
>  #include "swap.h"
>
> +bool vma_can_userfault(struct vm_area_struct *vma,
> +                      unsigned long vm_flags, bool wp_async)
> +{
> +       unsigned long supported;
> +
> +       if (vma->vm_flags & VM_DROPPABLE)
> +               return false;
> +
> +       vm_flags &=3D __VM_UFFD_FLAGS;
> +
> +#ifndef CONFIG_PTE_MARKER_UFFD_WP
> +       /*
> +        * If user requested uffd-wp but not enabled pte markers for
> +        * uffd-wp, then any file system (like shmem or hugetlbfs) are no=
t
> +        * supported but only anonymous.
> +        */
> +       if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
> +               return false;
> +#endif
> +       /*
> +        * If wp async enabled, and WP is the only mode enabled, allow an=
y
> +        * memory type.
> +        */
> +       if (wp_async && (vm_flags =3D=3D VM_UFFD_WP))
> +               return true;
> +
> +       if (vma_is_anonymous(vma))
> +               /* Anonymous has no page cache, MINOR not supported */
> +               supported =3D VM_UFFD_MISSING | VM_UFFD_WP;
> +       else if (vma_get_uffd_ops(vma))
> +               supported =3D vma_get_uffd_ops(vma)->uffd_features;
> +       else
> +               return false;
> +
> +       return !(vm_flags & (~supported));
> +}
> +
>  static __always_inline
>  bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned long dst_=
end)
>  {
> @@ -384,11 +420,15 @@ static int mfill_atomic_pte_continue(pmd_t *dst_pmd=
,
>  {
>         struct inode *inode =3D file_inode(dst_vma->vm_file);
>         pgoff_t pgoff =3D linear_page_index(dst_vma, dst_addr);
> +       const vm_uffd_ops *uffd_ops =3D vma_get_uffd_ops(dst_vma);
>         struct folio *folio;
>         struct page *page;
>         int ret;
>
> -       ret =3D shmem_get_folio(inode, pgoff, 0, &folio, SGP_NOALLOC);
> +       if (WARN_ON_ONCE(!uffd_ops || !uffd_ops->uffd_get_folio))
> +               return -EINVAL;
> +
> +       ret =3D uffd_ops->uffd_get_folio(inode, pgoff, &folio);
>         /* Our caller expects us to return -EFAULT if we failed to find f=
olio */
>         if (ret =3D=3D -ENOENT)
>                 ret =3D -EFAULT;
> @@ -504,18 +544,6 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
>         u32 hash;
>         struct address_space *mapping;
>
> -       /*
> -        * There is no default zero huge page for all huge page sizes as
> -        * supported by hugetlb.  A PMD_SIZE huge pages may exist as used
> -        * by THP.  Since we can not reliably insert a zero page, this
> -        * feature is not supported.
> -        */
> -       if (uffd_flags_mode_is(flags, MFILL_ATOMIC_ZEROPAGE)) {
> -               up_read(&ctx->map_changing_lock);
> -               uffd_mfill_unlock(dst_vma);
> -               return -EINVAL;
> -       }
> -
>         src_addr =3D src_start;
>         dst_addr =3D dst_start;
>         copied =3D 0;
> @@ -686,14 +714,55 @@ static __always_inline ssize_t mfill_atomic_pte(pmd=
_t *dst_pmd,
>                         err =3D mfill_atomic_pte_zeropage(dst_pmd,
>                                                  dst_vma, dst_addr);
>         } else {
> -               err =3D shmem_mfill_atomic_pte(dst_pmd, dst_vma,
> -                                            dst_addr, src_addr,
> -                                            flags, foliop);
> +               const vm_uffd_ops *uffd_ops =3D vma_get_uffd_ops(dst_vma)=
;
> +
> +               if (WARN_ON_ONCE(!uffd_ops || !uffd_ops->uffd_copy)) {
> +                       err =3D -EINVAL;
> +               } else {
> +                       err =3D uffd_ops->uffd_copy(dst_pmd, dst_vma,
> +                                                 dst_addr, src_addr,
> +                                                 flags, foliop);
> +               }
>         }
>
>         return err;
>  }
>
> +static inline bool
> +vma_uffd_ops_supported(struct vm_area_struct *vma, uffd_flags_t flags)
> +{
> +       enum mfill_atomic_mode mode =3D uffd_flags_get_mode(flags);
> +       const vm_uffd_ops *uffd_ops;
> +       unsigned long uffd_ioctls;
> +
> +       if ((flags & MFILL_ATOMIC_WP) && !(vma->vm_flags & VM_UFFD_WP))
> +               return false;
> +
> +       /* Anonymous supports everything except CONTINUE */
> +       if (vma_is_anonymous(vma))
> +               return mode !=3D MFILL_ATOMIC_CONTINUE;
> +
> +       uffd_ops =3D vma_get_uffd_ops(vma);
> +       if (!uffd_ops)
> +               return false;
> +
> +       uffd_ioctls =3D uffd_ops->uffd_ioctls;
> +       switch (mode) {
> +       case MFILL_ATOMIC_COPY:
> +               return uffd_ioctls & BIT(_UFFDIO_COPY);
> +       case MFILL_ATOMIC_ZEROPAGE:
> +               return uffd_ioctls & BIT(_UFFDIO_ZEROPAGE);
> +       case MFILL_ATOMIC_CONTINUE:
> +               if (!(vma->vm_flags & VM_SHARED))
> +                       return false;
> +               return uffd_ioctls & BIT(_UFFDIO_CONTINUE);
> +       case MFILL_ATOMIC_POISON:
> +               return uffd_ioctls & BIT(_UFFDIO_POISON);
> +       default:
> +               return false;
> +       }
> +}
> +
>  static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
>                                             unsigned long dst_start,
>                                             unsigned long src_start,
> @@ -752,11 +821,7 @@ static __always_inline ssize_t mfill_atomic(struct u=
serfaultfd_ctx *ctx,
>             dst_vma->vm_flags & VM_SHARED))
>                 goto out_unlock;
>
> -       /*
> -        * validate 'mode' now that we know the dst_vma: don't allow
> -        * a wrprotect copy if the userfaultfd didn't register as WP.
> -        */
> -       if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP=
))
> +       if (!vma_uffd_ops_supported(dst_vma, flags))
>                 goto out_unlock;
>
>         /*
> @@ -766,12 +831,6 @@ static __always_inline ssize_t mfill_atomic(struct u=
serfaultfd_ctx *ctx,
>                 return  mfill_atomic_hugetlb(ctx, dst_vma, dst_start,
>                                              src_start, len, flags);
>
> -       if (!vma_is_anonymous(dst_vma) && !vma_is_shmem(dst_vma))
> -               goto out_unlock;
> -       if (!vma_is_shmem(dst_vma) &&
> -           uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE))
> -               goto out_unlock;
> -
>         while (src_addr < src_start + len) {
>                 pmd_t dst_pmdval;
>
> --
> 2.49.0
>
