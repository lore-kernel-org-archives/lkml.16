Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338771C32
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747960624; cv=none; b=MG6oT5AyMocTor5fW9BM0WXiOrdy7f0keOb0e64UNnsLXt317HXb5rEnXjofvWoB87L/EyETdJXNvPuUw+9XaC3BOyPJR++HbAlCVFcQqr0sw/a3pBflvaOi+cMfM+b5Qp6x9devOKg/3ZFn9abWcr82MhXS+oHn4bKfPnMh4Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747960624; c=relaxed/simple;
	bh=xxZ+jw7PT0u2qUyi/Qr848Ot3EsYL7ax7uotdV/6T7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R6enJ15MrXS8kVo1yGzqaUvlGLED3x+BIOK2KPjeSOl+i2qADyA5g/AeKONqECMN6oZR3kg4ZMDqbqjUk2cn8G4vZlgI4G+Zq4ty+SLsbXNGfSPD6up9hov2fRhI40i1sDbILAZu9HF+upqaVOLz9c6IPNDUeU5xYuZIq0KdWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-f6-682fbf9d8325
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH] f2fs: enable tuning of boost_zoned_gc_percent via sysfs
Date: Fri, 23 May 2025 09:21:45 +0900
Message-ID: <20250523002146.763-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsXC9ZZnke7c/foZBk2TjCxOTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErowp
	q9UKprFVTFzL18A4n7WLkZNDQsBE4uanNjj7x8wjjCA2m4CGxJ/eXmYQW0TASeL/jXb2LkYu
	DmaBNkaJ9qNNYA3CAh4SqzevBmtgEVCV6D50nA3E5hUwlfj39zoLxFBNiR1fzjNBxAUlTs58
	AhZnFpCXaN46mxlkqITAS1aJ3ds3s0M0SEocXHGDZQIj7ywkPbOQ9CxgZFrFKJKZV5abmJlj
	rFecnVGZl1mhl5yfu4kRGF7Lav9E7mD8diH4EKMAB6MSD+9BQf0MIdbEsuLK3EOMEhzMSiK8
	R5/pZQjxpiRWVqUW5ccXleakFh9ilOZgURLnNfpWniIkkJ5YkpqdmlqQWgSTZeLglGpgVO/+
	2/Zo0XS3S483X2fZvMcz+0msXMaFpXL7A9+mb7BpOJfieqjLNPsMa4b9Pz+bhYs6HGesjgy+
	1pQ/a+LzKUEzpNjNN02ffT3qZxjz4wtXHjz+POEih5Zt4O3X4vsbHXRYSyeFxy96vfDoiyL2
	ZV/up17tqKvWSq7jzW1KDPskzGOf5m/DqMRSnJFoqMVcVJwIAGtLgVgrAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkluLIzCtJLcpLzFFi42LhmqEyR3fufv0Mg0er1S1OTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFgU6nHplWdbB67F3xm8vh228Pj8ya5ANYo
	LpuU1JzMstQifbsErowpq9UKprFVTFzL18A4n7WLkZNDQsBE4sfMI4wgNpuAhsSf3l5mEFtE
	wEni/4129i5GLg5mgTZGifajTWANwgIeEqs3rwZrYBFQleg+dJwNxOYVMJX49/c6C8RQTYkd
	X84zQcQFJU7OfAIWZxaQl2jeOpt5AiPXLCSpWUhSCxiZVjGKZOaV5SZm5pjpFWdnVOZlVugl
	5+duYgQGzLLaP5N2MH677H6IUYCDUYmHdweXfoYQa2JZcWXuIUYJDmYlEd6jz/QyhHhTEiur
	Uovy44tKc1KLDzFKc7AoifN6hacmCAmkJ5akZqemFqQWwWSZODilGhi7RFsDam7x3b5j+Ty8
	Y3Xfwk1bO955PJeade/huQnCoRqbWotvy9XeV73WtcTtaOmVFZIuD7IDWzf92Pf6bPRh5d0z
	Xvjt/b9FuDXB1d7084XQBZ72F9bMnHjSd63Ml5k/OzsNk0TbD25mtHhkrzrjK5NTy2M+cZHW
	528PZ/c+OL1RflnD3dZYJZbijERDLeai4kQAwyugphQCAAA=
X-CFilter-Loop: Reflected

to allow users to dynamically tune
the boost_zoned_gc_percent parameter

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/gc.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..f9ff68dc2bcc 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -194,6 +194,8 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
-		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
+		return !has_enough_free_blocks(sbi,
+			sbi->gc_thread->boost_zoned_gc_percent < 100
+			? sbi->gc_thread->boost_zoned_gc_percent : 100);
 	return has_enough_invalid_blocks(sbi);
 }
-- 
2.33.0

