Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18D0262A6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744949309; cv=none; b=INNgwb1FXiF8k7lGeIyBWL4Fm+D9kz6JQ64hicN9LF7Qo89kl2/d8RxwZawxtHOk81yDMhhrZ1oAbNXbLjT7kBD1x+rWGdgnpIg2/mKK2qUIpsRD6vw+Q8OayZrNfeP6sukj6Yvo4jEXPI6llmh9yztLTsfi/d6zRVko3TMFKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744949309; c=relaxed/simple;
	bh=qiv6nX2z8REXDYEULFlPPpxHg2ugSSlmAOfDb32Aipo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ogQgmMs0eb1d/FOaPZPhEwztXzIn8qWMO4Ynfd+g/D9m8UKwbXFh2BZG8sLIM5Lft93p3hmsStrzTbdoodukKqAfPTQhCwfVUGOsU4Kwz44QlXu7WTrgwh9hhlwuXew/WOj5zgaxNWar1b3QaoFxCCU080+tz8Qx4X6CmkxyL34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-c5-6801d0345c5e
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH] f2fs: Add a method for calculating the remaining blocks in the current segment in LFS mode.
Date: Fri, 18 Apr 2025 13:08:02 +0900
Message-ID: <20250418040803.2118-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsXC9ZZnoa7JBcYMg7/tlhanp55lsnhz5AyL
	xZP1s5gtLi1yt7i8aw6bA6vHzll32T02repk89i94DOTx+dNcgEsUVw2Kak5mWWpRfp2CVwZ
	OxtWsBUc4q3oWnieqYGxkbuLkZNDQsBE4kzTHxYY+1PPDiYQm01AQ+JPby8ziC0iYCfR3fCN
	FcRmFmhjlLj11xfEFhbIkfjXvoOti5GDg0VAVWLyP3EQk1fATOL2l0KIiZoSO76cB5vIKyAo
	cXLmExaIKfISzVtnA03nAqp5ySrRf2MG1AmSEgdX3GCZwMg7C0nPLCQ9CxiZVjGKZOaV5SZm
	5hjrFWdnVOZlVugl5+duYgSG17LaP5E7GL9dCD7EKMDBqMTD6/CWIUOINbGsuDL3EKMEB7OS
	CO8583/pQrwpiZVVqUX58UWlOanFhxilOViUxHmNvpWnCAmkJ5akZqemFqQWwWSZODilGhiL
	4uLMa3/mNNwPe1V3b5HxdI8nG7guv30jvUo0U2x++LcSgaSFAfc7L7z+e72GpfPnyhciH/Jn
	f5/CuO1t4lJP/i+fclvOH/BMMZp0xi4w6NRLH1nO//NPzgv06Pt0a/5We50Ld1cZc8960tH5
	9IDvPIHpB45dm8M4eULc8vnMP0+9VHO5fTS2XImlOCPRUIu5qDgRADlz5ikrAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkluLIzCtJLcpLzFFi42LhmqEyR9fkAmOGwcKpBhanp55lsnhz5AyL
	xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFz1l12j02rOtk8di/4zOTx7baHx+dNcgGs
	UVw2Kak5mWWpRfp2CVwZOxtWsBUc4q3oWnieqYGxkbuLkZNDQsBE4lPPDiYQm01AQ+JPby8z
	iC0iYCfR3fCNFcRmFmhjlLj11xfEFhbIkfjXvoOti5GDg0VAVWLyP3EQk1fATOL2l0KIiZoS
	O76cB5vIKyAocXLmExaIKfISzVtnM09g5JqFJDULSWoBI9MqRpHMvLLcxMwcM73i7IzKvMwK
	veT83E2MwIBZVvtn0g7Gb5fdDzEKcDAq8fA6vGXIEGJNLCuuzD3EKMHBrCTCe878X7oQb0pi
	ZVVqUX58UWlOavEhRmkOFiVxXq/w1AQhgfTEktTs1NSC1CKYLBMHp1QDY9Yj3/4NrRb/GZf+
	f//82T7fai6Ntsa6UtfV6z2up7UUME3aXrEiZMuFxxVP6iI6zjd9TFp4I3Bh6bHULr29JZtf
	WIQyTDj7qWSiXWplvlpE0pnODVVdN/5rCX276TJB322C0IbPWRu6jh3bIx0reSa9YN72YD6O
	pNZtU1snvly3OqbvY+ipq0osxRmJhlrMRcWJAPocAvQUAgAA
X-CFilter-Loop: Reflected

In LFS mode, the previous segment cannot use invalid blocks,
so the remaining blocks from the next_blkoff of the current segment
to the end of the section are calculated.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0465dc00b349..07c07b44e21e 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -569,8 +569,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 		if (unlikely(segno == NULL_SEGNO))
 			return false;
 
-		left_blocks = CAP_BLKS_PER_SEC(sbi) -
-				get_ckpt_valid_blocks(sbi, segno, true);
+		if (f2fs_lfs_mode(sbi)) {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				(segno - rounddown(segno, SEGS_PER_SEC(sbi))) * BLKS_PER_SEG(sbi) -
+				CURSEG_I(sbi, i)->next_blkoff;
+		} else {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+					get_ckpt_valid_blocks(sbi, segno, true);
+		}
 
 		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
 		if (blocks > left_blocks)
@@ -583,8 +589,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 	if (unlikely(segno == NULL_SEGNO))
 		return false;
 
-	left_blocks = CAP_BLKS_PER_SEC(sbi) -
-			get_ckpt_valid_blocks(sbi, segno, true);
+	if (f2fs_lfs_mode(sbi)) {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				(segno - rounddown(segno, SEGS_PER_SEC(sbi))) * BLKS_PER_SEG(sbi) -
+				CURSEG_I(sbi, CURSEG_HOT_DATA)->next_blkoff;
+	} else {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				get_ckpt_valid_blocks(sbi, segno, true);
+	}
+
 	if (dent_blocks > left_blocks)
 		return false;
 	return true;
-- 
2.33.0

