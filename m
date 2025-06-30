Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D4B5661
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751249100; cv=none; b=SGvWRfBooIaQSDC1Hrr9h2l2lroiF1KhvqnRG8vqxhuBqi5Uv+J5F3wUraLDb+fzMfgPctYmR4T48sz/2OQZGG6H4h1K58polj205nY1lkwyEsJW5K9PqDCSc5NtPQKJbb3Lmg9oX/UpiV0Jaqc7k/pC/dwqRgwe+3CID9ly0nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751249100; c=relaxed/simple;
	bh=LHkXBL7gK5HKdb3qamSQTHysQHLotgukhWQRR/PJUCU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Px95Q3PCO5kk6nz3uZIINp1yih/tx/8oC0JyJazFuG3yr9Qe/zowovf3CULGY+3/DM+gvbmEdFk7qSAjN+hsiyiLPZih/BgqwISMMdRmloAtK6CxgAJfE3RppoIniT4pAWXSiMjuItjWTmQKFsSTaaCWbUkkXjJg3XMLN9D9on0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOyBkXPI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOyBkXPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6906EC4CEEB;
	Mon, 30 Jun 2025 02:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751249100;
	bh=LHkXBL7gK5HKdb3qamSQTHysQHLotgukhWQRR/PJUCU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=YOyBkXPI2YSbDgty/YcnmQpQGdHHMmTxOW3ui3Eg5Am4BZw50Mz+WKkWwzY6fOobS
	 Jj4ZkC3xtNLzTZb3vLQBvw7psReWW4/EvDv2zm3DLbziHGTnA143l+wyTPLSY7hv9c
	 gVkDQITP9We0bJqYzRCIjQzX92l/U2Aqcd1TR48N+LHYsBHEAOVPUhlh60254J2sgx
	 GRVpAJMj+EEukevWli4WAd11Wzki0RHVFvHz8zcduKvsys8UX3P+XyoiC5MgI/k0tM
	 qME1Tz6ptgTMy4lCZE+wO4gDkvEklDffz9FqSqu66/H0fjX1iywuRn3o+B5q509sNC
	 MyjegCFfVeWXg==
Message-ID: <4a227a94-6e8e-4ab3-a6f4-fdebc6419764@kernel.org>
Date: Mon, 30 Jun 2025 10:04:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, bintian.wang@honor.com, feng.han@honor.com,
 niuzhiguo84@gmail.com
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned truncation
 to smaller/equal size on pinned file
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250624035938.3176350-1-wangzijie1@honor.com>
 <20250624035938.3176350-2-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250624035938.3176350-2-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/25 11:59, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.

Zijie, can you take a look generic/494? suspect that it is caused by this change.

generic/494 3s ... - output mismatch (see /share/git/fstests/results//generic/494.out.bad)
    --- tests/generic/494.out   2025-01-12 21:57:40.279440664 +0800
    +++ /share/git/fstests/results//generic/494.out.bad 2025-06-30 10:01:37.000000000 +0800
    @@ -2,7 +2,7 @@
     Format and mount
     Initialize file
     Try to truncate
    -ftruncate: Text file busy
    +ftruncate: Invalid argument
     Try to punch hole
     fallocate: Text file busy
    ...
    (Run 'diff -u /share/git/fstests/tests/generic/494.out /share/git/fstests/results//generic/494.out.bad'  to see the entire diff)
Ran: generic/494
Failures: generic/494
Failed 1 of 1 tests

Thanks,

> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v4:
> - convert sbi first and apply change
> ---
>  fs/f2fs/file.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 209f43653..4809f0fd6 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1048,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			!IS_ALIGNED(attr->ia_size,
>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>  			return -EINVAL;
> +		/*
> +		 * To prevent scattered pin block generation, we don't allow
> +		 * smaller/equal size unaligned truncation for pinned file.
> +		 * We only support overwrite IO to pinned file, so don't
> +		 * care about larger size truncation.
> +		 */
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size <= i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);

