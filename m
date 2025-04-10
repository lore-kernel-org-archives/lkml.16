Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C9281519
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280983; cv=none; b=t/RSZAV8USnbm5oPUKi7i3z3Q5FvLhguTcovWr9vuTCdocNygz2b/o9bCMTybSFIn9Z3EPNNyrla4aiDVW7RC1gIG9R6vkhrBklgLYB2GJxjAcFWbBFlu7u+ugV1Ns9dVmI5NzRhXSpfe9qTJKJXVEOBT/sJOxjrZBN3ttEV/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280983; c=relaxed/simple;
	bh=UJrJSsDCsINOHpGEzHRBbJOaUsgdkOOvpG7d06QOV9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAe9/W6+kHP+XiaZNaaXMNzhLbnUUAdzHqrsiLoIjgO9ClG1S3sie/Xj66FdN3vGLEMa9+855rv4eskcJR3lVDm5eYWyJK5IirEr8JRcFj2MxXqfy0OBrDD2G3flUdihvojBEOGlocmEPb8bCtH+tGUq7NLrM5TgJxh/nSYvr1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMjZuUDP; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMjZuUDP"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso265461241.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744280980; x=1744885780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsL9mz5VLosJIEplm0FTk8FQNVbT/vTDpv3BHLI4ivk=;
        b=OMjZuUDP77AJNN8zoVWGu2seaU2+Ob/zSO5KGP7TEYFhfN08uW2DgkCj3VT46yP+vq
         R/VVfNFc+b0fHk0J7l8ME94NkSfAGvwVdEDJxWhrqqQLLWBMo4LVTo/jvULHr37k8EYh
         0wjToiENo1/suvS//kj/L7aRu6C0xde09vk5ztfsUzqTmdq2WD+GbFboiMOLuuguNpCB
         7JEMN82hPHQ0v/vW57LFgISTlfXr0Qjb4UC6jWWuwu0uYtfAAZLFFuMKovN6Lhpj/fmt
         e8lwXcAba84rd2L/fSIpaTCP/7eOIsco7dOtqxd6vC6bx7b/ibbrAAYhWo/nAMzxHxC5
         k0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280980; x=1744885780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsL9mz5VLosJIEplm0FTk8FQNVbT/vTDpv3BHLI4ivk=;
        b=eUstKx4FF/UyqMKdgfXi4JpRV2i4sB4XUvc4CgoqhA/2QtxocONpzYIe6Of67zAkHn
         824en7AYyeRDkUT4IDImpgUhXHp5pAC+dnWOx1KBFRcna1AJvCX9nvfT3gBOxBGCeFcZ
         142DeeNgngLJcx9V8/0/crMMy8nzCm4wOuwL8ykWvvFluPgH71wanv3Q21XCE1yAj5Ya
         NNWwDob3f62DfyOXGEVMVoaMxj22l83ifd+I/LvaUcj7jPEn3NplKeygJ5TjfrbkDCVO
         wZ/nSTPr6H/iLJ7D0Ir+q+zB8y99QhMdaKH+mVPIgF6Uc2F5kudU4xb2ukNZRQmhUmSS
         hcEg==
X-Forwarded-Encrypted: i=1; AJvYcCUxFPC8GX4wlAxX8DezXaum2wUBE4izRUqLmfhgaWIMg+XPext+Cpo1UZ3naH2Tq5v4eU9gi+BRGs+zZUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB8JxS21nv7L1hCdads/ArSuJql/jjMNT4n78Cnunvn4XzMf03
	qXp3ikmp8ZD/GTZlCJZ93NQnW44ic18iExeF4vKIwhDgbmjEo293kgy+c6ZAMW5DACAFPP3s0bh
	dyDqZgls7kXJfmgNk8m9snjIxsls=
X-Gm-Gg: ASbGncsdA6XHu/0I/nAZyFvhkeJTJNeSRYRDrUeAI/DYBpPjGj+bH90FHhLHLSxx9oH
	1e9qR8arembaBfSx3KeVpFpowirgtBQ3UJcWdsEShYJyW96L8usDmTjRzaFDGSSgrvuvJy9T+Zr
	hZkhGHwbXrf7e1yPZ8IfdQw+MVj6POCsg3
X-Google-Smtp-Source: AGHT+IHMjsL14UIkB6GS65IXtIabMPfJfm7Q8qzDjxnRqvscrD+A/dh2YPBdp92joEmfmuIbRzv6rYVqFbcZMsw8Kro=
X-Received: by 2002:a05:6102:32ca:b0:4bb:cf25:c5a7 with SMTP id
 ada2fe7eead31-4c9d34ad25cmr1434299137.7.1744280980461; Thu, 10 Apr 2025
 03:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com> <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com>
In-Reply-To: <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 10 Apr 2025 22:29:27 +1200
X-Gm-Features: ATxdqUGpjL6YVwRw3eR-_HonqCL1J4sjOeI6Lcqss7S7Xw9gUU1f7F6JBXetElM
Message-ID: <CAGsJ_4yPxoF5P87WdXbXVb8BqovVvxhKg40YVddkEQmFjFsRYw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com, 
	ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 9:05=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/10 16:14, Barry Song wrote:
> > On Wed, Apr 9, 2025 at 1:16=E2=80=AFAM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >>
> >> When investigating performance issues during file folio unmap, I notic=
ed some
> >> behavioral differences in handling non-PMD-sized folios and PMD-sized =
folios.
> >> For non-PMD-sized file folios, it will call folio_mark_accessed() to m=
ark the
> >> folio as having seen activity, but this is not done for PMD-sized foli=
os.
> >>
> >> This might not cause obvious issues, but a potential problem could be =
that,
> >> it might lead to more frequent refaults of PMD-sized file folios under=
 memory
> >> pressure. Therefore, I am unsure whether the folio_mark_accessed() sho=
uld be
> >> added for PMD-sized file folios?
> >>
> >> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >> ---
> >>   mm/huge_memory.c | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >> index 6ac6d468af0d..b3ade7ac5bbf 100644
> >> --- a/mm/huge_memory.c
> >> +++ b/mm/huge_memory.c
> >> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct=
 vm_area_struct *vma,
> >>                                  zap_deposited_table(tlb->mm, pmd);
> >>                          add_mm_counter(tlb->mm, mm_counter_file(folio=
),
> >>                                         -HPAGE_PMD_NR);
> >> +
> >> +                       if (flush_needed && pmd_young(orig_pmd) &&
> >> +                           likely(vma_has_recency(vma)))
> >> +                               folio_mark_accessed(folio);
> >
> > Acked-by: Barry Song <baohua@kernel.org>
>
> Thanks.
>
> > I also came across an interesting observation: on a memory-limited syst=
em,
> > demoting unmapped file folios in the LRU=E2=80=94specifically when thei=
r mapcount
> > drops from 1 to 0=E2=80=94can actually improve performance.
>
> These file folios are used only once? Can folio_set_dropbehind() be used
> to optimize it, which can avoid the LRU activity movement in
> folio_mark_accessed()?

For instance, when a process, such as a game, just exits, it can be expecte=
d
that it won't be used again in the near future. As a result, demoting
its previously
unmapped file pages can improve performance.

Of course, for file folios mapped by multiple processes, such as
common .so files,
it's a different story. Typically, their mapcounts are always high.

>
> > If others have observed the same behavior, we might not need to mark th=
em
> > as accessed in that scenario.
> >
> >>                  }
> >>
> >>                  spin_unlock(ptl);
> >> --
> >> 2.43.5
> >>
> >

Thanks
Barry
