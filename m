Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357FD1E9905
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571712; cv=none; b=toA++AIPgApxJUItLloXThXM2eLJj8z2zaHoGpqw363Q0vmeVVEVE7Kyrc/YbaQxvjpS7zulicMnImaXhXLcmsaC/dMtng8ucI0eFWkQSaPkdnXOayx18ZFTgRProKmIJtIfcr7OSjp2Ha0+7gMze0XP6GHKV7IiZWSz8/OvC0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571712; c=relaxed/simple;
	bh=USwOIsVhkg9+A/PdAnwHxSXCbsHxApVOGy15tnigTpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOeNRx/pgdNAmFB2Opt3Nlf3RLt60yUv/lNbvr9INVpEOzvJzrWStO9YRQDZgYntb48QO/kWulhuqW0vQamXa1/2LGJ/ZuWZpZ2YPNhaDL5p2G5t4iysxSVb1x/DkbM3x+y8tz2o1bRANyQabS68CEPdSJ4r0nW7R8IyIXn/pxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMzYR96F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMzYR96F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E0FC4CEF0;
	Tue, 10 Jun 2025 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571711;
	bh=USwOIsVhkg9+A/PdAnwHxSXCbsHxApVOGy15tnigTpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMzYR96Fynzp3sQAzKNWvM5Z4VgwmmPLWIhJsUYmsy632UmWgluCPVruUCW6sRvuO
	 s3ZyevWiEH3dmLRdHDKHapVNOpma34dD8NOmucqRnJ20rhQQ+vtuhxLO/OzoOykJxG
	 PNREOVlBcNi4q2tcXQYOr0mn4n+hSmHDY4ngMku0BOwuBhHghpKe7VMvS9uWTsP7tT
	 FnYawbySQa/ft0EgIJ07c5qwF86yMNM0taB/e/FS9EWI9qDEqMP9hgsPfLDs5afBPm
	 +96kG9e0pWOrQoG/K6D4JaZsHW7ffVY/F7JIvQvAQQDGvoT3sCYkoo8g0tvsw88MYI
	 Q7BPA5VdsuAiA==
Date: Tue, 10 Jun 2025 16:08:29 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, niuzhiguo84@gmail.com,
	ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Subject: Re: [PATCH v3] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
Message-ID: <aEhYfYrknbNzT8Or@google.com>
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>

Hi Zhiguo,

This patch causes CPU hang when running fsstress on compressed/non-compressed
files. Please check.

On 06/05, Zhiguo Niu wrote:
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
> This patch use igrab before f2fs_free_dic and iput after free the dic when dic free
> action is done by kworker.
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> ---
> v3: use igrab to replace __iget
> v2: use __iget/iput function
> ---
>  fs/f2fs/compress.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index b3c1df9..729ad16 100644
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
> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>  	}
>  
>  	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> +	if (late_free)
> +		iput(dic->inode);
>  	kmem_cache_free(dic_entry_slab, dic);
>  }
>  
> @@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work_struct *work)
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
> +			/* use igrab to avoid inode is evicted simultaneously */
> +			f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic->inode));
>  			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>  					&dic->free_work);
>  		}
> -- 
> 1.9.1
