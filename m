Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9C2205AD9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970176; cv=none; b=fFr9OMjhIChJNwHg7hq4kx0Cl6HekITRkpnGVfbFqUphSwhb+8f48r7tQ/CS24djGgVMcYehgksdRNAx7ykjw5+wLhC6y7SSWY5bLRdAxs7zbM9kuCs9mqz7xoSYAUNpjd/m2JGYF4OfVs7wpavjQilgxhQ3OfyDpWHGT7NqE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970176; c=relaxed/simple;
	bh=r4dN01ltDy7898Kv/798fP4bDvH9kh36i/O5cVD2LM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SuSdbv5ErlWh7JdenmD0ot3vkVPHlL+MHYGYpPlYzaW3ho2nevh6fiwzgFZA/opdrccprxGqbcFlgYT0+9yFnGitFNM7b5t3W/iLKuBoFd9xhcte/dOhRB7odMe+BbMlbvxKS2q2rxwo/Ts2uxmLaJ56s6G/+4AoBkYrRbZ8seA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eGDAELos; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eGDAELos"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744970171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OBuEFz8FseY66OhdFa8eDqvIegINB5zk/KQ3fZF4sJY=;
	b=eGDAELosMUAD5BaGg9cc9dAakH4IyAztwtxaTwlLa+bELIKJWLThYPMimNn797X3lLKCVF
	PBqZrU1Dj90s0yoyblf6ufcs+xLL+gNoptqRiIryjvmjXMY06V9TZ6NxlEqUpdNJx9aifQ
	PxiMh2NoYzoYRj05gLypTyT2+GGvlTY=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org,
	nao.horiguchi@gmail.com,
	linmiaohe@huawei.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	david@redhat.com,
	harry.yoo@oracle.com,
	riel@surriel.com,
	vbabka@suse.cz,
	liuye@kylinos.cn,
	ye.liu@linux.dev
Subject: [PATCH v2 1/2] mm/rmap: rename page__anon_vma to page_anon_vma for consistency
Date: Fri, 18 Apr 2025 17:55:59 +0800
Message-Id: <20250418095600.721989-2-ye.liu@linux.dev>
In-Reply-To: <20250418095600.721989-1-ye.liu@linux.dev>
References: <20250418095600.721989-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Renamed local variable page__anon_vma in page_address_in_vma() to
page_anon_vma. The previous naming convention of using double underscores
(__) is unnecessary and inconsistent with typical kernel style, which uses
single underscores to denote local variables. Also updated comments to
reflect the new variable name.

Functionality unchanged.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/rmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 67bb273dfb80..b509c226e50d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
 		const struct page *page, const struct vm_area_struct *vma)
 {
 	if (folio_test_anon(folio)) {
-		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
+		struct anon_vma *page_anon_vma = folio_anon_vma(folio);
 		/*
 		 * Note: swapoff's unuse_vma() is more efficient with this
 		 * check, and needs it to match anon_vma when KSM is active.
 		 */
-		if (!vma->anon_vma || !page__anon_vma ||
-		    vma->anon_vma->root != page__anon_vma->root)
+		if (!vma->anon_vma || !page_anon_vma ||
+		    vma->anon_vma->root != page_anon_vma->root)
 			return -EFAULT;
 	} else if (!vma->vm_file) {
 		return -EFAULT;
@@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
 		return -EFAULT;
 	}
 
-	/* KSM folios don't reach here because of the !page__anon_vma check */
+	/* KSM folios don't reach here because of the !page_anon_vma check */
 	return vma_address(vma, page_pgoff(folio, page), 1);
 }
 
-- 
2.25.1

