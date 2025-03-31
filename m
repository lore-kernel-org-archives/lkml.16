Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EF62033A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743399692; cv=none; b=S1w7tIqdPi6OE8zJulJtc69YFXE50iRdLhd4VWyqnYSJdhN1c/kBb0TQdyg7DFCoz8r+6TXn7xozerpAmR3ScEYXyEZQECrLghFf3Q0BHHH5xeObGKoLqhYg1QXhm70+WlWoaSFa8U74KPwapy9O53De6/gWY79m+DgJqaJMxDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743399692; c=relaxed/simple;
	bh=nx32tzfKZRETSu9i/nSiqKkG5dZFoR1Si3UZOHA8/sM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DqV4IY1HETS6aFK376RqhchKftOAsiXun67Kol/pLiYDya0nUcpZ2GXoxS+r1Jk61qO6gLT5+Wf9lfK0iKRT5o62+Q2EdUu+dPjYuDWfB40FUneV4Pk5RmR/Coj+wLj9ozxH2TiDMk0VKY3vVirW9+VFpvbmZHxjb/Bn73Y+/B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iriTtZ6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iriTtZ6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAB3C4CEE3;
	Mon, 31 Mar 2025 05:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743399691;
	bh=nx32tzfKZRETSu9i/nSiqKkG5dZFoR1Si3UZOHA8/sM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=iriTtZ6uzGsEXE3P1eTK+01eW0OnO+EmTY1R4UhFIYGA8sGn7RujfwlEqe+1FDrJa
	 gm+Lu8CD3nEDScoo9SuYYFMhwvwOfx4i2gqalqFbLfW0Evdn/69t3lldKw2JLaMBWG
	 DA4XLHzX+Jt3LKB5tdaRVldU8IUd/HaLhP2DO/SpsJC8V+5LxQFD8m/7BQYdZP1eSF
	 dYhExM1r8j8XQOZj5z+QCUCYhzxBJBydjwSslsAfZOG66KXmX4OZWIWzFKMrKfDHau
	 /N8EeIk3NO/dlfWUxQPMG7O0QE5dygO3uaKgfIBjJxY/t/RLuub7ot3AAIgBZ0c+xa
	 37aNKkczz7vfw==
Message-ID: <9b617cde-0dfd-4dc1-8dde-4fc3c8a7fe04@kernel.org>
Date: Mon, 31 Mar 2025 13:41:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [PATCH v2 1/2] f2fs: zone: fix to calculate first_zoned_segno
 correctly
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250325080646.3291947-1-chao@kernel.org>
 <Z-YXqKOIgYCpfuL0@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Z-YXqKOIgYCpfuL0@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/28/25 11:29, Jaegeuk Kim wrote:
> It seems this patch breaks the multi-partition cases.

Which case did you test w/ this patch?

Thanks,

> 
> On 03/25, Chao Yu wrote:
>> A zoned device can has both conventional zones and sequential zones,
>> so we should not treat first segment of zoned device as first_zoned_segno,
>> instead, we need to check zone type for each zone during traversing zoned
>> device to find first_zoned_segno.
>>
>> Otherwise, for below case, first_zoned_segno will be 0, which could be
>> wrong.
>>
>> create_null_blk 512 2 1024 1024
>> mkfs.f2fs -m /dev/nullb0
>>
>> Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
>> Cc: Daeho Jeong <daehojeong@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - traverse w/ zone unit in get_first_zoned_segno()
>>  fs/f2fs/f2fs.h    | 18 +++++++++++++-----
>>  fs/f2fs/segment.c |  2 +-
>>  fs/f2fs/super.c   | 37 +++++++++++++++++++++++++++++++++----
>>  3 files changed, 47 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index ca884e39a5ff..3dea037faa55 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4630,12 +4630,16 @@ F2FS_FEATURE_FUNCS(readonly, RO);
>>  F2FS_FEATURE_FUNCS(device_alias, DEVICE_ALIAS);
>>  
>>  #ifdef CONFIG_BLK_DEV_ZONED
>> -static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
>> -				    block_t blkaddr)
>> +static inline bool f2fs_zone_is_seq(struct f2fs_sb_info *sbi, int devi,
>> +							unsigned int zone)
>>  {
>> -	unsigned int zno = blkaddr / sbi->blocks_per_blkz;
>> +	return test_bit(zone, FDEV(devi).blkz_seq);
>> +}
>>  
>> -	return test_bit(zno, FDEV(devi).blkz_seq);
>> +static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
>> +								block_t blkaddr)
>> +{
>> +	return f2fs_zone_is_seq(sbi, devi, blkaddr / sbi->blocks_per_blkz);
>>  }
>>  #endif
>>  
>> @@ -4711,9 +4715,13 @@ static inline bool f2fs_valid_pinned_area(struct f2fs_sb_info *sbi,
>>  					  block_t blkaddr)
>>  {
>>  	if (f2fs_sb_has_blkzoned(sbi)) {
>> +#ifdef CONFIG_BLK_DEV_ZONED
>>  		int devi = f2fs_target_device_index(sbi, blkaddr);
>>  
>> -		return !bdev_is_zoned(FDEV(devi).bdev);
>> +		return !f2fs_blkz_is_seq(sbi, devi, blkaddr);
>> +#else
>> +		return true;
>> +#endif
>>  	}
>>  	return true;
>>  }
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 396ef71f41e3..dc360b4b0569 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3311,7 +3311,7 @@ int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
>>  
>>  	if (f2fs_sb_has_blkzoned(sbi) && err == -EAGAIN && gc_required) {
>>  		f2fs_down_write(&sbi->gc_lock);
>> -		err = f2fs_gc_range(sbi, 0, GET_SEGNO(sbi, FDEV(0).end_blk),
>> +		err = f2fs_gc_range(sbi, 0, sbi->first_zoned_segno - 1,
>>  				true, ZONED_PIN_SEC_REQUIRED_COUNT);
>>  		f2fs_up_write(&sbi->gc_lock);
>>  
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 011925ee54f8..9a42a1323f42 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -4307,12 +4307,33 @@ static void f2fs_record_error_work(struct work_struct *work)
>>  
>>  static inline unsigned int get_first_zoned_segno(struct f2fs_sb_info *sbi)
>>  {
>> +#ifdef CONFIG_BLK_DEV_ZONED
>> +	unsigned int zoneno, total_zones;
>>  	int devi;
>>  
>> -	for (devi = 0; devi < sbi->s_ndevs; devi++)
>> -		if (bdev_is_zoned(FDEV(devi).bdev))
>> -			return GET_SEGNO(sbi, FDEV(devi).start_blk);
>> -	return 0;
>> +	if (!f2fs_sb_has_blkzoned(sbi))
>> +		return NULL_SEGNO;
>> +
>> +	for (devi = 0; devi < sbi->s_ndevs; devi++) {
>> +		if (!bdev_is_zoned(FDEV(devi).bdev))
>> +			continue;
>> +
>> +		total_zones = GET_ZONE_FROM_SEG(sbi, FDEV(devi).total_segments);
>> +
>> +		for (zoneno = 0; zoneno < total_zones; zoneno++) {
>> +			unsigned int segs, blks;
>> +
>> +			if (!f2fs_zone_is_seq(sbi, devi, zoneno))
>> +				continue;
>> +
>> +			segs = GET_SEG_FROM_SEC(sbi,
>> +					zoneno * sbi->secs_per_zone);
>> +			blks = SEGS_TO_BLKS(sbi, segs);
>> +			return GET_SEGNO(sbi, FDEV(devi).start_blk + blks);
>> +		}
>> +	}
>> +#endif
>> +	return NULL_SEGNO;
>>  }
>>  
>>  static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>> @@ -4349,6 +4370,14 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>  #endif
>>  
>>  	for (i = 0; i < max_devices; i++) {
>> +		if (max_devices == 1) {
>> +			FDEV(i).total_segments =
>> +				le32_to_cpu(raw_super->segment_count_main);
>> +			FDEV(i).start_blk = 0;
>> +			FDEV(i).end_blk = FDEV(i).total_segments *
>> +						BLKS_PER_SEG(sbi);
>> +		}
>> +
>>  		if (i == 0)
>>  			FDEV(0).bdev_file = sbi->sb->s_bdev_file;
>>  		else if (!RDEV(i).path[0])
>> -- 
>> 2.48.1

