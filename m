Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662E828751F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841110; cv=none; b=JOeh1zeE5tSkBFV+DcJVLgU+LjnVKnSkZrB9w7A0BQsZNO90BcTDQBcCH4RqTaGIBDnNM9kMEG/iLSljqGvog8yZhOU+4pl+pnUkufFmCTLmuJmnKFJKducJUJ1L2jbfap0CLpWPSaXrElnRmwkLIYHJ1EYb9vrKuSIiQyY3AT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841110; c=relaxed/simple;
	bh=akGozF2xMqa27fiz+s8c9GDxo0IXK8cpAQzDW569FOc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FyaV833OYE0bDFBomho29vv+IfGOMvvwSjCNrjgBu2A0idqkPKb37Z3BQahngjp8B2yd0gIX3WwS2HO+YnZ0xYoJAQpOrG4XuWVOOtJCrHU7I9MM8y2Tee1GHnPxVgkeyvOE4lHuMCbX082Pzi4DTxCU8JL4JRueJrXvUPutOAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UV05VOy8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UV05VOy8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A723C4CEF1;
	Wed, 25 Jun 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750841109;
	bh=akGozF2xMqa27fiz+s8c9GDxo0IXK8cpAQzDW569FOc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=UV05VOy86DshskpVnUKFSo5zPC2fD51gmvaD+ny+NX99Uznqh9vIPrEFZQGhk1zqo
	 SDXlr9GI/6AeoW0Soh+TiWalcd5+IZOekzqCPqTld4YwntXszVbyoHR50WgLfugdxP
	 rrt1iE0GaK84E1jLonzwvMKr4i0iQzrzJFhOnHOa2+WVTEA1toDPItblcty/fhagWn
	 44yws5P6T1G7uGtbkayKhlFFAcPHK4Ito3kGhWAy0P3Y1chisnDvxWiUc3HbV7xlnZ
	 rf0RwdgiPr+pNIH8CJV3fNaWSt/kozL3eFcCyO4ZCKb8yJCs6qS+4Vik4WVSXnW7XA
	 8/CpVxLN4A+zQ==
Message-ID: <d2ac0da9-3d47-4269-a7b0-a18719c64346@kernel.org>
Date: Wed, 25 Jun 2025 16:45:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, wanghui33@xiaomi.com, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>
Subject: Re: [PATCH v3] f2fs: avoid splitting bio when reading multiple pages
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250625064927.516586-1-huangjianan@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250625064927.516586-1-huangjianan@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 14:49, Jianan Huang wrote:
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
> Changes since v2:
> - Initialize index only for compressed files.
> Changes since v1:
> - Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.
> 
>  fs/f2fs/data.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..d071d9f6a811 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		}
>  
>  		if (!bio) {
> -			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
> +			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,

Jianan,

Another case:

read page #0,1,2,3 from block #1000,1001,1002, cluster_size=4.

nr_pages=4
max_nr_pages=round_up(0+4,4)-round_down(0,4)=4

f2fs_mpage_readpages() calls f2fs_read_multi_pages() when nr_pages=1, at
that time, max_nr_pages equals to 1 as well.

f2fs_grab_read_bio(..., 1 - 0,...) allocate bio w/ 1 vec capacity, however,
we need at least 3 vecs to merge all cpages, right?

Thanks,

>  					f2fs_ra_op_flags(rac),
>  					folio->index, for_write);
>  			if (IS_ERR(bio)) {
> @@ -2376,6 +2376,14 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	unsigned max_nr_pages = nr_pages;
>  	int ret = 0;
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (f2fs_compressed_file(inode)) {
> +		index = rac ? readahead_index(rac) : folio->index;
> +		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
> +				round_down(index, cc.cluster_size);
> +	}
> +#endif
> +
>  	map.m_pblk = 0;
>  	map.m_lblk = 0;
>  	map.m_len = 0;
> @@ -2385,7 +2393,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	map.m_seg_type = NO_CHECK_TYPE;
>  	map.m_may_create = false;
>  
> -	for (; nr_pages; nr_pages--) {
> +	for (; nr_pages; nr_pages--, max_nr_pages--) {
>  		if (rac) {
>  			folio = readahead_folio(rac);
>  			prefetchw(&folio->flags);

