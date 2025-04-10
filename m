Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D0129D0B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744261986; cv=none; b=K1uW8JYHqP3aPRO6q/2/E8hOx0brBL9czDBRRULJb5eVxuh8Dr8OKh+LXx9n7Zf+PGgBFvXd2CECWM5YPdM2ZdDvScy6zooMHM4xNwdD5squ0dTWxKtuQq4TO38yFohiEdNcA69n9fDPlZI67M3SxKfZBAT/Ot13lsaHnPoFcrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744261986; c=relaxed/simple;
	bh=yYu1lpcWwBWDPt4HMHhjf1QFhbF1yfmg/o8VrBIKl+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Acemn7HzEIytDzs5PcrXIOADDwR5bz3wP6SMjLNR2yta504OaRrYNYLYsBywM3eL0EGO/cPWqfmBsIOCFmBkxkjDw2/V/uw1aobMhOzbh0RjlxSkT3sxZZ6A3XXzhB3FxnolFYZLL7hH/wGbuhq7S1C0YO4eerpZjKdYgBYt/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-78-67f75359a1da
From: "yohan.joung" <yohan.joung@sk.com>
To: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Cc: pilhyun.kim@sk.com,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: prevent the current section from being selected as a victim during GC
Date: Thu, 10 Apr 2025 14:12:39 +0900
Message-ID: <20250410051244.1870-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <Z_dAo3uD1jKraegq@google.com> (raw)
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrELMWRmVeSWpSXmKPExsXC9ZZnoW5k8Pd0g8/z+C1OTz3LZHFpkbvF
	5V1z2ByYPTat6mTz2L3gM5PH501yAcxRXDYpqTmZZalF+nYJXBmfX/SyFcyXrejYcZq5gfGL
	WBcjJ4eEgIlE97+jbDB2e8srRhCbTUBD4k9vL3MXIweHiICvxMwtISBhZoFgiT9LfoGVCwvk
	SUx/eJIZxGYRUJX4t+omK4jNK2Amcen1H3aIkZoSO76cZwKxOQUMJHafnQU2XkiAR+LVhv2M
	EPWCEidnPmGBmC8v0bx1NtBMLqDel6wSL35cYoIYJClxcMUNlgmM/LOQ9MxC0rOAkWkVo0hm
	XlluYmaOsV5xdkZlXmaFXnJ+7iZGYMgtq/0TuYPx24XgQ4wCHIxKPLweGd/ShVgTy4orcw8x
	SnAwK4nwehp+TxfiTUmsrEotyo8vKs1JLT7EKM3BoiTOa/StPEVIID2xJDU7NbUgtQgmy8TB
	KdXAyLx1xiTl1tjinXLOrpmZm1W36TMHiPRPaTyrOWflvOsW85r6mJOE9fWy8qJZ19Zuyb38
	TsHt2nul5fentLuvd/cN8rm1tj6Ou1a6JXei3IQjy7K54u5Gbr7IV13M93xakrnGA+u+Y9uV
	Sh8seWCZY8ZqnLT81tZbU6ZvnPP02uwCj6ev/BVClFiKMxINtZiLihMBtoOFozUCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjluLIzCtJLcpLzFFi42LhmqEyRzcy+Hu6wZkj7Banp55lsri0yN3i
	8q45bBYT5l5lcmDx2LSqk81j94LPTB7fbnt4fN4kF8ASxWWTkpqTWZZapG+XwJXx+UUvW8F8
	2YqOHaeZGxi/iHUxcnJICJhItLe8YgSx2QQ0JP709jJ3MXJwiAj4SszcEgISZhYIlviz5Bcb
	iC0skCcx/eFJZhCbRUBV4t+qm6wgNq+AmcSl13/YIUZqSuz4cp4JxOYUMJDYfXYW2HghAR6J
	Vxv2M0LUC0qcnPmEBWK+vETz1tnMExh5ZiFJzUKSWsDItIpRJDOvLDcxM8dMrzg7ozIvs0Iv
	OT93EyMwdJbV/pm0g/HbZfdDjAIcjEo8vB4Z39KFWBPLiitzDzFKcDArifB6Gn5PF+JNSays
	Si3Kjy8qzUktPsQozcGiJM7rFZ6aICSQnliSmp2aWpBaBJNl4uCUamB0uqehc5tbyOiA/T1R
	jY7vaz/8WXluwsWDj9U0pxy68X5+V4m61RPLzEbBH4f39S6O8L8uw8is2Hzy3p4tW+VlFGI7
	Jd3ehC7aMFG4tcpp1ZyuaXp6vQYTW+OLnxXMtTRnvst8ameaX6lZUdVsk3Was4uvWYhOrYjf
	+eTMbdZPKzTcbnCHrH6mxFKckWioxVxUnAgA+LAEhBkCAAA=
X-CFilter-Loop: Reflected

On Thu, 10 Apr 2025 03:53:07 +0000	[thread overview] Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net> wrote:
> On 04/07, Chao Yu wrote:
> > On 4/7/25 10:08, Chao Yu wrote:
> > > On 4/5/25 03:55, Jaegeuk Kim wrote:
> > >> Hi Yohan,
> > >>
> > >> I modified this patch after applying the clean up by
> > >>
> > >> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
> > >>
> > >> --- a/fs/f2fs/segment.h
> > >> +++ b/fs/f2fs/segment.h
> > >> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> > >>
> > >>         free_i->free_sections++;
> > >>
> > >> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> > >> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> > >> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> > >> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> > > 
> > > Reviewed-by: Chao Yu <chao@kernel.org>
> > 
> > Oh, can we add Fixes line to make it to be merged into stable kernel?
> 
> Which one would be good to add?
jaegeuk, please apply the patch above
Thanks
> > 
> > Thanks,
> > 
> > > 
> > > Thanks,
> > > 
> > >> +
> > >>  unlock_out:
> > >>         spin_unlock(&free_i->segmap_lock);
> > >>  }
> > >>
> > >> On 04/04, yohan.joung wrote:
> > >>> When selecting a victim using next_victim_seg in a large section, the
> > >>> selected section might already have been cleared and designated as the
> > >>> new current section, making it actively in use.
> > >>> This behavior causes inconsistency between the SIT and SSA.
> > >>>
> > >>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> > >>> Call trace:
> > >>> dump_backtrace+0xe8/0x10c
> > >>> show_stack+0x18/0x28
> > >>> dump_stack_lvl+0x50/0x6c
> > >>> dump_stack+0x18/0x28
> > >>> f2fs_stop_checkpoint+0x1c/0x3c
> > >>> do_garbage_collect+0x41c/0x271c
> > >>> f2fs_gc+0x27c/0x828
> > >>> gc_thread_func+0x290/0x88c
> > >>> kthread+0x11c/0x164
> > >>> ret_from_fork+0x10/0x20
> > >>>
> > >>> issue scenario
> > >>> segs_per_sec=2
> > >>> - seg#0 and seg#1 are all dirty
> > >>> - all valid blocks are removed in seg#1
> > >>> - gc select this sec and next_victim_seg=seg#0
> > >>> - migrate seg#0, next_victim_seg=seg#1
> > >>> - checkpoint -> sec(seg#0, seg#1)  becomes free
> > >>> - allocator assigns sec(seg#0, seg#1) to curseg
> > >>> - gc tries to migrate seg#1
> > >>>
> > >>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> > >>> Signed-off-by: Chao Yu <chao@kernel.org>
> > >>> ---
> > >>>  fs/f2fs/segment.h | 9 ++++++++-
> > >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > >>> index 0465dc00b349..0773283babfa 100644
> > >>> --- a/fs/f2fs/segment.h
> > >>> +++ b/fs/f2fs/segment.h
> > >>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> > >>>  		next = find_next_bit(free_i->free_segmap,
> > >>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
> > >>>  		if (next >= start_segno + usable_segs) {
> > >>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
> > >>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
> > >>>  				free_i->free_sections++;
> > >>> +
> > >>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> > >>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> > >>> +
> > >>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> > >>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> > >>> +			}
> > >>>  		}
> > >>>  	}
> > >>>  skip_free:
> > >>> -- 
> > >>> 2.33.0
> > > 
