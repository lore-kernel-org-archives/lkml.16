Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5796A27AC36
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047816; cv=none; b=t18mpBV0sByNFBqOZ59xzTTIsBDeoy6aY23wfIaf/I+7iwVCdP/Zt/tVNL0wHYv75MCnXLo+peCqsGnP2W4G6E5Pyrz1+opHHJX4UTll0lhNG407lWiDjCnGqukoQfrNa+V5kUY6a7a9KkNU8MParz99YOtAboRQILdi4T/egvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047816; c=relaxed/simple;
	bh=VTXprJg8XjmrbSy79ZeA5CGPWHohu05qT1SYZAFz/i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDumoYWTcVKzgVrgfNzoZV2f+GrEs+KUpkJImQ+s2H0E0zXx4vkwLvqZx5ZIickp9ZQfuCsoVNKnZRFcZ3vyGTv8jYFv4PoZuu5oK0qbbLOUIg2F5xR/+QxUqpGyQ0b7WlSpRMeO9w3RWfHBG0L92yHYBoQiHw/D4BFDjx+bDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F06D150C;
	Mon, 12 May 2025 04:03:22 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C87013F5A1;
	Mon, 12 May 2025 04:03:30 -0700 (PDT)
Message-ID: <0ca27453-7fa8-47df-ac11-8992319da578@arm.com>
Date: Mon, 12 May 2025 12:03:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
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
 <aCHUwZzeI6sEbg2T@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aCHUwZzeI6sEbg2T@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/05/2025 12:00, Catalin Marinas wrote:
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
>>
>> So let's take the simplest and safest route and disable the batching
>> optimization in interrupt contexts. This makes these users no worse off
>> than prior to the optimization. Additionally the known offenders are
>> debug features that only manipulate a single PTE, so there is no
>> performance gain anyway.
>>
>> There may be some obscure case of encrypted/decrypted DMA with the
>> dma_free_coherent called from an interrupt context, but again, this is
>> no worse off than prior to the commit.
>>
>> Some options for supporting nesting were considered, but there is a
>> difficult to solve problem if any code manipulates ptes within interrupt
>> context but *outside of* a lazy mmu region. If this case exists, the
>> code would expect the updates to be immediate, but because the task
>> context may have already been in lazy mmu mode, the updates would be
>> deferred, which could cause incorrect behaviour. This problem is avoided
>> by always ensuring updates within interrupt context are immediate.
>>
>> Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
>> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/linux-arm-kernel/681f2a09.050a0220.f2294.0006.GAE@google.com/
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> As per the request in the original report, please also add:
> 
> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com

I've already added it, 2 lines above your comment...

> 
> I'll give it a try as well with my configurations and let you know if
> there are any problems. In the meantime:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

