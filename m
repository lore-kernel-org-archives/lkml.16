Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623423C2F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077684; cv=none; b=nvtuwKL/0i0DsoWvq2OKeZCQjk8vEcVjiVJZmrifG/zua2YJTKzSOTKtSXlaHaFV7QbfKAVJfNO6RI/ok8fRA2359Gi9OHJ6R8TngfhAHcNsAAE0Jr85O7oNTxdMW7Jr8OA2A0/jqeitUh0K/Y1R1E4w877haGoJoSaN/AfqLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077684; c=relaxed/simple;
	bh=s3XUC5ZWXM/K6AZRHhVnolJzEYw9WXvnLVdXiAdvz5Q=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lQyh+WzqGn+PktKfH3AbM/peqUa7Gmw+RlNIr/9aovKlYcGcsR6jwRoBZbPBXyZJsytJgTcWDt+hCqk0u+xjr4EVDlzZ14oxAkjus3twgZ3pRKkZDBcsAV21ppQvI25cIdEzF6k7jcFnBr2Kqk6cirlvER72Fk3ZJeMRXsZY2kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qabwE08b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qabwE08b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A704AC4CEEA;
	Mon, 16 Jun 2025 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750077683;
	bh=s3XUC5ZWXM/K6AZRHhVnolJzEYw9WXvnLVdXiAdvz5Q=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=qabwE08bVJjjWSGMq50QBauJ7yF9knCpiuVPJfQkNdn2DDIpPu6GGcqG6NFwHQcSb
	 GFElvnP1Wfcxj7q23tZUz12NVynchEbJOTUNFP58qWMYmSWWKAqrAHfi8kfMxroEyI
	 a2x8gLRxea55N5aZYb+w0YgIV3PkK3BDKPVXnlXOnr1Nz6LwZOuL4GRLdHYInXJP5t
	 +A9VUco1g4cexU21IIDpagAth45uTerO3v+hbL7EaLMiQG5OuLGnuMNuT4pq9kmd65
	 sblvF13BMjWc/wp7gSKljb++1FHLGUKrtUla2OEJg8T2PAdbKKv41ywAGKtV8UuBqX
	 NuIV7b5DtyXDQ==
Message-ID: <0f09a845-fbaf-4ddf-b684-a1182f85a9ff@kernel.org>
Date: Mon, 16 Jun 2025 20:41:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] f2fs: Apply bio flags to direct I/O
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250615144235.1836469-1-chullee@google.com>
 <20250615144235.1836469-2-chullee@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250615144235.1836469-2-chullee@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/25 22:42, Daniel Lee wrote:
> Bio flags like REQ_PRIO, REQ_META, and REQ_FUA, determined by
> f2fs_io_flags(), were not being applied to direct I/O (DIO) writes.
> This meant that DIO writes would not respect filesystem-level hints
> (for REQ_META/FUA) or inode-level hints (like F2FS_IOPRIO_WRITE).
> 
> This patch refactors f2fs_io_flags() to use a direct inode pointer
> instead of deriving it from a page. The function is then called from
> the DIO write path, ensuring that bio flags are handled consistently
> for both buffered and DIO writes.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>  fs/f2fs/data.c | 10 +++++-----
>  fs/f2fs/f2fs.h |  1 +
>  fs/f2fs/file.c | 11 +++++++++++
>  3 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..71dde494b892 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
>  	return 0;
>  }
>  
> -static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
> +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode)
>  {
>  	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
> -	struct folio *fio_folio = page_folio(fio->page);
>  	unsigned int fua_flag, meta_flag, io_flag;
>  	blk_opf_t op_flags = 0;
>  
> @@ -446,8 +445,8 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>  	if (BIT(fio->temp) & fua_flag)
>  		op_flags |= REQ_FUA;
>  
> -	if (fio->type == DATA &&
> -	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
> +	if (inode && fio->type == DATA &&
> +	    F2FS_I(inode)->ioprio_hint == F2FS_IOPRIO_WRITE)
>  		op_flags |= REQ_PRIO;
>  
>  	return op_flags;
> @@ -459,10 +458,11 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>  	struct block_device *bdev;
>  	sector_t sector;
>  	struct bio *bio;
> +	struct inode *inode = fio->page ? fio->page->mapping->host : NULL;

fio->page will always be true now? We can pass fio->page->mapping->host to f2fs_io_flags()
directly?

Thanks,

>  
>  	bdev = f2fs_target_device(sbi, fio->new_blkaddr, &sector);
>  	bio = bio_alloc_bioset(bdev, npages,
> -				fio->op | fio->op_flags | f2fs_io_flags(fio),
> +				fio->op | fio->op_flags | f2fs_io_flags(fio, inode),
>  				GFP_NOIO, &f2fs_bioset);
>  	bio->bi_iter.bi_sector = sector;
>  	if (is_read_io(fio->op)) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9333a22b9a01..3e02687c1b58 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3972,6 +3972,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
>  struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
>  		block_t blk_addr, sector_t *sector);
>  int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
> +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode);
>  void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>  void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>  int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 696131e655ed..3eb40d7bf602 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5015,6 +5015,17 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
>  	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
>  	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
>  
> +	/* if fadvise set to hot, override the temperature */
> +	struct f2fs_io_info fio = {
> +		.sbi = sbi,
> +		.type = DATA,
> +		.op = REQ_OP_WRITE,
> +		.temp = file_is_hot(inode) ? HOT : temp,
> +		.op_flags = bio->bi_opf,
> +		.page = NULL,
> +	};
> +	bio->bi_opf |= f2fs_io_flags(&fio, inode);
> +
>  	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
>  	submit_bio(bio);
>  }

