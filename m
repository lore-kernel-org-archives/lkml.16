Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2822D4CD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625163; cv=none; b=odDG4/965WTLS1rLW/Yd810j/yZSlgmNSYOxz/3c/+vc1yv1NO7pjwEN8Ej+MlDq2pvP1s5v/GzatlIxIVenwtbX+4bDnfsAslz3wyhrmVTD8qYGtU0mZJ7O6OzOdTEbCpt0Rvu4+zUVrTswYzRs4gN2TV2Md1H5ZmjSF6M//68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625163; c=relaxed/simple;
	bh=mdqznnnrJ7nD7GMxxVWzHlB3AVGxZZ1Xu4YQfC+rk44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLO9ckAcaSEB8oUNPRB7mBdyX7UDwIUyef+Vmq8GYGhx4gxR8oj+/cbpi8LszCH/LKZPw3YYLD5TlIuK8SFi6/ozpgbvDMmAAYjr8JLGFkt9bwVgdU1XjKg3UeEnZl/l5NJuxIe1jBBYsyPzpBNIKmMBgUnUy25iv1eUnpbYub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Utt/4rxj; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Utt/4rxj"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749625151; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gP5iwLJ/m7kR1tCrsX8gbkxg5lZ/MdYiEoUObTmykjg=;
	b=Utt/4rxju3tu4lgo0RwZ+H7f39GMPltLOIyr2yF8qg2UnXKe1FarkWjbb3tQdk54xdUWYZM80WiYR54+0CxaLGZeDj0+FFzLk6pTxzQAiosQ9Dm1PtNANoD2LMaeJGT6VyU2yHEClepxWKESnxHzMn2+ztNif9jBv9Rp3EZvLuA=
Received: from 30.74.144.128(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wdc8EnH_1749625149 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Jun 2025 14:59:10 +0800
Message-ID: <52024f6e-22e5-495d-ae15-683a50b2ac49@linux.alibaba.com>
Date: Wed, 11 Jun 2025 14:59:09 +0800
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
 <a30660e1-f366-4b0c-846e-986067931c7c@linux.alibaba.com>
 <cd357496-34f4-4d87-90f5-acfc55ca5995@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <cd357496-34f4-4d87-90f5-acfc55ca5995@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/9 23:17, Lorenzo Stoakes wrote:
> On Mon, Jun 09, 2025 at 02:10:12PM +0800, Baolin Wang wrote:
>>
>>
>> On 2025/6/7 19:55, Lorenzo Stoakes wrote:
>>> Not related to your patch at all, but man this whole thing (thp allowed orders)
>>> needs significant improvement, it seems always perversely complicated for a
>>> relatively simple operation.
>>>
>>> Overall I LOVE what you're doing here, but I feel we can clarify things a
>>> little while we're at it to make it clear exactly what we're doing.
>>>
>>> This is a very important change so forgive my fiddling about here but I'm
>>> hoping we can take the opportunity to make things a little simpler!
>>>
>>> On Thu, Jun 05, 2025 at 04:00:58PM +0800, Baolin Wang wrote:
>>>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
>>>> means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
>>>> will still attempt to collapse into a Anon THP. This violates the rule we have
>>>> agreed upon: never means never.
>>>>
>>>> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
>>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>>
>>> I'm generally not sure it's worth talking only about MADV_COLLAPSE here when
>>> you're changing what THP is permitted across the board, I may have missed some
>>> discussion and forgive me if so, but what is special about MADV_COLLAPSE's use
>>> of thp_vma_allowable_orders() that makes it ignore 'never's moreso than other
>>> users?
>>
>> We found that MADV_COLLAPSE ignores the THP configuration, meaning that even
>> when THP is set to 'never', MADV_COLLAPSE can still collapse into THPs (and
>> mTHPs in the future). This is because when MADV_COLLAPSE calls
>> thp_vma_allowable_orders(), it does not set the TVA_ENFORCE_SYSFS flag,
>> which means it ignores the system-wide Anon THP sysfs settings.
>>
>> So this patch set is aimed to fix the THP policy for MADV_COLLAPSE.
>>
> 
> Yeah of course, and this is exactly why, but what I mean is, the patch
> doesn't explicitly address MADV_COLLAPSE, it addresses a case that
> MADV_COLLAPSE uses (which is as you say the motivating cause for the
> change).
> 
> So I think the commit message should rather open something like:
> 
> 	If, when invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS
> 	flag is not specified, we ignore sysfs TLB settings.
> 
> 	Whilst it makes sense for the callers who do not specify this flag,
> 	it creates a odd and surprising situation where a sysadmin
> 	specifying 'never' for all THP sizes still observing THP pages
> 	being allocated and used on the system.
> 
> 	The motivating case for this is MADV_COLLAPSE, <blah blah blah> :)

OK. Will update the commit message. Thanks.
