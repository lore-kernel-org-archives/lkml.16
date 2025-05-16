Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA578BF8
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747359190; cv=none; b=COkPLYo7FmzouVAlmw4LjwHpTtuYhssO+y2TtMKYL0CCRN+/uOgPv/61vcZ65uqQzJuGU1BSBKr3iiuF38llPyulXM4zuEGhqxxflV1426ZAYPVrRIabv2idhV+Mb+rIXC8+tYNhjYj8EM/DhsGy9MA1PSj73jm6wihb7sdasZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747359190; c=relaxed/simple;
	bh=0Y+kAWdBVedpu7Vagh3V1AMVtWyUROGz1rAqEkV17VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUf7atkRkvMKtXZ0gRM4Xtq2EtD83YeKhook1C0Rn4rTuwK85Lo9WqwzKLA679Kh687xMNAvU1loXG0ytrJ632otRbipInXplcmO+L8P5nV+j/dKGLe0G2fxDpoGdd0tYld7vcWW6Jl0TX3Wk5wGlolAdrcWW5orQt9nmG97oe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=O3v62pll; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="O3v62pll"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747359184; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BZI5Bs1IPxZqogtJiH52GF2Si8sb+G0fw9rbo2KxJPM=;
	b=O3v62pllsKhs2rQQ7EvZmgAB4UP/1+JCsuCU3SSnEMBNplSHSxsxPJz0nbyKJYSJ48NA/e0pxJCntHvFwT8GZ4LWi6XC9o4pj+oA4WZExvFVe/9KgTspsP1uKeyhxgn7/03Otvok5yJgWXOqMxGitJYve6qMMc+vutPP0Hp3eik=
Received: from 30.74.144.109(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WatBmDe_1747359183 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 May 2025 09:33:04 +0800
Message-ID: <c2551c48-3123-453f-bcb6-e6505b2d72da@linux.alibaba.com>
Date: Fri, 16 May 2025 09:33:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] mm: shmem: only remove inode from swaplist when
 it's swapped page count is 0
To: Kemeng Shi <shikemeng@huaweicloud.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250515154758.956521-1-shikemeng@huaweicloud.com>
 <20250515154758.956521-5-shikemeng@huaweicloud.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250515154758.956521-5-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/15 23:47, Kemeng Shi wrote:
> Even if we fail to allocate a swap entry, the inode might have previously
> allocated entry and we might take inode containing swap entry off swaplist.
> As a result, try_to_unuse() may enter a potential dead loop to repeatedly
> look for inode and clean it's swap entry.
> Only take inode off swaplist when it's swapped page count is 0 to fix the
> issue.
> 
> Fixes: b487a2da3575b ("mm, swap: simplify folio swap allocation")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   mm/shmem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index aeeddf612baa..07b8e1400c67 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1651,8 +1651,8 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
>   		BUG_ON(folio_mapped(folio));
>   		return swap_writepage(&folio->page, wbc);
>   	}
> -
> -	list_del_init(&info->swaplist);
> +	if (!info->swapped)
> +		list_del_init(&info->swaplist);
>   	mutex_unlock(&shmem_swaplist_mutex);
>   	if (nr_pages > 1)
>   		goto try_split;
