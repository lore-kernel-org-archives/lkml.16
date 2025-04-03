Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E52907
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661618; cv=none; b=i6qIBfvLjKfnQ6XK1aZJq4mVjQtF8vELWeUG7Yn9w7G83PrGGASSDEMO3hBRN7f52D1EvlNCA2ziHKa8C5QTLnEU9HRMlCfw+Lluqh1kvxx9gPuHSNnLEQKf09tnAEIfkHoMD0JKuUdHbwsQTxXSOtEIhbJqSu8kbRbjB7HW5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661618; c=relaxed/simple;
	bh=fXrJUM8SeTerC0x9RnCZjNaU2MJi1ObxumgAG3z2PmU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=siN9bcuEUst9qae+Ixo910u6KGCoiPuSZGENR78nDsO17NJl8qx4zYGBjQPnXkx8AeHkKxUS3W+on+iJfSjuFcT1kvKyeLgl1lU8WKOoE3Ie34BrimHaOICaq9NJNFzhPGUhnPjH3VmiDIeqKVf2P0Psdosoon4l5sOVrhZewn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnZodorr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnZodorr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE4CC4CEE9;
	Thu,  3 Apr 2025 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743661618;
	bh=fXrJUM8SeTerC0x9RnCZjNaU2MJi1ObxumgAG3z2PmU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=ZnZodorrqaY28iosFNvCGb6554ZQmXVNAbOUXZtG8yfiI2XoOSt3EXCsKDVOBtmIV
	 EuRUCgboPsDxu45o/cJ8+zOVIosM5BHSeTFZecyffaZ1AJMn3MojxnQ6gzRKZlWrtI
	 d6PqAsRIIooPyfkS1L7mhY4CgL/bd6H6w/I0+Lre/+VAhmx9apxmG5nwCELquvYB2n
	 UORX65QowVHd7pDq9EhJbd8ORZcJf0t+tSo44DPEG5nozTq7wSL0g7o9+YFrp9HWkc
	 g2fwKR7hmQNdrsIKn67NbzlTCOSbKDU0GeMklAlu3sJVkUjI9enPg13o1nqmJWyKGA
	 qMsfMODpDRMTw==
Message-ID: <002ea626-8468-4587-b481-10d8b9bd7a0f@kernel.org>
Date: Thu, 3 Apr 2025 14:26:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Subject: Re: [PATCH v3] f2fs: prevent the current section from being selected
 as a victim during GC
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250402080428.2811-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250402080428.2811-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/4/2 16:04, yohan.joung wrote:
> When selecting a victim using next_victim_seg in a large section, the
> selected section might already have been cleared and designated as the
> new current section, making it actively in use.
> This behavior causes inconsistency between the SIT and SSA.
> 
> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> Call trace:
> dump_backtrace+0xe8/0x10c
> show_stack+0x18/0x28
> dump_stack_lvl+0x50/0x6c
> dump_stack+0x18/0x28
> f2fs_stop_checkpoint+0x1c/0x3c
> do_garbage_collect+0x41c/0x271c
> f2fs_gc+0x27c/0x828
> gc_thread_func+0x290/0x88c
> kthread+0x11c/0x164
> ret_from_fork+0x10/0x20
> 
> issue scenario
> segs_per_sec=2
> - seg#0 and seg#1 are all dirty
> - all valid blocks are removed in seg#1
> - gc select this sec and next_victim_seg=seg#0
> - migrate seg#0, next_victim_seg=seg#1
> - checkpoint -> sec(seg#0, seg#1)  becomes free
> - allocator assigns sec(seg#0, seg#1) to curseg
> - gc tries to migrate seg#1
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   fs/f2fs/segment.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 0465dc00b349..129df633d656 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -476,6 +476,12 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>   		if (next >= start_segno + usable_segs) {
>   			if (test_and_clear_bit(secno, free_i->free_secmap))
>   				free_i->free_sections++;
> +
> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> +
> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;

Only need to reset next_victim_seg[] when setting section free?

if (!test_and_clear_bit(secno, free_i->free_secmap))
	goto skip_free;

free_i->free_sections++;

if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
	sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;

Thanks,

>   		}
>   	}
>   skip_free:

