Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1391953A1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697132; cv=none; b=UQ3lVrPuTgD8SwrSZCUOvGukQVQ/cSCUjzvASCCpDijjiRUIflAGznRCoq4uwj/SV4+4qko1FfRUDgfrGFE/KTAdNFVU+MP00OBwdo6tRpiyp8EWcDUcp94yw7zUkv0qwcUVdjqwTf7tVi+Ix4Wrjgk7eeUGsU4n0uiqB5iHADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697132; c=relaxed/simple;
	bh=CMtqZ6TweDxC1ofKfV/gsvJjiOj2ZQ7+zmKfVa08o8A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EDJqW5FVRexvHefLOEMDv1eGCpHdSTTI+3tPuwuAoPZhyEiXO+OJMnKb33Uf7aGecpPnz6CCvpAuHlfA2U5TtCY2hAmHG6c9tB0UeA8HvtjaoxwybkKJYE1NW+rXYIn6a75K7xr7Kml9IARy8n71XGcwQ7tHlxad7K+eTJigT2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dj3uPPSj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dj3uPPSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41157C4CEE7;
	Thu,  8 May 2025 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746697131;
	bh=CMtqZ6TweDxC1ofKfV/gsvJjiOj2ZQ7+zmKfVa08o8A=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=dj3uPPSjuycussZoOtT39zkxoek6dah6ne/0VZDQ/4Ey+CXdJuryxiRFda6aiylEb
	 vZ/mHBFubHNSqRwAk0GQPuoyBBee7ImPal6g5xL+DZGfgSFsfHQE+5UCpyLqZc1mz7
	 +aoKrMR6teJrb1u1IDjQZWGat/wCtnqBcLHd6waHUXKn+Y6DUcBEZU84LXGidWBZ92
	 J7IUvZGH8EyKYO3kE//RnN5h+nMI4RiE00rdWL6g+3LB6yTcaWAQpj1rg9F292MAwx
	 maWfFr/nCa+1EjDWX8VnqZ8diYOhZXR9JSkiOOSiBTtaU0ue5j/8GwO2MofBwCzA7u
	 E10qUv+nuQMSA==
Message-ID: <81348540-e3aa-4907-94cd-df0c408e66e0@kernel.org>
Date: Thu, 8 May 2025 17:38:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v4 2/2] f2fs: add ckpt_valid_blocks to the section entry
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250508074756.693-1-yohan.joung@sk.com>
 <20250508074756.693-2-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250508074756.693-2-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 15:47, yohan.joung wrote:
> when performing buffered writes in a large section,
> overhead is incurred due to the iteration through
> ckpt_valid_blocks within the section.
> when SEGS_PER_SEC is 128, this overhead accounts for 20% within
> the f2fs_write_single_data_page routine.
> as the size of the section increases, the overhead also grows.
> to handle this problem ckpt_valid_blocks is
> added within the section entries.
> 
> Test
> insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
> hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
> make_f2fs /dev/block/nullb0
> make_f2fs -s 128 /dev/block/nullb0
> fio --bs=512k --size=1536M --rw=write --name=1
> --filename=/mnt/test_dir/seq_write
> --ioengine=io_uring --iodepth=64 --end_fsync=1
> 
> before
> SEGS_PER_SEC 1
> 2556MiB/s
> SEGS_PER_SEC 128
> 2145MiB/s
> 
> after
> SEGS_PER_SEC 1
> 2556MiB/s
> SEGS_PER_SEC 128
> 2556MiB/s
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/segment.c | 41 +++++++++++++++++++++++++++++-------
>  fs/f2fs/segment.h | 53 +++++++++++++++++++++++++++++++++++++----------
>  2 files changed, 76 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 671bc5a8fd4a..7a53f2d8a474 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2447,7 +2447,7 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
>   * that the consecutive input blocks belong to the same segment.
>   */
>  static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
> -				block_t blkaddr, unsigned int offset, int del)
> +				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
>  {
>  	bool exist;
>  #ifdef CONFIG_F2FS_CHECK_FS
> @@ -2492,15 +2492,22 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>  				f2fs_test_and_clear_bit(offset + i, se->discard_map))
>  			sbi->discard_blks++;
>  
> -		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
> +#ifdef CONFIG_F2FS_CHECK_FS
> +		if (__is_large_section(sbi))
> +			sanity_check_valid_blocks(sbi, segno);
> +#endif
> +		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
>  			se->ckpt_valid_blocks -= 1;
> +			if (__is_large_section(sbi))
> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
> +		}
>  	}
>  
>  	return del;
>  }
>  
>  static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
> -				block_t blkaddr, unsigned int offset, int del)
> +				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
>  {
>  	bool exist;
>  #ifdef CONFIG_F2FS_CHECK_FS
> @@ -2532,13 +2539,23 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>  	 * SSR should never reuse block which is checkpointed
>  	 * or newly invalidated.
>  	 */
> +#ifdef CONFIG_F2FS_CHECK_FS
> +	if (__is_large_section(sbi))
> +		sanity_check_valid_blocks(sbi, segno);
> +#endif

How about doing sanity check after ckpt_valid_blocks update?

>  	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> -		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
> +		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
>  			se->ckpt_valid_blocks++;
> +			if (__is_large_section(sbi))
> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
> +		}
>  	}
>  
> -	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
> +	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
>  		se->ckpt_valid_blocks += del;
> +		if (__is_large_section(sbi))
> +			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
> +	}
>  
>  	return del;
>  }
> @@ -2569,9 +2586,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  
>  	/* Update valid block bitmap */
>  	if (del > 0) {
> -		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
> +		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
>  	} else {
> -		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
> +		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
>  	}
>  
>  	__mark_sit_entry_dirty(sbi, segno);
> @@ -4700,12 +4717,16 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  					&sit_in_journal(journal, offset));
>  				check_block_count(sbi, segno,
>  					&sit_in_journal(journal, offset));
> +				if (__is_large_section(sbi))
> +					set_ckpt_valid_blocks(sbi, segno);
>  			} else {
>  				sit_offset = SIT_ENTRY_OFFSET(sit_i, segno);
>  				seg_info_to_raw_sit(se,
>  						&raw_sit->entries[sit_offset]);
>  				check_block_count(sbi, segno,
>  						&raw_sit->entries[sit_offset]);
> +				if (__is_large_section(sbi))
> +					set_ckpt_valid_blocks(sbi, segno);
>  			}

Move here for cleanup?

if (__is_large_section(sbi))
	set_ckpt_valid_blocks(sbi, segno);

How about adding sanity check here as well?

>  
>  			__clear_bit(segno, bitmap);
> @@ -5029,6 +5050,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	}
>  	up_read(&curseg->journal_rwsem);
>  
> +	/* update ckpt_ckpt_valid_block */
> +	if (__is_large_section(sbi)) {
> +		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))

Let's keep the style of defining variable outside of 'for' statement.

> +			set_ckpt_valid_blocks(sbi, segno);
> +	}

do sanity check here?

> +
>  	if (err)
>  		return err;
>  
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 5777b385e7d2..ebc90d3cb57c 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -211,6 +211,7 @@ struct seg_entry {
>  
>  struct sec_entry {
>  	unsigned int valid_blocks;	/* # of valid blocks in a section */
> +	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
>  };
>  
>  #define MAX_SKIP_GC_COUNT			16
> @@ -347,22 +348,52 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
>  static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
>  				unsigned int segno, bool use_section)
>  {
> -	if (use_section && __is_large_section(sbi)) {
> -		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> -		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> -		unsigned int blocks = 0;
> -		int i;
> +	if (use_section && __is_large_section(sbi))
> +		return get_sec_entry(sbi, segno)->ckpt_valid_blocks;
> +	else
> +		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> +}
> +
> +static inline void set_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
> +		unsigned int segno)
> +{
> +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> +	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> +	unsigned int blocks = 0;
> +	int i;
>  
> -		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
> -			struct seg_entry *se = get_seg_entry(sbi, start_segno);
> +	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
> +		struct seg_entry *se = get_seg_entry(sbi, start_segno);
>  
> -			blocks += se->ckpt_valid_blocks;
> -		}
> -		return blocks;
> +		blocks += se->ckpt_valid_blocks;
>  	}
> -	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> +	get_sec_entry(sbi, segno)->ckpt_valid_blocks = blocks;
>  }
>  
> +#ifdef CONFIG_F2FS_CHECK_FS
> +static inline void sanity_check_valid_blocks(struct f2fs_sb_info *sbi,
> +		unsigned int segno)
> +{
> +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> +	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> +	unsigned int blocks = 0;
> +	int i;
> +
> +	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
> +		struct seg_entry *se = get_seg_entry(sbi, start_segno);
> +
> +		blocks += se->ckpt_valid_blocks;
> +	}
> +
> +	if (blocks != get_sec_entry(sbi, segno)->ckpt_valid_blocks) {
> +		f2fs_err(sbi,
> +			"Inconsistent ckpt valid blocks: "
> +			"seg entry(%d) vs sec entry(%d) at secno %d",
> +			blocks, get_sec_entry(sbi, segno)->ckpt_valid_blocks, secno);
> +		f2fs_bug_on(sbi, 1);
> +	}
> +}
> +#endif

#else
static inline void sanity_check_valid_blocks(struct f2fs_sb_info *sbi,
			unsigned int segno)
{
}
#endif

Then we don't need to cover sanity_check_valid_blocks() invoking w/
CONFIG_F2FS_CHECK_FS.

Thanks,

>  static inline void seg_info_from_raw_sit(struct seg_entry *se,
>  					struct f2fs_sit_entry *rs)
>  {

