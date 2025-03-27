Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3225A1E86E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743076819; cv=none; b=AGIi3IXQM3Qr5oJUb2rFbECEY0ke8TVqXCq45Aavzi2fM++lOrSyCzkztiUO/kvRtfQEIYV/H8pzJ68BWvizZQ4H+OR7U0PotBjA8wYoURTjT2h+XoqjaLt2E00kdOeZhWCsfOjArvjo3h8Bwvr7ShIDaEd4cVthlVNjCEQdQPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743076819; c=relaxed/simple;
	bh=vIdKA9eZociGWrvdAYzNQnjw8esZ8czdfQWopiGEREU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=corfCldcdkUNq4lp0kxxBfjqbPj1B1eXkzVVGl2FJFFMvkbHJxy0s3LDAP1S1wCKK7QlG/RkdkkGxa8AAGtZ0EJRZ0iAlWWLs8OxTESvphbK5vMPhjEouCos97HjhDpfTT6UuZnxjBKtJdOBWsIq+jiGevKieLB6JEqBigkk67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PMNnE2Uc; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PMNnE2Uc"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743076813; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vr/c3ISrDk3OHC8wgPBlpsW0FwhldAhscNXOQWzhCaQ=;
	b=PMNnE2UcUl85VOqfzWHwhlf7WDMc8NA4JZWElSrPuzaFXte+FsfwA/BtZl7mPvUpuNYeObaFNKVCfDPKaRuOdpRl4lpXH6ARR7MLBK8oeilYBHk3QU/tG2hpPkZFWvU+/+pOnUAWDACkzcMljZMezMzxNpTIQXhP0mJrwyjKfX8=
Received: from 30.39.188.151(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WT9Z7VA_1743076495 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Mar 2025 19:54:56 +0800
Message-ID: <2f44fda6-c20c-4d90-ae83-e650c43a16ff@linux.alibaba.com>
Date: Thu, 27 Mar 2025 19:54:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, hughd@google.com, willy@infradead.org,
 david@redhat.com, 21cnbao@gmail.com, ryan.roberts@arm.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <Z-UtOF97qjcm4Hgu@localhost.localdomain>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <Z-UtOF97qjcm4Hgu@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/3/27 18:49, Oscar Salvador wrote:
> On Wed, Mar 26, 2025 at 11:38:11AM +0800, Baolin Wang wrote:
>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>   		walk->action = ACTION_AGAIN;
>>   		return 0;
>>   	}
>> -	for (; addr != end; ptep++, addr += PAGE_SIZE) {
>> +	for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>   		pte_t pte = ptep_get(ptep);
>>   
>> +		step = 1;
>>   		/* We need to do cache lookup too for pte markers */
>>   		if (pte_none_mostly(pte))
>>   			__mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>   						 vma, vec);
>> -		else if (pte_present(pte))
>> -			*vec = 1;
>> -		else { /* pte is a swap entry */
>> +		else if (pte_present(pte)) {
>> +			if (pte_batch_hint(ptep, pte) > 1) {
> 
> AFAIU, you will only batch if the CONT_PTE is set, but that is only true for arm64,
> and so we lose the ability to batch in e.g: x86 when we have contiguous
> entries, right?
> 
> So why not have folio_pte_batch take care of it directly without involving
> pte_batch_hint here?

Good question, this was the first approach I tried.

However, I found there was a obvious performance regression with small 
folios (where CONT_PTE is not set). I think the overhead introduced by 
vm_normal_folio() and folio_pte_batch() is greater than the optimization 
gained from batch processing small folios.

For large folios where CONT_PTE is set, ptep_get()--->contpte_ptep_get() 
wastes a significant amount of CPU time, so using folio_pte_batch() can 
improve the performance obviously.
