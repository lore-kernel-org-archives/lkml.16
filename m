Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF461EB36
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224510; cv=none; b=Xsi/CSGwDsndJZ5naKBCdqKu7W85COXO1EAe1ZhwfrNNf0/Y4k1bbFJGbRL2qzeV2ulXfrBQybJOjskmCF7Cy7hjdYckVXQaYsCtXsckK/bR+4zXKwB7MEGRwgvwdYldwjAdEG/3gw2+ajw25drgtL1QwMb2mLHY1G5NU+Yl3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224510; c=relaxed/simple;
	bh=4dK3QVcfc/KKEOeFjFot7/D4lRsGAvGD+gIo8LszTNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LH4oe0JfMqYXyQLiabrDp5T6E7vceG6S20PoxgvW+xt24gvr3egdWa2djRjMVGbdqh4AVNypQYAVKnCQC+zCET1zE5cHDE9pU0W8u/+fivocbaYlx+R8V9xKTewHhjQzpOGV8TBiS1F/dGbIq1j9RiHjfbQKs10tzVNDOD/Ql1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=tyOh0l+T; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="tyOh0l+T"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747224504; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=7eAMLJCK5k1FYQOA++OTzL/iUPIzGdYVuMe6yqYdMHc=;
	b=tyOh0l+T+OiaE4ic2gH7bugyj416mr0e77vx4czj+ScNUYrHwMRlW0OsscKPsW5qCoZVXFrSgDzv3HFYi76oY6X0HTeb5vbt7T0Nh2iHClGo0i5APrUBTYMDU/1iWfPTBAdCmc1HXGZRJy9/3dKRVpO+tmcJNiTeKl8M2JGQVQA=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Walxtxb_1747224503 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 20:08:23 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH RESEND] erofs: refine readahead tracepoint
Date: Wed, 14 May 2025 20:08:20 +0800
Message-ID: <20250514120820.2739288-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250514115713.2719705-1-hsiangkao@linux.alibaba.com>
References: <20250514115713.2719705-1-hsiangkao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - trace_erofs_readpages => trace_erofs_readahead;

 - Rename a redundant statement `nrpages = readahead_count(rac);`;

 - Move the tracepoint to the beginning of z_erofs_readahead().

Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
replace a stale version..

 fs/erofs/fileio.c            | 2 +-
 fs/erofs/zdata.c             | 5 ++---
 include/trace/events/erofs.h | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 60c7cc4c105c..94fff404db81 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -180,7 +180,7 @@ static void erofs_fileio_readahead(struct readahead_control *rac)
 	struct folio *folio;
 	int err;
 
-	trace_erofs_readpages(inode, readahead_index(rac),
+	trace_erofs_readahead(inode, readahead_index(rac),
 			      readahead_count(rac), true);
 	while ((folio = readahead_folio(rac))) {
 		err = erofs_fileio_scan_folio(&io, folio);
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index b8e6b76c23d5..29541e0787b8 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1855,13 +1855,12 @@ static void z_erofs_readahead(struct readahead_control *rac)
 {
 	struct inode *const inode = rac->mapping->host;
 	Z_EROFS_DEFINE_FRONTEND(f, inode, readahead_pos(rac));
-	struct folio *head = NULL, *folio;
 	unsigned int nrpages = readahead_count(rac);
+	struct folio *head = NULL, *folio;
 	int err;
 
+	trace_erofs_readahead(inode, readahead_index(rac), nrpages, false);
 	z_erofs_pcluster_readmore(&f, rac, true);
-	nrpages = readahead_count(rac);
-	trace_erofs_readpages(inode, readahead_index(rac), nrpages, false);
 	while ((folio = readahead_folio(rac))) {
 		folio->private = head;
 		head = folio;
diff --git a/include/trace/events/erofs.h b/include/trace/events/erofs.h
index c69c7b1e41d1..a5f4b9234f46 100644
--- a/include/trace/events/erofs.h
+++ b/include/trace/events/erofs.h
@@ -113,7 +113,7 @@ TRACE_EVENT(erofs_read_folio,
 		__entry->raw)
 );
 
-TRACE_EVENT(erofs_readpages,
+TRACE_EVENT(erofs_readahead,
 
 	TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage,
 		bool raw),
-- 
2.43.5

