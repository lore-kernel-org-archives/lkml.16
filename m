Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8F7E110
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271166; cv=none; b=SpY3ALdcfJ4h4sWkU3OnjcSPtC21s3OSQ05kX82Zm+2ABHkp3HNB6l4TsmxJBBFDdhPGfQ8lcyt7lUoRqdg2ZhVgZtvxdge4yy7/2WlPlRFnNqwCRywFXZQf10yaUceMixyQmN7HzvZC+o6EB9cZEtjCedr1FmESTJFFFYT0jyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271166; c=relaxed/simple;
	bh=G7c72AV8gS3wkfxDivSJ+ckK3flK2C0qPAWpZppbbr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uj2xGruqunkkdtaF+wAMNVnP71lschQmu4quEbKloA+xnR225Xz2XuSHsdr6K0CD3VViAz5KbCDNJnfEgN6qdc43Xk4bHcsoQbS7Ii05z6k6ipojS/fI+yybAL/y1eYsY1R0Uap3dHsfC/UHE8Dvzv6+tTAN8QhyHSKIkk+o9qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b5dyg534Bz4f3lDG
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:52:11 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 717351A0A11
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:52:38 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgD3lsE0gDRoZo2CNQ--.12408S2;
	Mon, 26 May 2025 22:52:38 +0800 (CST)
Message-ID: <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
Date: Mon, 26 May 2025 22:52:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com,
 oleg@redhat.com
Cc: mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgD3lsE0gDRoZo2CNQ--.12408S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4Duw13KrWxJw47AF1UKFg_yoWrGr4xpa
	yxJas8KF1DJFWFyryqv34DtFyrtw4Ut3yUXrn8JFya93s8Kr1aqFW7ZFWjkFy3XrZ3tF4U
	tr4Ut343Xa47JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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


On 2025/5/22 23:14, David Hildenbrand wrote:
> On 22.05.25 16:37, Pu Lehui wrote:
>>
>>
>> On 2025/5/21 18:25, David Hildenbrand wrote:
>>> On 21.05.25 11:25, Pu Lehui wrote:
>>>> From: Pu Lehui <pulehui@huawei.com>
>>>>
>>>> We encountered a BUG alert triggered by Syzkaller as follows:
>>>>      BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES
>>>> val:1
>>>>
>>>> And we can reproduce it with the following steps:
>>>> 1. register uprobe on file at zero offset
>>>> 2. mmap the file at zero offset:
>>>>      addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
>>>
>>> So, here we will install a uprobe.
>>>
>>>> 3. mremap part of vma1 to new vma2:
>>>>      addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
>>>
>>> Okay, so we'll essentially move the uprobe as we mremap.
>>>
>>>
>>>> 4. mremap back to orig addr1:
>>>>      mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
>>>
>>> And here, we would expect to move the uprobe again.
>>>
>>>>
>>>> In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to 
>>>> new
>>>> vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
>>>> the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
>>>> In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
>>>> to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
>>>> 4096, addr1 + 8192] still maps the file, it will take
>>>> vma_merge_new_range to merge these two addr ranges, and then do
>>>> uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
>>>> offset, it will install uprobe anon page to the merged vma.
>>>
>>> Oh, so we're installing the uprobe into the extended VMA before moving
>>> the page tables.
>> Yep!
>>>
>>> Gah.
>>>
>>>> However, the
>>>> upcomming move_page_tables step, which use set_pte_at to remap the vma2
>>>> uprobe anon page to the merged vma, will over map the old uprobe anon
>>>> page in the merged vma, and lead the old uprobe anon page to be orphan.
>>>
>>> Right, when moving page tables we don't expect there to already be
>>> something from the uprobe code.
>>>
>>>>
>>>> Since the uprobe anon page will be remapped to the merged vma, we can
>>>> remove the unnecessary uprobe_mmap at merged vma, that is, do not
>>>> perform uprobe_mmap when there is no vma in the addr range to be
>>>> expaned.
>>>
>>> Hmmm, I'll have to think about other corner cases ....
>>>
>> looking forward to it
> 
> I think, the rule is that we must not install a uprobe for the range 
> that we will be actually moving the page tables for.
> 
> So, for the range we're effectively moving (not the one we're extending).
> 
> Because logically, the uprobe will be already handled by the existing 
> page tables that we're moving.
> 
> For the range we're extending, we must call uprobe handling code ...
> 
> 
> Alternatively, maybe we could call uprobe handling code after moving the 
> page tables. We'd probably find that the uprobe is already installed and 
> do nothing (so the theory :) ). ... if that would simplify anything.
> 

Hi David, Lorenzo, Oleg,

My apologies for the delay. Thanks for your reply.

To make things simpler, perhaps we could try post-processing, that is:

diff --git a/mm/mremap.c b/mm/mremap.c
index 83e359754961..46a757fd26dc 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control 
*pmc,
                 if (pte_none(ptep_get(old_pte)))
                         continue;

+               /* skip move pte when expanded range has uprobe */
+               if (unlikely(pte_present(*new_pte) &&
+                            vma_has_uprobes(pmc->new, new_addr, 
new_addr + PAGE_SIZE)))
+                       continue;
+
                 pte = ptep_get_and_clear(mm, old_addr, old_pte);
                 /*
                  * If we are remapping a valid PTE, make sure

What do you think?

Thanks,
Lehui

