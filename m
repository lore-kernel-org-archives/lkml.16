Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE727F166
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363403; cv=none; b=W0irPAGrAptjhLUmbPZTlCvAPwQaE+ScgkL1pj3g55Ij+IwQNhcqXcRwWZyRSoWPce9jNO+p9DDqlg+DpRYDXiVZf9SJ19ITbf2iXB3Ui/guAnIr8bvRzIvkfhMUqwXaCU38mOM6qCyk50cOMraZWoyP296rct8uZXnmIA04gCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363403; c=relaxed/simple;
	bh=Nk1Pfis4XQUSsaSsaXCgWf45iZhvKxj8qs/TvL8cVWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8xJ8ARrBOjaDaxK/vDxhZ0TlCK6wUAWeRcUvxZupYg+ppSjFZsAko3T96KAMEAYYGbjBPYrPqVDKbtX35GkXaCSzvY0Y7zBnyM9IHbPSBcsz1TBtRrgPc/dGK0s1DRnZz579jNZvtzN9nsKzDqMz46oM77oeBFEP7M+UDwW2fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b6J4T0rWHz4f3jQZ
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:29:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id DCD261A0359
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:29:55 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgAn13eA6DVoVrXhNQ--.36023S2;
	Wed, 28 May 2025 00:29:53 +0800 (CST)
Message-ID: <0c205e8a-9c7e-4500-8ede-00fae2d97d2f@huaweicloud.com>
Date: Wed, 28 May 2025 00:29:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be overwritten
 when expanding vma during mremap
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
 akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <cd02ea34-0675-4324-aa84-2696e834d922@lucifer.local>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <cd02ea34-0675-4324-aa84-2696e834d922@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgAn13eA6DVoVrXhNQ--.36023S2
X-Coremail-Antispam: 1UD129KBjvJXoW3ur15CF4UKF43WrWDur4Durg_yoWkCFWkpF
	Wktan8KF4UJFZ3K347Zr1jq34fKws7KryUCr13X34YkryYgr1aqF4SkF45Cry5XrZ293WS
	qr4UtryfCay2vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
	kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x02
	62kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07UAwIDUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 2025/5/27 21:34, Lorenzo Stoakes wrote:
> Hi Pu,
> 
> Just as you were sending this I was about to send you my suggestion :) That
> is hilarious haha. Maybe some cosmic connection? :P
Hi Lorenzo,

haha, so coincidental.😁

> 
> Anyway I don't know whether your approach is _quite_ correct here, you are
> generally disabling the uprobe behaviour on all VMA expansion (that is -
> new VMA merge, relocate_vma_down() (unlikely to be relevant ;), it seems
> sensible to only do so in the circumstances we know to be problematic.

agree, we should limit that on copy_vma.

> 
> I really do not want mremap-specific stuff in general merge code, it's the
> move page tables bit that makes this broken.
> 
> So... :P let me attach my suggestion as a fix-patch below.
> 
> TO BE CLEAR - I present this in this form purely to make it easy for you to
> grab, PLEASE take this patch and rework it (if it makes sense), I don't
> need any attribution other than a Suggested-by, maybe.

This is truly appreciate! In fact, this is my first patch related to 
memory and uprobe. My original intention was to spark discussion and 
attract experts to help handle this matter. I don't place much 
importance on the attribution of this patch. Like you, my focus is on 
contributing to the resolution of the issue.😁

> 
> They are rather close other than where this flag is set :)
> 
> I am by the way assuming that uprobes work by installing a special PTE at
> page offset 0 and only in the case where there is something installed here
> do we need to worry.

As Oleg later mentioned, we do not need this restriction, and I just 
verified this using the following test case:

#define _GNU_SOURCE
#include <fcntl.h>
#include <unistd.h>
#include <syscall.h>
#include <sys/mman.h>
#include <linux/perf_event.h>

#define FNAME   "./foo"
int main(int argc, char *argv[])
{
     int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
     struct perf_event_attr attr = {
         .type = 9,
         .size = 72,
         .config1 = (long) FNAME,
         .config2 = 8192,
     };
     void *addr1, *addr2;

     ftruncate(fd, 4 * 4096);
     mmap(NULL, 4096, PROT_EXEC, MAP_PRIVATE, fd, 4096);

     syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
     addr1 = mmap(NULL, 3 * 4096, PROT_NONE, MAP_PRIVATE, fd, 4096);
     addr2 = mremap(addr1, 2 * 4096, 3 * 4096, MREMAP_MAYMOVE);
     mremap(addr2 + 4096, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, 
addr1 + 4096);

     return 0;
}

But one thing confuses me—if mmap is used with zero_offset, it will not 
reproduce. Perhaps I need to verify this tomorrow.

#define _GNU_SOURCE
#include <fcntl.h>
#include <unistd.h>
#include <syscall.h>
#include <sys/mman.h>
#include <linux/perf_event.h>

#define FNAME   "./foo"
int main(int argc, char *argv[])
{
     int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
     struct perf_event_attr attr = {
         .type = 9,
         .size = 72,
         .config1 = (long) FNAME,
         .config2 = 8192,
     };
     void *addr1, *addr2;

     ftruncate(fd, 4 * 4096);
     mmap(NULL, 4096, PROT_EXEC, MAP_PRIVATE, fd, 0);

     syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
     addr1 = mmap(NULL, 4 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
     addr2 = mremap(addr1, 3 * 4096, 4 * 4096, MREMAP_MAYMOVE);
     mremap(addr2 + 2 * 4096, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, 
addr1 + 2 * 4096);

     return 0;
}

> 
> Please correct me if I'm misunderstanding here, I am not an expert on
> uprobes.
> 
> Thanks! This is a great find overall.
> 
> I'd also quite like us to make your repro a self test if possible? Not sure
> where we'd put it... could be in tools/testing/selftests/mm/merge.c
> actually, new one I created explicitly for VMA merge scenarios.

I will have a try!

> 
> Cheers, Lorenzo
> 
> On Tue, May 27, 2025 at 01:23:50PM +0000, Pu Lehui wrote:
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
>> remove the unnecessary uprobe_mmap on merged vma, that is, do not
>> perform uprobe_mmap on expanded vma.
>>
>> This problem was first find in linux-6.6.y and also exists in the
>> community syzkaller:
>> https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/
>>
>> The complete Syzkaller C reproduction program is as follows:
>>
>> #define _GNU_SOURCE
>> #include <fcntl.h>
>> #include <unistd.h>
>> #include <syscall.h>
>> #include <sys/mman.h>
>> #include <linux/perf_event.h>
>>
>> int main(int argc, char *argv[])
>> {
>>      int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
>>      struct perf_event_attr attr = {
>>          .type = 9,
>>          .uprobe_path = (long) FNAME,
>>          .probe_offset = 0x0,
>>      };
>>      void *addr1, *addr2;
>>
>>      write(fd, "x", 1);
>>      mmap(NULL, 4096, PROT_EXEC, MAP_PRIVATE, fd, 0);
>>
>>      syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
>>      addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
>>      addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
>>      mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
>>
>>      return 0;
>> }
>>
>> Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")
> 
> Nit, but we'll want to cc: stable once we agree on a solution too.

add `Cc: stable@vger.kernel.org` above Fixes tag?

> 
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>> ---
>>   mm/vma.c | 7 ++++++-
>>   mm/vma.h | 7 +++++++
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/vma.c b/mm/vma.c
>> index 1c6595f282e5..6445f515c7f2 100644
>> --- a/mm/vma.c
>> +++ b/mm/vma.c
>> @@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>>
>>   	if (vp->file) {
>>   		i_mmap_unlock_write(vp->mapping);
>> -		uprobe_mmap(vp->vma);
>> +		if (!vp->skip_vma_uprobe)
>> +			uprobe_mmap(vp->vma);
>>
>>   		if (vp->adj_next)
>>   			uprobe_mmap(vp->adj_next);
> 
> I think we need to cover off the adj_next case too, strictly. See the
> attached patch :P
> 
> To be honest the adj_next case won't be relevant, as this is not set for a
> new VMA, but it'd be odd to have a 'skip' or 'no' uprobe option and to not
> obey it in both cases.

alright, I haven't thought of any possible situations yet. If there are 
any problems later, we can add it back.

> 
>> @@ -737,6 +738,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
>>   	if (vma_iter_prealloc(vmg->vmi, vma))
>>   		return -ENOMEM;
>>
>> +	vp.skip_vma_uprobe = vmg->skip_vma_uprobe;
>>   	vma_prepare(&vp);
>>   	/*
>>   	 * THP pages may need to do additional splits if we increase
>> @@ -1151,6 +1153,9 @@ int vma_expand(struct vma_merge_struct *vmg)
>>   	if (remove_next)
>>   		vmg->__remove_next = true;
>>
>> +	/* skip uprobe_mmap on expanded vma */
>> +	vmg->skip_vma_uprobe = true;
>> +
> 
> Yeah this doesn't feel right, this will make this happen for all
> vma_expand() cases (including new VMA merge) and that's surely not correct
> for non-mremap cases?

agree!

> 
> Again see the attached patch :P
> 
>>   	if (commit_merge(vmg))
>>   		goto nomem;
>>
>> diff --git a/mm/vma.h b/mm/vma.h
>> index 9a8af9be29a8..56cc0364d239 100644
>> --- a/mm/vma.h
>> +++ b/mm/vma.h
>> @@ -19,6 +19,8 @@ struct vma_prepare {
>>   	struct vm_area_struct *insert;
>>   	struct vm_area_struct *remove;
>>   	struct vm_area_struct *remove2;
>> +	/* Whether to skip uprobe_mmap on vma */
>> +	bool skip_vma_uprobe;
>>   };
>>
>>   struct unlink_vma_file_batch {
>> @@ -120,6 +122,11 @@ struct vma_merge_struct {
>>   	 */
>>   	bool give_up_on_oom :1;
>>
>> +	/*
>> +	 * Whether to skip uprobe_mmap on merged vma.
>> +	 */
>> +	bool skip_vma_uprobe :1;
>> +
>>   	/* Internal flags set during merge process: */
>>
>>   	/*
>> --
>> 2.34.1
>>
> 
> ----8<----
>>From 30e39d0f223ae4ab5669584593071f5f7266beeb Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Tue, 27 May 2025 14:11:26 +0100
> Subject: [PATCH] mm: avoid orphaned uprobe
> 
> If, on mremap, me move a file-backed VMA mapped at offset 0 that possess a
> uprobe and it merges with an adjacent VMA, we will then invoke
> uprobe_mmap() once again to install a uprobe into this newly established
> VMA.
> 
> This is problematic, as when we then move the page tables back into place,
> we overwrite the uprobe entry and thus orphan the merge-established uprobe.
> 
> Avoid this by threading state to explicitly disallow the establishment of a
> new uprobe upon merge under these circumstances.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   mm/vma.c | 21 ++++++++++++++++++---
>   mm/vma.h |  5 +++++
>   2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index 1c6595f282e5..cc18d1dcdc57 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -169,6 +169,9 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
>   	vp->file = vma->vm_file;
>   	if (vp->file)
>   		vp->mapping = vma->vm_file->f_mapping;
> +
> +	if (vmg && vmg->no_uprobe)
> +		vp->no_uprobe = true;
>   }
> 
>   /*
> @@ -358,10 +361,13 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
> 
>   	if (vp->file) {
>   		i_mmap_unlock_write(vp->mapping);
> -		uprobe_mmap(vp->vma);
> 
> -		if (vp->adj_next)
> -			uprobe_mmap(vp->adj_next);
> +		if (!vp->no_uprobe) {
> +			uprobe_mmap(vp->vma);
> +
> +			if (vp->adj_next)
> +				uprobe_mmap(vp->adj_next);
> +		}
>   	}
> 
>   	if (vp->remove) {
> @@ -1830,6 +1836,15 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>   	vmg.middle = NULL; /* New VMA range. */
>   	vmg.pgoff = pgoff;
>   	vmg.next = vma_iter_next_rewind(&vmi, NULL);
> +
> +	/*
> +	 * If the VMA we are copying might contain a uprobe PTE, ensure that we
> +	 * do not establish one upon merge. otherwise, when mremap() moves page
> +	 * tables into place, we'll orphan the one just created.
> +	 */
> +	if (vma->vm_file && vma->vm_pgoff == 0)
> +		vmg.no_uprobe = true;
> +
>   	new_vma = vma_merge_new_range(&vmg);
> 
>   	if (new_vma) {
> diff --git a/mm/vma.h b/mm/vma.h
> index 9a8af9be29a8..4c35c5ab1aa2 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -19,6 +19,8 @@ struct vma_prepare {
>   	struct vm_area_struct *insert;
>   	struct vm_area_struct *remove;
>   	struct vm_area_struct *remove2;
> +
> +	bool no_uprobe :1;
>   };
> 
>   struct unlink_vma_file_batch {
> @@ -120,6 +122,9 @@ struct vma_merge_struct {
>   	 */
>   	bool give_up_on_oom :1;
> 
> +	/* If set, do not install a uprobe upon merge. */
> +	bool no_uprobe :1;
> +
>   	/* Internal flags set during merge process: */
> 
>   	/*
> --
> 2.49.0

nice, thanks Lorenzo!

