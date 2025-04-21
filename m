Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46820DD63
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225865; cv=none; b=fbwCDBEcuh9nDcDibTkIVmiyIwO7LzbC2LnEtUcJacGnBnx7rfPF1ncAvYoWHEL0jiUlI0HHb6QoJqRDkQ4FnUBphQlkrmd9oQfPU7TSKfRitP7lFqZkiY/pyzfS35fjaUXdVgMjeggccgKJQ3eswTx0KGnCKL4ckNoRl2jl4Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225865; c=relaxed/simple;
	bh=qFYcD6i57lgPejIMk8pwBlYfjdt+h0Tpu8JVAWsuRD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OGuhkSCbFAud91aBTI9B4eR59QaevKprAyKgxii6W417DNAMwpWpdUeK/viWySZxOwD+PMRxvziO079ztKksSWG0nIJ1rsU+KRqj+WTrMRniGbgyGfpfKbEo5ogKMRK/wFSJ03P4yHFFfv4Ke9YBYzTWuSV4JfFmQabEHRG6MRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fLZEzhve; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fLZEzhve"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745225860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/beqS/EVScs+SvdtK94Dzw1cgIrG9dVBE0vA0uYlLs=;
	b=fLZEzhve4QGWClb4JpIdlpDqOym5YV4UAnjtVxI2XNxAbFE5bl+u5aB/ZCWxppNXBxbqwp
	sUzlAKxEexZRiZRoIjS2nPwC3lAMU3HBLcVJnowaiSGKzFlMPTX2d06NQ5jUfVP+J7k2yI
	S1e8N6GTAuVAJvdPP6bV+nNYxeOK8FE=
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
Subject: [PATCH v3 1/2] mm/rmap: rename page__anon_vma to anon_vma for consistency
Date: Mon, 21 Apr 2025 16:57:28 +0800
Message-Id: <20250421085729.127845-2-ye.liu@linux.dev>
In-Reply-To: <20250421085729.127845-1-ye.liu@linux.dev>
References: <20250421085729.127845-1-ye.liu@linux.dev>
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
anon_vma. The previous naming convention of using double underscores
(__) is unnecessary and inconsistent with typical kernel style, which uses
single underscores to denote local variables. Also updated comments to
reflect the new variable name.

Functionality unchanged.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 67bb273dfb80..447e5b57e44f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
 		const struct page *page, const struct vm_area_struct *vma)
 {
 	if (folio_test_anon(folio)) {
-		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
+		struct anon_vma *anon_vma = folio_anon_vma(folio);
 		/*
 		 * Note: swapoff's unuse_vma() is more efficient with this
 		 * check, and needs it to match anon_vma when KSM is active.
 		 */
-		if (!vma->anon_vma || !page__anon_vma ||
-		    vma->anon_vma->root != page__anon_vma->root)
+		if (!vma->anon_vma || !anon_vma ||
+		    vma->anon_vma->root != anon_vma->root)
 			return -EFAULT;
 	} else if (!vma->vm_file) {
 		return -EFAULT;
@@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
 		return -EFAULT;
 	}
 
-	/* KSM folios don't reach here because of the !page__anon_vma check */
+	/* KSM folios don't reach here because of the !anon_vma check */
 	return vma_address(vma, page_pgoff(folio, page), 1);
 }
 
-- 
2.25.1

