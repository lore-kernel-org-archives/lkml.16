Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1392290BC3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048000; cv=none; b=CfDlgjC8TdN0FEsoiqPbBHLhb1qkY9QoA9VUAwAXJ5Q5pMCY0RgMGgI4RRXY32KgB27rYCYuaiUz3Vnzp+5mAO19pauT5ncGKwJ2sCeDkISsE6brMO0rNtpGcZcWhfJFB+IOR71oBFAjGajvsbXXiKlRgt1eQE8xlJrfUImYvuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048000; c=relaxed/simple;
	bh=/xowjaYSwrcNAVTz/1+MHUlbdruelf01vjOxRPujSrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVqwrAVH/hGAcc9D2qXAV4c/HK1Zz7ADm6vAAh4P3zEpTmRTSjeXAsg5RtV4/gPcW4R4pyXDyMLHguXL0lwYZaqkWhQMV6LQWbKwBZwHuaksUq84+5PtPwJavOggwypRtVBvfUQwCmzYeP1HN2bumhS5gaVtkTNdutIkVISiPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zTp8iLqG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zTp8iLqG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so9920a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749047997; x=1749652797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFSaiArb5JlS4rKdNQDLgny0OyxB393pGHWtf5taMQ4=;
        b=zTp8iLqGIBNLgGU256hNV8UPvy/c+qKMY3d8dDPzLOTU1gi3oySDgqpJDeKt0KMWYQ
         HkcZE+JLVVudh6gMObDMfymoJaMUzuKv7pyk4wKeeTI38LI/JqXomGZpNbxLBYjy4LCM
         aX9h3nzy93rQPPC2pyrVF+ybUi/ZmsTga4D7Fe8OE0E/lOwy/2LIVpRIq1pLRjKV9A3S
         KMTjKS0q4kuel6FVJRDwoS1Yr3BkWrUxeYreE1i6PtfF5b01HaPIQQI/RbxECmnZhu1S
         Adlce6NCG6SM1raT+Kn98MNLKbzvLFCpGlcAr+nJa4P3Mo6UTqZcbpjLtMv+NScn2YE3
         nGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749047997; x=1749652797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFSaiArb5JlS4rKdNQDLgny0OyxB393pGHWtf5taMQ4=;
        b=YmkfL1zPMiqbPvVGVJzArINaPcgM0X1YBlB8bwGeeUmIRX/gClmRfCIF+mAHwf51nm
         a1soyrWziaYUtAQPRkeTmtcFFyx6v5PSeIQvXm+z/HCFeEKE8HzfGZijFrPoxOVajbfE
         naNA5ceIgurVr5KclBDE+rtdClXqsPeCSK/59dQTgMDZe8ofpxTQsaXjF3883ebxOJWA
         KgfM13ur8T/ERfWGULwqOoQT8sXfcMlZEOdq9iNIEH7jwmsZhP64eBtYTSwSNgdbSa1g
         DSuxnoQzEpBlSSoMXEktNZckUqR5N6Dg8JqpuiEPBx6kGgMyOlQ0hXAI+coOB8XVT+Dc
         +lfg==
X-Forwarded-Encrypted: i=1; AJvYcCUuRfraCokxbEAImSn3b8z9nbqiVDFV7nrzlXLyff7CXCzNWwxNt+36C0Mwz14L4ePF87S6tyskWs68M+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfnyp03zXzI1VQCkF4gpKbI7iiRDqE8EeMbjyCEHqaZL6CvcPn
	P3a7S0ALrXgBfOvrxHua87yFp0E4rnXFCL3dj1Rcp7eQSoz9u+NUo21VEtJmGuNSwDLPT9bWpAq
	ss5CD2+iJw6k6wVf0dbe9ybwI6MH8yxZ7v29SvWs7
X-Gm-Gg: ASbGncs9zc17cMthhjy8wlddbBqxnGdR5c4Wwh+yV/wohx5SofHM7jwz95lSrU2jBrk
	Wd5YpoqjStcmqUv7lPcVfxVlmSbrS2ZxwXItPDstaN95vG7XnNyqGNymz9SNbvQ7U0/maxh9YfX
	Yk87dcMSSOvVCKRJy9RM7m/jBA2VNqtABDE/RG9iZ3l2tAK+ejbQ/cjzQeYXWQaN1ZuIRueXMT
X-Google-Smtp-Source: AGHT+IFe67h9c8KQL1yClqkdMmIaa6YJ4wH8M7vVp7rH287AK15LYvq5zc0Wx87dYgNK+3JMBzj2Ni08hl8HmHGq0vk=
X-Received: by 2002:aa7:d6cd:0:b0:602:3bf:ce73 with SMTP id
 4fb4d7f45d1cf-606ee31b340mr85155a12.1.1749047995780; Wed, 04 Jun 2025
 07:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 4 Jun 2025 07:39:41 -0700
X-Gm-Features: AX0GCFvLFvrZnFxiBvsumrroa9R0gCS-F75JDJtm-veAoC59HniL7QD93_4kkCc
Message-ID: <CAJuCfpH-KmYX57WEj+OTVGQKaY4GXvktZAc9Q9MnZmtgQ8tdKQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Jann Horn <jannh@google.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 7:21=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> The walk_page_range_novma() function is rather confusing - it supports tw=
o
> modes, one used often, the other used only for debugging.
>
> The first mode is the common case of traversal of kernel page tables, whi=
ch
> is what nearly all callers use this for.
>
> Secondly it provides an unusual debugging interface that allows for the
> traversal of page tables in a userland range of memory even for that memo=
ry
> which is not described by a VMA.
>
> It is far from certain that such page tables should even exist, but perha=
ps
> this is precisely why it is useful as a debugging mechanism.
>
> As a result, this is utilised by ptdump only. Historically, things were
> reversed - ptdump was the only user, and other parts of the kernel evolve=
d
> to use the kernel page table walking here.
>
> Since we have some complicated and confusing locking rules for the novma
> case, it makes sense to separate the two usages into their own functions.
>
> Doing this also provide self-documentation as to the intent of the caller=
 -
> are they doing something rather unusual or are they simply doing a standa=
rd
> kernel page table walk?
>
> We therefore establish two separate functions - walk_page_range_debug() f=
or
> this single usage, and walk_kernel_page_table_range() for general kernel
> page table walking.
>
> We additionally make walk_page_range_debug() internal to mm.
>
> Note that ptdump uses the precise same function for kernel walking as a
> convenience, so we permit this but make it very explicit by having
> walk_page_range_novma() invoke walk_kernel_page_table_range() in this cas=
e.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
> v2:
> * Renamed walk_page_range_novma() to walk_page_range_debug() as per David=
.
> * Moved walk_page_range_debug() definition to mm/internal.h as per Mike.
> * Renamed walk_page_range_kernel() to walk_kernel_page_table_range() as
>   per David.
>
> v1 resend:
> * Actually cc'd lists...
> * Fixed mistake in walk_page_range_novma() not handling kernel mappings a=
nd
>   update commit message to referene.
> * Added Mike's off-list Acked-by.
> * Fixed up comments as per Mike.
> * Add some historic flavour to the commit message as per Mike.
> https://lore.kernel.org/all/20250603192213.182931-1-lorenzo.stoakes@oracl=
e.com/
>
> v1:
> (accidentally sent off-list due to error in scripting)
>
>  arch/loongarch/mm/pageattr.c |  2 +-
>  arch/openrisc/kernel/dma.c   |  4 +-
>  arch/riscv/mm/pageattr.c     |  8 +--
>  include/linux/pagewalk.h     |  7 ++-
>  mm/hugetlb_vmemmap.c         |  2 +-
>  mm/internal.h                |  4 ++
>  mm/pagewalk.c                | 98 ++++++++++++++++++++++++------------
>  mm/ptdump.c                  |  3 +-
>  8 files changed, 82 insertions(+), 46 deletions(-)
>
> diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
> index 99165903908a..f5e910b68229 100644
> --- a/arch/loongarch/mm/pageattr.c
> +++ b/arch/loongarch/mm/pageattr.c
> @@ -118,7 +118,7 @@ static int __set_memory(unsigned long addr, int numpa=
ges, pgprot_t set_mask, pgp
>                 return 0;
>
>         mmap_write_lock(&init_mm);
> -       ret =3D walk_page_range_novma(&init_mm, start, end, &pageattr_ops=
, NULL, &masks);
> +       ret =3D walk_kernel_page_table_range(start, end, &pageattr_ops, N=
ULL, &masks);
>         mmap_write_unlock(&init_mm);
>
>         flush_tlb_kernel_range(start, end);
> diff --git a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c
> index 3a7b5baaa450..af932a4ad306 100644
> --- a/arch/openrisc/kernel/dma.c
> +++ b/arch/openrisc/kernel/dma.c
> @@ -72,7 +72,7 @@ void *arch_dma_set_uncached(void *cpu_addr, size_t size=
)
>          * them and setting the cache-inhibit bit.
>          */
>         mmap_write_lock(&init_mm);
> -       error =3D walk_page_range_novma(&init_mm, va, va + size,
> +       error =3D walk_kernel_page_table_range(va, va + size,
>                         &set_nocache_walk_ops, NULL, NULL);
>         mmap_write_unlock(&init_mm);
>
> @@ -87,7 +87,7 @@ void arch_dma_clear_uncached(void *cpu_addr, size_t siz=
e)
>
>         mmap_write_lock(&init_mm);
>         /* walk_page_range shouldn't be able to fail here */
> -       WARN_ON(walk_page_range_novma(&init_mm, va, va + size,
> +       WARN_ON(walk_kernel_page_table_range(va, va + size,
>                         &clear_nocache_walk_ops, NULL, NULL));
>         mmap_write_unlock(&init_mm);
>  }
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index d815448758a1..3f76db3d2769 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -299,7 +299,7 @@ static int __set_memory(unsigned long addr, int numpa=
ges, pgprot_t set_mask,
>                         if (ret)
>                                 goto unlock;
>
> -                       ret =3D walk_page_range_novma(&init_mm, lm_start,=
 lm_end,
> +                       ret =3D walk_kernel_page_table_range(lm_start, lm=
_end,
>                                                     &pageattr_ops, NULL, =
&masks);
>                         if (ret)
>                                 goto unlock;
> @@ -317,13 +317,13 @@ static int __set_memory(unsigned long addr, int num=
pages, pgprot_t set_mask,
>                 if (ret)
>                         goto unlock;
>
> -               ret =3D walk_page_range_novma(&init_mm, lm_start, lm_end,
> +               ret =3D walk_kernel_page_table_range(lm_start, lm_end,
>                                             &pageattr_ops, NULL, &masks);
>                 if (ret)
>                         goto unlock;
>         }
>
> -       ret =3D  walk_page_range_novma(&init_mm, start, end, &pageattr_op=
s, NULL,
> +       ret =3D  walk_kernel_page_table_range(start, end, &pageattr_ops, =
NULL,
>                                      &masks);
>
>  unlock:
> @@ -335,7 +335,7 @@ static int __set_memory(unsigned long addr, int numpa=
ges, pgprot_t set_mask,
>          */
>         flush_tlb_all();
>  #else
> -       ret =3D  walk_page_range_novma(&init_mm, start, end, &pageattr_op=
s, NULL,
> +       ret =3D  walk_kernel_page_table_range(start, end, &pageattr_ops, =
NULL,
>                                      &masks);
>
>         mmap_write_unlock(&init_mm);
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index 9700a29f8afb..8ac2f6d6d2a3 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -129,10 +129,9 @@ struct mm_walk {
>  int walk_page_range(struct mm_struct *mm, unsigned long start,
>                 unsigned long end, const struct mm_walk_ops *ops,
>                 void *private);
> -int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
> -                         unsigned long end, const struct mm_walk_ops *op=
s,
> -                         pgd_t *pgd,
> -                         void *private);
> +int walk_kernel_page_table_range(unsigned long start,
> +               unsigned long end, const struct mm_walk_ops *ops,
> +               pgd_t *pgd, void *private);
>  int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
>                         unsigned long end, const struct mm_walk_ops *ops,
>                         void *private);
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 27245e86df25..ba0fb1b6a5a8 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -166,7 +166,7 @@ static int vmemmap_remap_range(unsigned long start, u=
nsigned long end,
>         VM_BUG_ON(!PAGE_ALIGNED(start | end));
>
>         mmap_read_lock(&init_mm);
> -       ret =3D walk_page_range_novma(&init_mm, start, end, &vmemmap_rema=
p_ops,
> +       ret =3D walk_kernel_page_table_range(start, end, &vmemmap_remap_o=
ps,
>                                     NULL, walk);
>         mmap_read_unlock(&init_mm);
>         if (ret)
> diff --git a/mm/internal.h b/mm/internal.h
> index 6b8ed2017743..43788d0de6e3 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1605,6 +1605,10 @@ static inline void accept_page(struct page *page)
>  int walk_page_range_mm(struct mm_struct *mm, unsigned long start,
>                 unsigned long end, const struct mm_walk_ops *ops,
>                 void *private);
> +int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
> +                         unsigned long end, const struct mm_walk_ops *op=
s,
> +                         pgd_t *pgd,
> +                         void *private);
>
>  /* pt_reclaim.c */
>  bool try_get_and_clear_pmd(struct mm_struct *mm, pmd_t *pmd, pmd_t *pmdv=
al);
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e478777c86e1..057a125c3bc0 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -584,9 +584,28 @@ int walk_page_range(struct mm_struct *mm, unsigned l=
ong start,
>         return walk_page_range_mm(mm, start, end, ops, private);
>  }
>
> +static int __walk_page_range_novma(struct mm_struct *mm, unsigned long s=
tart,
> +               unsigned long end, const struct mm_walk_ops *ops,
> +               pgd_t *pgd, void *private)
> +{
> +       struct mm_walk walk =3D {
> +               .ops            =3D ops,
> +               .mm             =3D mm,
> +               .pgd            =3D pgd,
> +               .private        =3D private,
> +               .no_vma         =3D true
> +       };
> +
> +       if (start >=3D end || !walk.mm)
> +               return -EINVAL;
> +       if (!check_ops_valid(ops))
> +               return -EINVAL;
> +
> +       return walk_pgd_range(start, end, &walk);
> +}
> +
>  /**
> - * walk_page_range_novma - walk a range of pagetables not backed by a vm=
a
> - * @mm:                mm_struct representing the target process of page=
 table walk
> + * walk_kernel_page_table_range - walk a range of kernel pagetables.
>   * @start:     start address of the virtual address range
>   * @end:       end address of the virtual address range
>   * @ops:       operation to call during the walk
> @@ -596,56 +615,69 @@ int walk_page_range(struct mm_struct *mm, unsigned =
long start,
>   * Similar to walk_page_range() but can walk any page tables even if the=
y are
>   * not backed by VMAs. Because 'unusual' entries may be walked this func=
tion
>   * will also not lock the PTEs for the pte_entry() callback. This is use=
ful for
> - * walking the kernel pages tables or page tables for firmware.
> + * walking kernel pages tables or page tables for firmware.
>   *
>   * Note: Be careful to walk the kernel pages tables, the caller may be n=
eed to
>   * take other effective approaches (mmap lock may be insufficient) to pr=
event
>   * the intermediate kernel page tables belonging to the specified addres=
s range
>   * from being freed (e.g. memory hot-remove).
>   */
> -int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
> +int walk_kernel_page_table_range(unsigned long start, unsigned long end,
> +               const struct mm_walk_ops *ops, pgd_t *pgd, void *private)
> +{
> +       struct mm_struct *mm =3D &init_mm;
> +
> +       /*
> +        * Kernel intermediate page tables are usually not freed, so the =
mmap
> +        * read lock is sufficient. But there are some exceptions.
> +        * E.g. memory hot-remove. In which case, the mmap lock is insuff=
icient
> +        * to prevent the intermediate kernel pages tables belonging to t=
he
> +        * specified address range from being freed. The caller should ta=
ke
> +        * other actions to prevent this race.
> +        */
> +       mmap_assert_locked(mm);
> +
> +       return __walk_page_range_novma(mm, start, end, ops, pgd, private)=
;
> +}
> +
> +/**
> + * walk_page_range_debug - walk a range of pagetables not backed by a vm=
a
> + * @mm:                mm_struct representing the target process of page=
 table walk
> + * @start:     start address of the virtual address range
> + * @end:       end address of the virtual address range
> + * @ops:       operation to call during the walk
> + * @pgd:       pgd to walk if different from mm->pgd
> + * @private:   private data for callbacks' usage
> + *
> + * Similar to walk_page_range() but can walk any page tables even if the=
y are
> + * not backed by VMAs. Because 'unusual' entries may be walked this func=
tion
> + * will also not lock the PTEs for the pte_entry() callback.
> + *
> + * This is for debugging purposes ONLY.
> + */
> +int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
>                           unsigned long end, const struct mm_walk_ops *op=
s,
>                           pgd_t *pgd,
>                           void *private)
>  {
> -       struct mm_walk walk =3D {
> -               .ops            =3D ops,
> -               .mm             =3D mm,
> -               .pgd            =3D pgd,
> -               .private        =3D private,
> -               .no_vma         =3D true
> -       };
> -
> -       if (start >=3D end || !walk.mm)
> -               return -EINVAL;
> -       if (!check_ops_valid(ops))
> -               return -EINVAL;
> +       /*
> +        * For convenience, we allow this function to also traverse kerne=
l
> +        * mappings.
> +        */
> +       if (mm =3D=3D &init_mm)
> +               return walk_kernel_page_table_range(start, end, ops, pgd,=
 private);
>
>         /*
> -        * 1) For walking the user virtual address space:
> -        *
>          * The mmap lock protects the page walker from changes to the pag=
e
>          * tables during the walk.  However a read lock is insufficient t=
o
>          * protect those areas which don't have a VMA as munmap() detache=
s
>          * the VMAs before downgrading to a read lock and actually tearin=
g
>          * down PTEs/page tables. In which case, the mmap write lock shou=
ld
> -        * be hold.
> -        *
> -        * 2) For walking the kernel virtual address space:
> -        *
> -        * The kernel intermediate page tables usually do not be freed, s=
o
> -        * the mmap map read lock is sufficient. But there are some excep=
tions.
> -        * E.g. memory hot-remove. In which case, the mmap lock is insuff=
icient
> -        * to prevent the intermediate kernel pages tables belonging to t=
he
> -        * specified address range from being freed. The caller should ta=
ke
> -        * other actions to prevent this race.
> +        * be held.
>          */
> -       if (mm =3D=3D &init_mm)
> -               mmap_assert_locked(walk.mm);
> -       else
> -               mmap_assert_write_locked(walk.mm);
> +       mmap_assert_write_locked(mm);
>
> -       return walk_pgd_range(start, end, &walk);
> +       return __walk_page_range_novma(mm, start, end, ops, pgd, private)=
;
>  }
>
>  int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 9374f29cdc6f..61a352aa12ed 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -4,6 +4,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/ptdump.h>
>  #include <linux/kasan.h>
> +#include "internal.h"
>
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>  /*
> @@ -177,7 +178,7 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct =
mm_struct *mm, pgd_t *pgd)
>
>         mmap_write_lock(mm);
>         while (range->start !=3D range->end) {
> -               walk_page_range_novma(mm, range->start, range->end,
> +               walk_page_range_debug(mm, range->start, range->end,
>                                       &ptdump_ops, pgd, st);
>                 range++;
>         }
> --
> 2.49.0
