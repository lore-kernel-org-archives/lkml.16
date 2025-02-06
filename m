Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9B91A8F95
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866757; cv=none; b=a+/vUZuXMevQSr54SUWEKO1g3RdgdDdWBEO3AP1QwH1tOZylszUN6hKn7Q9ruLL1BHizMPoIpxqXQzVaYoOdGUWgtjoTGytoQsH6CepVGVbWNdIn5JZ06/y1Jj/C4PiW/NKBrj24w9pY8uFX2Flv6FrzDMNQHpzrloz5ds87gWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866757; c=relaxed/simple;
	bh=8X5FuHEI66Y4YEPP3WRlz+e+I7UFq0Vbw8n0uFIUZk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJGjZeYh6b4l7cpxe7nr+zuSnQcJADthmSnwIhlXT+fn7Y+Ou4vstPNWLYDs5jWM1lEvoKizsZRO1FbMB4859939PzJTSay3TymsU3Q/bE0g6jjtcqPmv9ki7U1sQ0rW/JoGHa9f+xS0OWgRUHU86bIranwqzCTWLUWwKFhd6mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryWfEKy3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryWfEKy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516F9C4CEE3;
	Thu,  6 Feb 2025 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738866756;
	bh=8X5FuHEI66Y4YEPP3WRlz+e+I7UFq0Vbw8n0uFIUZk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryWfEKy3tzYreQNq1M57RWiuSbCOvi5b/FnBpaPIU5ctI4/dpyP/Las6pyhRi4Gux
	 FhcreSi3Rb+VbRRkYhXeDULe4RTQSTks8d3ftOnUFouRi/flTupM/D9XNyhR+xNXOy
	 36a9qv9fHNDd/8pK5ZAlMi+WWoGw17cwk1i6lVZm0iuYm++Gc/b9kF0YLMvbWz4IoE
	 VSolgOZrozbcoxEH+5WlaGVKe09/qRcDv86L1rQhUOsA9fRlz5Ft22/zS5zvH5YZ+N
	 MBQtkcMQisevhPLTs/oTtSAD7vhSDGuYLLJ/6g4i/3maD9F8PnT3Ay/PXfE3Rp5B3t
	 urxpPuyHi0DxA==
Date: Thu, 6 Feb 2025 18:32:34 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH] f2fs: add ioctl to get IO priority hint
Message-ID: <Z6UAQjJixONcx0bu@google.com>
References: <20250205214014.3270585-1-jaegeuk@kernel.org>
 <7d99f84f-5f99-4434-a3ef-5054caee22ef@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d99f84f-5f99-4434-a3ef-5054caee22ef@kernel.org>

On 02/06, Chao Yu wrote:
> On 2/6/25 05:40, Jaegeuk Kim via Linux-f2fs-devel wrote:
> > This patch adds an ioctl to give a per-file priority hint to attach
> > REQ_PRIO.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/data.c            |  6 ++++++
> >  fs/f2fs/f2fs.h            |  7 +++++++
> >  fs/f2fs/file.c            | 20 ++++++++++++++++++++
> >  include/uapi/linux/f2fs.h |  1 +
> >  4 files changed, 34 insertions(+)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 07b46b444d31..24c5cb1f5ada 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -413,6 +413,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
> >  static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
> >  {
> >  	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
> > +	struct folio *fio_folio = page_folio(fio->page);
> >  	unsigned int fua_flag, meta_flag, io_flag;
> >  	blk_opf_t op_flags = 0;
> >  
> > @@ -438,6 +439,11 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
> >  		op_flags |= REQ_META;
> >  	if (BIT(fio->temp) & fua_flag)
> >  		op_flags |= REQ_FUA;
> > +
> > +	if (fio->type == DATA &&
> > +	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
> > +		op_flags |= REQ_PRIO;
> > +
> >  	return op_flags;
> >  }
> >  
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index bd0d8138b71d..c0a5f0df8781 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -816,6 +816,12 @@ enum {
> >  	FI_MAX,			/* max flag, never be used */
> >  };
> >  
> > +/* used for f2fs_inode_info->ioprio_hint. */
> > +enum {
> > +	F2FS_IOPRIO_WRITE = 1,	/* high write priority */
> > +	F2FS_IOPRIO_MAX,
> > +};
> 
> This needs to be exported to user via include/uapi/linux/f2fs.h
> 
> > +
> >  struct f2fs_inode_info {
> >  	struct inode vfs_inode;		/* serve a vfs inode */
> >  	unsigned long i_flags;		/* keep an inode flags for ioctl */
> > @@ -830,6 +836,7 @@ struct f2fs_inode_info {
> >  
> >  	/* Use below internally in f2fs*/
> >  	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
> > +	unsigned int ioprio_hint;	/* hint for IO priority */
> 
> Seems one bit in f2fs_inode_info->flags is enough to store write priority?

I wanted to isolate this from general flags and open for more in future.

> 
> >  	struct f2fs_rwsem i_sem;	/* protect fi info */
> >  	atomic_t dirty_pages;		/* # of dirty pages */
> >  	f2fs_hash_t chash;		/* hash value of given file name */
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 642b8d85a035..2f93a27d2f45 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -3503,6 +3503,23 @@ static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
> >  			(u32 __user *)arg);
> >  }
> >  
> > +static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
> > +{
> > +	struct inode *inode = file_inode(filp);
> > +	__u32 level;
> > +
> > +	if (get_user(level, (__u32 __user *)arg))
> > +		return -EFAULT;
> > +
> > +	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
> > +		return -EINVAL;
> > +
> > +	inode_lock(inode);
> > +	F2FS_I(inode)->ioprio_hint = level;
> > +	inode_unlock(inode);
> > +	return 0;
> > +}
> > +
> >  int f2fs_precache_extents(struct inode *inode)
> >  {
> >  	struct f2fs_inode_info *fi = F2FS_I(inode);
> > @@ -4606,6 +4623,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> >  		return f2fs_ioc_compress_file(filp);
> >  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
> >  		return f2fs_ioc_get_dev_alias_file(filp, arg);
> > +	case F2FS_IOC_IO_PRIO:
> > +		return f2fs_ioc_io_prio(filp, arg);
> >  	default:
> >  		return -ENOTTY;
> >  	}
> > @@ -5321,6 +5340,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >  	case F2FS_IOC_DECOMPRESS_FILE:
> >  	case F2FS_IOC_COMPRESS_FILE:
> >  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
> > +	case F2FS_IOC_IO_PRIO:
> >  		break;
> >  	default:
> >  		return -ENOIOCTLCMD;
> > diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> > index cd38a7c166e6..fb2f85b3c540 100644
> > --- a/include/uapi/linux/f2fs.h
> > +++ b/include/uapi/linux/f2fs.h
> > @@ -46,6 +46,7 @@
> >  #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
> >  #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
> >  						struct f2fs_donate_range)
> > +#define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 28, __u32)
> >  
> >  /*
> >   * should be same as XFS_IOC_GOINGDOWN.
