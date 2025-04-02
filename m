Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E577F2F5A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581108; cv=none; b=P2zkOh/FubTeNVV0n8iSCmjt41iVCEcWVh7bnJC6bPz9Aa2YR6FUzpe/n8DuuvIyewRzQkcMKXTO2fuapN4JUylgPVPFPRaJ23fDc7alZ1cFIX+ffhLMHN4A8S8dvAw3lubFiVwWSaXV5rW1aRJrw4sdR2rdsdsEz8DgEWBuKcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581108; c=relaxed/simple;
	bh=OQfG8LIvYx7n2V+KLWh3jYspPWDst88m50Zd8BEa5SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VPXiV9/RioRftIjWLVQs10tr5wmIAnrpeaa8DfLzJDvYaslWGOgIAO+XBJrtnEmrNWtKTxjnggT+M9NSvh/wip5tzd7SrDMramBCqwD6AoMdw0BvJeTe0DzbfHhQqI6O/RRnH/WSLnS4HAfgXZVPWe6s2EnWKH9pemZX+wsg+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-0c-67ecefaf0c8d
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: [PATCH v3] f2fs: prevent the current section from being selected as a victim during GC
Date: Wed,  2 Apr 2025 17:04:27 +0900
Message-ID: <20250402080428.2811-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LhesuzUHf9+zfpBpu3K1mcnnqWyeLJ+lnM
	FpcWuVtc3jWHzYHFY9OqTjaP3Qs+M3l83iQXwBzFZZOSmpNZllqkb5fAlfF+3wO2gp28FWvP
	1zcwLuHuYuTgkBAwkbjzTLeLkRPM/HP2JiuIzSagIfGnt5cZxBYR0JQ40jmTHcRmFiiT2PPn
	CAuILSwQL/GxeyFYDYuAqsSH2c/B4rwCZhKf+nexQMzUlNjx5TwTRFxQ4uTMJywQc+QlmrfO
	BurlAqq5yioxd95iNogGSYmDK26wTGDknYWkZxaSngWMTKsYRTLzynITM3OM9YqzMyrzMiv0
	kvNzNzECQ2lZ7Z/IHYzfLgQfYhTgYFTi4W3gfZMuxJpYVlyZe4hRgoNZSYS36CxQiDclsbIq
	tSg/vqg0J7X4EKM0B4uSOK/Rt/IUIYH0xJLU7NTUgtQimCwTB6dUA+PMfccDBD+7hz4tFru9
	5EyTiiNHwE/F4Hl7jAQeNGyPSXXaXP9w3VqnQM5N5RoX9sScM9YqlUv8U3h9l4IE82YJ46PN
	jKduSYUFvmP//Xfr5tcq26f1K/zWkF+S0VhSND/+Kq9hblLA5wmPf+zX2+I8J0lPt/7VtcfS
	ZVGCfkYVvcdjXKrzNymxFGckGmoxFxUnAgCDhX/zIQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBJMWRmVeSWpSXmKPExsXCNUNlju7692/SDdZdl7I4PfUsk8WT9bOY
	LS4tcre4vGsOm8WEuVeZLN5vvcfowOaxaVUnm8fuBZ+ZPL7d9vD4vEkugCWKyyYlNSezLLVI
	3y6BK+P9vgdsBTt5K9aer29gXMLdxcjJISFgIvHn7E1WEJtNQEPiT28vM4gtIqApcaRzJjuI
	zSxQJrHnzxEWEFtYIF7iY/dCsBoWAVWJD7Ofg8V5BcwkPvXvYoGYqSmx48t5Joi4oMTJmU9Y
	IObISzRvnc08gZFrFpLULCSpBYxMqxhFMvPKchMzc8z0irMzKvMyK/SS83M3MQLDY1ntn0k7
	GL9ddj/EKMDBqMTD28D7Jl2INbGsuDL3EKMEB7OSCG/RWaAQb0piZVVqUX58UWlOavEhRmkO
	FiVxXq/w1AQhgfTEktTs1NSC1CKYLBMHp1QDo4R4cebx3TMz7q4zV0m7lPz+wNOzO6z4fuad
	8xfevlZj+dxNnnOdJR7/0GaZ8Pa/cPC/fFWL0n9eamet99g73/Ng39jEpOTA6yBZ35Ojyem9
	1tLZaeJB8YlTdp7sc3sn+Oxgwpqa+0vXPW02E9uSkXxCXMu8jvNazAHReqtA2yTLnWITny/K
	VGIpzkg01GIuKk4EAE0++7wLAgAA
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
index 0465dc00b349..129df633d656 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -476,6 +476,12 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 		if (next >= start_segno + usable_segs) {
 			if (test_and_clear_bit(secno, free_i->free_secmap))
 				free_i->free_sections++;
+
+			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
+				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
+
+			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
+				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
 		}
 	}
 skip_free:
-- 
2.33.0

