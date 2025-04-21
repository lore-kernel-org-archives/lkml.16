Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559342144A0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225868; cv=none; b=f7nwxgFovFC5RrQM7DK1u6fh47KNOzoq5HZ7uTvaD1kuVhBHGwwhXAtBur4TbZDAUptJvM/Ci/ZPvL3oP59WvM+RxwSE1sJG5gv8mpPiC/XIRXUEd6Ct/GfY7W5//TKOJQUkc5RbBTPjdkdrAuIlcg0hb+tHCg62BVAYnCBJ+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225868; c=relaxed/simple;
	bh=xZg3e5MTLyDKCIB++cjNbs0Dr6BctcwdQqF1QNoQBGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVr1jooezGSf/3rBES0q30sGrNTr6fAb0LFmlK76bOGSf9g2l8LRiWR3ikkcCVasTeAUOLFDWWeYlIzLhAnaYWnFJOIP/rsHgjbqDVWrMQGdRCG78IxVdtiZU9eDmWD8SnP69F+O0mQRBRRWWmVXXhRJMASOu2uaiviPp8hwIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G4+LoIsg; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G4+LoIsg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745225864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+zJdhLkFLI3UbvB4m0z83CmxSXdxm1YCQJNWyXYQ2Xg=;
	b=G4+LoIsgNs8GWZR1WPM7rVLYSW/iYXe6g97Z7p3X6vkuxdqMeRhbqEKRQ98pQ2JyoY4wer
	IOsNo/9u4dr1APZ3Y6LxVRLLw0KBu0lHpWA8GsqjGB7sqYD1etJhONA6Pin6caEhrvx/08
	mGM1uQjABKCH0N8jZtxsrNgqs3P11YM=
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
Subject: [PATCH v3 2/2] mm/rmap: fix typo in comment in page_address_in_vma
Date: Mon, 21 Apr 2025 16:57:29 +0800
Message-Id: <20250421085729.127845-3-ye.liu@linux.dev>
In-Reply-To: <20250421085729.127845-1-ye.liu@linux.dev>
References: <20250421085729.127845-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Fixes a minor typo in the comment above page_address_in_vma():
"responsibililty" → "responsibility"

Signed-off-by: Ye Liu <liuye@kylinos.cn>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 447e5b57e44f..ae4b75ce617b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -774,7 +774,7 @@ static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
  * @vma: The VMA we need to know the address in.
  *
  * Calculates the user virtual address of this page in the specified VMA.
- * It is the caller's responsibililty to check the page is actually
+ * It is the caller's responsibility to check the page is actually
  * within the VMA.  There may not currently be a PTE pointing at this
  * page, but if a page fault occurs at this address, this is the page
  * which will be accessed.
-- 
2.25.1

