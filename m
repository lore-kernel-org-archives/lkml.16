Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4124C1F4C8B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834527; cv=none; b=ruv2SrSV3SNpU3iWGflVTvahv6Se6nM67u3DAcRBY8HqDHhmgKSRe1In/lbrZEhxN8cCDlyReAr6lgSDladSuqzVa1+emznBj7qfwmwmL2dzmZWWdj80NqhLphNSaELs+xKKSSCKsJcfmrpDdEP/2zqHMMpbflfxcHggpWw4ejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834527; c=relaxed/simple;
	bh=amZf818+yoKxR3J26wICy6X6Lvj/7tZrC7kkRNAFoWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGEsXfFSVyrbTWlpJYEUlLpp38Bx79XCh3u4qjJBQgj6cVMNWWtltzXfga8cF+OYz2Shrj5vPl5uuz5ZY5tdT2f4ZdPaSvopaLPcaAjhRoCsl32RwtPSBN11hkz2rbsVYRGwjuH8Uut/7yMoUuSAq9g7J9DAusqifIM5qK4I9No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yWYXYLnw; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yWYXYLnw"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750834521; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=CSs7NkcJykzWd9X/4bqzO39746qhrI0qvK17CnhNWlg=;
	b=yWYXYLnwjlBuZj3Hq6JIP5vGA38WzAO23Dhg2ZYIH3flyNhsrdWwyU11AB8fl5dYAEq3EeUAiXyKGRExJ2WnSmCdqolrxDc8BrwsY3Ucykgz0MYreOIwXUbBXOH1COYW6wgbOU4inMLRtjVokxqc4ciIRVIxB3X4lZvvXNuGDWg=
Received: from 30.74.144.110(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wetv5oA_1750834519 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 14:55:20 +0800
Message-ID: <0f3b8f9f-a105-4cf9-a0df-bcca66f88c9b@linux.alibaba.com>
Date: Wed, 25 Jun 2025 14:55:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, zokeefe@google.com,
 shy828301@gmail.com, usamaarif642@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <cc4da391-7c90-435c-ae39-30de37535c05@linux.alibaba.com>
 <88901329-08a0-49b1-b2be-c00d157cb901@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <88901329-08a0-49b1-b2be-c00d157cb901@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/25 14:49, Dev Jain wrote:
> 
> On 25/06/25 11:56 am, Baolin Wang wrote:
>>
>>
>> On 2025/6/25 13:53, Hugh Dickins wrote:
>>> On Wed, 25 Jun 2025, Baolin Wang wrote:
>>>
>>>> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS 
>>>> flag is not
>>>> specified, we will ignore the THP sysfs settings. Whilst it makes 
>>>> sense for the
>>>> callers who do not specify this flag, it creates a odd and 
>>>> surprising situation
>>>> where a sysadmin specifying 'never' for all THP sizes still 
>>>> observing THP pages
>>>> being allocated and used on the system. And the MADV_COLLAPSE is an 
>>>> example of
>>>> such a case, that means it will not set TVA_ENFORCE_SYSFS when calling
>>>> thp_vma_allowable_orders().
>>>>
>>>> As we discussed in the previous thread [1], the MADV_COLLAPSE will 
>>>> ignore
>>>> the system-wide anon/shmem THP sysfs settings, which means that even 
>>>> though
>>>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE 
>>>> will still
>>>> attempt to collapse into a anon/shmem THP. This violates the rule we 
>>>> have
>>>> agreed upon: never means never.
>>>>
>>>> For example, system administrators who disabled THP everywhere must 
>>>> indeed very
>>>> much not want THP to be used for whatever reason - having individual 
>>>> programs
>>>> being able to quietly override this is very surprising and likely to 
>>>> cause headaches
>>>> for those who desire this not to happen on their systems.
>>>>
>>>> This patch set will address the MADV_COLLAPSE issue.
>>>>
>>>> Test
>>>> ====
>>>> 1. Tested the mm selftests and found no regressions.
>>>> 2. With toggling different Anon mTHP settings, the allocation and 
>>>> madvise collapse for
>>>> anonymous pages work well.
>>>> 3. With toggling different shmem mTHP settings, the allocation and 
>>>> madvise collapse for
>>>> shmem work well.
>>>> 4. Tested the large order allocation for tmpfs, and works as expected.
>>>>
>>>> [1] https://lore.kernel.org/all/1f00fdc3- 
>>>> a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/
>>>>
>>>> Changes from v3:
>>>>   - Collect reviewed tags. Thanks.
>>>>   - Update the commit message, per David.
>>>>
>>>> Changes from v2:
>>>>   - Update the commit message and cover letter, per Lorenzo. Thanks.
>>>>   - Simplify the logic in thp_vma_allowable_orders(), per Lorenzo 
>>>> and David. Thanks.
>>>>
>>>> Changes from v1:
>>>>   - Update the commit message, per Zi.
>>>>   - Add Zi's reviewed tag. Thanks.
>>>>   - Update the shmem logic.
>>>>
>>>> Baolin Wang (2):
>>>>    mm: huge_memory: disallow hugepages if the system-wide THP sysfs
>>>>      settings are disabled
>>>>    mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
>>>>      settings are disabled
>>>>
>>>>   include/linux/huge_mm.h                 | 51 +++++++++++++++++ 
>>>> +-------
>>>>   mm/shmem.c                              |  6 +--
>>>>   tools/testing/selftests/mm/khugepaged.c |  8 +---
>>>>   3 files changed, 43 insertions(+), 22 deletions(-)
>>>>
>>>> -- 
>>>> 2.43.5
>>>
>>> Sorry for chiming in so late, after so much effort: but I beg you,
>>> please drop these.
>>
>> Thanks Hugh for your input. (yes, we put in a lot of effort on 
>> discussion and testing:( ).
>>
>>> I did not want to get into a fight, and had been hoping a voice of
>>> reason would come from others, before I got around to responding.
>>>
>>> And indeed Ryan understood correctly at the start; and he, Usama
>>> and Barry, perhaps others I've missed, have raised appropriate
>>> concerns but not prevailed.
>>>
>>> If we're sloganeering, I much prefer "never break userspace" to
>>> "never means never", attractive though that over-simplification is.
>>
>> Yes, agree. we should not break userspace, however, I suspect whether 
>> this can really break userspace. We can set '/sys/kernel/mm/ 
>> transparent_hugepage/enabled' to 'madvise' to allow MADV_COLLAPSE. 
>> Additionally, I really doubt that when the system-wide THP settings 
>> are set to 'never', userspace would still expect to collapse into THP 
>> using MADV_COLLAPSE.
> 
> After this patch, will a user still be able to use MADV_COLLAPSE and 
> ensure no interference from khugepaged?

I think so. Becuase khugepaged will still check VM_HUGEPAGE if we set 
'/sys/kernel/mm/transparent_hugepage/enabled' to 'madvise'.

>> Moreover, what makes this issue particularly frustrating is that when 
>> we introduce mTHP collapse[1], MADV_COLLAPSE complicates matters 
>> further. That is, when the system only enables 64K mTHP, MADV_COLLAPSE 
>> still allows collapsing into PMD-sized THP. This really breaks the 
>> user's settings.
> 
> This issue will still be there without this patch right?

NO. Will fix this issue. After this patch, MADV_COLLAPSE can not 
continue to collapse PMD-sized THP if the system only enables 64K mTHP.

>> [1] https://lore.kernel.org/all/20250515032226.128900-1- 
>> npache@redhat.com/
>>
>>> Seldom has a feature been so thorougly documented as MADV_COLLAPSE,
>>> in its 6.1 commits and in the "man 2 madvise" page: which are
>>> explicit about MADV_COLLAPSE providing a way to get THPs where the
>>> sysfs setting governing automatic behaviour does not insert them.
>>>
>>> We would all prefer a less messy world of THP tunables.  I certainly
>>> find plenty to dislike there too; and wish that a less assertive name
>>> than "never" had been chosen originally for the default off position.
>>>
>>> But please don't break the accepted and documented behaviour of
>>> MADV_COLLAPSE now.
>>>
>>> If you want to exclude all possibility of THPs, then please use the
>>> prctl(PR_SET_THP_DISABLE); or shmem_enabled=deny (I think it was me
>>> who insisted that be respected by MADV_COLLAPSE back then).
>>
>> Yes, that will prevent MADV_COLLAPSE.
>>
>>> Add a "deny" option to /sys/kernel/mm/transparent_hugepage/enabled
>>> if you like.  (But in these days of filesystem large folios, adding
>>> new protections against them seems a few years late.)
>>>
>>> If Andrew decides that these patches should go in, then I'll have to
>>> scrutinize them more carefully than I've done so far: but currently
>>> I'm hoping to avoid that.
>>>
>>> Hugh
>>

