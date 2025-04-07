Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8272742A9B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991715; cv=none; b=uGaMPeN+xomT3j73yJw//gYqhGZqyMntsgklsSo2xS7AuCWGZD89xypB202I3wVbTcijX4uMm05vDcrt9SINB+/HnkchYC0jxOT3hbSInh+6ZZbKh/zFj0AA28Nf7WPOQpbHomurg0oD3NIYwDQXzIIBRooxE0aRu3A9d8yXmcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991715; c=relaxed/simple;
	bh=xm2ScceSyaOMTCAkQf3KIDsk6uIz8avCUOolRNi4Fuk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iJxWqXtBdhrDRowLORQe8CqhaYg3phdL5tpkfns441Qoh3xVwiV0jX6xdXESx3hlFXnufZBXoUaVgHXkQy/gft7wRnAlIcVjvRdx7jzAdXM7IQLkXKEtBprfLNpO9is4TNygxbYeEOqZBduHUFqnfC94aJ8mhL6xx95GTAP7DxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAQeyW70; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAQeyW70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C498CC4CEE3;
	Mon,  7 Apr 2025 02:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743991713;
	bh=xm2ScceSyaOMTCAkQf3KIDsk6uIz8avCUOolRNi4Fuk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=cAQeyW70FWP6Nri9RCE9s1AysIfjqTm2A7Y3SDdBHqRrT7Oj0KLsF/Ge+J4bsMWwg
	 ds3u1ZjrFNXvnkfpWKl2NIoIv8rYGvX8Bm5q2lHrKx4uUxZz/PuqMnjDhCocFXTlD6
	 bFp3lqCE2DiBO2CLXdKXfXSb+qj8N+7pjTCS3zi9oPyTeZ29tOmXk3MYng8grKJSoQ
	 qvwKFgUXakpp6xjD5AHzpsIIWx1FR+AGbJlACJvgO+3eghM78u2+ahv2f9/rxcYhhP
	 +mYnMKVkvkwMcnqlz7LzDige1CBB7vTEldOpLlWNSWzgrgUSzU+vyuMbgLRCwedAvW
	 bvv1/jDs2ibbA==
Message-ID: <7059eada-a51d-4f68-b62a-0f2c89c9b01c@kernel.org>
Date: Mon, 7 Apr 2025 10:08:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Subject: Re: [PATCH v5] f2fs: prevent the current section from being selected
 as a victim during GC
To: Jaegeuk Kim <jaegeuk@kernel.org>, "yohan.joung" <yohan.joung@sk.com>
References: <20250403232107.2960-1-yohan.joung@sk.com>
 <Z_A5SWl1ueMTZxV0@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Z_A5SWl1ueMTZxV0@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/25 03:55, Jaegeuk Kim wrote:
> Hi Yohan,
> 
> I modified this patch after applying the clean up by
> 
> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
> 
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> 
>         free_i->free_sections++;
> 
> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> +
>  unlock_out:
>         spin_unlock(&free_i->segmap_lock);
>  }
> 
> On 04/04, yohan.joung wrote:
>> When selecting a victim using next_victim_seg in a large section, the
>> selected section might already have been cleared and designated as the
>> new current section, making it actively in use.
>> This behavior causes inconsistency between the SIT and SSA.
>>
>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
>> Call trace:
>> dump_backtrace+0xe8/0x10c
>> show_stack+0x18/0x28
>> dump_stack_lvl+0x50/0x6c
>> dump_stack+0x18/0x28
>> f2fs_stop_checkpoint+0x1c/0x3c
>> do_garbage_collect+0x41c/0x271c
>> f2fs_gc+0x27c/0x828
>> gc_thread_func+0x290/0x88c
>> kthread+0x11c/0x164
>> ret_from_fork+0x10/0x20
>>
>> issue scenario
>> segs_per_sec=2
>> - seg#0 and seg#1 are all dirty
>> - all valid blocks are removed in seg#1
>> - gc select this sec and next_victim_seg=seg#0
>> - migrate seg#0, next_victim_seg=seg#1
>> - checkpoint -> sec(seg#0, seg#1)  becomes free
>> - allocator assigns sec(seg#0, seg#1) to curseg
>> - gc tries to migrate seg#1
>>
>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/segment.h | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index 0465dc00b349..0773283babfa 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>  		next = find_next_bit(free_i->free_segmap,
>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
>>  		if (next >= start_segno + usable_segs) {
>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
>>  				free_i->free_sections++;
>> +
>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>> +
>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>> +			}
>>  		}
>>  	}
>>  skip_free:
>> -- 
>> 2.33.0

