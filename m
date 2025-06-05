Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D303BA49
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 02:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749090238; cv=none; b=jEhBd7lf9HmJmBPXddqyckQuhFRgjcaE9vB8YU8bCx8Gphb1rKBGevUrqTXgEKMdj4Mi9FHE2YMXD3yWGx2qNgMes4jqFLDbyQkoamuuRvDLT8CjYM6RXn+MjwRRYLJSwGapdXEONuaw3o3BpaY7M54uELyTKRtPzveucCmVcdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749090238; c=relaxed/simple;
	bh=/kcE555w9kFdV5l/AbRPGaf2+lFzCpzHbueTVlIUK+0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sP4cP37g5nUNoePUP9KqPIrjD7tVOy4GSTU0kdHkMXPA/SCoRODO9Q+UZcdAEndwCQTo9AuNp4E8xshHkQwodU8MeF2L6SS4LUjy5Jgd8hrPtQCtkH7yB0bc5+KoagpQ3Dcag/uRPUx4/eImmRjZ2CS1kVa+LMaTvbdcZf5nJQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGAx2nZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGAx2nZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0708AC4CEE4;
	Thu,  5 Jun 2025 02:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749090237;
	bh=/kcE555w9kFdV5l/AbRPGaf2+lFzCpzHbueTVlIUK+0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=bGAx2nZPo/ajfn9KlbrYt473bL1oTK6so6RMy1Yds3rZrSP9uIuHsP3aq+f9vxgl2
	 wrUZAXhq7uryrXLXt8Jb5limPaFtfqNRxPU3PG+eoGNhoVVHn0CFUBVvmkAIdDsMW5
	 DYqERjxSW6l3fLVbP7P6d/AqVRH915liUmGv+2le3ACKRPyBR2tQ2stO2YA52D6+/8
	 ThYLyuieORgaWQF86u16jraYgYOSq5mtdCB3cx5KpkMwwpox6UP04BUoFWZkArOCsD
	 vnsCSLpVwoSSGiNGULCRJcoQmM/S6dI0Cqkfk3jCCGUpCuE5bOVJvh/gizYFQHwE0i
	 cW98ehacEXsjw==
Message-ID: <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
Date: Thu, 5 Jun 2025 10:23:53 +0800
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
Subject: Re: [PATCH v2] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/25 19:37, Zhiguo Niu wrote:
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
> This patch use __iget before f2fs_free_dic and iput after free the dic.
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> ---
> v2: use __iget/iput function
> ---
>  fs/f2fs/compress.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index b3c1df9..3f0c18d 100644
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
> @@ -1783,16 +1785,20 @@ static void f2fs_late_free_dic(struct work_struct *work)
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
> +			__iget(dic->inode);
> +			spin_unlock(&dic->inode->i_lock);

Oh, how about using igrab() instead?

>  			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>  					&dic->free_work);
>  		}

