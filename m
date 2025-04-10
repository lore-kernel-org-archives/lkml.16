Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C1719E975
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744262649; cv=none; b=aHEXXGBVXYuEHjohlmLsSBIthGXQzfbChqprZsYdpyZmWJKQbIm5E2UoFCQOR5KwbON3NVZZbVK07eDOD4S/11bVCCB3xVS5P4r2FLFxXw+CASuu960YlE8mONEvZru11/N2vD1ovfTFM+zExf2q4l7HwSjq/DdTGoDNg6ZFL18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744262649; c=relaxed/simple;
	bh=45xxdm3AlVmZ5DosbCB1BpmXEPfDJ3dwMPc075YgBHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfuym14y5ttZ5raJGdJTF3ZMYwPizWi54XlSQZGjSjPnRAqYkhw1ZO9WVoHRg/TPfM0xjJeqNKF8Zwc3w/RNniRyBPjErvSFK1KV/8H6nKWa2SXXym95CIAmibZGMYWEx/UqRCeTWLg10ycEpAOmFiuXKuaJklwC0G2wn5onbrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-35-67f755f181ca
From: "yohan.joung" <yohan.joung@sk.com>
To: "yohan.joung" <yohan.joung@sk.com>
Cc: pilhyun.kim@sk.com,
	linux-kernel@vger.kernel.org,
	Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: prevent the current section from being selected as a victim during GC
Date: Thu, 10 Apr 2025 14:23:37 +0900
Message-ID: <20250410052347.1928-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250410051244.1870-1-yohan.joung@sk.com> (raw)
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXC9ZZnoe7H0O/pBsdWsltcWuRucXnXHDYH
	Jo/dCz4zeXzeJBfAFMVlk5Kak1mWWqRvl8CVcf5YB1PBM/mKix3XmRsYT0h0MXJySAiYSPx6
	2MAOY8/dsIIRxGYT0JD409vLDGKLCKhJLH/5HijOxcEs0MwocWHeFhaQhLBAnsT0hyfBilgE
	VCVe7L0AFucVMJPYeu02K8RQTYkdX84zgdicArYSGw4tBIsLCfBIvNqwnxGiXlDi5MwnYL3M
	AvISzVtnM4MskxB4yCrRMOUn1CBJiYMrbrBMYOSfhaRnFpKeBYxMqxhFMvPKchMzc4z1irMz
	KvMyK/SS83M3MQJDbFntn8gdjN8uBB9iFOBgVOLh9cj4li7EmlhWXJl7iFGCg1lJhNfT8Hu6
	EG9KYmVValF+fFFpTmrxIUZpDhYlcV6jb+UpQgLpiSWp2ampBalFMFkmDk6pBsZKqa01t2M+
	zLB9bB0hWPYn36Z3/QOFqHfXl397EwD0d1jxhYkN/h/zhaNt42aeDg8sWrLEr/JI/m324uhA
	rXf7/ISbWaaJHlrIOKemR//ZzxW9vgZxohs1Wit3iTAHpF/mr70gp5CwJIYhTsVy9/xdPXoR
	FoZXUg+z7Fq9026BbaHYKqnbSizFGYmGWsxFxYkA9kDRCC0CAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmluLIzCtJLcpLzFFi42LhmqEyR/dj6Pd0g/a/jBaXFrlbXN41h81i
	wtyrTBbvt95jdGDx2L3gM5PHt9seHp83yQUwR3HZpKTmZJalFunbJXBlnD/WwVTwTL7iYsd1
	5gbGExJdjJwcEgImEnM3rGAEsdkENCT+9PYyg9giAmoSy1++B4pzcTALNDNKXJi3hQUkISyQ
	JzH94UmwIhYBVYkXey+AxXkFzCS2XrvNCjFUU2LHl/NMIDangK3EhkMLweJCAjwSrzbsZ4So
	F5Q4OfMJWC+zgLxE89bZzBMYeWYhSc1CklrAyLSKUSQzryw3MTPHTK84O6MyL7NCLzk/dxMj
	MGiW1f6ZtIPx22X3Q4wCHIxKPLweGd/ShVgTy4orcw8xSnAwK4nwehp+TxfiTUmsrEotyo8v
	Ks1JLT7EKM3BoiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpgTDERdeCa/DwncC97vYII98S4
	PwwfX+4Mulcsvd1NvKazJ/TU/bVJJ9vO2DddbXpvssI5aBvf823SqxJO3bZPcE2U75/TIc26
	S2HvLuHLQvWmu6LmX5LJmK97+ZJOSLeHyJ85beHav4QKPHfd/Cqq4vlHVFkhIy09qUHpVrdG
	xXe/LFURR1YlluKMREMt5qLiRAB2UMbXFgIAAA==
X-CFilter-Loop: Reflected

On Thu, 10 Apr 2025 14:12:39 +0900	[thread overview] "yohan.joung" <yohan.joung@sk.com> wrote:
> On Thu, 10 Apr 2025 03:53:07 +0000	[thread overview] Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net> wrote:
> > On 04/07, Chao Yu wrote:
> > > On 4/7/25 10:08, Chao Yu wrote:
> > > > On 4/5/25 03:55, Jaegeuk Kim wrote:
> > > >> Hi Yohan,
> > > >>
> > > >> I modified this patch after applying the clean up by
> > > >>
> > > >> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
> > > >>
> > > >> --- a/fs/f2fs/segment.h
> > > >> +++ b/fs/f2fs/segment.h
> > > >> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> > > >>
> > > >>         free_i->free_sections++;
> > > >>
> > > >> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> > > >> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> > > >> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> > > >> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> > > > 
> > > > Reviewed-by: Chao Yu <chao@kernel.org>
> > > 
> > > Oh, can we add Fixes line to make it to be merged into stable kernel?
> > 
> > Which one would be good to add?
> jaegeuk, please apply the patch above
> Thanks
sorry it is correct to apply the one below.
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > >> +
> > > >>  unlock_out:
> > > >>         spin_unlock(&free_i->segmap_lock);
> > > >>  }
> > > >>
> > > >> On 04/04, yohan.joung wrote:
> > > >>> When selecting a victim using next_victim_seg in a large section, the
> > > >>> selected section might already have been cleared and designated as the
> > > >>> new current section, making it actively in use.
> > > >>> This behavior causes inconsistency between the SIT and SSA.
> > > >>>
> > > >>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> > > >>> Call trace:
> > > >>> dump_backtrace+0xe8/0x10c
> > > >>> show_stack+0x18/0x28
> > > >>> dump_stack_lvl+0x50/0x6c
> > > >>> dump_stack+0x18/0x28
> > > >>> f2fs_stop_checkpoint+0x1c/0x3c
> > > >>> do_garbage_collect+0x41c/0x271c
> > > >>> f2fs_gc+0x27c/0x828
> > > >>> gc_thread_func+0x290/0x88c
> > > >>> kthread+0x11c/0x164
> > > >>> ret_from_fork+0x10/0x20
> > > >>>
> > > >>> issue scenario
> > > >>> segs_per_sec=2
> > > >>> - seg#0 and seg#1 are all dirty
> > > >>> - all valid blocks are removed in seg#1
> > > >>> - gc select this sec and next_victim_seg=seg#0
> > > >>> - migrate seg#0, next_victim_seg=seg#1
> > > >>> - checkpoint -> sec(seg#0, seg#1)  becomes free
> > > >>> - allocator assigns sec(seg#0, seg#1) to curseg
> > > >>> - gc tries to migrate seg#1
> > > >>>
> > > >>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> > > >>> Signed-off-by: Chao Yu <chao@kernel.org>
> > > >>> ---
> > > >>>  fs/f2fs/segment.h | 9 ++++++++-
> > > >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > > >>> index 0465dc00b349..0773283babfa 100644
> > > >>> --- a/fs/f2fs/segment.h
> > > >>> +++ b/fs/f2fs/segment.h
> > > >>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> > > >>>  		next = find_next_bit(free_i->free_segmap,
> > > >>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
> > > >>>  		if (next >= start_segno + usable_segs) {
> > > >>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
> > > >>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
> > > >>>  				free_i->free_sections++;
> > > >>> +
> > > >>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> > > >>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> > > >>> +
> > > >>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> > > >>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> > > >>> +			}
> > > >>>  		}
> > > >>>  	}
> > > >>>  skip_free:
> > > >>> -- 
> > > >>> 2.33.0
