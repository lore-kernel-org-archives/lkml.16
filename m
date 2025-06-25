Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8819E96A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822005; cv=none; b=ZM/CkGzoUKw21PbDC8HQkB07pmglTKHN7OvIXAn4yv1i6n5Yeh6FXWXpz+kUQY3YUPw0ozUjUUTgyrqlUaaUupcMIkC23QiRmJOMKkPWs9ayxQrcIiA9ZzkLJUVJRBgtuWwmyrkWWCxaQNjKtV4u03SUWmrzTk8Eo7gS3i/yy1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822005; c=relaxed/simple;
	bh=mU1F3RUhNdk4UiLc1UjPfNsL6ir3JdMqJQbzgDnm9HI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gzQHRFeBYdlJcL5GlqjYYKvzcBn94XtnLkbjODKCQoUJ0I1hZt1WedPkVnJb261oA02wKxYvDk/t/MRaeTI7rWmnqP9mVrGxi/u/F16KX9vIow6qwK6XULMeVqsCYi3IHVl4nDkw+X0tvyuHeuwv+5Pcf+q1X/k2WEHBZRgRfeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvmc2jOT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvmc2jOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F914C4CEE3;
	Wed, 25 Jun 2025 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750822004;
	bh=mU1F3RUhNdk4UiLc1UjPfNsL6ir3JdMqJQbzgDnm9HI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=gvmc2jOTNq5BnKN4qV3mGOUAFbAbd7ROpWJ9PK5ReuXKS0tUxcVnZVPrw061GP1vq
	 zYy/XnoAApKMZD2D2DwbD5a3nwL9SD/qgMyypwLd5zzk/pRsK6JN17thu2a1y02Aq2
	 g8DlxS+Xwn60hqjTPV/t1qdzCRwNJRx9J6Qae9o+yN4DTNrOlcMUapkPqoqT7nSnZd
	 ye68G98qEUsNPL+FY1BUp+ZQQ6HTjY3AVZGU0mIjDYw9nxGd58+h8taGALsxin5dTh
	 LK6ZHAwHy+2Ioz6osrTR36fLs3quHMbRY4hYHeoo8K92fx/6kNgmCMYxWz/w58QyKs
	 o3Pc89hCfA25w==
Message-ID: <c91bcaf4-083d-4d5c-96a7-de7d2171f576@kernel.org>
Date: Wed, 25 Jun 2025 11:26:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, wanghui33@xiaomi.com, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>
Subject: Re: [PATCH v2] f2fs: avoid splitting bio when reading multiple pages
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
 <20250618081705.260239-1-huangjianan@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250618081705.260239-1-huangjianan@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/25 16:17, Jianan Huang wrote:
> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
> to the nr_vecs limit, the compressed pages will be split into multiple
> bios and then merged at the block level. In this case, nr_cpages should
> be used to pre-allocate bvecs.
> To handle this case, align max_nr_pages to cluster_size, which should be
> enough for all compressed pages.
> 
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
> Changes since v1:
> - Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.
> 
>  fs/f2fs/data.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..2d948586fea0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		}
>  
>  		if (!bio) {
> -			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
> +			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,
>  					f2fs_ra_op_flags(rac),
>  					folio->index, for_write);
>  			if (IS_ERR(bio)) {
> @@ -2370,12 +2370,18 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  		.nr_cpages = 0,
>  	};
>  	pgoff_t nc_cluster_idx = NULL_CLUSTER;
> -	pgoff_t index;
> +	pgoff_t index = rac ? readahead_index(rac) : folio->index;

For non-compressed file, it's redundant.

>  #endif
>  	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>  	unsigned max_nr_pages = nr_pages;
>  	int ret = 0;
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (f2fs_compressed_file(inode))

index = rac ? readahead_index(rac) : folio->index;

Thanks,

> +		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
> +				round_down(index, cc.cluster_size);
> +#endif
> +
>  	map.m_pblk = 0;
>  	map.m_lblk = 0;
>  	map.m_len = 0;
> @@ -2385,7 +2391,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	map.m_seg_type = NO_CHECK_TYPE;
>  	map.m_may_create = false;
>  
> -	for (; nr_pages; nr_pages--) {
> +	for (; nr_pages; nr_pages--, max_nr_pages--) {
>  		if (rac) {
>  			folio = readahead_folio(rac);
>  			prefetchw(&folio->flags);

