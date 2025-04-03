Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E147118DB29
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743722488; cv=none; b=qMsIr1RtzcXotbC6B+dDB/AEpuM5qEr3uya3WdLz0dmnmBmBOhcDnZAhskHyrXQCjfixkc0qyb2Tzyt4TIQ+Wfr8BGdNRfa3N8pEXl91aNXP65SLpLzwDfaot6RmUvIGIwjOhIrsUJTtK0HP7KdLcBbWzpC+p5jZjPfVm6/UAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743722488; c=relaxed/simple;
	bh=1TNQAizD14lVCO1/YFnAjl2uAj7TYB6W6D4LZFLcLBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZW1iXq7ukJM3nSafdNjUBJDV3JAedmUjYCh04um6DS/W0BTdpBE6u8iJ5kFxRxuDF9C4i7ml2qlh1xDWCgqQEWAQ4pEWsIzSEZoWqe55esoR9EugfTl5cZY7ascSGpYI6yJ3biXXvp6nuTAAxS8Ek8OmhbyeF52wdahFC3i/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-5c-67ef17e8b7e0
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: [PATCH v5] f2fs: prevent the current section from being selected as a victim during GC
Date: Fri,  4 Apr 2025 08:21:06 +0900
Message-ID: <20250403232107.2960-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LhesuzSPeF+Pt0g10b2SxOTz3LZPFk/Sxm
	i0uL3C0u75rD5sDisWlVJ5vH7gWfmTw+b5ILYI7isklJzcksSy3St0vgyjh74gJ7wT++it8n
	prA2MB7h6WLk5JAQMJHYOHs6I4y9aNIlMJtNQEPiT28vM4gtIqApcaRzJjuIzSxQJrHnzxEW
	EFtYIF7i7uYONhCbRUBVomPXMrBeXgEzie7Xf1kgZmpK7PhyngkiLihxcuYTFog58hLNW2cz
	Q9TcZJWYe1ALwpaUOLjiBssERt5ZSFpmIWlZwMi0ilEkM68sNzEzx1ivODujMi+zQi85P3cT
	IzCYltX+idzB+O1C8CFGAQ5GJR5ei8J36UKsiWXFlbmHGCU4mJVEeGW53qcL8aYkVlalFuXH
	F5XmpBYfYpTmYFES5zX6Vp4iJJCeWJKanZpakFoEk2Xi4JRqYFzzhFlv8sbpvhs/P3l+Ie5Z
	+VMfpSUtW5wuLcwtuGak/ceMnYFrCf8+3+C3On3enP+Yj09WMotpVl4iGBq46syFeWdnfS+Z
	yNe6Z1Ls2QXbpvgLO2vOFu/982TLzYezHx354aRal8Tc4DDRaolQfl2Su9S6R49YfIOvHQuy
	Ptuv8e5R60OBd8pKLMUZiYZazEXFiQDcP3A5IgIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJMWRmVeSWpSXmKPExsXCNUNlju5z8ffpBr9XWFicnnqWyeLJ+lnM
	FpcWuVtc3jWHzWLC3KtMFu+33mN0YPPYtKqTzWP3gs9MHt9ue3h83iQXwBLFZZOSmpNZllqk
	b5fAlXH2xAX2gn98Fb9PTGFtYDzC08XIySEhYCKxaNIlRhCbTUBD4k9vLzOILSKgKXGkcyY7
	iM0sUCax588RFhBbWCBe4u7mDjYQm0VAVaJj1zKwXl4BM4nu139ZIGZqSuz4cp4JIi4ocXLm
	ExaIOfISzVtnM09g5JqFJDULSWoBI9MqRpHMvLLcxMwcM73i7IzKvMwKveT83E2MwABZVvtn
	0g7Gb5fdDzEKcDAq8fBaFL5LF2JNLCuuzD3EKMHBrCTCK8v1Pl2INyWxsiq1KD++qDQntfgQ
	ozQHi5I4r1d4aoKQQHpiSWp2ampBahFMlomDU6qBMbnRR2r/vLAINjGllCe2pS9NTdLXX5OK
	bHt7O1n16/VIz90taRxB0mZBon4alWYs0aHmMaaT9mi8CK7mvPiwr+DtWnfreczbzu67qHX+
	voGbu2TpzKRI79lcwoU27tHH3rX/Wbfxd6Cn09USh6/PbH8ujLFv3r7lUAp76ocUtvlfhc0P
	BCgqsRRnJBpqMRcVJwIA72O5/wwCAAA=
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
 fs/f2fs/segment.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0465dc00b349..0773283babfa 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 		next = find_next_bit(free_i->free_segmap,
 				start_segno + SEGS_PER_SEC(sbi), start_segno);
 		if (next >= start_segno + usable_segs) {
-			if (test_and_clear_bit(secno, free_i->free_secmap))
+			if (test_and_clear_bit(secno, free_i->free_secmap)) {
 				free_i->free_sections++;
+
+				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
+					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
+
+				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
+					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
+			}
 		}
 	}
 skip_free:
-- 
2.33.0

