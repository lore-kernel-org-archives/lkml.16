Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324C29D0B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744262089; cv=none; b=tQSqxJcjmuxf+C1fkeJRzALAU6OYb6n+PesMP6CUSDTWcvl4Qk6DoJEyy6i0ov0dULkfwbPYx50xC96L4/nSd15ltC7gbiV2hdSiLDQ4EdokkGRCCu9ou6ootOJWitsk5P28j3go6+OkCZF2SUcrxbxSpo21SN9TgyTgpOVuUS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744262089; c=relaxed/simple;
	bh=G9IDuBFDNO/tescOQZOemu/xYi/kWE+EXfWWY74ELwQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eA1Twpc+Utzhbo0+MHIdMV31xIV/bM9QrgMHFlU/a1PImBvcPhQPclwHsRN6nXeVItwjUbs9n2ABY858rddNLloGTaF/kBOPhGCem6bysrwfx5BwqmVBi7gcae+ReE8vbLYAtebSPDFkX69SdRFm4AL/7Vr5UHhCHmDK1s7RRXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkYQuCEN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkYQuCEN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21B6C4CEDD;
	Thu, 10 Apr 2025 05:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744262088;
	bh=G9IDuBFDNO/tescOQZOemu/xYi/kWE+EXfWWY74ELwQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=OkYQuCENg97JbS/51rEpKAxtGkfiMmQv973Nkc7YN+cUlNAskwdtkx/V/buarYBgc
	 U9vQsRDJaIUPQ8LNKTg388nL0bKR9u+2E6gImGT6VEceJ/SWQ2eV4LfpKaQo+WJY4Q
	 VWOCAFMPiNU3jAGEQDARsv/VnPQcxxNslyIUaTaVutMrdf1lZsCY/YkyMMWuQ+By+j
	 fkxdUCKMp4ZkdGJFTI09J3e79pncjDWhAS7PkzloBww0BUsEE95MvgYNrlgDviu+I1
	 OfBcWHw4cILNyzzuBqNR82XaF9z45JuCv41ubJwIgEFcNIZmLDQ+K8hiVtlz0d5ljM
	 VyyjFTik1eWLA==
Message-ID: <46dbee1d-c1e9-414c-9f7f-8060bc2f9030@kernel.org>
Date: Thu, 10 Apr 2025 13:14:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, "yohan.joung" <yohan.joung@sk.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 pilhyun.kim@sk.com
Subject: Re: [PATCH v5] f2fs: prevent the current section from being selected
 as a victim during GC
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250403232107.2960-1-yohan.joung@sk.com>
 <Z_A5SWl1ueMTZxV0@google.com>
 <7059eada-a51d-4f68-b62a-0f2c89c9b01c@kernel.org>
 <87056483-6cf8-4b2e-82f1-dcda31a28afd@kernel.org>
 <Z_dAo3uD1jKraegq@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Z_dAo3uD1jKraegq@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/10/25 11:53, Jaegeuk Kim wrote:
> On 04/07, Chao Yu wrote:
>> On 4/7/25 10:08, Chao Yu wrote:
>>> On 4/5/25 03:55, Jaegeuk Kim wrote:
>>>> Hi Yohan,
>>>>
>>>> I modified this patch after applying the clean up by
>>>>
>>>> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
>>>>
>>>> --- a/fs/f2fs/segment.h
>>>> +++ b/fs/f2fs/segment.h
>>>> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>>>
>>>>         free_i->free_sections++;
>>>>
>>>> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
>>>> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
>>>> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>>
>>> Reviewed-by: Chao Yu <chao@kernel.org>
>>
>> Oh, can we add Fixes line to make it to be merged into stable kernel?
> 
> Which one would be good to add?

I guess this one:

Fixes: e3080b0120a1 ("f2fs: support subsectional garbage collection")

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>> +
>>>>  unlock_out:
>>>>         spin_unlock(&free_i->segmap_lock);
>>>>  }
>>>>
>>>> On 04/04, yohan.joung wrote:
>>>>> When selecting a victim using next_victim_seg in a large section, the
>>>>> selected section might already have been cleared and designated as the
>>>>> new current section, making it actively in use.
>>>>> This behavior causes inconsistency between the SIT and SSA.
>>>>>
>>>>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
>>>>> Call trace:
>>>>> dump_backtrace+0xe8/0x10c
>>>>> show_stack+0x18/0x28
>>>>> dump_stack_lvl+0x50/0x6c
>>>>> dump_stack+0x18/0x28
>>>>> f2fs_stop_checkpoint+0x1c/0x3c
>>>>> do_garbage_collect+0x41c/0x271c
>>>>> f2fs_gc+0x27c/0x828
>>>>> gc_thread_func+0x290/0x88c
>>>>> kthread+0x11c/0x164
>>>>> ret_from_fork+0x10/0x20
>>>>>
>>>>> issue scenario
>>>>> segs_per_sec=2
>>>>> - seg#0 and seg#1 are all dirty
>>>>> - all valid blocks are removed in seg#1
>>>>> - gc select this sec and next_victim_seg=seg#0
>>>>> - migrate seg#0, next_victim_seg=seg#1
>>>>> - checkpoint -> sec(seg#0, seg#1)  becomes free
>>>>> - allocator assigns sec(seg#0, seg#1) to curseg
>>>>> - gc tries to migrate seg#1
>>>>>
>>>>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>>> ---
>>>>>  fs/f2fs/segment.h | 9 ++++++++-
>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>>>>> index 0465dc00b349..0773283babfa 100644
>>>>> --- a/fs/f2fs/segment.h
>>>>> +++ b/fs/f2fs/segment.h
>>>>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>>>>  		next = find_next_bit(free_i->free_segmap,
>>>>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
>>>>>  		if (next >= start_segno + usable_segs) {
>>>>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
>>>>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
>>>>>  				free_i->free_sections++;
>>>>> +
>>>>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
>>>>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>>> +
>>>>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
>>>>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>>>> +			}
>>>>>  		}
>>>>>  	}
>>>>>  skip_free:
>>>>> -- 
>>>>> 2.33.0
>>>

