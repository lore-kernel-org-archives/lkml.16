Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685418DB24
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748981844; cv=none; b=uyCdf2MXxfztk+I8fv1LMM1IGBRWclJ8LN0QrcUBKM+hKUYaYJ/xVJ0LBKUAc7zpjijk1Q5qOt4sirrAcf9j1CIvaoHgiftvC0RcdMT6G+bVAsKrLWNidF48s/Vg1TA2+0t3qbsy8f12U+vtzb2JboV705Ag5dajTMbzGfyJnU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748981844; c=relaxed/simple;
	bh=EXPKnkTNu2tfNE1gGb2k5CeN3vxL1iyJLU/9isBAfSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oH8L3F9cchkISR1TVfSkyJvoc2joLFeVf/XQQEgFnKBM7NVriII6yx/RHF4W453gv+54s8A2vLSU3mty+58chucr02LHRmryM1v5I8ZHV+0OzQ8JYvvvm62l5aBZBQR2D6K7OtA9IvzuD19dU2J0cNBBHjlELmmNT9rdlc8vyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vipHZjrh; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vipHZjrh"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a433f52485so118971cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748981841; x=1749586641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWNWJILrl8zMyCKCeNWlZdeGTw+/BxsN341ZE/ALRtY=;
        b=vipHZjrh9EsRAwNw/VQ25jT67rYZcuS40dAY510lDBCz2xTC52qJ+n/N0KTUKgbBCs
         E9ROF+p08C0ibqamf9sa1TWKJxyBU7cFg2XZBscoUDp9d9vpXGJQMA8zHzxB5ASuDD3k
         NAcQTpvJ0MWgqiHphzlFyTRj919y4SuXJPHr/8jElsa0Ou5ECzSK7U50hogyNp6nOMuk
         lnDnqm4mi3reEDIKCRZAHawXkDFm6eOaMotqJgPpGN3d4vX/PPTsd2DI+CtjSjju9G9b
         gG33YcM0/eg0EqAbZqTvibcUhvXXQFWFtKESAH7XWhI5MnIMbP6U6dl6TfT0oZzqa9nA
         V6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748981841; x=1749586641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWNWJILrl8zMyCKCeNWlZdeGTw+/BxsN341ZE/ALRtY=;
        b=XsurVPK9L+i5BFwrPEiARFF//Zabq9FEImVLiSFlS638lERszLehglKivVS9JsCaYJ
         YLxP0yY/5Y7sCFJqpZEgnjiQDIL98JNa4GKGOwPVFPc4T2km+aszfiv+lR7JhVzQH6iP
         LTwpQ4FRMg6TDonKiRUblexUPpXTsvniL2BgieRWQX9BBf72lZFSO6YRehWrlPuMbcK2
         QBkVz67TiozOmI+h8/gxh6LAumozRwnW2kHbLNcoaw0twS8uFHbpLQ9oxt4zFnskvP+u
         F+9z4sux5weJUzTeF4faaxtg3lE5H0BZE8e2ZyELU61LRC91INLArmTSuEgv7luCcpBq
         /Opw==
X-Forwarded-Encrypted: i=1; AJvYcCWjRjECsgIjmBPIwq+PZQvgyKmOBFse5J7U+4NbeWH2CY4Vqe0YWPRH75i5xj1dAPDWkmPc0EbGbodQF18=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzOLoK1PYiXogbGoQEQaCBXUPsn9wO6YkVpi+OjwfbAh9pKC8
	rdvA2j+bpH5nHJQECSoARDRkErh07zpcFxfq+Q3rHQKgaxcUcQXrrxGnuPm6IzjBeBHkaaVKhXT
	TS5hysnYROOQBmYPV5rGFR+9iG/4sb51gfAxnMOWs
X-Gm-Gg: ASbGncvRbyJ8wrvgHxSDtdOvwH1k6jwfKaeMvUPBzD8e8oRVKk2k8JD0jT3XjNFHuK4
	aYMx3TcIwJ6iZVmM58aLGhz3OLoFmR1Pc+0ya8ck+TMOcAfleHQ1bmVRBClmzXi4Tuvhtduc7D2
	98iqcZVvpwV0ksJrHOoL+5H/CH4QBHihLWVq2F4cRdd+FqqqJ9+ukm3Y69xgcu+od9oGnHECTN
X-Google-Smtp-Source: AGHT+IFL03qfsrnADtjwe9NyPXflxFWItUlS46fmT+Zu7AmB4ymfCv7GSbWpC1a+jK7Di0S0cEMqJ9H21LfsdSTkork=
X-Received: by 2002:a05:622a:a70e:b0:47d:4e8a:97f0 with SMTP id
 d75a77b69052e-4a5a53f89c1mr476291cf.29.1748981841245; Tue, 03 Jun 2025
 13:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
In-Reply-To: <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Jun 2025 13:17:10 -0700
X-Gm-Features: AX0GCFtmE9iOS-BWDiyxVniMExXEGtq8o7sqRnk-B4Ne6fjJYbiGuM1qncdfZr0
Message-ID: <CAJuCfpEaG8WuGboxgc6xB6s5==Lx8QT=UwzgNXJNxDH0-KMqzg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:43=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Hi Barry,
>
> As promised, I enclose a patch to give a sense of how I think we might
> thread state through this operation.
>
> There's a todo on the untagged stuff so you can figure that out. This is
> based on the v1 so it might not encompass everything you addressed in the
> v2.
>
> Passing in madv_behavior to madvise_walk_vmas() twice kinda sucks, I
> _despise_ the void *arg function ptr stuff there added just for the anon
> vma name stuff (ughhh) so might be the only sensible way of threading
> state.
>
> I don't need any attribution, so please use this patch as you see
> fit/adapt/delete/do whatever with it, just an easier way for me to show t=
he
> idea!
>
> I did some very basic testing and it seems to work, but nothing deeper.
>
> Cheers, Lorenzo
>
> ----8<----
> From ff4ba0115cb31a0630b6f8c02c68f11b3fb71f7a Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Tue, 3 Jun 2025 18:22:55 +0100
> Subject: [PATCH] mm/madvise: support VMA read locks for MADV_DONTNEED[_LO=
CKED]
>
> Refactor the madvise() code to retain state about the locking mode utilis=
ed
> for traversing VMAs.
>
> Then use this mechanism to permit VMA locking to be done later in the
> madvise() logic and also to allow altering of the locking mode to permit
> falling back to an mmap read lock if required.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 174 +++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 127 insertions(+), 47 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 5f7a66a1617e..a3a6d73d0bd5 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -48,38 +48,19 @@ struct madvise_walk_private {
>         bool pageout;
>  };
>
> +enum madvise_lock_mode {
> +       MADVISE_NO_LOCK,
> +       MADVISE_MMAP_READ_LOCK,
> +       MADVISE_MMAP_WRITE_LOCK,
> +       MADVISE_VMA_READ_LOCK,
> +};
> +
>  struct madvise_behavior {
>         int behavior;
>         struct mmu_gather *tlb;
> +       enum madvise_lock_mode lock_mode;
>  };
>
> -/*
> - * Any behaviour which results in changes to the vma->vm_flags needs to
> - * take mmap_lock for writing. Others, which simply traverse vmas, need
> - * to only take it for reading.
> - */
> -static int madvise_need_mmap_write(int behavior)
> -{
> -       switch (behavior) {
> -       case MADV_REMOVE:
> -       case MADV_WILLNEED:
> -       case MADV_DONTNEED:
> -       case MADV_DONTNEED_LOCKED:
> -       case MADV_COLD:
> -       case MADV_PAGEOUT:
> -       case MADV_FREE:
> -       case MADV_POPULATE_READ:
> -       case MADV_POPULATE_WRITE:
> -       case MADV_COLLAPSE:
> -       case MADV_GUARD_INSTALL:
> -       case MADV_GUARD_REMOVE:
> -               return 0;
> -       default:
> -               /* be safe, default to 1. list exceptions explicitly */
> -               return 1;
> -       }
> -}
> -
>  #ifdef CONFIG_ANON_VMA_NAME
>  struct anon_vma_name *anon_vma_name_alloc(const char *name)
>  {
> @@ -1486,6 +1467,43 @@ static bool process_madvise_remote_valid(int behav=
ior)
>         }
>  }
>
> +/*
> + * Try to acquire a VMA read lock if possible.
> + *
> + * We only support this lock over a single VMA, which the input range mu=
st
> + * span.either partially or fully.
> + *
> + * This function always returns with an appropriate lock held. If a VMA =
read
> + * lock could be acquired, we return the locked VMA.
> + *
> + * If a VMA read lock could not be acquired, we return NULL and expect c=
aller to

Worth mentioning that the function itself will fall back to taking
mmap_read_lock in such a case.

> + * fallback to mmap lock behaviour.
> + */
> +static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> +               struct madvise_behavior *madv_behavior,
> +               unsigned long start, unsigned long end)
> +{
> +       struct vm_area_struct *vma;
> +
> +       if (!madv_behavior || madv_behavior->lock_mode !=3D MADVISE_VMA_R=
EAD_LOCK)

nit: I think it would be better to do this check before calling
try_vma_read_lock(). IMHO it does not make sense to call
try_vma_read_lock() when lock_mode !=3D MADVISE_VMA_READ_LOCK. It also
makes reading this function easier. The first time I looked at it and
saw "return NULL" in one place that takes mmap_read_lock() and another
place which returns the same NULL but does not take mmap_lock really
confused me.

> +               return NULL;
> +
> +       vma =3D lock_vma_under_rcu(mm, start);
> +       if (!vma)
> +               goto take_mmap_read_lock;
> +       /* We must span only a single VMA, uffd unsupported. */
> +       if (end > vma->vm_end || userfaultfd_armed(vma)) {

vma->vm_end is not inclusive, so the above condition I think should be
(end >=3D vma->vm_end || ...)

> +               vma_end_read(vma);
> +               goto take_mmap_read_lock;
> +       }
> +       return vma;
> +
> +take_mmap_read_lock:
> +       mmap_read_lock(mm);
> +       madv_behavior->lock_mode =3D MADVISE_MMAP_READ_LOCK;
> +       return NULL;
> +}
> +
>  /*
>   * Walk the vmas in range [start,end), and call the visit function on ea=
ch one.
>   * The visit function will get start and end parameters that cover the o=
verlap
> @@ -1496,7 +1514,8 @@ static bool process_madvise_remote_valid(int behavi=
or)
>   */
>  static
>  int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> -                     unsigned long end, void *arg,
> +                     unsigned long end, struct madvise_behavior *madv_be=
havior,
> +                     void *arg,
>                       int (*visit)(struct vm_area_struct *vma,
>                                    struct vm_area_struct **prev, unsigned=
 long start,
>                                    unsigned long end, void *arg))
> @@ -1505,6 +1524,15 @@ int madvise_walk_vmas(struct mm_struct *mm, unsign=
ed long start,
>         struct vm_area_struct *prev;
>         unsigned long tmp;
>         int unmapped_error =3D 0;
> +       int error;
> +
> +       /* If VMA read lock supported, we apply advice to a single VMA on=
ly. */
> +       vma =3D try_vma_read_lock(mm, madv_behavior, start, end);
> +       if (vma) {
> +               error =3D visit(vma, &prev, start, end, arg);
> +               vma_end_read(vma);
> +               return error;
> +       }
>
>         /*
>          * If the interval [start,end) covers some unmapped address
> @@ -1516,8 +1544,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigne=
d long start,
>                 prev =3D vma;
>
>         for (;;) {
> -               int error;
> -
>                 /* Still start < end. */
>                 if (!vma)
>                         return -ENOMEM;
> @@ -1598,34 +1624,86 @@ int madvise_set_anon_name(struct mm_struct *mm, u=
nsigned long start,
>         if (end =3D=3D start)
>                 return 0;
>
> -       return madvise_walk_vmas(mm, start, end, anon_name,
> +       return madvise_walk_vmas(mm, start, end, anon_name, NULL,
>                                  madvise_vma_anon_name);
>  }
>  #endif /* CONFIG_ANON_VMA_NAME */
>
> -static int madvise_lock(struct mm_struct *mm, int behavior)
> +
> +/*
> + * Any behaviour which results in changes to the vma->vm_flags needs to
> + * take mmap_lock for writing. Others, which simply traverse vmas, need
> + * to only take it for reading.
> + */
> +static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *mad=
v_behavior)
>  {
> +       int behavior =3D madv_behavior->behavior;
> +
>         if (is_memory_failure(behavior))
> -               return 0;
> +               return MADVISE_NO_LOCK;
>
> -       if (madvise_need_mmap_write(behavior)) {
> +       switch (behavior) {
> +       case MADV_REMOVE:
> +       case MADV_WILLNEED:
> +       case MADV_COLD:
> +       case MADV_PAGEOUT:
> +       case MADV_FREE:
> +       case MADV_POPULATE_READ:
> +       case MADV_POPULATE_WRITE:
> +       case MADV_COLLAPSE:
> +       case MADV_GUARD_INSTALL:
> +       case MADV_GUARD_REMOVE:
> +               return MADVISE_MMAP_READ_LOCK;
> +       case MADV_DONTNEED:
> +       case MADV_DONTNEED_LOCKED:
> +               return MADVISE_VMA_READ_LOCK;
> +       default:
> +               return MADVISE_MMAP_WRITE_LOCK;
> +       }
> +}
> +
> +static int madvise_lock(struct mm_struct *mm,
> +               struct madvise_behavior *madv_behavior)
> +{
> +       enum madvise_lock_mode lock_mode =3D get_lock_mode(madv_behavior)=
;
> +
> +       switch (lock_mode) {
> +       case MADVISE_NO_LOCK:
> +               break;
> +       case MADVISE_MMAP_WRITE_LOCK:
>                 if (mmap_write_lock_killable(mm))
>                         return -EINTR;
> -       } else {
> +               break;
> +       case MADVISE_MMAP_READ_LOCK:
>                 mmap_read_lock(mm);
> +               break;
> +       case MADVISE_VMA_READ_LOCK:
> +               /* We will acquire the lock per-VMA in madvise_walk_vmas(=
). */
> +               break;
>         }
> +
> +       madv_behavior->lock_mode =3D lock_mode;
>         return 0;
>  }
>
> -static void madvise_unlock(struct mm_struct *mm, int behavior)
> +static void madvise_unlock(struct mm_struct *mm,
> +               struct madvise_behavior *madv_behavior)
>  {
> -       if (is_memory_failure(behavior))
> +       switch (madv_behavior->lock_mode) {
> +       case  MADVISE_NO_LOCK:
>                 return;
> -
> -       if (madvise_need_mmap_write(behavior))
> +       case MADVISE_MMAP_WRITE_LOCK:
>                 mmap_write_unlock(mm);
> -       else
> +               break;
> +       case MADVISE_MMAP_READ_LOCK:
>                 mmap_read_unlock(mm);
> +               break;
> +       case MADVISE_VMA_READ_LOCK:
> +               /* We will drop the lock per-VMA in madvise_walk_vmas(). =
*/
> +               break;
> +       }
> +
> +       madv_behavior->lock_mode =3D MADVISE_NO_LOCK;
>  }
>
>  static bool madvise_batch_tlb_flush(int behavior)
> @@ -1721,6 +1799,8 @@ static int madvise_do_behavior(struct mm_struct *mm=
,
>
>         if (is_memory_failure(behavior))
>                 return madvise_inject_error(behavior, start, start + len_=
in);
> +
> +       // TODO: handle untagged stuff here...
>         start =3D untagged_addr(start); //untagged_addr_remote(mm, start)=
;
>         end =3D start + PAGE_ALIGN(len_in);
>
> @@ -1729,7 +1809,7 @@ static int madvise_do_behavior(struct mm_struct *mm=
,
>                 error =3D madvise_populate(mm, start, end, behavior);
>         else
>                 error =3D madvise_walk_vmas(mm, start, end, madv_behavior=
,
> -                                         madvise_vma_behavior);
> +                                         madv_behavior, madvise_vma_beha=
vior);
>         blk_finish_plug(&plug);
>         return error;
>  }
> @@ -1817,13 +1897,13 @@ int do_madvise(struct mm_struct *mm, unsigned lon=
g start, size_t len_in, int beh
>
>         if (madvise_should_skip(start, len_in, behavior, &error))
>                 return error;
> -       error =3D madvise_lock(mm, behavior);
> +       error =3D madvise_lock(mm, &madv_behavior);
>         if (error)
>                 return error;
>         madvise_init_tlb(&madv_behavior, mm);
>         error =3D madvise_do_behavior(mm, start, len_in, &madv_behavior);
>         madvise_finish_tlb(&madv_behavior);
> -       madvise_unlock(mm, behavior);
> +       madvise_unlock(mm, &madv_behavior);
>
>         return error;
>  }
> @@ -1847,7 +1927,7 @@ static ssize_t vector_madvise(struct mm_struct *mm,=
 struct iov_iter *iter,
>
>         total_len =3D iov_iter_count(iter);
>
> -       ret =3D madvise_lock(mm, behavior);
> +       ret =3D madvise_lock(mm, &madv_behavior);
>         if (ret)
>                 return ret;
>         madvise_init_tlb(&madv_behavior, mm);
> @@ -1880,8 +1960,8 @@ static ssize_t vector_madvise(struct mm_struct *mm,=
 struct iov_iter *iter,
>
>                         /* Drop and reacquire lock to unwind race. */
>                         madvise_finish_tlb(&madv_behavior);
> -                       madvise_unlock(mm, behavior);
> -                       ret =3D madvise_lock(mm, behavior);
> +                       madvise_unlock(mm, &madv_behavior);
> +                       ret =3D madvise_lock(mm, &madv_behavior);
>                         if (ret)
>                                 goto out;
>                         madvise_init_tlb(&madv_behavior, mm);
> @@ -1892,7 +1972,7 @@ static ssize_t vector_madvise(struct mm_struct *mm,=
 struct iov_iter *iter,
>                 iov_iter_advance(iter, iter_iov_len(iter));
>         }
>         madvise_finish_tlb(&madv_behavior);
> -       madvise_unlock(mm, behavior);
> +       madvise_unlock(mm, &madv_behavior);
>
>  out:
>         ret =3D (total_len - iov_iter_count(iter)) ? : ret;
> --
> 2.49.0
