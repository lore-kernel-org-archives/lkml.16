Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F18BE7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780420; cv=none; b=A/QC4+jSKeyNryJUznMjTamTUL8CZEmEIuUi6YjywLj0cypcOY3B7mcoLbPm+ubhhgsSpD+DfdpmrT8F1KiemodX70WSaOCbiKbT/9alp7rWtqU26+SRsPW0vAqrr9+eJBRXk6LrYYRirFVwFUxgx6TAIEdBOZLlbOzgSoyeql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780420; c=relaxed/simple;
	bh=wM68GCXbiSerHyiJjiF8qiDn6ozAYSo+GCvSaYYs5yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdwdbclsyPZE6icd8Cmjz+il0SbUCiXhQfmT1V4v/SDZt9rtqdlOYczuo5B1Wkzv2g8VW34vfDL7T13gi7ud/Mk/9VwpqwmWXVeINCqf+CZH+K66SYFO/P11IEFzeVeoD1FseDlwBIhpFh7e1kf68FOwh5NwXy4d+/HyHwDNqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6R6x2TO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6R6x2TO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224100e9a5cso47271285ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745780418; x=1746385218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kiHWomkf3wcsR+tvD4RLDrQZNUBMxVnHVwy9itXWJo8=;
        b=b6R6x2TOsC/XjdHalNJmC/IDLJbtwvbNOleFrCmpwRlKaTauJVFllD0mIfWkvKGLwi
         2sJIIb7HlV088hVsJPFTbWfCbrB9u7ajgZdNk+udE1SDZlq2DeEf/MU/TtwO8qUBH4Md
         svE3X61i5lwlCg7B+ordVHxDUjzl6nWQFcQa48RetFRMngRMtBecMKJi0aotNhEU+Fh3
         6m6O7vZHmV8z/2E6PEt4nR9x6XtCNIL9Soh06FbEFhCsWzlpFsq+/N9cws+yDuFS31wi
         SpBT6AvKZ84S1BCLIw1aEAAucH42etqYxgDASKp5jgeD/vK/fTtd5zUwru7EqtjIn25i
         bqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745780418; x=1746385218;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kiHWomkf3wcsR+tvD4RLDrQZNUBMxVnHVwy9itXWJo8=;
        b=aO/RV6XeZD50JPfekUArexX8IIIU08ptsetXiZ7z6p7EhxEG0iU6gTbfZ1gUeCY+es
         F+qeQK1Aj/ZitcVXkbJH6g//W+kIQ5ONxLv074TVjvP9vMzb7MqSjf2RvfZRHibLuNij
         9142Pg+IG78dsrfcsaCvibl/iSfrJ0riBzhtc/IbnYyZFYBp3p7QtSMyHgTJjKhEJwts
         g8x5PQt13AHKMJM4NzdMG+7aU7we3RbjbDQMLdvHexKep1YL89H/rszvmxaB1mT/MJsk
         +JvJw/5hi3U1DLtn24fJjAIpIlK1q0AmsmbaNHot3PoLwkCXasa3K1Oiv5KeRj6QZ9IH
         6mDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfXTm3L9C41uyyTMbqvUWtCTrnzb45X+L1d3XDYIhnmjF5GF+NuKtsIo2OTw/stoapImOWkGpwa4o3DPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw64HzeyUN4KuKIrSbFwRRtHHsNm1BXyiaO1hAarzyXBcjD9VeR
	s/G8/VTk4s14I/3ea6fuNwagOVRcuJ/z33DcfsLI8jOwLOWURsGX
X-Gm-Gg: ASbGncsqQ/mp3wjkowAAqboriPJ1mnZvcLB1e0IeFiLT7Fd8dizdnsJS4XVIdxhZb9+
	8y8A8/tfMgqpQEQdN6Qzbmnl+FxZVeebgVux9J4rCQpGcW6hNvMcID6BKHh6SEyB0mJ3p2XBs3x
	bEXjRYpaZmO+DKKFSFeQfoF6Vfkc3U7zxR5oFTj+KfViC93QXjOcBOmMtEgRDuMsVRkMY6IPoB2
	ka+2IwgmGi1n/AeYdEdDDZdAkwYWzzcRVtCs+Ri/m3tio9weSx95aOyw9XiikomZSz20Omkh1Ib
	hJLMajEay6db09K43amkmjb5FxntWkxtzYMjr/seSUi/e2r/kBSb+tS2fVS2vg==
X-Google-Smtp-Source: AGHT+IFUylfVVyaQkdTj7G9SXw4aWzBB2+YYrPKPSQjJoZLloI+KVj4P63eCYK2iieWNVOo68Fjdwg==
X-Received: by 2002:a17:902:e18c:b0:22d:c605:a30c with SMTP id d9443c01a7336-22dc605a33bmr81867745ad.11.1745780417680;
        Sun, 27 Apr 2025 12:00:17 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([115.171.40.102])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded554sm5862153a12.72.2025.04.27.12.00.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Apr 2025 12:00:17 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net
Subject: [PATCH 3/6] f2fs: drop usage of folio_index
Date: Mon, 28 Apr 2025 02:59:05 +0800
Message-ID: <20250427185908.90450-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427185908.90450-1-ryncsn@gmail.com>
References: <20250427185908.90450-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

folio_index is only needed for mixed usage of page cache and swap
cache, for pure page cache usage, the caller can just use
folio->index instead.

It can't be a swap cache folio here.  Swap mapping may only call into fs
through `swap_rw` and that is not supported for f2fs.  So just drop it
and use folio->index instead.

Signed-off-by: Kairui Song <kasong@tencent.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 fs/f2fs/data.c   | 4 ++--
 fs/f2fs/inline.c | 4 ++--
 fs/f2fs/super.c  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 54f89f0ee69b..5745b97ca1f0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2077,7 +2077,7 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 	sector_t last_block;
 	sector_t last_block_in_file;
 	sector_t block_nr;
-	pgoff_t index = folio_index(folio);
+	pgoff_t index = folio->index;
 	int ret = 0;
 
 	block_in_file = (sector_t)index;
@@ -2392,7 +2392,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-		index = folio_index(folio);
+		index = folio->index;
 
 		if (!f2fs_compressed_file(inode))
 			goto read_single_page;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index ad92e9008781..aaaec3206538 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -86,7 +86,7 @@ void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
 	if (folio_test_uptodate(folio))
 		return;
 
-	f2fs_bug_on(F2FS_I_SB(inode), folio_index(folio));
+	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
 	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
 
@@ -130,7 +130,7 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 		return -EAGAIN;
 	}
 
-	if (folio_index(folio))
+	if (folio->index)
 		folio_zero_segment(folio, 0, folio_size(folio));
 	else
 		f2fs_do_read_inline_data(folio, ipage);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f087b2b71c89..eac1dcb44637 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3432,7 +3432,7 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);
 
 	/* it doesn't need to set crypto context for superblock update */
-	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio_index(folio));
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio->index);
 
 	if (!bio_add_folio(bio, folio, folio_size(folio), 0))
 		f2fs_bug_on(sbi, 1);
-- 
2.49.0

