Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD38D1DEFE9
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746685879; cv=none; b=ZG1Szxc/TNQqsBV/nnp90+ydV4FlE602cbJMscS5WlefsjwA76llyR5tHdY1/NcRBz2Y1hEtYFXJ5b1Ub8OitXFpjOqesAML4wyKtqM2+9+0D6fDXw2ORe72U8+TDQvsIVF6vEYIgLNzSvbt2EDD7G1tBegwY7Xyghu6aqowZEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746685879; c=relaxed/simple;
	bh=vZRMPhhpZanflQyXzFgxtopwgfSnWaHd3na1GGwd1Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c63PBDX+xZ4cYLylLH8KH5cp0/OR0ai+1NOQ/Eb2/ttmAcbLry0aKvXwwzddtejcg05I32Xf+9mEQn4PzVAUtZNy1bk0c8QsIvHebytOrrMyZQsk4U8wRQ6/zAf4YJNj/NlMeA3tD64yWO831Dg1QEXO1qnLXrjzlQhSBK3GCeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7DE3106F;
	Wed,  7 May 2025 23:31:06 -0700 (PDT)
Received: from [10.163.54.182] (unknown [10.163.54.182])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 108883F5A1;
	Wed,  7 May 2025 23:31:08 -0700 (PDT)
Message-ID: <9bd98ddc-50fb-42cb-be22-1d08161f4713@arm.com>
Date: Thu, 8 May 2025 12:01:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
To: Zi Yan <ziy@nvidia.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org,
 libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com,
 baohua@kernel.org, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, hughd@google.com
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
 <74FDF9E1-3148-460B-8E3C-5EE156A3FA93@nvidia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <74FDF9E1-3148-460B-8E3C-5EE156A3FA93@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/8/25 07:30, Zi Yan wrote:
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
>>  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>>  mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
>>  2 files changed, 59 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..38dab1f562ed 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>>  }
>>  #endif
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

Agreed, this not-the-last-pte-entry test is definitely required here just
to prevent a potential unmapped access crash. But I do agree with Andrew
that unless there are callers, this should be contained in the call site
itself (mm/mremap.c) with a good explanation.
