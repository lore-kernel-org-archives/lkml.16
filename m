Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CFB261585
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749636288; cv=none; b=J3WldX2QEkUqXIJCrd3G1FK4tNUPyMkLWEmSeAov0mbFtzUnvuZzkXaLlT/McFLSOpZw6EkYASDosvzVZM8vSJM3l5VjVLgiZFZ2cGnScLMl7fx6Neo8FZ+VniGTcuR20Pj9aO2yWgFiMCzqJA/J+7ayqOKif1acy5ku0b7CGAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749636288; c=relaxed/simple;
	bh=eygzdatRmZsxzC4scaL71MmUug0IM+V3jgBtjET/Lus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxneiKNDEzlBmfDi6lg0Um+K1/4C89WShpkjP/a5ADP/zwnuu/Nx8DBsfnPTQWmLjnntzQx0kYsPC6fsAuHyRPW/CY9IQGNM857q8ZJc5kbKajdpLjlKTMSLRZgSzlf49JYQmTTof9R2tnwEjpu98vxgF8Xn+uRGEby0T5USH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy0gLd7U; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy0gLd7U"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so2494619137.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749636285; x=1750241085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSauKG6wymdqnn8TxZJhdyCnb4cwpHLFj7X9h54mxJQ=;
        b=Gy0gLd7Ua6qaerXafI2wM1R+ToWp65aRegphHjbyI1kM338uG1ExmPmoRZdG43Hxe3
         4DjM9Esqht9/Udr5esmvG1XgasgyAgevscx9p5+kFJSz/bWOorilZLMuKlA0rlY5uzBE
         HkY8mq23TKM47Yb9ms6ht86OjdKguARhk4UOaLqfds63UFRMC8o0wAAvkOhAA36wzd0q
         DKw+/N97KmIYANMqx79zlhR2byaBq87VJYcoFhTO8B4lnyRoo8tJOPIKNJPSEAJAUcFH
         ske+UgUAwvHYhwLFZz6/vAGyW5E9U/rz8JTJWcD3sueVtm2QRMcdmnW85Uhe9VsfT6fP
         D2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749636285; x=1750241085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSauKG6wymdqnn8TxZJhdyCnb4cwpHLFj7X9h54mxJQ=;
        b=fQxQM2lK2QkVTHP604GgvpiN/0KeQv2773TpGuSdK9HUQvHW15cRqdCs6rvGGWnZUL
         4umuvhW1gqSzUkBKzMKhFYNAipydIan/+SEGj/T+N0bNymdi6yJLYtlBhL5w4j80gOyX
         ykAO0j9QeBbYtDK/9aauDtRAVA8ljjpuq38Yud7LwXbl8rxe9UBCvhyLCpxfEYa41fCn
         tivng9giXIA/fT7fqyKHM27rAk8fDo6mCuT2XwFvqNMch5z9rLx4dxQkOSl6X02eCVId
         Gtcae8dcnvUiMCkq/peQKd0YQuYXOX7TqTCMD10Fq2sdXnbbxKjwBEKDsKE+RxTJU+HG
         PWSw==
X-Forwarded-Encrypted: i=1; AJvYcCVwkmmuBWwzX5nQA3c3AfBjc6nTvYDglxbWiz8rFvzQdknRluY91VK3Tj4VA57mjsp1D4JI1C171CD+YCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1ACFAbF6dIelxc1CB30Kl6vomHGz+jXUGFC8WVGSwMkNKzQv
	q2jbaUQnVd0kBE00OC6w3wMd0LegPJBmJVamVrt6m4WKHNIV+dl28cCvNhtdqKDyiBIOBPshTKn
	/0SHABXk1f+lgi2baItdFgQlV7OCNqEY=
X-Gm-Gg: ASbGnculp3q2Cg4W6z+O2U1GPxEjr++eUm4Xk3dsOCx7UKeByAeHF9fHHtkLgwLIrx1
	dmSTeHV1fmk3eL+Jt+qJKaWEONDcssELLQsD6BT4Mdpe/hxePuLoajMuvmVmtlxfXLzXmpZ5vsT
	cD42KECeNZpLjJpUewGf0Np4X5aVOPnQHV6XdZZ+PbUMtQ
X-Google-Smtp-Source: AGHT+IENApZj18vflLJZu2mp+mgbKEd0EYRCG6grkuOBJfsqMVwtlTiso3U8qJdBhO90xK0T8O/lPHtVxpNSBOgHLsU=
X-Received: by 2002:a05:6102:32cc:b0:4e6:df89:66c4 with SMTP id
 ada2fe7eead31-4e7baf1f19fmr2015851137.15.1749636285502; Wed, 11 Jun 2025
 03:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610055920.21323-1-21cnbao@gmail.com> <65c1df74-4e58-4a09-9451-b18dae5adb3f@redhat.com>
In-Reply-To: <65c1df74-4e58-4a09-9451-b18dae5adb3f@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 11 Jun 2025 22:04:34 +1200
X-Gm-Features: AX0GCFsJ-8o8W5846crcjv1G8K2o9qe4u1QSWrMscRGuy7AFGaML7vJka3IwTSk
Message-ID: <CAGsJ_4xz+AO6gF5C=A_K+KhQRjUVN_oqkBETURYdeXN2GzzHsg@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: madvise: use per_vma lock for MADV_FREE
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>, Qi Zheng <zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 7:04=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 10.06.25 07:59, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > MADV_FREE is another option, besides MADV_DONTNEED, for dynamic memory
> > freeing in user-space native or Java heap memory management. For exampl=
e,
> > jemalloc can be configured to use MADV_FREE, and recent versions of the
> > Android Java heap have also increasingly adopted MADV_FREE. Supporting
> > per-VMA locking for MADV_FREE thus appears increasingly necessary.
> >
> > We have replaced walk_page_range() with walk_page_range_vma(). Along wi=
th
> > the proposed madvise_lock_mode by Lorenzo, the necessary infrastructure=
 is
> > now in place to begin exploring per-VMA locking support for MADV_FREE a=
nd
> > potentially other madvise using walk_page_range_vma().
> >
> > This patch adds support for the PGWALK_VMA_RDLOCK walk_lock mode in
> > walk_page_range_vma(), and leverages madvise_lock_mode from
> > madv_behavior to select the appropriate walk_lock=E2=80=94either mmap_l=
ock or
> > per-VMA lock=E2=80=94based on the context.
> >
> > To ensure thread safety, madvise_free_walk_ops is now defined as a stac=
k
> > variable instead of a global constant.
> >
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >   include/linux/pagewalk.h |  2 ++
> >   mm/madvise.c             | 20 ++++++++++++++------
> >   mm/pagewalk.c            |  6 ++++++
> >   3 files changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> > index 9700a29f8afb..a4afa64ef0ab 100644
> > --- a/include/linux/pagewalk.h
> > +++ b/include/linux/pagewalk.h
> > @@ -14,6 +14,8 @@ enum page_walk_lock {
> >       PGWALK_WRLOCK =3D 1,
> >       /* vma is expected to be already write-locked during the walk */
> >       PGWALK_WRLOCK_VERIFY =3D 2,
> > +     /* vma is expected to be already read-locked during the walk */
> > +     PGWALK_VMA_RDLOCK_VERIFY =3D 3,
> >   };
> >
> >   /**
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 381eedde8f6d..23d58eb31c8f 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -775,10 +775,14 @@ static int madvise_free_pte_range(pmd_t *pmd, uns=
igned long addr,
> >       return 0;
> >   }
> >
> > -static const struct mm_walk_ops madvise_free_walk_ops =3D {
> > -     .pmd_entry              =3D madvise_free_pte_range,
> > -     .walk_lock              =3D PGWALK_RDLOCK,
> > -};
> > +static inline enum page_walk_lock get_walk_lock(enum madvise_lock_mode=
 mode)
> > +{
> > +     /* Other modes don't require fixing up the walk_lock. */
> > +     VM_WARN_ON_ONCE(mode !=3D MADVISE_VMA_READ_LOCK &&
> > +                     mode !=3D MADVISE_MMAP_READ_LOCK);
> > +     return mode =3D=3D MADVISE_VMA_READ_LOCK ?
> > +                     PGWALK_VMA_RDLOCK_VERIFY : PGWALK_RDLOCK;
> > +}
> >
> >   static int madvise_free_single_vma(struct madvise_behavior *madv_beha=
vior,
> >                       struct vm_area_struct *vma,
> > @@ -787,6 +791,9 @@ static int madvise_free_single_vma(struct madvise_b=
ehavior *madv_behavior,
> >       struct mm_struct *mm =3D vma->vm_mm;
> >       struct mmu_notifier_range range;
> >       struct mmu_gather *tlb =3D madv_behavior->tlb;
> > +     struct mm_walk_ops walk_ops =3D {
> > +             .pmd_entry              =3D madvise_free_pte_range,
> > +     };
> >
> >       /* MADV_FREE works for only anon vma at the moment */
> >       if (!vma_is_anonymous(vma))
> > @@ -806,8 +813,9 @@ static int madvise_free_single_vma(struct madvise_b=
ehavior *madv_behavior,
> >
> >       mmu_notifier_invalidate_range_start(&range);
> >       tlb_start_vma(tlb, vma);
> > +     walk_ops.walk_lock =3D get_walk_lock(madv_behavior->lock_mode);
> >       walk_page_range_vma(vma, range.start, range.end,
> > -                     &madvise_free_walk_ops, tlb);
> > +                     &walk_ops, tlb);
> >       tlb_end_vma(tlb, vma);
> >       mmu_notifier_invalidate_range_end(&range);
> >       return 0;
> > @@ -1653,7 +1661,6 @@ static enum madvise_lock_mode get_lock_mode(struc=
t madvise_behavior *madv_behavi
> >       case MADV_WILLNEED:
> >       case MADV_COLD:
> >       case MADV_PAGEOUT:
> > -     case MADV_FREE:
> >       case MADV_POPULATE_READ:
> >       case MADV_POPULATE_WRITE:
> >       case MADV_COLLAPSE:
> > @@ -1662,6 +1669,7 @@ static enum madvise_lock_mode get_lock_mode(struc=
t madvise_behavior *madv_behavi
> >               return MADVISE_MMAP_READ_LOCK;
> >       case MADV_DONTNEED:
> >       case MADV_DONTNEED_LOCKED:
> > +     case MADV_FREE:
> >               return MADVISE_VMA_READ_LOCK;
> >       default:
> >               return MADVISE_MMAP_WRITE_LOCK;
> > diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> > index e478777c86e1..c984aacc5552 100644
> > --- a/mm/pagewalk.c
> > +++ b/mm/pagewalk.c
> > @@ -420,6 +420,9 @@ static int __walk_page_range(unsigned long start, u=
nsigned long end,
> >   static inline void process_mm_walk_lock(struct mm_struct *mm,
> >                                       enum page_walk_lock walk_lock)
> >   {
> > +     if (walk_lock =3D=3D PGWALK_VMA_RDLOCK_VERIFY)
> > +             return;
> > +
> >       if (walk_lock =3D=3D PGWALK_RDLOCK)
> >               mmap_assert_locked(mm);
>
> Nit: I'd have converted the "else" into "else if (walk_lock !=3D
> PGWALK_VMA_RDLOCK_VERIFY)

Seems good to me.

>
> >       else
> > @@ -437,6 +440,9 @@ static inline void process_vma_walk_lock(struct vm_=
area_struct *vma,
> >       case PGWALK_WRLOCK_VERIFY:
> >               vma_assert_write_locked(vma);
> >               break;
> > +     case PGWALK_VMA_RDLOCK_VERIFY:
> > +             vma_assert_locked(vma);
> > +             break;
> >       case PGWALK_RDLOCK:
> >               /* PGWALK_RDLOCK is handled by process_mm_walk_lock */
> >               break;
>
> Nothing jumped at me an I think this should be ok
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

>
> --
> Cheers,
>
> David / dhildenb
>
