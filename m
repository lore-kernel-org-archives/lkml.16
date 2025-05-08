Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DD91DB34C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677376; cv=none; b=Fi4PpjOhoCl3bwSgVPcAmQyqKUnJdsuxoP6D6vX4PiiBksbGOiL4tJccYCJTQbP3PQByQAec7odii72BNbzgY49G5Rt1Qh7eZooG1CidCrrWEx3AmWlzDxw6S9ZIYQhmDlyVYZdWqtO9XQiGj3BraswbVLnc2jJ2aCfhNrG1RJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677376; c=relaxed/simple;
	bh=ej4Y8fT5eu5H5EKFIOn6Kne3lGmWocoCdPAwtyzrXiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxUDsGJp72/CtZ1G3RRg9NOqu0/75nHRWkMxYqv5DRqqD44v77ttzkQZYK1Me9zMMj1hPPkjClsgvhRCo0k5e+JREAxSc2su/a228rj/3yPuNSQ8qaVCob2FoRXhvTAPxoLAVzt7jHfhFW8xPe5kdfmjk9A34+K9vqAPPflsbP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e7VrAWrz; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e7VrAWrz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746677369; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=zpJjMdyrn0Lrw7ogNgO0OeCfHHU60ug9slK4AUYcYk0=;
	b=e7VrAWrzV/MPz9YZrmrP7meZQ5OZVLKmp7Wt1mn4uP41y7hsPjgivcBc7dwIxzK1lwI91d2h+NSjjPvufqcaHk3G+x46z26LTDgoj6iygdjDvl1NtHdxJ8VX9KePr9vYZQojfvyiDEHKgzu6nJGhbC7M2cKkNxZt9nUzDTBcjec=
Received: from 30.221.130.212(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WZzOI65_1746677367 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 May 2025 12:09:28 +0800
Message-ID: <6389156c-c6df-4e02-ab46-3aaf6230ef76@linux.alibaba.com>
Date: Thu, 8 May 2025 12:09:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] erofs: add 'fsoffset' mount option for file-backed
 & bdev-based mounts
To: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 kzak@redhat.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 wangshuai12@xiaomi.com, Sheng Yong <shengyong1@xiaomi.com>
References: <20250408122351.2104507-1-shengyong1@xiaomi.com>
 <20250408122351.2104507-2-shengyong1@xiaomi.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250408122351.2104507-2-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yong,

On 2025/4/8 20:23, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When attempting to use an archive file, such as APEX on android,
> as a file-backed mount source, it fails because EROFS image within
> the archive file does not start at offset 0. As a result, a loop
> device is still needed to attach the image file at an appropriate
> offset first. Similarly, if an EROFS image within a block device
> does not start at offset 0, it cannot be mounted directly either.
> 
> To address this issue, this patch adds a new mount option `fsoffset=x'
> to accept a start offset for both file-backed and bdev-based mounts.
> The offset should be aligned to block size. EROFS will add this offset
> before performing read requests.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>

Sorry for late reply.  I was busying in other stuffs, but
since it's for the next cycle I guess it's not too late..

> ---
>   Documentation/filesystems/erofs.rst |  1 +
>   fs/erofs/data.c                     |  8 ++++++--
>   fs/erofs/fileio.c                   |  4 +++-
>   fs/erofs/internal.h                 |  2 ++
>   fs/erofs/super.c                    | 24 +++++++++++++++++++++++-
>   fs/erofs/zdata.c                    | 22 ++++++++++++++--------
>   6 files changed, 49 insertions(+), 12 deletions(-)
> ---
> v4: * change mount option `offset=x' to `fsoffset=x'
> 
> v3: * rename `offs' to `off'
>      * parse offset using fsparam_u64 and validate it in fill_super
>      * update bi_sector inline
>      https://lore.kernel.org/linux-erofs/98585dd8-d0b6-4000-b46d-a08c64eae44d@linux.alibaba.com
> 
> v2: * add a new mount option `offset=X' for start offset, and offset
>         should be aligned to PAGE_SIZE
>      * add start offset for both file-backed and bdev-based mounts
>      https://lore.kernel.org/linux-erofs/0725c2ec-528c-42a8-9557-4713e7e35153@linux.alibaba.com
> 
> v1: https://lore.kernel.org/all/20250324022849.2715578-1-shengyong1@xiaomi.com/
> 
> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
> index c293f8e37468..0fa4c7826203 100644
> --- a/Documentation/filesystems/erofs.rst
> +++ b/Documentation/filesystems/erofs.rst
> @@ -128,6 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
>   fsid=%s                Specify a filesystem image ID for Fscache back-end.
>   domain_id=%s           Specify a domain ID in fscache mode so that different images
>                          with the same blobs under a given domain ID can share storage.
> +fsoffset=%s            Specify image offset for file-backed or bdev-based mounts.
>   ===================    =========================================================
>   
>   Sysfs Entries
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 2409d2ab0c28..7da503480f4d 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -27,9 +27,12 @@ void erofs_put_metabuf(struct erofs_buf *buf)
>   
>   void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
>   {
> -	pgoff_t index = offset >> PAGE_SHIFT;
> +	pgoff_t index;
>   	struct folio *folio = NULL;
>   
> +	offset += buf->off;
> +	index = offset >> PAGE_SHIFT;
> +
>   	if (buf->page) {
>   		folio = page_folio(buf->page);
>   		if (folio_file_page(folio, index) != buf->page)
> @@ -54,6 +57,7 @@ void erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb)
>   	struct erofs_sb_info *sbi = EROFS_SB(sb);
>   
>   	buf->file = NULL;
> +	buf->off = sbi->dif0.off;
>   	if (erofs_is_fileio_mode(sbi)) {
>   		buf->file = sbi->dif0.file;	/* some fs like FUSE needs it */
>   		buf->mapping = buf->file->f_mapping;
> @@ -299,7 +303,7 @@ static int erofs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   		iomap->private = buf.base;
>   	} else {
>   		iomap->type = IOMAP_MAPPED;
> -		iomap->addr = mdev.m_pa;
> +		iomap->addr = EROFS_SB(sb)->dif0.off + mdev.m_pa;
>   		if (flags & IOMAP_DAX)
>   			iomap->addr += mdev.m_dif->dax_part_off;
>   	}
> diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
> index 4fa0a0121288..2c003cbb0fbb 100644
> --- a/fs/erofs/fileio.c
> +++ b/fs/erofs/fileio.c
> @@ -52,7 +52,9 @@ static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
>   
>   	if (!rq)
>   		return;
> -	rq->iocb.ki_pos = rq->bio.bi_iter.bi_sector << SECTOR_SHIFT;
> +
> +	rq->iocb.ki_pos = EROFS_SB(rq->sb)->dif0.off +
> +				(rq->bio.bi_iter.bi_sector << SECTOR_SHIFT);
>   	rq->iocb.ki_ioprio = get_current_ioprio();
>   	rq->iocb.ki_complete = erofs_fileio_ki_complete;
>   	if (test_opt(&EROFS_SB(rq->sb)->opt, DIRECT_IO) &&
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 4ac188d5d894..10656bd986bd 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -43,6 +43,7 @@ struct erofs_device_info {
>   	char *path;
>   	struct erofs_fscache *fscache;
>   	struct file *file;
> +	loff_t off;
>   	struct dax_device *dax_dev;
>   	u64 dax_part_off;

I wonder if it's possible to combine off as dax_part_off since
they are the same functionality...

>   
> @@ -199,6 +200,7 @@ enum {
>   struct erofs_buf {
>   	struct address_space *mapping;
>   	struct file *file;
> +	loff_t off;

I wonder if there is some other way to check
if it's a metabuf, so that we could just use sbi->dif0.off..

But not sure.

>   	struct page *page;
>   	void *base;
>   };

..

> +		if (sb->s_bdev)
> +			devsz = bdev_nr_bytes(sb->s_bdev);
> +		else if (erofs_is_fileio_mode(sbi))
> +			devsz = i_size_read(file_inode(sbi->dif0.file));
> +		else
> +			return invalfc(fc, "fsoffset only supports file or bdev backing");
> +		if (sbi->dif0.off + (1 << sbi->blkszbits) > devsz)
> +			return invalfc(fc, "fsoffset exceeds device size");

I wonder if those checks are really necessary? even it exceeds
the device size, it won't find the valid on-disk superblock then.

> +	}
> +
>   	err = erofs_read_superblock(sb);
>   	if (err)
>   		return err;
> @@ -948,6 +968,8 @@ static int erofs_show_options(struct seq_file *seq, struct dentry *root)
>   	if (sbi->domain_id)
>   		seq_printf(seq, ",domain_id=%s", sbi->domain_id);
>   #endif
> +	if (sbi->dif0.off)
> +		seq_printf(seq, ",fsoffset=%lld", sbi->dif0.off);
>   	return 0;
>   }
>   
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 0671184d9cf1..671527b63c6d 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -1624,7 +1624,8 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
>   				 bool *force_fg, bool readahead)
>   {
>   	struct super_block *sb = f->inode->i_sb;
> -	struct address_space *mc = MNGD_MAPPING(EROFS_SB(sb));
> +	struct erofs_sb_info *sbi = EROFS_SB(sb);
> +	struct address_space *mc = MNGD_MAPPING(sbi);
>   	struct z_erofs_pcluster **qtail[NR_JOBQUEUES];
>   	struct z_erofs_decompressqueue *q[NR_JOBQUEUES];
>   	struct z_erofs_pcluster *pcl, *next;
> @@ -1673,12 +1674,15 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
>   			if (bio && (cur != last_pa ||
>   				    bio->bi_bdev != mdev.m_bdev)) {
>   drain_io:
> -				if (erofs_is_fileio_mode(EROFS_SB(sb)))
> +				if (erofs_is_fileio_mode(sbi)) {
>   					erofs_fileio_submit_bio(bio);
> -				else if (erofs_is_fscache_mode(sb))
> +				} else if (erofs_is_fscache_mode(sb)) {
>   					erofs_fscache_submit_bio(bio);
> -				else
> +				} else {
> +					bio->bi_iter.bi_sector +=
> +						sbi->dif0.off >> SECTOR_SHIFT;

How about multi-device? I guess we should modify
erofs_map_dev() directly rather than callers.

Thanks,
Gao Xiang
