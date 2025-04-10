Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461901DF27D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744322215; cv=none; b=gyoFnXes+5cPRhUke+Kv/a8CbSHiHCy/qO3Xtr21oQFODvjTGx2ENi63MJhDqdURroh9e4DNUL4GfGgPy3iLmgz/TqI5aQDkeKnaEpzfkDpQ5tGtPgeByvGl74WMuEigF0dgnA0hzA68JICGup7LJXzxlneA/UqMTXwSY78VrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744322215; c=relaxed/simple;
	bh=1+HbGj9crrBgzmCTOFrK55Ty01pY12w4i11k7UBnZxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAEGUvJ5ZnE3sX39G+aRbNitBOAWgxG/8rl3Q9+a/kQInvx9OBXAzqPbvit6RgbNpWBTKxKtBGgEswGJ1AUIVKjMFd5fDZmKfcXrDTGwoFSPqr017t07YcApLlS7TIFCK5C088I/j4Nj7XNs1dAZcl+VuOXZrnS78LY3c8Ysulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iX9xje/a; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iX9xje/a"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5259327a937so630286e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744322213; x=1744927013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y6t2beipW2oGQd2GkbArAGI2Pu4wJNtTpxDf8Etadc=;
        b=iX9xje/ajVnhjbcKaBJknK+cztFwXIuHBMp8BO1MDRlkye+xoOdgH8wBys5lxX5bGm
         9a08kjOHnPN2i9aGDMjIGn64SOTD5FFcwgavjf7c82Bd36uyLkqFjU5GmJxsfuZByW3E
         nSp0dcf5YyRcbmkX9PQHSG5xRYEGJCseFvb+9dSXjQGLbl9w9jpv9C3pEIWz6q1olMZk
         +rln0PKbXXPX5yaE9e9sjGjDjrsVDmxSFpsoBiLZ/HjmZTnUUF/MMWJLyYnhfr+7PDjq
         Xm13q1+YKwQZe69DiZu/0MQTzh3b1MdUFqm/KAH94a9Jw4nXkwAoINg3nCOHiDC9Teq1
         7TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744322213; x=1744927013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y6t2beipW2oGQd2GkbArAGI2Pu4wJNtTpxDf8Etadc=;
        b=EdybQ4fsLP5nrbDA1piVS1R+/ffH/3NKUZ5w3+oOTzbnDuZd8LESKB9OAoNWQu25iS
         wtm/fdmkCR2c0eAmRhMwJdd+WLKGbGlIHIVtz76xcNPBCOz7zWKPlCCwNioSVCtDQJ8j
         uJVH3Kb4fYUJhbBoWTO+31hj0n93sVLzoojznE8UdR0yzWJRFU88VoYGdEDA5gG/ELgE
         s79C030A7mGFgrbPCCxzuXoQuvxFbqIQDddt7AXHyhks5hozBDNB6QDMZM/pCfhGDMKn
         CkCxfa/FrPl1UfaPQcfMlOqwP+sfiQPdkSQ97kgDfQmh/T7l1aMOvRgRjxVok/vhiBOX
         rI/g==
X-Forwarded-Encrypted: i=1; AJvYcCWZdnUQ0aTmoVDFJL9ff7r4U+LTU0omxBtlgZx/4PGvdlYLe88qj+98t1rMyFaixrrJKS7Yr3sgD9ToMdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGJk5OfktaAn7yNe+G60reycgH1Ofgl6qh/TOARDaiDDcclNw
	yxNBh19toypoSTa1WuoiX3p5ryYvmlnb45qmnUbgEBYmfBKY6yPNOGPT+Yj1VO75HgEuJoWI91g
	7doEijRA36BfMESSRFx+zuYdT41I=
X-Gm-Gg: ASbGnctR1aJaljKs3hLsbSXA6W60sg67G9e5lBMK+hl3QVsIqBZPy1waVKBM/Yi9YYj
	G9AloleilwHVWytJc7j7yIWJZ0vI5SwAJSYvgwuumxkIH7OwM0EXBSgejbUOaTWsGwKv04FgzBf
	WXJFNUlVp9+gn46ygpO7fPAg==
X-Google-Smtp-Source: AGHT+IF7bog+ec8Q8Xw5ffjRyVfPdYjKEa1vhDma66gotHpYm4hszC1muaXt6eYiq04+uc7kG2WUK3XM0Q6Muh4Ubko=
X-Received: by 2002:a05:6122:2a4c:b0:523:e175:4af1 with SMTP id
 71dfb90a1353d-527c358d0camr463563e0c.6.1744322213057; Thu, 10 Apr 2025
 14:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
 <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com> <CAGsJ_4yPxoF5P87WdXbXVb8BqovVvxhKg40YVddkEQmFjFsRYw@mail.gmail.com>
 <1E123113-7A0B-4D3A-AC7A-01767D7BF2D8@nvidia.com>
In-Reply-To: <1E123113-7A0B-4D3A-AC7A-01767D7BF2D8@nvidia.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 11 Apr 2025 09:56:41 +1200
X-Gm-Features: ATxdqUEOSJHAavo1rvqRSwnhWksR8TfoMLLPbkmm9eHth-SUGCxty8rT2oaC2ck
Message-ID: <CAGsJ_4zMthcj0dtCX1OKQ1_A01OdF=P1n9FGLpGsbkTRwWoqVA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	willy@infradead.org, david@redhat.com, ryan.roberts@arm.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 3:13=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 10 Apr 2025, at 6:29, Barry Song wrote:
>
> > On Thu, Apr 10, 2025 at 9:05=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >>
> >>
> >>
> >> On 2025/4/10 16:14, Barry Song wrote:
> >>> On Wed, Apr 9, 2025 at 1:16=E2=80=AFAM Baolin Wang
> >>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>
> >>>> When investigating performance issues during file folio unmap, I not=
iced some
> >>>> behavioral differences in handling non-PMD-sized folios and PMD-size=
d folios.
> >>>> For non-PMD-sized file folios, it will call folio_mark_accessed() to=
 mark the
> >>>> folio as having seen activity, but this is not done for PMD-sized fo=
lios.
> >>>>
> >>>> This might not cause obvious issues, but a potential problem could b=
e that,
> >>>> it might lead to more frequent refaults of PMD-sized file folios und=
er memory
> >>>> pressure. Therefore, I am unsure whether the folio_mark_accessed() s=
hould be
> >>>> added for PMD-sized file folios?
> >>>>
> >>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>> ---
> >>>>   mm/huge_memory.c | 4 ++++
> >>>>   1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
> >>>> --- a/mm/huge_memory.c
> >>>> +++ b/mm/huge_memory.c
> >>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, stru=
ct vm_area_struct *vma,
> >>>>                                  zap_deposited_table(tlb->mm, pmd);
> >>>>                          add_mm_counter(tlb->mm, mm_counter_file(fol=
io),
> >>>>                                         -HPAGE_PMD_NR);
> >>>> +
> >>>> +                       if (flush_needed && pmd_young(orig_pmd) &&
> >>>> +                           likely(vma_has_recency(vma)))
> >>>> +                               folio_mark_accessed(folio);
> >>>
> >>> Acked-by: Barry Song <baohua@kernel.org>
> >>
> >> Thanks.
> >>
> >>> I also came across an interesting observation: on a memory-limited sy=
stem,
> >>> demoting unmapped file folios in the LRU=E2=80=94specifically when th=
eir mapcount
> >>> drops from 1 to 0=E2=80=94can actually improve performance.
> >>
> >> These file folios are used only once? Can folio_set_dropbehind() be us=
ed
> >> to optimize it, which can avoid the LRU activity movement in
> >> folio_mark_accessed()?
> >
> > For instance, when a process, such as a game, just exits, it can be exp=
ected
> > that it won't be used again in the near future. As a result, demoting
> > its previously
> > unmapped file pages can improve performance.
>
> Is it possible to mark the dying VMAs either VM_SEQ_READ or VM_RAND_READ
> so that folio_mark_accessed() will be skipped? Or a new vm_flag?
> Will it work?

Actually took a more aggressive approach and observed good performance
improvements on phones. After zap_pte_range() called remove_rmap(),
the following logic was added:

if (file_folio && !folio_mapped())
    deactivate_file_folio();

This helps file folios from exiting processes get reclaimed more quickly
during the MGLRU's min generation scan while the folios are probably
in max gen.

I'm not entirely sure if this is universally applicable or worth submitting=
 as
a patch.

>
> >
> > Of course, for file folios mapped by multiple processes, such as
> > common .so files,
> > it's a different story. Typically, their mapcounts are always high.
>
> Text VMAs should not be marked.
>
> >
> >>
> >>> If others have observed the same behavior, we might not need to mark =
them
> >>> as accessed in that scenario.
> >>>
> >>>>                  }
> >>>>
> >>>>                  spin_unlock(ptl);
> >>>> --
> >>>> 2.43.5
> >>>>
> >>>
> >

Thanks
Barry
