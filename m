Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC082AC17
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738809231; cv=none; b=aCr/6+dtX+T8ihNIabLgUxihsle+ylmFFxIxHn4u4AYHY/4C52sN2rwgh0xfrrG17UKKcKgKiYmYP58zrA8gPm7eLj2GpyEvDlGvg614cRgOIM9KSnrXLjUxOPAvwir+GKlM3cwW2emv0ZC0JTLSwG2V/FecQGG+mYSNtD6ZSdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738809231; c=relaxed/simple;
	bh=I5vIuvKPhmp6PiFbC1WBEkInFmFSnvCcrl/cwPxZ34s=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dDJ8OipwUEa9AB/c2dyjCP/Qlsb9XE9/sdYGQpmkvZ/GKEr3fj0WnvRPbeFqgUuJ62xdm+SrPcopHiuYQ1OurwBVuFa9QNLDPEA6EGU3WkjnJRuk0NzrStidJApiDAdFASyi6VyLEw2nvNOL0aFsbHaItHK7fX6oL7o9wfH2sBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5baBKKR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5baBKKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3C1C4CED1;
	Thu,  6 Feb 2025 02:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738809230;
	bh=I5vIuvKPhmp6PiFbC1WBEkInFmFSnvCcrl/cwPxZ34s=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=M5baBKKRlUMR7WYOZ+yZJpoDR4CA6nvykrI1+RGPQeNKE1sr+NiHfMvYRVZ8kcbRP
	 yCgk9urObttDIyaW5J52tsy0lnBzpan6twuJnjNc+yDScMrAL4WrgwYr4hQuWDTo8q
	 qwv3kaUR/6C6POL/nmi/VDUyVjXNa0bM2MrxNs6pUmP+dMq2PR9EmO4fu67WgavsYG
	 1h7yhWrj5RAnr3BBMBYgKTjOQGfD+HhRDdajewolf3RrvaZMlA02QK9zSU7uizPhx1
	 YR8WaWp16bykg827xVQcxMN3IZKy/Bc7OYaMM/Nvmnuz+SvwRlx+mAgBhdYu8+KIEG
	 bGURPk/kdDLYA==
Message-ID: <7d99f84f-5f99-4434-a3ef-5054caee22ef@kernel.org>
Date: Thu, 6 Feb 2025 10:33:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [f2fs-dev] [PATCH] f2fs: add ioctl to get IO priority hint
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250205214014.3270585-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250205214014.3270585-1-jaegeuk@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/25 05:40, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch adds an ioctl to give a per-file priority hint to attach
> REQ_PRIO.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c            |  6 ++++++
>  fs/f2fs/f2fs.h            |  7 +++++++
>  fs/f2fs/file.c            | 20 ++++++++++++++++++++
>  include/uapi/linux/f2fs.h |  1 +
>  4 files changed, 34 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 07b46b444d31..24c5cb1f5ada 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -413,6 +413,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
>  static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>  {
>  	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
> +	struct folio *fio_folio = page_folio(fio->page);
>  	unsigned int fua_flag, meta_flag, io_flag;
>  	blk_opf_t op_flags = 0;
>  
> @@ -438,6 +439,11 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>  		op_flags |= REQ_META;
>  	if (BIT(fio->temp) & fua_flag)
>  		op_flags |= REQ_FUA;
> +
> +	if (fio->type == DATA &&
> +	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
> +		op_flags |= REQ_PRIO;
> +
>  	return op_flags;
>  }
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index bd0d8138b71d..c0a5f0df8781 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -816,6 +816,12 @@ enum {
>  	FI_MAX,			/* max flag, never be used */
>  };
>  
> +/* used for f2fs_inode_info->ioprio_hint. */
> +enum {
> +	F2FS_IOPRIO_WRITE = 1,	/* high write priority */
> +	F2FS_IOPRIO_MAX,
> +};

This needs to be exported to user via include/uapi/linux/f2fs.h

> +
>  struct f2fs_inode_info {
>  	struct inode vfs_inode;		/* serve a vfs inode */
>  	unsigned long i_flags;		/* keep an inode flags for ioctl */
> @@ -830,6 +836,7 @@ struct f2fs_inode_info {
>  
>  	/* Use below internally in f2fs*/
>  	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
> +	unsigned int ioprio_hint;	/* hint for IO priority */

Seems one bit in f2fs_inode_info->flags is enough to store write priority?

>  	struct f2fs_rwsem i_sem;	/* protect fi info */
>  	atomic_t dirty_pages;		/* # of dirty pages */
>  	f2fs_hash_t chash;		/* hash value of given file name */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 642b8d85a035..2f93a27d2f45 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3503,6 +3503,23 @@ static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
>  			(u32 __user *)arg);
>  }
>  
> +static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	__u32 level;
> +
> +	if (get_user(level, (__u32 __user *)arg))
> +		return -EFAULT;
> +
> +	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
> +		return -EINVAL;
> +
> +	inode_lock(inode);
> +	F2FS_I(inode)->ioprio_hint = level;
> +	inode_unlock(inode);
> +	return 0;
> +}
> +
>  int f2fs_precache_extents(struct inode *inode)
>  {
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> @@ -4606,6 +4623,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_compress_file(filp);
>  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
>  		return f2fs_ioc_get_dev_alias_file(filp, arg);
> +	case F2FS_IOC_IO_PRIO:
> +		return f2fs_ioc_io_prio(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -5321,6 +5340,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_DECOMPRESS_FILE:
>  	case F2FS_IOC_COMPRESS_FILE:
>  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
> +	case F2FS_IOC_IO_PRIO:
>  		break;
>  	default:
>  		return -ENOIOCTLCMD;
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index cd38a7c166e6..fb2f85b3c540 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -46,6 +46,7 @@
>  #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
>  #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
>  						struct f2fs_donate_range)
> +#define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 28, __u32)
>  
>  /*
>   * should be same as XFS_IOC_GOINGDOWN.

