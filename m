Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF5C220689
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743796555; cv=none; b=OW62eVGf9/DRJjaIGMzqv37Ip5ih0I3dUXE6M9bW0XaavpewM21c0UNtqtDx2E/+vzuDpIccEa79ZNz8MZVhIIiWiPUmsZJVsS1t0IcAEasgt8tCFP8XHCqF0NEUvm5ChFKxgogtWYRC75AkP5OiosYlZlzXsw23R9cVky/4LUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743796555; c=relaxed/simple;
	bh=2kEGGwEpfW7hU23vb/09JvyfuhHSs2hXb2emfr4WRbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eveZKjf8LfFNQOU5xu7kfLmhPPDs171+UKSK74slcy4++cEgv1PDkzcTM1CsPIbJfwo3esTu3HpFRdMupynvdTceTzKlP2bc4up/GkgwGeMTVVJZPR70Vf00PwiiUqMb27GhL189M+fO+PU2EXdTtwPpEnbC3xML2Pazp15l8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4NI6yjw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4NI6yjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B14C4CEDD;
	Fri,  4 Apr 2025 19:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743796555;
	bh=2kEGGwEpfW7hU23vb/09JvyfuhHSs2hXb2emfr4WRbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4NI6yjwKYfqKhJM5ktdsD1ng6byy1XmmnH37NZ0AmhZARz7vJrDWz1gbPWWPnrUE
	 YDMbv7aNTDsOlSXmtdHCOfiAYKJgcrk7pT44hjdKVY1fLV3GaYPAeT2GxHWqI9gu1N
	 LWGRVS/hfBRSGR8UzwfoTgqaZgU4ZhC9owCXuOPqomTl+DPKFDDA+XcNRvLzI6MUE+
	 lPLtuXtFwwPb8qCotWIKC6tF6K7vvdgIXPaYIdDVt7Fby1fVJj9bGLs3QFzG/R9z0V
	 7QZIbm0kmgNC01bYGVQVKJz0FCFbV1otb33IBIWleK5HOvtzO3MGuZzzBNwpvDPsQ5
	 rMfdcTmBFzm+g==
Date: Fri, 4 Apr 2025 19:55:53 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "yohan.joung" <yohan.joung@sk.com>
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Subject: Re: [PATCH v5] f2fs: prevent the current section from being selected
 as a victim during GC
Message-ID: <Z_A5SWl1ueMTZxV0@google.com>
References: <20250403232107.2960-1-yohan.joung@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403232107.2960-1-yohan.joung@sk.com>

Hi Yohan,

I modified this patch after applying the clean up by

https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u

--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,

        free_i->free_sections++;

+       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
+               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
+       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
+               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
+
 unlock_out:
        spin_unlock(&free_i->segmap_lock);
 }

On 04/04, yohan.joung wrote:
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
>  fs/f2fs/segment.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 0465dc00b349..0773283babfa 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>  		next = find_next_bit(free_i->free_segmap,
>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
>  		if (next >= start_segno + usable_segs) {
> -			if (test_and_clear_bit(secno, free_i->free_secmap))
> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
>  				free_i->free_sections++;
> +
> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> +
> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> +			}
>  		}
>  	}
>  skip_free:
> -- 
> 2.33.0
