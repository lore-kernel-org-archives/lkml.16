Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C411E1308
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215122; cv=none; b=IZJxO3qVkCbqicyoVIXRKs8OMPdY5bLFPRvhvUKzGLcQwwERk3h+W4pGXXCJ8bFY/LSRGfvMqgvGaesvBM1qDL34Btri6HAFzQl6IWt6Q7WN1KrKq3JFnncppUsanL46Pemg6DIGONusSBPSldRkRbz8zpD0sKCt/sPRX5bSIng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215122; c=relaxed/simple;
	bh=m/7J1kDjjWWDUUGXfte6vkmn5XZCTYAo5sr0p+kI/0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPnhDr+HgTjkIv+fyBS3VZ1QrVDha6J/CA51I13bdWBLF/HJSfdMmaB5x/ssw/D/hNy1VVoh9jXIJYmCvYQjq1E09WlpXbFb2vggJcLQepQjXxtFpnqaY2gfnud1510lBqAz+DBhlE7TuhwKVCxwdLTcaRaiLpEj6pds5LeLFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=o+/gBY0j; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="o+/gBY0j"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747215117; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=m84ZrpRX8wUn6cktbK0GovgX94fveVNM8unrjnB/2Qg=;
	b=o+/gBY0jWtcuELcnUneyzD8XPjJNKqgazYjoXA5koKlnV6fI02Woktvap2FChQnKpp2b6hAHdxE2uQesOmc1h4XqH7ApZ8nT09dm8Uh5dNgmtDTbw1PC+Dp4rTfqgmBDpV+8RZXewAKrmxv5Mtr2I/IdZUKztwIGckYWz9TGHwA=
Received: from 30.74.144.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WalQuJ0_1747215116 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 17:31:57 +0800
Message-ID: <aa3500f8-9a58-458b-96aa-5350c217847e@linux.alibaba.com>
Date: Wed, 14 May 2025 17:31:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm/shmem: remove unneeded xa_is_value() check in
 shmem_unuse_swap_entries()
To: Kemeng Shi <shikemeng@huaweicloud.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250514165047.946884-1-shikemeng@huaweicloud.com>
 <20250514165047.946884-6-shikemeng@huaweicloud.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250514165047.946884-6-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/15 00:50, Kemeng Shi wrote:
> As only value entry will be added to fbatch in shmem_find_swap_entries(),
> there is no need to do xa_is_value() check in shmem_unuse_swap_entries().
> 
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   mm/shmem.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index dfd2f730833c..f1d45fcff5e8 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1446,8 +1446,6 @@ static int shmem_unuse_swap_entries(struct inode *inode,
>   	for (i = 0; i < folio_batch_count(fbatch); i++) {
>   		struct folio *folio = fbatch->folios[i];
>   
> -		if (!xa_is_value(folio))
> -			continue;
>   		error = shmem_swapin_folio(inode, indices[i], &folio, SGP_CACHE,
>   					mapping_gfp_mask(mapping), NULL, NULL);
>   		if (error == 0) {
