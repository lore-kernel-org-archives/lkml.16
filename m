Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AD927E7CB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036680; cv=none; b=m01An2X1uAl1R04VGYdnMZ5bvyGMXjStLJT/FWGynMap4EICF/EqOEeGbxJFQYRIEFrJkvaMN93UoCT16cWdghKhi/a+iZ+dvtHk6fkN1o8s5ZSODADCduuSvfbVzLRiV2KHxb8+a9GO5MaytMr7QlKDY6LaqV6p22gX2h1Gicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036680; c=relaxed/simple;
	bh=2+zHp3o6v4QSVzp94ClonbDqg/k5+dUzGUoCLjRAKLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZX2xZlPXJ+gn2Tz822gL+VoyHkhSI3BbNsUFneOYYB7bepoDreLNeCv01koqYKfpiCH2bl/w8++nEj63uCw+UqeoTJncVI8vGSsbEI/s0IJe6RrLO66dZ+ViwyTsiN0o21XZwNQAEptIc/HCicnKvnp112/eeYrnWt0Ithb5wgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLUNb8lP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLUNb8lP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7399838db7fso283274b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036677; x=1746641477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=;
        b=bLUNb8lPgIAbQivTjoIOxkLs/now8WOA0BvdAysge4hMXIsMoaIkcV3aMmSIM0NOEE
         P5YjqTWb7mlpPizxY+y2GQxTXgrjgXpD7UZ5sOIzhTHzH5EY0ShLUSYXGQEYL5keWoRp
         A6mcYIEz6tom0FPYHdAIPzY6XeSvCQ7DaOexCTgEbsbH+qIsz6dOenyqPMdFr1L193LV
         pouOUlxeTcs3FYueGM45FTSdvDJFQFt6gkcFWNzouuv2RgP3zEtWpeaCbcGhC+R1hkyw
         sNWoEyNwZvwYtn8W5gabUP4OQLmjq4k+F53G1U+cxq2DiB32uALJWPko+IYWK7K/MNfB
         PEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036677; x=1746641477;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=;
        b=IR1fnLT813fBMRGgkDEB0FiIl3Euc4xyhA3plbaFG1P3BcZWG2BiuyB97LWDfcp4lL
         c8ebMiyRZPBPX5XMUkgLNsgiF6UuM2naVlwPMfxe8A/XdoygOlFLUZqs9vIB6ZxrAqLW
         +KoNzjvHjZjYHSLqFI0vQbQH7GwfrU9NB1ICHN3ZUoqRK67CX7D2bpISy8se+VCXdEes
         pi7xAMNs8OGyB7CgXFxJ11cx7fKK1KUfngWZ4ckqGXJRgOiD+DDL5XeVfum2SzhvCV/p
         2eBDXFCThWYgac1Iah5X+qpPLX0PUeLk08zRD/MtKC6nF17n0hOmXA6kXBlVyQdh1y2n
         ymJg==
X-Forwarded-Encrypted: i=1; AJvYcCUGRHLS2DK78+T7qhwzU13DwTVor3w5MEjWkAC9yEJmP3xksISieH2W/F6do0Jkh6IUeZF4+pv60jxMXY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfYUC6PSWxIFR23WxJpt8tFZ9mPfCkIY+8aBfYRDY0mCBJMVKp
	d0kZWbrRhdosFyA9KKqkd6VYNC9jxmkJBj76TXQ7X9ve4m/MOgG2
X-Gm-Gg: ASbGncshu5sPAPJMA+DT1iWCFSbKEJkdm0siV3uelGoUXxHIqFny+XIhGHV4BL71Adj
	tOwek5sMUsmrFSDgiVibA4Kl67Ai2kjZONaieqf9+ppxJ6GkF9sAEQjdHceSYP45TlOBdgGiSyt
	AXwGr1BBvC/Ci8jTngBctbSs4b65Nbc61626WoTiLizhA17DY9Z4WfxtFIM+SNSnc8AHbAcuY/K
	MUJ3QB6piazNGY7RkCJrs4QHwShtobygbFJCr48cqmc+ch96r3hCP4QSnfk9z24WQymclhsfYWq
	L0ln1vkGEDh0gngvBfndIE5pW428wB8yrAAuaUcMZINRAS/VHp0xR/Ty7Yv9nA==
X-Google-Smtp-Source: AGHT+IFui7W32qe/7oFPxgXqGuD21PFMOpd9VG8chpu1c5yNXFW+POaOkysCOWvmg5iIKChIBFoOWg==
X-Received: by 2002:a05:6a00:391b:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-7404613f584mr699444b3a.2.1746036677129;
        Wed, 30 Apr 2025 11:11:17 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.122.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039947976sm1983822b3a.84.2025.04.30.11.11.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Apr 2025 11:11:16 -0700 (PDT)
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
Subject: [PATCH v3 3/6] f2fs: drop usage of folio_index
Date: Thu,  1 May 2025 02:10:49 +0800
Message-ID: <20250430181052.55698-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181052.55698-1-ryncsn@gmail.com>
References: <20250430181052.55698-1-ryncsn@gmail.com>
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

