Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D493C1FBC92
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111383; cv=none; b=NWvfzX4oREhQ8a9PnvTnoELWKqQnZJ2CwqfXUYUMieW6Gp5nJTEjWOtG5nByYyleXAJ/Vlq84YbiHeyE5mocfpSqEf+q5deASwqUt6CBAf1joDiJd6VK4uFMoPofHLcRWuY8hzdwNVJY4+AxB+D3O4LDScEbpIKfJ8dDsP74DVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111383; c=relaxed/simple;
	bh=TMeDcR3Ngso8hDEVnwaJtaUK1Pulrv9Er3MDX3dvUnU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VgWqCnKzo/KXApX6gtCaqEoNQ/xZNAFubd5ZaZpvpiGr7UQYQvZNjFVPCdQRLFQRn/DVesxoMtAfX7E9bRMeHLvWpwLyZTMFpYt0cWt9Z44xDFaq7tuGTIk+2e7+HDLKLCNBso0MpCmxLCcdMCwajKM5zJdBbx/CjgmbdyaA5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgIzz5os; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgIzz5os"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D5BC4CEE7;
	Thu,  5 Jun 2025 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749111383;
	bh=TMeDcR3Ngso8hDEVnwaJtaUK1Pulrv9Er3MDX3dvUnU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=JgIzz5osfm+MMt4pkQ4XXiWn7/SmmmtcX0c9mLh1BYsDO0tKyvlV5xA8xrMmhOWkz
	 D9oFlGvV8RuBLtfPrkxdMwrFgj4jYwtSJnCMhF+tvQVU8KkTAXXXdSMD1VwDjVo1Nr
	 iUxgWv0WvjQKaYIzpc3jrt/t6C+7LZ6TFUW3endyYi/dl4pxpgJUzj4LwA9FR3vRxA
	 IQtNxKsNVkAIP1XvrDaHfpoScsPUJa6fc1L7qAkzS+6OpeqcjV65krV+NxoRvM5QjC
	 Sm5s25Na8FbHzfWGKoabDoouiI7aS5clHAXjwIPgPmqsYlJWY2dbsegbMUIPytIW8E
	 JLzpDNKC8Qzuw==
Message-ID: <9da338b4-4d38-4206-81d5-531265165d16@kernel.org>
Date: Thu, 5 Jun 2025 16:16:19 +0800
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
Subject: Re: [PATCH v3] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/25 15:18, Zhiguo Niu wrote:
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

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
