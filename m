Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14CE23535D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584007; cv=none; b=BX2YL8XqSw3En76EHsuu94h6h4XGYcjBoePLEpoZJSvmfhFixh4f4hBDnd36GKzATqMxgQR+VyB1xX3HnElaoEb/6plgW9eVE3KnLGvflJ86tCw6SsrbRTxG/DxbbJMaBAtchgi8dQwn2uKY3Gz7WNb6gUfO3fIUGgTge816Ze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584007; c=relaxed/simple;
	bh=kFkMQOJNByPYxbMTiA/Z69Qr5pi6vG08oeda8QGr/ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLcYRLyLYv79sNYGa7Bvuv9KRfjyhepyZ5g72726Kra/59m5Tqxc8r/LEsrbooroP/G9aEsEYV7FgoK81CQsPwXP5tmosVhkJMi+GkrZ4nYopOAAl39g89BBNTkaReWZKHr7RbGelg+KqJn+MtgK+c+5Z/eXcm6vh/YW521FtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0B1812FC;
	Wed,  2 Apr 2025 01:53:26 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75D963F694;
	Wed,  2 Apr 2025 01:53:21 -0700 (PDT)
Message-ID: <bdecbb1e-96c3-4b91-b21c-ab1ec3ffa3be@arm.com>
Date: Wed, 2 Apr 2025 14:23:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: page_alloc: Remove redundant READ_ONCE
To: Songtang Liu <liusongtang@bytedance.com>, akpm@linux-foundation.org,
 ying.huang@linux.alibaba.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 zhengqi.arch@bytedance.com, songmuchun@bytedance.com
References: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/25 13:11, Songtang Liu wrote:
> In the current code, batch is a local variable, and it cannot be
> concurrently modified. It's unnecessary to use READ_ONCE here,
> so remove it.
> 
> Fixes: 51a755c56dc0 ("mm: tune PCP high automatically")

Although READ_ONCE() should not have been used here with the above
commit - does this cause any problem though ? So in other words is
the Fixes: tag necessary here ?

> Signed-off-by: Songtang Liu <liusongtang@bytedance.com>
> ---
>  mm/page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e3ea5bf5c459..6edc6e57d4f8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2661,7 +2661,7 @@ static void free_frozen_page_commit(struct zone *zone,
>  		free_high = (pcp->free_count >= batch &&
>  			     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
>  			     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
> -			      pcp->count >= READ_ONCE(batch)));
> +			      pcp->count >= batch));
>  		pcp->flags |= PCPF_PREV_FREE_HIGH_ORDER;
>  	} else if (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) {
>  		pcp->flags &= ~PCPF_PREV_FREE_HIGH_ORDER;

Otherwise LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
