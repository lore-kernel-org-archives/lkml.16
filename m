Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B916E86348
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607641; cv=none; b=on3+kfsvKG2rImbhSNYJnalXj4NtENK5a1xsoCwbf82KTCXQcWd9uZ5xMhmg9XXCKwXdsoZ3E4GfsGvnCDLCtybTXqbDbMlqMQxPQsr3bM12NIyZCKZub9RDYJhdp45BbP/9bD9nCAj3dmhZXBjzE9DZBK+z2gcNEJnRixFx5R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607641; c=relaxed/simple;
	bh=skT+jm/I1+s3qJ/34RV3f3ESCZC3ZUA97zf2RRElj5k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bsO8qyCUeAFDegBisY9rgWnb4pm7+A9oBg/0xuTJ2Zn85Y9gUWSzGJPBAevmB6Za9U2jucNqWrxNY/jBTQNcVPBetAd2CPu0o0+ppzx1bRktnVTImOde+raZ29a0qvaVk3uemWX7GCOStE4Qo6LSeL8snygbevHTPn7gd9YBgn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TD4vV4Xg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TD4vV4Xg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCD4C4CEE7;
	Wed,  7 May 2025 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746607639;
	bh=skT+jm/I1+s3qJ/34RV3f3ESCZC3ZUA97zf2RRElj5k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=TD4vV4Xgx+V5MEtMgOEy0PdEFx09x2DRlJqCkaA3Mh8vg2K6GFC8ezzMi19DEZl/2
	 o5Rr4i1ap3cA6KIQeDBLCQATn1OLrKxq8bfI3Nm1CTvQcC/SoWUulYHtAJEpeUFd6C
	 9p3gaABnGP5gBrHCwUvjF0E0IrbfmcmJ5YlzjIvlGOq8hrI9AbccSsZHQJnQ+k9tU0
	 lcwt5mTS4A1hOW8Un8J70iAg6pEKSzxPoC3oXDPWHrL7S8lh+HTAGECjDPUvvYI6p6
	 A0AD+OBZspMWoj/EqanpgdlQ/QYxrdf8nNJDc7wvYr7As9wzuMewQQH/YBjOr7a+QH
	 kFJYrYskicXtw==
Message-ID: <c6714296-6dee-429e-8aa7-897fbf657231@kernel.org>
Date: Wed, 7 May 2025 16:47:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v3 2/2] f2fs: add ckpt_valid_blocks to the section entry
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250507043038.591-1-yohan.joung@sk.com>
 <20250507043038.591-2-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250507043038.591-2-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 12:30, yohan.joung wrote:
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
>  fs/f2fs/segment.c | 29 ++++++++++++++++++++++-------
>  fs/f2fs/segment.h | 29 ++++++++++++++++++-----------
>  2 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 671bc5a8fd4a..09b66a755559 100644
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
> @@ -2492,15 +2492,18 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>  				f2fs_test_and_clear_bit(offset + i, se->discard_map))
>  			sbi->discard_blks++;
>  
> -		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
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
> @@ -2533,12 +2536,18 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>  	 * or newly invalidated.
>  	 */
>  	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> -		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
> +		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
>  			se->ckpt_valid_blocks++;
> +			if (__is_large_section(sbi))
> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;

What about adding sanity_check_valid_blocks() to check consistency between
valid blocks of segments and valid blocks of section? Covered w/
CONFIG_F2FS_CHECK_FS.

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
> @@ -2569,9 +2578,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
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
> @@ -5029,6 +5038,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	}
>  	up_read(&curseg->journal_rwsem);
>  
> +	/* update ckpt_ckpt_valid_block */
> +	if (__is_large_section(sbi)) {
> +		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))

		unsigned int segno;

		for (segno = 0; segno < MAIN_SEGS(sbi);
					segno += SEGS_PER_SEC(sbi))

> +			set_ckpt_valid_blocks(sbi, segno);

ckpt_valid_blocks will be reset in f2fs_flush_sit_entries -> seg_info_to_raw_sit,
we need to call set_ckpt_valid_blocks() for each updated section?

Thanks,

> +	}
> +
>  	if (err)
>  		return err;
>  
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index f5d30f32ebdb..e91d944f003a 100644
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
> @@ -347,20 +348,26 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
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
>  static inline void seg_info_from_raw_sit(struct seg_entry *se,

