Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406F4610C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743398058; cv=none; b=FTA9NsdiqxSVIYvBZWjqlyKUW9+jaJwCuYVMp5ivf4XWYK6i3wQEKJIHsmiFt+XC6Eu1LiYKuzJupq8/W47+i84N3FacawtUri9gQxphajpyHne7EwXOsOZVagMSDfwAjE64UiWYjgl6ac/GgB28b+bgs+viPTxlTXlShGDJYHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743398058; c=relaxed/simple;
	bh=3AFIzSUDQlwgFvNLd9BOkOM3MqJgWn/L+bnH0DcBEeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+VkGYQX8O3F/EHWP0+ZzjGEwDwXXQMiacO9nJlOoEwzE37FO3EzwdI/mQkEWNndaYzjMmJNmjcjrqb+45f3WpPS49ZzcfSh6xmMt+6og/4CcYOAwlxmJMKXgmSCqPP8A0ky3mGiLK2/XNoePJO7c91l7yr8PINWvhgvyLmApgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-da-67ea249b0d08
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: chao@kernel.org,
	jaegeuk@kernel.org,
	jyh429@gmail.com,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: [External Mail] Re: [f2fs-dev] [External Mail] Re: [External Mail] Re: [PATCH] f2fs: prevent the current section from being selected as a victim during garbage collection
Date: Mon, 31 Mar 2025 14:13:58 +0900
Message-ID: <20250331051402.2595-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
References: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsXC9ZZnoe4clVfpBv33GS1OTz3LZPFk/Sxm
	iy9Xr7FbXFrkbnF51xw2B1aPnbPusntsWtXJ5rF7wWcmj8+b5AJYorhsUlJzMstSi/TtErgy
	Ji95xlSwLaSif/8e5gbGrU5djJwcEgImEuem3WPsYuQAs3f11oOE2QQ0JP709jKD2CICWhIT
	G/4ClXBxMAt0MkqsP/iZFcQRFtjMKPH39USwKhYBVYkTD9pZQGxeATOJEzffsUMs0JTY8eU8
	E4jNKWAn8ez+XTBbSMBW4t7kr0wQ9YISJ2c+YQE5gllAXWL9PCGQMLOAvETz1tnMILskBBaw
	SZy99xZqpqTEwRU3WCYwCsxC0j4LoX0WkvYFjMyrGEUy88pyEzNzjPWKszMq8zIr9JLzczcx
	AgN4We2fyB2M3y4EH2IU4GBU4uE1UHmZLsSaWFZcmXuIUYKDWUmEN+IrUIg3JbGyKrUoP76o
	NCe1+BCjNAeLkjiv0bfyFCGB9MSS1OzU1ILUIpgsEwenVANjufSSa3eiF8wTubA8bWvHoaPT
	nBZ2770831zBq6Lf9cMLGW2221uqLefymTj1lyucvfHKO21dwZSLR3Y++zAr5MVKwT6jE5/X
	mG3jbjmWp9zjf3aROc8yrWjlsHZ2rStpS4xi3qSsn1UUaDJ/Y+kMZ189bjaz6EdMh14/1tJ6
	a/hN68QElXeblViKMxINtZiLihMB/sOiF1wCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsXCNUNlju5slVfpBq+OmFmcnnqWyeLJ+lnM
	Fl+uXmO3uLTI3eLyrjlsFhPmXmWyeL/1HqMDu8fOWXfZPTat6mTz2L3gM5PHt9seHp83yQWw
	RnHZpKTmZJalFunbJXBlTF7yjKlgW0hF//49zA2MW526GDk4JARMJHb11ncxcnKwCWhI/Ont
	ZQaxRQS0JCY2/GXsYuTiYBboZJRYf/AzK4gjLLCZUeLv64lgVSwCqhInHrSzgNi8AmYSJ26+
	YwexJQQ0JXZ8Oc8EYnMK2Ek8u38XzBYSsJW4N/krE0S9oMTJmU9YQI5gFlCXWD9PCCTMLCAv
	0bx1NvMERt5ZSKpmIVTNQlK1gJF5FaNIZl5ZbmJmjplecXZGZV5mhV5yfu4mRmBILqv9M2kH
	47fL7ocYBTgYlXh4DVRepguxJpYVV+YeYpTgYFYS4Y34ChTiTUmsrEotyo8vKs1JLT7EKM3B
	oiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpgZOPfoF12xOHIstMx+bsv+rzdz9Pt2bMi9Hzb
	D5uZNu1i76pNJjJPru+y0dij9OLn9wiHFG2+Z+YWD5+9frky5OLlrEV2X5zKfaW4LnSWOQce
	T1Y1uFkUaf7xlcpZM8Wa2085fJ7sfsg7ea6YzIlZ7Yx7eSo9pPK3T1zZ+nSe9B1BC0nW02cO
	KrEUZyQaajEXFScCAN+bEbtFAgAA
X-CFilter-Loop: Reflected

>On 2025/3/28 15:25, yohan.joung wrote:
>>> On 2025/3/28 11:40, yohan.joung wrote:
>>>>> From: Chao Yu <chao@kernel.org>
>>>>> Sent: Thursday, March 27, 2025 10:48 PM
>>>>> To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>; Yohan Joung
>>>>> <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gmail.com
>>>>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net; linux-
>>>>> kernel@vger.kernel.org; 김필현(KIM PILHYUN) Mobile AE
>>>>> <pilhyun.kim@sk.com>
>>>>> Subject: [External Mail] Re: [External Mail] Re: [External Mail] Re:
>>>>> [PATCH] f2fs: prevent the current section from being selected as a
>>>>> victim during garbage collection
>>>>>
>>>>> On 2025/3/27 16:00, yohan.joung@sk.com wrote:
>>>>>>> From: Chao Yu <chao@kernel.org>
>>>>>>> Sent: Thursday, March 27, 2025 4:30 PM
>>>>>>> To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>; Yohan Joung
>>>>>>> <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gmail.com
>>>>>>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net;
>>>>>>> linux- kernel@vger.kernel.org; 김필현(KIM PILHYUN) Mobile AE
>>>>>>> <pilhyun.kim@sk.com>
>>>>>>> Subject: [External Mail] Re: [External Mail] Re: [PATCH] f2fs:
>>>>>>> prevent the current section from being selected as a victim
>>>>>>> during garbage collection
>>>>>>>
>>>>>>> On 3/27/25 14:43, yohan.joung@sk.com wrote:
>>>>>>>>> From: Chao Yu <chao@kernel.org>
>>>>>>>>> Sent: Thursday, March 27, 2025 3:02 PM
>>>>>>>>> To: Yohan Joung <jyh429@gmail.com>; jaegeuk@kernel.org;
>>>>>>>>> daeho43@gmail.com
>>>>>>>>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net;
>>>>>>>>> linux- kernel@vger.kernel.org; 정요한(JOUNG YOHAN) Mobile AE
>>>>>>>>> <yohan.joung@sk.com>
>>>>>>>>> Subject: [External Mail] Re: [PATCH] f2fs: prevent the current
>>>>>>>>> section from being selected as a victim during garbage
>>>>>>>>> collection
>>>>>>>>>
>>>>>>>>> On 3/26/25 22:14, Yohan Joung wrote:
>>>>>>>>>> When selecting a victim using next_victim_seg in a large
>>>>>>>>>> section, the selected section might already have been cleared
>>>>>>>>>> and designated as the new current section, making it actively
>>>>>>>>>> in
>>> use.
>>>>>>>>>> This behavior causes inconsistency between the SIT and SSA.
>>>>>>>>>
>>>>>>>>> Hi, does this fix your issue?
>>>>>>>>
>>>>>>>> This is an issue that arises when dividing a large section into
>>>>>>>> segments for garbage collection.
>>>>>>>> caused by the background GC (garbage collection) thread in large
>>>>>>>> section
>>>>>>>> f2fs_gc(victim_section) ->
>>>>>>>> f2fs_clear_prefree_segments(victim_section)->
>>>>>>>> cursec(victim_section) -> f2fs_gc(victim_section by
>>>>>>>> next_victim_seg)
>>>>>>>
>>>>>>> I didn't get it, why f2fs_get_victim() will return section which
>>>>>>> is used by curseg? It should be avoided by checking w/
>sec_usage_check().
>>>>>>>
>>>>>>> Or we missed to check gcing section which next_victim_seg points
>>>>>>> to during get_new_segment()?
>>>>>>>
>>>>>>> Can this happen?
>>>>>>>
>>>>>>> e.g.
>>>>>>> - bggc selects sec #0
>>>>>>> - next_victim_seg: seg #0
>>>>>>> - migrate seg #0 and stop
>>>>>>> - next_victim_seg: seg #1
>>>>>>> - checkpoint, set sec #0 free if sec #0 has no valid blocks
>>>>>>> - allocate seg #0 in sec #0 for curseg
>>>>>>> - curseg moves to seg #1 after allocation
>>>>>>> - bggc tries to migrate seg #1
>>>>>>>
>>>>>>> Thanks,
>>>>>> That's correct
>>>>>> In f2fs_get_victim, we use next_victim_seg to directly jump to
>>>>>> got_result, thereby bypassing sec_usage_check What do you think
>>>>>> about this change?
>>>>>>
>>>>>> @@ -850,15 +850,20 @@ int f2fs_get_victim(struct f2fs_sb_info
>>>>>> *sbi,
>>>>> unsigned int *result,
>>>>>>                            p.min_segno = sbi->next_victim_seg[BG_GC];
>>>>>>                            *result = p.min_segno;
>>>>>>                            sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>>>> -                       goto got_result;
>>>>>>                    }
>>>>>>                    if (gc_type == FG_GC &&
>>>>>>                                    sbi->next_victim_seg[FG_GC] != NULL_SEGNO)
>{
>>>>>>                            p.min_segno = sbi->next_victim_seg[FG_GC];
>>>>>>                            *result = p.min_segno;
>>>>>>                            sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>>>>> -                       goto got_result;
>>>>>>                    }
>>>>>> +
>>>>>> +               secno = GET_SEC_FROM_SEG(sbi, segno);
>>>>>> +
>>>>>> +               if (sec_usage_check(sbi, secno))
>>>>>> +                       goto next;
>>>>>> +
>>>>>> +               goto got_result;
>>>>>>            }
>>>>>
>>>>> But still allocator can assign this segment after sec_usage_check()
>>>>> in race condition, right?
>>>> Since the BG GC using next_victim  takes place after the SIT update
>>>> in do_checkpoint, it seems unlikely that a race condition with
>>> sec_usage_check will occur.
>>>
>>> I mean this:
>>>
>>> - gc_thread
>>>    - f2fs_gc
>>>     - f2fs_get_victim
>>>      - sec_usage_check --- segno #1 is not used in any cursegs
>>> 					- f2fs_allocate_data_block
>>> 					 - new_curseg
>>> 					  - get_new_segment find segno #1
>>>
>>>     - do_garbage_collect
>>>
>>> Thanks,
>>
>> 						  do_checkpoint sec0 free
>> 						  If sec0 is not freed, then
>segno1 within sec0 cannot be
>> allocated
>> - gc_thread
>>    - f2fs_gc
>>     - f2fs_get_victim
>>      - sec_usage_check  --- segno #1 is not used in any cursegs (but sec0
>is already used)
>> 							- f2fs_allocate_data_block
>> 							- new_curseg
>> 							- get_new_segment find
>segno #1
>>
>>     - do_garbage_collect
>>
>> I appreciate your patch, it is under testing.
>> but I'm wondering if there's a risk of a race condition in this
>> situation
>
>Oh, yes, I may missed that get_new_segment can return a free segment in
>partial used section.
>
>So what do you think of this?
>- check CURSEG() in do_garbage_collect() and get_victim()
>- reset next_victim_seg[] in get_new_segment() and __set_test_and_free()
>during checkpoint.
>
>Thanks,

How about using victim_secmap?
gc_thread
				mutex_lock(&DIRTY_I(sbi)->seglist_lock);
				__set_test_and_free
				check cur section next_victim clear 
				mutex_unlock(&dirty_i->seglist_lock);
                                        
mutex_lock(&dirty->seglist_lock);
f2fs_get_victim
mutex_unlock(&dirty_i->seglist_lock);

static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
                if (next >= start_segno + usable_segs) {
                        if (test_and_clear_bit(secno, free_i->free_secmap))
                                free_i->free_sections++;
+
+                       if (test_and_clear_bit(secno, dirty_i->victim_secmap))
+                               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
                }
        }
>
>>
>>
>>>
>>>>>
>>>>> IMO, we can clear next_victim_seg[] once section is free in
>>>>> __set_test_and_free()? something like this:
>>>> I will test it according to your suggestion.
>>>> If there are no issues, can I submit it again with the patch?
>>>> Thanks
>>>>>
>>>>> ---
>>>>>     fs/f2fs/segment.h | 13 ++++++++++---
>>>>>     1 file changed, 10 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
>>>>> 0465dc00b349..826e37999085 100644
>>>>> --- a/fs/f2fs/segment.h
>>>>> +++ b/fs/f2fs/segment.h
>>>>> @@ -473,9 +473,16 @@ static inline void __set_test_and_free(struct
>>>>> f2fs_sb_info *sbi,
>>>>>     			goto skip_free;
>>>>>     		next = find_next_bit(free_i->free_segmap,
>>>>>     				start_segno + SEGS_PER_SEC(sbi),
>start_segno);
>>>>> -		if (next >= start_segno + usable_segs) {
>>>>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
>>>>> -				free_i->free_sections++;
>>>>> +		if ((next >= start_segno + usable_segs) &&
>>>>> +			test_and_clear_bit(secno, free_i->free_secmap)) {
>>>>> +			free_i->free_sections++;
>>>>> +
>>>>> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) ==
>>>>> +									secno)
>>>>> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>>> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) ==
>>>>> +									secno)
>>>>> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>>>>     		}
>>>>>     	}
>>>>>     skip_free:
>>>>> --
>>>>> 2.40.1
>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Because the call stack is different, I think that in order to
>>>>>>>> handle everything at once, we need to address it within
>>>>>>>> do_garbage_collect, or otherwise include it on both sides.
>>>>>>>> What do you think?
>>>>>>>>
>>>>>>>> [30146.337471][ T1300] F2FS-fs (dm-54): Inconsistent segment
>>>>>>>> (70961) type [0, 1] in SSA and SIT [30146.346151][ T1300] Call
>trace:
>>>>>>>> [30146.346152][ T1300]  dump_backtrace+0xe8/0x10c
>>>>>>>> [30146.346157][ T1300]  show_stack+0x18/0x28 [30146.346158][
>>>>>>>> T1300] dump_stack_lvl+0x50/0x6c [30146.346161][ T1300]
>>>>>>>> dump_stack+0x18/0x28 [30146.346162][ T1300]
>>>>>>>> f2fs_stop_checkpoint+0x1c/0x3c [30146.346165][ T1300]
>>>>>>>> do_garbage_collect+0x41c/0x271c [30146.346167][ T1300]
>>>>>>>> f2fs_gc+0x27c/0x828 [30146.346168][ T1300]
>>>>>>>> gc_thread_func+0x290/0x88c [30146.346169][ T1300]
>>>>>>>> kthread+0x11c/0x164 [30146.346172][ T1300]
>>>>>>>> ret_from_fork+0x10/0x20
>>>>>>>>
>>>>>>>> struct curseg_info : 0xffffff803f95e800 {
>>>>>>>> 	segno        : 0x11531 : 70961
>>>>>>>> }
>>>>>>>>
>>>>>>>> struct f2fs_sb_info : 0xffffff8811d12000 {
>>>>>>>> 	next_victim_seg[0] : 0x11531 : 70961 }
>>>>>>>>
>>>>>>>>>
>>>>>>>>> https://lore.kernel.org/linux-f2fs-devel/20250325080646.3291947
>>>>>>>>> -2
>>>>>>>>> -
>>>>>>>>> chao@kernel.org
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
>>>>>>>>>> ---
>>>>>>>>>>     fs/f2fs/gc.c | 4 ++++
>>>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index
>>>>>>>>>> 2b8f9239bede..4b5d18e395eb 100644
>>>>>>>>>> --- a/fs/f2fs/gc.c
>>>>>>>>>> +++ b/fs/f2fs/gc.c
>>>>>>>>>> @@ -1926,6 +1926,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi,
>>>>>>>>>> struct
>>>>>>>>> f2fs_gc_control *gc_control)
>>>>>>>>>>     		goto stop;
>>>>>>>>>>     	}
>>>>>>>>>>
>>>>>>>>>> +	if (__is_large_section(sbi) &&
>>>>>>>>>> +			IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
>>>>>>>>>> +		goto stop;
>>>>>>>>>> +
>>>>>>>>>>     	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
>>>>>>>>>>     				gc_control->should_migrate_blocks,
>>>>>>>>>>     				gc_control->one_time);
>>>>>>>>
>>>>>>
>>>>
>>
