Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF2021CA04
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599421; cv=none; b=jDmnuUAetMBz3N4lb5SEFPw1uy+RxFDQMvGxpjwWTAwoRDCEvLqNbpqIVRevOanvwgLJEIA+6JnJoJYkWNlhkUyMxMwnYIjUPGUqVgGtERAeLoBxW2tCecn7gVuF/6lD491vPPmQYHe2HFKIHR9FMhXpCsOCM9oQzSzaZYnyRcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599421; c=relaxed/simple;
	bh=2LH4iFhDDgSYMqV8yfQVIoPaIsbL9fWVCumZgbaSGbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7Uo2UWFbDP0O7gk1r5aK0fssC2G/LLpl7MKLSy1xr+5SQ4nAe7ronHtQlfobXsXk9f2mx4reKlLIFqoizYkQt6h/H8Ke5TeDxd2kixHLegd68eI/khEMM1bnTek4Kie3M/9HR0YO/5btKhy0eOfsyFiwf7BRBgzLZTg/tM0yBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FC4A16F2;
	Fri, 30 May 2025 03:03:22 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F40B53F694;
	Fri, 30 May 2025 03:03:35 -0700 (PDT)
Message-ID: <adfe981a-ec9a-4051-a26f-91b691230161@arm.com>
Date: Fri, 30 May 2025 11:03:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable huge-vmalloc permission change
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250530090407.19237-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2025 10:04, Dev Jain wrote:
> This series paves the path to enable huge mappings in vmalloc space by
> default on arm64. > For this we must ensure that we can handle any permission
> games on vmalloc space. 

And the linear map :)

> Currently, __change_memory_common() uses
> apply_to_page_range() which does not support changing permissions for
> leaf mappings. 

nit: A "leaf mapping" is the lowest level entry in the page tables for a given
address - i.e. it maps an address to some actual memory rather than to another
pgtable. It includes what the Arm ARM calls "page mappings" (PTE level) and
"block mappings" (PMD/PUD/.. level). apply_to_page_range() does support page
mappings, so saying it doesn't support leaf mappings is incorrect. It doesn't
support block mappings.

> We attempt to move away from this by using walk_page_range_novma(),
> similar to what riscv does right now; however, it is the responsibility
> of the caller to ensure that we do not pass a range, or split the range
> covering a partial leaf mapping.
> 
> This series is tied with Yang Shi's attempt [1] at using huge mappings
> in the linear mapping in case the system supports BBML2, in which case
> we will be able to split the linear mapping if needed without break-before-make.
> Thus, Yang's series, IIUC, will be one such user of my series; suppose we
> are changing permissions on a range of the linear map backed by PMD-hugepages,
> then the sequence of operations should look like the following:
> 
> split_range(start, (start + HPAGE_PMD_SIZE) & ~HPAGE_PMD_MASK);
> split_range(end & ~HPAGE_PMD_MASK, end);

I don't understand what the HPAGE_PMD_MASK twiddling is doing? That's not right.
It's going to give you the offset within the 2M region. You just want:

split_range(start)
split_range(end)

right?

> __change_memory_common(start, end);
> 
> However, this series can be used independently of Yang's; since currently
> permission games are being played only on pte mappings (due to apply_to_page_range
> not supporting otherwise), this series provides the mechanism for enabling
> huge mappings for various kernel mappings like linear map and vmalloc.

In other words, you are saying that this series is a prerequisite for Yang's
series (and both are prerequisites for huge vmalloc by default). Your series
adds a new capability that Yang's series will rely on (the ability to change
permissions on block mappings).

Thanks,
Ryan

> 
> [1] https://lore.kernel.org/all/20250304222018.615808-1-yang@os.amperecomputing.com/
> 
> Dev Jain (3):
>   mm: Allow pagewalk without locks
>   arm64: pageattr: Use walk_page_range_novma() to change memory
>     permissions
>   mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64
> 
>  arch/arm64/mm/pageattr.c | 81 +++++++++++++++++++++++++++++++++++++---
>  include/linux/pagewalk.h |  4 ++
>  mm/pagewalk.c            | 18 +++++++--
>  3 files changed, 94 insertions(+), 9 deletions(-)
> 

