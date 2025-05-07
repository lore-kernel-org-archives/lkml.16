Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9D11A00E7;
	Wed,  7 May 2025 05:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594891; cv=none; b=VYdGcB5OzBDBm5eTAMk/B4Ei5DRiLboOQB3alkMyWYNlcff6QCgnmUwDQtYtaq98h2QQ3BwQUFiCZiK/TtF52A9U40zKCjPk7jsr15csAZmNq7nCp4d40Gp7J/vmf21xg2r+q6t5c+HhQl70ysyDeTJGBA6SzR59GteBlhOASio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594891; c=relaxed/simple;
	bh=RQlW4Q8eu/E9i+tpdL943MQu48aVGiUp9nc8qpbOhrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HxnArBAaYi/d1+z4C8/cvD1gopqSCDKM+cnhrGjTdrIo7IBw7h/wEQnTD8qcjGKl9+lnXrjmzI3DeY42hMcHN7InsUjsBLbE9rgDd1N9GDYsu3pC37imVHRCsH8W/zUPpWfEv75DQpDVotQz1N1wRd0EKO9n5svibTf2cCgRDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JEmjG03T; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JEmjG03T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2h+qoCR/BCm/MM0PRcNEUyyKVzmW4NposRNWGIf220g=; b=JEmjG03TTppfgHid93mDIG922f
	5xeiPZqLNZBpYiX5ScFN+Yhvao+88mTBbdxxr1TScgaJjoTsidrDVUtrcIO9byrqe5d8PlccK0nro
	6AK6OsPf7tTvX2BrqRfgwahSullLfAKELa/MHcm/K2yJhmN5duX2xA/l74ydE7fb62zWNJpc1kxTy
	QykHJn6O6OyUsbGIlVMUEGf/265i4+EdTMWwWxuS+aQUzBK4GUvifs87Vx5iVPDHn9NlCDsqr3ACD
	aynSPgQH8Xe3bKkyE5xN4AJwKJN6artMvlOsLR4SpUpFN/GSJHeecLhNyev7Tc9mC9T2TCrkpLNX1
	qvXq+Log==;
Received: from 2a02-8389-2341-5b80-3ba7-83fe-7065-4f0b.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:3ba7:83fe:7065:4f0b] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCX7I-0000000EFE2-2nGd;
	Wed, 07 May 2025 05:14:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: willy@infradead.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] xarray: fix kerneldoc for __xa_cmpxchg
Date: Wed,  7 May 2025 07:14:46 +0200
Message-ID: <20250507051446.3898790-1-hch@lst.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Fix the documentation for __xa_cmpxchg to actually describe the
cmpxch-like semantics correctly, based on the version for xa_cmpxchg.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/xarray.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/lib/xarray.c b/lib/xarray.c
index 9644b18af18d..13a0781365ca 100644
--- a/lib/xarray.c
+++ b/lib/xarray.c
@@ -1742,21 +1742,27 @@ static inline void *__xa_cmpxchg_raw(struct xarray *xa, unsigned long index,
 			void *old, void *entry, gfp_t gfp);
 
 /**
- * __xa_cmpxchg() - Store this entry in the XArray.
+ * __xa_cmpxchg() - Conditionally replace an entry in the XArray.
  * @xa: XArray.
  * @index: Index into array.
  * @old: Old value to test against.
- * @entry: New entry.
+ * @entry: New value to place in array.
  * @gfp: Memory allocation flags.
  *
  * You must already be holding the xa_lock when calling this function.
  * It will drop the lock if needed to allocate memory, and then reacquire
  * it afterwards.
  *
+ * If the entry at @index is the same as @old, replace it with @entry.
+ * If the return value is equal to @old, then the exchange was successful.
+ *
  * Context: Any context.  Expects xa_lock to be held on entry.  May
  * release and reacquire xa_lock if @gfp flags permit.
- * Return: The old entry at this index or xa_err() if an error happened.
+ * Return: The old value at this index or xa_err() if an error happened.
  */
+static inline void *xa_cmpxchg(struct xarray *xa, unsigned long index,
+			void *old, void *entry, gfp_t gfp)
+{
 void *__xa_cmpxchg(struct xarray *xa, unsigned long index,
 			void *old, void *entry, gfp_t gfp)
 {
-- 
2.47.2

