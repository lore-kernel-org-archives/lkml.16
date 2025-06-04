Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC8D1E5B97
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030532; cv=none; b=P0kMv1jERQutuKIjZ9Xap6aiqGGl0ZipWfAlSMqT6E8dZVRed8dhB/M0xWHtB1rbDxTVjhPOOnK9BnsEyjIjtsdh75gGgVbkCye0wy1mbhoEDv8yrla/6BqXaT15v7DIteEjGtoVqqbczeLZQu/g6QZBoyOaRDdqXqxC7NY1624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030532; c=relaxed/simple;
	bh=pbdV4FPg+q7X6VNKgCyiuIlkd0/NfsNnQ/IoEFmOi0Q=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X/IiSlbyLSAOWRQcxxCCfBz5gGCPZ5hyqlG3RQwwH6JH6RElGkw20JfVfJvUYChe+A9nattZRv2+mL0pD5m0U7qCxwr7QPxF3vz8skBp6Z8idNoYLyRSAryknadcnsSuQj2oZmRoPfBsH+HEyhh0fUxyL8kbKKomgZJ5+cGJMMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF7iY5xA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF7iY5xA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8741C4CEE7;
	Wed,  4 Jun 2025 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749030531;
	bh=pbdV4FPg+q7X6VNKgCyiuIlkd0/NfsNnQ/IoEFmOi0Q=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=LF7iY5xADR0LXMGkmm3+bM5eMGvuyWceDXQquWYHJu8o1DPGweDZUlbzSun2oxC3O
	 i3kw8nB+PYnttftlV0vYg5XjKjdBopEPmcgtYqBZcBo+Nz/qSn6gsmUaz5n/PzrGhA
	 JyMCaTySGc34cBPHkY6frvjDwcqawYDJuPVvJlAoGAEZVYonc7rlBOeHBpRudP1AgP
	 Tzl58nSAPGh+/Q2S7eRAKjKZqtjlt1+lXQKHT9ZkktGx8M0DUapK8BLy5djzbfq1qr
	 Y9a2u1fZrCbtM3LhFOva3vRDZTAZsU+qY48KDXKVAovDq/4h+Xa9EkI19YznbbyfoJ
	 wA+jhVm3U4duQ==
Message-ID: <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
Date: Wed, 4 Jun 2025 17:48:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, niuzhiguo84@gmail.com, ke.wang@unisoc.com,
 Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Subject: Re: [PATCH] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/25 13:54, Zhiguo Niu wrote:
> The decompress_io_ctx may be released asynchronously after
> I/O completion. If this file is deleted immediately after read,
> and the kworker of processing post_read_wq has not been executed yet
> due to high workloads, It is possible that the inode(f2fs_inode_info)
> is evicted and freed before it is used f2fs_free_dic.
> 
>     The UAF case as below:
>     Thread A                                      Thread B
>     - f2fs_decompress_end_io
>      - f2fs_put_dic
>       - queue_work
>         add free_dic work to post_read_wq
>                                                    - do_unlink
>                                                     - iput
>                                                      - evict
>                                                       - call_rcu
>     This file is deleted after read.
> 
>     Thread C                                 kworker to process post_read_wq
>     - rcu_do_batch
>      - f2fs_free_inode
>       - kmem_cache_free
>      inode is freed by rcu
>                                              - process_scheduled_works
>                                               - f2fs_late_free_dic
>                                                - f2fs_free_dic
>                                                 - f2fs_release_decomp_mem
>                                       read (dic->inode)->i_compress_algorithm
> 
> This patch increase inode->i_count before f2fs_free_dic and decrease it
> after free the dic.
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> ---
>  fs/f2fs/compress.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index b3c1df9..6b3b3a7 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
>  }
>  
>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> -		bool bypass_destroy_callback);
> +		bool bypass_destroy_callback, bool late_free);
>  
>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>  {
> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>  	return dic;
>  
>  out_free:
> -	f2fs_free_dic(dic, true);
> +	f2fs_free_dic(dic, true, false);
>  	return ERR_PTR(ret);
>  }
>  
>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> -		bool bypass_destroy_callback)
> +		bool bypass_destroy_callback, bool late_free)
>  {
>  	int i;
>  
> @@ -1775,6 +1775,11 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>  	}
>  
>  	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> +	if (late_free) {
> +		spin_lock(&dic->inode->i_lock);
> +		atomic_dec(&dic->inode->i_count);
> +		spin_unlock(&dic->inode->i_lock);

If it is the last one release i_count, it needs to call iput_final to evict inode
like what iput did, so we'd better to call iput() here?

> +	}
>  	kmem_cache_free(dic_entry_slab, dic);
>  }
>  
> @@ -1783,16 +1788,20 @@ static void f2fs_late_free_dic(struct work_struct *work)
>  	struct decompress_io_ctx *dic =
>  		container_of(work, struct decompress_io_ctx, free_work);
>  
> -	f2fs_free_dic(dic, false);
> +	f2fs_free_dic(dic, false, true);
>  }
>  
>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>  {
>  	if (refcount_dec_and_test(&dic->refcnt)) {
>  		if (in_task) {
> -			f2fs_free_dic(dic, false);
> +			f2fs_free_dic(dic, false, false);
>  		} else {
>  			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
> +			/* to avoid inode is evicted simultaneously */
> +			spin_lock(&dic->inode->i_lock);
> +			atomic_inc(&dic->inode->i_count);
> +			spin_unlock(&dic->inode->i_lock);

iget()?

BTW, can we store i_compress_algorithm in dic to avoid inode access?

Thanks,

>  			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>  					&dic->free_work);
>  		}

