Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006B42701B3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398200; cv=none; b=URbWJm4HH5MtQ0jl76C8Fjb8Gy/LB82eQAVMDv2DvecFj/QhKvNy17NHtAUMd5HtGgD8r5DK1zwg4Lj6+eHxOHY1vr7n7sMxwumpzETVjltOAHUMsupxkFmwYgdd50fpJk7Y4CSDrKx7dFxQM5l/rqkG/3lifOqlzKI6GKrIaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398200; c=relaxed/simple;
	bh=4zszpaiYY27dFluclG+Yse6bg/94yxXQ+mZgQjv8N7A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S5D1Ve1hwGTeVKEyZSAJG7PUlWqCGo16eHhioUsr7GAy1MjqrhhpbQYDn4nlKSR5eOMOALVVd+BujQQ5dW9yPp2TX08vP9BDqeVejGOuX6kNi5UW9IJOe7IcLfIyrJZX4qedzkHEdb8FzckMRD9JqoMbfEfO4AOg9Hdkj3+xVpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+DoXT8S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+DoXT8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99106C4CEE2;
	Wed, 23 Apr 2025 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745398199;
	bh=4zszpaiYY27dFluclG+Yse6bg/94yxXQ+mZgQjv8N7A=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=l+DoXT8SqoV1o9WeGu2MbRY0S8I6z3IutO46zrA2W4qS4LXOIwK4yEqUZCXJoBC+1
	 oF74AVEbvd7OP4l/5EDXGKBmXAkfr9DRrXsLQ0qYphY2uo09gPtwDYTmKjQVyL7wog
	 PleM+jDiqfT6hckTpbid0LGpNBC9JaOotDv8TaUjHGdboxWPBsgjIBCXpI2psV69JP
	 KQ3W91wTrNNCviFeR6JiZ7ciPcWMXJZpANt63y96EY8LXAf/K4p14BnZHw1Z5k23jN
	 FzjKv3aZ9jAXGhjWDd6M0io+nn34mJxQ5wvqz4hppF2TwHLf6bqh34OyxkYvFA8LsH
	 zMkRsgt0qL87g==
Message-ID: <b68762b0-b003-4a0b-9f7e-09c1b7bd14eb@kernel.org>
Date: Wed, 23 Apr 2025 16:49:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle error cases of memory donation
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250422191128.1346260-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250422191128.1346260-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 03:11, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In cases of removing memory donation, we need to handle some error cases
> like ENOENT and EACCES (indicating the range already has been donated).
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/f2fs.h     |  1 +
>  fs/f2fs/file.c     | 21 ++++++++++++++-------
>  fs/f2fs/shrinker.c |  5 +++++
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f1576dc6ec67..e4b39550f380 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -821,6 +821,7 @@ enum {
>  	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
>  	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
>  	FI_OPENED_FILE,		/* indicate file has been opened */
> +	FI_PAGE_DONATED,	/* indicate pages of file has been donated */
>  	FI_MAX,			/* max flag, never be used */
>  };
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index abbcbb5865a3..0807f8e97492 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2464,19 +2464,20 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>  	return ret;
>  }
>  
> -static void f2fs_keep_noreuse_range(struct inode *inode,
> +static int f2fs_keep_noreuse_range(struct inode *inode,
>  				loff_t offset, loff_t len)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	u64 max_bytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
>  	u64 start, end;
> +	int ret = 0;
>  
>  	if (!S_ISREG(inode->i_mode))
> -		return;
> +		return 0;
>  
>  	if (offset >= max_bytes || len > max_bytes ||
>  	    (offset + len) > max_bytes)
> -		return;
> +		return 0;
>  
>  	start = offset >> PAGE_SHIFT;
>  	end = DIV_ROUND_UP(offset + len, PAGE_SIZE);
> @@ -2484,7 +2485,7 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
>  	inode_lock(inode);
>  	if (f2fs_is_atomic_file(inode)) {
>  		inode_unlock(inode);
> -		return;
> +		return 0;
>  	}
>  
>  	spin_lock(&sbi->inode_lock[DONATE_INODE]);
> @@ -2493,7 +2494,10 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
>  		if (!list_empty(&F2FS_I(inode)->gdonate_list)) {
>  			list_del_init(&F2FS_I(inode)->gdonate_list);
>  			sbi->donate_files--;
> -		}
> +			if (is_inode_flag_set(inode, FI_PAGE_DONATED))
> +				ret = -EACCES;

If caller has no enough permission, it will return EACCES as well, to avoid
conflict, what do you think of returning EALREADY? or use a wrapper of this
macro like EFSCORRUPTED?

Thanks,

> +		} else
> +			ret = -ENOENT;
>  	} else {
>  		if (list_empty(&F2FS_I(inode)->gdonate_list)) {
>  			list_add_tail(&F2FS_I(inode)->gdonate_list,
> @@ -2505,9 +2509,12 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
>  		}
>  		F2FS_I(inode)->donate_start = start;
>  		F2FS_I(inode)->donate_end = end - 1;
> +		clear_inode_flag(inode, FI_PAGE_DONATED);
>  	}
>  	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
>  	inode_unlock(inode);
> +
> +	return ret;
>  }
>  
>  static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
> @@ -5236,8 +5243,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
>  	     f2fs_compressed_file(inode)))
>  		f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
>  	else if (advice == POSIX_FADV_NOREUSE)
> -		f2fs_keep_noreuse_range(inode, offset, len);
> -	return 0;
> +		err = f2fs_keep_noreuse_range(inode, offset, len);
> +	return err;
>  }
>  
>  #ifdef CONFIG_COMPAT
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 9c8d3aee89af..1fa6619db40f 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -186,8 +186,13 @@ static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
>  
>  		len = fi->donate_end - fi->donate_start + 1;
>  		npages = npages < len ? 0 : npages - len;
> +
> +		inode_lock(inode);
>  		invalidate_inode_pages2_range(inode->i_mapping,
>  					fi->donate_start, fi->donate_end);
> +		set_inode_flag(inode, FI_PAGE_DONATED);
> +		inode_unlock(inode);
> +
>  		iput(inode);
>  		cond_resched();
>  	}

