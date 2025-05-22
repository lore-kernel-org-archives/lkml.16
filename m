Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34E286407
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904198; cv=none; b=G7j0jjcMJGZ5GG7AclMXlCJbEJ053T7oKNY/RPolz5zNOc+pF4oE3eWvC3ZT1BPFgJSgwuZB7q5REBM4dGVmRFsaKtsV0gG19rWo5wYfsq/tuH0NDBCjsDPYRoA9sC/M0TxLkjMC64S3GPb0EQSo9vkPFgBAvNShnnSJFHESVkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904198; c=relaxed/simple;
	bh=2cKiyAtn7knx1RPBpt21iD7eWVzbpz/NhvFUi/iNudM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jhpJ1RHGULQC4WboeiCPD3sCwGSrVct1UKzy6ZJ1DA1bDMTuOjMCazUdX5/jhmMVEmq7ovH/voTDBzhPO6IqDFOzduUFWCAmB/sCKcResfi2wTu1g6Imhfb9IVwh5mzNiYJRJKbzFNC0xSXOyCSEvuLUAiNVFgBrLFHnxriHeUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGimjlfl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGimjlfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2563C4CEE4;
	Thu, 22 May 2025 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747904198;
	bh=2cKiyAtn7knx1RPBpt21iD7eWVzbpz/NhvFUi/iNudM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=SGimjlflHkALfXQfltSSB79ecm+hM0bvUdkG3aE6EM6Z4128i2IV0JpeR7B8dVR8x
	 amTd/WLvRDpAdf7SNy/xhblK2sfURSHVYzNEJEZhU2xNPNWKDvZ2bn+F6KbtaC1nWN
	 KOsUvHR+SFomGejzZQctYjaR6Sspj2ik7a/5QPqF7oFsdZTYh6aFJNwgj9Cz2hIZof
	 XMdQK9exAWAVCH3VTn247FIE4WSTP2Knaj3CNY68vOLOt0qGuVYzeeOXXfDGIkR30F
	 5XkMPOMne4SWhfpnXw6GkTZGE873Pya51lnmcnSAdLH+Vkhu1mSvxDXxFWYXU7fxPJ
	 4ZdQMo+zmSYFw==
Message-ID: <7d9e95b8-7115-4f8d-880d-9ac88f40f567@kernel.org>
Date: Thu, 22 May 2025 16:56:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, wangqi13@honor.com, bintian.wang@honor.com,
 tao.wangtao@honor.com, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [f2fs-dev] [PATCH] f2fs : add a ioctl to estimate compression
 gain
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250522015244.4132723-1-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250522015244.4132723-1-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/25 09:52, wangzijie wrote:
> This patch add a ioctl to estimate compression gain. In user mode compression, users can define 
> the interval between clusters for estimation sampling before compress and release ioctl to a file.
> This can help users to decide whether to do compress in a fast way, especially for some large files.

Zijie,

Thanks for your contribution.

But, have you considered estimating compression ratio in userspace,
which may face less risk when there is bug in its implementation.
Or you have a strong reason to do this in kernel?

Thanks,

> 
> Signed-off-by: wangqi <wangqi13@honor.com>
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/compress.c        | 107 ++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/f2fs.h            |   5 ++
>  fs/f2fs/file.c            |  38 +++++++++++++-
>  include/uapi/linux/f2fs.h |   8 +++
>  4 files changed, 157 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 9b9481067..3fe160245 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1621,6 +1621,113 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>  	return err;
>  }
>  
> +int f2fs_estimate_compress(struct inode *inode,
> +					struct f2fs_comp_estimate *estimate)
> +{
> +	unsigned long step, cluster_idx, nr_cluster;
> +	block_t i, k;
> +	pgoff_t page_idx;
> +	int ret = 0;
> +	__u64 saved_blocks = 0, compressible_clusters = 0;
> +	struct page *page;
> +	DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, 0);
> +	struct compress_ctx cc = {
> +		.inode = inode,
> +		.log_cluster_size = 0,
> +		.cluster_size = 0,
> +		.cluster_idx = NULL_CLUSTER,
> +		.rpages = NULL,
> +		.nr_rpages = 0,
> +		.cpages = NULL,
> +		.rbuf = NULL,
> +		.cbuf = NULL,
> +		.rlen = 0,
> +		.private = NULL,
> +	};
> +
> +	inode_lock_shared(inode);
> +
> +	cc.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
> +	cc.cluster_size = F2FS_I(inode)->i_cluster_size;
> +	cc.rlen = PAGE_SIZE * F2FS_I(inode)->i_cluster_size;
> +
> +	nr_cluster = (i_size_read(inode) + F2FS_BLKSIZE - 1) >>
> +			(F2FS_BLKSIZE_BITS + cc.log_cluster_size);
> +
> +	if (!(nr_cluster >> (1 + estimate->log_sample_density))) {
> +		ret = -EINVAL;
> +		goto unlock_out;
> +	}
> +
> +	if (f2fs_init_compress_ctx(&cc)) {
> +		ret = -ENOMEM;
> +		goto unlock_out;
> +	}
> +
> +	step = nr_cluster >> estimate->log_sample_density;
> +
> +	for (cluster_idx = 0; cluster_idx < nr_cluster;
> +		cluster_idx += step) {
> +		page_idx = cluster_idx << F2FS_I(inode)->i_log_cluster_size;
> +
> +		if (f2fs_is_compressed_cluster(inode, page_idx))
> +			continue;
> +
> +		ractl._index = page_idx;
> +		page_cache_ra_unbounded(&ractl, cc.cluster_size, 0);
> +
> +		for (i = 0; i < cc.cluster_size; ++i) {
> +			page = read_cache_page(inode->i_mapping, page_idx + i, NULL, NULL);
> +			if (IS_ERR(page)) {
> +				ret = PTR_ERR(page);
> +				goto err_out;
> +			}
> +			f2fs_compress_ctx_add_page(&cc, page_folio(page));
> +		}
> +
> +		ret = f2fs_compress_pages(&cc);
> +		if (ret) {
> +			if (ret == -EAGAIN)
> +				goto free_rpages;
> +			else
> +				goto err_out;
> +		}
> +
> +		saved_blocks += cc.cluster_size - cc.valid_nr_cpages;
> +		compressible_clusters++;
> +
> +		for (k = 0; k < cc.nr_cpages; ++k) {
> +			f2fs_compress_free_page(cc.cpages[k]);
> +			cc.cpages[k] = NULL;
> +		}
> +
> +		page_array_free(cc.inode, cc.cpages, cc.nr_cpages);
> +free_rpages:
> +		f2fs_put_rpages(&cc);
> +		cc.nr_rpages = 0;
> +		cc.cluster_idx = NULL_CLUSTER;
> +	}
> +
> +	f2fs_destroy_compress_ctx(&cc, false);
> +	inode_unlock_shared(inode);
> +
> +	estimate->saved_blocks = saved_blocks;
> +	estimate->compressible_clusters = compressible_clusters;
> +
> +	if (ret == -EAGAIN)
> +		ret = 0;
> +
> +	return ret;
> +
> +err_out:
> +	f2fs_drop_rpages(&cc, i, 0);
> +	f2fs_destroy_compress_ctx(&cc, false);
> +
> +unlock_out:
> +	inode_unlock_shared(inode);
> +	return ret;
> +}
> +
>  static inline bool allow_memalloc_for_decomp(struct f2fs_sb_info *sbi,
>  		bool pre_alloc)
>  {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f1576dc6e..c0d3bd051 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -24,6 +24,7 @@
>  #include <linux/quotaops.h>
>  #include <linux/part_stat.h>
>  #include <linux/rw_hint.h>
> +#include <uapi/linux/f2fs.h>
>  
>  #include <linux/fscrypt.h>
>  #include <linux/fsverity.h>
> @@ -4448,6 +4449,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>  						struct writeback_control *wbc,
>  						enum iostat_type io_type);
>  int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
> +int f2fs_estimate_compress(struct inode *inode, struct f2fs_comp_estimate *estimate);
>  bool f2fs_is_sparse_cluster(struct inode *inode, pgoff_t index);
>  void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
>  				pgoff_t fofs, block_t blkaddr,
> @@ -4539,6 +4541,9 @@ static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
>  static inline int f2fs_is_compressed_cluster(
>  				struct inode *inode,
>  				pgoff_t index) { return 0; }
> +static inline int f2fs_estimate_compress(
> +				struct inode *inode,
> +				struct f2fs_comp_estimate *estimate) { return 0; }
>  static inline bool f2fs_is_sparse_cluster(
>  				struct inode *inode,
>  				pgoff_t index) { return true; }
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index abbcbb586..befd58c70 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -33,7 +33,6 @@
>  #include "gc.h"
>  #include "iostat.h"
>  #include <trace/events/f2fs.h>
> -#include <uapi/linux/f2fs.h>
>  
>  static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
>  {
> @@ -3525,6 +3524,40 @@ static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
>  	return 0;
>  }
>  
> +static int f2fs_ioc_estimate_compress(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_comp_estimate estimate;
> +	int ret = 0;
> +
> +	if (!f2fs_sb_has_compression(sbi) ||
> +			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
> +		return -EOPNOTSUPP;
> +
> +	if (!f2fs_is_compress_backend_ready(inode))
> +		return -EOPNOTSUPP;
> +
> +	if (!f2fs_compressed_file(inode) ||
> +		is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&estimate, (struct f2fs_comp_estimate __user *)arg,
> +		sizeof(struct f2fs_comp_estimate)))
> +		return -EFAULT;
> +
> +	ret = f2fs_estimate_compress(inode, &estimate);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (copy_to_user((struct f2fs_comp_estimate __user *)arg, &estimate,
> +		sizeof(struct f2fs_comp_estimate)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>  int f2fs_precache_extents(struct inode *inode)
>  {
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> @@ -4628,6 +4661,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_get_dev_alias_file(filp, arg);
>  	case F2FS_IOC_IO_PRIO:
>  		return f2fs_ioc_io_prio(filp, arg);
> +	case F2FS_IOC_ESTIMATE_COMPRESS:
> +		return f2fs_ioc_estimate_compress(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -5347,6 +5382,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_COMPRESS_FILE:
>  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
>  	case F2FS_IOC_IO_PRIO:
> +	case F2FS_IOC_ESTIMATE_COMPRESS:
>  		break;
>  	default:
>  		return -ENOIOCTLCMD;
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index 795e26258..07c98985d 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -45,6 +45,8 @@
>  #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
>  #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
>  #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
> +#define F2FS_IOC_ESTIMATE_COMPRESS	_IOR(F2FS_IOCTL_MAGIC, 28,	\
> +						struct f2fs_comp_estimate)
>  
>  /*
>   * should be same as XFS_IOC_GOINGDOWN.
> @@ -104,4 +106,10 @@ struct f2fs_comp_option {
>  	__u8 log_cluster_size;
>  };
>  
> +struct f2fs_comp_estimate {
> +	__u16 log_sample_density;
> +	__u64 compressible_clusters;
> +	__u64 saved_blocks;
> +};
> +
>  #endif /* _UAPI_LINUX_F2FS_H */

