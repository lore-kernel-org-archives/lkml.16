Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653F0DF49
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793728; cv=none; b=bamYQmUmsoYF6xdQBmlvvmSkJlY3D46PYS+cuSbF5ivl7Gj/5pE6Uaik054o1B6xnScls1UgBZeLMW2UiFt1XYxbs27TOmVVqfp61sPjPMSBcC3saW4BmNc6/GPASgNt/JtdlR/OBOF/1K8NynMW0tWQ8GGXiNTnREGSicW1wUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793728; c=relaxed/simple;
	bh=EWx+9SzS20cv+g+xd65u2EnKXP1aEWhGwbzrFnYRDqE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=egcS1e/D6t+EqV8xLFvP6qGCalSP1Q2JshFTikljsvUgKuNMWRjMscDFSPrLQvqlbugYJCXEUDQT8J6I2svXFTvcel2exb8CO2DFo58lhxxt9dWaDlQqzM/UJdcNqOmvMt+llLBChdn1cWglmpTv2LBlXpnfjX1Cdn26e7P5B+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLCVFLBE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLCVFLBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCD5C4CEE3;
	Fri, 13 Jun 2025 05:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749793727;
	bh=EWx+9SzS20cv+g+xd65u2EnKXP1aEWhGwbzrFnYRDqE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=gLCVFLBEp7olDJ97Ld/YWJva25IGy90KzUX4dX5TdEkS0wR1qv5RjFoqF2Nr7wh6l
	 sRF/XVKJP+isQqCas0k/7iIXErLPFOaz+iIPF36bsPYoFIbPSmw6SCxqZpGtX9fFF3
	 4Dgfxleg0uN087MMsFpJ+67XC5G57bxYzSMKh77Svs4R+ezo/rZleqjY6IUE/e8hMq
	 suKQbuM5QeDcUwRhwCTe4JhcNv1VXWSed2QJTnh0aBbjt4qQBD7+VokR0l4hcXubDU
	 oRS3rgiG4+R/HlHtu/OhsmRotogjnuAUzQY9K2oAGBBvhS7degORQKq3YvlNDHX0zp
	 wcG0e36RnovlA==
Message-ID: <4c7c12d3-4305-4756-9623-0154d7cce6c8@kernel.org>
Date: Fri, 13 Jun 2025 13:48:52 +0800
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
Subject: Re: [PATCH 2/2] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
 <1749779445-29125-2-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1749779445-29125-2-git-send-email-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/13 9:50, Zhiguo Niu wrote:
> The decompress_io_ctx may be released asynchronously after
> I/O completion. If this file is deleted immediately after read,
> and the kworker of processing post_read_wq has not been executed yet
> due to high workloads, It is possible that the inode(f2fs_inode_info)
> is evicted and freed before it is used f2fs_free_dic.
> 
>      The UAF case as below:
>      Thread A                                      Thread B
>      - f2fs_decompress_end_io
>       - f2fs_put_dic
>        - queue_work
>          add free_dic work to post_read_wq
>                                                     - do_unlink
>                                                      - iput
>                                                       - evict
>                                                        - call_rcu
>      This file is deleted after read.
> 
>      Thread C                                 kworker to process post_read_wq
>      - rcu_do_batch
>       - f2fs_free_inode
>        - kmem_cache_free
>       inode is freed by rcu
>                                               - process_scheduled_works
>                                                - f2fs_late_free_dic
>                                                 - f2fs_free_dic
>                                                  - f2fs_release_decomp_mem
>                                        read (dic->inode)->i_compress_algorithm
> 
> This patch store compress_algorithm and sbi in dic to avoid inode UAF.
> 
> In addition, the previous solution is deprecated in [1] may cause system hang.
> [1] https://lore.kernel.org/all/c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
