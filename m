Received: from out199-2.us.a.mail.aliyun.com (out199-2.us.a.mail.aliyun.com [47.90.199.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048AC2EF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749449434; cv=none; b=Pq9MW7F5EiDjalGrF7CaeiFVh0BA/IdJ9Vv4m000kKtvYqkfaWIpiwRfQ0Xu8nrL1SvBSPmBKKqOOoqVX3Phy6ErQ5cYXKmjQCdmj79Wd9FYTOU4TXMNoNkX5G0IwhTgucU2G/T1r+RwEEe0PaUF6xStvATb9806fHw4wODaoSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749449434; c=relaxed/simple;
	bh=lJ/COlLocBhWR8/l7kysvDnBZUqClcnO1lkk2qm/vS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZdfxOFz/LcUaismiZvAEXv2FIykt6KlNlgPOBdsaIYSyb88igqiw8s1xtkYt/rDmlhq9TJzvcKZMA9yVVKApapWGzmvquZSBMqyRky/niHPY9vQ1cTPFehjbbMcGwGwBNmgFdvrYmSn/V69WXJ0Z+HBAx54zxMsBOJfQHxQ+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=E0q0ZyWA; arc=none smtp.client-ip=47.90.199.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="E0q0ZyWA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749449414; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=oADAYTc5JVpZjMlpqCH2kSIiqG6Xq9PQGyijVjW42Gw=;
	b=E0q0ZyWAAd64KQcbJeiuRASniI7TdXD0cqMYQs0pb742+MBYHP4bE5W9l1f1BtwJaSYd9bAvru7QvxbrCZDersxYUzrrYmuGJTUfs8XQgPS5EuBdQoywcM/euYGGQDBVuyczBVYOgwWFeuyU4gI8Jowm6Xjye9az5XV32Mnes1k=
Received: from 30.74.144.144(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdL9ZvM_1749449413 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Jun 2025 14:10:13 +0800
Message-ID: <a30660e1-f366-4b0c-846e-986067931c7c@linux.alibaba.com>
Date: Mon, 9 Jun 2025 14:10:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <998a069c-9be5-4a10-888c-ba8269eaa333@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <998a069c-9be5-4a10-888c-ba8269eaa333@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/7 19:55, Lorenzo Stoakes wrote:
> Not related to your patch at all, but man this whole thing (thp allowed orders)
> needs significant improvement, it seems always perversely complicated for a
> relatively simple operation.
> 
> Overall I LOVE what you're doing here, but I feel we can clarify things a
> little while we're at it to make it clear exactly what we're doing.
> 
> This is a very important change so forgive my fiddling about here but I'm
> hoping we can take the opportunity to make things a little simpler!
> 
> On Thu, Jun 05, 2025 at 04:00:58PM +0800, Baolin Wang wrote:
>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
>> means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
>> will still attempt to collapse into a Anon THP. This violates the rule we have
>> agreed upon: never means never.
>>
>> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> 
> I'm generally not sure it's worth talking only about MADV_COLLAPSE here when
> you're changing what THP is permitted across the board, I may have missed some
> discussion and forgive me if so, but what is special about MADV_COLLAPSE's use
> of thp_vma_allowable_orders() that makes it ignore 'never's moreso than other
> users?

We found that MADV_COLLAPSE ignores the THP configuration, meaning that 
even when THP is set to 'never', MADV_COLLAPSE can still collapse into 
THPs (and mTHPs in the future). This is because when MADV_COLLAPSE calls 
thp_vma_allowable_orders(), it does not set the TVA_ENFORCE_SYSFS flag, 
which means it ignores the system-wide Anon THP sysfs settings.

So this patch set is aimed to fix the THP policy for MADV_COLLAPSE.

>> To address this issue, should check whether the Anon THP configuration is disabled
>> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is set.
>>
>> In summary, the current strategy is:
>>
>> 1. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == false
>> (global THP settings are not enabled), it means mTHP of that orders are prohibited
>> from being used, then madvise_collapse() is forbidden for that orders.
>>
>> 2. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == true
>> (global THP settings are enabled), and inherit & orders == 0, it means mTHP of that
>> orders are still prohibited from being used, thus madvise_collapse() is not allowed
>> for that orders.
> 
> OK so it's already confusing that the global settings only impact 'inherit'
> settings below, so they're not really global at all, but rather perhaps should
> be called 'inherited'.
> 
> Maybe I need to submit a patch to rename thp_inherited_enabled(), or perhaps
> that'd just add to the confusion :P
> 
> OK this is also not your fault just general commentary.
> 
> Anyway, I feel points 1 and 2 can more succinctly be summed up as below,
> also there's no need to refer to the code, it's actually clearer I think to
> refer to the underlying logic:
> 
> 	If no hugepage modes are enabled for the desired orders, nor can we
> 	enable them by inheriting from a 'global' enabled setting - then it
> 	must be the case that all desired orders either specify or inherit
> 	'NEVER' - and we must abort.

OK. Thanks for helping me make it simpler:)

>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   include/linux/huge_mm.h | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..199ddc9f04a1 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>>   				       unsigned long orders)
>>   {
>>   	/* Optimization to check if required orders are enabled early. */
>> -	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>> -		unsigned long mask = READ_ONCE(huge_anon_orders_always);
>> +	if (vma_is_anonymous(vma)) {
>> +		unsigned long always = READ_ONCE(huge_anon_orders_always);
>> +		unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>> +		unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>> +		unsigned long mask = always | madvise;
>> +
>> +		/*
>> +		 * If the system-wide THP/mTHP sysfs settings are disabled,
>> +		 * then we should never allow hugepages.
>> +		 */
>> +		if (!(mask & orders) && !(hugepage_global_enabled() && (inherit & orders)))
>> +			return 0;
>> +
>> +		if (!(tva_flags & TVA_ENFORCE_SYSFS))
>> +			goto skip;
>>
>> +		mask = always;
>>   		if (vm_flags & VM_HUGEPAGE)
>> -			mask |= READ_ONCE(huge_anon_orders_madvise);
>> +			mask |= madvise;
>>   		if (hugepage_global_always() ||
>>   		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
>> -			mask |= READ_ONCE(huge_anon_orders_inherit);
>> +			mask |= inherit;
>>
>>   		orders &= mask;
>>   		if (!orders)
>>   			return 0;
>>   	}
>>
>> +skip:
>>   	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
>>   }
> 
> I feel this is compressing a lot of logic in a way that took me several
> readings to understand (hey I might not be the smartest cookie in the jar,
> but we need to account for all levels of kernel developer ;)
> 
> I feel like we can make things a lot clearer here by separating out with a
> helper function (means we can drop some indentation too), and also take
> advantage of the fact that, if orders == 0, __thp_vma_allowable_orders()
> exits with 0 early so no need for us to do so ourselves:

Sure. Looks good to me. Thanks.

> /* Strictly mask requested anonymous orders according to sysfs settings. */
> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> 		unsigned long tva_flags, unsigned long orders)
> {
> 	unsigned long always = READ_ONCE(huge_anon_orders_always);
> 	unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> 	unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> 	bool inherit_enabled = hugepage_global_enabled();
> 	bool has_madvise =  vm_flags & VM_HUGEPAGE;
> 	unsigned long mask = always | madvise;
> 
> 	mask = always | madvise;
> 	if (inherit_enabled)
> 		mask |= inherit;
> 
> 	/* All set to/inherit NEVER - never means never globally, abort. */
> 	if (!(mask & orders))
> 		return 0;
> 
> 	/* Otherwise, we only enforce sysfs settings if asked. */
> 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> 		return orders;
> 
> 	mask = always;
> 	if (has_madvise)
> 		mask |= madvise;
> 	if (hugepage_global_always() || (has_madvise && inherit_enabled))
> 		mask |= inherit;
> 
> 	return orders & mask;
> }
> 
> ...
> 
> static inline
> unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
> 				       unsigned long vm_flags,
> 				       unsigned long tva_flags,
> 				       unsigned long orders)
> {
> 	if (vma_is_anonymous(vma))
> 		orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
> 
> 	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
> }


