Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C121EC4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749295342; cv=none; b=S6SY9ZB3flFDunSSnVUS1fEwPpBOU8XSu7+OR9fB07clFZxxbBcuwgSjVoKXhZEv2ezmtrZxyMMhQxeBRHTtNCaWzQ6AoGNDwx8/FBGQVtNCdJXZNAm3G6hxLaDVavheAvQ3V3sKWKZv9qoIeoYp/gh4RQA+Dsbp0GnO+c4lu+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749295342; c=relaxed/simple;
	bh=s5yMSCcYSIASPVhnuY5XlnyHmjAvCOPsKONTqm3McmU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o1RIq2y6d2dEv1PYwXpviVFAdkuHckbhiAF1jV2jaYg6RT5JI2YU60zCeoCQ0/Q1HzZepIGOdqXRfokcfjRseUwK85y6RwUHW6K+xrzO1I3MZIft9LVxa8jPaGUuLY8oexEczsE/sHTKLLkEaM/eBNDlg6C4I849jDnRYcsQ7wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3WBCtuI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3WBCtuI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3E4C4CEE4;
	Sat,  7 Jun 2025 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749295342;
	bh=s5yMSCcYSIASPVhnuY5XlnyHmjAvCOPsKONTqm3McmU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=P3WBCtuINSNv5XjNJ969epVWAzQTDKmkB3uvQ/nEXY1Xu32HpR0pRimWzXV54kz6C
	 zX0Fc4HCUo/AyVz32Sbz3dS1BJKCPekT6R3LMGE2a9JJMy9eIYhsqupuKoGAVE3pkS
	 D3ycTjN9BD9LhQUQtFF3/OwVKU0SJsxtM53iKd71hwOzlvz+PD3iAnpttPi9iQ2M8+
	 mH84Q43ipss5B3XmIdqxKayiT63xAubFPrrhqpg8US4FAIFzCMzK+7btQTCH2v5qVM
	 VgNaakgooQhVIl3BxjZYwGpOyW9xlrwmonV5A4kzZ7GVGiSsZgyUUWEn/YElF35TbL
	 LXXCRle3cUhrg==
Message-ID: <3453f0f0-263c-43f6-be6f-85fc0bbaed4f@kernel.org>
Date: Sat, 7 Jun 2025 19:22:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: add gc_boost_gc_multiple sysfs node
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250606192017.439733-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250606192017.439733-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/7 3:20, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add a sysfs knob to set a multiplier for the background GC migration
> window when F2FS Garbage Collection is boosted.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
>   fs/f2fs/gc.c                            | 3 ++-
>   fs/f2fs/gc.h                            | 1 +
>   fs/f2fs/sysfs.c                         | 2 ++
>   4 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bf03263b9f46..931c1f63aa2e 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -861,3 +861,11 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
>   		SB_ENC_STRICT_MODE_FL            0x00000001
>   		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
>   		============================     ==========
> +
> +What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
> +Date:		June 2025
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Set a multiplier for the background GC migration window when F2FS GC is
> +		boosted.
> +		Default: 5

Do we need to add lower/upper boundary during setting the value via sysfs entry?

Thanks,

> +
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 3cb5242f4ddf..de7e59bc0906 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -197,6 +197,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>   
>   	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
>   	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
> +	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
>   
>   	if (f2fs_sb_has_blkzoned(sbi)) {
>   		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
> @@ -1749,7 +1750,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   					!has_enough_free_blocks(sbi,
>   					sbi->gc_thread->boost_zoned_gc_percent))
>   				window_granularity *=
> -					BOOST_GC_MULTIPLE;
> +					sbi->gc_thread->boost_gc_multiple;
>   
>   			end_segno = start_segno + window_granularity;
>   		}
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..efa1968810a0 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -68,6 +68,7 @@ struct f2fs_gc_kthread {
>   	unsigned int no_zoned_gc_percent;
>   	unsigned int boost_zoned_gc_percent;
>   	unsigned int valid_thresh_ratio;
> +	unsigned int boost_gc_multiple;
>   };
>   
>   struct gc_inode_list {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..b0270b1c939c 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1050,6 +1050,7 @@ GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
>   GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
> +GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
>   
>   /* SM_INFO ATTR */
>   SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> @@ -1220,6 +1221,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_no_zoned_gc_percent),
>   	ATTR_LIST(gc_boost_zoned_gc_percent),
>   	ATTR_LIST(gc_valid_thresh_ratio),
> +	ATTR_LIST(gc_boost_gc_multiple),
>   	ATTR_LIST(gc_idle),
>   	ATTR_LIST(gc_urgent),
>   	ATTR_LIST(reclaim_segments),

