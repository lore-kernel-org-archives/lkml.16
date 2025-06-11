Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE01261575
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749636200; cv=none; b=Ve0hIW/wkNOUP7rFtA0eo00rms5NdtKWscmZbV4Gzp7viOsyGscm45o5HhwoB1WOOq7oXbD+/Md38ExNDlxb+hpDaMUdjj88rjBnkkr8NsIkf0XDmZssrfxgnOA69ewF92IbXJZYqiuNm16LlGoJDcnsGsAevpWl7iU73Fel68w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749636200; c=relaxed/simple;
	bh=dx+kI/HHtbRBnL7hlfnDH+V7tf9rnXZxAk5VkoQ2t6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KG3Xh2jGcaFrnsqwFFksNPCGKDnThmGLGfFh7VEsXWGeZuK3DnzBpwXKlNwGHW94d4lqi2oZlte16mz9Sju6WzfKxSpU3Je4pIQBDXBU/VAd+ftwwBOr44iHohzmihFZs/y7m5qbMatz1VZFo0FUDIglOhpmiiOL7igR0r/Y3WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3qcs+6P; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3qcs+6P"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e2b5ffb932so2380104137.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749636197; x=1750240997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH2TjfGR3UbJRiCQLXrBI6sqM+KWNI78BUn8bMomgqo=;
        b=J3qcs+6PHEheRQCmVV62x1QkBAhaWI7njE60RKzgy2qJlWAfQBcxbZW1tMVLxHJVO1
         PWyQ0k20EUw01z4xFqC3eKWkDoGujkCIrptNKHzLNboc3OumjYCDbqcVHLBazvm+Cd/M
         uaPADpgBEyu9M3qY9Z3ExzTgeQyrXK8hb07ptis9FmgOHVCh7CSTRYWRY2eElKkU6pvc
         tcKTrVc1W/THhP82L84ZEhQtvIU9kBPWENEElRVie9I/eRm0QbwgTw8ZMEwELwH2uynv
         pTjL+Jm/EPxO2QKduGPyJjZSqSyQUuFQ/C3KIagVK+Kws/7O2X20Yn/JVIrB7xhfKfhX
         0eRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749636197; x=1750240997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RH2TjfGR3UbJRiCQLXrBI6sqM+KWNI78BUn8bMomgqo=;
        b=ZvF+bc7WiCuNyHioS3QRezdL/1IPZ9Uz8y4MU0OppUqsOCet3DvKGaUPqTUW58r7b0
         l11GHTgv+/rYgLfgaqEjNHj4BBXebO3860qXvECYXRRg02MeoFm2pOFljaCevxzcZXgB
         h538wjpGq+0EbckYh8e5vdFLzzy0VjNO7eu9sjmEKnBtiAG1XhoKiOMM904d4YQ8daAu
         eh8QnAN2CoOIZXWcQ3YkrWJh5F0LQNdfAdsy/l5k9cnnvW296QDaA64b9IbIVBQ492f1
         DSdqBpv/vaEF7jHHUUEle+pcVhGtI2nysmU/vMFiHi5PwIIO+bB1xunvDx1ukV62MNRp
         LsiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUs6vkO+Djzk/05d7OaFtL1FGWyPwnARub1nrZq47ZmZJruMRq02h8WlJiQSXdaHUT4xh2wU18nmrJtT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgbOkdyu7jmtSeRQIud6JH2hBgIdU8GugKPH1k1R7QXX1bXnDk
	LvRW0MiOgY1UUFVwCJGtAj1tGCt51RB/ynxJefcrb6+r/1or0gVwaxrFQXxukKwIv6Dlw/kE56U
	vFQmef14tfyoYokwKcmKTxbE7V1gRots=
X-Gm-Gg: ASbGncsEZKd1azIzoqw4fqdq0b+qAamq5LVeNQMn3YM4UUx+ZgUZ35Pgvj0jH7BnRjo
	qNP8yqoBBxEz0B/V4dijGqh5G7AUKyK0ELtWSzlopeBHiHlzRrswQzkXsspJm27s7iSeXHAII43
	3OBaJnu0RlZ4VFzZCoYr/MxyMd8/Juc01AhF5mD5bCyn1t
X-Google-Smtp-Source: AGHT+IHXh8E6knSuG0t51X8INr9lE/unVkRjWkyhv0vgom0Wqv/EOlwQDxrDoUYVQSm8lIH2VhKC4uEnsvjauOp9Rt0=
X-Received: by 2002:a05:6102:6e81:b0:4e7:bf30:da62 with SMTP id
 ada2fe7eead31-4e7bf30db91mr295132137.17.1749636197452; Wed, 11 Jun 2025
 03:03:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610055920.21323-1-21cnbao@gmail.com> <8e3b3a63-9060-4bf9-ad85-3ef5f5d541db@lucifer.local>
In-Reply-To: <8e3b3a63-9060-4bf9-ad85-3ef5f5d541db@lucifer.local>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 11 Jun 2025 22:03:05 +1200
X-Gm-Features: AX0GCFsk0hK52nquwg-KWQo29DcvdDnbM1r_lddEkl2kSzmZx4m-4k_CG0vwSck
Message-ID: <CAGsJ_4wB9=00Ct5W7vvfQprPHB54rX0G-4=ch2PAXCUU0tVJnQ@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: madvise: use per_vma lock for MADV_FREE
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>, Qi Zheng <zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 6:52=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Jun 10, 2025 at 05:59:20PM +1200, Barry Song wrote:
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
>
> Thanks :)
>
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
>
> A nit but I'd add 'because we now dynamically update the walk_ops->walk_l=
ock
> field we must make sure this is thread safe' or something like this to cl=
arify
> the need for this

Sure.

>
> Did we not have to worry about this before I guess because the mmap lock =
would
> exclude other threads?

Probably not. It was a constant, and no one needed to modify it
before, no matter how many threads called MADV_FREE.

>
> An aside, but I wonder if we have this implicit assumption elsewhere that=
 VMA
> locks defeat... hm :)
>
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
>
> Looks good to me, kinda neat how the previous work for the MADV_DONTNEED =
under
> VMA lock stuff made this pretty straightforward :)
>
> So:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks!

>
> > ---
> >  include/linux/pagewalk.h |  2 ++
> >  mm/madvise.c             | 20 ++++++++++++++------
> >  mm/pagewalk.c            |  6 ++++++
> >  3 files changed, 22 insertions(+), 6 deletions(-)
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
> >  };
> >
> >  /**
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 381eedde8f6d..23d58eb31c8f 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -775,10 +775,14 @@ static int madvise_free_pte_range(pmd_t *pmd, uns=
igned long addr,
> >       return 0;
> >  }
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
>
> I find this a bit hard to parse...
>
> > +     return mode =3D=3D MADVISE_VMA_READ_LOCK ?
> > +                     PGWALK_VMA_RDLOCK_VERIFY : PGWALK_RDLOCK;
>
> ...might be better as something like:
>
>         switch (mode) {
>                 case MADVISE_VMA_READ_LOCK:
>                         return PGWALK_VMA_RDLOCK_VERIFY;
>                 case MADVISE_MMAP_READ_LOCK:
>                         return PGWALK_RDLOCK;
>                 default:
>                         /* Invalid. */
>                         WARN_ON_ONCE(1);
>                         return PGWALK_RDLOCK;
>         }

I actually tried both before sending and, for some reason, preferred
the one I sent. But I'm totally happy to go with whichever approach
you prefer:-)

>
> > +}
> >
> >  static int madvise_free_single_vma(struct madvise_behavior *madv_behav=
ior,
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
> >  static inline void process_mm_walk_lock(struct mm_struct *mm,
> >                                       enum page_walk_lock walk_lock)
> >  {
> > +     if (walk_lock =3D=3D PGWALK_VMA_RDLOCK_VERIFY)
> > +             return;
> > +
> >       if (walk_lock =3D=3D PGWALK_RDLOCK)
> >               mmap_assert_locked(mm);
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
> > --
> > 2.39.3 (Apple Git-146)
> >

Thanks
Barry
