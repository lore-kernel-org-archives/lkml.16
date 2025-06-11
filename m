Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFF628FD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625386; cv=none; b=tqS/EavUx1XXzFoPh9OOPRfCPJAhnbUqJzj+Wb5qvJZ+/pKvunhb1V/d/j8rN4Dd7hbSMB3+rU69DOIryyfCgxR7Kv3KBicmn2hwfiprc1s3WF4dkjFWyuRB0GWlzioxiDlyZhdPcnjIcHg6fqq5zGRDuAnRc6K32Au4CecdLkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625386; c=relaxed/simple;
	bh=a2Msg8/U+Qlo2XAuNI/4IaiijDCxgzaPORZsLi7mfKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dznMica/kI1mT/NVYs9NQXh7rm587BCL5gb8UKWlD4cRBWwKsGLj6EWYxvFcsxX+liXGnmEUQmSpINQz6ynARt9XwjZ6h5sqnB6MQpc7UTydk2AuCLhpppFYvcimOsy0+uKdO/I8lA0lDt21zCPF8vOb99HCiMRxgTvvFjmy+P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=AMkrdtmD; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="AMkrdtmD"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749625375; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=cky1mhqZeHnNT4xZL/7/NUHWUNW6VBAuAzbtLdXRr2M=;
	b=AMkrdtmD11i1YIZivZorgQBtUWS13ccmIYpy5cwW54KDLuV+tNCe6Wj//T6dGOanwGWwYq/VabxhzzymzEHjrSdTQN3XPl7ZqTdD9vY49w/2JrjarXzEJ9Vn/GiBk7G4ZWzMtSDywv6SLXp1XmgiGqR3l7Om4esPEJlh6funj10=
Received: from 30.74.144.128(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdcCfV._1749625374 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Jun 2025 15:02:55 +0800
Message-ID: <c388562f-cb00-40bb-9ec1-ec07976771c4@linux.alibaba.com>
Date: Wed, 11 Jun 2025 15:02:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <39d7617a6142c6091f233357171c5793e0992d36.1749109709.git.baolin.wang@linux.alibaba.com>
 <b6ae32e5-60e0-44dd-a1e8-37c162d04ed3@lucifer.local>
 <5578735d-a06c-4a50-9ca1-c141092f2b3a@linux.alibaba.com>
 <86bf2dcd-4be9-4fd9-98cc-da55aea52be0@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <86bf2dcd-4be9-4fd9-98cc-da55aea52be0@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/9 23:33, Lorenzo Stoakes wrote:
> OK overall the logic looks good now I realise the mistake I made is that
> the thp_vma_allowable_orders() check is for the vma_is_anonymous() case
> only.
> 
> On Mon, Jun 09, 2025 at 02:31:46PM +0800, Baolin Wang wrote:
>>
>>
>> On 2025/6/7 20:14, Lorenzo Stoakes wrote:
>>> On Thu, Jun 05, 2025 at 04:00:59PM +0800, Baolin Wang wrote:
>>>> The MADV_COLLAPSE will ignore the system-wide shmem THP sysfs settings, which
>>>> means that even though we have disabled the shmem THP configuration, MADV_COLLAPSE
>>>> will still attempt to collapse into a shmem THP. This violates the rule we have
>>>> agreed upon: never means never.
>>>
>>> Ugh that we have separate shmem logic. And split between huge_memory.c and
>>> shmem.c too :)) Again, not your fault, just a general moan about existing
>>> stuff :P
>>>
>>>>
>>>> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
>>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>>
>>> Hm I'm not sure if this is enforced is it? I may have missed something here
>>> however.
>>>
>>>>
>>>> Then the current strategy is:
>>>>
>>>> For shmem, if none of always, madvise, within_size, and inherit have enabled
>>>> PMD-sized THP, then MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.
>>>
>>> Again, is this just MADV_COLLAPSE? Surely this is a general change?
>>>
>>> We should be clear that we are not explicitly limiting ourselves to
>>> MADV_COLLAPSE here.
>>>
>>> You shoudl clearly indicate that the MADV_COLLAPSE case DOESN'T set
>>> TVA_ENFORCE_SYSFS and that's the key difference here.
>>
>> Sure.
>>
> 
> Thanks!
> 
>>>> For tmpfs, if the mount option is set with the 'huge=never' parameter, then
>>>> MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.
>>>>
>>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>    mm/huge_memory.c | 2 +-
>>>>    mm/shmem.c       | 6 +++---
>>>>    2 files changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index d3e66136e41a..a8cfa37cae72 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -166,7 +166,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>>    	 * own flags.
>>>>    	 */
>>>>    	if (!in_pf && shmem_file(vma->vm_file))
>>>> -		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
>>>> +		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
>>>>    						   vma, vma->vm_pgoff, 0,
>>>>    						   !enforce_sysfs);
>>>
>>> Did you mean to do &&?
>>
>> No. It might be worth having a separate fix patch here, because the original
>> logic is incorrect and needs to perform an '&' operation with ’orders‘.
>>
>> This change should be a general change.
> 
> Ah yeah, I did think that _perhaps_ it could be. I think it would make
> sense to separate out into another patch albeit very small, just so we can
> separate your further changes from the fix for this.

OK.

>>> Also, is this achieving what you want to achieve? Is it necessary? The
>>> changes in patch 1/2 enforce the global settings and before this code in
>>> __thp_vma_allowable_orders():
>>>
>>> unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>> 					 unsigned long vm_flags,
>>> 					 unsigned long tva_flags,
>>> 					 unsigned long orders)
>>> {
>>> 	... (no early exits) ...
>>>
>>> 	orders &= supported_orders;
>>> 	if (!orders)
>>> 		return 0;
>>>
>>> 	...
>>> }
>>>
>>> So if orders == 0 due to the changes in thp_vma_allowable_orders(), which
>>> is the only caller of __thp_vma_allowable_orders() then we _always_ exit
>>> early here before we get to this shmem_allowable_huge_orders() code.
>>
>> Not for this case. Since shmem already supports mTHP, this is to check
>> whether the 'orders' are enabled in the shmem mTHP configuration. For
>> example, shmem mTHP might only enable 64K mTHP, which obviously does not
>> allow PMD-sized THP to collapse.
> 
> Yeah sorry I get it now thp_vma_allowable_orders() does a
> vma_is_anonymous() predicate. Doh! :P
> 
> God what a mess this is (not your fault, pre-existing obviously :P)
> 
> Yeah le sigh.
> 
>>
>>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>>> index 4b42419ce6b2..9af45d4e27e6 100644
>>>> --- a/mm/shmem.c
>>>> +++ b/mm/shmem.c
>>>> @@ -625,7 +625,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
>>>>    		return 0;
>>>>    	if (shmem_huge == SHMEM_HUGE_DENY)
>>>>    		return 0;
>>>> -	if (shmem_huge_force || shmem_huge == SHMEM_HUGE_FORCE)
>>>> +	if (shmem_huge == SHMEM_HUGE_FORCE)
>>>>    		return maybe_pmd_order;
> 
> OK I get it now, this means the !check sysfs doesn't just get
> actioned... :)
> 
>>>>
>>>>    	/*
>>>> @@ -660,7 +660,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
>>>>
>>>>    		fallthrough;
>>>>    	case SHMEM_HUGE_ADVISE:
>>>> -		if (vm_flags & VM_HUGEPAGE)
>>>> +		if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
>>>>    			return maybe_pmd_order;
>>>>    		fallthrough;
>>>>    	default:
>>>> @@ -1790,7 +1790,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>>>    	/* Allow mTHP that will be fully within i_size. */
>>>>    	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
>>>>
>>>> -	if (vm_flags & VM_HUGEPAGE)
>>>> +	if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
>>>>    		mask |= READ_ONCE(huge_shmem_orders_madvise);
>>>
>>> I'm also not sure these are necessary:
>>>
>>> The only path that can set shmem_huge_force is __thp_vma_allowable_orders()
>>> -> shmem_allowable_huge_orders() -> shmem_huge_global_enabled() and then
>>> only if !(tva_flags & TVA_ENFORCE_SYSFS) and as stated above we already
>>> cover off this case by early exiting __thp_vma_allowable_orders() if orders
>>> == 0 as established in patch 1/2.
>>
>> Not ture. Shmem has its own separate mTHP sysfs setting, which is different
>> from the mTHP sysfs setting for anonymous pages mentioned earlier. These
>> checks are in the shmem file. You can check more for shmem mTHP in
>> Documentation/admin-guide/mm/transhuge.rst :)
> 
> Ah yeah the issue is if (vma_is_anonymous())... doh!
> 
> The stack trace is correct though, this is the only place we do it:
> 
> ~~
> 
> static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index,
> 					      loff_t write_end, bool shmem_huge_force,
> 					      struct vm_area_struct *vma,
> 					      unsigned long vm_flags)
> 
> Is called from shmem_getattr():
> 
> 	if (shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0))
> 		stat->blksize = HPAGE_PMD_SIZE;
> 
> Note that smem_huge_force == false here
> 
> And shmem_allowable_huge_orders():
> 
> unsigned long shmem_allowable_huge_orders(struct inode *inode,
> 				struct vm_area_struct *vma, pgoff_t index,
> 				loff_t write_end, bool shmem_huge_force)
> 
> 	global_orders = shmem_huge_global_enabled(inode, index, write_end,
> 						  shmem_huge_force, vma, vm_flags);
> 
> Which forwards 'shmem_huge_force'.
> 
> In shmem_get_folow_gfp():
> 
> 	orders = shmem_allowable_huge_orders(inode, vma, index, write_end, false);
> 
> Note that shmem_huge_force == false.
> 
> In __thp_vma_allowable_orders();
> 
> unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> 					 unsigned long vm_flags,
> 					 unsigned long tva_flags,
> 					 unsigned long orders)
> {
> 	...
> 	bool enforce_sysfs = tva_flags & TVA_ENFORCE_SYSFS;
> 
> 	...
> 
> 	if (!in_pf && shmem_file(vma->vm_file))
> 		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
> 						   vma, vma->vm_pgoff, 0,
> 						   !enforce_sysfs);
> 
> So we set shmem_huge_force only if TVA_ENFORCE_SYSFS is not set in tva_flags passed to __thp_vma_allowable_orders()
> 
> The only caller of __thp_vma_allowable_orders() is thp_vma_allowable_orders().

Right :)

> 
> But yeah we do need to do shmem things... sorry my mistake.

No worries. I appreciate your useful comments.
