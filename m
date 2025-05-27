Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F92698A2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352231; cv=none; b=LMbQv3b0lLZKXGM1KRo+Lz6Qaj6TzLna5AIxhjr9hURAcHVDbxmdJu83RnN5enGVORC65mLyfd6kz0eZMbYszLpz6CYBB/3+LGj7/r5l5wgp6w6vSC8aQ8Ou3cVlwqjMEcrmVk/CIuNJfKb3pD7KWb9hZ5mVAJ3SqDBYqFirIDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352231; c=relaxed/simple;
	bh=4eG/hDMFH8Xf0RkpqTIYTmRD0uXasd63SHrANtzsxZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0KkuKoaZ+AcezB7E+UeBZc4hoozA8vG+sEeYMnlvk1bwSn2kVBi/nXuFJlG0gSzAbks2i8bjNdfDunA1AZyj6Y8m9EzvgR9Zh8f4E/PkAN8CJB6VFOR5qIcWiLunwgU/jRrBc41rSJi513Rr9Ey7UmNJDhiTnX/UEIAAajhODE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4b6CyD4J3LzKHMZq
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:23:48 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 115EF1A01A6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:23:47 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgA36HjhvDVoLKDUNQ--.11216S2;
	Tue, 27 May 2025 21:23:46 +0800 (CST)
Message-ID: <e93e30db-8c78-4bb6-825f-a538825c6375@huaweicloud.com>
Date: Tue, 27 May 2025 21:23:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Oleg Nesterov <oleg@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com,
 mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20250526154850.GA4156@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:cCh0CgA36HjhvDVoLKDUNQ--.11216S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4DJr4ftF4kWF43XrW3trb_yoWDArgE9r
	W0vryayr1DZr1Fva1Yyws8ArZ8K3yDAr18t34rWry7t34DXFn5urykCryfXa43uws2yFW5
	Wrn0vayIgryUWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUF1
	v3UUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 2025/5/26 23:48, Oleg Nesterov wrote:
> Hi Lehui,
> 
> As I said, I don't understand mm/, so can't comment, but...
> 
> On 05/26, Pu Lehui wrote:
>>
>> To make things simpler, perhaps we could try post-processing, that is:
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 83e359754961..46a757fd26dc 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control
>> *pmc,
>>                  if (pte_none(ptep_get(old_pte)))
>>                          continue;
>>
>> +               /* skip move pte when expanded range has uprobe */
>> +               if (unlikely(pte_present(*new_pte) &&
>> +                            vma_has_uprobes(pmc->new, new_addr, new_addr +
>> PAGE_SIZE)))
>> +                       continue;
>> +
> 
> I was thinking about
> 
> 	WARN_ON(!pte_none(*new_pte))
> 
> at the start of the main loop.
> 
> Obviously not to fix the problem, but rather to make it more explicit.
> 
> This matches the similar xxx_none() checks in the move_pgt_entry() paths,
> say, move_normal_pmd().
> 
> Oleg.

Got it. It will help identify problems in time.

