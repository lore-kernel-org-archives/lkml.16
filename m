Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB9028682
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935763; cv=none; b=IZlyrzzjB35Ntw9aDOx5QBO76dRKFkzTCxLxqun7kLa37DMvs8e1Q6+j7yaiQDzz+wm2lX7rIKDs/N/TtazoZ70OqqFkHDHqZrk1WNlKgTYnyqr7RmDTuX41PN+ceSFO1q/lVJDGholqn8nzxIFttqI8kjri3jdGJ3Bx7wBtCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935763; c=relaxed/simple;
	bh=i1QdzQ7c6MTxOYvZa5NSHdvMTLEkPpZZKIlYcWxosz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qV5cUGOwPblcsAH6dvmRY8jsqm9KZ8LAYHs9OGVyBdfATxtYsy9W2a3ehcok9HeKv8rQpYFJBCdGHBxIH9NbMYKZHKWUErhxD3dS3/qtpQX0296txWB6Ms9BIyU70hZ4C//XaIz+cUVvlOQAhhfb2Ve3UPTR827R1qHcpobSQ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F00C1515;
	Tue, 29 Apr 2025 07:09:12 -0700 (PDT)
Received: from [10.1.25.156] (XHFQ2J9959.cambridge.arm.com [10.1.25.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C08B83F66E;
	Tue, 29 Apr 2025 07:09:16 -0700 (PDT)
Message-ID: <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
Date: Tue, 29 Apr 2025 15:09:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-GB
To: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alexandre,

On 07/04/2025 13:04, Alexandre Ghiti wrote:
> Can someone from arm64 review this? I think it's preferable to share the same
> implementation between riscv and arm64.

I've been thinking about this for a while and had some conversations internally.
This patchset has both pros and cons.

In the pros column, it increases code reuse in an area that has had quite of few
bugs popping up lately; so this would bring more eyes and hopefully higher
quality in the long run.

But in the cons column, we have seen HW errata in similar areas in the past and
I'm nervous that by hoisting this code to mm, we make it harder to workaround
any future errata. Additionally I can imagine that this change could make it
harder to support future Arm architecture enhancements.

I appreciate the cons are not strong *technical* arguments but nevertheless they
are winning out in this case; My opinion is that we should keep the arm64
implementations of huge_pte_ (and contpte_ too - I know you have a separate
series for this) private to arm64.

Sorry about that.

> 
> The end goal is the support of mTHP using svnapot on riscv, which we want soon,
> so if that patchset does not gain any traction, I'll just copy/paste the arm64
> implementation into riscv.

This copy/paste approach would be my preference.

Thanks,
Ryan

> 
> Thanks,
> 
> Alex
> 
> On 21/03/2025 14:06, Alexandre Ghiti wrote:
>> This patchset intends to merge the contiguous ptes hugetlbfs implementation
>> of arm64 and riscv.
>>
>> Both arm64 and riscv support the use of contiguous ptes to map pages that
>> are larger than the default page table size, respectively called contpte
>> and svnapot.
>>
>> The riscv implementation differs from the arm64's in that the LSBs of the
>> pfn of a svnapot pte are used to store the size of the mapping, allowing
>> for future sizes to be added (for now only 64KB is supported). That's an
>> issue for the core mm code which expects to find the *real* pfn a pte points
>> to. Patch 1 fixes that by always returning svnapot ptes with the real pfn
>> and restores the size of the mapping when it is written to a page table.
>>
>> The following patches are just merges of the 2 different implementations
>> that currently exist in arm64 and riscv which are very similar. It paves
>> the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
>> reimplementing the same in riscv.
>>
>> This patchset was tested by running the libhugetlbfs testsuite with 64KB
>> and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-
>> ryan.roberts@arm.com/
>>
>> v4: https://lore.kernel.org/linux-riscv/20250127093530.19548-1-
>> alexghiti@rivosinc.com/
>> v3: https://lore.kernel.org/all/20240802151430.99114-1-alexghiti@rivosinc.com/
>> v2: https://lore.kernel.org/linux-riscv/20240508113419.18620-1-
>> alexghiti@rivosinc.com/
>> v1: https://lore.kernel.org/linux-riscv/20240301091455.246686-1-
>> alexghiti@rivosinc.com/
>>
>> Changes in v5:
>>    - Fix "int i" unused variable in patch 2 (as reported by PW)
>>    - Fix !svnapot build
>>    - Fix arch_make_huge_pte() which returned a real napot pte
>>    - Make __ptep_get(), ptep_get_and_clear() and __set_ptes() napot aware to
>>      avoid leaking real napot pfns to core mm
>>    - Fix arch_contpte_get_num_contig() that used to always try to get the
>>      mapping size from the ptep, which does not work if the ptep comes the
>> core mm
>>    - Rebase on top of 6.14-rc7 + fix for
>>      huge_ptep_get_and_clear()/huge_pte_clear()
>>      https://lore.kernel.org/linux-riscv/20250317072551.572169-1-
>> alexghiti@rivosinc.com/
>>
>> Changes in v4:
>>    - Rebase on top of 6.13
>>
>> Changes in v3:
>>    - Split set_ptes and ptep_get into internal and external API (Ryan)
>>    - Rename ARCH_HAS_CONTPTE into ARCH_WANT_GENERAL_HUGETLB_CONTPTE so that
>>      we split hugetlb functions from contpte functions (actually riscv contpte
>>      functions to support THP will come into another series) (Ryan)
>>    - Rebase on top of 6.11-rc1
>>
>> Changes in v2:
>>    - Rebase on top of 6.9-rc3
>>
>> Alexandre Ghiti (9):
>>    riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
>>    riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
>>    mm: Use common huge_ptep_get() function for riscv/arm64
>>    mm: Use common set_huge_pte_at() function for riscv/arm64
>>    mm: Use common huge_pte_clear() function for riscv/arm64
>>    mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
>>    mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
>>    mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
>>    mm: Use common huge_ptep_clear_flush() function for riscv/arm64
>>
>>   arch/arm64/Kconfig                  |   1 +
>>   arch/arm64/include/asm/hugetlb.h    |  22 +--
>>   arch/arm64/include/asm/pgtable.h    |  68 ++++++-
>>   arch/arm64/mm/hugetlbpage.c         | 294 +---------------------------
>>   arch/riscv/Kconfig                  |   1 +
>>   arch/riscv/include/asm/hugetlb.h    |  36 +---
>>   arch/riscv/include/asm/pgtable-64.h |  11 ++
>>   arch/riscv/include/asm/pgtable.h    | 222 ++++++++++++++++++---
>>   arch/riscv/mm/hugetlbpage.c         | 243 +----------------------
>>   arch/riscv/mm/pgtable.c             |   6 +-
>>   include/linux/hugetlb_contpte.h     |  39 ++++
>>   mm/Kconfig                          |   3 +
>>   mm/Makefile                         |   1 +
>>   mm/hugetlb_contpte.c                | 258 ++++++++++++++++++++++++
>>   14 files changed, 583 insertions(+), 622 deletions(-)
>>   create mode 100644 include/linux/hugetlb_contpte.h
>>   create mode 100644 mm/hugetlb_contpte.c
>>
> 
> From mboxrd@z Thu Jan  1 00:00:00 1970
> Return-Path: <linux-riscv-bounces+linux-
> riscv=archiver.kernel.org@lists.infradead.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
>     aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
>     (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
>     (No client certificate requested)
>     by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D94C3601E
>     for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 12:35:59 +0000 (UTC)
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
>     d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
>     Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
>     List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
>     Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
>     Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
>     bh=QGtw44ZccGhXZHG0gus8jo8nditsIsPYxbfRUYIB+hU=; b=TuC4N8bBiqSCZqINAlCMfr1aa0
>     HKCtL5AM0VsHJ36rTV1TZCiAN0tKuI4mbGKMbrvNUcKXaa0IaZGgplHJXZPCwfiRmK51dvr1ndwc+
>     x4+UfoK5lEB2HNBzTjcA9nH164vMm8lu0bitMWB+QzfpYT0nprO+11bFlBPqZVI35bwer5bTytL/w
>     2PtmHktDSGJXgSCnDKefpnBo+yiIKU2uq7dhR713fLa1hzLYi5f0+2trqJXfZ5ADJSOBaZc6h2RQo
>     Hfb0DRyNJsiBjuBYn3H1+RCnv6lZwV1eVbltqj1BIjrb0C32Zmnb7FxqUYECyH4vEhWbmYgbwpAKI
>     8BYmZxbA==;
> Received: from localhost ([::1] helo=bombadil.infradead.org)
>     by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
>     id 1u1lhh-00000000H0X-3INP;
>     Mon, 07 Apr 2025 12:35:53 +0000
> Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
>     by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
>     id 1u1lDQ-000000009MS-3LfF;
>     Mon, 07 Apr 2025 12:04:39 +0000
> Received: by mail.gandi.net (Postfix) with ESMTPSA id E350243163;
>     Mon,  7 Apr 2025 12:04:28 +0000 (UTC)
> Message-ID: <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
> Date: Mon, 7 Apr 2025 14:04:27 +0200
> MIME-Version: 1.0
> User-Agent: Mozilla Thunderbird
> Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
> Content-Language: en-US
> To: Alexandre Ghiti <alexghiti@rivosinc.com>,
> Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
> Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
> Matthew Wilcox <willy@infradead.org>,
> Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
> <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
> linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
> linux-riscv@lists.infradead.org, linux-mm@kvack.org
> References: <20250321130635.227011-1-alexghiti@rivosinc.com>
> From: Alexandre Ghiti <alex@ghiti.fr>
> In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
> X-GND-State: clean
> X-GND-Score: -100
> X-GND-Cause:
> gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepveetvdfhvdeuheekvdettdegheetgeejiefgjeetvedtfeeuvddvtefhjeffgeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhls
> ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrhigrnhdrrhhosggvrhhtshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
> X-GND-Sasl: alex@ghiti.fr
> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 X-
> CRM114-CacheID: sfid-20250407_050436_994014_8B16F654 X-CRM114-Status: GOOD ( 
> 23.24  )
> X-BeenThere: linux-riscv@lists.infradead.org
> X-Mailman-Version: 2.1.34
> Precedence: list
> List-Id: <linux-riscv.lists.infradead.org>
> List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
> <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
> List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
> List-Post: <mailto:linux-riscv@lists.infradead.org>
> List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
> List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
> <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
> Content-Transfer-Encoding: 7bit
> Content-Type: text/plain; charset="us-ascii"; Format="flowed"
> Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
> Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
> 
> Can someone from arm64 review this? I think it's preferable to share the same
> implementation between riscv and arm64.
> 
> The end goal is the support of mTHP using svnapot on riscv, which we want soon,
> so if that patchset does not gain any traction, I'll just copy/paste the arm64
> implementation into riscv.
> 
> Thanks,
> 
> Alex
> 
> On 21/03/2025 14:06, Alexandre Ghiti wrote:
>> This patchset intends to merge the contiguous ptes hugetlbfs implementation
>> of arm64 and riscv.
>>
>> Both arm64 and riscv support the use of contiguous ptes to map pages that
>> are larger than the default page table size, respectively called contpte
>> and svnapot.
>>
>> The riscv implementation differs from the arm64's in that the LSBs of the
>> pfn of a svnapot pte are used to store the size of the mapping, allowing
>> for future sizes to be added (for now only 64KB is supported). That's an
>> issue for the core mm code which expects to find the *real* pfn a pte points
>> to. Patch 1 fixes that by always returning svnapot ptes with the real pfn
>> and restores the size of the mapping when it is written to a page table.
>>
>> The following patches are just merges of the 2 different implementations
>> that currently exist in arm64 and riscv which are very similar. It paves
>> the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
>> reimplementing the same in riscv.
>>
>> This patchset was tested by running the libhugetlbfs testsuite with 64KB
>> and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-
>> ryan.roberts@arm.com/
>>
>> v4: https://lore.kernel.org/linux-riscv/20250127093530.19548-1-
>> alexghiti@rivosinc.com/
>> v3: https://lore.kernel.org/all/20240802151430.99114-1-alexghiti@rivosinc.com/
>> v2: https://lore.kernel.org/linux-riscv/20240508113419.18620-1-
>> alexghiti@rivosinc.com/
>> v1: https://lore.kernel.org/linux-riscv/20240301091455.246686-1-
>> alexghiti@rivosinc.com/
>>
>> Changes in v5:
>>    - Fix "int i" unused variable in patch 2 (as reported by PW)
>>    - Fix !svnapot build
>>    - Fix arch_make_huge_pte() which returned a real napot pte
>>    - Make __ptep_get(), ptep_get_and_clear() and __set_ptes() napot aware to
>>      avoid leaking real napot pfns to core mm
>>    - Fix arch_contpte_get_num_contig() that used to always try to get the
>>      mapping size from the ptep, which does not work if the ptep comes the
>> core mm
>>    - Rebase on top of 6.14-rc7 + fix for
>>      huge_ptep_get_and_clear()/huge_pte_clear()
>>      https://lore.kernel.org/linux-riscv/20250317072551.572169-1-
>> alexghiti@rivosinc.com/
>>
>> Changes in v4:
>>    - Rebase on top of 6.13
>>
>> Changes in v3:
>>    - Split set_ptes and ptep_get into internal and external API (Ryan)
>>    - Rename ARCH_HAS_CONTPTE into ARCH_WANT_GENERAL_HUGETLB_CONTPTE so that
>>      we split hugetlb functions from contpte functions (actually riscv contpte
>>      functions to support THP will come into another series) (Ryan)
>>    - Rebase on top of 6.11-rc1
>>
>> Changes in v2:
>>    - Rebase on top of 6.9-rc3
>>
>> Alexandre Ghiti (9):
>>    riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
>>    riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
>>    mm: Use common huge_ptep_get() function for riscv/arm64
>>    mm: Use common set_huge_pte_at() function for riscv/arm64
>>    mm: Use common huge_pte_clear() function for riscv/arm64
>>    mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
>>    mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
>>    mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
>>    mm: Use common huge_ptep_clear_flush() function for riscv/arm64
>>
>>   arch/arm64/Kconfig                  |   1 +
>>   arch/arm64/include/asm/hugetlb.h    |  22 +--
>>   arch/arm64/include/asm/pgtable.h    |  68 ++++++-
>>   arch/arm64/mm/hugetlbpage.c         | 294 +---------------------------
>>   arch/riscv/Kconfig                  |   1 +
>>   arch/riscv/include/asm/hugetlb.h    |  36 +---
>>   arch/riscv/include/asm/pgtable-64.h |  11 ++
>>   arch/riscv/include/asm/pgtable.h    | 222 ++++++++++++++++++---
>>   arch/riscv/mm/hugetlbpage.c         | 243 +----------------------
>>   arch/riscv/mm/pgtable.c             |   6 +-
>>   include/linux/hugetlb_contpte.h     |  39 ++++
>>   mm/Kconfig                          |   3 +
>>   mm/Makefile                         |   1 +
>>   mm/hugetlb_contpte.c                | 258 ++++++++++++++++++++++++
>>   14 files changed, 583 insertions(+), 622 deletions(-)
>>   create mode 100644 include/linux/hugetlb_contpte.h
>>   create mode 100644 mm/hugetlb_contpte.c
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

