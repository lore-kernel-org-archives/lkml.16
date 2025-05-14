Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764EE221D94
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212700; cv=none; b=bKcJIo0qcvOmmdYb8KQODE/zaDWfus5fAiqVzMgfvLaduFO/q6cEKvOsAJKNzaDc4nOPiWPo9tfvYZgelg+oo7Uwgz5uA/QfWPuRQkfAog4brWrecaoa89jHzOUwEIdCRWXmWIZr3jsXaehZFTWRuOt6b+yK2PiHjYFxrzsOm7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212700; c=relaxed/simple;
	bh=p8Dy0+kEs295ZX7uSrGMbmW7/M4KAYQKoxYzV6woizw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuoVd5De3mlSrIPY5A6BccIWqYAJ8K0JLQv+XnfLXgOgyQtZLvSsXx7CIim4VWeQAk5Iki2XfVtr4yng7wxfPIRk2sYaooqniI76SwUmrP+qfSrvqecykD1frkf+Lm8SBal/S8wzyj/n0MLTdDr+KRgK93skAzvLjzUwd3WecYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wVeW6EZr; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wVeW6EZr"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747212694; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=IMdxeZqMjoqcnZRkSIxuyFVrrAtdBAjdsBoxCYqWgQI=;
	b=wVeW6EZrT1KCcxr493O+6RNX3n9zYXwmI1QUM7wAhOLSwUrbG8hJHQp1LCcpM2K8F5JFLJ6VbQRaQVP0jAlWJTKrNRzMNw4zyI7zCVvCoGBZjmHenwFhi1U11LptuaT4tc+rG608OaQxhw+f+BRF9kkTie0PHk8s8zbeQcy10jk=
Received: from 30.74.144.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WalGEVH_1747212693 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 16:51:34 +0800
Message-ID: <aede5e8a-4e8b-4a06-bdc4-aefc82e4e282@linux.alibaba.com>
Date: Wed, 14 May 2025 16:51:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mm: shmem: avoid unpaired folio_unlock() in
 shmem_swapin_folio()
To: Kemeng Shi <shikemeng@huaweicloud.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250514165047.946884-1-shikemeng@huaweicloud.com>
 <20250514165047.946884-2-shikemeng@huaweicloud.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250514165047.946884-2-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/15 00:50, Kemeng Shi wrote:
> If we get a folio from swap_cache_get_folio() successfully but encounter
> a failure before the folio is locked, we will unlock the folio which was
> not previously locked.
> Put the folio and set it to NULL when a failure occurs before the folio
> is locked to fix the issue.
> 
> Fixes: 058313515d5aa ("mm: shmem: fix potential data corruption during shmem swapin")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>

Good catch. LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   mm/shmem.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 99327c30507c..980fa15f393e 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2335,6 +2335,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		 */
>   		split_order = shmem_split_large_entry(inode, index, swap, gfp);
>   		if (split_order < 0) {
> +			folio_put(folio);
> +			folio = NULL;
>   			error = split_order;
>   			goto failed;
>   		}
