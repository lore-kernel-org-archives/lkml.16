Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625016D17;
	Thu,  5 Jun 2025 00:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749083020; cv=none; b=QvKzPw8kidLle06rpbc9YLaJrmfr4lkvGtS1ttrPAgV9SER0aEck9qymOJmK8CQ0N+FyFogElFJlFcOoHKUSjrx220snfe+w8Vj5Bn3pSiRdWB63jINADxrLIM+HGAhQc0CyXcgT5PJB6w+oI+BR3mF9tqfECB6G2I37GPf+vyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749083020; c=relaxed/simple;
	bh=08y6yBFFD19bLUtXW75mx5bv+aCMGbiPHBmnWkGMfWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aao3qRkl1a31d0HPIq5yCt3O1ItOHYOV5KuB7Ugv72nYF0CkH58LYA7OMqileM4LOpzsCZhk9mxIYwLGkNobaqYfKtcvKQV17nuOYHExLyhmx8UdfHF1YMn714LGk0xj2nUdEfRGwgjZulVqLyuhJeRNfl0rwpPwYKsJBXkAp4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qPoF38Jz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qPoF38Jz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=7rxV1GMXJ0RS56+/Kl1Ef1upQFNBCWvW7MU/FpTHT8M=; b=qPoF38JzeEQXj/ymHYiueEK6Xv
	KDmd9sNar7WGdYLFs3fmSIhfDt/tFcvR8Y6VW25uvnBb0ImCavCn2RZNUlngngVKzcH4nvjsdfETt
	/FUFlVGjfRBB+at/jvLilN7OORCkTl9D9wQ6bUyrX2zT9qGz1nGEOW3zVz6fMHe3seEmhKxabEQRv
	PYUZf7plLmlUEPmH/LHCEUsma0hM6K8GxdAT4dDfnOH1vUO5mqLb6iG4MG6a1Bpw/b+vYkU27rlsV
	7xd1G9GYKeatTi3XQaxjfrN+xXxXC3TU49/7peqIYkvRMicjisoF9wDIDwelXRVP4lkisSX5ptt6W
	XXeA0jyA==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMyOP-0000000ERQT-3pxF;
	Thu, 05 Jun 2025 00:23:37 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] scatterlist: fix extraneous '@'-sign kernel-doc notation
Date: Wed,  4 Jun 2025 17:23:37 -0700
Message-ID: <20250605002337.2842659-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using "@argname@" in kernel-doc produces "argname****" (with "argname"
in bold) in the generated html output, so use the expected kernel-doc
notation of just "@argname" instead.

"Fixes:" are added in case Matthew's patch [1] is backported.

Fixes: 0db9299f48eb ("SG: Move functions to lib/scatterlist.c and add sg chaining allocator helpers")
Fixes: 8d1d4b538bb1 ("scatterlist: inline sg_next()")
Fixes: 18dabf473e15 ("Change table chaining layout")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: linux-doc@vger.kernel.org

[1]: https://lore.kernel.org/linux-doc/3bc4e779-7a79-42c1-8867-024f643a22fc@infradead.org/T/#m5d2bd9d21fb34f297aa4e7db069f09bc27b89007
---

 include/linux/scatterlist.h |    4 ++--
 lib/scatterlist.c           |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

--- linux-next-20250604.orig/include/linux/scatterlist.h
+++ linux-next-20250604/include/linux/scatterlist.h
@@ -99,7 +99,7 @@ static inline bool sg_is_last(struct sca
  * @sg:		The current sg entry
  *
  * Description:
- *   Usually the next entry will be @sg@ + 1, but if this sg element is part
+ *   Usually the next entry will be @sg + 1, but if this sg element is part
  *   of a chained scatterlist, it could jump to the start of a new
  *   scatterlist array.
  *
@@ -254,7 +254,7 @@ static inline void __sg_chain(struct sca
  * @sgl:	Second scatterlist
  *
  * Description:
- *   Links @prv@ and @sgl@ together, to form a longer scatterlist.
+ *   Links @prv and @sgl together, to form a longer scatterlist.
  *
  **/
 static inline void sg_chain(struct scatterlist *prv, unsigned int prv_nents,
--- linux-next-20250604.orig/lib/scatterlist.c
+++ linux-next-20250604/lib/scatterlist.c
@@ -73,9 +73,9 @@ EXPORT_SYMBOL(sg_nents_for_len);
  *   Should only be used casually, it (currently) scans the entire list
  *   to get the last entry.
  *
- *   Note that the @sgl@ pointer passed in need not be the first one,
- *   the important bit is that @nents@ denotes the number of entries that
- *   exist from @sgl@.
+ *   Note that the @sgl pointer passed in need not be the first one,
+ *   the important bit is that @nents denotes the number of entries that
+ *   exist from @sgl.
  *
  **/
 struct scatterlist *sg_last(struct scatterlist *sgl, unsigned int nents)
@@ -345,7 +345,7 @@ EXPORT_SYMBOL(__sg_alloc_table);
  * @gfp_mask:	GFP allocation mask
  *
  *  Description:
- *    Allocate and initialize an sg table. If @nents@ is larger than
+ *    Allocate and initialize an sg table. If @nents is larger than
  *    SG_MAX_SINGLE_ALLOC a chained sg table will be setup.
  *
  **/
