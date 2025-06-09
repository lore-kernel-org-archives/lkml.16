Received: from out199-1.us.a.mail.aliyun.com (out199-1.us.a.mail.aliyun.com [47.90.199.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12F610D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749450835; cv=none; b=i4dIai3R0czdFGQO9I65Seu1FAgDKxCCeceboLi+jdem85nHRIiOgXy+G89PR6xUupX+6IR6hSfFnGvg0c+JwdVGg+GZ0d0mz9YLVlozccqO0slBUn4NLQ6xDoljwdF61Zez419zGOKi63lpmKlhb0RDYwfysBLfIHVn8/pKSKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749450835; c=relaxed/simple;
	bh=95XhVdvdvwfnK3Q3EIhyop4BB3CMyZHeuS3pt+zfn2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3kgyGcdDtc6AbW1YkguBOUcu7n0YfTyDrxUh5tg/vAuT0CfdLRDo1QDhjNvHZc77t8p2BHZGraYRFwMlX2DWCr3hcxOHDPE0tiJ09P8vEHk0tx+4PnbUKOD+CwnvzqDUmg4Waq2NGA8OywoiQ3/LjcetBiPU+MFMca5noNucMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=dQq1rv2z; arc=none smtp.client-ip=47.90.199.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="dQq1rv2z"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749450820; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=zQzeG0vNP0zhacH+0iF/2q6/uDdbQXYDFVGJBkyJQos=;
	b=dQq1rv2zXCYm+z9c5PSjvCqQARmSlA0lBh4oko8743GUCZCORER9+0s9vrIYAA2GQDJeTuhTGFIO/WgQnTulGFGcpG/EQ+Tf3mxmAkKFOjs9TwTO6pRdjAcItwAbXHkgmPr3QBpmWpIx5QeppDjIglEgknaNB2qYUjWrcP2lSnM=
Received: from 30.74.144.144(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdLPzMy_1749449887 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Jun 2025 14:18:08 +0800
Message-ID: <43872045-518a-4690-acf2-a0eb4362ca1c@linux.alibaba.com>
Date: Mon, 9 Jun 2025 14:18:07 +0800
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
 <381ca19f-4b62-41b8-9883-f233b50d6521@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <381ca19f-4b62-41b8-9883-f233b50d6521@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/7 20:21, Lorenzo Stoakes wrote:
> A couple follow up points that occurred to me:
> 
> On Sat, Jun 07, 2025 at 12:55:19PM +0100, Lorenzo Stoakes wrote:
>> Not related to your patch at all, but man this whole thing (thp allowed orders)
>> needs significant improvement, it seems always perversely complicated for a
>> relatively simple operation.
>>
>> Overall I LOVE what you're doing here, but I feel we can clarify things a
>> little while we're at it to make it clear exactly what we're doing.
>>
>> This is a very important change so forgive my fiddling about here but I'm
>> hoping we can take the opportunity to make things a little simpler!
>>
>> On Thu, Jun 05, 2025 at 04:00:58PM +0800, Baolin Wang wrote:
>>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
>>> means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
>>> will still attempt to collapse into a Anon THP. This violates the rule we have
>>> agreed upon: never means never.
>>>
>>> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>
>> I'm generally not sure it's worth talking only about MADV_COLLAPSE here when
>> you're changing what THP is permitted across the board, I may have missed some
>> discussion and forgive me if so, but what is special about MADV_COLLAPSE's use
>> of thp_vma_allowable_orders() that makes it ignore 'never's moreso than other
>> users?
> 
> I'd mention that MADV_COLLAPSE is special because of not specifying
> TVA_ENFORCE_SYSFS but you are making this change across the board for all
> callers who do not specify this.

Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is 
only one other instance where TVA_ENFORCE_SYSFS is not set, which is in 
the collapse_pte_mapped_thp() function, but I believe this is reasonable 
from the comments:

         /*
          * If we are here, we've succeeded in replacing all the native 
pages
          * in the page cache with a single hugepage. If a mm were to 
fault-in
          * this memory (mapped by a suitably aligned VMA), we'd get the 
hugepage
          * and map it by a PMD, regardless of sysfs THP settings. As 
such, let's
          * analogously elide sysfs THP settings here.
          */
         if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
                 return SCAN_VMA_CHECK;

> 
> I'd also CLEARLY mention that you handle David's request re: madvise by
> restricting yourself to checking only for NEVER and retaining the existing logic
> of not enforcing sysfs settings when TVA_ENFORCE_SYSFS, which includes not
> checking the VMA for VM_HUGEPAGE if the madvise mode is enabled.

Sure.

> 
> (i.e. addressing David's request).
> 
> [snip]
> 
>> I feel this is compressing a lot of logic in a way that took me several
>> readings to understand (hey I might not be the smartest cookie in the jar,
>> but we need to account for all levels of kernel developer ;)
>>
>> I feel like we can make things a lot clearer here by separating out with a
>> helper function (means we can drop some indentation too), and also take
>> advantage of the fact that, if orders == 0, __thp_vma_allowable_orders()
>> exits with 0 early so no need for us to do so ourselves:
>>
>> /* Strictly mask requested anonymous orders according to sysfs settings. */
>> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>> 		unsigned long tva_flags, unsigned long orders)
>> {
>> 	unsigned long always = READ_ONCE(huge_anon_orders_always);
>> 	unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>> 	unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
>> 	bool inherit_enabled = hugepage_global_enabled();
>> 	bool has_madvise =  vm_flags & VM_HUGEPAGE;
>> 	unsigned long mask = always | madvise;
>>
>> 	mask = always | madvise;
>> 	if (inherit_enabled)
>> 		mask |= inherit;
>>
>> 	/* All set to/inherit NEVER - never means never globally, abort. */
>> 	if (!(mask & orders))
>> 		return 0;
>>
>> 	/* Otherwise, we only enforce sysfs settings if asked. */
> 
> Perhaps worth adding a comment here noting that, if the user sets a sysfs mode
> of madvise and if TVA_ENFORCE_SYSFS is not set, we don't bother checking whether
> the VMA has VM_HUGEPAGE set.

Sure, will do. Thanks for reviewing.
