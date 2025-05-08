Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57227217F26
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681344; cv=none; b=RgSatkSZgESpjk0CADZWCCLIdX+b1YpzGbKVFoQRuIrXQnx5crhsnDebCmj/VrxvVH5vf5cV5a2sVbEETCsn2ND7zpXjTcjykOq6iH8emuy0cum/gw2YsdfZ1UgbYbn/oRWRoETi46C9CrYDXCf4YILQA70ORg8IfZzDM+LC8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681344; c=relaxed/simple;
	bh=qKCHFANiarmt2LYJprp9Pj/PxR1d2LP4KS0YyZiFrGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfT9qOlQYGBaRtRHfSqGxUvwo1boM/P9642oArT8QNf0KWPnF4zXvGjUfTMzjefg8eG00w+ZZ3VLDnLc6Dsp33OJ9d4wRKITe/PrxPwShzEIU3OvmKTpGJScTeV0nKuJ15Havt28Y5mRdh3wuqOJsoi1Rw8N5ZHeB4A4ObrElt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hav3P66x; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hav3P66x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9iAR2eTcwVT7JLnmWJ2t+U6ibTzxDLj91NO/OnBFYZ0=; b=hav3P66xr2lAYDTPGNAyvOx2VQ
	soPqkPR+ezWtip2+z8m5LB3GZ73Q+f572nR9UwrhAW1946NOZRotbBCwqgIRXVDwxtpdKQnrI+FZn
	7WujXeVzkiWwFQlhLiKEUkN8wa2+E8OUnuRQxBJMpbTx3mw0pJHNe8EYH8TTJfjZWPNGSxRTiR7rb
	yff/cPXdxdQlokrgf1GcUV3bf+OvHdOAwJaD79gehbc/I+33yH8r/qO7xEBaIf3lDSWDCDlCG7QWH
	3F5P7hjDkJt+BoanY7YfbViaCVaev/bxoWwrEqRK9GEn2bpO7a25fLUtNWtvC9b1rL0YRRhVpDNws
	KOgzaL3A==;
Received: from 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtbi-0000000HLgi-1FeM;
	Thu, 08 May 2025 05:15:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] f2fs: simplify return value handling in f2fs_fsync_node_pages
Date: Thu,  8 May 2025 07:14:31 +0200
Message-ID: <20250508051520.4169795-6-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508051520.4169795-1-hch@lst.de>
References: <20250508051520.4169795-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Always assign ret where the error happens, and jump to out instead
of multiple loop exit conditions to prepare for changes in the
__write_node_folio calling convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/node.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index f6e98c9fac95..cbc7e9997b74 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1871,31 +1871,30 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			ret = __write_node_folio(folio, atomic &&
+			if (__write_node_folio(folio, atomic &&
 						folio == last_folio,
 						&submitted, wbc, true,
-						FS_NODE_IO, seq_id);
-			if (ret) {
+						FS_NODE_IO, seq_id)) {
 				folio_unlock(folio);
 				f2fs_folio_put(last_folio, false);
-				break;
-			} else if (submitted) {
-				nwritten++;
+				folio_batch_release(&fbatch);
+				ret = -EIO;
+				goto out;
 			}
+			if (submitted)
+				nwritten++;
 
 			if (folio == last_folio) {
 				f2fs_folio_put(folio, false);
+				folio_batch_release(&fbatch);
 				marked = true;
-				break;
+				goto out;
 			}
 		}
 		folio_batch_release(&fbatch);
 		cond_resched();
-
-		if (ret || marked)
-			break;
 	}
-	if (!ret && atomic && !marked) {
+	if (atomic && !marked) {
 		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
 			   ino, last_folio->index);
 		folio_lock(last_folio);
@@ -1907,7 +1906,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 out:
 	if (nwritten)
 		f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
-	return ret ? -EIO : 0;
+	return ret;
 }
 
 static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)
-- 
2.47.2

