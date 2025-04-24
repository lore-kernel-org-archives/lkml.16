Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD258EAC7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455211; cv=none; b=DEYbSb2xVHrs6kW6FmhwcAdyzHRRWhQ6YblIMU8f/J+B5H2epYQ3sK9YI54niX5YjiE0lTLhvVQPJ3RqPS+kYbngu17FCpRCuOfAPo5T2w444vCosJRCwQorN6A4vB087wKEt5PXobF0cRcwuQlYQ+mKT6KbqdLvZLEF8dQ8ce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455211; c=relaxed/simple;
	bh=P51+61IEnWpk94PRBOIZ17uTmJWZlFjCa1kKs2BeqrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQ+JC00drx4021k4AjSCTNPf61XhHicwdIOLU1Zwzu7mwCsHwkDcLOsAIzC0Yo4/Xq+1w63sOkh56h8FBEnyCK6E6TFxlvPTc6gi56uqRfdwrDPoHaZavM9PRH6luriClNa9dyYVLrBKKPrBbYpDUDWnOakK7JbEXokgIJPQSFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZzjYCUte; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZzjYCUte"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745455198; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KrasVHKeX0M1f6t3pOw5wX2ePphli8GZb/0iP/2r4iI=;
	b=ZzjYCUteoVVUEbFTCBCfCqdI5k6kjouH6WEDqLGdXV5LxJTN95Rssmq8ZMg9BQFoz14iGhKi9JZN7F4sdOApZwJLccu8wwPscI4V6kS9ZdhdJ2JEopIdDHXjOyZ8M1kASsklhXV9FUxcZROP3r1kUxwsQAwy4Jq6j09A+8MmQY4=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WXw3bPW_1745455197 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Apr 2025 08:39:58 +0800
Message-ID: <bcf043d2-e96b-4f8d-b83b-de2b5ad4657e@linux.alibaba.com>
Date: Thu, 24 Apr 2025 08:39:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] erofs-utils: Add --meta_fix and --meta_only
 format options
To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org, chao@kernel.org,
 huyue2@coolpad.com, jefflexu@linux.alibaba.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250422123612.261764-1-lihongbo22@huawei.com>
 <2408568f-a9e6-4e32-83b2-e79aee83a55a@linux.alibaba.com>
 <406b4b4e-1a1e-4618-87b8-7b104838770f@huawei.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <406b4b4e-1a1e-4618-87b8-7b104838770f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/22 22:37, Hongbo Li wrote:
> 
> 
> On 2025/4/22 21:50, Gao Xiang wrote:
>> Hi Hongbo,
>>
>> On 2025/4/22 20:36, Hongbo Li wrote:
>>> In this patchset, we have added two formatting options --meta_fix and
>>> --meta_only to extend the ability of EROFS. In the case of using OBS,
>>> we can convert the directory tree structure from OBS into the erofs
>>> image and implement on-demand loading logic based on this. Since OBS
>>> objects are often large, we need to separate the metadata area from
>>> the data area, which is the reason we introduce the --meta_fix option.
>>> To accelerate the formatting process, we can skip the formatting of
>>> the raw data by adding --meta_only option.
>>
>> Thanks for the patches!
>>
>> I wonder if it's possible to reuse blobchunk.c codebase for
>> such usage in the short term.
>>
> Our initial plan was to reuse the blobchunk.c logic, but we found that the chunk-based layout has some minor issues when handling contiguous blocks—it would result in multiple elements in the chunk index array (whereas blobraw expects only oversized chunks).

Sorry for late reply.

It seems blobchunk bugs? Could you submit fixes for this?

Thanks,
Gao Xiang
