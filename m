Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1632E336E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579218; cv=none; b=Ak+UHgovlM4A5CEMI1BVfTqq0od+h6cfaL7kYMtQj/WRF6rjO9cpaFLl2tpudvioGKNLtw383vb7BBP3IoMlh3Zr4aC8DiUuIngJUcfsqUMHreTeykg7Y4xdYRqA3T/eVARBkBQVrXYNxCQXSmbRJhnNvG0j1guwCTd0Ozj8bsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579218; c=relaxed/simple;
	bh=b7/z+v+dRK3PsbS6by6MwpH6N9jR2YN5LuzxOdBQ5Mo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jGqXEnsuAKFogzFoaqb1Cow379HqM/m0MpLgM/PnYTtDmouf8GlAGBhH9rfUgH3sKlnFNCQIaGWMZ+EukKXpW9bkI4dcAXKb/6Bkq39qU1gL2Gq8TUScnEFy3XUwFHyMKg5CkE3xxQcPIfgdXSMUyXq9Sm+Z8ggNZPvVN8yl7Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNtpCe71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNtpCe71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E2BC4CEDD;
	Wed,  2 Apr 2025 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743579217;
	bh=b7/z+v+dRK3PsbS6by6MwpH6N9jR2YN5LuzxOdBQ5Mo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=YNtpCe711Nye01QngIJFBtC/uDDptYD02pfHLQnsiwI2jvWBmIPITGz095PdWRwJQ
	 22vowJSoC6C3Qw7/EgagYDR1OsDt+GWhjXVXzJHpxlhUtaScSnYMdZ72ZljN133Pid
	 /aV+ldylK4s/ZHOwZzYPEr3FFYHM9pVB7EYxwYAiAVshaKOvY9dyir8kYmw6VudIRq
	 GTjdaeSu+IGkk9V13cBbDKCBCllGQTMpwwkuwszR+BEsAFCaDCkia1HNj7//pS7M9z
	 XPA0OoBfPNzPT3UC1sWkzl7bTr7wGlqVlc8BZoiiV/oj1NO46OZmXi3LBLKvOKxKgd
	 bGPOqipzMRPjw==
Message-ID: <7440d324-03f4-44a6-b6bf-4f569c829214@kernel.org>
Date: Wed, 2 Apr 2025 15:33:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Subject: Re: [PATCH v2] f2fs: prevent the current section from being selected
 as a victim during GC
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250402005219.2759-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250402005219.2759-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/25 08:52, yohan.joung wrote:
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
>  fs/f2fs/segment.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 0465dc00b349..14d18bcf3559 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -460,6 +460,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>  		unsigned int segno, bool inmem)
>  {
>  	struct free_segmap_info *free_i = FREE_I(sbi);
> +	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>  	unsigned int next;
> @@ -476,6 +477,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>  		if (next >= start_segno + usable_segs) {
>  			if (test_and_clear_bit(secno, free_i->free_secmap))
>  				free_i->free_sections++;
> +
> +			if (test_and_clear_bit(secno, dirty_i->victim_secmap)) {
> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;

sbi->next_victim_seg[FG_GC] relies on sbi->cur_victim_sec?

If sbi->next_victim_seg[BG_GC] is not equal to secno, will we still need to
nullify sbi->next_victim_seg[BG_GC]?

We have cleared bit in victim_secmap after we tag a section as prefree, right?

- locate_dirty_segment
 - __locate_dirty_segment
 - __remove_dirty_segment
  - clear_bit(GET_SEC_FROM_SEG(sbi, segno), dirty_i->victim_secmap);

Thanks,

> +			}
>  		}
>  	}
>  skip_free:

