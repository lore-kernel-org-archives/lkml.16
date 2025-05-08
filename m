Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B1F8F49
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746676910; cv=none; b=BCZagYB76voXOksWMf34dn/6+S059vQP1b2WH2+fSQ2vSfGAqdhj6kH2r4X1HVAMldcNBtM4fdU6W7MKXRIveiYbFqdZ8R4CxySpPIcM8uAeErOR8lLxnCjG6Gs/GrMRWaNnNcSnrBDbX3mEq1h9cBcIoS+r1/mfV9o1zBRm1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746676910; c=relaxed/simple;
	bh=VLp47B9B58kd/7IRD1uhZ00cl6HS4eH9KeCpXCv/l+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WILZHCZ07nJgoxoPGZQkb/eTdVuOzuPYrfzZWbG5jCwu97aw6KKZubUuxjwmbUPgcgvCuxSvVTTqM4YT1vgKPpep0hK26G8TwDOH0JKokm7TkLg8EYiigrbdQU/MV0l2bM+kpnzGe+QSCME/rC+CylX0yp62g5KLjYrHU76JeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAE1A106F;
	Wed,  7 May 2025 21:01:36 -0700 (PDT)
Received: from [10.162.43.19] (K4MQJ0H1H2.blr.arm.com [10.162.43.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 787C83F5A1;
	Wed,  7 May 2025 21:01:40 -0700 (PDT)
Message-ID: <7952474c-3eaf-4abf-b8de-e8a72b4bec0c@arm.com>
Date: Thu, 8 May 2025 09:31:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org,
 libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com,
 baohua@kernel.org, anshuman.khandual@arm.com, willy@infradead.org,
 ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, hughd@google.com
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
 <74FDF9E1-3148-460B-8E3C-5EE156A3FA93@nvidia.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <74FDF9E1-3148-460B-8E3C-5EE156A3FA93@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/05/25 7:30 am, Zi Yan wrote:
> On 7 May 2025, at 2:02, Dev Jain wrote:
> 
>> To use PTE batching, we want to determine whether the folio mapped by
>> the PTE is large, thus requiring the use of vm_normal_folio(). We want
>> to avoid the cost of vm_normal_folio() if the code path doesn't already
>> require the folio. For arm64, pte_batch_hint() does the job. To generalize
>> this hint, add a helper which will determine whether two consecutive PTEs
>> point to consecutive PFNs, in which case there is a high probability that
>> the underlying folio is large.
>> Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
>> are painted with the contig bit, then ptep_get() will iterate through all 16
>> entries to collect a/d bits. Hence this optimization will result in a 16x
>> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
>> will eventually call contpte_try_unfold() on every contig block, thus
>> flushing the TLB for the complete large folio range. Instead, use
>> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
>> do them on the starting and ending contig block.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>>   mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
>>   2 files changed, 59 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..38dab1f562ed 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>>   }
>>   #endif
>>
>> +/**
>> + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
>> + * to a large folio.
>> + * @ptep: Pointer to the page table entry.
>> + * @pte: The page table entry.
>> + *
>> + * This helper is invoked when the caller wants to batch over a set of ptes
>> + * mapping a large folio, but the concerned code path does not already have
>> + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
>> + * the underlying folio was small; i.e keep the small folio case as fast as
>> + * possible.
>> + *
>> + * The caller must ensure that ptep + 1 exists.
> 
> ptep points to an entry in a PTE page. As long as it is not pointing
> to the last entry, ptep+1 should always exist. With PTRS_PER_PTE and
> sizeof(pte_t), you can check ptep address to figure out whether it
> is the last entry of a PTE page, right? Let me know if I misunderstand
> anything.

Sounds correct to me.

> 
> 
> --
> Best Regards,
> Yan, Zi

