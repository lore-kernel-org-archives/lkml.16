Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAFB2AF0E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749986074; cv=none; b=vBGkKy/mAup4sBnHDKBiMQNgKPNIP39aJVzhbOj2yJT6Zk7DY/jchhvTOMHQs9BWZJNe5pj1XEXhin4swVYRd5cBvyNgzqYsUCk83JZNEv+Atai3KYauKOxZ4QWz01rbl78JTI2KHRKA0VuQT4M0WXSAND18P5CbvxBCurAdvaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749986074; c=relaxed/simple;
	bh=FgBydRHocshlTeyq0EgxHNiBGU1sSwQ3LhYsVJmwca0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dz6I9NgQJZS69scfyVKQ5J2MbSfEd6cSwgK/Eh1moUZU4XWZnLTdWP4NbGsRaJuwLYGcREsnZaz9PWfQSRvTbXclTN7XApIsXv1U5JW4IHE0VrVomtee1gWdk6UqTYJPe8m0FV0wSztOJ1SjW7ceB+fQNrn3rst7rSq5f4SC4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=XnFTzL6Y; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="XnFTzL6Y"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749986062; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=x8P/eQrzTlQYqpos4YBZX8g3SFUnmIqtpEpLS+GA/Wo=;
	b=XnFTzL6YW+1CXGj02GVbxOgpFD8HniBGPm0JilZqPHh0iL8qZJYDe+mYZkdr6gGSucsxSFzPTrWxLANvdfnc2cAfCk1bMhS2XFxHbt+ZRAmEE8lUsGBG+Of7A7esRzy1CYKVxvzFh/GSw3RJoooCBgpekgJSh+1FXV+VwOFllrM=
Received: from 30.39.221.146(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdpiC5g_1749986061 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 15 Jun 2025 19:14:21 +0800
Message-ID: <2d175a55-84e3-489f-8c93-66bedaa859a6@linux.alibaba.com>
Date: Sun, 15 Jun 2025 19:14:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: huge_memory: fix the check for allowed huge orders in
 shmem
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <529affb3220153d0d5a542960b535cdfc33f51d7.1749804835.git.baolin.wang@linux.alibaba.com>
 <c7e64411-1c07-401e-8503-928184ca22f6@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <c7e64411-1c07-401e-8503-928184ca22f6@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/13 19:16, Lorenzo Stoakes wrote:
> On Fri, Jun 13, 2025 at 05:12:19PM +0800, Baolin Wang wrote:
>> Shmem already supports mTHP, and shmem_allowable_huge_orders() will return
>> the huge orders allowed by shmem. However, there is no check against the
>> 'orders' parameter passed by __thp_vma_allowable_orders(), which can lead
>> to incorrect check results for __thp_vma_allowable_orders().
>>
>> For example, when a user wants to check if shmem supports PMD-sized THP
>> by thp_vma_allowable_order(), if shmem only enables 64K mTHP, the current
>> logic would cause thp_vma_allowable_order() to return true, implying that
>> shmem allows PMD-sized THP allocation, which it actually does not.
>>
>> I don't think this will cause a significant impact on users, and this will
>> only have some impact on the shmem THP collapse. That is to say, even though
>> the shmem sysfs setting does not enable the PMD-sized THP, the
>> thp_vma_allowable_order() still indicates that shmem allows PMD-sized collapse,
>> meaning it might successfully collapse into THP, or it might not (for example,
>> thp_vma_suitable_order() check failed in the collapse process). However, this
>> still does not align with the shmem sysfs configuration, fix it.
> 
> Can you explain why?
> 
> It's a bit painful to trace through the code paths, but why do you think only
> MADV_COLLAPSE will be impacted? Surely everywhere that checks this is?

For shmem, thp_vma_allowable_order() and its wrapper are only used in 
show_smap() and shmem collapse (which includes khugepaged and 
madvise_collapse()). For shmem collapse, as I mentioned, the impact 
might not be very significant. For show_smap(), since it will use the 
'THP_ORDERS_ALL', it will not affect the results of show_smap().

>> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> I can't see how this can be incorrect, as we really should be restricting
> ourselves to the orders requested.
> 
> So:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks.

> 
>> ---
>> Note: this general change is suitable to be split out as a bugfix patch
>> based on the discussions in the previous thread[1].
>>
>> [1] https://lore.kernel.org/all/86bf2dcd-4be9-4fd9-98cc-da55aea52be0@lucifer.local/
>> ---
>>   mm/huge_memory.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index d3e66136e41a..a8cfa37cae72 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -166,7 +166,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>   	 * own flags.
>>   	 */
>>   	if (!in_pf && shmem_file(vma->vm_file))
>> -		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
>> +		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
>>   						   vma, vma->vm_pgoff, 0,
> 
> I mean this seems correct to me, but what a massive oversight.
> 
> I wish we had a sensible way of testing this...

It might not be easy to write test cases because it requires dynamically 
toggling the mTHP sysfs setting for shmem. However, as khugepaged 
supports mTHP collapse in the future, we can try to add more tests.

>>   						   !enforce_sysfs
> This whole code path is entirely indicative of what a complete mess this whole
> thing is.
> 
> The fact shmem separately calls this function is just ugh. I'm talking myself
> into some mega refactoring here :)

Yes, Shmem has its own separate mTHP sysfs interfaces, with more complex 
logic :)
