Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BE41E3DF2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214967; cv=none; b=rXdQBMPkHeN6cvswchQwJFQ8nil7L3NvlVCyzcw9oXbYRVO2cj4v6Nni6Z0f5HVoHT5ylBfatcbo/yIJDbzQKLWcfpVt83r1hgI2dy2AFIYO/ArTQCmyH+F/my4JqeOHqHVTMK5f9nOlV6NvI5gKpg7bFpk/ImAKKAStU9UQHzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214967; c=relaxed/simple;
	bh=e26LFyHiZDiv/E+jVOPAZrYvDzE6JL3oLy/liTOXRUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qnbq3o2aQunNghFRY7l1nVwYLuypyQ2Thb+oxmvxSbj1WHTkNBaFYCWDExiORHBMJzf0E+BmLmSSV2eKSlG5uEDIKwU/hhRPNUD7Rse7P/g+3y3KsoC+ExE+tEAkd0F0hwXXVggyz9fc5f12vX/Gg+g9Hzt7Gxf7cDpyrzH+N00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 186011688;
	Wed, 14 May 2025 02:29:11 -0700 (PDT)
Received: from [10.57.91.10] (unknown [10.57.91.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ABEC3F5A1;
	Wed, 14 May 2025 02:29:18 -0700 (PDT)
Message-ID: <8d4e66ef-a292-45ff-9c4a-0248aff44fd3@arm.com>
Date: Wed, 14 May 2025 10:29:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
 <20250513204603.GA9866@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250513204603.GA9866@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/2025 21:46, Will Deacon wrote:
> On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
>> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
>> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
>> flags in order to defer barriers until exiting the mode. At the same
>> time, it added warnings to check that pte manipulations were never
>> performed in interrupt context, because the tracking implementation
>> could not deal with nesting.
>>
>> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
>> do manipulate ptes in softirq context, which triggered the warnings.
> 
> Hmm. Do we also have to worry about the case where a softirq is triggered
> off the back of a hardirq *and* that hardirq is taken while we're in the
> middle of e.g. queue_pte_barriers()? In that case, I think we can end
> up in strange situations, such as having LAZY_MMU_PENDING set when
> LAZY_MMU is clear, although it looks like things still work even in that
> case.

I don't see any problem here. This change ensures that we always behave the
"old" way in interrupt context. So the interrupt context will never even look at
those TIF flags, so it doesn't matter that the task context is midway through
changing the flags when the interrupt comes in.

(although somehow I feel like I should be bracing for a zinger :)

Thanks,
Ryan

> 
> Will

