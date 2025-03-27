Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58A1F4CBF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743060601; cv=none; b=uVUX8GG0gqBM0p6dvS2FiGoLP7/OLpolm/8VTBo4gZ7tufOKUQyi5tLW+fYP8KFa5vF6UdM8j9MQJE+BhzP5gX6vCDFzdjwfEYovUt4GQx/2tuQMopnhjW+uD5a7OlXtzLHBLWcSDZLqnqD/fkS9zuox2RR0dk7e7Sjvigpdwsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743060601; c=relaxed/simple;
	bh=ksooDKwMUuHkTaFWvqhnbrlEK7O5z3878QbVilW3idE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CV6sBy72kwEF0kg8/8tlqWpYvtec9cXR//0GxuhthtxeLMtB1tORIMKzLCwhlM22NqlrXL/xyNosM+NrkUegnXWsGSmi84OzRzPSWe4wIlWLLdpDxF71kODEdL/AzhKEopUmYkhzan6H47dImqjr3GqmPCUNFFqO01qy3cVbNjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbZAiMcv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbZAiMcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51429C4CEDD;
	Thu, 27 Mar 2025 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743060600;
	bh=ksooDKwMUuHkTaFWvqhnbrlEK7O5z3878QbVilW3idE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=TbZAiMcvd2wbBHxnjiQsvrzz5OkyWyRHZYpacKEBBLv/MpCQt7jAWcRYcjyTUTRkh
	 o3N029NmzTm84jm8m2l7vh79xaSLkO+H1S7ZjxTJZR/rjlSNyQk4LvVhRskRMPVysF
	 NDfAGiJ/vGrwTYJqZI4GbFLuru9ZXW/SY475QpMUXNKe7GocguQzB3RUcCLWsETv3b
	 tYjrjzzPRvndtRDRinyg9xFkgXST1Q4HqhuAB9YaIsgldMy+jX6I5mfN4AnyOdePrE
	 sZQ456U8RwCbvA3a5jOrozx4sOwTHkKqJw0TQhxuSilJmwY8vaBJlyOIGgTo2Rpnto
	 vL38ziYlcNRSg==
Message-ID: <deb42999-df89-471b-a161-e33b97f96b74@kernel.org>
Date: Thu, 27 Mar 2025 15:29:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pilhyun.kim@sk.com" <pilhyun.kim@sk.com>
Subject: Re: [External Mail] Re: [PATCH] f2fs: prevent the current section
 from being selected as a victim during garbage collection
To: "yohan.joung@sk.com" <yohan.joung@sk.com>, Yohan Joung
 <jyh429@gmail.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "daeho43@gmail.com" <daeho43@gmail.com>
References: <20250326141428.280-1-yohan.joung@sk.com>
 <bf3f571c-a6bf-4a17-8745-039b37ac4f48@kernel.org>
 <2d95428375bd4a5592516bb6cefe4592@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <2d95428375bd4a5592516bb6cefe4592@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/27/25 14:43, yohan.joung@sk.com wrote:
>> From: Chao Yu <chao@kernel.org>
>> Sent: Thursday, March 27, 2025 3:02 PM
>> To: Yohan Joung <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gmail.com
>> Cc: chao@kernel.org; linux-f2fs-devel@lists.sourceforge.net; linux-
>> kernel@vger.kernel.org; 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>
>> Subject: [External Mail] Re: [PATCH] f2fs: prevent the current section
>> from being selected as a victim during garbage collection
>>
>> On 3/26/25 22:14, Yohan Joung wrote:
>>> When selecting a victim using next_victim_seg in a large section, the
>>> selected section might already have been cleared and designated as the
>>> new current section, making it actively in use.
>>> This behavior causes inconsistency between the SIT and SSA.
>>
>> Hi, does this fix your issue?
> 
> This is an issue that arises when dividing 
> a large section into segments for garbage collection.
> caused by the background GC (garbage collection) thread in large section
> f2fs_gc(victim_section) -> f2fs_clear_prefree_segments(victim_section)-> 
> cursec(victim_section) -> f2fs_gc(victim_section by next_victim_seg)

I didn't get it, why f2fs_get_victim() will return section which is used
by curseg? It should be avoided by checking w/ sec_usage_check().

Or we missed to check gcing section which next_victim_seg points to
during get_new_segment()?

Can this happen?

e.g.
- bggc selects sec #0
- next_victim_seg: seg #0
- migrate seg #0 and stop
- next_victim_seg: seg #1
- checkpoint, set sec #0 free if sec #0 has no valid blocks
- allocate seg #0 in sec #0 for curseg
- curseg moves to seg #1 after allocation
- bggc tries to migrate seg #1

Thanks,

> 
> Because the call stack is different, 
> I think that in order to handle everything at once, 
> we need to address it within do_garbage_collect, 
> or otherwise include it on both sides. What do you think?
> 
> [30146.337471][ T1300] F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> [30146.346151][ T1300] Call trace:
> [30146.346152][ T1300]  dump_backtrace+0xe8/0x10c
> [30146.346157][ T1300]  show_stack+0x18/0x28
> [30146.346158][ T1300]  dump_stack_lvl+0x50/0x6c
> [30146.346161][ T1300]  dump_stack+0x18/0x28
> [30146.346162][ T1300]  f2fs_stop_checkpoint+0x1c/0x3c
> [30146.346165][ T1300]  do_garbage_collect+0x41c/0x271c
> [30146.346167][ T1300]  f2fs_gc+0x27c/0x828
> [30146.346168][ T1300]  gc_thread_func+0x290/0x88c
> [30146.346169][ T1300]  kthread+0x11c/0x164
> [30146.346172][ T1300]  ret_from_fork+0x10/0x20
> 
> struct curseg_info : 0xffffff803f95e800 {
> 	segno        : 0x11531 : 70961
> }
> 
> struct f2fs_sb_info : 0xffffff8811d12000 {
> 	next_victim_seg[0] : 0x11531 : 70961
> }
> 
>>
>> https://lore.kernel.org/linux-f2fs-devel/20250325080646.3291947-2-
>> chao@kernel.org
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
>>> ---
>>>  fs/f2fs/gc.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index
>>> 2b8f9239bede..4b5d18e395eb 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -1926,6 +1926,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct
>> f2fs_gc_control *gc_control)
>>>  		goto stop;
>>>  	}
>>>
>>> +	if (__is_large_section(sbi) &&
>>> +			IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
>>> +		goto stop;
>>> +
>>>  	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
>>>  				gc_control->should_migrate_blocks,
>>>  				gc_control->one_time);
> 

