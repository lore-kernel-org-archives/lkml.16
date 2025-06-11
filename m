Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B9221DAD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625549; cv=none; b=qAWiTJZFemuZB2RILNDpF7vEW/l6iDEkSjo8rOV2WbaKvfbq5bT3odUNYwq36WR4BjvhQVC/8v73zUuFxLYotvlTTkaxNSSPMuK/rvJ/bTvrscNStSFPEWrSVa8Ew11PNAMKVA4PiOzOTXVrvFXn4owP9TG8wdJ/NNS//58gQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625549; c=relaxed/simple;
	bh=itz0A4vdYkrzvvJW6LG4O9WHCPMJ35n5mXk5ixC9i6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSi4FKgUqWfqlZGnh0XqMsgx8rjnALs6juKwaUHTnJ5w610f5KPIcqSNHR6CLNAQF0A7HccEWsg8ttuOzv+SHeI4U6de7tmMIpy3Sc2wHZaG6rkns3l+19nhjOuDcsyBFLHZtTzMfaFhiU+Dc+jSA3XKEm7R0szuqvdT5FZYYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fI0uVAbs; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fI0uVAbs"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749625542; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=SYNuqTRQC6tKw1E6R0BOuzoQl4xKugq0JbOTF83k5qE=;
	b=fI0uVAbs1x2OH03E4H2Wa0InRUSuzktTO6Ctu47Y/7eUT2Mqh7qkPBhsts/zuGlwOy8xTu1WHemicDelU4fHzZrBWjzKG2HLHRCPppU4+aX1pH5QUaqN7pWg1g0Alf+y5vryZIGv93f+anjO77aiPbq7IfJfkclohqmq2gmqexU=
Received: from 30.74.144.128(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdcArs0_1749625540 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Jun 2025 15:05:41 +0800
Message-ID: <a23c547b-d775-4d8d-a34f-b9b0f200e7f3@linux.alibaba.com>
Date: Wed, 11 Jun 2025 15:05:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <2e30bffd-bda5-4f83-b88d-c51940651a49@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <2e30bffd-bda5-4f83-b88d-c51940651a49@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/7 20:28, Lorenzo Stoakes wrote:
> Before I get into technical criticism, to be clear - thank you very much
> for doing this :) I'm just getting into details as to the implementation,
> but am a fan of this change and consider it important.
> 
> On Thu, Jun 05, 2025 at 04:00:57PM +0800, Baolin Wang wrote:
>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
>> the system-wide anon/shmem THP sysfs settings, which means that even though
>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
>> attempt to collapse into a anon/shmem THP. This violates the rule we have
>> agreed upon: never means never. This patch set will address this issue.
> 
> Hm this cover letter could be expanded upon quite a bit - you are doing a
> lot here and it's not only MADV_COLLAPSE, more a general change.
> 
> I'd mention that, even when TVA_ENFORCE_SYSFS is not set, callers checking
> THP order validity will not be able to specify THP orders that are either
> specifically marked as 'never' or set to 'inherit' and the global hugepage
> mode is 'never'.
> 
> Then say something like 'importantly, this changes alters the madvise(...,
> MADV_COLLAPSE) call, which previously would collapse ranges into huge pages
> even if THP was set to never. This corrects this behaviour'.
> 
> I suspect you are unable to write sensible tests here given the need to
> manipulate sysfs (though perhaps worth quickly looking at
> tools/testing/selftests/mm/khugepaged.c, transhuge-stress.c, run_vmtests.sh
> to see), but it'd be at least useful for you to give details here of how
> you have tested this and ensured it functions correctly.
> 
> It might also be worth giving a quick justification, i.e. 'system
> administrators who disabled THP everywhere must indeed very much not want
> THP to be used for whatever reason - having individual programs being able
> to quietly override this is very surprising and likely to cause headaches
> for those who desire this not to happen on their systems'.
> 

Ah, missed this comment. Good suggestion, I will update the cover 
letter. Thanks.
