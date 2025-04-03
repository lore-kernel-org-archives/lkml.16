Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0690B1A239E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664227; cv=none; b=XT27nqgTWyR8WgXSEj8NU2HEjuEChaBA/bKXZ6wmVYY95YmUewshdAKIKTjsnoqZ3Zq0YL8CqtL9IRHgvv0sL3ggxYbOAK5G2pYLeBHmpWUKsyeFhybyhHM3Sq6keiqo4/WH26dK3BYXP8MMUSvJAAXNFDZqoICVelaS8gccMSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664227; c=relaxed/simple;
	bh=8FXCEIRHZh9RPlPWKB4yM3O/Z0E5HLbFPQkYMDn6SCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kc/NRLdBEIrJu4RDqOhf+BJvRH9SL5xLuAiBSqwvfEY8oeFrxEDGkGeGTp1g4+DQm8O0qIex5R6+q191cnRWxLWHvEJ7ccY6U2qJZhTcgfx1Mai1ii++BClHVtFU05Xatf3m5mcYvWV4/dd+Bi9pAVkq6kQHjuAfbKb4d/IJIY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-aa-67ee345b08a5
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: [PATCH v4] f2fs: prevent the current section from being selected as a victim during GC
Date: Thu,  3 Apr 2025 16:10:15 +0900
Message-ID: <20250403071016.2940-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LhesuzSDfa5F26wf9nwhanp55lsniyfhaz
	xaVF7haXd81hc2Dx2LSqk81j94LPTB6fN8kFMEdx2aSk5mSWpRbp2yVwZcz/dIyp4AtfxfxF
	Z9kaGPfwdDFyckgImEg8+3WRvYuRA8x+sJQXJMwmoCHxp7eXGcQWEdCUONI5kx3EZhYok9jz
	5wgLSLmwQLxE1z9NkDCLgKrEuQedYCW8AmYSBy7/YoKYrimx48t5Joi4oMTJmU9YIMbISzRv
	nQ00nguo5i6rxLInJ1ggGiQlDq64wTKBkXcWkp5ZSHoWMDKtYhTJzCvLTczMMdYrzs6ozMus
	0EvOz93ECAylZbV/IncwfrsQfIhRgINRiYe349rbdCHWxLLiytxDjBIczEoivIVaQCHelMTK
	qtSi/Pii0pzU4kOM0hwsSuK8Rt/KU4QE0hNLUrNTUwtSi2CyTBycUg2MefocK4Qm/wo/abtx
	06w+ToUJoSdZ2fPnTZjJGjn9UVjbrHV/ZgWcXHDx8uvXf65FrfjD/WJZi76ArMKl3jyVdn+/
	zR71/OK+d3wXNUXLTDwgceaPyDKhtOll815emX1j5q99v3zntPiIevSeZvrbeSYzaXOBg8p5
	vcrm2DlNbLbcjDnCLtySSizFGYmGWsxFxYkAVY1cziECAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOJMWRmVeSWpSXmKPExsXCNUNljm60ybt0gysPeS1OTz3LZPFk/Sxm
	i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
	t0vgypj/6RhTwRe+ivmLzrI1MO7h6WLk4JAQMJF4sJS3i5GTg01AQ+JPby8ziC0ioClxpHMm
	O4jNLFAmsefPERaQcmGBeImuf5ogYRYBVYlzDzrBSngFzCQOXP7FBGJLALXu+HKeCSIuKHFy
	5hMWiDHyEs1bZzNPYOSahSQ1C0lqASPTKkaRzLyy3MTMHDO94uyMyrzMCr3k/NxNjMDgWFb7
	Z9IOxm+X3Q8xCnAwKvHwXjB5my7EmlhWXJl7iFGCg1lJhLdQCyjEm5JYWZValB9fVJqTWnyI
	UZqDRUmc1ys8NUFIID2xJDU7NbUgtQgmy8TBKdXAqL5mudji7y28C42/vNzTEsf4yFz+bkDU
	6ftr6r5VL9/FeW2/k25l/0zR32f14kWvZgm/+xKzw+DjNec+wZ1zO9Q015cwrlqv47bIjnn5
	rQtnuTVTQ0NZtH8KLrz0LTq8WuBU/NQPU9z27dgiPdVCa+N0o7KeKq9pbxcVn/FgOjp384vu
	t+f2zVViKc5INNRiLipOBACTzfbeCgIAAA==
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
index 0465dc00b349..1398d2973ffe 100644
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
+				if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
+					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
+
+				if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
+					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
+			}
 		}
 	}
 skip_free:
-- 
2.33.0

