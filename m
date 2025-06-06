Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258AC2045AD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208114; cv=none; b=rsnLKnZGlxVuLY2DicwRKcLXIGc2rjAtGXea1d/ZaXkVlxvQ447CGQaLdu9CL6wSYiX48f6fg41LRci1QfoSp5+30ymUxvCSIr+OryAGHbdjaPgOdTy8Evnn/2nkR2tqyW/861hDRIeHZ9uRWUnCdAABa9h7jI5z2mh2W9Ha5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208114; c=relaxed/simple;
	bh=Y4anki7ievT51LDNzPcc4VRYYKJbQ92qMIXRtrgKf3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+5rrUi/V2m9vnHPMH4SHFuRlvAc73FUURckn8PgcrQqClFKI8nlXzvPD8Hr74IE009PcchuxGiM4Bpt1hoHddy27ksTPGg61UeTfZiLApoXAiXjlQzpiAJtTaFp9pQVy6mLDzhX0cY8+YvdCEpgzwt1irtPmj50DyUB2hE/0AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dcO26ECX; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dcO26ECX"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so9793a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749208111; x=1749812911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4QshsNtFlBM5Nr7CIE3i+/CEVwa1E3Te+i573d46rQ=;
        b=dcO26ECXCpZNt4viTv5JfnMWYrKTqdyN4jCCmVOn9amJXHqFjgPsNyCvRLwBgrInj9
         FoLET5s0zQ8Fj+GKTlMJb+ilDWiVFjt3CLiC4dkRqHc+MRqLXL+fLGsQ6YIm7FSmnJna
         Ud219K+iYm+ftp5phB35TIoTeYwyw9PHdVRJY/AcFqDDOc7wQSkvOSd7iR3x6nfr5HD8
         i5ndNZapqTLj4dqmWErHokCoLeG7TISKLI7wIexoiO210Jcheu7L05MfGhjHpfSB6UZP
         bGHRo43I6yFBZ84wW8RvXRs1MWA+WB275z+ekq6bKmJRltbuYVnFhCUudJB7QX2OtXmz
         GOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749208111; x=1749812911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4QshsNtFlBM5Nr7CIE3i+/CEVwa1E3Te+i573d46rQ=;
        b=N3ebW9ejNF/wFni5a0qDyLqOYN0rAwT4DKawQPNV4f/bzXaR7OxcBa9xy/5UC+JYSt
         22RA3Vd4lR6NLqvidDROU4PEZbYvS6BbjiO41zLWGZet6m1w41x8lxEmGo2gkqd7eSyq
         4Gjqz0YOBegc5CLfQxdJByN0b1fGo1SxtymeSStIgAoE3fUbbFjDKgsa4ssERHyiFNQ8
         FMdxw+WXAFKCagL2Ol1ujsOy7zDMoX9ycgPTyXNhPXM1gpdMSD8Ahv0gGijdB9ZiPycr
         3mVHKoLoSaCaHsXwLsfWF19F6aVbRSTZvCzhHKV2QAiJpyxh+HxrforLRhJ01UxOA/Js
         X6aw==
X-Forwarded-Encrypted: i=1; AJvYcCWzjCwJwgA4knd7Vgi/nnf0HsPRHcOAh8tcW3m3B3j2pZvtbpI+Pv/Eg7LgoUzU0muP84H6qNrYGnx6/P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGI3sTUnGF+ncx6iGmSIlWZ9t1G10FPMN+OZsEwQBComfWH58
	jbUG6/1R8romv49m+eGrOe0zducOjEA2Skd9eYplYQpZYhi0YP99EhyNqHVUnRjjy3spI824Lh6
	uMEzXps5I1EQAKg84t+mA7Hcv96ZqSO1xQS7k086p
X-Gm-Gg: ASbGnct77FHTDEGHtCSlaSieGiABo05zoy8bt0+vUc8B/DJTvW34GHrOSeBqbTbWNa2
	Rx2D+zcW4TWPD2rbcKkupuOEv0jvD4GRpjAn/v+2P+rOvJcUJD2rJCD7jG/TfxLN3Q4DUJrcxXe
	4cu97nLDJfZwtavwVJuKzvWISKVoiYltYy9WQOHqogdFzE2u/pyNK6ZW7fzcBmETUxL06aTg==
X-Google-Smtp-Source: AGHT+IFzJK1PmF+ubahnyn3+Q756t7KJvt+rp8ZMsFN3/mcorsJT8TiEEZKFL71ZKG4v26uGjEh+iNVgLntRQ/Zd8tY=
X-Received: by 2002:a05:6402:344:b0:607:2070:3a4 with SMTP id
 4fb4d7f45d1cf-60773ec8ca6mr84433a12.2.1749208110975; Fri, 06 Jun 2025
 04:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com> <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com> <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
In-Reply-To: <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Fri, 6 Jun 2025 13:07:54 +0200
X-Gm-Features: AX0GCFv6lixFuiId659KjPXOkzqXx1PP1aVQxHcGUT1KxI_F8oqFZhplOl6k-ZI
Message-ID: <CAG48ez2NUHKKj0mgxuHaPHx5XLZeEN4DCFcbtO8iaqTqs9-hOg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>, Barry Song <21cnbao@gmail.com>, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 7:50=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Wed, Jun 04, 2025 at 02:02:12PM +0800, Qi Zheng wrote:
> > Hi Lorenzo,
> >
> > On 6/3/25 5:54 PM, Lorenzo Stoakes wrote:
> > > On Tue, Jun 03, 2025 at 03:24:28PM +0800, Qi Zheng wrote:
> > > > Hi Jann,
> > > >
> > > > On 5/30/25 10:06 PM, Jann Horn wrote:
> > > > > One important quirk of this is that it can, from what I can see, =
cause
> > > > > freeing of page tables (through pt_reclaim) without holding the m=
map
> > > > > lock at all:
> > > > >
> > > > > do_madvise [behavior=3DMADV_DONTNEED]
> > > > >     madvise_lock
> > > > >       lock_vma_under_rcu
> > > > >     madvise_do_behavior
> > > > >       madvise_single_locked_vma
> > > > >         madvise_vma_behavior
> > > > >           madvise_dontneed_free
> > > > >             madvise_dontneed_single_vma
> > > > >               zap_page_range_single_batched [.reclaim_pt =3D true=
]
> > > > >                 unmap_single_vma
> > > > >                   unmap_page_range
> > > > >                     zap_p4d_range
> > > > >                       zap_pud_range
> > > > >                         zap_pmd_range
> > > > >                           zap_pte_range
> > > > >                             try_get_and_clear_pmd
> > > > >                             free_pte
> > > > >
> > > > > This clashes with the assumption in walk_page_range_novma() that
> > > > > holding the mmap lock in write mode is sufficient to prevent
> > > > > concurrent page table freeing, so it can probably lead to page ta=
ble
> > > > > UAF through the ptdump interface (see ptdump_walk_pgd()).
> > > >
> > > > Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in =
the
> > > > following case:
> > > >
> > > > cpu 0                             cpu 1
> > > >
> > > > ptdump_walk_pgd
> > > > --> walk_pte_range
> > > >      --> pte_offset_map (hold RCU read lock)
> > > >                           zap_pte_range
> > > >                           --> free_pte (via RCU)
> > > >          walk_pte_range_inner
> > > >          --> ptdump_pte_entry (the PTE page is not freed at this ti=
me)
> > > >
> > > > IIUC, there is no UAF issue here?
> > > >
> > > > If I missed anything please let me know.
>
> Seems to me that we don't need the VMA locks then unless I'm missing
> something? :) Jann?

Aah, right, this is one of those paths that use RCU to protect
read-only PTE-level page table access that can tolerate seeing stale
data. Sorry about the confusion.

> Would this RCU-lock-acquired-by-pte_offset_map also save us from the
> munmap() downgraded read lock scenario also? Or is the problem there
> intermediate page table teardown I guess?

(I see Qi Zheng already clarified this part.)
