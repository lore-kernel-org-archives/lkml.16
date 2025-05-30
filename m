Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCB11B808
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636287; cv=none; b=oZdAqOOMPZ0rgtjj2JszN73Macentox9h8hSh+v6Qd1Km6F6rSTQ0avVCk+yP1cb6vgdbzxnMWPAibLEeAm6aO+NOPWXO3ZxpcuPRYLcYKH+Z6lRSGhjSKIzuFhTme0IAaqcBm3bdoq8VSVlMZeCPQ96UdjlLQJU/EzRdGVRKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636287; c=relaxed/simple;
	bh=pJphIJiDSetEll+0iErMnm8T+gxUojJ4448me28t8GA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjqwaAM7C89scREvTb2zYt1YTg845FzcfNoU4IjSyybTyLIDdrCsDSvMAfs4lofJXfRcYZlVf0wQ4en+pVDcxC+48gDFi5j/wEXaBObJ0hwkoUGM46kW1y/lcOItUuEKgGSVswe7/hq57giEsim6+grqaSYP78p9ouwxHbapf6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WE6s5pv4; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WE6s5pv4"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e6d911daeaso643341137.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748636284; x=1749241084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTaO7tcQINjydL/flcv5n449NKXUcEH8jDdtCJkzu30=;
        b=WE6s5pv4ZgmSFXCetWWvoWDGE06eaO1Z0S7aCw9BSb13t0XCcZwAluxb0wW0jmizTI
         TkExmSZiHnECcnucrr2w38Wj0yx68RjsshY4Rb7PoFutC6zajxtpcRX8aw1R2WxGwi80
         RXga+bnhwPH9WyLQMh/Q19YyBBGRtPFW/BIW4OaVYHMW6Gs8e8D/OhGgZxdYBkbtsFVT
         qnFcBWryWgsWeaQ+UHi7neGQws1z/mrpTRrW8p3CBE9cm03PfniC416tCXuZcl8AdwLI
         WNTqxTSs+kQSePNYujRH3rN/ENe4lFA5SO13w9Y9T6kXtxaPU7xhGMC8E5nrOm2oJoLn
         UJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636284; x=1749241084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTaO7tcQINjydL/flcv5n449NKXUcEH8jDdtCJkzu30=;
        b=wBX/fc2KoBNJkVKpU8CZWjaxU9AmoySUkaFKx5AqVx0eZGqvsaegyJokjBSsrlheka
         r8ticqrelCX5fH2MCMrkPfAm2FSWdekwGge202fa3fOI4poP+nZgStKGU20/6hWj8gTZ
         Zt7/L9V6LFYXreMsknAK3k0UbJIuXHvH5r1du/oi5pw3v4A2ffwzhB91iymNIFwcA+8q
         dz/CZ60pZdQb0jkehd8jOrBxhFNsfp4Y9MkpkDjWs09R9bBKL78DHeJoa8FdehtG1YdZ
         hF0sMAFl8rcVAg4ehfLOHQ6E+TXS90ieZyEM41eRm1qEfKbVvMZBd96vsZ6QiWeSvVcJ
         0KCw==
X-Forwarded-Encrypted: i=1; AJvYcCWoginz4tlK9jQfmdjCazAJR4E2LB1E/vUXirE+JqC6QUM6tMuW2NaTgJyHUe3irkfI7ncnVDRp/T4O1OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKc95amZvlIkf+SJU0++WXBQJxJX/Cmn7Dovi3kthm3/bQyE7u
	7ZrlR3E+uES8UxfiK9QUO1f0rNhpm5YVKPM9fmFKl27wX2GTbgayjr6d8cDuqHqqxzgs3orEpzM
	wWlKD2eFDWoAnbkWYCOQCKVCYEaxg/OA=
X-Gm-Gg: ASbGncstMu1F4BuggdoTOvm285aqm3YPHWekozz8wsE6l309AwlmgK1Y1ePHvQ0GiGA
	7oz9B84gQb1qJSLM/QBdFjEJCDDO1IFmj7IhMxwQP/2sJ9TxD2LvIQ+b1b+3DKA9kAiyAvZ5a7G
	XaWhUY5+XDdJtgTbxOmsel3jn55jhhh1FjHQ==
X-Google-Smtp-Source: AGHT+IGY8UkJcHAqmx4t/Zyvbk+gdCYSN10rkBtDx675Y/kVvCVxginMv9GYH/E65XTm5++5btt0IA/Q7i0TUZrL668=
X-Received: by 2002:a05:6102:8014:b0:4e6:edcf:3890 with SMTP id
 ada2fe7eead31-4e6edcf3991mr3435491137.10.1748636284081; Fri, 30 May 2025
 13:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local>
In-Reply-To: <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 31 May 2025 04:17:51 +0800
X-Gm-Features: AX0GCFvsXbvqCJgbPTIkCNdSbH4wtF7aHFgJbKcr7XA88rv9ZQuw2GtYSDutP6c
Message-ID: <CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nPXPWxUVChzw@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
	Lokesh Gidra <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 10:34=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Barry - I was going to come back to this later, but Jann's sort of bumped
> this in my inbox.
>
> This implementation isn't quite what I was after, would you give me a
> little bit before a respin so I can have a think about this and make
> sensible suggestions?

Sure.

>
> Thanks!
>
> On Fri, May 30, 2025 at 04:06:30PM +0200, Jann Horn wrote:
> > On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmail.com>=
 wrote:
> > > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > > frequently than other madvise options, particularly in native and Jav=
a
> > > heaps for dynamic memory management.
> > >
> > > Currently, the mmap_lock is always held during these operations, even=
 when
> > > unnecessary. This causes lock contention and can lead to severe prior=
ity
> > > inversion, where low-priority threads=E2=80=94such as Android's HeapT=
askDaemon=E2=80=94
> > > hold the lock and block higher-priority threads.
> > >
> > > This patch enables the use of per-VMA locks when the advised range li=
es
> > > entirely within a single VMA, avoiding the need for full VMA traversa=
l. In
> > > practice, userspace heaps rarely issue MADV_DONTNEED across multiple =
VMAs.
> > >
> > > Tangquan=E2=80=99s testing shows that over 99.5% of memory reclaimed =
by Android
> > > benefits from this per-VMA lock optimization. After extended runtime,
> > > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, whil=
e
> > > only 1,231 fell back to mmap_lock.
> > >
> > > To simplify handling, the implementation falls back to the standard
> > > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexi=
ty of
> > > userfaultfd_remove().
> >
> > One important quirk of this is that it can, from what I can see, cause
> > freeing of page tables (through pt_reclaim) without holding the mmap
> > lock at all:
> >
> > do_madvise [behavior=3DMADV_DONTNEED]
> >   madvise_lock
> >     lock_vma_under_rcu
> >   madvise_do_behavior
> >     madvise_single_locked_vma
> >       madvise_vma_behavior
> >         madvise_dontneed_free
> >           madvise_dontneed_single_vma
> >             zap_page_range_single_batched [.reclaim_pt =3D true]
> >               unmap_single_vma
> >                 unmap_page_range
> >                   zap_p4d_range
> >                     zap_pud_range
> >                       zap_pmd_range
> >                         zap_pte_range
> >                           try_get_and_clear_pmd
> >                           free_pte
> >
> > This clashes with the assumption in walk_page_range_novma() that
> > holding the mmap lock in write mode is sufficient to prevent
> > concurrent page table freeing, so it can probably lead to page table
> > UAF through the ptdump interface (see ptdump_walk_pgd()).
>
> Hmmmmmm is this because of the series that allows page table freeing on
> zap... I think Zi's?
>
> We need to update the documentation on this then... which currently state=
s
> the VMA need only be stable.
>
> I guess this is still the case except for the novma walker you mention.
>
> Relatedly, It's worth looking at Dev's series which introduces a concerni=
ng
> new 'no lock at all' mode to the page table walker explicitly for novma. =
I
> cc'd you :) See [0].
>
> [0]: https://lore.kernel.org/linux-mm/6a60c052-9935-489e-a38e-1b03a1a7915=
5@lucifer.local/
>
> >
> > I think before this patch can land, you'll have to introduce some new
> > helper like:
> >
> > void mmap_write_lock_with_all_vmas(struct mm_struct *mm)
> > {
> >   mmap_write_lock(mm);
> >   for_each_vma(vmi, vma)
> >     vma_start_write(vma);
> > }
> >
> > and use that in walk_page_range_novma() for user virtual address space
> > walks, and update the comment in there.
>
> What dude? No, what? Marking literally all VMAs write locked? :/
>
> I think this could have unexpected impact no? We're basically disabling V=
MA
> locking when we're in novma, that seems... really silly?
>
>
> >
> > > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Jann Horn <jannh@google.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > [...]
> > > +static void madvise_unlock(struct mm_struct *mm,
> > > +               struct madvise_behavior *madv_behavior)
> > > +{
> > > +       if (madv_behavior->vma)
> > > +               vma_end_read(madv_behavior->vma);
> >
> > Please set madv_behavior->vma to NULL here, so that if madvise_lock()
> > was called on madv_behavior again and decided to take the mmap lock
> > that time, the next madvise_unlock() wouldn't take the wrong branch
> > here.

i actually put some words for vector_madvise:
"
 * ideally, for vector_madvise(), we are able to make the
   decision of lock types for each iteration; for this moment,
   we still use the global lock."

I held on to that one because I'd rather get feedback before going too
far - so vector_madvise() didn't be touched by having a __madvise_lock()
and __madvise_lock().

For that case, we might need to take madvise_lock after releasing it.
otherwise, this is not the case.

BTW, I found vector_madvise doesn't check the ret value of madvise_lock(),
it seems also a bug?

static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
{
                        /* Drop and reacquire lock to unwind race. */
                        madvise_finish_tlb(&madv_behavior);
                       madvise_unlock(mm, behavior);
                       madvise_lock(mm, behavior);  /* missing the ret chec=
k */
                        madvise_init_tlb(&madv_behavior, mm)
}

>
> Yeah I'm not a fan of having the vma referenced here this isn't quite wha=
t
> I meant.
>
> >
> > > +       else
> > > +               __madvise_unlock(mm, madv_behavior->behavior);
> > > +}
> > > +
> > >  static bool madvise_batch_tlb_flush(int behavior)
> > >  {
> > >         switch (behavior) {
> > > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_stru=
ct *mm,
> > >                 unsigned long start, size_t len_in,
> > >                 struct madvise_behavior *madv_behavior)
> > >  {
> > > +       struct vm_area_struct *vma =3D madv_behavior->vma;
> > >         int behavior =3D madv_behavior->behavior;
> > > +
> > >         struct blk_plug plug;
> > >         unsigned long end;
> > >         int error;
> > >
> > >         if (is_memory_failure(behavior))
> > >                 return madvise_inject_error(behavior, start, start + =
len_in);
> > > -       start =3D untagged_addr_remote(mm, start);
> > > +       start =3D untagged_addr(start);
> >
> > Why is this okay? I see that X86's untagged_addr_remote() asserts that
> > the mmap lock is held, which is no longer the case here with your
> > patch, but untagged_addr() seems wrong here, since we can be operating
> > on another process. I think especially on X86 with 5-level paging and
> > LAM, there can probably be cases where address bits are used for part
> > of the virtual address in one task while they need to be masked off in
> > another task?
> >
> > I wonder if you'll have to refactor X86 and Risc-V first to make this
> > work... ideally by making sure that their address tagging state
> > updates are atomic and untagged_area_remote() works locklessly.
>
> Yeah I don't know why we're doing this at all? This seems new unless I
> missed it?

we might call madvise_do_behavior() within per-vma lock but
untagged_addr_remote() always asserts a mmap_lock which
will also be asserted by find_vma in madvise_walk_vmas().
so at least for architectures other than risc-v and x86, there
is no difference.

include/linux/uaccess.h

#ifndef untagged_addr_remote
#define untagged_addr_remote(mm, addr) ({ \
              mmap_assert_locked(mm); \
              untagged_addr(addr); \
})
#endif

I didn't realize madv_dontneed could be done on a remote process,
could it?

>
> >
> > (Or you could try to use something like the
> > mmap_write_lock_with_all_vmas() I proposed above for synchronizing
> > against untagged_addr(), first write-lock the MM and then write-lock
> > all VMAs in it...)
>
> This would completely eliminate the point of this patch no? The whole poi=
nt
> is not taking these locks... And I'm very much not in favour of
> write-locking literally every single VMA. under any circumstances.
>
> >
> > >         end =3D start + PAGE_ALIGN(len_in);
> > >
> > >         blk_start_plug(&plug);
> > >         if (is_madvise_populate(behavior))
> > >                 error =3D madvise_populate(mm, start, end, behavior);
> > > +       else if (vma)
> > > +               error =3D madvise_single_locked_vma(vma, start, end,
> > > +                               madv_behavior, madvise_vma_behavior);
> > >         else
> > >                 error =3D madvise_walk_vmas(mm, start, end, madv_beha=
vior,
> > >                                           madvise_vma_behavior);
> > > @@ -1847,7 +1908,7 @@ static ssize_t vector_madvise(struct mm_struct =
*mm, struct iov_iter *iter,
> > >
> > >         total_len =3D iov_iter_count(iter);
> > >
> > > -       ret =3D madvise_lock(mm, behavior);
> > > +       ret =3D __madvise_lock(mm, behavior);
> > >         if (ret)
> > >                 return ret;
> > >         madvise_init_tlb(&madv_behavior, mm);
> >
> > (I think Lorenzo was saying that he would like madvise_lock() to also
> > be used in vector_madvise()? But I'll let him comment on that.)
>
> Yeah I"m not a fan of this implementation it's not really what I had in
> mind, as per top of mail.
>
> Will come back with suggestions later.
>

thanks!


> Thanks!

Barry
