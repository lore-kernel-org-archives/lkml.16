Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E98B283CA2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748642438; cv=none; b=H4or1MXCYApVzwYXmK0Y2dI6oUhpmnzL06iDiT3kcPlmvtOCMBLmxC5qqJiu4jWMVkvEmHWTXLtbuD853MRadpU6616pzm5uXnlUdkKH0UtHmUQPRwJIcskcpkPuxiiI+XA8lNonGMdOZm4+DMxvsHM3UoyRc2ujg7HLwdvmHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748642438; c=relaxed/simple;
	bh=bvUE0kKGEW6Fr74ysiaLEJ66Bu0f32wWhVpudH2Y+78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaV2YSAef2tSaqkil4wI9TEP4GvHCvb0e55tr3Wv/p3CcHn2f0o5KEW76MUGwKsfH+AfwnFP5dJKz1igHFbD7Vju4JuzXQ/D4EwdDzAaDsPcZ0Ob/aDw5B2pCjSQcJNJjUhqIK/ihEFWs5S8Ymtar0HOuZi/U98Wf8CJiREk3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQRWwAXz; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQRWwAXz"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86feb84877aso663594241.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748642435; x=1749247235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1qlvpXCyMWNd5z0USSTKKFj9XoQDqNjSIdKpaUp5v8=;
        b=EQRWwAXzma1eMRgq0VqEeC9mcsy41Fjom+r3YabPxSEnnm9ghG/MvGbA3KpK9bCliL
         qPa7iMGtRLr0z1Exr8bcQj/HvJsCLVxkylTbRHd8Lki53DcPlEYLuNVZOsDtmfBxvbkT
         ZOlWeypR2KA/7slbAL+TBqAx2MvScIKReECCfq2A47mr+PHgLTrEn/xLNIhL6xjp0K6l
         qtmvbep7JxW+yvDl8+tgSVpzvTP1xyqC/uc0KdTZAxAgKTU1Qqn7povr4B7X6/SDjmMV
         3Gvygr7r8v96vTQExkm0WldWotoWx3tUrmFNSfmgSvmpDmr7A5t+vOYbKML/8BM5bs2v
         hHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748642435; x=1749247235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1qlvpXCyMWNd5z0USSTKKFj9XoQDqNjSIdKpaUp5v8=;
        b=JxTTLfXkWfIXnCxNims2MdB01t3J8IY8WahCZwsZouJ+J4+raPPohAr9BAnRcQEyjz
         PeLqFqvKmjCiV9bbH0XROHMUMZ+lisM+HIs3yHqum/8TvHemIrnV2KANHbN07/CEMhyx
         E/KePDrDIcX+/ioK63ilB5xozZYBUxBThnnB3w85ZxZF1GM6msoJndWbxcOSKG8UlaAr
         3s/4uONr6ndV1Vjbmqs9Wr4e0IGzcaf6/O+CmqMYCT0giIZt/h7Ht9DCRQGhpNeS4RkP
         KdyGcEwg/NRvsasfcd5IqPDMfa8unZ/Z+gZm3O1fnEw7rEJ3laUXb+2znlNjeQiwgjPa
         hsDw==
X-Forwarded-Encrypted: i=1; AJvYcCUohtVJoe3+e6R95Vrj8OphHbHgujh/yk4fikcj8aG9j0Trfg6sF4AJpESb4huXpbxJlPL9CpS1dQ5w5z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSx0rNKF2stEFqHzz5SFVmnmksxv82Ara1dTiEqZKd1k5yYRtp
	W4nJkAeT37IDZHExJd1siA151s5u/+KoqbxgULlTkRYmCml/Ru8MZVQyE0LVz5i8D/a6JyizpfU
	m0fj/8Xp0LnZ3dkjG4336AjE5g2GDQgo=
X-Gm-Gg: ASbGnctLCchyk5uy78IP2177qs7R7zDmIrScXKbhJCYtClB+XFJ/3s4XMBXczvb1Xdi
	nzL6XZnH2o2DAWPAj9NiIrhzvKsMHlTSuPedVANS0g5TVsZQCgpAuVqwBUwM6HKBD3QzThcUH5N
	O4GIIzgqHLGwZbmCDovjUt5MPbqcnldW13Hw==
X-Google-Smtp-Source: AGHT+IEO3cthOtX4sk2jPqf+U/41oen3Y8Stlld+6LRZVeNzIXO0o8kF7Dv7TUqhsbikTrXyaenKQFV6arABBWlcnN4=
X-Received: by 2002:a05:6102:160a:b0:4e2:bbfe:1110 with SMTP id
 ada2fe7eead31-4e6ece53484mr3294369137.20.1748642434418; Fri, 30 May 2025
 15:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
In-Reply-To: <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 31 May 2025 06:00:22 +0800
X-Gm-Features: AX0GCFsnORmywvqrfe36XaaqxmbBGqRmh9L8nf4o3WJCT3IBwKYmEkYw0w_tpF8
Message-ID: <CAGsJ_4zMcptS5iJGOn+17KSMpM4NcS9F_PW0jMicK6UC7cAbKw@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Jann Horn <jannh@google.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 10:07=E2=80=AFPM Jann Horn <jannh@google.com> wrote=
:
>
> On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmail.com> w=
rote:
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
>
> One important quirk of this is that it can, from what I can see, cause
> freeing of page tables (through pt_reclaim) without holding the mmap
> lock at all:
>
> do_madvise [behavior=3DMADV_DONTNEED]
>   madvise_lock
>     lock_vma_under_rcu
>   madvise_do_behavior
>     madvise_single_locked_vma
>       madvise_vma_behavior
>         madvise_dontneed_free
>           madvise_dontneed_single_vma
>             zap_page_range_single_batched [.reclaim_pt =3D true]
>               unmap_single_vma
>                 unmap_page_range
>                   zap_p4d_range
>                     zap_pud_range
>                       zap_pmd_range
>                         zap_pte_range
>                           try_get_and_clear_pmd
>                           free_pte
>
> This clashes with the assumption in walk_page_range_novma() that
> holding the mmap lock in write mode is sufficient to prevent
> concurrent page table freeing, so it can probably lead to page table
> UAF through the ptdump interface (see ptdump_walk_pgd()).
>
> I think before this patch can land, you'll have to introduce some new
> helper like:
>
> void mmap_write_lock_with_all_vmas(struct mm_struct *mm)
> {
>   mmap_write_lock(mm);
>   for_each_vma(vmi, vma)
>     vma_start_write(vma);
> }
>
> and use that in walk_page_range_novma() for user virtual address space
> walks, and update the comment in there.
>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> [...]
> > +static void madvise_unlock(struct mm_struct *mm,
> > +               struct madvise_behavior *madv_behavior)
> > +{
> > +       if (madv_behavior->vma)
> > +               vma_end_read(madv_behavior->vma);
>
> Please set madv_behavior->vma to NULL here, so that if madvise_lock()
> was called on madv_behavior again and decided to take the mmap lock
> that time, the next madvise_unlock() wouldn't take the wrong branch
> here.
>
> > +       else
> > +               __madvise_unlock(mm, madv_behavior->behavior);
> > +}
> > +
> >  static bool madvise_batch_tlb_flush(int behavior)
> >  {
> >         switch (behavior) {
> > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_struct=
 *mm,
> >                 unsigned long start, size_t len_in,
> >                 struct madvise_behavior *madv_behavior)
> >  {
> > +       struct vm_area_struct *vma =3D madv_behavior->vma;
> >         int behavior =3D madv_behavior->behavior;
> > +
> >         struct blk_plug plug;
> >         unsigned long end;
> >         int error;
> >
> >         if (is_memory_failure(behavior))
> >                 return madvise_inject_error(behavior, start, start + le=
n_in);
> > -       start =3D untagged_addr_remote(mm, start);
> > +       start =3D untagged_addr(start);
>
> Why is this okay? I see that X86's untagged_addr_remote() asserts that
> the mmap lock is held, which is no longer the case here with your
> patch, but untagged_addr() seems wrong here, since we can be operating
> on another process. I think especially on X86 with 5-level paging and
> LAM, there can probably be cases where address bits are used for part
> of the virtual address in one task while they need to be masked off in
> another task?
>
> I wonder if you'll have to refactor X86 and Risc-V first to make this
> work... ideally by making sure that their address tagging state
> updates are atomic and untagged_area_remote() works locklessly.

If possible, can we try to avoid this at least for this stage? We all
agree that
a per-VMA lock for DONTNEED is long overdue. The main goal of the patch
is to drop the mmap_lock for high-frequency madvise operations like
MADV_DONTNEED and potentially MADV_FREE. For these two cases, it's highly
unlikely that one process would be managing the memory of another. In v2,
we're modifying common code, which is why we ended up here.

We could consider doing:

if (current->mm =3D=3D mm)
       untagged_addr(start);
else
       untagged_addr_remote(mm, start);

As for remote madvise operations like MADV_COLD, until we resolve the
issue with untagged_addr_remote=E2=80=94which still requires mmap_lock=E2=
=80=94we can
defer consideration of remote madvise cases.


>
> (Or you could try to use something like the
> mmap_write_lock_with_all_vmas() I proposed above for synchronizing
> against untagged_addr(), first write-lock the MM and then write-lock
> all VMAs in it...)
>
> >         end =3D start + PAGE_ALIGN(len_in);
> >
> >         blk_start_plug(&plug);
> >         if (is_madvise_populate(behavior))
> >                 error =3D madvise_populate(mm, start, end, behavior);
> > +       else if (vma)
> > +               error =3D madvise_single_locked_vma(vma, start, end,
> > +                               madv_behavior, madvise_vma_behavior);
> >         else
> >                 error =3D madvise_walk_vmas(mm, start, end, madv_behavi=
or,
> >                                           madvise_vma_behavior);
> > @@ -1847,7 +1908,7 @@ static ssize_t vector_madvise(struct mm_struct *m=
m, struct iov_iter *iter,
> >
> >         total_len =3D iov_iter_count(iter);
> >
> > -       ret =3D madvise_lock(mm, behavior);
> > +       ret =3D __madvise_lock(mm, behavior);
> >         if (ret)
> >                 return ret;
> >         madvise_init_tlb(&madv_behavior, mm);
>
> (I think Lorenzo was saying that he would like madvise_lock() to also
> be used in vector_madvise()? But I'll let him comment on that.)

Thanks
Barry
