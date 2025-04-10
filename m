Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14784D599
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246273; cv=none; b=RHGBXYCEuiw4xjNP92qyJOQWSQgJ/qwzyzX+schxJ9IB748uiud2hRxNHBHQCop+ARBiTKgWQQV9WEpRLYaMmvxviYAZf68PZE7ocVNtnZOr5TmYphEc4NWru7WMl3K8l4NVZB7jOyIK2Wyn39CCRjwum6zbZWYglc39KwTECc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246273; c=relaxed/simple;
	bh=Zkc71LUpKNlepf+gAO+6rEEVPIJ8GgGDrObqmPLWnco=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ET44Wj7EvO6S1PM+t7cd5kIeXJhxs838RyQvrsuJo6S0bphQLFH8YKFBalTLmI2OPyzIEkkcAYlC/st2E7PMfIKOc4f8bdlQ1FI1VAIrkVO7MXpW+9MO3SGr/G5uubIfJPR7g/zEdOlcjVdqnpXac15yrzXfDTZeVe5DMXz+O94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZY1V63086z27hRG;
	Thu, 10 Apr 2025 08:51:42 +0800 (CST)
Received: from kwepemg100017.china.huawei.com (unknown [7.202.181.58])
	by mail.maildlp.com (Postfix) with ESMTPS id CD8A91400CB;
	Thu, 10 Apr 2025 08:51:01 +0800 (CST)
Received: from [10.174.178.114] (10.174.178.114) by
 kwepemg100017.china.huawei.com (7.202.181.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 10 Apr 2025 08:51:00 +0800
Message-ID: <ec379097-ab86-4bd0-8b6c-7611b3cf9194@huawei.com>
Date: Thu, 10 Apr 2025 08:51:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <mawupeng1@huawei.com>, <akpm@linux-foundation.org>,
	<mike.kravetz@oracle.com>, <david@redhat.com>, <muchun.song@linux.dev>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mm: hugetlb: Fix incorrect fallback for subpool
To: <joshua.hahnjy@gmail.com>
References: <20250409135843.2012726-1-joshua.hahnjy@gmail.com>
From: mawupeng <mawupeng1@huawei.com>
In-Reply-To: <20250409135843.2012726-1-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg100017.china.huawei.com (7.202.181.58)



On 2025/4/9 21:58, Joshua Hahn wrote:
> On Tue, 25 Mar 2025 14:16:34 +0800 Wupeng Ma <mawupeng1@huawei.com> wrote:
> 
>> During our testing with hugetlb subpool enabled, we observe that
>> hstate->resv_huge_pages may underflow into negative values. Root cause
>> analysis reveals a race condition in subpool reservation fallback handling
>> as follow:
>>
>> hugetlb_reserve_pages()
>>     /* Attempt subpool reservation */
>>     gbl_reserve = hugepage_subpool_get_pages(spool, chg);
>>
>>     /* Global reservation may fail after subpool allocation */
>>     if (hugetlb_acct_memory(h, gbl_reserve) < 0)
>>         goto out_put_pages;
>>
>> out_put_pages:
>>     /* This incorrectly restores reservation to subpool */
>>     hugepage_subpool_put_pages(spool, chg);
>>
>> When hugetlb_acct_memory() fails after subpool allocation, the current
>> implementation over-commits subpool reservations by returning the full
>> 'chg' value instead of the actual allocated 'gbl_reserve' amount. This
>> discrepancy propagates to global reservations during subsequent releases,
>> eventually causing resv_huge_pages underflow.
>>
>> This problem can be trigger easily with the following steps:
>> 1. reverse hugepage for hugeltb allocation
>> 2. mount hugetlbfs with min_size to enable hugetlb subpool
>> 3. alloc hugepages with two task(make sure the second will fail due to
>>    insufficient amount of hugepages)
>> 4. with for a few seconds and repeat step 3 which will make
>>    hstate->resv_huge_pages to go below zero.
>>
>> To fix this problem, return corrent amount of pages to subpool during the
>> fallback after hugepage_subpool_get_pages is called.
>>
>> Fixes: 1c5ecae3a93f ("hugetlbfs: add minimum size accounting to subpools")
>> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
>> ---
> 
> Hi Wupeng,
> 
> I hope you are doing well! It's been a while since this fix was sent in, and
> there hasn't been any comments on the test either. Would you consider sending
> this patch again without the RFC tag? I think that might help in the way of
> moving this patch forward : -)

Ok, I'll resend it without the RFC tag.

> 
> Thank you again for this fix! Have a great day!
> Joshua

