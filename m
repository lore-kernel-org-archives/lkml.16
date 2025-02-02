Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471D1B86D5
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 04:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738470798; cv=none; b=fwDNVcBn03rABuy7ll7HA+/PMAbGWc8IiOCuloE1F7x4hj8Ei+ovw9U6QZb6z+UxvHBv7czywrQ4uQawm9l6GAP3y0U54coYMpnojXGXr5pAFU1YqFrVdsMC/0/sFI+lWKpjuBf4tgRbf12Itu41xby5zj6M85dfk9JRqdIofV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738470798; c=relaxed/simple;
	bh=LhB0kGuqYDmO/IgrQJzoMu/EnL6XcBOgTIcANIOwxSQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FMFKsfToJsTLX5i0SINJ8Ph59/4sLOJdrnMWMJ4MxkObw8J9bDPlTroHxqqsfc45HIQYDNrjNmNhgGywKmer7RG3Ce98oA9vuaVb/rjsKQUHfNbLI5LXQxXcWkPWXWN1vCFpu0rjh2sqhDk84NNYyvYnxo7lusaISPGDAFLYaAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=Lzg/YqLR; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="Lzg/YqLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1738470797; x=1770006797;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5wKm0aYw5LMzGFRHPLrYDtn9SZNot9Fk2U7Cck0hqJ0=;
  b=Lzg/YqLRw+jphTk6or/MIA+FLRsjmXNgjPGQS5UEy0JrY/z7GPb0uYHS
   cCmXkAtIPDSE9QRzuo+yrVFn1i8TDJPQw1yGEcyUAmfR+sNhBBzHByr8+
   6pif/HisQbfek0Ib7pYRmQc4qhR+jdddUtptyOMntxSt9aFQrlKZIawx2
   M=;
X-IronPort-AV: E=Sophos;i="6.13,253,1732579200"; 
   d="scan'208";a="795416663"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 04:33:10 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.21.151:61079]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.14.41:2525] with esmtp (Farcaster)
 id c97bc524-8d2f-4380-8fcd-c91536b085e0; Sun, 2 Feb 2025 04:33:10 +0000 (UTC)
X-Farcaster-Flow-ID: c97bc524-8d2f-4380-8fcd-c91536b085e0
Received: from EX19D003ANC003.ant.amazon.com (10.37.240.197) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Sun, 2 Feb 2025 04:33:07 +0000
Received: from b0be8375a521.amazon.com (10.37.244.8) by
 EX19D003ANC003.ant.amazon.com (10.37.240.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Sun, 2 Feb 2025 04:33:03 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, "Damien Le
 Moal" <damien.lemoal@wdc.com>, Chaitanya Kulkarni
	<chaitanya.kulkarni@wdc.com>, Johannes Thumshirn
	<johannes.thumshirn@wdc.com>, Jens Axboe <axboe@kernel.dk>, Kohei Enju
	<kohei.enju@gmail.com>, Kohei Enju <enjuk@amazon.com>
Subject: [PATCH v1] f2fs: remove unnecessary null checking
Date: Sun, 2 Feb 2025 13:32:53 +0900
Message-ID: <20250202043253.64389-1-enjuk@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D046UWA003.ant.amazon.com (10.13.139.18) To
 EX19D003ANC003.ant.amazon.com (10.37.240.197)

When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and GFP_KERNEL) is
specified, bio_alloc_bioset() never fails to allocate a bio.
Commit 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO") replaced
f2fs_bio_alloc() with bio_alloc_bioset(), but null checking after
bio_alloc_bioset() was still left.

Fixes: 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO")
Signed-off-by: Kohei Enju <enjuk@amazon.com>
---
 fs/f2fs/data.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index de4da6d9cd93..07b46b444d31 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1041,8 +1041,6 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	bio = bio_alloc_bioset(bdev, bio_max_segs(nr_pages),
 			       REQ_OP_READ | op_flag,
 			       for_write ? GFP_NOIO : GFP_KERNEL, &f2fs_bioset);
-	if (!bio)
-		return ERR_PTR(-ENOMEM);
 	bio->bi_iter.bi_sector = sector;
 	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
 	bio->bi_end_io = f2fs_read_end_io;
-- 
2.39.5 (Apple Git-154)

