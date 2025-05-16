Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F6218ADE
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386925; cv=none; b=FZK5ND/3tqof1r3UjuCm9Rs42qAyB7fO0kKgAvkFG4a7SCelgfgJ06PU/kbC3geqsYd4gzeuHfqj5jgIZKsC57ib7xEHmCTcWzXc6rEQ87FwCRO13cUgxOar2RuAanQS6D/7vSvA7qVR601zCLgJKwb9h+d907u8C9fPL7Xa+w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386925; c=relaxed/simple;
	bh=eUWvg1SBwKKquCpRG/7X4/2bTzloeNex7nWAXd/wroc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYGgsIIKJDQkmf8DdLZAV0zp160F1MlHodauRnA+EAMvdkxQxiVWk5F5CT4zBPLkHyIeqi/t8HA741jE57nprwrxet6EDudPWRsI3v670ESx/3Ukd+pILeu9FQRB1Qw79J8GSbDLnCZD/lZORat++IIv1VTu1uXVNMD1o5FSmoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=taB63BTo; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="taB63BTo"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747386909; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=MSlR1/0liu2wj9sEFyfqDA7bnCsQRY0Sg2XiNIBGBhc=;
	b=taB63BToxg5uNxEYkAmPapMzNRC9WuUsm58mCH4+xl0FARAIJsag0v5nfXvExQbMf/ho8yjxgPbQPWUR+MEobXXz0Fj4kVmksFOXuK48Grxgmkm29CG7KVebP6irN9BSNdIfzsfi9hwOuKoOUkEdUiJCc21kfmKysHBNX7wULHg=
Received: from 30.221.131.45(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WavMJZO_1747386907 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 May 2025 17:15:08 +0800
Message-ID: <b91b9f2c-3a07-4726-95d9-75d36bb59871@linux.alibaba.com>
Date: Fri, 16 May 2025 17:15:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] erofs: add 'fsoffset' mount option for file-backed &
 bdev-based mounts
To: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 lihongbo22@huawei.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
References: <20250516090055.3343777-1-shengyong1@xiaomi.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250516090055.3343777-1-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yong,

On 2025/5/16 17:00, Sheng Yong wrote:

...

> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
> index c293f8e37468..b24cb0d5d4d6 100644
> --- a/Documentation/filesystems/erofs.rst
> +++ b/Documentation/filesystems/erofs.rst
> @@ -128,6 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
>   fsid=%s                Specify a filesystem image ID for Fscache back-end.
>   domain_id=%s           Specify a domain ID in fscache mode so that different images
>                          with the same blobs under a given domain ID can share storage.
> +fsoffset=%lu           Specify image offset for file-backed or bdev-based mounts.

Maybe document it as:
fsoffset=%lu              Specify filesystem offset for the primary device.

Since I'm not sure if we need later
fsoffset=%lu,[%lu,...]    Specify filesystem offset for all devices.

>   ===================    =========================================================
>   
>   Sysfs Entries
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 2409d2ab0c28..599a44d5d782 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -27,9 +27,12 @@ void erofs_put_metabuf(struct erofs_buf *buf)
>   
>   void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
>   {
> -	pgoff_t index = offset >> PAGE_SHIFT;
> +	pgoff_t index;

How about just
	pgoff_t index = (offset + buf->off) >> PAGE_SHIFT;

since it's not complex to break it into two statements..

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
> +		iomap->addr = mdev.m_dif->off + mdev.m_pa;

I mean, could we update erofs_init_device() and then
`mdev.pa` is already an number added by `mdev.m_dif->off`...

Is it possible? since mdev.pa is already a device-based
offset.

>   		if (flags & IOMAP_DAX)
>   			iomap->addr += mdev.m_dif->dax_part_off;
>   	}
> diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
> index 60c7cc4c105c..a2c7001ff789 100644
> --- a/fs/erofs/fileio.c
> +++ b/fs/erofs/fileio.c
> @@ -147,7 +147,8 @@ static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
>   				if (err)
>   					break;
>   				io->rq = erofs_fileio_rq_alloc(&io->dev);
> -				io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
> +				io->rq->bio.bi_iter.bi_sector =
> +					(io->dev.m_dif->off + io->dev.m_pa) >> 9;

So we don't need here.

>   				attached = 0;
>   			}
>   			if (!bio_add_folio(&io->rq->bio, folio, len, cur))
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 4ac188d5d894..cd8c738f5eb8 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -43,6 +43,7 @@ struct erofs_device_info {
>   	char *path;
>   	struct erofs_fscache *fscache;
>   	struct file *file;
> +	u64 off;
>   	struct dax_device *dax_dev;
>   	u64 dax_part_off;

Maybe `u64 off, dax_part_off;` here?

Also I'm still not quite sure `off` is unambiguous...
Maybe `dataoff`? not quite sure.

>   
> @@ -199,6 +200,7 @@ enum {
>   struct erofs_buf {
>   	struct address_space *mapping;
>   	struct file *file;
> +	u64 off;
>   	struct page *page;
>   	void *base;
>   };
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index da6ee7c39290..512877d7d855 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -356,7 +356,7 @@ static void erofs_default_options(struct erofs_sb_info *sbi)
>   
>   enum {
>   	Opt_user_xattr, Opt_acl, Opt_cache_strategy, Opt_dax, Opt_dax_enum,
> -	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio,
> +	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio, Opt_fsoffset,
>   };
>   
>   static const struct constant_table erofs_param_cache_strategy[] = {
> @@ -383,6 +383,7 @@ static const struct fs_parameter_spec erofs_fs_parameters[] = {
>   	fsparam_string("fsid",		Opt_fsid),
>   	fsparam_string("domain_id",	Opt_domain_id),
>   	fsparam_flag_no("directio",	Opt_directio),
> +	fsparam_u64("fsoffset",		Opt_fsoffset),
>   	{}
>   };
>   
> @@ -506,6 +507,9 @@ static int erofs_fc_parse_param(struct fs_context *fc,
>   		errorfc(fc, "%s option not supported", erofs_fs_parameters[opt].name);
>   #endif
>   		break;
> +	case Opt_fsoffset:
> +		sbi->dif0.off = result.uint_64;
> +		break;
>   	}
>   	return 0;
>   }
> @@ -599,6 +603,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>   				&sbi->dif0.dax_part_off, NULL, NULL);
>   	}
>   
> +	if (sbi->dif0.off & ((1 << sbi->blkszbits) - 1))
> +		return invalfc(fc, "fsoffset %lld not aligned to block size",

is `sbi->blkszbits` valid here? I think it should be moved down
to "erofs_read_superblock(sb)".

			"fsoffset %llu is not aligned to block size %u",
			sbi->dif0.off, (1 << sbi->blkszbits)

> +			       sbi->dif0.off);

If fscache doesn't work, we might need to fail out here too.



> +
>   	err = erofs_read_superblock(sb);
>   	if (err)
>   		return err;
> @@ -947,6 +955,8 @@ static int erofs_show_options(struct seq_file *seq, struct dentry *root)
>   	if (sbi->domain_id)
>   		seq_printf(seq, ",domain_id=%s", sbi->domain_id);
>   #endif
> +	if (sbi->dif0.off)
> +		seq_printf(seq, ",fsoffset=%lld", sbi->dif0.off);
>   	return 0;
>   }
>   
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index b8e6b76c23d5..4f910d7ffb2f 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -1707,7 +1707,8 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
>   					bio = bio_alloc(mdev.m_bdev, BIO_MAX_VECS,
>   							REQ_OP_READ, GFP_NOIO);
>   				bio->bi_end_io = z_erofs_endio;
> -				bio->bi_iter.bi_sector = cur >> 9;
> +				bio->bi_iter.bi_sector =
> +						(mdev.m_dif->off + cur) >> 9;

So we don't need here as well.

Thanks,
Gao Xiang
