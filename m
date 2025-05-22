Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B82122094
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903722; cv=none; b=BFO7AKyyw4QIP3Mv0NSOIgXVuHhrVT8jUsB4WEQYRNUyVw2QFGgLvP4+viI/jRE1b9X8vmoCdktGUFVfK3N4n7t/tqZgUfMhjNHidsmzsYJIbNFwwPAiSOzedzCQfAHNPTwCjExseAgkJ5/vWpHrvaeKAJb9Y1F6jEPfEd22UBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903722; c=relaxed/simple;
	bh=ihS6jkwVXe0kUJF4gL2lpj/kzxm1hhaKXnhv5yo54IE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uGniwXZlsjV7AeMqQTa9LuWZ+wSj/GR6iIeFoPNnphlzk0NzFA9hmKcI0UVH414rXPvykNgN5z47Q8M6eAqbPadkw1GsMON0M0uENLLPGmTpHANPV4MHXY0kTnU2qDtSgonCxjvH/6ca556KY1t4f3upCHiCkhWQ3j4uLBEWs4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISpwP48c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISpwP48c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712B8C4CEE4;
	Thu, 22 May 2025 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747903720;
	bh=ihS6jkwVXe0kUJF4gL2lpj/kzxm1hhaKXnhv5yo54IE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=ISpwP48cHIcaAomi9C+qGohjeUm7Ifa41pbI81itBQsrNgFPP9nxVOznyfRkGNKzs
	 gX5xAbUBwc6X3oehQ64ZtI9E0aGzYGvVcTuaLq47wSULCGjX15FgbWjicovYf8LEU4
	 yAX0CFZbqSFqV0tU2GFrZq+nmHkTL9bmcZDRqaQF238xE/eNcM1ujiOWN+UBO7YYGX
	 RdGToBmGbAk7Wp9FoHr0L20MYU+jImD+Uo8XZc/NXpkhrrE3P9k/ZoeXtkXpe2q677
	 MS/o2itsx9lEnuXFtVjpIk7fSLHpPl2adRuNeTaTU0CZ0BmtYYU5IcbaWyO2Dw5LPa
	 h7qB4lI7LRMew==
Message-ID: <4d5d4b7e-addd-4083-989f-f9c9cbcac04e@kernel.org>
Date: Thu, 22 May 2025 16:48:37 +0800
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] f2fs: fix missing small discard in fstrim
To: Chunhai Guo <guochunhai@vivo.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <20250102101310.580277-2-guochunhai@vivo.com>
 <b3f919fe-35a0-4253-91e9-fac8666bfbe2@kernel.org>
 <fd75a391-3dd1-4411-806e-0bbb363fcba3@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <fd75a391-3dd1-4411-806e-0bbb363fcba3@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/3/25 15:00, Chunhai Guo wrote:
> 在 1/3/2025 11:36 AM, Chao Yu 写道:
>> On 2025/1/2 18:13, Chunhai Guo wrote:
>>> If userspace issues an fstrim with a range that does not include all
>>> segments with small discards, these segments will be reused without being
>> I didn't get it, if fstrim didn't cover those segments, why do we need to
>> issue small discard for out-of-range segments?
> Currently, all the dirty sentries in the dirty_sentries_bitmap are 
> handled in the fstrim process regardless of whether they are within the 
> fstrim range or not. Therefore, this patch is necessary to address the 
> issue.

fstrim flow doesn't depend on dirty status of segments, right?

It will add discard range w/ below code?

	if (cpc->reason & CP_DISCARD) {
		__u64 trim_start = cpc->trim_start;

		for (; cpc->trim_start <= cpc->trim_end; cpc->trim_start++)
			add_discard_addrs(sbi, cpc, false);

		cpc->trim_start = trim_start;
	}

Thanks,

> 
> f2fs_flush_sit_entries()
>      list_for_each_entry_safe(ses, tmp, head, set_list) {
>          for_each_set_bit_from(segno, bitmap, end) {
>              ...
>              __clear_bit(segno, bitmap); // segno is cleared regardless 
> of whether or not it is within the fstrim range
>              ...
>          }
>      }
> 
> 
> Thanks,
> 
>> Thanks,
>>
>>> discarded. This patch fixes this issue.
>>> This patch is somewhat similar to commit 650d3c4e56e1 ("f2fs: fix a missing
>>> discard prefree segments").
>>>
>>> Fixes: d7bc2484b8d4 ("f2fs: fix small discards not to issue redundantly")
>>> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
>>> ---
>>>    fs/f2fs/segment.c | 10 +++++++---
>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 8fe9f794b581..af9a62591c49 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -4552,6 +4552,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>    	struct list_head *head = &SM_I(sbi)->sit_entry_set;
>>>    	bool to_journal = !is_sbi_flag_set(sbi, SBI_IS_RESIZEFS);
>>>    	struct seg_entry *se;
>>> +	bool force = (cpc->reason & CP_DISCARD);
>>> +	__u64 trim_start = cpc->trim_start;
>>>    
>>>    	down_write(&sit_i->sentry_lock);
>>>    
>>> @@ -4609,7 +4611,9 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>    #endif
>>>    
>>>    			/* add discard candidates */
>>> -			if (!(cpc->reason & CP_DISCARD)) {
>>> +			if (!force || (force &&
>>> +					(segno < trim_start ||
>>> +					 segno > cpc->trim_end))) {
>>>    				cpc->trim_start = segno;
>>>    				add_discard_addrs(sbi, cpc, false, false);
>>>    			}
>>> @@ -4649,8 +4653,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>    	f2fs_bug_on(sbi, !list_empty(head));
>>>    	f2fs_bug_on(sbi, sit_i->dirty_sentries);
>>>    out:
>>> -	if (cpc->reason & CP_DISCARD) {
>>> -		__u64 trim_start = cpc->trim_start;
>>> +	if (force) {
>>> +		cpc->trim_start = trim_start;
>>>    
>>>    		for (; cpc->trim_start <= cpc->trim_end; cpc->trim_start++)
>>>    			add_discard_addrs(sbi, cpc, true, false);
> 
> 

