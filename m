Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3723B28ECE2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774137; cv=none; b=o4AiIsC5kCg0fWk+lwgZtWv+UckjjWKmCg6N9PostTCs8ZFbMHXX4K052EY1lO9dnzrb3dP+s7if1b7baFPz6wWKBWFqJIkKWWSqJZ11O76GjChFrgLXsGjOoXgbbSyn6pnTTvptckfNzijWis2O2PA0KwfTE/KCILesssfVwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774137; c=relaxed/simple;
	bh=ZWssv0IXI0IXobo+UKoj2+5cxw7bT2DZZ8muTcsZ9mo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kxyMT3/xwqm/M9dhRlSiI9c1F2cCAj9zyJW1KAGXrSC7GkZeb3QqeGCKZc3fadwSlAAii8REcWNz9Ervl+C4zwJZ30aGvF544niyMgdZ3sJB1ibwznThiq2dGAM6JiwurtS8rm89I3nOwIvU/h5pAbmGUaxTx5uSZuzKjc2g07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rjX9wgVy; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rjX9wgVy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750774125; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=etMUb4iNHTlYD5dbMCiSgTbHRULmUItFOT5kzzE5wG8=;
	b=rjX9wgVyr1Buw1CEOb79xz/epmeb5ErRMfjO2HsLxliWFPcFHxpW9M/GjBKftbcfFVlXY4RzVqYU3kPHmhUOM+rDiuxcTD0KBAO0SNQ1Q40cZJ7xJ4iHWwdFN3sKtizRQCezFNytG3YcWRWZj8OAMMLbOO1BoNIlnDPB06SypTU=
Received: from 30.171.184.29(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeiLodu_1750774123 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 22:08:44 +0800
Message-ID: <6771bdca-b489-42f3-b2fe-5449879e8687@linux.alibaba.com>
Date: Tue, 24 Jun 2025 22:08:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, hughd@google.com,
 david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
 <8912e179-601a-4677-b2f6-14f40d488d98@arm.com>
 <e666835e-4c15-4f5a-bab1-f27e0c438f16@linux.alibaba.com>
In-Reply-To: <e666835e-4c15-4f5a-bab1-f27e0c438f16@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/24 17:57, Baolin Wang wrote:
> 
> 
> On 2025/6/24 16:41, Dev Jain wrote:
>>
>> On 23/06/25 1:58 pm, Baolin Wang wrote:
>>> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag 
>>> is not
>>> specified, we will ignore the THP sysfs settings. Whilst it makes 
>>> sense for the
>>> callers who do not specify this flag, it creates a odd and surprising 
>>> situation
>>> where a sysadmin specifying 'never' for all THP sizes still observing 
>>> THP pages
>>> being allocated and used on the system.
>>>
>>> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will 
>>> ignore
>>> the system-wide Anon THP sysfs settings, which means that even though 
>>> we have
>>> disabled the Anon THP configuration, MADV_COLLAPSE will still attempt 
>>> to collapse
>>> into a Anon THP. This violates the rule we have agreed upon: never 
>>> means never.
>>>
>>> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there 
>>> is only
>>> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
>>> collapse_pte_mapped_thp() function, but I believe this is reasonable 
>>> from its
>>> comments:
>>>
>>> "
>>> /*
>>>   * If we are here, we've succeeded in replacing all the native pages
>>>   * in the page cache with a single hugepage. If a mm were to fault-in
>>>   * this memory (mapped by a suitably aligned VMA), we'd get the 
>>> hugepage
>>>   * and map it by a PMD, regardless of sysfs THP settings. As such, 
>>> let's
>>>   * analogously elide sysfs THP settings here.
>>>   */
>>> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
>>
>> So the behaviour now is: First check whether THP settings converge to 
>> never.
>> Then, if enforce_sysfs is not set, return immediately. So in this 
>> khugepaged
>> code will it be better to call __thp_vma_allowable_orders()? If the sysfs
>> settings are changed to never before hitting collapse_pte_mapped_thp(),
>> then right now we will return SCAN_VMA_CHECK from here, whereas, the 
>> comment
>> says "regardless of sysfs THP settings", which should include "regardless
>> of whether the sysfs settings say never".
> 
> Sounds reasonable to me. Thanks.
> 
> I will change thp_vma_allowable_order() to __thp_vma_allowable_orders() 
> in the collapse_pte_mapped_thp() function to maintain consistency with 
> the original logic.
> 
> Lorenzo and David, how do you think? Thanks.

After thinking more, since collapse_pte_mapped_thp() is only used for 
file/shmem collapse, changing to __thp_vma_allowable_orders() has no 
effect. So I prefer to leave it as is.
