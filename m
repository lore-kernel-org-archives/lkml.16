Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E76B2E3397
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 00:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743555184; cv=none; b=HRly7ibojs7ZUfIWWee0fBv3nfmQrbtJ60mmQDvSu8UOLOH/ZrvHJs00afkTdzZSJZAQiuqfhCGDHpx8P8EoQKpQ4lwR2piuVD+Zv7BXsqDVXc0P6dRZVY14PGW8i4nGUUGcejvYSDKy/6PjM6opKj21ebeTFtQkv+mBAFWuUkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743555184; c=relaxed/simple;
	bh=t5wWBOXu1Nqv2VkhvetOhiSyTW2cbmQu7ML2YP/6iL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQKKq7wpQI6M2iSFI+AlkWm+0RFtrvOj18/cAwJdd4g4PW4BZ0JZzfPGmOMOTuuT/2i/NuFkscZE/pispHMRQFu5d2xR/I+YpAwUwOiuMRG7eTsZXsOZ2MC3SRK3EAgRPRbuQpWuKrTxxTMswrcLCE/B+5r7DuTBsl4lAm1oCPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-3e-67ec8a6895c1
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: [PATCH v2] f2fs: prevent the current section from being selected as a victim during GC
Date: Wed,  2 Apr 2025 09:52:18 +0900
Message-ID: <20250402005219.2759-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LhesuzUDej6026wfFDMhanp55lsniyfhaz
	xaVF7haXd81hc2Dx2LSqk81j94LPTB6fN8kFMEdx2aSk5mSWpRbp2yVwZTRtMCl4zl/xbe9v
	tgbGmbxdjJwcEgImEnvWn2ODsRvWfGYCsdkENCT+9PYyg9giApoSRzpnsoPYzAJlEnv+HGEB
	sYUF4iXO/bkHVM/BwSKgKvHmvwRImFfATOLx1RYmiJGaEju+nGeCiAtKnJz5hAVijLxE89bZ
	QOO5gGpuskpsnnoe6gZJiYMrbrBMYOSdhaRnFpKeBYxMqxhFMvPKchMzc4z1irMzKvMyK/SS
	83M3MQJDaVntn8gdjN8uBB9iFOBgVOLhbeB9ky7EmlhWXJl7iFGCg1lJhDfi68t0Id6UxMqq
	1KL8+KLSnNTiQ4zSHCxK4rxG38pThATSE0tSs1NTC1KLYLJMHJxSDYx8exX+tImES/r5m/sK
	yhx1sPhw/vK6a0YzPj3ZyX/S+rWJeyWXpZLZ7qKub4q9O8/+6pohOWNuVFmhxylH0YLa5IJ5
	p+Y7Xpi8siduQqPNZ7vKawHHk9mabmfuyH5bFeaoXL4+Z2LGc0aV0/qG11y3rRBzT7jItmH3
	PImlqqcEL4RcLfGe91mJpTgj0VCLuag4EQBJEN9uIQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOJMWRmVeSWpSXmKPExsXCNUNljm5G15t0g4U94hanp55lsniyfhaz
	xaVF7haXd81hs5gw9yqTxfut9xgd2Dw2repk89i94DOTx7fbHh6fN8kFsERx2aSk5mSWpRbp
	2yVwZTRtMCl4zl/xbe9vtgbGmbxdjJwcEgImEg1rPjOB2GwCGhJ/enuZQWwRAU2JI50z2UFs
	ZoEyiT1/jrCA2MIC8RLn/twDqufgYBFQlXjzXwIkzCtgJvH4agsTxEhNiR1fzjNBxAUlTs58
	wgIxRl6ieets5gmMXLOQpGYhSS1gZFrFKJKZV5abmJljplecnVGZl1mhl5yfu4kRGBzLav9M
	2sH47bL7IUYBDkYlHt4G3jfpQqyJZcWVuYcYJTiYlUR4I76+TBfiTUmsrEotyo8vKs1JLT7E
	KM3BoiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpgzCh+e9GO4fIie7OmDuOTFvxCTovMN0Ve
	Sshs+J/6/mWgwLf0IBuXfK/uVbve/X2UxvfmJu/8ixP/GbBzCF12mebmmLLt7ISOPekZLY+y
	l8258eRqb5Gk3yeHC5ulN92ZtPRCW3eSVcy7vMzFs5681Quvanp/uMzp/bFf35sOHGev5bv4
	5srBICWW4oxEQy3mouJEAKHlf04KAgAA
X-CFilter-Loop: Reflected

When selecting a victim using next_victim_seg in a large section, the
selected section might already have been cleared and designated as the
new current section, making it actively in use.
This behavior causes inconsistency between the SIT and SSA.

F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
Call trace:
dump_backtrace+0xe8/0x10c
show_stack+0x18/0x28
dump_stack_lvl+0x50/0x6c
dump_stack+0x18/0x28
f2fs_stop_checkpoint+0x1c/0x3c
do_garbage_collect+0x41c/0x271c
f2fs_gc+0x27c/0x828
gc_thread_func+0x290/0x88c
kthread+0x11c/0x164
ret_from_fork+0x10/0x20

issue scenario
segs_per_sec=2
- seg#0 and seg#1 are all dirty
- all valid blocks are removed in seg#1
- gc select this sec and next_victim_seg=seg#0
- migrate seg#0, next_victim_seg=seg#1
- checkpoint -> sec(seg#0, seg#1)  becomes free
- allocator assigns sec(seg#0, seg#1) to curseg
- gc tries to migrate seg#1

Signed-off-by: yohan.joung <yohan.joung@sk.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0465dc00b349..14d18bcf3559 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -460,6 +460,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 		unsigned int segno, bool inmem)
 {
 	struct free_segmap_info *free_i = FREE_I(sbi);
+	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned int next;
@@ -476,6 +477,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 		if (next >= start_segno + usable_segs) {
 			if (test_and_clear_bit(secno, free_i->free_secmap))
 				free_i->free_sections++;
+
+			if (test_and_clear_bit(secno, dirty_i->victim_secmap)) {
+				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
+				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
+			}
 		}
 	}
 skip_free:
-- 
2.33.0

