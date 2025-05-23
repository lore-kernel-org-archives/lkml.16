Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526B4A923
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989060; cv=none; b=BVvRkiI9tRDYNZPBMORzHpYbtQlZpdU/0eBUo0yPaRVQ/LRmtxVRRUQQEdkbd6nGvELuTVuzgGqc/JQNNPsgafWLSgWV8Liz8YC1MbMa9N9jZVNqNaGvC5jS/Epgol7rEpJtcF7J/1mpPriI7qFz6aaRfizBZpRge3x4kapIDgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989060; c=relaxed/simple;
	bh=IB5Z+XOZE3jpGvWJT5bHFxMLAcWAj8rU4jCCG9FaFY8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DAZvSvbRWNN3Fn0h7op3wnSIteIkCNBIRR3zyzO0iKacuTTvFRWCTJBdwRu/D0Qo0Zrb//crQBZFH/bpA+DxqzXtLeWG8fefM63ZlsOsyceoE/gnaULsMgFMDAmFUMQZd3we7JLrhLbdIs3/covNG/w4VcRWC/oVcBy/q3Tr3vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FTEQbYzB; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FTEQbYzB"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747989055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsXWGTDv9G1fwwntK6vu0cW1hqdYJtSxhAr9nuGD+wk=;
	b=FTEQbYzBtK/qo5wG6OXMCV3sKpJJoGrKw/wtZYwA+jSdxy8hbij+dlrPWxCIXnVVGL0G94
	lq4FqR6ZCAWX+EmJt+pAunHL0/rlc8J4Zj21ZbYIe88HcJ3k2t+ta3+skoshWEPOd5OKQ7
	tN5tYSu71A1B8syoeSxL4Q3NgEsG4zo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <1747987559-23082-1-git-send-email-yangge1116@126.com>
Date: Fri, 23 May 2025 16:30:15 +0800
Cc: akpm@linux-foundation.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 21cnbao@gmail.com,
 david@redhat.com,
 baolin.wang@linux.alibaba.com,
 osalvador@suse.de,
 liuzixing@hygon.cn
Content-Transfer-Encoding: 7bit
Message-Id: <A1F5AF70-6C43-49A2-943E-CCCE62BA6A8E@linux.dev>
References: <1747987559-23082-1-git-send-email-yangge1116@126.com>
To: yangge1116@126.com
X-Migadu-Flow: FLOW_OUT



> On May 23, 2025, at 16:05, yangge1116@126.com wrote:
> 
> From: Ge Yang <yangge1116@126.com>
> 
> In the isolate_or_dissolve_huge_folio() function, the folio_test_hugetlb()
> function is called to determine whether a folio is a hugetlb folio.
> However, in the subsequent alloc_and_dissolve_hugetlb_folio() function,
> the folio_test_hugetlb() function is called again to make the same
> determination about whether the folio is a hugetlb folio. It appears that
> the folio_test_hugetlb() check in the isolate_or_dissolve_huge_folio()
> function can be removed. Additionally, a similar issue exists in the
> replace_free_hugepage_folios() function, and it should be addressed as
> well.
> 
> Suggested-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Ge Yang <yangge1116@126.com <mailto:yangge1116@126.com>>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

