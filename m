Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2AC2E0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748969617; cv=none; b=XVMq8MBEAZ84rxArLsSzd4cjVLvhprHkwsDVxvAIW6my8wiPISLXBOh867oanT9oIOIkyArZquvli56D+SAS0MKMZWwdZ2BDbmRsuqqt8TuRg3sqFZvybEGSmeQnqX9ivaIO5P5o8BtFMAPWfJKgYYZQKn3GAtLAFUeghSex8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748969617; c=relaxed/simple;
	bh=YzPCDM4J3v1EDag0WEsJprASWJ+tsRl6742oVfNq3ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBgtiTLcG2ol7xUxfJEj++hVgoZuOh7xCptxa4zQ7+SC0Ud+42MBbsZyqAL+AlFEQkPIU5Q0erqEFzVuEIj/JchM393whuEA1njjLodIgv2NSgZa2um2E/LACMO4a4DncgOBeRpupdutTtwXQJTokJC7d07Dlx3FSOJw6dMu7iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e5lc+Ojb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e5lc+Ojb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so406a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748969613; x=1749574413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQRQzkESXtxwAedI/ayC9kgQGUTy61o9qZHR4qLBeQw=;
        b=e5lc+Ojb1hnAqPJW39SBFu+rZGar0MiioiiAmLQ+Aa9IpTQQbCBkDzH0Fgf4sgCBad
         Ju/m/wvcyavle/mBwLQVLGydYRf4DnrWKjIXUJx9IWQ196H9HSO+lFpcvAbuT82utqrC
         UUwdTiXaTW6TsVTSWX6Hl8+tEdbo31JH57dd9HDvo5IOB0Rl3KcTXnk2YsQCCswDd1h3
         xSwVLVQOfGfOyjEfH8JTde7G3Pre1yQI3mcTDJFCfDvy1b3I9nnzY5Zs+fkduCDqu70P
         f25MLS1DhPSVldkw/nU4E8BT3iLYEiEGTU7UIsPo6yDHMJnV0SJ4ZAemxQY54jLbFbhn
         AtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748969613; x=1749574413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQRQzkESXtxwAedI/ayC9kgQGUTy61o9qZHR4qLBeQw=;
        b=j+NewDKFzoC+m+VoBAkcQsDRKrh75TTdBvkNKjq+7j8jbVFaTlpz+itE2ccEBSBmow
         ZyZ5FeDWxO5ZCBJOXd8BnD7gOnPZq0WTrTKjSMZnryQbTjVxxD3P+1LHVCwntfpqoFWj
         lHLnCXfXWKsuIpuL3Xxv+0BMIQB8GYvaulrrEMXelXvzmB1fTyjJrS07XjHUH0/DYISh
         xVGl3ArSebhK7jOteGAKG0xcRb/cogWmui4ux8oRkh9q1B7Ty31tUTp1F3lbEN3Fb4PS
         QNRaBwnwVqGifH6wP4gbDm5ErYNJVWIts6DnU/qowjS2eTLTtigT56RkN4kflZQtQ3PW
         Vj4w==
X-Forwarded-Encrypted: i=1; AJvYcCVpECfIf7PzstOyH7bo+wt3ZIhW8wuTgCYhP9wSW9SXfMWjrJcYWYLKuK5F17rlIWug+7RbBiFHtb2G/tY=@vger.kernel.org
X-Gm-Message-State: AOJu0YycZw9ozA5x/WRWT4RJCqHrBGnNvq/61MZRL7mGwrLOF8HVBCEn
	68CLGtUGfcPAO9eMKMqsF2ckdZdtKEOxjlRByqq4/2JKD8dppHJ2bQ6yOiQqIW7BucnqEmzacnp
	wRgsK1v7xUjOmiql45PZuLEZzMOmQKgzAtJiqfWDA
X-Gm-Gg: ASbGncvmVdhDc4QI3Gj9iSHNbkG4aIZ7Ha+GT7oP800DZ8nsMgiEGex3YONwtugrFzr
	/WF4wIaR0bofUAYu1nkxRxfMFW0rXM21nK9z/9iKm/XjcUPBV93O4b8eBUZXhqFx7h4ODVp9smi
	Y1s6LbEh59DWZ2QjMOCjdZkpZNnQAQ531ZuTvmlyNXOPVqJwNHPdzTMLmmHTtK1ryIcSQ=
X-Google-Smtp-Source: AGHT+IEjyPVAixvQ48Mf5PcyJ0C13KrE2bBZOk0v6HCuqfJ6L3mrWzcICGIyt7ZXGdHIHOcTSK1RGAoiTIp6X9YbW4M=
X-Received: by 2002:aa7:c313:0:b0:601:233a:4f4d with SMTP id
 4fb4d7f45d1cf-606a90c1e5emr139670a12.2.1748969613185; Tue, 03 Jun 2025
 09:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local> <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
 <CAGsJ_4y0LJRdMg3-0NC6n9-UvRXAEuwHzEL7KMJ3dD1CUkQa9w@mail.gmail.com>
In-Reply-To: <CAGsJ_4y0LJRdMg3-0NC6n9-UvRXAEuwHzEL7KMJ3dD1CUkQa9w@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 3 Jun 2025 18:52:55 +0200
X-Gm-Features: AX0GCFt6JfcbuOOtCdeDDbdlzWDOtBwMsi7UT2u1gikHKgUMJVf-UXRivyKhNEM
Message-ID: <CAG48ez0L_dRjArd_NMVSeQ3eJ5pGLJgNppsHxpBuBQbQHPU57w@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Barry Song <21cnbao@gmail.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 9:06=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrote=
:
> On Sat, May 31, 2025 at 8:41=E2=80=AFAM Jann Horn <jannh@google.com> wrot=
e:
> > On Fri, May 30, 2025 at 4:34=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > > On Fri, May 30, 2025 at 04:06:30PM +0200, Jann Horn wrote:
> > > > On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmail.=
com> wrote:
> > > > One important quirk of this is that it can, from what I can see, ca=
use
> > > > freeing of page tables (through pt_reclaim) without holding the mma=
p
> > > > lock at all:
> > > >
> > > > do_madvise [behavior=3DMADV_DONTNEED]
> > > >   madvise_lock
> > > >     lock_vma_under_rcu
> > > >   madvise_do_behavior
> > > >     madvise_single_locked_vma
> > > >       madvise_vma_behavior
> > > >         madvise_dontneed_free
> > > >           madvise_dontneed_single_vma
> > > >             zap_page_range_single_batched [.reclaim_pt =3D true]
> > > >               unmap_single_vma
> > > >                 unmap_page_range
> > > >                   zap_p4d_range
> > > >                     zap_pud_range
> > > >                       zap_pmd_range
> > > >                         zap_pte_range
> > > >                           try_get_and_clear_pmd
> > > >                           free_pte
> > > >
> > > > This clashes with the assumption in walk_page_range_novma() that
> > > > holding the mmap lock in write mode is sufficient to prevent
> > > > concurrent page table freeing, so it can probably lead to page tabl=
e
> > > > UAF through the ptdump interface (see ptdump_walk_pgd()).
> > >
> > > Hmmmmmm is this because of the series that allows page table freeing =
on
> > > zap... I think Zi's?
> >
> > Yeah, that was Qi Zheng's
> > https://lore.kernel.org/all/92aba2b319a734913f18ba41e7d86a265f0b84e2.17=
33305182.git.zhengqi.arch@bytedance.com/
> > .
> >
> > > We need to update the documentation on this then... which currently s=
tates
> > > the VMA need only be stable.
> > >
> > > I guess this is still the case except for the novma walker you mentio=
n.
> > >
> > > Relatedly, It's worth looking at Dev's series which introduces a conc=
erning
> > > new 'no lock at all' mode to the page table walker explicitly for nov=
ma. I
> > > cc'd you :) See [0].
> > >
> > > [0]: https://lore.kernel.org/linux-mm/6a60c052-9935-489e-a38e-1b03a1a=
79155@lucifer.local/
> >
> > Yeah, I saw that you CC'ed me; at a first glance that seems relatively
> > innocuous to me as long as it's only done for kernel mappings where
> > all the rules are different.
> >
> > >
> > > >
> > > > I think before this patch can land, you'll have to introduce some n=
ew
> > > > helper like:
> > > >
> > > > void mmap_write_lock_with_all_vmas(struct mm_struct *mm)
> > > > {
> > > >   mmap_write_lock(mm);
> > > >   for_each_vma(vmi, vma)
> > > >     vma_start_write(vma);
> > > > }
> > > >
> > > > and use that in walk_page_range_novma() for user virtual address sp=
ace
> > > > walks, and update the comment in there.
> > >
> > > What dude? No, what? Marking literally all VMAs write locked? :/
> > >
> > > I think this could have unexpected impact no? We're basically disabli=
ng VMA
> > > locking when we're in novma, that seems... really silly?
> >
> > I mean, walk_page_range_novma() being used on user virtual address
> > space is pretty much a debug-only thing, I don't think it matters if
> > it has to spend time poking flags in a few thousand VMAs. I guess the
> > alternative would be to say "ptdump just doesn't show entries between
> > VMAs, which shouldn't exist in the first place", and change ptdump to
> > do a normal walk that skips over userspace areas not covered by a VMA.
> > Maybe that's cleaner.
> >
> > But FWIW, we already do worse than what I proposed here when
> > installing MMU notifiers, with mm_take_all_locks().
> >
> > > > > +       else
> > > > > +               __madvise_unlock(mm, madv_behavior->behavior);
> > > > > +}
> > > > > +
> > > > >  static bool madvise_batch_tlb_flush(int behavior)
> > > > >  {
> > > > >         switch (behavior) {
> > > > > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_=
struct *mm,
> > > > >                 unsigned long start, size_t len_in,
> > > > >                 struct madvise_behavior *madv_behavior)
> > > > >  {
> > > > > +       struct vm_area_struct *vma =3D madv_behavior->vma;
> > > > >         int behavior =3D madv_behavior->behavior;
> > > > > +
> > > > >         struct blk_plug plug;
> > > > >         unsigned long end;
> > > > >         int error;
> > > > >
> > > > >         if (is_memory_failure(behavior))
> > > > >                 return madvise_inject_error(behavior, start, star=
t + len_in);
> > > > > -       start =3D untagged_addr_remote(mm, start);
> > > > > +       start =3D untagged_addr(start);
> > > >
> > > > Why is this okay? I see that X86's untagged_addr_remote() asserts t=
hat
> > > > the mmap lock is held, which is no longer the case here with your
> > > > patch, but untagged_addr() seems wrong here, since we can be operat=
ing
> > > > on another process. I think especially on X86 with 5-level paging a=
nd
> > > > LAM, there can probably be cases where address bits are used for pa=
rt
> > > > of the virtual address in one task while they need to be masked off=
 in
> > > > another task?
> > > >
> > > > I wonder if you'll have to refactor X86 and Risc-V first to make th=
is
> > > > work... ideally by making sure that their address tagging state
> > > > updates are atomic and untagged_area_remote() works locklessly.
> > >
> > > Yeah I don't know why we're doing this at all? This seems new unless =
I
> > > missed it?
> >
> > Because untagged_addr_remote() has a mmap_assert_locked(mm) on x86 and
> > reads data that is updated under the mmap lock, I think? So without
> > this change you should get a lockdep splat on x86.
> >
> > > > (Or you could try to use something like the
> > > > mmap_write_lock_with_all_vmas() I proposed above for synchronizing
> > > > against untagged_addr(), first write-lock the MM and then write-loc=
k
> > > > all VMAs in it...)
> > >
> > > This would completely eliminate the point of this patch no? The whole=
 point
> > > is not taking these locks... And I'm very much not in favour of
> > > write-locking literally every single VMA. under any circumstances.
> >
> > I'm talking about doing this heavyweight locking in places like
> > arch_prctl(ARCH_ENABLE_TAGGED_ADDR, ...) that can, if I understand
> > correctly, essentially reconfigure the size of the virtual address
> > space of a running process from 56-bit to 47-bit at the hardware level
> > and cause address bits that were previously part of the virtual
> > address to be ignored. READ_ONCE()/WRITE_ONCE() might do the job too,
> > but then we'll have to keep in mind that two subsequent invocations of
> > untagged_addr() can translate a userspace-specified virtual address
> > into two different virtual addresses at the page table level.
>
> I=E2=80=99m confused about how arch_prctl(ARCH_ENABLE_TAGGED_ADDR, ...) c=
an
> reconfigure a running process from using 56-bit addresses to 47-bit.
> I read the code and see the x86 kernel only supports LAM U57, and not
> LAM U48 at all:
>
> static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long n=
r_bits)
> {
>         ...
>
>         if (!nr_bits || nr_bits > LAM_U57_BITS) {
>                 mmap_write_unlock(mm);
>                 return -EINVAL;
>         }
>
>         mm_enable_lam(mm);
>         mmap_write_unlock(mm);
>
>         return 0;
> }

Oh, you're right, currently only LAM U57 is supported by Linux, I was
making bad assumptions.

commit 2f8794bd087e, which introduced that code, also mentions that
"For now only LAM_U57 is supported, with 6 tag bits".

> I still don't fully understand why x86 differs from ARM64,
> where the same bit mask is always applied unconditionally.
>
> On ARM64, we can even enable or disable PROT_MTE on a per-VMA basis
> using mmap or mprotect. However, the same bitmask operation is
> always executed regardless of whether memory tags are present for a
> given VMA.

Hmm, true, that does look like a weird difference.

> I mean, on arm64, if a process or a VMA doesn't have tag access
> enabled, and we pass an address with high bits to madvise,
> untagged_addr() will still strip the tag. But wouldn't that address
> be invalid for a process or VMA that doesn't have TBI enabled?

Yeah, I guess in that regard it might be fine to always strip the bits...

Maybe the situation on arm64 is simpler, in that these bits are always
either tag bits or unused on arm64, while my understanding is that on
X86, the CPU supports changing the meaning of address bits between
"part of virtual address" and "ignored tag bits". So I think stripping
the bits might work fine for LAM U57, but not for LAM U48, and maybe
the code is trying to be future-proof in case someone wants to add
support for LAM U48?

It is arguably also a bit more robust to reject garbage addresses
instead of ignoring bits that would cause the CPU to treat the address
as noncanonical, but I guess doing that just in MM code is not a big
problem. (Unless someone relies on seccomp filters that block
manipulation of specific virtual address ranges via munmap() and such,
but I think almost nobody does that. I think I've only seen that once
in some rarely-used component of the Tor project.)

But I am out of my depth here and might be severely misunderstanding
what's going on.
