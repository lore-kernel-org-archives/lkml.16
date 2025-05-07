Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581E0228CA3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608604; cv=none; b=m8ACYRu8oKHK+E7+g8yY29Ak0V8hIJzqsi1frPQEalOGLV4RM3N6/wI58iQgFilbNGGfJh2QRX/oxdhrItD/hSEPnHR4hLhsGtYaEMner4u3tqgSle74Wt/ZgqA+MHUgMMnj6FGneESyLetINehT0pXm3btxcYd6YfV3X75TBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608604; c=relaxed/simple;
	bh=PLZeybt/XohGjl5sd7/WV8Skq0IZO7/V8TJUmOWY8Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQU2TC6nDidObAdABXhrSBmCNL8JA9SBg6Do2QlG4fkzrLYfQ5ioBOP0huljjLiAIYq25gxXXL8YYS2kUxkES9sSlC5iVSldBlD+7mu1FGIazM/Aa9M9XUmaAjeUnIYXXpGxpXnSBr2RUfFtQQPyQcLsqhZQIIrSTo4Dp8krPPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-81-681b21d2637c
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: chao@kernel.org,
	daehojeong@google.com,
	jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: add ckpt_valid_blocks to the section entry
Date: Wed,  7 May 2025 18:03:12 +0900
Message-ID: <20250507090312.614-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <c6714296-6dee-429e-8aa7-897fbf657231@kernel.org>
References: <c6714296-6dee-429e-8aa7-897fbf657231@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsXC9ZZnoe4lRekMgxtvZSxOTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErozF
	P9YwFawxrbjaNIm1gXGHdhcjJ4eEgInEkudt7DD2xvV7WUBsNgENiT+9vcwgtoiAlsTEhr+M
	XYxcHMwCfYwSE39cZgNJCAuES7w7PQ2sgUVAVaKt4xVYA6+AqcSk+x1MEEM1JXZ8OQ9mcwrY
	SUyYeJIRxBYSsJXY8/EbE0S9oMTJmU/A5jALyEs0b53NDLJMQqCDTeJ5wzdWiEGSEgdX3GCZ
	wMg/C0nPLCQ9CxiZVjGKZOaV5SZm5hjrFWdnVOZlVugl5+duYgSG5LLaP5E7GL9dCD7EKMDB
	qMTDe+CnZIYQa2JZcWXuIUYJDmYlEd7794FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY2+lacI
	CaQnlqRmp6YWpBbBZJk4OKUaGN3r423bgsr+rlZl3b/59kT2CMW+tbFXLwi5J/EIiV1wbf8d
	LXH/KsPk/qALllnX8heENn+1nPh54qXDresvlKj76x8q4RG/lMW3wrFp3jXZzvlhieUXbHol
	i+PLInkWXbgR/2yL57pCndovz3WDX/x0rO7Te5zKdL8hWKTvkn/+S+ksAf+FSizFGYmGWsxF
	xYkAujcmh0UCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsXCNUNlju4lRekMg027RCxOTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFgU6nHplWdbB67F3xm8vh228Pj8ya5ANYo
	LpuU1JzMstQifbsErozFP9YwFawxrbjaNIm1gXGHdhcjJ4eEgInExvV7WUBsNgENiT+9vcwg
	toiAlsTEhr+MXYxcHMwCfYwSE39cZgNJCAuES7w7PQ2sgUVAVaKt4xVYA6+AqcSk+x1MEEM1
	JXZ8OQ9mcwrYSUyYeJIRxBYSsJXY8/EbE0S9oMTJmU/A5jALyEs0b53NPIGRZxaS1CwkqQWM
	TKsYRTLzynITM3PM9IqzMyrzMiv0kvNzNzECg2xZ7Z9JOxi/XXY/xCjAwajEw3vgp2SGEGti
	WXFl7iFGCQ5mJRHe+/eBQrwpiZVVqUX58UWlOanFhxilOViUxHm9wlMThATSE0tSs1NTC1KL
	YLJMHJxSDYyMPFFNW1auf7r4a8ZezmcmacdmmTPs3aSUL6q06WLf6ii1T7ZnHwt9zr4wp96v
	JubkiR8ZvZ7XyqtM36wtjF1y1vPTowtcN9ctDtg4P8dafAFbn+uEc/92HN76Sun+j3u7ur3f
	Nj91aTou+cH4pde9T6UxTH8Z9hl/1/5+nkOJYft1X7HSD/vllFiKMxINtZiLihMBpU8Zsi4C
	AAA=
X-CFilter-Loop: Reflected

>On 5/7/25 12:30, yohan.joung wrote:
>> when performing buffered writes in a large section,
>> overhead is incurred due to the iteration through
>> ckpt_valid_blocks within the section.
>> when SEGS_PER_SEC is 128, this overhead accounts for 20% within
>> the f2fs_write_single_data_page routine.
>> as the size of the section increases, the overhead also grows.
>> to handle this problem ckpt_valid_blocks is
>> added within the section entries.
>> 
>> Test
>> insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
>> hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
>> make_f2fs /dev/block/nullb0
>> make_f2fs -s 128 /dev/block/nullb0
>> fio --bs=512k --size=1536M --rw=write --name=1
>> --filename=/mnt/test_dir/seq_write
>> --ioengine=io_uring --iodepth=64 --end_fsync=1
>> 
>> before
>> SEGS_PER_SEC 1
>> 2556MiB/s
>> SEGS_PER_SEC 128
>> 2145MiB/s
>> 
>> after
>> SEGS_PER_SEC 1
>> 2556MiB/s
>> SEGS_PER_SEC 128
>> 2556MiB/s
>> 
>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>> ---
>>  fs/f2fs/segment.c | 29 ++++++++++++++++++++++-------
>>  fs/f2fs/segment.h | 29 ++++++++++++++++++-----------
>>  2 files changed, 40 insertions(+), 18 deletions(-)
>> 
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 671bc5a8fd4a..09b66a755559 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -2447,7 +2447,7 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
>>   * that the consecutive input blocks belong to the same segment.
>>   */
>>  static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
>> -				block_t blkaddr, unsigned int offset, int del)
>> +				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
>>  {
>>  	bool exist;
>>  #ifdef CONFIG_F2FS_CHECK_FS
>> @@ -2492,15 +2492,18 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>>  				f2fs_test_and_clear_bit(offset + i, se->discard_map))
>>  			sbi->discard_blks++;
>>  
>> -		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
>> +		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
>>  			se->ckpt_valid_blocks -= 1;
>> +			if (__is_large_section(sbi))
>> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
>> +		}
>>  	}
>>  
>>  	return del;
>>  }
>>  
>>  static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
>> -				block_t blkaddr, unsigned int offset, int del)
>> +				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
>>  {
>>  	bool exist;
>>  #ifdef CONFIG_F2FS_CHECK_FS
>> @@ -2533,12 +2536,18 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>>  	 * or newly invalidated.
>>  	 */
>>  	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
>> -		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
>> +		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
>>  			se->ckpt_valid_blocks++;
>> +			if (__is_large_section(sbi))
>> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
>
>What about adding sanity_check_valid_blocks() to check consistency between
>valid blocks of segments and valid blocks of section? Covered w/
>CONFIG_F2FS_CHECK_FS.
I will add it, thanks
>
>> +		}
>>  	}
>>  
>> -	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
>> +	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
>>  		se->ckpt_valid_blocks += del;
>> +		if (__is_large_section(sbi))
>> +			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
>> +	}
>>  
>>  	return del;
>>  }
>> @@ -2569,9 +2578,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>>  
>>  	/* Update valid block bitmap */
>>  	if (del > 0) {
>> -		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
>> +		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
>>  	} else {
>> -		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
>> +		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
>>  	}
>>  
>>  	__mark_sit_entry_dirty(sbi, segno);
>> @@ -5029,6 +5038,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>>  	}
>>  	up_read(&curseg->journal_rwsem);
>>  
>> +	/* update ckpt_ckpt_valid_block */
>> +	if (__is_large_section(sbi)) {
>> +		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
>
>		unsigned int segno;
>
>		for (segno = 0; segno < MAIN_SEGS(sbi);
>					segno += SEGS_PER_SEC(sbi))
>
>> +			set_ckpt_valid_blocks(sbi, segno);
>
>ckpt_valid_blocks will be reset in f2fs_flush_sit_entries -> seg_info_to_raw_sit,
>we need to call set_ckpt_valid_blocks() for each updated section?
>
>Thanks,
going to add set_ckpt_valid_blocks to seg_info_to_raw_sit
Thanks.
>
>> +	}
>> +
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index f5d30f32ebdb..e91d944f003a 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -211,6 +211,7 @@ struct seg_entry {
>>  
>>  struct sec_entry {
>>  	unsigned int valid_blocks;	/* # of valid blocks in a section */
>> +	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
>>  };
>>  
>>  #define MAX_SKIP_GC_COUNT			16
>> @@ -347,20 +348,26 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
>>  static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
>>  				unsigned int segno, bool use_section)
>>  {
>> -	if (use_section && __is_large_section(sbi)) {
>> -		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>> -		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>> -		unsigned int blocks = 0;
>> -		int i;
>> +	if (use_section && __is_large_section(sbi))
>> +		return get_sec_entry(sbi, segno)->ckpt_valid_blocks;
>> +	else
>> +		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>> +}
>> +
>> +static inline void set_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
>> +		unsigned int segno)
>> +{
>> +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>> +	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>> +	unsigned int blocks = 0;
>> +	int i;
>>  
>> -		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
>> -			struct seg_entry *se = get_seg_entry(sbi, start_segno);
>> +	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
>> +		struct seg_entry *se = get_seg_entry(sbi, start_segno);
>>  
>> -			blocks += se->ckpt_valid_blocks;
>> -		}
>> -		return blocks;
>> +		blocks += se->ckpt_valid_blocks;
>>  	}
>> -	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>> +	get_sec_entry(sbi, segno)->ckpt_valid_blocks = blocks;
>>  }
>>  
>>  static inline void seg_info_from_raw_sit(struct seg_entry *se,
