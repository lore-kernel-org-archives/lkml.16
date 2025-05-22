Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6922A290F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926043; cv=none; b=Vye1jPrQiVAn4PCxpRqSvEfwSLfRG+O2tdR3+8/ccZcJSvDuuS++KqIek0hLHEJFejQplNh22SK8Z4xU9CnNDDtPhITWbFY3q/68T8KVHm/Yffb0pkSO6vLD3J3x7/gsmCw3DkhKlYW2gPRhxDHFJNSVMYt4UXCeVkdtrX6Nxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926043; c=relaxed/simple;
	bh=MZkcoZ0XmdiG8RsEqiU8qe9pvemXpcg/q1rozPcwjaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKPduqdCvRIkWMtLc6TvF0iLXVzIYQvPr62skTOaGFVBAwLUOw57j7tYOT4T7IR7LmCmb5JOYwGuBUMBdwVUnLgkJgVyHKw1H78kCDklFKUdQIUoyTa6b6Aun8fzKiGjAVvIi9d5LACwoyebEU9mSzXUJ7tql8A2wdAW/h3DIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b3BKg6Skqz4f3lCf
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:00:07 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 784D81A018D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:00:34 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgBnFlsOPC9ofZC9NA--.62282S2;
	Thu, 22 May 2025 23:00:32 +0800 (CST)
Message-ID: <d0b9208e-755f-46f5-928d-77b7e120d74e@huaweicloud.com>
Date: Thu, 22 May 2025 23:00:30 +0800
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
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
 akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <a55fd3c0-cd53-43d9-a200-290d64dcf04f@lucifer.local>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <a55fd3c0-cd53-43d9-a200-290d64dcf04f@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgBnFlsOPC9ofZC9NA--.62282S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4xAr4kZryrZr4xZw15CFg_yoWxuF1kpF
	Wvvan8KF48Ja1qgr1jvw1qvFyftws3tr4UAryfXa4Y9r9Iqr43tFs7CFW5Cry5AFZ2gF1I
	yr4UKr9ayFW2va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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


On 2025/5/21 21:13, Lorenzo Stoakes wrote:
> Overall need to dig into this a bit before we come up with a final fix.
> 
> Has this _always_ been the case? Or could you bisect this to a particular kernel
> commit?
> 
> If you haven't dug into that, could you do so?

Thanks for your review. The directly related commit is 78a320542e6c 
("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC") 
# v3.7-rc3, but in fact, I think the issue was introduced in the 
original commit 2b1444983508 ("uprobes, mm, x86: Add the ability to 
install and remove uprobes breakpoints") # v3.5-rc1. This issue is quite 
old, but the mremap code differs a lot between linux versions. Perhaps 
we need to fix it in multiple versions separately.

> 
> Thanks!
> 
> On Wed, May 21, 2025 at 09:25:03AM +0000, Pu Lehui wrote:
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> We encountered a BUG alert triggered by Syzkaller as follows:
>>     BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES val:1
>>
>> And we can reproduce it with the following steps:
>> 1. register uprobe on file at zero offset
>> 2. mmap the file at zero offset:
>>     addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
>> 3. mremap part of vma1 to new vma2:
>>     addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
>> 4. mremap back to orig addr1:
>>     mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
>>
>> In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
>> vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
>> the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
>> In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
>> to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
>> 4096, addr1 + 8192] still maps the file, it will take
>> vma_merge_new_range to merge these two addr ranges, and then do
>> uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
>> offset, it will install uprobe anon page to the merged vma. However, the
>> upcomming move_page_tables step, which use set_pte_at to remap the vma2
>> uprobe anon page to the merged vma, will over map the old uprobe anon
>> page in the merged vma, and lead the old uprobe anon page to be orphan.
>>
>> Since the uprobe anon page will be remapped to the merged vma, we can
>> remove the unnecessary uprobe_mmap at merged vma, that is, do not
>> perform uprobe_mmap when there is no vma in the addr range to be
>> expaned.
> 
> Good spot... lord.
> 
>>
>> This problem was first find in linux-6.6.y and also exists in the
>> community syzkaller:
>> https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/
>>
>> The complete Syzkaller C reproduction program is as follows:
>>
>> #define _GNU_SOURCE
>> #include <sys/mman.h>
>> #include <linux/perf_event.h>
>> #include <linux/hw_breakpoint.h>
>>
>> #include <fcntl.h>
>> #include <stdio.h>
>> #include <stdint.h>
>> #include <string.h>
>> #include <syscall.h>
>> #include <unistd.h>
>>
>> int main(int argc, char *argv[])
>> {
>>      // Find out what type id we need for uprobes
>>      int perf_type_pmu_uprobe;
>>      {
>>          FILE *fp = fopen("/sys/bus/event_source/devices/uprobe/type", "r");
>>          fscanf(fp, "%d", &perf_type_pmu_uprobe);
>>          fclose(fp);
>>      }
>>
>>      const char *filename = "./bus";
>>
>>      int fd = open(filename, O_RDWR|O_CREAT, 0600);
>>      write(fd, "x", 1);
>>
>>      void *addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
>>                        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>
>>      // Register a perf uprobe on "./bus"
>>      struct perf_event_attr attr = {};
>>      attr.type = perf_type_pmu_uprobe;
>>      attr.uprobe_path = (unsigned long) filename;
>>      syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
>>
>>      void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
>>      void *addr3 = mremap((void *) addr2, 4096, 2 * 4096, MREMAP_MAYMOVE);
>>      mremap(addr3, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, (void *) addr2);
>>
>>      return 0;
>> }
> 
> Thanks for including this.
> 
> We can probably refine this down a bit though (let me have a tinker around).
> 
>>
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>> ---
>>   mm/vma.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/vma.c b/mm/vma.c
>> index 3ff6cfbe3338..9a8d84b12918 100644
>> --- a/mm/vma.c
>> +++ b/mm/vma.c
>> @@ -325,7 +325,7 @@ static void vma_prepare(struct vma_prepare *vp)
>>    * @mm: The mm_struct
>>    */
>>   static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>> -			 struct mm_struct *mm)
>> +			 struct mm_struct *mm, bool handle_vma_uprobe)
> 
> Nity, but please do not add a field here, add it to the vma_prepare struct.

ok

> 
>>   {
>>   	if (vp->file) {
>>   		if (vp->adj_next)
>> @@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>>
>>   	if (vp->file) {
>>   		i_mmap_unlock_write(vp->mapping);
>> -		uprobe_mmap(vp->vma);
>> +		if (handle_vma_uprobe)
>> +			uprobe_mmap(vp->vma);
> 
> You could perhaps make this simpler by making uprobe_mmap() take a vma_prepare *
> parameter, where you can check this?

got it

> 
>>
>>   		if (vp->adj_next)
>>   			uprobe_mmap(vp->adj_next);
>> @@ -549,7 +550,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>>   	}
>>
>>   	/* vma_complete stores the new vma */
>> -	vma_complete(&vp, vmi, vma->vm_mm);
>> +	vma_complete(&vp, vmi, vma->vm_mm, true);
>>   	validate_mm(vma->vm_mm);
>>
>>   	/* Success. */
>> @@ -715,6 +716,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
>>   {
>>   	struct vm_area_struct *vma;
>>   	struct vma_prepare vp;
>> +	bool handle_vma_uprobe = !!vma_lookup(vmg->mm, vmg->start);
> 
> This is really inefficient. We can't be doing a maple tree search on every
> commit_merge(), especially not just for the sake of uprobe.
> 
> Let me have a tinker around with this and see how we can do this more sensibly,
> I'd say as part of the vmg.

so, we can add `bool handle_vma_uprobe` member in vmg, then set true 
before enter vma_merge_new_range in copy_vma, and then pass it to vp 
struct. wdyt?

But this may not suit for other version, such as linux-6.6.y.

> 
>>
>>   	if (vmg->__adjust_next_start) {
>>   		/* We manipulate middle and adjust next, which is the target. */
>> @@ -748,7 +750,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
>>   	vmg_adjust_set_range(vmg);
>>   	vma_iter_store_overwrite(vmg->vmi, vmg->target);
>>
>> -	vma_complete(&vp, vmg->vmi, vma->vm_mm);
>> +	vma_complete(&vp, vmg->vmi, vma->vm_mm, handle_vma_uprobe);
> 
> Again, having fields means we can drop this and the below changes.

ok

> 
>>
>>   	return 0;
>>   }
>> @@ -1201,7 +1203,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
>>
>>   	vma_iter_clear(vmi);
>>   	vma_set_range(vma, start, end, pgoff);
>> -	vma_complete(&vp, vmi, vma->vm_mm);
>> +	vma_complete(&vp, vmi, vma->vm_mm, true);
>>   	validate_mm(vma->vm_mm);
>>   	return 0;
>>   }
>> --
>> 2.34.1
>>

