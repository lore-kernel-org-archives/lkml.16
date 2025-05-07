Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC0821C18E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602403; cv=none; b=PrW0xby+hXSaqiQY/AwrxuKwwPce0yj/w/ga5vTLXvc95kv0rDvoRcLphSd5awFxzpTTxoeV7o0HgNEygXaZ4h8uTJ52GLMkremTTa+847/FIhCBi16jGpXXUTZsEvOah3cac31x9TkRbmcp9yDFLSGljt8Bv4tjLgQToYoAR7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602403; c=relaxed/simple;
	bh=vwuudw/R1dLfo9sArQaDbUrhxRWphnXFmv5qQLkzTz8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SnF7HEclXjEvaJiEu1L3SmLiiUgwpW8tnFWnnk/esEAxBEhLS1aVTAxMUBSyuLfWhKbHIXSRw0BjapFsyDpwvoys7BqSJLGjWGM+/9PxHZLtqgURu2KvAb1+VRZS6CN/Et9eq72bfmsgeke5iL1Qv0g4Tfs1AXB3F/AfVniYGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcfYAZTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcfYAZTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEFCC4CEE7;
	Wed,  7 May 2025 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746602402;
	bh=vwuudw/R1dLfo9sArQaDbUrhxRWphnXFmv5qQLkzTz8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=TcfYAZTeLavqZSxb1K/iAE8gfjzqSp9MqKO5qa9QoIGkVtcWFauBdbqODFHH64A0R
	 +Ebx9WttBHPDc9kI8xPyiZa2G73NZ0Mo6Flid4T/z5TMJdEP60EcbiC+M7Rk4hqI6q
	 0ktk3COIIMGsgBAyahO0Ki0xgVkMXVZmJulAESJOAHLSIVMAsXaXTvmoX9VIKMzupc
	 9t0abcRZy9mj3gPBu25NxeYNeR0h3q2f3selIqxSpplhHZMVlBAO7mMSXED7r2liCx
	 c25uHw2SEFaxE49v40pYGwVc926VIMFdL8mtfbwQ6Djb0BQgboe7rUZHaYJC7n38jr
	 KpiMr9Gv32FSg==
Message-ID: <8460a749-951c-44d8-a5fa-699eb7f902ca@kernel.org>
Date: Wed, 7 May 2025 15:19:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] f2fs: simplify return value handling in
 f2fs_fsync_node_pages
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-4-hch@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250505092613.3451524-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 17:26, Christoph Hellwig wrote:
> Always assign ret where the error happens, and jump to out instead
> of multiple loop exit conditions to prepare for changes in the
> __write_node_folio calling convention.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/f2fs/node.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index ec74eb9982a5..b9d9519c3da4 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1882,17 +1882,17 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  			if (!folio_clear_dirty_for_io(folio))
>  				goto continue_unlock;
>  
> -			ret = __write_node_folio(folio, atomic &&
> +			if (__write_node_folio(folio, atomic &&
>  						folio == last_folio,
>  						&submitted, wbc, true,
> -						FS_NODE_IO, seq_id);
> -			if (ret) {
> +						FS_NODE_IO, seq_id)) {
>  				folio_unlock(folio);
>  				f2fs_folio_put(last_folio, false);
> -				break;
> -			} else if (submitted) {
> -				nwritten++;
> +				ret = -EIO;
> +				goto out;

It missed to call folio_batch_release() here?

Thanks,

>  			}
> +			if (submitted)
> +				nwritten++;
>  
>  			if (folio == last_folio) {
>  				f2fs_folio_put(folio, false);
> @@ -1903,10 +1903,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  		folio_batch_release(&fbatch);
>  		cond_resched();
>  
> -		if (ret || marked)
> +		if (marked)
>  			break;
>  	}
> -	if (!ret && atomic && !marked) {
> +	if (atomic && !marked) {
>  		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
>  			   ino, last_folio->index);
>  		folio_lock(last_folio);
> @@ -1918,7 +1918,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  out:
>  	if (nwritten)
>  		f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
> -	return ret ? -EIO : 0;
> +	return ret;
>  }
>  
>  static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)

