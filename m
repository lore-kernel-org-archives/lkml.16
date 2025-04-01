Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431A2A1BF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516188; cv=none; b=MrLQogbRkBAMLs4Sjj2asHdiYYy5srCleNo1VQ0zMbHRPOeNhu8tDOv8336CeD8K/EmWaX1+lbfZUC/sqcFNll42VrfMNPuFWzNYd4/VBvwtgvXwJnfVcPJh7lx1FqWG0JuFI3rtzH/gmGa9ZeOOaRK8sooFLlNX8gQz4jCOgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516188; c=relaxed/simple;
	bh=zHB4kMDLyObw2uJyWd4js0PQ5ofUemEUPSEFAAL2r+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpZQ/ck6Lp+sfnVODfKr6E7TrjUbc1gxPt98qlrhOYtWVjI0UjmH1sDe7j4ITjQp+Fdr4g8T7op1sFSgfFrt9ceNAz4JBRCOsIMhl/94iWkKqVHKHPIlQxBdR5pFCseeRsS6ax5u+cDrBjJB4UKpI4oq64KtE0EaRazUYpcM110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4gQXizR; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4gQXizR"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2240b4de12bso86743605ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743516187; x=1744120987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TawUJCn4nPW8poJm8xn+KGuI5TmConbHWtB8Miift0=;
        b=W4gQXizRY3GsgMpe25xuk+KmHu2k31DYN1SD7kuRDh9tkInnc2qCLWN14hcaKWQMhO
         APJlIKlg7qPgtO+L01jXM0q0mp9yehQqd4YkIaFJptRjLr3N0BWGah3ntdjnfaiMUILn
         etNRcLaHp3/TsK2p5r6nGg5s2pNwFxYBxDJ9r+ROP7JhIWO5DZPk0FixKlUmXoVHM0u7
         Mrc1IgjMRcqfoiTs6JtigTY+dGLv/+tvOTD/wa671nM7cDtpB2ZzQGMO4b55yof42/q9
         x1Sxk+zHhVc5BMYCrnB3PYV/zPpdxknavh5p275sBb2v8D2jjd1F0+bmnQ4zEJVHBJw+
         zikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516187; x=1744120987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TawUJCn4nPW8poJm8xn+KGuI5TmConbHWtB8Miift0=;
        b=InsBBo/wUGtSsmXPEL9Kn3nHkWDjQzebUD9iBVdhL+LON+hgTv/DBaMLJyxv5mm2Zq
         94ObZunvu69rht8b+bnVWU2/zm1iufwuI1oVtxa92O8NEiJfzeQYtNFw00EBg1m7I/Kg
         qFTvV2aZU5CW/t1tpagFA0ZW7K+qDagEblYsWsE5xZAIb/BriL3p6PlsGoDq1tnHh8rX
         rRXcZ7id1owg4j90kNWZlSbE+JEmqYD+cp8RTfJuivWi75xHG70Eh0lRZBrTcSKIKR++
         udm+KWqaaU208Rw6D35tDXc4Vz/zoC/OJJBbz1Li5addo1/tBgWdQCn0ZwiwUmTjwktO
         6A9A==
X-Gm-Message-State: AOJu0YwKXxLIFYtsbyD67spmnaSwO590NIIMfqKBp2+vPeonyLBhcOh+
	koiRrv1wizZYykxIh2YorJazCeswkWlA/9pY0dyBBq6yW8oJxo2a
X-Gm-Gg: ASbGncs5QjJOWXLyYyNpRDpcoLferJXoB6FpKFNOBY0EdFHaHwx36YuFYdM/7tPFngb
	8wz/2lYAYYyzBVJ4AFoKAwjRIZBYBbED3cJYRjfodErqCjxICwzSz3QHBras6tBzvXL+xXlFTK1
	lCIjOASQRCFcRjjEcBLprOhpDB4W/nD31j72BUKtM9s3Nr0L64MCoH5+YDbNWAw5rydeEnnnMCU
	3VeOLQJA0cHMN24QRZ1CWnzm0CcMNiXwCqzj7sVcDbWGXAypUk6GS3UQw2LtdCyV1rB/PDMVjuf
	adq+btRscA6I8ZcCL1qCF3mHKUPEuE++m4gP1UPlkW2vsHbUW4A=
X-Google-Smtp-Source: AGHT+IGxvNQssmvKSPf/R25O8aHnD1nONAeRCMZOESTuWhQq3g0FrU5fvhxv/2awbePbnvxjhBGXDw==
X-Received: by 2002:a05:6a00:852:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7398036737cmr17175503b3a.7.1743516186624;
        Tue, 01 Apr 2025 07:03:06 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970def120sm8845994b3a.7.2025.04.01.07.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:03:06 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	vbabka@suse.cz
Cc: linux-kernel@vger.kernel.org,
	linux-mm@archiver.kernel.org,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH] lib/iov_iter: fix to increase non slab folio refcount
Date: Tue,  1 Apr 2025 22:02:55 +0800
Message-ID: <20250401140255.1249264-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng Yong <shengyong1@xiaomi.com>

When testing EROFS file-backed mount over v9fs on qemu, I encounter
a folio UAF and page sanity check reports the following call trace.
Fix it by increasing non slab folio refcount correctly.

BUG: Bad page state in process md5sum  pfn:18300
page: refcount:0 mapcount:0 mapping:00000000d5ad8e4e index:0x60 pfn:0x18300
head: order:0 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
aops:z_erofs_aops ino:30b0f dentry name(?):"GoogleExtServicesCn.apk"
flags: 0x100000000000041(locked|head|node=0|zone=1)
raw: 0100000000000041 dead000000000100 dead000000000122 ffff888014b13bd0
raw: 0000000000000060 0000000000000020 00000000ffffffff 0000000000000000
head: 0100000000000041 dead000000000100 dead000000000122 ffff888014b13bd0
head: 0000000000000060 0000000000000020 00000000ffffffff 0000000000000000
head: 0100000000000000 0000000000000000 ffffffffffffffff 0000000000000000
head: 0000000000000010 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
Call Trace:
 dump_stack_lvl+0x53/0x70
 bad_page+0xd4/0x220
 __free_pages_ok+0x76d/0xf30
 __folio_put+0x230/0x320
 p9_release_pages+0x179/0x1f0
 p9_virtio_zc_request+0xa2a/0x1230
 p9_client_zc_rpc.constprop.0+0x247/0x700
 p9_client_read_once+0x34d/0x810
 p9_client_read+0xf3/0x150
 v9fs_issue_read+0x111/0x360
 netfs_unbuffered_read_iter_locked+0x927/0x1390
 netfs_unbuffered_read_iter+0xa2/0xe0
 vfs_iocb_iter_read+0x2c7/0x460
 erofs_fileio_rq_submit+0x46b/0x5b0
 z_erofs_runqueue+0x1203/0x21e0
 z_erofs_readahead+0x579/0x8b0
 read_pages+0x19f/0xa70
 page_cache_ra_order+0x4ad/0xb80
 filemap_readahead.isra.0+0xe7/0x150
 filemap_get_pages+0x7aa/0x1890
 filemap_read+0x320/0xc80
 vfs_read+0x6c6/0xa30
 ksys_read+0xf9/0x1c0
 do_syscall_64+0x9e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x71/0x79

Fixes: b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page")
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 lib/iov_iter.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 8c7fdb7d8c8f..d2ed1a299926 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1191,8 +1191,7 @@ static ssize_t __iov_iter_get_pages_alloc(struct iov_iter *i,
 			return -ENOMEM;
 		p = *pages;
 		for (int k = 0; k < n; k++) {
-			struct folio *folio = page_folio(page);
-			p[k] = page + k;
+			struct folio *folio = page_folio(p[k] = page + k);
 			if (!folio_test_slab(folio))
 				folio_get(folio);
 		}
-- 
2.43.0

