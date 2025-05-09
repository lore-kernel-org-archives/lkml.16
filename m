Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB22918CF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798931; cv=none; b=KuF/FVjyaeqlDB1+mANahPw7FdXGJlhIuoTrQhgWB0h6NLFxgFKOwSZK+jkyiTszdrpu4G3vMwomDX5K8v4xuxDra8ejPr8i9xoMcs1uYC7q0NN8dNGsAIVIYMxHkJfr3H0lZrjwK0mw+vzT2+EiJJzV6wqSsJPN7Q+xIi333q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798931; c=relaxed/simple;
	bh=fdEgs25vEPwqIgDrnCoFiHh3llkQsPglOvG51YbtKXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPKOXQC48UlOwbu0sxWn3mdbZh2ZVMKS2ihfW5WcmMQ8yeLx52mHSo6b0k1A4jLVZjMWc6wGSzP2PwwkKVVpnXgZppWfl+QMW03ePX+hlxL4BbN44fnbJYPGjL5z8zO+vlsdoeVEf2W/U5n8CHGgFeyIzfOL01DCy41iYFfNRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXblmqsk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXblmqsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1F8C4CEE4;
	Fri,  9 May 2025 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746798930;
	bh=fdEgs25vEPwqIgDrnCoFiHh3llkQsPglOvG51YbtKXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXblmqskyFblffDqIbr+/c6MBW892Zb3wPl5bxT6As7LwCZajZNFcmDdRX6AHytbV
	 9vSSZfFgRIncwSDa5ENlP0wUWnr6jeitGiM+cdStS8i4FeYEIkdumqDNadGj2jAvQi
	 FiCz1fNrF8nj76CWna5vtebZntOjf9UvNF2A9XlkHiVXbYMF5Gb/cBOnGsZwnN23an
	 ZVR8fF/T8Q3p612Q764Ux0CGVM1TeoVomSSmBboUmsRzjhlFWils6LnmXgXYEqEvId
	 bY3sMHh6PwC5xvt00rjmMAmb5Ul1KI5TFvsLCNKWCu3tDUPP4dqEjgsb6RbsVp9VoV
	 wepWy+8oo9MDw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/11] Perf improvements for hugetlb and vmalloc on arm64
Date: Fri,  9 May 2025 14:55:18 +0100
Message-Id: <174679458910.1792901.13579160002600202326.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 22 Apr 2025 09:18:08 +0100, Ryan Roberts wrote:
> This is v4 of a series to improve performance for hugetlb and vmalloc on arm64.
> Although some of these patches are core-mm, advice from Andrew was to go via the
> arm64 tree. All patches are now acked/reviewed by relevant maintainers so I
> believe this should be good-to-go.
> 
> The 2 key performance improvements are 1) enabling the use of contpte-mapped
> blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
> were already hooks for this (used by powerpc) but they required some tidying and
> extending for arm64. And 2) batching up barriers when modifying the vmalloc
> address space for upto 30% reduction in time taken in vmalloc().
> 
> [...]

Sorry for the delay in getting to this series, it all looks good.

Applied to arm64 (for-next/mm), thanks!

[01/11] arm64: hugetlb: Cleanup huge_pte size discovery mechanisms
        https://git.kernel.org/arm64/c/29cb80519689
[02/11] arm64: hugetlb: Refine tlb maintenance scope
        https://git.kernel.org/arm64/c/5b3f8917644e
[03/11] mm/page_table_check: Batch-check pmds/puds just like ptes
        https://git.kernel.org/arm64/c/91e40668e70a
[04/11] arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
        https://git.kernel.org/arm64/c/ef493d234362
[05/11] arm64: hugetlb: Use __set_ptes_anysz() and __ptep_get_and_clear_anysz()
        https://git.kernel.org/arm64/c/a899b7d0673c
[06/11] arm64/mm: Hoist barriers out of set_ptes_anysz() loop
        https://git.kernel.org/arm64/c/f89b399e8d6e
[07/11] mm/vmalloc: Warn on improper use of vunmap_range()
        https://git.kernel.org/arm64/c/61ef8ddaa35e
[08/11] mm/vmalloc: Gracefully unmap huge ptes
        https://git.kernel.org/arm64/c/2fba13371fe8
[09/11] arm64/mm: Support huge pte-mapped pages in vmap
        https://git.kernel.org/arm64/c/06fc959fcff7
[10/11] mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes
        https://git.kernel.org/arm64/c/44562c71e2cf
[11/11] arm64/mm: Batch barriers when updating kernel mappings
        https://git.kernel.org/arm64/c/5fdd05efa1cd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
