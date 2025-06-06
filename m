Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC93596A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194321; cv=none; b=cjLh1n4zhMm3g9WDL9Ljbla1eHbmQMXrKMG2eO+PUMOdCpIGd/NmsW5GzB4rZuDqzaKcy1CMmcnZVehA8jxOEKkKhmBe0bZ3OEUYmREOFk1JdmeGR3aHP5DxngPeG6VvztQod31UOVxwivnx0W/uCZngfDMuT5+wp8Z8Gefm7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194321; c=relaxed/simple;
	bh=xL2qRst9Wj7iaHMT/aDfVcmyo6ZYw+7jniWh7wSniG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3MPGK9zfevxvfYoxyFjdO/pEUMuko2a1RW1UaQS4s/xAJockgxAQDIwlc6WYmy1gPrMjxlODkdCxzULl6U8vnSP00xW6uGtoo/JBE9xtkVt683oZe3q+UjTj9UFXXHPzyBWiChoBD7aeli8ZlXLeUB70u+yIYtPglr9Ysa2guc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7V73ag7; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7V73ag7"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4c4fa0bfca2so555773137.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749194318; x=1749799118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81N3G2EiE8jl6/Bl162HCJNaqYLVKxHGkZAdpjf6weQ=;
        b=A7V73ag7wi1KKG9usLV102MpnHbkeBWm3WN3khv0pfapdFNFzK0MLH3dUzLnEFvKX6
         ZKLeo+TWwxfPZmzixwUOyojNbYqMjBYgzRhViA77NZiOY0JrZxCA1C9aB+fVnHOuJ/BB
         DCwujm/6qbBHnjaTb3iesGda/iPThHpskfHbhvOzZz2qf1xTepjQW5K97CGfshwn79jG
         UBQGpEWD+cHPz+RuE1OdN2kV5fNtplpw3ZAZ/qV4SLxcYNA23sn0X8uOxaGNeLPSbsDq
         XcKoY+shs2HpquYrRro/0YvdlWWOBKlYYzlSPmpz/jBkKqGAOx85Z98+uBDwyyOV0VEv
         Q0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194318; x=1749799118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81N3G2EiE8jl6/Bl162HCJNaqYLVKxHGkZAdpjf6weQ=;
        b=pV75e7DIW8oDFD6JFsJuadtTj+FEu2SGMkOJHGbCC5AdNVP2g7SX6UyibABA2Iy+Iy
         Z6bttFi3GSNwLEO8d5hJlpFY81sHfmXTL6vnRTTrF2CtvNaQrQVnyqf3NVJdT6FzCS3D
         mKls6pTx3zNuiEJX2jScLNtlWtHHZlimz0llfhYeJKxSKuMaNSxKPsuzEA95jCMR3/8X
         3WZlYEWANlXaFRQYvPt7btMaaPhDPaFQumzRWr4/ykQS9mISs+ne8yUI3YulfvJq5zpA
         2r5um67v656F4C9KhJUfIGtU+UMhuwjzwJf0QhkP+gTiWzhGeKjNzx7uEkDIDh5+17xB
         5K4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9sEQ64K26hJBuk2Zom3TONSJUai4Z1m7p+zLmJKjOPUUDVkp0PCiQQbBecZGdn0JipL8enS5NTB3/RfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6hJ2QWmx0DXUNMuQIJfrSm0jSWMKq2dQm+cZ/PPi5ASk2nfYZ
	Gp3MsXJfah7AhRS/mBFDrorFSYjRNj39uy7szYF9CvXlfKvoLOBD7EPQlDxl0oRN3raGn9TCtVG
	HN6FNpkHLNh/I21p/gvF6G5Wb6GEplPQ=
X-Gm-Gg: ASbGncuYcDuFj8hNNnxoJzgfIjtUNDV4LcN9XBktWgTWMRmyI2bI1mazuVDIqdshmGB
	g3SyehcEBUrwWHzbFDZtOX2qIp51g3nrKaTIjII0KXBcactllaCof85kVa+yQfBt1fC68egmYSl
	s+IEbk23gOx4hqKJX/SLPfGHh/Eve2MmdtTQ==
X-Google-Smtp-Source: AGHT+IEN7o3Nt2k6TzMRne9klFDn8+ml1QuHy4jJPCmZwEseUv24nrR5KnEBRjqA+279qE6imTPlUyJYgqZB93CQjW0=
X-Received: by 2002:a05:6102:4b18:b0:4e5:9323:d2b9 with SMTP id
 ada2fe7eead31-4e772997c59mr2154973137.2.1749194317917; Fri, 06 Jun 2025
 00:18:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
 <CAJuCfpEaG8WuGboxgc6xB6s5==Lx8QT=UwzgNXJNxDH0-KMqzg@mail.gmail.com>
In-Reply-To: <CAJuCfpEaG8WuGboxgc6xB6s5==Lx8QT=UwzgNXJNxDH0-KMqzg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 6 Jun 2025 19:18:25 +1200
X-Gm-Features: AX0GCFsXx5o38QJQIsbg8xYd5TcOnQ2AMqO2vTKH-7Yj_ODJOcMVPqzreLsYAgg
Message-ID: <CAGsJ_4xAhtSxpLTf_foXbtnVWwTcjNuQfCnTYuVwpExbLKjakw@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Suren Baghdasaryan <surenb@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Lokesh Gidra <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 8:17=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Tue, Jun 3, 2025 at 11:43=E2=80=AFAM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > Hi Barry,
> >
> > As promised, I enclose a patch to give a sense of how I think we might
> > thread state through this operation.
> >
> > There's a todo on the untagged stuff so you can figure that out. This i=
s
> > based on the v1 so it might not encompass everything you addressed in t=
he
> > v2.
> >
> > Passing in madv_behavior to madvise_walk_vmas() twice kinda sucks, I
> > _despise_ the void *arg function ptr stuff there added just for the ano=
n
> > vma name stuff (ughhh) so might be the only sensible way of threading
> > state.
> >
> > I don't need any attribution, so please use this patch as you see
> > fit/adapt/delete/do whatever with it, just an easier way for me to show=
 the
> > idea!
> >
> > I did some very basic testing and it seems to work, but nothing deeper.
> >
> > Cheers, Lorenzo

Really appreciate your work on this, Lorenzo.

> >
> > ----8<----
> > From ff4ba0115cb31a0630b6f8c02c68f11b3fb71f7a Mon Sep 17 00:00:00 2001
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date: Tue, 3 Jun 2025 18:22:55 +0100
> > Subject: [PATCH] mm/madvise: support VMA read locks for MADV_DONTNEED[_=
LOCKED]
> >
> > Refactor the madvise() code to retain state about the locking mode util=
ised
> > for traversing VMAs.
> >
> > Then use this mechanism to permit VMA locking to be done later in the
> > madvise() logic and also to allow altering of the locking mode to permi=
t
> > falling back to an mmap read lock if required.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  mm/madvise.c | 174 +++++++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 127 insertions(+), 47 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 5f7a66a1617e..a3a6d73d0bd5 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -48,38 +48,19 @@ struct madvise_walk_private {
> >         bool pageout;
> >  };
> >
> > +enum madvise_lock_mode {
> > +       MADVISE_NO_LOCK,
> > +       MADVISE_MMAP_READ_LOCK,
> > +       MADVISE_MMAP_WRITE_LOCK,
> > +       MADVISE_VMA_READ_LOCK,
> > +};
> > +
> >  struct madvise_behavior {
> >         int behavior;
> >         struct mmu_gather *tlb;
> > +       enum madvise_lock_mode lock_mode;
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
> > -       switch (behavior) {
> > -       case MADV_REMOVE:
> > -       case MADV_WILLNEED:
> > -       case MADV_DONTNEED:
> > -       case MADV_DONTNEED_LOCKED:
> > -       case MADV_COLD:
> > -       case MADV_PAGEOUT:
> > -       case MADV_FREE:
> > -       case MADV_POPULATE_READ:
> > -       case MADV_POPULATE_WRITE:
> > -       case MADV_COLLAPSE:
> > -       case MADV_GUARD_INSTALL:
> > -       case MADV_GUARD_REMOVE:
> > -               return 0;
> > -       default:
> > -               /* be safe, default to 1. list exceptions explicitly */
> > -               return 1;
> > -       }
> > -}
> > -
> >  #ifdef CONFIG_ANON_VMA_NAME
> >  struct anon_vma_name *anon_vma_name_alloc(const char *name)
> >  {
> > @@ -1486,6 +1467,43 @@ static bool process_madvise_remote_valid(int beh=
avior)
> >         }
> >  }
> >
> > +/*
> > + * Try to acquire a VMA read lock if possible.
> > + *
> > + * We only support this lock over a single VMA, which the input range =
must
> > + * span.either partially or fully.
> > + *
> > + * This function always returns with an appropriate lock held. If a VM=
A read
> > + * lock could be acquired, we return the locked VMA.
> > + *
> > + * If a VMA read lock could not be acquired, we return NULL and expect=
 caller to
>
> Worth mentioning that the function itself will fall back to taking
> mmap_read_lock in such a case.
>
> > + * fallback to mmap lock behaviour.
> > + */
> > +static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> > +               struct madvise_behavior *madv_behavior,
> > +               unsigned long start, unsigned long end)
> > +{
> > +       struct vm_area_struct *vma;
> > +
> > +       if (!madv_behavior || madv_behavior->lock_mode !=3D MADVISE_VMA=
_READ_LOCK)
>
> nit: I think it would be better to do this check before calling
> try_vma_read_lock(). IMHO it does not make sense to call
> try_vma_read_lock() when lock_mode !=3D MADVISE_VMA_READ_LOCK. It also
> makes reading this function easier. The first time I looked at it and
> saw "return NULL" in one place that takes mmap_read_lock() and another
> place which returns the same NULL but does not take mmap_lock really
> confused me.
>
> > +               return NULL;
> > +
> > +       vma =3D lock_vma_under_rcu(mm, start);
> > +       if (!vma)
> > +               goto take_mmap_read_lock;
> > +       /* We must span only a single VMA, uffd unsupported. */
> > +       if (end > vma->vm_end || userfaultfd_armed(vma)) {
>
> vma->vm_end is not inclusive, so the above condition I think should be
> (end >=3D vma->vm_end || ...)

I don't quite understand why `end > vma->vm_end` would be a problem.
For a VMA with `vm_start =3D X` and `vm_end =3D X + 0x1000`, wouldn't the
range `(X, X + 0x1000)`=E2=80=94where `end =3D=3D vm_end`=E2=80=94still be =
a valid
candidate for using a per-VMA lock?

We're checking which cases are not eligible for per-VMA locking,
not which ones are.

>
> > +               vma_end_read(vma);
> > +               goto take_mmap_read_lock;
> > +       }
> > +       return vma;
> > +
> > +take_mmap_read_lock:
> > +       mmap_read_lock(mm);
> > +       madv_behavior->lock_mode =3D MADVISE_MMAP_READ_LOCK;
> > +       return NULL;
> > +}
> > +
> >  /*
> >   * Walk the vmas in range [start,end), and call the visit function on =
each one.
> >   * The visit function will get start and end parameters that cover the=
 overlap
> > @@ -1496,7 +1514,8 @@ static bool process_madvise_remote_valid(int beha=
vior)
> >   */
> >  static
> >  int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > -                     unsigned long end, void *arg,
> > +                     unsigned long end, struct madvise_behavior *madv_=
behavior,
> > +                     void *arg,
> >                       int (*visit)(struct vm_area_struct *vma,
> >                                    struct vm_area_struct **prev, unsign=
ed long start,
> >                                    unsigned long end, void *arg))
> > @@ -1505,6 +1524,15 @@ int madvise_walk_vmas(struct mm_struct *mm, unsi=
gned long start,
> >         struct vm_area_struct *prev;
> >         unsigned long tmp;
> >         int unmapped_error =3D 0;
> > +       int error;
> > +
> > +       /* If VMA read lock supported, we apply advice to a single VMA =
only. */
> > +       vma =3D try_vma_read_lock(mm, madv_behavior, start, end);
> > +       if (vma) {
> > +               error =3D visit(vma, &prev, start, end, arg);
> > +               vma_end_read(vma);
> > +               return error;
> > +       }
> >
> >         /*
> >          * If the interval [start,end) covers some unmapped address
> > @@ -1516,8 +1544,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsig=
ned long start,
> >                 prev =3D vma;
> >
> >         for (;;) {
> > -               int error;
> > -
> >                 /* Still start < end. */
> >                 if (!vma)
> >                         return -ENOMEM;
> > @@ -1598,34 +1624,86 @@ int madvise_set_anon_name(struct mm_struct *mm,=
 unsigned long start,
> >         if (end =3D=3D start)
> >                 return 0;
> >
> > -       return madvise_walk_vmas(mm, start, end, anon_name,
> > +       return madvise_walk_vmas(mm, start, end, anon_name, NULL,

I think this should be:

 +       return madvise_walk_vmas(mm, start, end, NULL, anon_name,

> >                                  madvise_vma_anon_name);
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
> > +       int behavior =3D madv_behavior->behavior;
> > +
> >         if (is_memory_failure(behavior))
> > -               return 0;
> > +               return MADVISE_NO_LOCK;
> >
> > -       if (madvise_need_mmap_write(behavior)) {
> > +       switch (behavior) {
> > +       case MADV_REMOVE:
> > +       case MADV_WILLNEED:
> > +       case MADV_COLD:
> > +       case MADV_PAGEOUT:
> > +       case MADV_FREE:
> > +       case MADV_POPULATE_READ:
> > +       case MADV_POPULATE_WRITE:
> > +       case MADV_COLLAPSE:
> > +       case MADV_GUARD_INSTALL:
> > +       case MADV_GUARD_REMOVE:
> > +               return MADVISE_MMAP_READ_LOCK;
> > +       case MADV_DONTNEED:
> > +       case MADV_DONTNEED_LOCKED:
> > +               return MADVISE_VMA_READ_LOCK;
> > +       default:
> > +               return MADVISE_MMAP_WRITE_LOCK;
> > +       }
> > +}
> > +
> > +static int madvise_lock(struct mm_struct *mm,
> > +               struct madvise_behavior *madv_behavior)
> > +{
> > +       enum madvise_lock_mode lock_mode =3D get_lock_mode(madv_behavio=
r);
> > +
> > +       switch (lock_mode) {
> > +       case MADVISE_NO_LOCK:
> > +               break;
> > +       case MADVISE_MMAP_WRITE_LOCK:
> >                 if (mmap_write_lock_killable(mm))
> >                         return -EINTR;
> > -       } else {
> > +               break;
> > +       case MADVISE_MMAP_READ_LOCK:
> >                 mmap_read_lock(mm);
> > +               break;
> > +       case MADVISE_VMA_READ_LOCK:
> > +               /* We will acquire the lock per-VMA in madvise_walk_vma=
s(). */
> > +               break;
> >         }
> > +
> > +       madv_behavior->lock_mode =3D lock_mode;
> >         return 0;
> >  }
> >
> > -static void madvise_unlock(struct mm_struct *mm, int behavior)
> > +static void madvise_unlock(struct mm_struct *mm,
> > +               struct madvise_behavior *madv_behavior)
> >  {
> > -       if (is_memory_failure(behavior))
> > +       switch (madv_behavior->lock_mode) {
> > +       case  MADVISE_NO_LOCK:
> >                 return;
> > -
> > -       if (madvise_need_mmap_write(behavior))
> > +       case MADVISE_MMAP_WRITE_LOCK:
> >                 mmap_write_unlock(mm);
> > -       else
> > +               break;
> > +       case MADVISE_MMAP_READ_LOCK:
> >                 mmap_read_unlock(mm);
> > +               break;
> > +       case MADVISE_VMA_READ_LOCK:
> > +               /* We will drop the lock per-VMA in madvise_walk_vmas()=
. */
> > +               break;
> > +       }
> > +
> > +       madv_behavior->lock_mode =3D MADVISE_NO_LOCK;
> >  }
> >
> >  static bool madvise_batch_tlb_flush(int behavior)
> > @@ -1721,6 +1799,8 @@ static int madvise_do_behavior(struct mm_struct *=
mm,
> >
> >         if (is_memory_failure(behavior))
> >                 return madvise_inject_error(behavior, start, start + le=
n_in);
> > +
> > +       // TODO: handle untagged stuff here...
> >         start =3D untagged_addr(start); //untagged_addr_remote(mm, star=
t);
> >         end =3D start + PAGE_ALIGN(len_in);
> >
> > @@ -1729,7 +1809,7 @@ static int madvise_do_behavior(struct mm_struct *=
mm,
> >                 error =3D madvise_populate(mm, start, end, behavior);
> >         else
> >                 error =3D madvise_walk_vmas(mm, start, end, madv_behavi=
or,
> > -                                         madvise_vma_behavior);
> > +                                         madv_behavior, madvise_vma_be=
havior);
> >         blk_finish_plug(&plug);
> >         return error;
> >  }
> > @@ -1817,13 +1897,13 @@ int do_madvise(struct mm_struct *mm, unsigned l=
ong start, size_t len_in, int beh
> >
> >         if (madvise_should_skip(start, len_in, behavior, &error))
> >                 return error;
> > -       error =3D madvise_lock(mm, behavior);
> > +       error =3D madvise_lock(mm, &madv_behavior);
> >         if (error)
> >                 return error;
> >         madvise_init_tlb(&madv_behavior, mm);
> >         error =3D madvise_do_behavior(mm, start, len_in, &madv_behavior=
);
> >         madvise_finish_tlb(&madv_behavior);
> > -       madvise_unlock(mm, behavior);
> > +       madvise_unlock(mm, &madv_behavior);
> >
> >         return error;
> >  }
> > @@ -1847,7 +1927,7 @@ static ssize_t vector_madvise(struct mm_struct *m=
m, struct iov_iter *iter,
> >
> >         total_len =3D iov_iter_count(iter);
> >
> > -       ret =3D madvise_lock(mm, behavior);
> > +       ret =3D madvise_lock(mm, &madv_behavior);
> >         if (ret)
> >                 return ret;
> >         madvise_init_tlb(&madv_behavior, mm);
> > @@ -1880,8 +1960,8 @@ static ssize_t vector_madvise(struct mm_struct *m=
m, struct iov_iter *iter,
> >
> >                         /* Drop and reacquire lock to unwind race. */
> >                         madvise_finish_tlb(&madv_behavior);
> > -                       madvise_unlock(mm, behavior);
> > -                       ret =3D madvise_lock(mm, behavior);
> > +                       madvise_unlock(mm, &madv_behavior);
> > +                       ret =3D madvise_lock(mm, &madv_behavior);
> >                         if (ret)
> >                                 goto out;
> >                         madvise_init_tlb(&madv_behavior, mm);
> > @@ -1892,7 +1972,7 @@ static ssize_t vector_madvise(struct mm_struct *m=
m, struct iov_iter *iter,
> >                 iov_iter_advance(iter, iter_iov_len(iter));
> >         }
> >         madvise_finish_tlb(&madv_behavior);
> > -       madvise_unlock(mm, behavior);
> > +       madvise_unlock(mm, &madv_behavior);
> >
> >  out:
> >         ret =3D (total_len - iov_iter_count(iter)) ? : ret;
> > --
> > 2.49.0

Thanks
Barry
