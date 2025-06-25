Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484FE1EF0B9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750832794; cv=none; b=a/BCYCQc7dXRQVPxL5A0g15sbuM/H0kdtB1BOyZBpl5MdujKfTsTXMowvE5SAnY7Q8IR059JqsdxB61KNsCZwZQx8UQ9KA8/mw0Esh5cRqYvalxdpBuq6XRUnPHT41diLzwE/7hXhW1ozQM7ujmyqGosInx+7TDROiQGvCFy7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750832794; c=relaxed/simple;
	bh=BI1HaodxCq3kprUQUXR9UBMnGMac138rMkodMcp6f4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NU9+FPG67sYvnhZUzIYd4EDA8yDgujca+bZ7xF0DtDU7+BYkdkWdX+lgK/fprAWOPQsPyZPZlH+/jIy1vf72Wij5Frn2F53OZlhSKxuMEusl3sm5SDEogA1MSQicH7yat8F5LjJHscf9IdtVPD9sdypEK1cRRiZaLGTha3QhVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qeSCml2t; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qeSCml2t"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750832788; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/x/IypZhaD2LEMN4KW3KUfldxpdTKPN44bIQTVmKbjk=;
	b=qeSCml2tKTaz+LyE/pWcpAId2bnkeV6brBghBfiuzpP+a9av6PFMlW7gBO45RSmtN7by+qUQMdY4e0C77V/n+FTrckBgvBhpRiuc2pCCZ90PUj1BiNwtgDp5beCPa02175G6tjaP0B0hyg2/vBgVsydjzFS+ylVaU9z6VGkpceE=
Received: from 30.74.144.110(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeuHXyE_1750832786 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 14:26:27 +0800
Message-ID: <cc4da391-7c90-435c-ae39-30de37535c05@linux.alibaba.com>
Date: Wed, 25 Jun 2025 14:26:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Hugh Dickins <hughd@google.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/25 13:53, Hugh Dickins wrote:
> On Wed, 25 Jun 2025, Baolin Wang wrote:
> 
>> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS flag is not
>> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
>> callers who do not specify this flag, it creates a odd and surprising situation
>> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
>> being allocated and used on the system. And the MADV_COLLAPSE is an example of
>> such a case, that means it will not set TVA_ENFORCE_SYSFS when calling
>> thp_vma_allowable_orders().
>>
>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
>> the system-wide anon/shmem THP sysfs settings, which means that even though
>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
>> attempt to collapse into a anon/shmem THP. This violates the rule we have
>> agreed upon: never means never.
>>
>> For example, system administrators who disabled THP everywhere must indeed very
>> much not want THP to be used for whatever reason - having individual programs
>> being able to quietly override this is very surprising and likely to cause headaches
>> for those who desire this not to happen on their systems.
>>
>> This patch set will address the MADV_COLLAPSE issue.
>>
>> Test
>> ====
>> 1. Tested the mm selftests and found no regressions.
>> 2. With toggling different Anon mTHP settings, the allocation and madvise collapse for
>> anonymous pages work well.
>> 3. With toggling different shmem mTHP settings, the allocation and madvise collapse for
>> shmem work well.
>> 4. Tested the large order allocation for tmpfs, and works as expected.
>>
>> [1] https://lore.kernel.org/all/1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/
>>
>> Changes from v3:
>>   - Collect reviewed tags. Thanks.
>>   - Update the commit message, per David.
>>
>> Changes from v2:
>>   - Update the commit message and cover letter, per Lorenzo. Thanks.
>>   - Simplify the logic in thp_vma_allowable_orders(), per Lorenzo and David. Thanks.
>>
>> Changes from v1:
>>   - Update the commit message, per Zi.
>>   - Add Zi's reviewed tag. Thanks.
>>   - Update the shmem logic.
>>
>> Baolin Wang (2):
>>    mm: huge_memory: disallow hugepages if the system-wide THP sysfs
>>      settings are disabled
>>    mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
>>      settings are disabled
>>
>>   include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
>>   mm/shmem.c                              |  6 +--
>>   tools/testing/selftests/mm/khugepaged.c |  8 +---
>>   3 files changed, 43 insertions(+), 22 deletions(-)
>>
>> -- 
>> 2.43.5
> 
> Sorry for chiming in so late, after so much effort: but I beg you,
> please drop these.

Thanks Hugh for your input. (yes, we put in a lot of effort on 
discussion and testing:( ).

> I did not want to get into a fight, and had been hoping a voice of
> reason would come from others, before I got around to responding.
> 
> And indeed Ryan understood correctly at the start; and he, Usama
> and Barry, perhaps others I've missed, have raised appropriate
> concerns but not prevailed.
> 
> If we're sloganeering, I much prefer "never break userspace" to
> "never means never", attractive though that over-simplification is.

Yes, agree. we should not break userspace, however, I suspect whether 
this can really break userspace. We can set 
'/sys/kernel/mm/transparent_hugepage/enabled' to 'madvise' to allow 
MADV_COLLAPSE. Additionally, I really doubt that when the system-wide 
THP settings are set to 'never', userspace would still expect to 
collapse into THP using MADV_COLLAPSE.

Moreover, what makes this issue particularly frustrating is that when we 
introduce mTHP collapse[1], MADV_COLLAPSE complicates matters further. 
That is, when the system only enables 64K mTHP, MADV_COLLAPSE still 
allows collapsing into PMD-sized THP. This really breaks the user's 
settings.

[1] https://lore.kernel.org/all/20250515032226.128900-1-npache@redhat.com/

> Seldom has a feature been so thorougly documented as MADV_COLLAPSE,
> in its 6.1 commits and in the "man 2 madvise" page: which are
> explicit about MADV_COLLAPSE providing a way to get THPs where the
> sysfs setting governing automatic behaviour does not insert them.
> 
> We would all prefer a less messy world of THP tunables.  I certainly
> find plenty to dislike there too; and wish that a less assertive name
> than "never" had been chosen originally for the default off position.
> 
> But please don't break the accepted and documented behaviour of
> MADV_COLLAPSE now.
> 
> If you want to exclude all possibility of THPs, then please use the
> prctl(PR_SET_THP_DISABLE); or shmem_enabled=deny (I think it was me
> who insisted that be respected by MADV_COLLAPSE back then).

Yes, that will prevent MADV_COLLAPSE.

> Add a "deny" option to /sys/kernel/mm/transparent_hugepage/enabled
> if you like.  (But in these days of filesystem large folios, adding
> new protections against them seems a few years late.)
> 
> If Andrew decides that these patches should go in, then I'll have to
> scrutinize them more carefully than I've done so far: but currently
> I'm hoping to avoid that.
> 
> Hugh

