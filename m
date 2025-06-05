Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD7520FA81
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119261; cv=none; b=JjJoooVWAFSGQ3xUdyPFAvx54cdaLJbc/gtXopIpRWDgigIlNt9BHyEfhXU0HG9DBOL8gLiQsoZQ0sNEPuOakjE+bHe/Qmu/biT69JSS6EbSWWcIY90wv3fgwDBpacdhkcdYmXBD+Pt7soh+5YjU9Z3wzKVBwYu/o8p+Y68glwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119261; c=relaxed/simple;
	bh=JdMiGFBQmM+xBs083JaZuSE/xqSrTqNp0YSlUXs2kmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdQPWwn9bwWk1cOdomizz/nIo4JgJROZcUZHlKtKCadhxoVMvzHIANP54vjXAb1kd3uKH96dzN5BlQN1wfC5kSsLNfAErDJ1hFMXLPWJKkisybbEp3pCuIDlDzVfVUx3wxC0lnwhV+OfIApA5i4ixCYQxid+Yo9nl0xPdSk17m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1aFt80S; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1aFt80S"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e75abe99b7so208972137.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749119258; x=1749724058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPuXwmLiDfs6Evoo10hPlCqsLPGGHuYNhb/1GnE1QMQ=;
        b=Y1aFt80SneKpq6KP6Wlc4uKF98Kmiw9tn1Zg3yWUDFuKxq6AiAs+gIUKHqZnEqUUly
         TUl72d07/rhltgIk0VWIZfCNDGvbmSd6eW/TnsImU5Z6uGkXAi1bfp75vN41b051wtng
         M2DfLtJeN9/AoLsAoW/q5/V1hdk4DxyuB0akB+K5ghCr8dk16TqabOen1g47pIDnnS1q
         VeaFzSiOEzn3IL2QVPMfGCmymN1gdZwNV4YbwiFPK2ggz5DyFkQruAR3OTpS4+zxdn6z
         o6QOogwiJVPZyRwYM4z5LhX59KTS8OO2EmbSlxe/w+TTtYjQIBtv/OXAu114fMqfc9HP
         +D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119258; x=1749724058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPuXwmLiDfs6Evoo10hPlCqsLPGGHuYNhb/1GnE1QMQ=;
        b=Gnlbd8QGkGNFzaSpNTVDzMhe3nSsTVj47DgGk0vFOZfI29VNw5IbP1fLI5XpIOq7iO
         /1MgokGP/pQ56SqxjHzveKct4GAxB5JLNZWz3MNzj4DtWY7qjvrHBc5aW4Igs5E1byaU
         Aoo6HoTaWvZKk/fz99QC4WjhwLj963mS+x6e9Imetquay1wjYVx7WD/wXaaMahbMMnQo
         yFww+GKhBQkF/WQKxDSg6paU/p8ntSwrfXWJRjB5DwcUin5GG/ulShckqXlr4EtZ7TFa
         gTqhSXNOoLLjIwoEvtsjB/Xg/ML0FS213RbpP+oqxSYtAbrILcJmiIvqwaYjpYDPnA1R
         4TvA==
X-Forwarded-Encrypted: i=1; AJvYcCVBZDYWIEumUfiEPjbiXqSG/SWaFrn/QaugzaCAwrxbZyWKCyVfCtxk8tlKcedsxcnwCICbMC/Eh1AZUuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxVWVfacUlehBaGEjEQRDX8dpYcUDQW3ZTcdzl70WeXFqAX7PA
	sI7GL2+gLZ25xsirg5A5ZRRCrV02TTeXZ2Y/rL3BAFc/aLyWgqw4C3cFWgwXkafsal0oyxmWEPO
	XQJLpOiBczsk1qNPHZp05ejyN1zBXGKg=
X-Gm-Gg: ASbGnculAmTXeFMCZRyS4GcLZJdv2V9AN/f2C1IqFd8G6IpGbUURIAY7WTk65R4fP7B
	dhnyKLyuNb1XOUg2vcIg9qENEzOcllXkftda4dkNas9zUL5hm/OfIndwnNvmfeQ6eHpB78dNdZP
	Nm5NnjRGebV4GHCv2m8jBVTrncFdgRv0RZpw==
X-Google-Smtp-Source: AGHT+IHcA4sk69Rb5N1LVTzskp7VvgQB7U1dp01kQMhkFxP9GNZvlgulf6A8Ppsw92Taa3ZxT05PdBxqFiBX2k0csYk=
X-Received: by 2002:a05:6102:1625:b0:4e5:a83a:3ceb with SMTP id
 ada2fe7eead31-4e746e68e2fmr4509098137.20.1749119258259; Thu, 05 Jun 2025
 03:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local> <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
 <CAGsJ_4y0LJRdMg3-0NC6n9-UvRXAEuwHzEL7KMJ3dD1CUkQa9w@mail.gmail.com> <CAG48ez0L_dRjArd_NMVSeQ3eJ5pGLJgNppsHxpBuBQbQHPU57w@mail.gmail.com>
In-Reply-To: <CAG48ez0L_dRjArd_NMVSeQ3eJ5pGLJgNppsHxpBuBQbQHPU57w@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 5 Jun 2025 22:27:27 +1200
X-Gm-Features: AX0GCFvJzPQUg6xIqO8HvbiHQT4ZjWwTAyyWi78nTT_QjfOS3oSv-chCNrNnQG0
Message-ID: <CAGsJ_4wjSXDc_BsYQaELAxbpCUoCqbBJsabJkvJh3rZ+kJoULA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Jann Horn <jannh@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 4:53=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Jun 3, 2025 at 9:06=E2=80=AFAM Barry Song <21cnbao@gmail.com> wro=
te:
> > On Sat, May 31, 2025 at 8:41=E2=80=AFAM Jann Horn <jannh@google.com> wr=
ote:
> > > On Fri, May 30, 2025 at 4:34=E2=80=AFPM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > > > On Fri, May 30, 2025 at 04:06:30PM +0200, Jann Horn wrote:
> > > > > On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmai=
l.com> wrote:
> > > > > One important quirk of this is that it can, from what I can see, =
cause
> > > > > freeing of page tables (through pt_reclaim) without holding the m=
map
> > > > > lock at all:
> > > > >
> > > > > do_madvise [behavior=3DMADV_DONTNEED]
> > > > >   madvise_lock
> > > > >     lock_vma_under_rcu
> > > > >   madvise_do_behavior
> > > > >     madvise_single_locked_vma
> > > > >       madvise_vma_behavior
> > > > >         madvise_dontneed_free
> > > > >           madvise_dontneed_single_vma
> > > > >             zap_page_range_single_batched [.reclaim_pt =3D true]
> > > > >               unmap_single_vma
> > > > >                 unmap_page_range
> > > > >                   zap_p4d_range
> > > > >                     zap_pud_range
> > > > >                       zap_pmd_range
> > > > >                         zap_pte_range
> > > > >                           try_get_and_clear_pmd
> > > > >                           free_pte
> > > > >
> > > > > This clashes with the assumption in walk_page_range_novma() that
> > > > > holding the mmap lock in write mode is sufficient to prevent
> > > > > concurrent page table freeing, so it can probably lead to page ta=
ble
> > > > > UAF through the ptdump interface (see ptdump_walk_pgd()).
> > > >
> > > > Hmmmmmm is this because of the series that allows page table freein=
g on
> > > > zap... I think Zi's?
> > >
> > > Yeah, that was Qi Zheng's
> > > https://lore.kernel.org/all/92aba2b319a734913f18ba41e7d86a265f0b84e2.=
1733305182.git.zhengqi.arch@bytedance.com/
> > > .
> > >
> > > > We need to update the documentation on this then... which currently=
 states
> > > > the VMA need only be stable.
> > > >
> > > > I guess this is still the case except for the novma walker you ment=
ion.
> > > >
> > > > Relatedly, It's worth looking at Dev's series which introduces a co=
ncerning
> > > > new 'no lock at all' mode to the page table walker explicitly for n=
ovma. I
> > > > cc'd you :) See [0].
> > > >
> > > > [0]: https://lore.kernel.org/linux-mm/6a60c052-9935-489e-a38e-1b03a=
1a79155@lucifer.local/
> > >
> > > Yeah, I saw that you CC'ed me; at a first glance that seems relativel=
y
> > > innocuous to me as long as it's only done for kernel mappings where
> > > all the rules are different.
> > >
> > > >
> > > > >
> > > > > I think before this patch can land, you'll have to introduce some=
 new
> > > > > helper like:
> > > > >
> > > > > void mmap_write_lock_with_all_vmas(struct mm_struct *mm)
> > > > > {
> > > > >   mmap_write_lock(mm);
> > > > >   for_each_vma(vmi, vma)
> > > > >     vma_start_write(vma);
> > > > > }
> > > > >
> > > > > and use that in walk_page_range_novma() for user virtual address =
space
> > > > > walks, and update the comment in there.
> > > >
> > > > What dude? No, what? Marking literally all VMAs write locked? :/
> > > >
> > > > I think this could have unexpected impact no? We're basically disab=
ling VMA
> > > > locking when we're in novma, that seems... really silly?
> > >
> > > I mean, walk_page_range_novma() being used on user virtual address
> > > space is pretty much a debug-only thing, I don't think it matters if
> > > it has to spend time poking flags in a few thousand VMAs. I guess the
> > > alternative would be to say "ptdump just doesn't show entries between
> > > VMAs, which shouldn't exist in the first place", and change ptdump to
> > > do a normal walk that skips over userspace areas not covered by a VMA=
.
> > > Maybe that's cleaner.
> > >
> > > But FWIW, we already do worse than what I proposed here when
> > > installing MMU notifiers, with mm_take_all_locks().
> > >
> > > > > > +       else
> > > > > > +               __madvise_unlock(mm, madv_behavior->behavior);
> > > > > > +}
> > > > > > +
> > > > > >  static bool madvise_batch_tlb_flush(int behavior)
> > > > > >  {
> > > > > >         switch (behavior) {
> > > > > > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct m=
m_struct *mm,
> > > > > >                 unsigned long start, size_t len_in,
> > > > > >                 struct madvise_behavior *madv_behavior)
> > > > > >  {
> > > > > > +       struct vm_area_struct *vma =3D madv_behavior->vma;
> > > > > >         int behavior =3D madv_behavior->behavior;
> > > > > > +
> > > > > >         struct blk_plug plug;
> > > > > >         unsigned long end;
> > > > > >         int error;
> > > > > >
> > > > > >         if (is_memory_failure(behavior))
> > > > > >                 return madvise_inject_error(behavior, start, st=
art + len_in);
> > > > > > -       start =3D untagged_addr_remote(mm, start);
> > > > > > +       start =3D untagged_addr(start);
> > > > >
> > > > > Why is this okay? I see that X86's untagged_addr_remote() asserts=
 that
> > > > > the mmap lock is held, which is no longer the case here with your
> > > > > patch, but untagged_addr() seems wrong here, since we can be oper=
ating
> > > > > on another process. I think especially on X86 with 5-level paging=
 and
> > > > > LAM, there can probably be cases where address bits are used for =
part
> > > > > of the virtual address in one task while they need to be masked o=
ff in
> > > > > another task?
> > > > >
> > > > > I wonder if you'll have to refactor X86 and Risc-V first to make =
this
> > > > > work... ideally by making sure that their address tagging state
> > > > > updates are atomic and untagged_area_remote() works locklessly.
> > > >
> > > > Yeah I don't know why we're doing this at all? This seems new unles=
s I
> > > > missed it?
> > >
> > > Because untagged_addr_remote() has a mmap_assert_locked(mm) on x86 an=
d
> > > reads data that is updated under the mmap lock, I think? So without
> > > this change you should get a lockdep splat on x86.
> > >
> > > > > (Or you could try to use something like the
> > > > > mmap_write_lock_with_all_vmas() I proposed above for synchronizin=
g
> > > > > against untagged_addr(), first write-lock the MM and then write-l=
ock
> > > > > all VMAs in it...)
> > > >
> > > > This would completely eliminate the point of this patch no? The who=
le point
> > > > is not taking these locks... And I'm very much not in favour of
> > > > write-locking literally every single VMA. under any circumstances.
> > >
> > > I'm talking about doing this heavyweight locking in places like
> > > arch_prctl(ARCH_ENABLE_TAGGED_ADDR, ...) that can, if I understand
> > > correctly, essentially reconfigure the size of the virtual address
> > > space of a running process from 56-bit to 47-bit at the hardware leve=
l
> > > and cause address bits that were previously part of the virtual
> > > address to be ignored. READ_ONCE()/WRITE_ONCE() might do the job too,
> > > but then we'll have to keep in mind that two subsequent invocations o=
f
> > > untagged_addr() can translate a userspace-specified virtual address
> > > into two different virtual addresses at the page table level.
> >
> > I=E2=80=99m confused about how arch_prctl(ARCH_ENABLE_TAGGED_ADDR, ...)=
 can
> > reconfigure a running process from using 56-bit addresses to 47-bit.
> > I read the code and see the x86 kernel only supports LAM U57, and not
> > LAM U48 at all:
> >
> > static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long=
 nr_bits)
> > {
> >         ...
> >
> >         if (!nr_bits || nr_bits > LAM_U57_BITS) {
> >                 mmap_write_unlock(mm);
> >                 return -EINVAL;
> >         }
> >
> >         mm_enable_lam(mm);
> >         mmap_write_unlock(mm);
> >
> >         return 0;
> > }
>
> Oh, you're right, currently only LAM U57 is supported by Linux, I was
> making bad assumptions.
>
> commit 2f8794bd087e, which introduced that code, also mentions that
> "For now only LAM_U57 is supported, with 6 tag bits".
>
> > I still don't fully understand why x86 differs from ARM64,
> > where the same bit mask is always applied unconditionally.
> >
> > On ARM64, we can even enable or disable PROT_MTE on a per-VMA basis
> > using mmap or mprotect. However, the same bitmask operation is
> > always executed regardless of whether memory tags are present for a
> > given VMA.
>
> Hmm, true, that does look like a weird difference.
>
> > I mean, on arm64, if a process or a VMA doesn't have tag access
> > enabled, and we pass an address with high bits to madvise,
> > untagged_addr() will still strip the tag. But wouldn't that address
> > be invalid for a process or VMA that doesn't have TBI enabled?
>
> Yeah, I guess in that regard it might be fine to always strip the bits...
>
> Maybe the situation on arm64 is simpler, in that these bits are always
> either tag bits or unused on arm64, while my understanding is that on
> X86, the CPU supports changing the meaning of address bits between
> "part of virtual address" and "ignored tag bits". So I think stripping
> the bits might work fine for LAM U57, but not for LAM U48, and maybe
> the code is trying to be future-proof in case someone wants to add
> support for LAM U48?

Perhaps supporting two different tag lengths is a bug rather than a feature=
?

>
> It is arguably also a bit more robust to reject garbage addresses
> instead of ignoring bits that would cause the CPU to treat the address
> as noncanonical, but I guess doing that just in MM code is not a big
> problem. (Unless someone relies on seccomp filters that block
> manipulation of specific virtual address ranges via munmap() and such,
> but I think almost nobody does that. I think I've only seen that once
> in some rarely-used component of the Tor project.)
>

Unless we perform a strict check in the kernel to ensure the allocated tag
matches the logical tag, random high-bit values are still acceptable.
For example, x86 only checks if the mask is -1UL or above 57 bits=E2=80=94
there=E2=80=99s no mechanism to exclude arbitrary high-bit values.

Otherwise, there's no point in checking whether tagging is enabled for the =
VMA
or the mm. Thus, we end up applying a mask unconditionally anyway.

> But I am out of my depth here and might be severely misunderstanding
> what's going on.

Same here :-) Especially since I have no idea what's going on with RISC-V
with two different tagging lengths.

Thanks
Barry
