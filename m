Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00E42566E9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751451; cv=none; b=GU+tY4vW1v2/skVIH2V7d6xAVqwdwjSdTHZGU4I7Xvl0m9H/w0ZHl21KJ6k+GaNaDLpiLdHDV4WnCratYY8XBKAn177UbMpuXosRbebCLwapJLGDMStN1GqQh/wtDGSYt109embC6Vz0+fD5nlUF8JGJeElBVqngrG66AX22YEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751451; c=relaxed/simple;
	bh=JyhP45+7ZfZgwRbzCCAeWcTO0D7sv9Ve8umxubElgX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXN7wKuMWIqUk7vindraXVv0sOCzzbtsOWnkQ7DcpNBb1Le/ydnmatEYMmC6Xid4eVLfeYXvxpCEm2yaz3mTW0TNull6eaSFIK6aSxJjO/C0FgDq+CngKL/xt+fpRbYLRy8ZSqUQrkyDC+1gKTKAz5zY6i95UMqMqgGDQ+jZ88E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 446E6106F;
	Tue, 24 Jun 2025 00:50:30 -0700 (PDT)
Received: from [10.163.38.23] (unknown [10.163.38.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D4D3F63F;
	Tue, 24 Jun 2025 00:50:45 -0700 (PDT)
Message-ID: <9e220213-0d4a-4e61-b8cc-45ea21b073a6@arm.com>
Date: Tue, 24 Jun 2025 13:20:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] mm/debug_vm_pgtable: Use a swp_entry_t input
 value for swap tests
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand
 <david@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>
References: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Gerald,

On 24/06/25 12:13 AM, Gerald Schaefer wrote:
> Hi,
> 
> currently working on enabling THP_SWAP and THP_MIGRATION support for s390,
> and stumbling over the WARN_ON(args->fixed_pmd_pfn != pmd_pfn(pmd)) in
> debug_vm_pgtable pmd_swap_tests(). The problem is that pmd_pfn() on s390
> will use different shift values for leaf (large) and non-leaf PMDs. And
> when used on swapped PMDs, for which pmd_leaf() will always return false
> because !pmd_present(), the result is not really well defined.

Just curious - pmd_pfn() would have otherwise worked on leaf PMD entries ?
Because the PMD swap entries are not leaf entries as pmd_present() returns
negative, pmd_pfn() does not work on those ?

> 
> I think that pmd_pfn() is not safe or ever meant to be called on swapped
> PMD entries, and it doesn't seem to be used in that way anywhere else but
> debug_vm_pgtable. Also, the whole logic to test the various swap helpers

But is not the pmd_pfn() called on pmd which is derived from the swap entry
first.

	pmd = pfn_pmd(args->fixed_pmd_pfn, args->page_prot);
	swp = __pmd_to_swp_entry(pmd);
	pmd = __swp_entry_to_pmd(swp);
	WARN_ON(args->fixed_pmd_pfn != pmd_pfn(pmd));

> on normal PTE/PMD entries seems wrong to me. It just works by chance,
> because e.g. __pmd_to_swp_entry() and __swp_entry_to_pmd() are just no-ops
> on other architectures (also on s390, but only for PTEs), and also

Hmm, basically it just tests pfn_pmd() and pmd_pfn() conversions ?

> pmd_pfn() does not have any dependency on leaf/non-leaf entries there.Could you please elaborate on that ? 

> 
> So, I started with a small patch to make pmd_swap_tests() use a proper
> swapped PMD entry as input value, similar to how it is already done in
> pte_swap_exclusive_tests(), and not use pmd_pfn() for compare but rather
> compare the whole entries, again similar to pte_swap_exclusive_tests().

Agreed, that will make sense as well.

> 
> But then I noticed that such a change would probably also make sense for
> the other swap tests, and also a small inconsistency in Documentation,
> where it says e.g.
> 
> __pte_to_swp_entry        | Creates a swapped entry (arch) from a mapped PTE
> 
> I think this is wrong, those helpers should never operate on present and
> mapped PTEs, and they certainly don't create any swapped entry from a
> mapped entry, given that they are just no-ops on most architectures.
> Instead, in this example, it just returns the arch-dependent
> representation of a swp_entry_t, which happens to be just the entry
> itself on most architectures. See also pte_to_swp_entry() /
> swp_entry_to_pte() in include/linux/swapops.h.

Alright.

> 
> Now it became a larger clean-up, and I hope it makes sense. This is all
> rather new common code for me, so maybe I got things wrong, feedback is
> welcome.

A quick ran on arm64 looks just fine, will keep looking into this.

> 
> Gerald Schaefer (1):
>   mm/debug_vm_pgtable: Use a swp_entry_t input value for swap tests
> 
>  Documentation/mm/arch_pgtable_helpers.rst |  8 ++--
>  mm/debug_vm_pgtable.c                     | 55 ++++++++++++++---------
>  2 files changed, 38 insertions(+), 25 deletions(-)
> 


