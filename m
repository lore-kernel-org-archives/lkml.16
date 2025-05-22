Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC1628D821
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924650; cv=none; b=ahiuEDLeIGpj6q67KEqh43MOgscZ6KjY6hE+npj1bwyGsmylXbBNz74o8p/g6Ra9wtesVdWIeLJrtP6I9bK3bWiye5fj0bqR/RBLQzezL7fMMsdf9xqBcqAxuF/0+m9XBEPxiVPfKHFNJB0AShTprQRjfkqNs+itQSd4769KpP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924650; c=relaxed/simple;
	bh=9t+GvHdpjvZ3RIifDl9fUcLrgFV7Rqcwo+0Hpa3FCjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgPN4NzqlhzWSww4o6MSQdQfyRWu3Pxkhz4NM71nvowq61m8uN/C/gQFa/5l72mjGh3i1cE6DsI+1xPY0wqoSvRSwEr8roXkPVjwvVA8zzHAk748Rj0SEkPA/MkO8m5OsMdLPzQcUO+E5rYp/jZAE2hzXTvEqXwIuCnbkx8hGH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4b39qS6kszzYQv66
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:37:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 22E871A0359
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:37:24 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgAniFyiNi9osPK7NA--.57898S2;
	Thu, 22 May 2025 22:37:23 +0800 (CST)
Message-ID: <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
Date: Thu, 22 May 2025 22:37:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: David Hildenbrand <david@redhat.com>, mhiramat@kernel.org,
 oleg@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAniFyiNi9osPK7NA--.57898S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWrZF1rGr1fCw1xAF48Crg_yoW8tryxpa
	yIqas8KF97JFZ5Ary3A34DXry8twsYy345Ar1fXFya934rWr1aqFW7AFW2kFyfGFZ7tF4r
	tr4Fqry3tF9rJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
	7KsUUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 2025/5/21 18:25, David Hildenbrand wrote:
> On 21.05.25 11:25, Pu Lehui wrote:
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> We encountered a BUG alert triggered by Syzkaller as follows:
>>     BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES 
>> val:1
>>
>> And we can reproduce it with the following steps:
>> 1. register uprobe on file at zero offset
>> 2. mmap the file at zero offset:
>>     addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> 
> So, here we will install a uprobe.
> 
>> 3. mremap part of vma1 to new vma2:
>>     addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
> 
> Okay, so we'll essentially move the uprobe as we mremap.
> 
> 
>> 4. mremap back to orig addr1:
>>     mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
> 
> And here, we would expect to move the uprobe again.
> 
>>
>> In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
>> vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
>> the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
>> In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
>> to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
>> 4096, addr1 + 8192] still maps the file, it will take
>> vma_merge_new_range to merge these two addr ranges, and then do
>> uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
>> offset, it will install uprobe anon page to the merged vma.
> 
> Oh, so we're installing the uprobe into the extended VMA before moving 
> the page tables.
Yep!
> 
> Gah.
> 
>> However, the
>> upcomming move_page_tables step, which use set_pte_at to remap the vma2
>> uprobe anon page to the merged vma, will over map the old uprobe anon
>> page in the merged vma, and lead the old uprobe anon page to be orphan.
> 
> Right, when moving page tables we don't expect there to already be 
> something from the uprobe code.
> 
>>
>> Since the uprobe anon page will be remapped to the merged vma, we can
>> remove the unnecessary uprobe_mmap at merged vma, that is, do not
>> perform uprobe_mmap when there is no vma in the addr range to be
>> expaned.
> 
> Hmmm, I'll have to think about other corner cases ....
> 
looking forward to it

