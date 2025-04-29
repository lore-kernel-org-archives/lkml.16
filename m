Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B322D29BD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927433; cv=none; b=Yq+DS+LBieJA1UIHKEEBtvIpXaBOVazrri282H+4TkCyac0RDLx7HHXElalp222o/An8qX5PPb6XfC81Ii9lC4Z1WlLiRvMHFmik40Pys5KfIka46rwHu1DM/ia7Z/9ZTwQMul0qFZYGo4ngDynhap08rxiCsK8pbvJUrdJZzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927433; c=relaxed/simple;
	bh=2+zHp3o6v4QSVzp94ClonbDqg/k5+dUzGUoCLjRAKLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2GPzxvTFLA4PRksPTS+gXoH1uNuBIenYHQxjZcrZHA75+DrIkSBBD7AiR0r/0ad0GWi/tNr5KrGZsgLkY9niVxeN+/a+3KZx1+ztWkD+9MncmunecEd39IXyGxIDjwf5h4dTcOjcZh2AbCzzH8xV27TguKWtBMrrp9B2NG/Puk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQrd+iS1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQrd+iS1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7908305b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745927431; x=1746532231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=;
        b=ZQrd+iS1J5t23AbFzS8Xlfov6H4FzlkVx1eGnc88VIurgc+AzEd2Q6rMPgAtpVbqvt
         5uN4UH50xGcOwT5NNJU5lzcgBHwAjPCy0e8PgS/rgKCcwJ6zctJhuYV6xy1E47RTBvT9
         htapmzDXrB6IFEx3snBcd+uDw2Iu0XKhLUwCkI5S9AhzxYddZmcPxWpcD77cOEuMYBo7
         5dRHP0pvWXQ9174UKBbWRmTO0IclJM6JUzHqVesR1uDtFuEXpjWim+xL4kWc8Fk1OatT
         oHXnfJml6vYG4/lntYyiosXm+5AgIisJzAflsYPbWDS6czzBReGdVuaRfxabGdLFeAcz
         ag/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927431; x=1746532231;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=;
        b=TJdhwbN7oJLfMPzWZE4vKfTNk5l+0+M+A5d/5WIwhEY3tLOR7FwVu0x9Za3Oa+i3Lv
         5botkNonF+0x+dT88pCz2W4MGrIiBFJfpsKDBdJDOaUMQ1QaQbFwKYjsbFPpaEzBolgh
         5owrVdo/vLw9k82SO4dAfe3he5T9mIJ6jni3ou/GmBY5JFwY/Zsdmym13q+snAwF8ZC+
         iHKkfKA1aXADUq66KqcKdRE8ZbsSXRkGEVfVQlDMp4bZK5CBIxi2HGvdPxMIXpHslFH9
         t75SEd+OPpz6usLPgKaVvBzB0YvlvWPzPyxpFOszGaEGQyPuyPPiK8W0sAlYJp8kyC6t
         m/7A==
X-Forwarded-Encrypted: i=1; AJvYcCVYQ/uZOkgH3Q1rlBCuxd1UfxR5O52QFUo0EdMEZrW57hAChBhbnD7fNMdpUDfqxG2Sp5yb2If9hdm3qF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyZ4qZuWfnzo7RwQsf0xeHjM7v84z4syC+i26g/bplQvw5aP+A
	qg1nQr6iNZsWvsikfbXH2SbZjc28kJ1agY3CIx6aCOb23neuJwRR
X-Gm-Gg: ASbGncuWMGSA9bMN9Na7S/VNhXnurMvFgFWwHPppaCBucouM+/fVTOFM2CEx0H8nYuH
	8WARfmnta7RfcafgaM8AoWqUr+6rg8bSbRakyUlzhxL96f2b0ToSYkuRKGi4B4RzwzITGNiDgeS
	SAyXAkmTna01lQwYGlRoll13Aa6FSwzNzdWSuJpOJwbez+GsxvZgOSuUy/NKVYAotmi1sfBY+N6
	XjNs8QHHTbMRP8NKj3PUvSyEBQZq4QxWJxWynAPif8tMmeE6OKd4nh2MG6tzgW5+yzFxOdATRU1
	cKNcuVCjozuX/cBm5ls42xf3Lq78RD+fZ2XMrVDPlP4zwcbIr7DjWpUT/y2a4FwQzV70HqM=
X-Google-Smtp-Source: AGHT+IEoriRK2NyH//YcoOQqQiNaSwS5WKzp7Q2fF6Hs41CP4tZDUS769rp7JmgItvGnje7zbfgCvg==
X-Received: by 2002:a05:6a21:4a4b:b0:1f5:59e5:8ada with SMTP id adf61e73a8af0-20958f841c3mr3725562637.4.1745927431033;
        Tue, 29 Apr 2025 04:50:31 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm9661644b3a.167.2025.04.29.04.50.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Apr 2025 04:50:30 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net
Subject: [PATCH v2 3/6] f2fs: drop usage of folio_index
Date: Tue, 29 Apr 2025 19:49:46 +0800
Message-ID: <20250429114949.41124-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429114949.41124-1-ryncsn@gmail.com>
References: <20250429114949.41124-1-ryncsn@gmail.com>
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
through `swap_rw` but f2fs does not use that method for swap.

Signed-off-by: Kairui Song <kasong@tencent.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
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

