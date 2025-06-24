Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9A23BD1B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803851; cv=none; b=oKaBLwVLDKx8MT2UrD7+C/DTRhXh3HDacH8f82c8T5NuL/GPoA+dzcSHXzZfGQvQdNDM8oz0VeOdvgx9q4TQwPaxdK0ibXRiDeYTNwF7+WRLgTnjOC/NS74bTsMRI65IT5Kl+D80DY9hQZa21b++5AWjZBGJAYqAuaO1UkpNXW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803851; c=relaxed/simple;
	bh=TkBxVjHuGT2u0cZhQ/6iXFy1qFejfhfWizyJmbvEQLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkFAkvawcUDDPcgIBNlKh3NOzcHrXoaS6raZjzDbbRIIL6PeJ3yBC0rPZ0GR4fIIodxObQxDyP2Whj9zWv7tmw/j6gDvH3OECmYMAVm8GRv8R4LN5tXYbengfVHU2b/lWp2ZSmgK2g0jKCP2UKOBh6IkBuVOS9PTLFEo6pJ3o68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cV/1gLlq; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cV/1gLlq"
Message-ID: <14e219dd-a253-406b-8bfd-9b33f023c963@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750803836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGWWQl0J3h6KulE/wHqFyngR7SDM0xexTWNu6shcvks=;
	b=cV/1gLlqSyjBWfMj/wH7MCwTcifRyjAwp4it+4mFvOs+E/f8x56lG2YZgwtVnypFIhw25s
	9MPC1A3/rhLSDUFThQ5GbcXfThGRc4fxMahHvd783lw/SP0j5FGKJcHsYH692S90USOqz/
	jdM9EGWFNsTl0t6CRdQia5Gn4l70ZXE=
Date: Tue, 24 Jun 2025 15:23:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net/mlx5e: Fix error handling in RQ memory model
 registration
To: Fushuai Wang <wangfushuai@baidu.com>, saeedm@nvidia.com,
 tariqt@nvidia.com, leon@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250624140730.67150-1-wangfushuai@baidu.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "yanjun.zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <20250624140730.67150-1-wangfushuai@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/24/25 7:07 AM, Fushuai Wang wrote:
> Currently when xdp_rxq_info_reg_mem_model() fails in the XSK path, the
> error handling incorrectly jumps to err_destroy_page_pool. While this
> may not cause errors, we should make it jump to the correct location.

In the page_pool_destroy function, if pool is NULL, the function will 
simply return, so the goto err_destroy_page_pool statement will not lead 
to any issues.

However, this commit does improve the clarity of the logic.

Looks good to me.

void page_pool_destroy(struct page_pool *pool)
{
         if (!pool)
                 return;

         if (!page_pool_put(pool))
                 return;

         page_pool_disable_direct_recycling(pool);
         page_pool_free_frag(pool);

         if (!page_pool_release(pool))
                 return;

         page_pool_detached(pool);
         pool->defer_start = jiffies;
         pool->defer_warn  = jiffies + DEFER_WARN_INTERVAL;

         INIT_DELAYED_WORK(&pool->release_dw, page_pool_release_retry);
         schedule_delayed_work(&pool->release_dw, DEFER_TIME);
}

Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>

Zhu Yanjun

> 
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> index ea822c69d137..1e3ba51b7995 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -915,6 +915,8 @@ static int mlx5e_alloc_rq(struct mlx5e_params *params,
>   	if (xsk) {
>   		err = xdp_rxq_info_reg_mem_model(&rq->xdp_rxq,
>   						 MEM_TYPE_XSK_BUFF_POOL, NULL);
> +		if (err)
> +			goto err_free_by_rq_type;
>   		xsk_pool_set_rxq_info(rq->xsk_pool, &rq->xdp_rxq);
>   	} else {
>   		/* Create a page_pool and register it with rxq */
> @@ -941,12 +943,13 @@ static int mlx5e_alloc_rq(struct mlx5e_params *params,
>   			rq->page_pool = NULL;
>   			goto err_free_by_rq_type;
>   		}
> -		if (xdp_rxq_info_is_reg(&rq->xdp_rxq))
> +		if (xdp_rxq_info_is_reg(&rq->xdp_rxq)) {
>   			err = xdp_rxq_info_reg_mem_model(&rq->xdp_rxq,
>   							 MEM_TYPE_PAGE_POOL, rq->page_pool);
> +			if (err)
> +				goto err_destroy_page_pool;
> +		}
>   	}
> -	if (err)
> -		goto err_destroy_page_pool;
>   
>   	for (i = 0; i < wq_sz; i++) {
>   		if (rq->wq_type == MLX5_WQ_TYPE_LINKED_LIST_STRIDING_RQ) {

