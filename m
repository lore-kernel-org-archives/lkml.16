Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0A426B751
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804542; cv=none; b=Z3oSkDw2oMGXanCzhZBMhAxPS9EV8ZaAFBz1nA8hfrkdRVgOvlTX381Ho9d5WLurG9zadAyw9eT+QgNvxVcYma9J8OnYiluWCFIcbZ16yM4ib9sBfEECtlrlYygm2K7JR9ZRpbtohqa01VqxhnVF8i9Vqe64wtjSHgbRT/JzVpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804542; c=relaxed/simple;
	bh=u7x16W5kMhuO8mP73I83fX0Qfs/D8SHE0KX4Q48Oks4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CtLwRz57fFHbBQWBGPVoo+ONjdCFUvw5gX/nrsOd6LkfVY56xOCDya/98KNX5GZF3xoXSJuV2cx1tIZcvKrFRBgDXmGoiX2cwloAEAO1qiqygWV60ZTOtrFBqLLRKVavFzwwvBO2IUMJ7Z17BWxj5UYGoVudHmLepOOVqbIqRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9KNX1ky; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9KNX1ky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2679BC4CEE3;
	Fri, 13 Jun 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749804541;
	bh=u7x16W5kMhuO8mP73I83fX0Qfs/D8SHE0KX4Q48Oks4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=u9KNX1kyhxLrcRKV+BaqoAHpw8g08yiQNw6sCBxBOcU/6FRYDtY1+vAzEE7lwOSnt
	 12MYGMa17cjhZNQX+0Qr1FzeSN0rxo3/5Mv8S94RLxnbDQaA9vBG/EOsJEsTYbYM2P
	 V9pRionuNZtVbZQql/dAuhVJ+acNjYSXQRoX18vu3U+nds1vJ4mtRIet490xhi2Z52
	 jIBcgNOWg23HQBXj4zBw0sqnYo/VvPJaKH5W3eEo1KyZM9pkgSpBVJNZxwhBRPI+lQ
	 3+9dsV/i0988EswF8HbtjH1nfqQDqnJ8LAD2BdnZmhTjlIbGX/a2ZoD2gJQ3QNBY7f
	 NitUwarcD28/Q==
Message-ID: <12dc51f7-a765-4995-bf6d-8abe973f4ea1@kernel.org>
Date: Fri, 13 Jun 2025 16:49:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, bo.wu@vivo.com,
 linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section when
 gc happens EAGAIN
To: Zhiguo Niu <niuzhiguo84@gmail.com>, wangzijie <wangzijie1@honor.com>
References: <f1b9209e-c2fb-4a53-8d15-a3e42dea8bca@kernel.org>
 <20250612123444.1779509-1-wangzijie1@honor.com>
 <CAHJ8P3LSxzSbdz_ONUKy8dyDjLGsNJ08Aq724CUwYdOJ=m_2eA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3LSxzSbdz_ONUKy8dyDjLGsNJ08Aq724CUwYdOJ=m_2eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/6/13 16:25, Zhiguo Niu wrote:
> wangzijie <wangzijie1@honor.com> 于2025年6月12日周四 20:38写道：
>>
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
>>          struct inode *inode = d_inode(dentry);
>>          struct f2fs_inode_info *fi = F2FS_I(inode);
>>          int err;
>> +       struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> +       block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
>>
>>          if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>>                  return -EIO;
>> @@ -1047,6 +1049,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>                          !IS_ALIGNED(attr->ia_size,
>>                          F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>                          return -EINVAL;
>> +               if (f2fs_is_pinned_file(inode) &&
>> +                       attr->ia_size < i_size_read(inode) &&
>> +                       !IS_ALIGNED(attr->ia_size,
>> +                       F2FS_BLK_TO_BYTES(sec_blks)));
>> +                       return -EINVAL;
> Hi Chao and zijie,
> Excuse me ,I'm a bit confused about this:
> when a pin file size is not alinged with size of "section", it can not
> be truncated?

IMO, the pinned file can only be truncated to section-aligned size.

Thanks

> thanks！
>>          }
>>
>>          err = setattr_prepare(idmap, dentry, attr);
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
>>>        /* for skip statistic */
>>>        unsigned long long skipped_gc_rwsem;            /* FG_GC only */
>>>
>>> +     /* free sections reserved for pinned file */
>>> +     unsigned int reserved_pin_section;
>>> +
>>>        /* threshold for gc trials on pinned files */
>>>        unsigned short gc_pin_file_threshold;
>>>        struct f2fs_rwsem pin_sem;
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 696131e655ed..a909f79db178 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>>>                        }
>>>                }
>>>
>>> -             if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
>>> -                     ZONED_PIN_SEC_REQUIRED_COUNT :
>>> -                     GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
>>> +             if (has_not_enough_free_secs(sbi, 0,
>>> +                             sbi->reserved_pin_section)) {
>>>                        f2fs_down_write(&sbi->gc_lock);
>>>                        stat_inc_gc_call_count(sbi, FOREGROUND);
>>>                        err = f2fs_gc(sbi, &gc_control);
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 57adeff5ef25..48b97a95fd63 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>>        sbi->last_valid_block_count = sbi->total_valid_block_count;
>>>        sbi->reserved_blocks = 0;
>>>        sbi->current_reserved_blocks = 0;
>>> +     sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
>>> +                     ZONED_PIN_SEC_REQUIRED_COUNT :
>>> +                     GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
>>>        limit_reserve_root(sbi);
>>>        adjust_unusable_cap_perc(sbi);
>>>
>>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>>> index 75134d69a0bd..51be7ffb38c5 100644
>>> --- a/fs/f2fs/sysfs.c
>>> +++ b/fs/f2fs/sysfs.c
>>> @@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>>>                return count;
>>>        }
>>>
>>> +     if (!strcmp(a->attr.name, "reserved_pin_section")) {
>>> +             if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
>>> +                     return -EINVAL;
>>> +             *ui = (unsigned int)t;
>>> +             return count;
>>> +     }
>>> +
>>>        *ui = (unsigned int)t;
>>>
>>>        return count;
>>> @@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
>>>   F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>>>   #endif
>>>   F2FS_SBI_GENERAL_RW_ATTR(carve_out);
>>> +F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
>>>
>>>   /* STAT_INFO ATTR */
>>>   #ifdef CONFIG_F2FS_STAT_FS
>>> @@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
>>>        ATTR_LIST(last_age_weight),
>>>        ATTR_LIST(max_read_extent_count),
>>>        ATTR_LIST(carve_out),
>>> +     ATTR_LIST(reserved_pin_section),
>>>        NULL,
>>>   };
>>>   ATTRIBUTE_GROUPS(f2fs);
>>> --
>>> 2.49.0
>>
>> I think it's a good way to solve this problem. Thank you!
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
>>>>                      f2fs_down_write(&sbi->gc_lock);
>>>>                      stat_inc_gc_call_count(sbi, FOREGROUND);
>>>>                      err = f2fs_gc(sbi, &gc_control);
>>>> -                   if (err && err != -ENODATA) {
>>>> +                   if (err && err != -ENODATA && err != -EAGAIN) {
>>>>                              f2fs_up_write(&sbi->pin_sem);
>>>>                              goto out_err;
>>>>                      }
>>>
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

