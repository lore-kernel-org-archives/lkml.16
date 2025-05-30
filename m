Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E282750FB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637687; cv=none; b=caTuErUm0N/tyTQcTyBCgbPexuDiughZj+91jKcMVvVHAQNEAdxWwLwBglYss4mOtuvaAiXiYc4sVABVsdksILneLpf/Ylm1p42blYLowqtDjgK1bkNz+RKnWRDC8zyZeyKLq+E429AIkK0wITrwkUzJ+IwCmeDbMHWlaR6QYL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637687; c=relaxed/simple;
	bh=Aft2BwLYQCN5CXqIQ7L9H8EmLm/8RU1dJXBxcZpGCWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtmwC7kpqEdHyZM/UoTwEv19uaYuRhpuMBHLDWQqMVa6GOLQLig8Dgd6QvuENoCNNweYlBtOigIupL0btPpTIloHd39guuvZX+VmOMtDWgpkrahZ0uUKqr5QvB1mSNdjOEPIwIzhDXV5qoybaUbPxBuyTLcfOOyGZq6ywNSJN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bOdzoiFu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bOdzoiFu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso897a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748637683; x=1749242483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ+fMUsaHfvo2SozDYxIz7fGRWQ2EutqwsUhlBfkD7E=;
        b=bOdzoiFu08/L1UgkO2iwURGe7hxZG45S9GYkaSol2SvbYB+c7w6KvtFFGehBsGUuiO
         NEWKkJsAH1Ai9iL3eAINozJn4CkSnRyfuHESoHSlmzu/UsMmPKEfrut0QA4I4E8id83g
         jwTZUVPOt87f7vrC49Ez3+VabsoBq4WKfoUsV1qMVI91zMQjQDOAVnIwLP47k1cZaq8n
         o/QW5O/vr7UZmdXPQ6ITDgtDIn8IJf5vbawgSoECG1fjNn1PQwkC1UYAUEE9fOdGm1he
         CZ+vojJ18IYjDmkl3SXjOCbI3ALsBwh2IycU3+8lmc4aTp5jEMBmm8GUEPizBjZ+RrJ3
         EsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748637683; x=1749242483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZ+fMUsaHfvo2SozDYxIz7fGRWQ2EutqwsUhlBfkD7E=;
        b=XmDcCPmoaClEuaBz+kEBEOfKgv8TIrMkDQ5all5G0Me6RzfcHwY7/woY2eYznk9d+J
         vzFnymzvhGdo9+DCLKuwb56aN0/GWXCEgiLORRMApxtmTc/jyTVjELaw0dEYAPijytFz
         IIC5mVicwkM2za6zOnQqEa15g5WjxBCrywlJ59L4hitP4uvtuaBCe34/2tTFKEbbK6Kb
         enB1wPOipby+cCCs7q2aFqGsOZd3qhvp2kNM8/3bmv1FUwk+/BMXnPc8sQUMQP6WqggR
         2tW5WvXbhN7p/4VAbm1UyxQHyUsQ3XDudIQU2gnCA4bf/rPexqV4WNn6r88JgojPsyBX
         qkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtrW9244u5+Yjv60+8/Gn3Z6K++tTdAuqcUDXF96+q/7CWCblcHJWyDORo48E9rw4s0LhTfD+aCqZsips=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0GdKbhDfSt5q7si+VtYk3sbODJeZjjdrviuAF5K7HcfFP8SL/
	eHe/tn/tMg4d1NwztqbR4La9r/EPiH+/Iq1Ak9ahMhxtJyrq6We8WnC1sE5JEXbDvrPimaaoLDE
	/jgp+6Coi3hSzeqhowWxLPaVeZq+QOFFOAWJ5SCwo
X-Gm-Gg: ASbGncszsTMMZJoWia2izmtMLk6lnyj0a5QyqkbbIjHtpmP6nmyVLG8mvo1zLp/emBS
	6gVJW7TQkNDxPK108ITFBMySQDqbuhPdkC2eNUdtxMOH4kzTNZN5RG8t7r1HwgAJTzU9gtEhRVu
	83TwZAEYR+QC1GICRASh64RZHVHqiCbSBdkciAR7HOGgiuXhlfP8Yw+0UKb/32/jxoIACHJ8OaK
	rbOe6N8
X-Google-Smtp-Source: AGHT+IHs3E34RoNhUSw7HhD+qRy8tkateGf+6/YvHLUuDqovim/6aypcRZUjMmT8/ezjQIUbyqJ6Y6U2BqHuROdtrK4=
X-Received: by 2002:a50:d494:0:b0:600:9008:4a40 with SMTP id
 4fb4d7f45d1cf-605adffe9ecmr23910a12.4.1748637682985; Fri, 30 May 2025
 13:41:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local>
In-Reply-To: <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 22:40:47 +0200
X-Gm-Features: AX0GCFvDWkEoZpflVNcH3G_c--yr3b6OvmHSlYd_eMhXYL9WXt3wqgJDaJLq0no
Message-ID: <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
	Lokesh Gidra <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 4:34=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Barry - I was going to come back to this later, but Jann's sort of bumped
> this in my inbox.
>
> This implementation isn't quite what I was after, would you give me a
> little bit before a respin so I can have a think about this and make
> sensible suggestions?
>
> Thanks!
>
> On Fri, May 30, 2025 at 04:06:30PM +0200, Jann Horn wrote:
> > On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmail.com>=
 wrote:
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

Yeah, that was Qi Zheng's
https://lore.kernel.org/all/92aba2b319a734913f18ba41e7d86a265f0b84e2.173330=
5182.git.zhengqi.arch@bytedance.com/
.

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

Yeah, I saw that you CC'ed me; at a first glance that seems relatively
innocuous to me as long as it's only done for kernel mappings where
all the rules are different.

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

I mean, walk_page_range_novma() being used on user virtual address
space is pretty much a debug-only thing, I don't think it matters if
it has to spend time poking flags in a few thousand VMAs. I guess the
alternative would be to say "ptdump just doesn't show entries between
VMAs, which shouldn't exist in the first place", and change ptdump to
do a normal walk that skips over userspace areas not covered by a VMA.
Maybe that's cleaner.

But FWIW, we already do worse than what I proposed here when
installing MMU notifiers, with mm_take_all_locks().

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

Because untagged_addr_remote() has a mmap_assert_locked(mm) on x86 and
reads data that is updated under the mmap lock, I think? So without
this change you should get a lockdep splat on x86.

> > (Or you could try to use something like the
> > mmap_write_lock_with_all_vmas() I proposed above for synchronizing
> > against untagged_addr(), first write-lock the MM and then write-lock
> > all VMAs in it...)
>
> This would completely eliminate the point of this patch no? The whole poi=
nt
> is not taking these locks... And I'm very much not in favour of
> write-locking literally every single VMA. under any circumstances.

I'm talking about doing this heavyweight locking in places like
arch_prctl(ARCH_ENABLE_TAGGED_ADDR, ...) that can, if I understand
correctly, essentially reconfigure the size of the virtual address
space of a running process from 56-bit to 47-bit at the hardware level
and cause address bits that were previously part of the virtual
address to be ignored. READ_ONCE()/WRITE_ONCE() might do the job too,
but then we'll have to keep in mind that two subsequent invocations of
untagged_addr() can translate a userspace-specified virtual address
into two different virtual addresses at the page table level.
