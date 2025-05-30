Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5A1134BD
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612193; cv=none; b=OtuG046s7uJKHs0fKZ5G7RFlluZjXn3T19GmFTUSI+Z/Ja6AUeAsstBFnLv2Bx8/fMll8CpSBukBuXAkklfAWk6j5aNX27w0LBLbiSknBugoohHeBvD+fhiIp02l8u2TvL1prZxztJ2uQvxbUPmREtXRTjuZ20yqoUCyO6YZPJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612193; c=relaxed/simple;
	bh=wU9nT9q/dNBeeNPy495FRndYMat3OQW6L2nT6xl5hxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5EyQkemaafaHqJkHcNTEvPotqbEaZhfq5tuANEB1KQJSu64SuavVF/lW7Wi2yC+/s7+mxw3xcobJxGs09mkwlhWRdt7TAnTtU18X61PmICVrrxZCYPH/cmUCgsRmmgiMjU+BL9A3tjp5HAKUkqOj7KrARTcl+ZFNBLftLOOxW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdndB+k9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdndB+k9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA7AC4CEE9;
	Fri, 30 May 2025 13:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748612190;
	bh=wU9nT9q/dNBeeNPy495FRndYMat3OQW6L2nT6xl5hxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdndB+k9FVHH9U+1e8x3N6+ZgvqFgiF6eGbhdK9rpoO6ot3E8fYo/t/7l54n2Szr7
	 a51dUSdXL+CV2m+dUdKfmDQJJFS5BVG/9hz+V9LYJihRHAA6d31DO7pqZ+qbVCHE8O
	 SxjE9yryZzF1poUESVV7J1tlBMseMuuni+AUJHy0EZqCV4LijZTF7BCNzGo+Ojf4xJ
	 P+MQjt8m6OfPAzAC5a7TIJa+pMCWZqrRyvacYhWfaLSmvPwn43jIvwJ6hfh2xhkK6y
	 gCJsLuFnb4iNMEhQ/oP7DubV3jJ+O4/sOd4dGYdc4kyYHSPP8xcGUx8H3ZH+a/BHU9
	 6meP4UCgQgTeQ==
Date: Fri, 30 May 2025 14:36:25 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com,
	anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
Message-ID: <20250530133625.GA30622@willie-the-truck>
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
 <20250530123527.GA30463@willie-the-truck>
 <b223245d-c43c-4d3e-86d4-9fbfd90cfacf@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b223245d-c43c-4d3e-86d4-9fbfd90cfacf@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 30, 2025 at 02:11:36PM +0100, Ryan Roberts wrote:
> On 30/05/2025 13:35, Will Deacon wrote:
> > On Fri, May 30, 2025 at 12:50:40PM +0100, Ryan Roberts wrote:
> >> On 30/05/2025 10:14, Dev Jain wrote:
> >>>
> >>> On 30/05/25 2:10 pm, Ryan Roberts wrote:
> >>>> On 30/05/2025 09:20, Dev Jain wrote:
> >>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> >>>>> because an intermediate table may be removed, potentially causing the
> >>>>> ptdump code to dereference an invalid address. We want to be able to
> >>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
> >>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
> >>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> >>>>> use mmap_read_lock and not write lock because we don't need to synchronize
> >>>>> between two different vm_structs; two vmalloc objects running this same
> >>>>> code path will point to different page tables, hence there is no race.
> >>>
> >>> My "correction" from race->no problem was incorrect after all :) There will
> >>> be no race too since the vm_struct object has exclusive access to whatever
> >>> table it is clearing.
> >>>
> >>>>>
> >>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>>>> ---
> >>>>>   arch/arm64/include/asm/vmalloc.h | 6 ++----
> >>>>>   arch/arm64/mm/mmu.c              | 7 +++++++
> >>>>>   2 files changed, 9 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> >>>>> index 38fafffe699f..28b7173d8693 100644
> >>>>> --- a/arch/arm64/include/asm/vmalloc.h
> >>>>> +++ b/arch/arm64/include/asm/vmalloc.h
> >>>>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
> >>>>>       /*
> >>>>>        * SW table walks can't handle removal of intermediate entries.
> >>>>>        */
> >>>>> -    return pud_sect_supported() &&
> >>>>> -           !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> >>>>> +    return pud_sect_supported();
> >>>>>   }
> >>>>>     #define arch_vmap_pmd_supported arch_vmap_pmd_supported
> >>>>>   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
> >>>>>   {
> >>>>> -    /* See arch_vmap_pud_supported() */
> >>>>> -    return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> >>>>> +    return true;
> >>>>>   }
> >>>>>     #endif
> >>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>>>> index ea6695d53fb9..798cebd9e147 100644
> >>>>> --- a/arch/arm64/mm/mmu.c
> >>>>> +++ b/arch/arm64/mm/mmu.c
> >>>>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>>>>       }
> >>>>>         table = pte_offset_kernel(pmdp, addr);
> >>>>> +
> >>>>> +    /* Synchronize against ptdump_walk_pgd() */
> >>>>> +    mmap_read_lock(&init_mm);
> >>>>>       pmd_clear(pmdp);
> >>>>> +    mmap_read_unlock(&init_mm);
> >>>> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
> >>>> exclusive with any read_lock holders) for the duration of the table walk, so it
> >>>> will either consistently see the pgtables before or after this removal. It will
> >>>> never disappear during the walk, correct?
> >>>>
> >>>> I guess there is a risk of this showing up as contention with other init_mm
> >>>> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
> >>>> are called sufficiently rarely that the risk is very small. Let's fix any perf
> >>>> problem if/when we see it.
> >>>
> >>> We can avoid all of that by my initial approach - to wrap the lock around
> >>> CONFIG_PTDUMP_DEBUGFS.
> >>> I don't have a strong opinion, just putting it out there.
> >>
> >> (I wrote then failed to send earlier):
> >>
> >> It's ugly though. Personally I'd prefer to keep it simple unless we have clear
> >> evidence that its needed. I was just laying out my justification for not needing
> >> to doing the conditional wrapping in this comment.
> > 
> > I really don't think we should be adding unconditional locking overhead
> > to core mm routines purely to facilitate a rarely used debug option.
> > 
> > Instead, can we either adopt something like the RCU-like walk used by
> > fast GUP or stick the locking behind a static key that's only enabled
> > when a ptdump walk is in progress (a bit like how
> > hugetlb_vmemmap_optimize_folio() manipulates hugetlb_optimize_vmemmap_key)?
> 
> My sense is that the static key will be less effort and can be contained fully
> in arm64. I think we would need to enable the key around the call to
> ptdump_walk_pgd() in both ptdump_walk() and ptdump_check_wx(). Then where Dev is
> currently taking the read lock, that would be contingent on the key being
> enabled and the unlock would be contingent on having taken the lock.
> 
> Does that sound like an acceptable approach?

Yup, and I think you'll probably need something like a synchronize_rcu()
when flipping the key to deal with any pre-existing page-table freers.

Will
