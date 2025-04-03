Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC006225A31
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663722; cv=none; b=BFWzizhRmSXmTdypWJst+IV0AC+Sq+3PjfT5M9x6ZhCcLxGN7lgJqGN17MhkmYsDcm0VwKTrmNkKyGEJG/9lPf3TbAOtj/jxCi5HB0WByJoHrDifN7irsWerDSvjAG5YVP44Y1Li+TIiTmT7eo+JMwbWifMcmFPUuZ74Dgd5qg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663722; c=relaxed/simple;
	bh=T2bDbnyLgtIwbRSnddgDmQrC1ahlmIgD3bQi0Zs3sTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYpc8F+ntCSiNILlmx/2IMg943FPRXR0++J4j031FSpo4HcqHHU6HwLzYvxnM0HD2A6zggCv3fC4Cq79g2nRNvqWUs65qATxufHdQzgqLFRzPWxsXL1Rcrq3O9ApobRTu/XeLRjaMTNnvBywyvRBYDV6CVbkvUYoOoJE2USGmpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-42-67ee3261a423
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: chao@kernel.org,
	jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: prevent the current section from being selected as a victim during GC
Date: Thu,  3 Apr 2025 16:01:51 +0900
Message-ID: <20250403070151.2894-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <002ea626-8468-4587-b481-10d8b9bd7a0f@kernel.org>
References: <002ea626-8468-4587-b481-10d8b9bd7a0f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsXC9ZZnkW6i0bt0g31H1C1OTz3LZPFk/Sxm
	i0uL3C0u75rD5sDisWlVJ5vH7gWfmTw+b5ILYI7isklJzcksSy3St0vgymidcIGp4IJoxfqj
	f5kbGC8LdjFycEgImEh8bU6DMd8diu9i5ORgE9CQ+NPbywxiiwhoSUxs+MsIYjMLlEr0Pl8G
	ZgsL5EmcOnSdCcRmEVCV+HB8O5jNK2AmcbTlEguILSGgKbHjy3mwOKeAncSHYwfBeoUEbCWu
	dDaxQNQLSpyc+YQFYr68RPPW2UB7uYB6v7JKTLn1gAlikKTEwRU3WCYw8s9C0jMLSc8CRqZV
	jCKZeWW5iZk5xnrF2RmVeZkVesn5uZsYgaG3rPZP5A7GbxeCDzEKcDAq8fB2XHubLsSaWFZc
	mXuIUYKDWUmEt1ALKMSbklhZlVqUH19UmpNafIhRmoNFSZzX6Ft5ipBAemJJanZqakFqEUyW
	iYNTqoGxZPn1cp6IzSI/Xmgpveu2KH7OZPlO1dH852rHDdO92+sl2+7LtdcpsBzzkZToblrw
	/M9Ts/9CafV7ErekpT+caeDj1qydf45RIMP9VOLeUK9H7LGyKxpKn8xWMuLdqvHoxdzjddUl
	G345tx5cpV6t7iG0I1ZGudHSbdu5G4s23z/51Tp9AZcSS3FGoqEWc1FxIgBUN6phOQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsXCNUNljm6i0bt0g9efxC1OTz3LZPFk/Sxm
	i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
	t0vgymidcIGp4IJoxfqjf5kbGC8LdjFycEgImEi8OxTfxcjJwSagIfGnt5cZxBYR0JKY2PCX
	EcRmFiiV6H2+DMwWFsiTOHXoOhOIzSKgKvHh+HYwm1fATOJoyyUWEFtCQFNix5fzYHFOATuJ
	D8cOgvUKCdhKXOlsYoGoF5Q4OfMJC8R8eYnmrbOZJzDyzEKSmoUktYCRaRWjSGZeWW5iZo6Z
	XnF2RmVeZoVecn7uJkZgOC2r/TNpB+O3y+6HGAU4GJV4eC+YvE0XYk0sK67MPcQowcGsJMJb
	qAUU4k1JrKxKLcqPLyrNSS0+xCjNwaIkzusVnpogJJCeWJKanZpakFoEk2Xi4JRqYLT8uuud
	YOi0D6sTJuk7pUk+5vZoe3jt/6nYLnaPRo/fy9J9Hbq+HFyqmPFLmX/GxO1ms5NuzLuyQmz2
	z4kX5zNOq/i8VaPz85LXz7NYFS/GbdlcdvePl/6vQrnrHT1sq8xYqiTjOmVu7XxWy/MjUkZH
	M+/Wnuiq7VvOi6gvWP3O4sJNl0InNRUlluKMREMt5qLiRABvm3ajIwIAAA==
X-CFilter-Loop: Reflected

On Thu, 3 Apr 2025 14:26:59 +0800 Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net> wrote:
> On 2025/4/2 16:04, yohan.joung wrote:
> > When selecting a victim using next_victim_seg in a large section, the
> > selected section might already have been cleared and designated as the
> > new current section, making it actively in use.
> > This behavior causes inconsistency between the SIT and SSA.
> > 
> > F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> > Call trace:
> > dump_backtrace+0xe8/0x10c
> > show_stack+0x18/0x28
> > dump_stack_lvl+0x50/0x6c
> > dump_stack+0x18/0x28
> > f2fs_stop_checkpoint+0x1c/0x3c
> > do_garbage_collect+0x41c/0x271c
> > f2fs_gc+0x27c/0x828
> > gc_thread_func+0x290/0x88c
> > kthread+0x11c/0x164
> > ret_from_fork+0x10/0x20
> > 
> > issue scenario
> > segs_per_sec=2
> > - seg#0 and seg#1 are all dirty
> > - all valid blocks are removed in seg#1
> > - gc select this sec and next_victim_seg=seg#0
> > - migrate seg#0, next_victim_seg=seg#1
> > - checkpoint -> sec(seg#0, seg#1)  becomes free
> > - allocator assigns sec(seg#0, seg#1) to curseg
> > - gc tries to migrate seg#1
> > 
> > Signed-off-by: yohan.joung <yohan.joung@sk.com>
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> >   fs/f2fs/segment.h | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index 0465dc00b349..129df633d656 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -476,6 +476,12 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >   		if (next >= start_segno + usable_segs) {
> >   			if (test_and_clear_bit(secno, free_i->free_secmap))
> >   				free_i->free_sections++;
> > +
> > +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
> > +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> > +
> > +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
> > +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> 
> Only need to reset next_victim_seg[] when setting section free?
Ah, I missed that. I'll put up the patch again right away.
Thanks. 
> 
> if (!test_and_clear_bit(secno, free_i->free_secmap))
> 	goto skip_free;
> 
> free_i->free_sections++;
> 
> if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
> 	sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
> 	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> 
> Thanks,
> 
> >   		}
> >   	}
> >   skip_free:
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
