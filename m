Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32023741
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729528; cv=none; b=FnBfQ5YoeiwNdtmseE4B/0zPg7b7h3M1VyJZ5Yisft4lAhEib324xWfzoTijnJhZ+uVdtGSZFU78QcS6qUkNNPzR+hUI1vaHUKNIfl+OsizaQjM4CCcZpnK/GhitCuxHicbF+vLV5PJu1WykX39goPBfWa1p2dKp6o8IZjXTh+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729528; c=relaxed/simple;
	bh=V8p6Ile1Qslw6+bYmsCHL1aeo8AA1boIDjX+5aOst8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V64EAbjV1HhqL02gynm8fs5wYKhfXl2rKl6LuPcon8Sq1cs8F3jQxWmN1T5pUWq+jJajwZQSeiwk5kXyZDmUoEdXlD+0iou1pzQnJ6/NAwL/6/n4uS5QeMqcvKfGt3o3kTzC9BtEA3ug9O0KpYr45f2qwTd7jY++d9XwGoAoplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VnEU7Ojg; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VnEU7Ojg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750729523; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=RSCsckg9B5BzyioYNc3r3odeKoGUQhJwGtt4Gh8aEqw=;
	b=VnEU7Ojg74/TxtfUw0l598MwA7P+GDanfTIU52t6woA3e8oysB7DHOSn98ol9ywHSsU/oADPym6v3tbssWt/Pa3yODdlrQg7O6p9MuLGPxhELnX9ULtN+yu8SahcMm8oAJT5kB7sq5lFfoTq9PHLjC70zod38x1sXeJphmVTA5Y=
Received: from 30.74.144.102(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeeLADL_1750729522 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 09:45:23 +0800
Message-ID: <1431ef64-ed73-4a47-884f-5a803ce25e28@linux.alibaba.com>
Date: Tue, 24 Jun 2025 09:45:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
 <17180060-91a4-4957-a6aa-8e8adaf50ae8@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <17180060-91a4-4957-a6aa-8e8adaf50ae8@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/23 18:26, Lorenzo Stoakes wrote:
> On Mon, Jun 23, 2025 at 04:28:08PM +0800, Baolin Wang wrote:
>> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag is not
>> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
>> callers who do not specify this flag, it creates a odd and surprising situation
>> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
>> being allocated and used on the system.
>>
>> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will ignore
>> the system-wide Anon THP sysfs settings, which means that even though we have
>> disabled the Anon THP configuration, MADV_COLLAPSE will still attempt to collapse
>> into a Anon THP. This violates the rule we have agreed upon: never means never.
>>
>> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is only
>> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
>> collapse_pte_mapped_thp() function, but I believe this is reasonable from its
>> comments:
>>
>> "
>> /*
>>   * If we are here, we've succeeded in replacing all the native pages
>>   * in the page cache with a single hugepage. If a mm were to fault-in
>>   * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
>>   * and map it by a PMD, regardless of sysfs THP settings. As such, let's
>>   * analogously elide sysfs THP settings here.
>>   */
>> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
>> "
>>
>> Another rule for madvise, referring to David's suggestion: “allowing for
>> collapsing in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>
>> To address this issue, the current strategy should be:
>>
>> If no hugepage modes are enabled for the desired orders, nor can we enable them
>> by inheriting from a 'global' enabled setting - then it must be the case that
>> all desired orders either specify or inherit 'NEVER' - and we must abort.
>>
>> Meanwhile, we should fix the khugepaged selftest for MADV_COLLAPSE by enabling
>> THP.
> 
> Thanks! Sounds good.
>>
>> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Appreciate it though I'm not so bothered about attribution :) but just to say,
> of course the 'never' stuff is David's idea (and a good one!) :)

Yes, I should also add:

Suggested-by: David Hildenbrand <david@redhat.com>

>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks.

