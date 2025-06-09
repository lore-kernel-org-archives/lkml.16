Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E5D610D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749448663; cv=none; b=pka5/ktTKIGRR2fhxmlUs93ittEGh6n9XTOLQ/DAqZDC9fnD1g/BpFhSm/7a7iyEtwR30XxxtsGF1LP10P4y87QTEtnU5hWCLiFR64ewYzzhWzf4FPPI3jbPNTDxsrT7pfWdZPztnQK1H1NOc9apHwS/TUX+Mdo8djC5mp1mDqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749448663; c=relaxed/simple;
	bh=ycZDmq0aIFy/XR5O2mUnLAQ2YyVSOuX3xYFimhgZtqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8AwssRxVqL4eFJHgOlTYohxLN6uH/S9xsFUhSm05gTLKNd+jTUM4v3L9u0u9PewGevNq05OLsST9/ZZrFqZkHxfc+7dZg0T08Qx03F4vucEDYA23FMDCpboXsX4qYvGGD/RySLc40lr+3QOHzfinQM4LJ0qykmxfsLsFhLS5wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qfaV1Tpz; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qfaV1Tpz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749448651; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=iOsOoK/tKgO9MrtR3hVJKvOyBQ0iS76GyRd+qTkk8tY=;
	b=qfaV1Tpz9KiBR80sRU9WuI13oKlg9arPCepCYoAmX1NUQLJe/6WWGHznAgRBWYq+k+eodihTTtyqxTY/g3LFWsotpevRHAyMoUiZIiGYbXVp4YH3ctpiCV+rn8kveBzN9P3uxq2gkpcB/DscTQIaDUp/CoC2zMZPu6i+aG/BVyA=
Received: from 30.74.144.144(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdL8LD-_1749448649 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Jun 2025 13:57:30 +0800
Message-ID: <f6a0b8eb-4e4a-4d37-b3c9-c9d147a7769b@linux.alibaba.com>
Date: Mon, 9 Jun 2025 13:57:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, hughd@google.com,
 david@redhat.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <c5ba98b8-a686-4a70-92e3-28d76ce05d1e@arm.com>
 <e4356d6f-ac7a-40dc-b89d-27031b490fa1@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <e4356d6f-ac7a-40dc-b89d-27031b490fa1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/7 02:47, Dev Jain wrote:
> 
> On 06/06/25 10:19 pm, Dev Jain wrote:
>>
>> On 05/06/25 1:30 pm, Baolin Wang wrote:
>>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs 
>>> settings, which
>>> means that even though we have disabled the Anon THP configuration, 
>>> MADV_COLLAPSE
>>> will still attempt to collapse into a Anon THP. This violates the 
>>> rule we have
>>> agreed upon: never means never.
>>>
>>> Another rule for madvise, referring to David's suggestion: “allowing 
>>> for collapsing
>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>>
>>> To address this issue, should check whether the Anon THP 
>>> configuration is disabled
>>> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag 
>>> is set.
>>
>> Did you mean to say "even when the TVA_ENFORCE_SYSFS flag is *not* 
>> set"? Because if
>> is set, then we have to check the anon THP sysfs config.

Sorry for the confusion. What I mean is that we should also check 
whether the Anon THP is disabled when the TVA_ENFORCE_SYSFS flag is set. 
Will update the commit message.

> Otherwise the patch itself looks good to me, so:
> 
> Reviewed-by: Dev Jain <dev.jain@arm.com>

Thanks for reviewing.
