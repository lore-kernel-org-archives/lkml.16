Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062B1E9B3C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257190; cv=none; b=H0bM1z1HEvWfMKQfeoR7k9Ww7Q2BnY6Lpn/cf1aPT6PkPEC5VBbSMPEsN0Z8MssDNz3mDK8jJpacBlYsHP/wiPoErKT+5zAlzwomWaJ65+AlDDVBi82zXwmSSjLgfqB+xelpHe9333kerMLtSuvuJxHqZkYA/HxrJLW00ck0qoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257190; c=relaxed/simple;
	bh=xZRnulTgJaXmjhTZz+dTF52Wj71JRTbBd/c0uCNWeCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCqRUZYbq6qU4AlJltSRZLIL7xp6e6nRdcnZlHC7cUiTqP+Cji9VI6uB/XoZUGEXbei6LVU8KGqg+59FNv+OmSSop64is2CLsXuOx3j5SC6mnesX8bpxzGWM2Zxx/GLjBaCAAhK5dVa3hHJjSwjxFo/ZHesbmpmNr9vWiZnqEXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGyJvDEh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGyJvDEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCAAC4CEDD;
	Thu, 10 Apr 2025 03:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744257189;
	bh=xZRnulTgJaXmjhTZz+dTF52Wj71JRTbBd/c0uCNWeCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGyJvDEhmxUcgsH5hD1OIkht6AdvSEq4Opdr/nJ899yCLbAnN2i4PuW0Q9WyZ1IBH
	 AIa1iE9cmvdGggoWuXSmc+oY8uQiLgB0seqH8cy7lT0qv/35WclMEgB0jlk6VDv4JF
	 /AtGPbzYU9ZJFLKP2FdIqjZL1MfeOFdZ9YK45jvsowNYPrDROYltXMOUqeUBdkrLEA
	 IvDIWASAe1nJ3+Q5+JXXpffMC/w4VoRX4Td5AVxELoHGQBaKjnpkY5TIHLD2APQU90
	 vi73bz+CXCcjrZaF4+X6ssJzSEyfzHoShgERdefO+gMC/R0t8B7rArFlYiiLlVu5mf
	 z3wKMfxwX2+mQ==
Date: Thu, 10 Apr 2025 03:53:07 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: "yohan.joung" <yohan.joung@sk.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Subject: Re: [PATCH v5] f2fs: prevent the current section from being selected
 as a victim during GC
Message-ID: <Z_dAo3uD1jKraegq@google.com>
References: <20250403232107.2960-1-yohan.joung@sk.com>
 <Z_A5SWl1ueMTZxV0@google.com>
 <7059eada-a51d-4f68-b62a-0f2c89c9b01c@kernel.org>
 <87056483-6cf8-4b2e-82f1-dcda31a28afd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87056483-6cf8-4b2e-82f1-dcda31a28afd@kernel.org>

On 04/07, Chao Yu wrote:
> On 4/7/25 10:08, Chao Yu wrote:
> > On 4/5/25 03:55, Jaegeuk Kim wrote:
> >> Hi Yohan,
> >>
> >> I modified this patch after applying the clean up by
> >>
> >> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
> >>
> >> --- a/fs/f2fs/segment.h
> >> +++ b/fs/f2fs/segment.h
> >> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >>
> >>         free_i->free_sections++;
> >>
> >> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> >> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> >> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> >> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> > 
> > Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Oh, can we add Fixes line to make it to be merged into stable kernel?

Which one would be good to add?

> 
> Thanks,
> 
> > 
> > Thanks,
> > 
> >> +
> >>  unlock_out:
> >>         spin_unlock(&free_i->segmap_lock);
> >>  }
> >>
> >> On 04/04, yohan.joung wrote:
> >>> When selecting a victim using next_victim_seg in a large section, the
> >>> selected section might already have been cleared and designated as the
> >>> new current section, making it actively in use.
> >>> This behavior causes inconsistency between the SIT and SSA.
> >>>
> >>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> >>> Call trace:
> >>> dump_backtrace+0xe8/0x10c
> >>> show_stack+0x18/0x28
> >>> dump_stack_lvl+0x50/0x6c
> >>> dump_stack+0x18/0x28
> >>> f2fs_stop_checkpoint+0x1c/0x3c
> >>> do_garbage_collect+0x41c/0x271c
> >>> f2fs_gc+0x27c/0x828
> >>> gc_thread_func+0x290/0x88c
> >>> kthread+0x11c/0x164
> >>> ret_from_fork+0x10/0x20
> >>>
> >>> issue scenario
> >>> segs_per_sec=2
> >>> - seg#0 and seg#1 are all dirty
> >>> - all valid blocks are removed in seg#1
> >>> - gc select this sec and next_victim_seg=seg#0
> >>> - migrate seg#0, next_victim_seg=seg#1
> >>> - checkpoint -> sec(seg#0, seg#1)  becomes free
> >>> - allocator assigns sec(seg#0, seg#1) to curseg
> >>> - gc tries to migrate seg#1
> >>>
> >>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> >>> Signed-off-by: Chao Yu <chao@kernel.org>
> >>> ---
> >>>  fs/f2fs/segment.h | 9 ++++++++-
> >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> >>> index 0465dc00b349..0773283babfa 100644
> >>> --- a/fs/f2fs/segment.h
> >>> +++ b/fs/f2fs/segment.h
> >>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >>>  		next = find_next_bit(free_i->free_segmap,
> >>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
> >>>  		if (next >= start_segno + usable_segs) {
> >>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
> >>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
> >>>  				free_i->free_sections++;
> >>> +
> >>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> >>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> >>> +
> >>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> >>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> >>> +			}
> >>>  		}
> >>>  	}
> >>>  skip_free:
> >>> -- 
> >>> 2.33.0
> > 
