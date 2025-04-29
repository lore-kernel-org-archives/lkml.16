Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396B4270ECF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917287; cv=none; b=cd0EY/H8DiVATapdFnbynP6oxA8YiDauP0hN59zCG6ftH0/xNKi1dqywpsJJ7yLyBbcfK/Fy01UtfvJ/WfuKexchZ0F3TcLVgRmCpDPrl9/HhrWoOq6OHe5xN5CAoDg6UxTWFb6Sm5emCICYfnrUhpx0HlSR3H5MuAnGYlJRY+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917287; c=relaxed/simple;
	bh=GewBV81fy3YnpRCzZaObcVneEMH6g10NABWeZO0ne0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7oRAft0b0dvbfCRZKLtpwHUTJTKuSXzyLeAeL6KdBqBXE8dLfDXKk9i2OfLc5OAMYfnIQFLxK81pbBKfGoWbPmj8PnMnuzV5TEe66pxLduUr81MRgF5E+kVh7gsw62qfZrBgsZWK29oNfCFxUtwSUXBhyx8N2s83YH4myjasUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E601F1516;
	Tue, 29 Apr 2025 02:01:18 -0700 (PDT)
Received: from [10.163.78.253] (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C0A53F673;
	Tue, 29 Apr 2025 02:01:15 -0700 (PDT)
Message-ID: <d4516c2c-2468-43c7-a270-d068392460e5@arm.com>
Date: Tue, 29 Apr 2025 14:31:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
 ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <93411699-2e36-4a4e-bc3a-3efeb8e2260b@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <93411699-2e36-4a4e-bc3a-3efeb8e2260b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/25 2:09 pm, Anshuman Khandual wrote:
> 
> 
> On 4/29/25 10:53, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..ed287289335f 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>   }
>>   #endif
>>   
>> +/* See the comment for ptep_modify_prot_start */
>> +#ifndef modify_prot_start_ptes
>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
>> +{
>> +	pte_t pte, tmp_pte;
>> +
>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>> +	while (--nr) {
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>> +		if (pte_dirty(tmp_pte))
>> +			pte = pte_mkdirty(pte);
>> +		if (pte_young(tmp_pte))
>> +			pte = pte_mkyoung(pte);
>> +	}
>> +	return pte;
>> +}
>> +#endif
>> +
>> +/* See the comment for ptep_modify_prot_commit */
>> +#ifndef modify_prot_commit_ptes
>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>> +{
>> +	for (;;) {
>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>> +		if (--nr == 0)
>> +			break;
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		old_pte = pte_next_pfn(old_pte);
>> +		pte = pte_next_pfn(pte);
>> +	}
>> +}
>> +#endif
> 
> Is there any particular reason why the first loop here is while { }
> based where as the second one is a for { } loop ?

modify_prot_start_ptes follows the pattern of get_and_clear_full_ptes. 
modify_prot_commit_ptes follows the pattern of wrprotect_ptes.

> 
>> +
>>   /*
>>    * On some architectures hardware does not set page access bit when accessing
>>    * memory page, it is responsibility of software setting this bit. It brings
> 
> These helpers should be added with at least a single caller using them.

