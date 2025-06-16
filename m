Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0361C6FFD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051210; cv=none; b=LYasRCRslfXQpCP4Ts9QbSOAebUlfD0D9sYE5WeETSa515tL4WRqEhdYF4QyNKhSWVEsyyGSZxE7PUzoiKY3spKXIh5L7IS2enh31376WWjfn7Kdc+U7OuSEHJe34knaPtMxRZaVktySoBDx1nyQzjPPg+ZnsZxgB20FsB7+DUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051210; c=relaxed/simple;
	bh=JrW8Defnv9C+f6j1+bXA2jfDux3oXg+snPiQYB0vyWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLagfYv1IWlO+UXrjluKeEJu1QAC74NWfREsOfERCmw1RLuDpCwHfsQzsXFkQHm2YDb+DEohjY24SWIfZ5YY8fIlXQolhfsRqVTmd/tMMtM9zom9i/m6515wJn3DGo8vyfeCeXnU57NJDK25+RDOYh9IIt67Hl4Z441Nmp7C2gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-65-684fa5f8c482
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v2] f2fs: enable tuning of boost_zoned_gc_percent via sysfs
Date: Mon, 16 Jun 2025 14:04:44 +0900
Message-ID: <20250616050445.1492-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsXC9ZZnoe6Ppf4ZBlcOClicnnqWyeLJ+lnM
	FpcWuVtc3jWHzYHFY9OqTjaP3Qs+M3l83iQXwBzFZZOSmpNZllqkb5fAlbHrzzmWgp2cFavP
	9rI0MH5i72Lk5JAQMJG4u6mZGcZu/fSaBcRmE9CQ+NPbCxYXEdCUONI5E6iei4NZoI1Rov1o
	EytIQljAW2LCulYmEJtFQFVi7pHNYM28AmYSC3YfYYEYqimx48t5Joi4oMTJmU/A4swC8hLN
	W2dDLb7LKtH82QDClpQ4uOIGywRG3llIWmYhaVnAyLSKUSQzryw3MTPHWK84O6MyL7NCLzk/
	dxMjMJyW1f6J3MH47ULwIUYBDkYlHt4DW/0yhFgTy4orcw8xSnAwK4nwLj4BFOJNSaysSi3K
	jy8qzUktPsQozcGiJM5r9K08RUggPbEkNTs1tSC1CCbLxMEp1cAYdugiN1/9r1/zmMzSfN9e
	P3s96Ni1HRs+rebrW6W9RqHbbvX5/YfmZU3Wu6NqsPym4LYfIgtS7vvK3zr2uEPleovalBnB
	N05kZIo7GCRw1S/U+Zn8/Na5J/elMt/eXyD9+t/Om9ZGMuEvebI/+cnPW/WdRUru9vtjPn1N
	VXsTfnxyCZPhW/j+uhJLcUaioRZzUXEiAOffXNIjAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFJMWRmVeSWpSXmKPExsXCNUNlju6Ppf4ZBvceMVmcnnqWyeLJ+lnM
	FpcWuVtc3jWHzWLC3KtMFu+33mN0YPPYtKqTzWP3gs9MHt9ue3h83iQXwBLFZZOSmpNZllqk
	b5fAlbHrzzmWgp2cFavP9rI0MH5i72Lk5JAQMJFo/fSaBcRmE9CQ+NPbywxiiwhoShzpnAlU
	w8XBLNDGKNF+tIkVJCEs4C0xYV0rE4jNIqAqMffIZrBmXgEziQW7j7BADNWU2PHlPBNEXFDi
	5MwnYHFmAXmJ5q2zmScwcs1CkpqFJLWAkWkVo0hmXlluYmaOmV5xdkZlXmaFXnJ+7iZGYIgs
	q/0zaQfjt8vuhxgFOBiVeHgPbPXLEGJNLCuuzD3EKMHBrCTCu/gEUIg3JbGyKrUoP76oNCe1
	+BCjNAeLkjivV3hqgpBAemJJanZqakFqEUyWiYNTqoFR4Og8/fAd5sfmBSguKPFb86La5dZZ
	SfG0hLUb3nlMKpp7yP/CPjd+6/amPyfieIXXcF5SKd/DzGbY+NLUdkF/z4M7z/0jV27WEptl
	dJL1k7S/Snucmo5HlRX3FuVso/91Jxbr1ucmnN7zKb90x+Z594oeqRqvOBhYJFrE5nR346qM
	FvbUwsNKLMUZiYZazEXFiQCNihNPDQIAAA==
X-CFilter-Loop: Reflected

to allow users to dynamically tune
the boost_zoned_gc_percent parameter

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/gc.h    | 3 ++-
 fs/f2fs/sysfs.c | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..11fba7636af7 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -194,6 +194,7 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
-		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
+		return !has_enough_free_blocks(sbi,
+				sbi->gc_thread->boost_zoned_gc_percent);
 	return has_enough_invalid_blocks(sbi);
 }
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..6c26b5e10c8f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -628,6 +628,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
+		if (t > 100)
+			return -EINVAL;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
-- 
2.33.0

