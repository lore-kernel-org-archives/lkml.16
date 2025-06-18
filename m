Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D51A27F73B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241501; cv=none; b=jde8VZsRVGpMG5q3i9fwUk3LMCAgFMpduxE64F6F0dFDJ8BUw0iLWNr+KMuv1JkjR9QLuKBTl+5bKeIK+VRrc1BM5KkqMONKsStJSsMZnLxZYCAX9we0NY+efF44JHVBsI90ktJZ61Qa+Xal2ST0iEHqkni1EB8RrLPlwu6WNis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241501; c=relaxed/simple;
	bh=MX+b1siuJg6EB6yvdHhoK+Kqrr0TTKrw5Skkvm+0T4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZTJtMvqdagBaOj7adh9vcYYvPhGvM9t3EaNCtfEdIjoRTjRcROwINsMmhFPnwoSiBiedJJVUWqL9C1ZaGJXlp/tBzk3cuZN+KzmEDEE2OtUY6ikljzBoNESk+OB1l2HnzTIJY4c+nlwYrEyHcgWBPv3hvBnvny3nrvotFD4YTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkR4IY7m; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkR4IY7m"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87edd8f4e9fso1212953241.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750241498; x=1750846298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vrp7i+AfDkHRc5AuzlDsWI51xwZNRpHNEaxonjwFLuM=;
        b=KkR4IY7mzFU/NYuspJEBWDNa2eeeoTkDCkmZqNmhF81QVLTEH1qwHHCqMwpM1tUZXp
         wLIBXIjAX4XRsZXvLs1Qv76aMgrSjKayAPjysZsgwZEzJPyLoPrCPWzjR9v5FYnfIddk
         heN8eTKWHSq8T2gkhGlPVT/C0PoQgYgyrcJ+GY4jBM+MKL7Dk4werx5DPxacIgNJpfzj
         9S/o3YnBPiowMY3r0RobKzYQMU9vuaJ7+mh9wAaxpcltz8atMlbfi9Xt8opbhZDTPktI
         c1fNzbQ1IHro2ee90O749lEfBw19Dkzj4qL/t+2v9k/ezhpT0enMqg3gzAloCLyyi1Dc
         aA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750241498; x=1750846298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vrp7i+AfDkHRc5AuzlDsWI51xwZNRpHNEaxonjwFLuM=;
        b=DIJ1K5R1VDNV4WtpnCbMpFyFokfH3wupS+o4oj3V8qEpoNYMDO+vkCFbC33QkDGL/Y
         Q3zkD71xAamLCiI068cCEpOALknf9myjZxbYpShcxzTc57XaTCLGVqkWQEUBWTYkuCba
         ziblyZbuWfQq6WIOXSYXdPwANvFtAXshDYu9p9tHC6OJGZDwn4jswNK0tL0icWKan/Ns
         xXd6MSvm/XSm9RXnBfAlwV4BRBEZlOrxEe8xppGY8GOAOtOSNcxrrc/aFs469TyLtlYK
         tld1UpUpuUOYQIDiNPG6U0Jc3NBjestCzNhGBqzX47Z3d0JbcUkOOv6W9XJ+kCkozoAB
         O5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVns52+ENik0tDThBKs6izKZiM3D5mIjEvsvr97NZewNj4sk5Cyv9O9cI6ILnIARQUrLnuJ9JjFheS8SXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcR0bbphMjjDzSnO2TqJkCFxpIS/uuLbAN5mWF5HuT1k3obKOZ
	chmqwNGs5LeOvqvqJuMl1zt2ID201cD8imxFsmh6BO8gBleJDE3rVs/BLUcvErBay/L8gh8woNU
	rd36vQSDIxauByWlayPH7x9Vp7fuNdDU=
X-Gm-Gg: ASbGncsCKGXu1QVoewYylRl1MWOiR8/o6tXVuB6uT/W2tm6jmPhFLDlKMFo/iCEvfWB
	2HsCgem1lM3oj0fcFfAB5i49EzseTEurfeZoIjrjSs2QHBS/S4MVXVpN+cW3YDCABpX9yTadjSu
	mlMedU6bc6xKgAGmyd1tX+920gZ7k2qz6XmJXubZ8GoG+QuMgL1+gLHQ==
X-Google-Smtp-Source: AGHT+IH98mof/2HzWIONeLNaZjvdKauwTxNOUIDWlrk4q1afMz4rxZckPmNZF9XIG8qY1g6jFh6db6wmygytHif9HDE=
X-Received: by 2002:a05:6102:6e8d:b0:4e9:9659:3a5f with SMTP id
 ada2fe7eead31-4e99659460fmr819783137.10.1750241498165; Wed, 18 Jun 2025
 03:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607220150.2980-1-21cnbao@gmail.com> <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
In-Reply-To: <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 18 Jun 2025 18:11:26 +0800
X-Gm-Features: Ac12FXwR8dvbs_c8yh3Ekh2UjKBZKtUF1-gWTbW9Cz4Yyz3s5yGhCbOIQDU7SFA
Message-ID: <CAGsJ_4yPg2AOxjorD3RPyu=Ko+7gpU1=-XWqQohvLWgGrzAEDQ@mail.gmail.com>
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 9:39=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> +cc Lance
>
> Hi Barry,
>
> This needs a quick fixpatch, as discovered by Lance in [0], which I did a=
n
> analysis on [1].
>
> Basically, _theoretically_ though not currently in practice, we might end=
 up
> accessing uninitialised state in the struct vm_area_struct **prev value p=
assed
> around madvise.
>
> The solution for now is to simply initialise it in the VMA read lock case=
, as
> all users of this set *prev =3D vma prior to performing the operation.
>
> Cheers, Lorenzo
>
> [0]: https://lore.kernel.org/all/20250617020544.57305-1-lance.yang@linux.=
dev/
> [1]: https://lore.kernel.org/all/6181fd25-6527-4cd0-b67f-2098191d262d@luc=
ifer.local/
>
> On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > frequently than other madvise options, particularly in native and Java
> > heaps for dynamic memory management.
> >
> > Currently, the mmap_lock is always held during these operations, even w=
hen
> > unnecessary. This causes lock contention and can lead to severe priorit=
y
> > inversion, where low-priority threads=E2=80=94such as Android's HeapTas=
kDaemon=E2=80=94
> > hold the lock and block higher-priority threads.
> >
> > This patch enables the use of per-VMA locks when the advised range lies
> > entirely within a single VMA, avoiding the need for full VMA traversal.=
 In
> > practice, userspace heaps rarely issue MADV_DONTNEED across multiple VM=
As.
> >
> > Tangquan=E2=80=99s testing shows that over 99.5% of memory reclaimed by=
 Android
> > benefits from this per-VMA lock optimization. After extended runtime,
> > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> > only 1,231 fell back to mmap_lock.
> >
> > To simplify handling, the implementation falls back to the standard
> > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity=
 of
> > userfaultfd_remove().
> >
> > Many thanks to Lorenzo's work[1] on:
> > "Refactor the madvise() code to retain state about the locking mode
> > utilised for traversing VMAs.
> >
> > Then use this mechanism to permit VMA locking to be done later in the
> > madvise() logic and also to allow altering of the locking mode to permi=
t
> > falling back to an mmap read lock if required."
> >
> > One important point, as pointed out by Jann[2], is that
> > untagged_addr_remote() requires holding mmap_lock. This is because
> > address tagging on x86 and RISC-V is quite complex.
> >
> > Until untagged_addr_remote() becomes atomic=E2=80=94which seems unlikel=
y in
> > the near future=E2=80=94we cannot support per-VMA locks for remote proc=
esses.
> > So for now, only local processes are supported.
> >
> > Link: https://lore.kernel.org/all/0b96ce61-a52c-4036-b5b6-5c50783db51f@=
lucifer.local/ [1]
> > Link: https://lore.kernel.org/all/CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJC=
Uw48bsjk4bbEkA@mail.gmail.com/ [2]
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >  -v4:
> >  * collect Lorenzo's RB;
> >  * use visit() for per-vma path
> >
> >  mm/madvise.c | 195 ++++++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 147 insertions(+), 48 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 56d9ca2557b9..8382614b71d1 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -48,38 +48,19 @@ struct madvise_walk_private {
> >       bool pageout;
> >  };
> >
> > +enum madvise_lock_mode {
> > +     MADVISE_NO_LOCK,
> > +     MADVISE_MMAP_READ_LOCK,
> > +     MADVISE_MMAP_WRITE_LOCK,
> > +     MADVISE_VMA_READ_LOCK,
> > +};
> > +
> >  struct madvise_behavior {
> >       int behavior;
> >       struct mmu_gather *tlb;
> > +     enum madvise_lock_mode lock_mode;
> >  };
> >
> > -/*
> > - * Any behaviour which results in changes to the vma->vm_flags needs t=
o
> > - * take mmap_lock for writing. Others, which simply traverse vmas, nee=
d
> > - * to only take it for reading.
> > - */
> > -static int madvise_need_mmap_write(int behavior)
> > -{
> > -     switch (behavior) {
> > -     case MADV_REMOVE:
> > -     case MADV_WILLNEED:
> > -     case MADV_DONTNEED:
> > -     case MADV_DONTNEED_LOCKED:
> > -     case MADV_COLD:
> > -     case MADV_PAGEOUT:
> > -     case MADV_FREE:
> > -     case MADV_POPULATE_READ:
> > -     case MADV_POPULATE_WRITE:
> > -     case MADV_COLLAPSE:
> > -     case MADV_GUARD_INSTALL:
> > -     case MADV_GUARD_REMOVE:
> > -             return 0;
> > -     default:
> > -             /* be safe, default to 1. list exceptions explicitly */
> > -             return 1;
> > -     }
> > -}
> > -
> >  #ifdef CONFIG_ANON_VMA_NAME
> >  struct anon_vma_name *anon_vma_name_alloc(const char *name)
> >  {
> > @@ -1486,6 +1467,44 @@ static bool process_madvise_remote_valid(int beh=
avior)
> >       }
> >  }
> >
> > +/*
> > + * Try to acquire a VMA read lock if possible.
> > + *
> > + * We only support this lock over a single VMA, which the input range =
must
> > + * span either partially or fully.
> > + *
> > + * This function always returns with an appropriate lock held. If a VM=
A read
> > + * lock could be acquired, we return the locked VMA.
> > + *
> > + * If a VMA read lock could not be acquired, we return NULL and expect=
 caller to
> > + * fallback to mmap lock behaviour.
> > + */
> > +static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> > +             struct madvise_behavior *madv_behavior,
> > +             unsigned long start, unsigned long end)
> > +{
> > +     struct vm_area_struct *vma;
> > +
> > +     vma =3D lock_vma_under_rcu(mm, start);
> > +     if (!vma)
> > +             goto take_mmap_read_lock;
> > +     /*
> > +      * Must span only a single VMA; uffd and remote processes are
> > +      * unsupported.
> > +      */
> > +     if (end > vma->vm_end || current->mm !=3D mm ||
> > +         userfaultfd_armed(vma)) {
> > +             vma_end_read(vma);
> > +             goto take_mmap_read_lock;
> > +     }
> > +     return vma;
> > +
> > +take_mmap_read_lock:
> > +     mmap_read_lock(mm);
> > +     madv_behavior->lock_mode =3D MADVISE_MMAP_READ_LOCK;
> > +     return NULL;
> > +}
> > +
> >  /*
> >   * Walk the vmas in range [start,end), and call the visit function on =
each one.
> >   * The visit function will get start and end parameters that cover the=
 overlap
> > @@ -1496,7 +1515,8 @@ static bool process_madvise_remote_valid(int beha=
vior)
> >   */
> >  static
> >  int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > -                   unsigned long end, void *arg,
> > +                   unsigned long end, struct madvise_behavior *madv_be=
havior,
> > +                   void *arg,
> >                     int (*visit)(struct vm_area_struct *vma,
> >                                  struct vm_area_struct **prev, unsigned=
 long start,
> >                                  unsigned long end, void *arg))
> > @@ -1505,6 +1525,20 @@ int madvise_walk_vmas(struct mm_struct *mm, unsi=
gned long start,
> >       struct vm_area_struct *prev;
> >       unsigned long tmp;
> >       int unmapped_error =3D 0;
> > +     int error;
> > +
> > +     /*
> > +      * If VMA read lock is supported, apply madvise to a single VMA
> > +      * tentatively, avoiding walking VMAs.
> > +      */
> > +     if (madv_behavior && madv_behavior->lock_mode =3D=3D MADVISE_VMA_=
READ_LOCK) {
> > +             vma =3D try_vma_read_lock(mm, madv_behavior, start, end);
> > +             if (vma) {
> > +                     error =3D visit(vma, &prev, start, end, arg);
> > +                     vma_end_read(vma);
> > +                     return error;
> > +             }
> > +     }
> >
> >       /*
> >        * If the interval [start,end) covers some unmapped address
> > @@ -1516,8 +1550,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsig=
ned long start,
> >               prev =3D vma;
> >
> >       for (;;) {
> > -             int error;
> > -
> >               /* Still start < end. */
> >               if (!vma)
> >                       return -ENOMEM;
> > @@ -1598,34 +1630,86 @@ int madvise_set_anon_name(struct mm_struct *mm,=
 unsigned long start,
> >       if (end =3D=3D start)
> >               return 0;
> >
> > -     return madvise_walk_vmas(mm, start, end, anon_name,
> > +     return madvise_walk_vmas(mm, start, end, NULL, anon_name,
> >                                madvise_vma_anon_name);
> >  }
> >  #endif /* CONFIG_ANON_VMA_NAME */
> >
> > -static int madvise_lock(struct mm_struct *mm, int behavior)
> > +
> > +/*
> > + * Any behaviour which results in changes to the vma->vm_flags needs t=
o
> > + * take mmap_lock for writing. Others, which simply traverse vmas, nee=
d
> > + * to only take it for reading.
> > + */
> > +static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *m=
adv_behavior)
> >  {
> > +     int behavior =3D madv_behavior->behavior;
> > +
> >       if (is_memory_failure(behavior))
> > -             return 0;
> > +             return MADVISE_NO_LOCK;
> >
> > -     if (madvise_need_mmap_write(behavior)) {
> > +     switch (behavior) {
> > +     case MADV_REMOVE:
> > +     case MADV_WILLNEED:
> > +     case MADV_COLD:
> > +     case MADV_PAGEOUT:
> > +     case MADV_FREE:
> > +     case MADV_POPULATE_READ:
> > +     case MADV_POPULATE_WRITE:
> > +     case MADV_COLLAPSE:
> > +     case MADV_GUARD_INSTALL:
> > +     case MADV_GUARD_REMOVE:
> > +             return MADVISE_MMAP_READ_LOCK;
> > +     case MADV_DONTNEED:
> > +     case MADV_DONTNEED_LOCKED:
> > +             return MADVISE_VMA_READ_LOCK;
> > +     default:
> > +             return MADVISE_MMAP_WRITE_LOCK;
> > +     }
> > +}
> > +
> > +static int madvise_lock(struct mm_struct *mm,
> > +             struct madvise_behavior *madv_behavior)
> > +{
> > +     enum madvise_lock_mode lock_mode =3D get_lock_mode(madv_behavior)=
;
> > +
> > +     switch (lock_mode) {
> > +     case MADVISE_NO_LOCK:
> > +             break;
> > +     case MADVISE_MMAP_WRITE_LOCK:
> >               if (mmap_write_lock_killable(mm))
> >                       return -EINTR;
> > -     } else {
> > +             break;
> > +     case MADVISE_MMAP_READ_LOCK:
> >               mmap_read_lock(mm);
> > +             break;
> > +     case MADVISE_VMA_READ_LOCK:
> > +             /* We will acquire the lock per-VMA in madvise_walk_vmas(=
). */
> > +             break;
> >       }
> > +
> > +     madv_behavior->lock_mode =3D lock_mode;
> >       return 0;
> >  }
> >
> > -static void madvise_unlock(struct mm_struct *mm, int behavior)
> > +static void madvise_unlock(struct mm_struct *mm,
> > +             struct madvise_behavior *madv_behavior)
> >  {
> > -     if (is_memory_failure(behavior))
> > +     switch (madv_behavior->lock_mode) {
> > +     case  MADVISE_NO_LOCK:
> >               return;
> > -
> > -     if (madvise_need_mmap_write(behavior))
> > +     case MADVISE_MMAP_WRITE_LOCK:
> >               mmap_write_unlock(mm);
> > -     else
> > +             break;
> > +     case MADVISE_MMAP_READ_LOCK:
> >               mmap_read_unlock(mm);
> > +             break;
> > +     case MADVISE_VMA_READ_LOCK:
> > +             /* We will drop the lock per-VMA in madvise_walk_vmas(). =
*/
> > +             break;
> > +     }
> > +
> > +     madv_behavior->lock_mode =3D MADVISE_NO_LOCK;
> >  }
> >
> >  static bool madvise_batch_tlb_flush(int behavior)
> > @@ -1710,6 +1794,21 @@ static bool is_madvise_populate(int behavior)
> >       }
> >  }
> >
> > +/*
> > + * untagged_addr_remote() assumes mmap_lock is already held. On
> > + * architectures like x86 and RISC-V, tagging is tricky because each
> > + * mm may have a different tagging mask. However, we might only hold
> > + * the per-VMA lock (currently only local processes are supported),
> > + * so untagged_addr is used to avoid the mmap_lock assertion for
> > + * local processes.
> > + */
> > +static inline unsigned long get_untagged_addr(struct mm_struct *mm,
> > +             unsigned long start)
> > +{
> > +     return current->mm =3D=3D mm ? untagged_addr(start) :
> > +                                untagged_addr_remote(mm, start);
> > +}
> > +
> >  static int madvise_do_behavior(struct mm_struct *mm,
> >               unsigned long start, size_t len_in,
> >               struct madvise_behavior *madv_behavior)
> > @@ -1721,7 +1820,7 @@ static int madvise_do_behavior(struct mm_struct *=
mm,
> >
> >       if (is_memory_failure(behavior))
> >               return madvise_inject_error(behavior, start, start + len_=
in);
> > -     start =3D untagged_addr_remote(mm, start);
> > +     start =3D get_untagged_addr(mm, start);
> >       end =3D start + PAGE_ALIGN(len_in);
> >
> >       blk_start_plug(&plug);
> > @@ -1729,7 +1828,7 @@ static int madvise_do_behavior(struct mm_struct *=
mm,
> >               error =3D madvise_populate(mm, start, end, behavior);
> >       else
> >               error =3D madvise_walk_vmas(mm, start, end, madv_behavior=
,
> > -                                       madvise_vma_behavior);
> > +                             madv_behavior, madvise_vma_behavior);
> >       blk_finish_plug(&plug);
> >       return error;
> >  }
> > @@ -1817,13 +1916,13 @@ int do_madvise(struct mm_struct *mm, unsigned l=
ong start, size_t len_in, int beh
> >
> >       if (madvise_should_skip(start, len_in, behavior, &error))
> >               return error;
> > -     error =3D madvise_lock(mm, behavior);
> > +     error =3D madvise_lock(mm, &madv_behavior);
> >       if (error)
> >               return error;
> >       madvise_init_tlb(&madv_behavior, mm);
> >       error =3D madvise_do_behavior(mm, start, len_in, &madv_behavior);
> >       madvise_finish_tlb(&madv_behavior);
> > -     madvise_unlock(mm, behavior);
> > +     madvise_unlock(mm, &madv_behavior);
> >
> >       return error;
> >  }
> > @@ -1847,7 +1946,7 @@ static ssize_t vector_madvise(struct mm_struct *m=
m, struct iov_iter *iter,
> >
> >       total_len =3D iov_iter_count(iter);
> >
> > -     ret =3D madvise_lock(mm, behavior);
> > +     ret =3D madvise_lock(mm, &madv_behavior);
> >       if (ret)
> >               return ret;
> >       madvise_init_tlb(&madv_behavior, mm);
> > @@ -1880,8 +1979,8 @@ static ssize_t vector_madvise(struct mm_struct *m=
m, struct iov_iter *iter,
> >
> >                       /* Drop and reacquire lock to unwind race. */
> >                       madvise_finish_tlb(&madv_behavior);
> > -                     madvise_unlock(mm, behavior);
> > -                     ret =3D madvise_lock(mm, behavior);
> > +                     madvise_unlock(mm, &madv_behavior);
> > +                     ret =3D madvise_lock(mm, &madv_behavior);
> >                       if (ret)
> >                               goto out;
> >                       madvise_init_tlb(&madv_behavior, mm);
> > @@ -1892,7 +1991,7 @@ static ssize_t vector_madvise(struct mm_struct *m=
m, struct iov_iter *iter,
> >               iov_iter_advance(iter, iter_iov_len(iter));
> >       }
> >       madvise_finish_tlb(&madv_behavior);
> > -     madvise_unlock(mm, behavior);
> > +     madvise_unlock(mm, &madv_behavior);
> >
> >  out:
> >       ret =3D (total_len - iov_iter_count(iter)) ? : ret;
> > --
> > 2.39.3 (Apple Git-146)
> >
>
> ----8<----
> From 1ffcaea75ebdaffe15805386f6d7733883d265a5 Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Tue, 17 Jun 2025 14:35:13 +0100
> Subject: [PATCH] mm/madvise: avoid any chance of uninitialised pointer de=
ref
>
> If we were to extend madvise() to support more operations under VMA lock,
> we could potentially dereference prev to uninitialised state in
> madvise_update_vma().
>
> Avoid this by explicitly setting prev to vma before invoking the visit()
> function.
>
> This has no impact on behaviour, as all visitors compatible with a VMA lo=
ck
> do not require prev to be set to the previous VMA and at any rate we only
> examine a single VMA in VMA lock mode.
>
> Reported-by: Lance Yang <ioworker0@gmail.com>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index efe5d64e1175..0970623a0e98 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1333,6 +1333,8 @@ static int madvise_vma_behavior(struct vm_area_stru=
ct *vma,
>                 return madvise_guard_remove(vma, prev, start, end);
>         }
>
> +       /* We cannot provide prev in this lock mode. */
> +       VM_WARN_ON_ONCE(arg->lock_mode =3D=3D MADVISE_VMA_READ_LOCK);

Thanks, Lorenzo.
Do we even reach this point for MADVISE_MMAP_READ_LOCK cases?
madvise_update_vma() attempts to merge or split VMAs=E2=80=94wouldn't that =
be
a scenario that requires a write lock?

The prerequisite for using a VMA read lock is that the operation must
be safe under an mmap read lock as well.

>         anon_name =3D anon_vma_name(vma);
>         anon_vma_name_get(anon_name);
>         error =3D madvise_update_vma(vma, prev, start, end, new_flags,
> @@ -1549,6 +1551,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigne=
d long start,
>         if (madv_behavior && madv_behavior->lock_mode =3D=3D MADVISE_VMA_=
READ_LOCK) {
>                 vma =3D try_vma_read_lock(mm, madv_behavior, start, end);
>                 if (vma) {
> +                       prev =3D vma;
>                         error =3D visit(vma, &prev, start, end, arg);
>                         vma_end_read(vma);
>                         return error;
> --
> 2.49.0

Thanks
Barry
