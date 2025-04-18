Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57170270EAF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970179; cv=none; b=bfzUQVEDJsL061EsIXtB3z6OsnPn8r1P465nUVYa8RnDCi9Wx4/puXMR6fyTW8JyQg+pVPJOHkZyVpiNsiVql1nDqHadgqks/C56S6AIOwTPAp23TV2UUhehCVaB1ohrKz5g7wFNPenfmymaKNiuDpDw/ej6xbY0WhpIDmmDeLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970179; c=relaxed/simple;
	bh=iIlIRJaJ8Nk9baLTAldhAKHTfIUQ0a8HFvaz7lfJOqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubLJalwgw/VF9kGF209UuBniVEs4GmGp1QNMCC/4BrKoDAyEJAzuEgL/lu1sf9WMzSuWt61qVoV67vlYuVn25UHeeh4bsYCVBkX45s9xsbdsBNOkQI3BkTSpjGUCJsklbDM4cm1h7eEmMdvJGnAZuXpEoecrX0xCIG9crklsGyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nV2Dgi2j; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nV2Dgi2j"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744970175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oGO08xLxOYFwCfCougkQzxDVIQkhT4UpNDlADOdXRwg=;
	b=nV2Dgi2jGfZeEa/GVr3gLRUCxK0hfFB3KQB52i0/xewU0X2qg90lCUqafrPQ1jdjDA/q/a
	IXA6abaerCkiLduWWL09cymItVyH2TSF1JMDiEVOBU79YjSuQrM0mAjAAIwxNNaWRwfFut
	5vSsZWlsbnYoUItGRJiDPmaD5b+OUL8=
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
Subject: [PATCH v2 2/2] mm/rmap: fix typo in comment in page_address_in_vma
Date: Fri, 18 Apr 2025 17:56:00 +0800
Message-Id: <20250418095600.721989-3-ye.liu@linux.dev>
In-Reply-To: <20250418095600.721989-1-ye.liu@linux.dev>
References: <20250418095600.721989-1-ye.liu@linux.dev>
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
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index b509c226e50d..a9eed8981e18 100644
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

