Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F50822D7BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027482; cv=none; b=f5Jh8t+qBGuQ0Mjqw3OezBbCvB2IgiKHqIH4Vdv6QshIxJytkgXANTopUkyIb3Nl1uhHVs8PExA7v9JSJOq1nhOvShvygtMrXDyhNV35QvvKhnXOIuMLOVhP9NmF+1NCjA+QCcbMsXsuprOXHL1vvQQQImGDakLRXzNwixPfugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027482; c=relaxed/simple;
	bh=0MxjhAAPB13K4pmVDzXzWu94L//5QbjDS795/16AcBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D5jjXNENjjgGEvGRWhVYpHDsIemT9dRe9M2e3UpjrBk7GG+rlrwHULIAzYz4boUg/nK4I7wGX/oNSDA+N7Shbs2e8ycouhgsJQRSwaRQArinB4lS4Cg6OJ2huZ+hu3gct3c5a/QuhxmcGJ4xgJ5Iwm5sGVJSoQyATerWZ0f8I8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id E350243163;
	Mon,  7 Apr 2025 12:04:28 +0000 (UTC)
Message-ID: <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
Date: Mon, 7 Apr 2025 14:04:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepveetvdfhvdeuheekvdettdegheetgeejiefgjeetvedtfeeuvddvtefhjeffgeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhls
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrhigrnhdrrhhosggvrhhtshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Can someone from arm64 review this? I think it's preferable to share the 
same implementation between riscv and arm64.

The end goal is the support of mTHP using svnapot on riscv, which we 
want soon, so if that patchset does not gain any traction, I'll just 
copy/paste the arm64 implementation into riscv.

Thanks,

Alex

On 21/03/2025 14:06, Alexandre Ghiti wrote:
> This patchset intends to merge the contiguous ptes hugetlbfs implementation
> of arm64 and riscv.
>
> Both arm64 and riscv support the use of contiguous ptes to map pages that
> are larger than the default page table size, respectively called contpte
> and svnapot.
>
> The riscv implementation differs from the arm64's in that the LSBs of the
> pfn of a svnapot pte are used to store the size of the mapping, allowing
> for future sizes to be added (for now only 64KB is supported). That's an
> issue for the core mm code which expects to find the *real* pfn a pte points
> to. Patch 1 fixes that by always returning svnapot ptes with the real pfn
> and restores the size of the mapping when it is written to a page table.
>
> The following patches are just merges of the 2 different implementations
> that currently exist in arm64 and riscv which are very similar. It paves
> the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
> reimplementing the same in riscv.
>
> This patchset was tested by running the libhugetlbfs testsuite with 64KB
> and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).
>
> [1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-ryan.roberts@arm.com/
>
> v4: https://lore.kernel.org/linux-riscv/20250127093530.19548-1-alexghiti@rivosinc.com/
> v3: https://lore.kernel.org/all/20240802151430.99114-1-alexghiti@rivosinc.com/
> v2: https://lore.kernel.org/linux-riscv/20240508113419.18620-1-alexghiti@rivosinc.com/
> v1: https://lore.kernel.org/linux-riscv/20240301091455.246686-1-alexghiti@rivosinc.com/
>
> Changes in v5:
>    - Fix "int i" unused variable in patch 2 (as reported by PW)
>    - Fix !svnapot build
>    - Fix arch_make_huge_pte() which returned a real napot pte
>    - Make __ptep_get(), ptep_get_and_clear() and __set_ptes() napot aware to
>      avoid leaking real napot pfns to core mm
>    - Fix arch_contpte_get_num_contig() that used to always try to get the
>      mapping size from the ptep, which does not work if the ptep comes the core mm
>    - Rebase on top of 6.14-rc7 + fix for
>      huge_ptep_get_and_clear()/huge_pte_clear()
>      https://lore.kernel.org/linux-riscv/20250317072551.572169-1-alexghiti@rivosinc.com/
>
> Changes in v4:
>    - Rebase on top of 6.13
>
> Changes in v3:
>    - Split set_ptes and ptep_get into internal and external API (Ryan)
>    - Rename ARCH_HAS_CONTPTE into ARCH_WANT_GENERAL_HUGETLB_CONTPTE so that
>      we split hugetlb functions from contpte functions (actually riscv contpte
>      functions to support THP will come into another series) (Ryan)
>    - Rebase on top of 6.11-rc1
>
> Changes in v2:
>    - Rebase on top of 6.9-rc3
>
> Alexandre Ghiti (9):
>    riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
>    riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
>    mm: Use common huge_ptep_get() function for riscv/arm64
>    mm: Use common set_huge_pte_at() function for riscv/arm64
>    mm: Use common huge_pte_clear() function for riscv/arm64
>    mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
>    mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
>    mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
>    mm: Use common huge_ptep_clear_flush() function for riscv/arm64
>
>   arch/arm64/Kconfig                  |   1 +
>   arch/arm64/include/asm/hugetlb.h    |  22 +--
>   arch/arm64/include/asm/pgtable.h    |  68 ++++++-
>   arch/arm64/mm/hugetlbpage.c         | 294 +---------------------------
>   arch/riscv/Kconfig                  |   1 +
>   arch/riscv/include/asm/hugetlb.h    |  36 +---
>   arch/riscv/include/asm/pgtable-64.h |  11 ++
>   arch/riscv/include/asm/pgtable.h    | 222 ++++++++++++++++++---
>   arch/riscv/mm/hugetlbpage.c         | 243 +----------------------
>   arch/riscv/mm/pgtable.c             |   6 +-
>   include/linux/hugetlb_contpte.h     |  39 ++++
>   mm/Kconfig                          |   3 +
>   mm/Makefile                         |   1 +
>   mm/hugetlb_contpte.c                | 258 ++++++++++++++++++++++++
>   14 files changed, 583 insertions(+), 622 deletions(-)
>   create mode 100644 include/linux/hugetlb_contpte.h
>   create mode 100644 mm/hugetlb_contpte.c
>
