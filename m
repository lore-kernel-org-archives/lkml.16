Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EFC1DF268
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780229; cv=none; b=cAkGJo3Q12ZvuefyppC6D484PdSZPAGo3MzLh+7570DfHMFvJAg6+vJ42BoAlBRNlGz2cGxc5YIxElk27paG5W5rnb3IyUcB4IZ1pUoKGs46Ixy1DFKYsOiVSs2zhlYkVeXzMeAfCSN2vVzfcAr5gEmOGlvbSKB8zuBWJgDL8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780229; c=relaxed/simple;
	bh=UnuiMvv2qT4ZiuTEM8kZHCDtaTkh8edE77nGTAnIBJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iIdFPkUOheH5hZp9TVheZV5vya5O27O1F6UyzZm9j/HmzAwp4zrUxt2ByF/9L4Gz29Qy8IQVdSlTXFij1cPqgaQtKrVgLBIzinB2aK71j422g4obpBy3EWLSooZQxcFvRV1AxrCNyB9quvL9vG2Pzh7667TDqtMsEeY8Y3GIEyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bJN152D8TzYl1kD;
	Fri, 13 Jun 2025 10:01:29 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Jun
 2025 10:03:38 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Jun
 2025 10:03:37 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
CC: <bo.wu@vivo.com>, <chao@kernel.org>, <feng.han@honor.com>,
	<jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>, <wangzijie1@honor.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section when gc happens EAGAIN
Date: Fri, 13 Jun 2025 10:03:37 +0800
Message-ID: <20250613020337.1849245-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7e5f3327-59c6-4c40-a3bf-3b847183f30d@kernel.org>
References: <7e5f3327-59c6-4c40-a3bf-3b847183f30d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a011.hihonor.com
 (10.68.31.243)

>On 2025/6/12 20:34, wangzijie wrote:
>>> On 6/12/25 11:27, wangzijie wrote:
>>>> Wu Bo once mentioned a fallocate fail scenario in this link[1].
>>>> After commit 3fdd89b452c2("f2fs: prevent writing without fallocate()
>>>> for pinned files"), we cannot directly generate 4K size file and
>>>> pin it, but we can still generate non-segment aligned pinned file:
>>>>
>>>> touch test_file
>>>> ./f2fs_io pinfile set test_file
>>>> ./f2fs_io fallocate 0 0 8192 test_file
>>>> truncate -s 4096 test_file
>>>
>>> Well, shouldn't we avoid such case by adding check condition in setattr?
>> 
>> Maybe like this?
>> 
>> ---
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 6bd3de64f..2f6537d9c 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1027,6 +1027,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>   	struct inode *inode = d_inode(dentry);
>>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>>   	int err;
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> +	block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
>>   
>>   	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>>   		return -EIO;
>> @@ -1047,6 +1049,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>   			!IS_ALIGNED(attr->ia_size,
>>   			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>   			return -EINVAL;
>> +		if (f2fs_is_pinned_file(inode) &&
>> +			attr->ia_size < i_size_read(inode) &&
>> +			!IS_ALIGNED(attr->ia_size,
>> +			F2FS_BLK_TO_BYTES(sec_blks)));
>> +			return -EINVAL;
>>   	}
>
>I think so, can you please send a formal patch?

OK, I will send a formal patch later.

>>   
>>   	err = setattr_prepare(idmap, dentry, attr);
>> ---
>> 
>>>>
>>>> By doing this, pin+fallocate failure(gc happens EAGAIN but f2fs shows
>>>> enough spare space) may occurs.
>>>>
>>>>  From message in commit 2e42b7f817ac("f2fs: stop allocating pinned sections
>>>> if EAGAIN happens"), gc EAGAIN doesn't guarantee a free section, so we stop
>>>> allocating. But after commit 48ea8b200414 ("f2fs: fix to avoid panic once
>>>> fallocation fails for pinfile"), we have a way to avoid panic caused by
>>>> concurrent pinfile allocation run out of free section, so I think that we
>>>> can continue to allocate pinned section when gc happens EAGAIN. Even if we
>>>> don't have free section, f2fs_allocate_pinning_section() can fail with ENOSPC.
>>>
>>> What do you think of introduce /sys/fs/f2fs/<dev>/reserved_pin_section to
>>> tune @needed parameter of has_not_enough_free_secs()? If we configure it
>>> w/ zero, it can avoid f2fs_gc() before preallocation.
>>>
>>> ---
>>>   fs/f2fs/f2fs.h  | 3 +++
>>>   fs/f2fs/file.c  | 5 ++---
>>>   fs/f2fs/super.c | 3 +++
>>>   fs/f2fs/sysfs.c | 9 +++++++++
>>>   4 files changed, 17 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 785537576aa8..ffb15da570d7 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -1731,6 +1731,9 @@ struct f2fs_sb_info {
>>>   	/* for skip statistic */
>>>   	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
>>>
>>> +	/* free sections reserved for pinned file */
>>> +	unsigned int reserved_pin_section;
>>> +
>>>   	/* threshold for gc trials on pinned files */
>>>   	unsigned short gc_pin_file_threshold;
>>>   	struct f2fs_rwsem pin_sem;
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 696131e655ed..a909f79db178 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>>>   			}
>>>   		}
>>>
>>> -		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
>>> -			ZONED_PIN_SEC_REQUIRED_COUNT :
>>> -			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
>>> +		if (has_not_enough_free_secs(sbi, 0,
>>> +				sbi->reserved_pin_section)) {
>>>   			f2fs_down_write(&sbi->gc_lock);
>>>   			stat_inc_gc_call_count(sbi, FOREGROUND);
>>>   			err = f2fs_gc(sbi, &gc_control);
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 57adeff5ef25..48b97a95fd63 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>>   	sbi->last_valid_block_count = sbi->total_valid_block_count;
>>>   	sbi->reserved_blocks = 0;
>>>   	sbi->current_reserved_blocks = 0;
>>> +	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
>>> +			ZONED_PIN_SEC_REQUIRED_COUNT :
>>> +			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
>>>   	limit_reserve_root(sbi);
>>>   	adjust_unusable_cap_perc(sbi);
>>>
>>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>>> index 75134d69a0bd..51be7ffb38c5 100644
>>> --- a/fs/f2fs/sysfs.c
>>> +++ b/fs/f2fs/sysfs.c
>>> @@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>>>   		return count;
>>>   	}
>>>
>>> +	if (!strcmp(a->attr.name, "reserved_pin_section")) {
>>> +		if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
>>> +			return -EINVAL;
>>> +		*ui = (unsigned int)t;
>>> +		return count;
>>> +	}
>>> +
>>>   	*ui = (unsigned int)t;
>>>
>>>   	return count;
>>> @@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
>>>   F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>>>   #endif
>>>   F2FS_SBI_GENERAL_RW_ATTR(carve_out);
>>> +F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
>>>
>>>   /* STAT_INFO ATTR */
>>>   #ifdef CONFIG_F2FS_STAT_FS
>>> @@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
>>>   	ATTR_LIST(last_age_weight),
>>>   	ATTR_LIST(max_read_extent_count),
>>>   	ATTR_LIST(carve_out),
>>> +	ATTR_LIST(reserved_pin_section),
>>>   	NULL,
>>>   };
>>>   ATTRIBUTE_GROUPS(f2fs);
>>> -- 
>>> 2.49.0
>> 
>> I think it's a good way to solve this problem. Thank you!
>
>Sent a formal patch w/ below link. :)
>
>https://lore.kernel.org/linux-f2fs-devel/20250612140526.6435-1-chao@kernel.org
>
>Thanks,

Thanks, I'll take a look at it.

>> 
>> 
>>>>
>>>> [1] https://lore.kernel.org/linux-f2fs-devel/20231030094024.263707-1-bo.wu@vivo.com/t/#u
>>>>
>>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>>> ---
>>>>   fs/f2fs/file.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index 6bd3de64f..05c80d2b5 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -1859,7 +1859,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>>>>   			f2fs_down_write(&sbi->gc_lock);
>>>>   			stat_inc_gc_call_count(sbi, FOREGROUND);
>>>>   			err = f2fs_gc(sbi, &gc_control);
>>>> -			if (err && err != -ENODATA) {
>>>> +			if (err && err != -ENODATA && err != -EAGAIN) {
>>>>   				f2fs_up_write(&sbi->pin_sem);
>>>>   				goto out_err;
>>>>   			}
>>>
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>> 
>
>
>
>_______________________________________________
>Linux-f2fs-devel mailing list
>Linux-f2fs-devel@lists.sourceforge.net
>https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

