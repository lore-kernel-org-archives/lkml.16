Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01436EEBA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749775292; cv=none; b=LCDMSV/2eKpvHgP/lX0U4vB7JOUU0wDI77oRfjmcerde+ENVUXkYw+nzJVCnbNWZ8pDC1O+aLThWcBVde5w4HEhRxC40azQE+F4EyQqDAYAwOPRjNuTv/NPvwGyO7lIORIbOkuotbbeXyU4r5EPrgOw+Ll4zJRboM++WF8CQFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749775292; c=relaxed/simple;
	bh=h0dTag/f2Tf1Jb1EmZHoJhgiudzt8TPEN9QKw1XND5c=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GCbyxlhfk9+XCQvZQkRJj8/zdshzUuX2wMlpJlDeKGY617i38jPl5xFk6Q3j7q2a62T3z5zNuo3p4f5ZHYlTMvS/5ZGobrKVZuKlUd0iUP/YeJnHKFMtmuwT1Q1T7YiFxyrdmm54sgoFLRFm2M7MrARxRcPF22Ss5zUlE6SPGHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6SqmxmY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6SqmxmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FB7C4CEEA;
	Fri, 13 Jun 2025 00:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749775291;
	bh=h0dTag/f2Tf1Jb1EmZHoJhgiudzt8TPEN9QKw1XND5c=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=A6SqmxmYNzHDsNm47GY+Y9MGSWa4MKctOiMLbemix20NShU7NFsq9d4koWGl74TFN
	 9saNIwJVBVnYtNKIXIJQ/aq1Z7FvvxEOYO5lJMqGRIdGznOrVFxaAnxt4J0cBDElFJ
	 kFIHt7O14TzxxoBRtrCqyt79Eiiky6aW1Ksq9bCk0XpxOWnnvQcjlrO6+rm1V+lziM
	 hcKmBTEE2zmYsl3jQFLi+bsbbgAThi7tN/kwNBdwgL9H5ujWsznM4osnfmc05rcedp
	 uU6BpRKpNO80bWpVbWhWGbeC83RPTAquTiFoexkvOD5oPNIcTIL0OkKE9CpbtGp1bC
	 I6nM+c7ERz1vg==
Message-ID: <376f506f-becd-457a-8cad-294396acd1da@kernel.org>
Date: Fri, 13 Jun 2025 08:41:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] f2fs: Apply bio flags to direct I/O
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250611233706.572784-1-chullee@google.com>
 <20250611233706.572784-2-chullee@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250611233706.572784-2-chullee@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/12 7:37, Daniel Lee wrote:
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
>   fs/f2fs/data.c |  8 ++++----
>   fs/f2fs/f2fs.h |  2 ++
>   fs/f2fs/file.c | 12 ++++++++++++
>   3 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..966cea75874c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
>   	return 0;
>   }
>   
> -static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
> +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>   {
>   	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
> -	struct folio *fio_folio = page_folio(fio->page);
>   	unsigned int fua_flag, meta_flag, io_flag;
>   	blk_opf_t op_flags = 0;
>   
> @@ -446,8 +445,8 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>   	if (BIT(fio->temp) & fua_flag)
>   		op_flags |= REQ_FUA;
>   
> -	if (fio->type == DATA &&
> -	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
> +	if (fio->inode && fio->type == DATA &&

It seems that it changes the logic, if fio->inode is NULL we will not tag
op_flags w/ REQ_PRIO, path like GC? do we need to assign fio.inode for all
paths?

Thanks,

> +	    F2FS_I(fio->inode)->ioprio_hint == F2FS_IOPRIO_WRITE)
>   		op_flags |= REQ_PRIO;
>   
>   	return op_flags;
> @@ -2783,6 +2782,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>   	int err = 0;
>   	struct f2fs_io_info fio = {
>   		.sbi = sbi,
> +		.inode = inode,
>   		.ino = inode->i_ino,
>   		.type = DATA,
>   		.op = REQ_OP_WRITE,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9333a22b9a01..162d79a3c1a5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1233,6 +1233,7 @@ enum iostat_type {
>   
>   struct f2fs_io_info {
>   	struct f2fs_sb_info *sbi;	/* f2fs_sb_info pointer */
> +	struct inode *inode;
>   	nid_t ino;		/* inode number */
>   	enum page_type type;	/* contains DATA/NODE/META/META_FLUSH */
>   	enum temp_type temp;	/* contains HOT/WARM/COLD */
> @@ -3972,6 +3973,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
>   struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
>   		block_t blk_addr, sector_t *sector);
>   int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
> +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio);
>   void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>   void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>   int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 696131e655ed..4fd45e94661a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5015,6 +5015,18 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
>   	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
>   	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
>   
> +	/* if fadvise set to hot, override the temperature */
> +	struct f2fs_io_info fio = {
> +		.sbi = sbi,
> +		.inode = inode,
> +		.type = DATA,
> +		.op = REQ_OP_WRITE,
> +		.temp = file_is_hot(inode) ? HOT : temp,
> +		.op_flags = bio->bi_opf,
> +		.page = NULL,
> +	};
> +	bio->bi_opf |= f2fs_io_flags(&fio);
> +
>   	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
>   	submit_bio(bio);
>   }

