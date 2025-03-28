Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CC733985
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743146740; cv=none; b=E+WLdoXltfymm3BRKv0VxZNqQwvApQfUYkJ4nu3xIgD9cXdaRSzcZkxegSt0S0wGVilyZ0klk5eAfJiuwfhbwGQE6wpKRZl7FJM8ty0DV5/gwn1CWeBicPd3ytbihXLbs/0BBvw+QMXHTZnxjZpBtQ/EYcK8m2vXfWFro7QMjUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743146740; c=relaxed/simple;
	bh=XfN/P0HLGm+9+5UWH4llncDKNWXDdPWHvgJfUOR4cm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MK0P/dFQOoJRzrslybiAiFEFTGaZHySF7IiyRJf3C7fTd4kzKQvQsBMnESbzkYenc6TrqsSJjGoCugZM5LoYbDTojnQTvrHMEIvz29Y7+uhJDlKP2wzYoXUgPcZgBg1jCpymA9u1PKzcCjNvdcpnMk3fGC9Kl+PhG9jiiVyKmIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-c6-67e64eeb4151
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: chao@kernel.org,
	jaegeuk@kernel.org,
	jyh429@gmail.com,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: [External Mail] Re: [f2fs-dev] [External Mail] Re: [External Mail] Re: [PATCH] f2fs: prevent the current section from being selected as a victim during garbage collection
Date: Fri, 28 Mar 2025 16:25:26 +0900
Message-ID: <20250328072530.2475-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <3a2149b5-68b7-413d-8098-27ee5049f146@kernel.org>
References: <3a2149b5-68b7-413d-8098-27ee5049f146@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsXC9ZZnke5rv2fpBgdvmVmcnnqWyeLJ+lnM
	Fl+uXmO3uLTI3eLyrjlsDqweO2fdZffYtKqTzWP3gs9MHp83yQWwRHHZpKTmZJalFunbJXBl
	rDg7lbngqkfFih2vmBsYJ1h0MXJwSAiYSMxc4NHFyAlhrjrBDGKzCWhI/OntBbNFBLQkJjb8
	Zexi5OJgFuhklFh/8DMriCMssJlR4u/riWBVLAKqEvd3rWcFsXkFzCRmTT3AAjFVU2LHl/NM
	IDangJ3EgVXLwGqEBGwlZpz8xA5RLyhxcuYTFpCDmAXUJdbPEwIJMwvISzRvnc0MsktCYAGb
	xL7Wh4wQMyUlDq64wTKBUWAWkvZZCO2zkLQvYGRexSiSmVeWm5iZY6xXnJ1RmZdZoZecn7uJ
	ERjAy2r/RO5g/HYh+BCjAAejEg/vAdun6UKsiWXFlbmHGCU4mJVEeCWvPEkX4k1JrKxKLcqP
	LyrNSS0+xCjNwaIkzmv0rTxFSCA9sSQ1OzW1ILUIJsvEwSnVwBhev/HVv88F/1/tvlkjoH5Q
	/kiSYLiUjbSiqpMiV2LBqWM62rOuddmrFsaUdHIv2fzXN2RVuIF27adt5avnuhyVDQjISI2x
	PLB357fCVItpjz58KtgnvZXXaduuuF1T20K6F/JcnjPv1JtVXk8F3l3kvqBp5FgY8d7n8+WX
	MnO+9L/ROnJtupkSS3FGoqEWc1FxIgApyegSXAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsXCNUNlju5rv2fpBodXalmcnnqWyeLJ+lnM
	Fl+uXmO3uLTI3eLyrjlsFhPmXmWyeL/1HqMDu8fOWXfZPTat6mTz2L3gM5PHt9seHp83yQWw
	RnHZpKTmZJalFunbJXBlrDg7lbngqkfFih2vmBsYJ1h0MXJySAiYSMxcdYIZxGYT0JD409sL
	ZosIaElMbPjL2MXIxcEs0Mkosf7gZ1YQR1hgM6PE39cTwapYBFQl7u9azwpi8wqYScyaeoAF
	YqqmxI4v55lAbE4BO4kDq5aB1QgJ2ErMOPmJHaJeUOLkzCdA9RxAG9Ql1s8TAgkzC8hLNG+d
	zTyBkXcWkqpZCFWzkFQtYGRexSiSmVeWm5iZY6ZXnJ1RmZdZoZecn7uJERiUy2r/TNrB+O2y
	+yFGAQ5GJR7eA7ZP04VYE8uKK3MPMUpwMCuJ8EpeeZIuxJuSWFmVWpQfX1Sak1p8iFGag0VJ
	nNcrPDVBSCA9sSQ1OzW1ILUIJsvEwSnVwOhhtHzTqlOZbisUvEuubXk2k0VQLjC//1jMwnPr
	HwdPep34vN9z2zT7C/ZLow8e9k8yUFx77VXaoiipu3mJKVZPv71cfXC94uu/mq1XpFZMmZO4
	5dONU3d8n+6S5UwvaCxqO8x31W1Fh+SEhNi5DH/Kppsbvb8ziz/ZRlpFv179lIAaa79HuasS
	S3FGoqEWc1FxIgDi17SZRgIAAA==
X-CFilter-Loop: Reflected

> On 2025/3/28 11:40, yohan.joung wrote:
> >> From: Chao Yu <chao@kernel.org>
> >> Sent: Thursday, March 27, 2025 10:48 PM
> >> To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>; Yohan Joung
> >> <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gmail.com
> >> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net; linux-
> >> kernel@vger.kernel.org; 김필현(KIM PILHYUN) Mobile AE
> >> <pilhyun.kim@sk.com>
> >> Subject: [External Mail] Re: [External Mail] Re: [External Mail] Re:
> >> [PATCH] f2fs: prevent the current section from being selected as a
> >> victim during garbage collection
> >>
> >> On 2025/3/27 16:00, yohan.joung@sk.com wrote:
> >>>> From: Chao Yu <chao@kernel.org>
> >>>> Sent: Thursday, March 27, 2025 4:30 PM
> >>>> To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>; Yohan Joung
> >>>> <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gmail.com
> >>>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net; linux-
> >>>> kernel@vger.kernel.org; 김필현(KIM PILHYUN) Mobile AE
> >>>> <pilhyun.kim@sk.com>
> >>>> Subject: [External Mail] Re: [External Mail] Re: [PATCH] f2fs:
> >>>> prevent the current section from being selected as a victim during
> >>>> garbage collection
> >>>>
> >>>> On 3/27/25 14:43, yohan.joung@sk.com wrote:
> >>>>>> From: Chao Yu <chao@kernel.org>
> >>>>>> Sent: Thursday, March 27, 2025 3:02 PM
> >>>>>> To: Yohan Joung <jyh429@gmail.com>; jaegeuk@kernel.org;
> >>>>>> daeho43@gmail.com
> >>>>>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net;
> >>>>>> linux- kernel@vger.kernel.org; 정요한(JOUNG YOHAN) Mobile AE
> >>>>>> <yohan.joung@sk.com>
> >>>>>> Subject: [External Mail] Re: [PATCH] f2fs: prevent the current
> >>>>>> section from being selected as a victim during garbage collection
> >>>>>>
> >>>>>> On 3/26/25 22:14, Yohan Joung wrote:
> >>>>>>> When selecting a victim using next_victim_seg in a large
> >>>>>>> section, the selected section might already have been cleared
> >>>>>>> and designated as the new current section, making it actively in
> use.
> >>>>>>> This behavior causes inconsistency between the SIT and SSA.
> >>>>>>
> >>>>>> Hi, does this fix your issue?
> >>>>>
> >>>>> This is an issue that arises when dividing a large section into
> >>>>> segments for garbage collection.
> >>>>> caused by the background GC (garbage collection) thread in large
> >>>>> section
> >>>>> f2fs_gc(victim_section) ->
> >>>>> f2fs_clear_prefree_segments(victim_section)->
> >>>>> cursec(victim_section) -> f2fs_gc(victim_section by
> >>>>> next_victim_seg)
> >>>>
> >>>> I didn't get it, why f2fs_get_victim() will return section which is
> >>>> used by curseg? It should be avoided by checking w/ sec_usage_check().
> >>>>
> >>>> Or we missed to check gcing section which next_victim_seg points to
> >>>> during get_new_segment()?
> >>>>
> >>>> Can this happen?
> >>>>
> >>>> e.g.
> >>>> - bggc selects sec #0
> >>>> - next_victim_seg: seg #0
> >>>> - migrate seg #0 and stop
> >>>> - next_victim_seg: seg #1
> >>>> - checkpoint, set sec #0 free if sec #0 has no valid blocks
> >>>> - allocate seg #0 in sec #0 for curseg
> >>>> - curseg moves to seg #1 after allocation
> >>>> - bggc tries to migrate seg #1
> >>>>
> >>>> Thanks,
> >>> That's correct
> >>> In f2fs_get_victim, we use next_victim_seg to directly jump to
> >>> got_result, thereby bypassing sec_usage_check What do you think
> >>> about this change?
> >>>
> >>> @@ -850,15 +850,20 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi,
> >> unsigned int *result,
> >>>                           p.min_segno = sbi->next_victim_seg[BG_GC];
> >>>                           *result = p.min_segno;
> >>>                           sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> >>> -                       goto got_result;
> >>>                   }
> >>>                   if (gc_type == FG_GC &&
> >>>                                   sbi->next_victim_seg[FG_GC] != NULL_SEGNO) {
> >>>                           p.min_segno = sbi->next_victim_seg[FG_GC];
> >>>                           *result = p.min_segno;
> >>>                           sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> >>> -                       goto got_result;
> >>>                   }
> >>> +
> >>> +               secno = GET_SEC_FROM_SEG(sbi, segno);
> >>> +
> >>> +               if (sec_usage_check(sbi, secno))
> >>> +                       goto next;
> >>> +
> >>> +               goto got_result;
> >>>           }
> >>
> >> But still allocator can assign this segment after sec_usage_check()
> >> in race condition, right?
> > Since the BG GC using next_victim  takes place after the SIT update in
> > do_checkpoint, it seems unlikely that a race condition with
> sec_usage_check will occur.
> 
> I mean this:
> 
> - gc_thread
>   - f2fs_gc
>    - f2fs_get_victim
>     - sec_usage_check --- segno #1 is not used in any cursegs
> 					- f2fs_allocate_data_block
> 					 - new_curseg
> 					  - get_new_segment find segno #1
> 
>    - do_garbage_collect
> 
> Thanks,

						  do_checkpoint sec0 free 
						  If sec0 is not freed, then segno1 within sec0 cannot be allocated
- gc_thread
  - f2fs_gc
   - f2fs_get_victim
    - sec_usage_check  --- segno #1 is not used in any cursegs (but sec0 is already used)
							- f2fs_allocate_data_block
							- new_curseg
							- get_new_segment find segno #1
					
   - do_garbage_collect

I appreciate your patch, it is under testing.
but I'm wondering if there's a risk of a race condition in this situation


> 
> >>
> >> IMO, we can clear next_victim_seg[] once section is free in
> >> __set_test_and_free()? something like this:
> > I will test it according to your suggestion.
> > If there are no issues, can I submit it again with the patch?
> > Thanks
> >>
> >> ---
> >>    fs/f2fs/segment.h | 13 ++++++++++---
> >>    1 file changed, 10 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
> >> 0465dc00b349..826e37999085 100644
> >> --- a/fs/f2fs/segment.h
> >> +++ b/fs/f2fs/segment.h
> >> @@ -473,9 +473,16 @@ static inline void __set_test_and_free(struct
> >> f2fs_sb_info *sbi,
> >>    			goto skip_free;
> >>    		next = find_next_bit(free_i->free_segmap,
> >>    				start_segno + SEGS_PER_SEC(sbi), start_segno);
> >> -		if (next >= start_segno + usable_segs) {
> >> -			if (test_and_clear_bit(secno, free_i->free_secmap))
> >> -				free_i->free_sections++;
> >> +		if ((next >= start_segno + usable_segs) &&
> >> +			test_and_clear_bit(secno, free_i->free_secmap)) {
> >> +			free_i->free_sections++;
> >> +
> >> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) ==
> >> +									secno)
> >> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> >> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) ==
> >> +									secno)
> >> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> >>    		}
> >>    	}
> >>    skip_free:
> >> --
> >> 2.40.1
> >>
> >>>>
> >>>>>
> >>>>> Because the call stack is different, I think that in order to
> >>>>> handle everything at once, we need to address it within
> >>>>> do_garbage_collect, or otherwise include it on both sides.
> >>>>> What do you think?
> >>>>>
> >>>>> [30146.337471][ T1300] F2FS-fs (dm-54): Inconsistent segment
> >>>>> (70961) type [0, 1] in SSA and SIT [30146.346151][ T1300] Call trace:
> >>>>> [30146.346152][ T1300]  dump_backtrace+0xe8/0x10c [30146.346157][
> >>>>> T1300]  show_stack+0x18/0x28 [30146.346158][ T1300]
> >>>>> dump_stack_lvl+0x50/0x6c [30146.346161][ T1300]
> >>>>> dump_stack+0x18/0x28 [30146.346162][ T1300]
> >>>>> f2fs_stop_checkpoint+0x1c/0x3c [30146.346165][ T1300]
> >>>>> do_garbage_collect+0x41c/0x271c [30146.346167][ T1300]
> >>>>> f2fs_gc+0x27c/0x828 [30146.346168][ T1300]
> >>>>> gc_thread_func+0x290/0x88c [30146.346169][ T1300]
> >>>>> kthread+0x11c/0x164 [30146.346172][ T1300]
> >>>>> ret_from_fork+0x10/0x20
> >>>>>
> >>>>> struct curseg_info : 0xffffff803f95e800 {
> >>>>> 	segno        : 0x11531 : 70961
> >>>>> }
> >>>>>
> >>>>> struct f2fs_sb_info : 0xffffff8811d12000 {
> >>>>> 	next_victim_seg[0] : 0x11531 : 70961 }
> >>>>>
> >>>>>>
> >>>>>> https://lore.kernel.org/linux-f2fs-devel/20250325080646.3291947-2
> >>>>>> -
> >>>>>> chao@kernel.org
> >>>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>>>
> >>>>>>> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> >>>>>>> ---
> >>>>>>>    fs/f2fs/gc.c | 4 ++++
> >>>>>>>    1 file changed, 4 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index
> >>>>>>> 2b8f9239bede..4b5d18e395eb 100644
> >>>>>>> --- a/fs/f2fs/gc.c
> >>>>>>> +++ b/fs/f2fs/gc.c
> >>>>>>> @@ -1926,6 +1926,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi,
> >>>>>>> struct
> >>>>>> f2fs_gc_control *gc_control)
> >>>>>>>    		goto stop;
> >>>>>>>    	}
> >>>>>>>
> >>>>>>> +	if (__is_large_section(sbi) &&
> >>>>>>> +			IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
> >>>>>>> +		goto stop;
> >>>>>>> +
> >>>>>>>    	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
> >>>>>>>    				gc_control->should_migrate_blocks,
> >>>>>>>    				gc_control->one_time);
> >>>>>
> >>>
> >

