Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF41E1DE8
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743142619; cv=none; b=mMqeYW9wPGtYXacgan+mY2PsPAeUcHWw5TwmDem61LNN3UgEUJvVJrYG83uF+FjyXaJc1kTl2yHv8gMJ+9IHn6YLPYTO6rvpxxH+PsZ7ekUMzhz8SaVD5co+/DZdgRXd6DLEVqlp7RMa86dK37nM61dHxCqaMO7xfP1YWdgNCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743142619; c=relaxed/simple;
	bh=KmB8L29xhnkAFi7N2MBXURQIOrmtjScLsxtvh43qWHg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=liLySwsVf3DMMNLys1OLVJx9hbscQHlzb4iJ4B12JPdkVdJjKnAzPE3ti4PbMg+IznCe63pKd+iuP9K5gKhUgbIp/TNGLbOvf6AdI1aQ/8F7n1hfyPpvnOZFRUNoEPhh8Y0cL0W4pWppXQ91jgt64RKP7pCKf+K3yeNHs6K5/sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqUiU/QH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqUiU/QH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B28C4CEE4;
	Fri, 28 Mar 2025 06:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743142618;
	bh=KmB8L29xhnkAFi7N2MBXURQIOrmtjScLsxtvh43qWHg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=BqUiU/QHW8EqDyQF9r7FYzhL1bBcNdyv2mf0odnqyHSPzZ39w66CTmkeSwzKmuEv3
	 wI96/Y/B+uYpx/WcNJfid/CQCS7Z5m8tzjj/5a+9h8wS/ChYImvK9PLlGwC/wy3Ciq
	 lOIjlo0CwgbU4z6Wos4G8HFcri9E+pD0eExkRWLHMyRDf6tuRdhSua2NZduTAZfygI
	 gyDjeuQBQfBYbUpfdExLEcZrZ/GfvCrf0AaXvRsB2maT6TYiyHKISZaI+7Ep10tDLy
	 IdnlmxZFNGWtqZl33U2HoKDduLTO03c6lhCnnR8t1Qk3pyfGzICAlAv8M8VfNtWDnD
	 ziECPJM1XxRAQ==
Message-ID: <3a2149b5-68b7-413d-8098-27ee5049f146@kernel.org>
Date: Fri, 28 Mar 2025 14:17:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, daeho43@gmail.com, jaegeuk@kernel.org, jyh429@gmail.com,
 linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Subject: Re: [f2fs-dev] [External Mail] Re: [External Mail] Re: [PATCH] f2fs:
 prevent the current section from being selected as a victim during garbage
 collection
To: "yohan.joung" <yohan.joung@sk.com>, linux-f2fs-devel@lists.sourceforge.net
References: <60e763d5-dff4-44a1-9e80-48d384335027@kernel.org>
 <20250328034042.2444-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250328034042.2444-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/3/28 11:40, yohan.joung wrote:
>> From: Chao Yu <chao@kernel.org>
>> Sent: Thursday, March 27, 2025 10:48 PM
>> To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>; Yohan Joung
>> <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gmail.com
>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net; linux-
>> kernel@vger.kernel.org; 김필현(KIM PILHYUN) Mobile AE <pilhyun.kim@sk.com>
>> Subject: [External Mail] Re: [External Mail] Re: [External Mail] Re:
>> [PATCH] f2fs: prevent the current section from being selected as a victim
>> during garbage collection
>>
>> On 2025/3/27 16:00, yohan.joung@sk.com wrote:
>>>> From: Chao Yu <chao@kernel.org>
>>>> Sent: Thursday, March 27, 2025 4:30 PM
>>>> To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>; Yohan Joung
>>>> <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gmail.com
>>>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net; linux-
>>>> kernel@vger.kernel.org; 김필현(KIM PILHYUN) Mobile AE
>>>> <pilhyun.kim@sk.com>
>>>> Subject: [External Mail] Re: [External Mail] Re: [PATCH] f2fs:
>>>> prevent the current section from being selected as a victim during
>>>> garbage collection
>>>>
>>>> On 3/27/25 14:43, yohan.joung@sk.com wrote:
>>>>>> From: Chao Yu <chao@kernel.org>
>>>>>> Sent: Thursday, March 27, 2025 3:02 PM
>>>>>> To: Yohan Joung <jyh429@gmail.com>; jaegeuk@kernel.org;
>>>>>> daeho43@gmail.com
>>>>>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net; linux-
>>>>>> kernel@vger.kernel.org; 정요한(JOUNG YOHAN) Mobile AE
>>>>>> <yohan.joung@sk.com>
>>>>>> Subject: [External Mail] Re: [PATCH] f2fs: prevent the current
>>>>>> section from being selected as a victim during garbage collection
>>>>>>
>>>>>> On 3/26/25 22:14, Yohan Joung wrote:
>>>>>>> When selecting a victim using next_victim_seg in a large section,
>>>>>>> the selected section might already have been cleared and
>>>>>>> designated as the new current section, making it actively in use.
>>>>>>> This behavior causes inconsistency between the SIT and SSA.
>>>>>>
>>>>>> Hi, does this fix your issue?
>>>>>
>>>>> This is an issue that arises when dividing a large section into
>>>>> segments for garbage collection.
>>>>> caused by the background GC (garbage collection) thread in large
>>>>> section
>>>>> f2fs_gc(victim_section) ->
>>>>> f2fs_clear_prefree_segments(victim_section)->
>>>>> cursec(victim_section) -> f2fs_gc(victim_section by next_victim_seg)
>>>>
>>>> I didn't get it, why f2fs_get_victim() will return section which is
>>>> used by curseg? It should be avoided by checking w/ sec_usage_check().
>>>>
>>>> Or we missed to check gcing section which next_victim_seg points to
>>>> during get_new_segment()?
>>>>
>>>> Can this happen?
>>>>
>>>> e.g.
>>>> - bggc selects sec #0
>>>> - next_victim_seg: seg #0
>>>> - migrate seg #0 and stop
>>>> - next_victim_seg: seg #1
>>>> - checkpoint, set sec #0 free if sec #0 has no valid blocks
>>>> - allocate seg #0 in sec #0 for curseg
>>>> - curseg moves to seg #1 after allocation
>>>> - bggc tries to migrate seg #1
>>>>
>>>> Thanks,
>>> That's correct
>>> In f2fs_get_victim, we use next_victim_seg to directly jump to
>>> got_result, thereby bypassing sec_usage_check What do you think about
>>> this change?
>>>
>>> @@ -850,15 +850,20 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi,
>> unsigned int *result,
>>>                           p.min_segno = sbi->next_victim_seg[BG_GC];
>>>                           *result = p.min_segno;
>>>                           sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>> -                       goto got_result;
>>>                   }
>>>                   if (gc_type == FG_GC &&
>>>                                   sbi->next_victim_seg[FG_GC] != NULL_SEGNO) {
>>>                           p.min_segno = sbi->next_victim_seg[FG_GC];
>>>                           *result = p.min_segno;
>>>                           sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>> -                       goto got_result;
>>>                   }
>>> +
>>> +               secno = GET_SEC_FROM_SEG(sbi, segno);
>>> +
>>> +               if (sec_usage_check(sbi, secno))
>>> +                       goto next;
>>> +
>>> +               goto got_result;
>>>           }
>>
>> But still allocator can assign this segment after sec_usage_check() in
>> race condition, right?
> Since the BG GC using next_victim  takes place after the SIT update in do_checkpoint,
> it seems unlikely that a race condition with sec_usage_check will occur.

I mean this:

- gc_thread
  - f2fs_gc
   - f2fs_get_victim
    - sec_usage_check --- segno #1 is not used in any cursegs
					- f2fs_allocate_data_block
					 - new_curseg
					  - get_new_segment find segno #1
					
   - do_garbage_collect

Thanks,

>>
>> IMO, we can clear next_victim_seg[] once section is free in
>> __set_test_and_free()? something like this:
> I will test it according to your suggestion.
> If there are no issues, can I submit it again with the patch?
> Thanks
>>
>> ---
>>    fs/f2fs/segment.h | 13 ++++++++++---
>>    1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
>> 0465dc00b349..826e37999085 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -473,9 +473,16 @@ static inline void __set_test_and_free(struct
>> f2fs_sb_info *sbi,
>>    			goto skip_free;
>>    		next = find_next_bit(free_i->free_segmap,
>>    				start_segno + SEGS_PER_SEC(sbi), start_segno);
>> -		if (next >= start_segno + usable_segs) {
>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
>> -				free_i->free_sections++;
>> +		if ((next >= start_segno + usable_segs) &&
>> +			test_and_clear_bit(secno, free_i->free_secmap)) {
>> +			free_i->free_sections++;
>> +
>> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) ==
>> +									secno)
>> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) ==
>> +									secno)
>> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>    		}
>>    	}
>>    skip_free:
>> --
>> 2.40.1
>>
>>>>
>>>>>
>>>>> Because the call stack is different, I think that in order to handle
>>>>> everything at once, we need to address it within do_garbage_collect,
>>>>> or otherwise include it on both sides.
>>>>> What do you think?
>>>>>
>>>>> [30146.337471][ T1300] F2FS-fs (dm-54): Inconsistent segment (70961)
>>>>> type [0, 1] in SSA and SIT [30146.346151][ T1300] Call trace:
>>>>> [30146.346152][ T1300]  dump_backtrace+0xe8/0x10c [30146.346157][
>>>>> T1300]  show_stack+0x18/0x28 [30146.346158][ T1300]
>>>>> dump_stack_lvl+0x50/0x6c [30146.346161][ T1300]
>>>>> dump_stack+0x18/0x28 [30146.346162][ T1300]
>>>>> f2fs_stop_checkpoint+0x1c/0x3c [30146.346165][ T1300]
>>>>> do_garbage_collect+0x41c/0x271c [30146.346167][ T1300]
>>>>> f2fs_gc+0x27c/0x828 [30146.346168][ T1300]
>>>>> gc_thread_func+0x290/0x88c [30146.346169][ T1300]
>>>>> kthread+0x11c/0x164 [30146.346172][ T1300]
>>>>> ret_from_fork+0x10/0x20
>>>>>
>>>>> struct curseg_info : 0xffffff803f95e800 {
>>>>> 	segno        : 0x11531 : 70961
>>>>> }
>>>>>
>>>>> struct f2fs_sb_info : 0xffffff8811d12000 {
>>>>> 	next_victim_seg[0] : 0x11531 : 70961 }
>>>>>
>>>>>>
>>>>>> https://lore.kernel.org/linux-f2fs-devel/20250325080646.3291947-2-
>>>>>> chao@kernel.org
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
>>>>>>> ---
>>>>>>>    fs/f2fs/gc.c | 4 ++++
>>>>>>>    1 file changed, 4 insertions(+)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index
>>>>>>> 2b8f9239bede..4b5d18e395eb 100644
>>>>>>> --- a/fs/f2fs/gc.c
>>>>>>> +++ b/fs/f2fs/gc.c
>>>>>>> @@ -1926,6 +1926,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi,
>>>>>>> struct
>>>>>> f2fs_gc_control *gc_control)
>>>>>>>    		goto stop;
>>>>>>>    	}
>>>>>>>
>>>>>>> +	if (__is_large_section(sbi) &&
>>>>>>> +			IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
>>>>>>> +		goto stop;
>>>>>>> +
>>>>>>>    	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
>>>>>>>    				gc_control->should_migrate_blocks,
>>>>>>>    				gc_control->one_time);
>>>>>
>>>
> 

