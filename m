Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5821A1CEEBE
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599339; cv=none; b=hqkiGugUw15sFhCDIcHyY000zbprOsQpnvRVNo7Q18jKhGoqcDKcLpGW6jHGwxTzTZMJElejCvCUlGOKDnCDjM4bWwobQNQNSH88a9GTms68GBG7jo0+dVp3qsbUEvepLV5wuteNVskNenxkafAVsZtxOfF8Kqp1fpTG7MlPBKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599339; c=relaxed/simple;
	bh=Bw64KSmyq0PtEWjmClJdBAYx3Jvs46ZpRQzhQjkMaY0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ensgDNZynA34cygzi4O1Jgsq4oh1+7BkeVFmA5mK9QbDn0U7t4R70h83bB+xT1tbiAJSeUJNswtiIz4y3Fx/wbJs+8WdUWqBSDncIp+TVBkTIkXhUkuondKl+HaUjA/Yc9QxmexMptxuxrbdb7TLkdQZ3Uu6jR4MenWauQGYW0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R24uxpym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R24uxpym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21CAC4CEE7;
	Wed,  7 May 2025 06:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746599338;
	bh=Bw64KSmyq0PtEWjmClJdBAYx3Jvs46ZpRQzhQjkMaY0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=R24uxpymSfD8FgnaspKaiOvkS1fOgSJiEww6efZne6c0QijnmTRwgWJy5qzIgMZSx
	 uj3FmImh/Nb+sp+qUvw49zRWDYrY2MLfuIAX9JDhjEGU8hpDd9DZaur+XYHH7pAesk
	 Lx8+IKTs2siIZhnmPc3/5GipgCV3BAL4bGEedIk6HdrS5cow9Zjfcis2DL8h5jcHdh
	 b+FT+ClB81FDGISBGgJsgMMJMjhy0lewS4Age2PxMYlWXGFACO7QQyaKH5zV+cJNXw
	 kr7D/fCIuBPe2TmwKKJbPAka9FXLfETvdmx7y6sDPKmD45xzR1avzny6wNgRcayi+F
	 TZtpFoZ0MpkUg==
Message-ID: <aab08ad6-22db-44f3-9924-97e096cb0619@kernel.org>
Date: Wed, 7 May 2025 14:28:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] f2fs: don't return AOP_WRITEPAGE_ACTIVATE from
 f2fs_write_single_data_page
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-3-hch@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250505092613.3451524-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 17:25, Christoph Hellwig wrote:
> Instead unlock the pages locally where that would happen and thus
> consolidate the code in the callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/f2fs/compress.c |  5 +----
>  fs/f2fs/data.c     | 13 ++++---------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index e016b0f96313..ce63b3bfb28f 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1565,10 +1565,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  						NULL, NULL, wbc, io_type,
>  						compr_blocks, false);
>  		if (ret) {
> -			if (ret == AOP_WRITEPAGE_ACTIVATE) {
> -				folio_unlock(folio);
> -				ret = 0;

Previously, for this case, it will goto out label rather than writing
left pages?

Thanks,

> -			} else if (ret == -EAGAIN) {
> +			if (ret == -EAGAIN) {
>  				ret = 0;
>  				/*
>  				 * for quota file, just redirty left pages to
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 08a8a107adcb..e32c9cf5b4f5 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2930,10 +2930,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  	 * file_write_and_wait_range() will see EIO error, which is critical
>  	 * to return value of fsync() followed by atomic_write failure to user.
>  	 */
> -	if (!err || wbc->for_reclaim)
> -		return AOP_WRITEPAGE_ACTIVATE;
>  	folio_unlock(folio);
> -	return err;
> +	if (err && !wbc->for_reclaim)
> +		return err;
> +	return 0;
>  }
>  
>  /*
> @@ -3146,8 +3146,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  			ret = f2fs_write_single_data_page(folio,
>  					&submitted, &bio, &last_block,
>  					wbc, io_type, 0, true);
> -			if (ret == AOP_WRITEPAGE_ACTIVATE)
> -				folio_unlock(folio);
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  result:
>  #endif
> @@ -3159,10 +3157,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  				 * keep nr_to_write, since vfs uses this to
>  				 * get # of written pages.
>  				 */
> -				if (ret == AOP_WRITEPAGE_ACTIVATE) {
> -					ret = 0;
> -					goto next;
> -				} else if (ret == -EAGAIN) {
> +				if (ret == -EAGAIN) {
>  					ret = 0;
>  					if (wbc->sync_mode == WB_SYNC_ALL) {
>  						f2fs_io_schedule_timeout(

