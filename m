Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA3A2690C8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934391; cv=none; b=lDPMN40yu/o8hTYVqmUnmKbNT56U1SXJAvjbbSMWdmHkDcMCWpGlm0naUgTmOrvgZS++7b3x2cQC0mRLpROqmpBF+Okkp5StBtSn+SqTBwNP27h/iov+tGdBt/Rx8mAQG9ilYekMfEnKEgIfuk+/XjsjHFPKd9uQCJtoN0MyCQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934391; c=relaxed/simple;
	bh=Pcvt8tLciMfuBwsRHOidNWQzHeOgwibU0d8Wlh4f5o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVwc+aS3p6RbcXdE0M9CSfR2GdvZGEufV62Rl9SiQ2CsDuoR5tBxIGA3NOwN+PqHs9KOgyVQyGVU1/I+fUO0YEZpjl4p0LPHtEIK8T/PtPW6gEsAROd9I/20cuE6kwcVehPYjDd0FKgB1XC+r18uhBvMaeJ72DAT8KpGPYwQaHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgeCE0OO; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgeCE0OO"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-530802fd5cdso1407269e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748934388; x=1749539188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sObAWsrJ5ZBZRLi4kwOyELlX1Cpss2QS7Q/UEJ4ssaU=;
        b=LgeCE0OOzo3JoAuJJncg3Iosnik8HF+qL0MVGjMfu5gOebkKKRBrofn4uSeGpXk1Oa
         H/Dh+3AJvY5BJQHEMBFcWdgw++7c7NszAIxA248BEP3tt2eegAaKDfJ9Q+yjlsBMNbKn
         TNH3o5+38QiCgBC6A80aqrlRigJmuYZyDPTcdkgJAcZ6mrDoTAQU7nyZWTC7Tnnal2EZ
         6b7g6zAYh+IemMXBLXSDbWXt9OQC1BLIyvvFUVIl0L8Oo3UoOVniDxoevHGIdvTAJo0w
         mN/NItkHJoshCFKbUdi1p4ZyAdHCERGNfCWiiNF1IBv79ICi22z5F3jy4X5/E8l914d9
         fSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934388; x=1749539188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sObAWsrJ5ZBZRLi4kwOyELlX1Cpss2QS7Q/UEJ4ssaU=;
        b=detPtUi1lDEL+yoo7VxJWE0acL0c1UB+HDi3G9jCWtovMsNOEatervGXsths2MBuIp
         L491r5g8AFpD5o8wNGqTBQ2xzu5M6mZCmqZrJiBjp2lbJsGB8nT6sAAo0MSd1LfUddsG
         DFPr2EeXOVbfwtNpUN1ttbl7ceUJE6L9wW/s9NY4eL9KRzd56oCy/iiT+0MKxE0bsfWx
         hLeMx2b00UQZH2GbeX72EnJqQqAKrVJol7SFDdIScB2utcgiJemfdAlqX87Zatoc5bf5
         FMYbwJ9SMABWtUqm9c4icpM1Bb6f+5TkAd1O9zStR3xEkkbXU4bdKH4RosiEI0Myk7pr
         rr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXe3mqjPY6jMT237WjIbnXGSj9eZf9Wmd1xi6axoWVE//metGNNCmehMmT4TX4B7uCCFPY3/h7sa1uwzWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6zZ5N4PBAKy3iuyrzrrt0C3+Grc/xZmWOOh4UJPdZuRssXVRX
	jmjGqTn6fDf2vrJcWfhF8xVmXgnd5KcRQJgmiSDhHts0hQdX21Fa3Di4/cG1X8pedb7tx/G3SKN
	hmnDN9hc4sKLlTpEwV6jFZUDuqaIauqQ=
X-Gm-Gg: ASbGncsj5O4bfatwfrJaEdgomJWBd7BS9hBFZSuqZxiFhiDYe1pgF+anbGs4kMd4H9F
	uMEM/PMzjDQIzrwFMcfW1CBrWMvmr50KcSWGZ4dwsX6t+s/q0C0V/+VECoCzxoAtI+qt1mTv5d/
	4lyvnFsGWHXholQkhZ5dfIZbgow3qQ639oJg==
X-Google-Smtp-Source: AGHT+IFgxM277lZpa2B3Lrllf3ZISbTA7LdOXghtJE1KYNhyL0d8+gJhNSO6JMPfxbIdCb3IWgMbPe1K9GMriToyaQw=
X-Received: by 2002:a05:6122:658b:b0:530:65f0:7fcf with SMTP id
 71dfb90a1353d-53080f4443emr11625555e0c.1.1748934387774; Tue, 03 Jun 2025
 00:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local> <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
In-Reply-To: <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 19:06:16 +1200
X-Gm-Features: AX0GCFvjSl1QW5m77TVMmrcJF3x3HUNvTB2vCn4KXpj-ivn5L-XiksBy_ZeMpNM
Message-ID: <CAGsJ_4y0LJRdMg3-0NC6n9-UvRXAEuwHzEL7KMJ3dD1CUkQa9w@mail.gmail.com>
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

On Sat, May 31, 2025 at 8:41=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> On Fri, May 30, 2025 at 4:34=E2=80=AFPM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > Barry - I was going to come back to this later, but Jann's sort of bump=
ed
> > this in my inbox.
> >
> > This implementation isn't quite what I was after, would you give me a
> > little bit before a respin so I can have a think about this and make
> > sensible suggestions?
> >
> > Thanks!
> >
> > On Fri, May 30, 2025 at 04:06:30PM +0200, Jann Horn wrote:
> > > On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmail.co=
m> wrote:
> > > One important quirk of this is that it can, from what I can see, caus=
e
> > > freeing of page tables (through pt_reclaim) without holding the mmap
> > > lock at all:
> > >
> > > do_madvise [behavior=3DMADV_DONTNEED]
> > >   madvise_lock
> > >     lock_vma_under_rcu
> > >   madvise_do_behavior
> > >     madvise_single_locked_vma
> > >       madvise_vma_behavior
> > >         madvise_dontneed_free
> > >           madvise_dontneed_single_vma
> > >             zap_page_range_single_batched [.reclaim_pt =3D true]
> > >               unmap_single_vma
> > >                 unmap_page_range
> > >                   zap_p4d_range
> > >                     zap_pud_range
> > >                       zap_pmd_range
> > >                         zap_pte_range
> > >                           try_get_and_clear_pmd
> > >                           free_pte
> > >
> > > This clashes with the assumption in walk_page_range_novma() that
> > > holding the mmap lock in write mode is sufficient to prevent
> > > concurrent page table freeing, so it can probably lead to page table
> > > UAF through the ptdump interface (see ptdump_walk_pgd()).
> >
> > Hmmmmmm is this because of the series that allows page table freeing on
> > zap... I think Zi's?
>
> Yeah, that was Qi Zheng's
> https://lore.kernel.org/all/92aba2b319a734913f18ba41e7d86a265f0b84e2.1733=
305182.git.zhengqi.arch@bytedance.com/
> .
>
> > We need to update the documentation on this then... which currently sta=
tes
> > the VMA need only be stable.
> >
> > I guess this is still the case except for the novma walker you mention.
> >
> > Relatedly, It's worth looking at Dev's series which introduces a concer=
ning
> > new 'no lock at all' mode to the page table walker explicitly for novma=
. I
> > cc'd you :) See [0].
> >
> > [0]: https://lore.kernel.org/linux-mm/6a60c052-9935-489e-a38e-1b03a1a79=
155@lucifer.local/
>
> Yeah, I saw that you CC'ed me; at a first glance that seems relatively
> innocuous to me as long as it's only done for kernel mappings where
> all the rules are different.
>
> >
> > >
> > > I think before this patch can land, you'll have to introduce some new
> > > helper like:
> > >
> > > void mmap_write_lock_with_all_vmas(struct mm_struct *mm)
> > > {
> > >   mmap_write_lock(mm);
> > >   for_each_vma(vmi, vma)
> > >     vma_start_write(vma);
> > > }
> > >
> > > and use that in walk_page_range_novma() for user virtual address spac=
e
> > > walks, and update the comment in there.
> >
> > What dude? No, what? Marking literally all VMAs write locked? :/
> >
> > I think this could have unexpected impact no? We're basically disabling=
 VMA
> > locking when we're in novma, that seems... really silly?
>
> I mean, walk_page_range_novma() being used on user virtual address
> space is pretty much a debug-only thing, I don't think it matters if
> it has to spend time poking flags in a few thousand VMAs. I guess the
> alternative would be to say "ptdump just doesn't show entries between
> VMAs, which shouldn't exist in the first place", and change ptdump to
> do a normal walk that skips over userspace areas not covered by a VMA.
> Maybe that's cleaner.
>
> But FWIW, we already do worse than what I proposed here when
> installing MMU notifiers, with mm_take_all_locks().
>
> > > > +       else
> > > > +               __madvise_unlock(mm, madv_behavior->behavior);
> > > > +}
> > > > +
> > > >  static bool madvise_batch_tlb_flush(int behavior)
> > > >  {
> > > >         switch (behavior) {
> > > > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_st=
ruct *mm,
> > > >                 unsigned long start, size_t len_in,
> > > >                 struct madvise_behavior *madv_behavior)
> > > >  {
> > > > +       struct vm_area_struct *vma =3D madv_behavior->vma;
> > > >         int behavior =3D madv_behavior->behavior;
> > > > +
> > > >         struct blk_plug plug;
> > > >         unsigned long end;
> > > >         int error;
> > > >
> > > >         if (is_memory_failure(behavior))
> > > >                 return madvise_inject_error(behavior, start, start =
+ len_in);
> > > > -       start =3D untagged_addr_remote(mm, start);
> > > > +       start =3D untagged_addr(start);
> > >
> > > Why is this okay? I see that X86's untagged_addr_remote() asserts tha=
t
> > > the mmap lock is held, which is no longer the case here with your
> > > patch, but untagged_addr() seems wrong here, since we can be operatin=
g
> > > on another process. I think especially on X86 with 5-level paging and
> > > LAM, there can probably be cases where address bits are used for part
> > > of the virtual address in one task while they need to be masked off i=
n
> > > another task?
> > >
> > > I wonder if you'll have to refactor X86 and Risc-V first to make this
> > > work... ideally by making sure that their address tagging state
> > > updates are atomic and untagged_area_remote() works locklessly.
> >
> > Yeah I don't know why we're doing this at all? This seems new unless I
> > missed it?
>
> Because untagged_addr_remote() has a mmap_assert_locked(mm) on x86 and
> reads data that is updated under the mmap lock, I think? So without
> this change you should get a lockdep splat on x86.
>
> > > (Or you could try to use something like the
> > > mmap_write_lock_with_all_vmas() I proposed above for synchronizing
> > > against untagged_addr(), first write-lock the MM and then write-lock
> > > all VMAs in it...)
> >
> > This would completely eliminate the point of this patch no? The whole p=
oint
> > is not taking these locks... And I'm very much not in favour of
> > write-locking literally every single VMA. under any circumstances.
>
> I'm talking about doing this heavyweight locking in places like
> arch_prctl(ARCH_ENABLE_TAGGED_ADDR, ...) that can, if I understand
> correctly, essentially reconfigure the size of the virtual address
> space of a running process from 56-bit to 47-bit at the hardware level
> and cause address bits that were previously part of the virtual
> address to be ignored. READ_ONCE()/WRITE_ONCE() might do the job too,
> but then we'll have to keep in mind that two subsequent invocations of
> untagged_addr() can translate a userspace-specified virtual address
> into two different virtual addresses at the page table level.

I=E2=80=99m confused about how arch_prctl(ARCH_ENABLE_TAGGED_ADDR, ...) can
reconfigure a running process from using 56-bit addresses to 47-bit.
I read the code and see the x86 kernel only supports LAM U57, and not
LAM U48 at all:

static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long nr_=
bits)
{
        ...

        if (!nr_bits || nr_bits > LAM_U57_BITS) {
                mmap_write_unlock(mm);
                return -EINVAL;
        }

        mm_enable_lam(mm);
        mmap_write_unlock(mm);

        return 0;
}

I still don't fully understand why x86 differs from ARM64,
where the same bit mask is always applied unconditionally.

On ARM64, we can even enable or disable PROT_MTE on a per-VMA basis
using mmap or mprotect. However, the same bitmask operation is
always executed regardless of whether memory tags are present for a
given VMA.

I mean, on arm64, if a process or a VMA doesn't have tag access
enabled, and we pass an address with high bits to madvise,
untagged_addr() will still strip the tag. But wouldn't that address
be invalid for a process or VMA that doesn't have TBI enabled?

Thanks
Barry
