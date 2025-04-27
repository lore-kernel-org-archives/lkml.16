Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E06610D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734028; cv=none; b=PPwwEPjOXzr87laCMqsVzP3xUgBP6CEkx9icHThE7w9/RhWxpPQylu8jIKo1UFqXd7cfPqk7N6Ckmx5Al612+QhucTX00D4Ape852dE6Sr0e2aNP15TUhmBRbp3j/P9Q2zaBpjJf/h93RaV8PMT7XSZViOZCNU9lHeRVYGB5SUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734028; c=relaxed/simple;
	bh=nWonDwXa6lTHreu5HkvLHRjxafxaPKpG2JJX7sYMwOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxUKLdhmBVQX5UjmBdTYpgwsJ5m2zi3Tl93ookb4Bb9iVv0C1OmNT/2Znx3s/stwHysVWiAQ2t9y2j4BLi6d62onsYPdVbGpHG3p28E++ZjAP5Y2bsLND0/inHrPSbXQT+h/087fGPuHGb6S4Oh2d2fqdBCG0ONy6YeKg8t/lgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nKdWAIIS; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nKdWAIIS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745734017; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hC0xG7CwTbEtPZFEoTnnKtGHvz9QFvegQL55crSubn4=;
	b=nKdWAIISdbjy9dNGUMExXyl7h2Z+FuT/KqykpnU3/ncK1EwhSrTTMi6Fvju3tBXaeG5JqX5n/6W4hErJu/osv1DWQ65BlXiu1X87Q5gMfCDs1v1KzCxhnbtgi0gEqC1eNL23gpUFeQawn/xiL5xJEwAYeBfpHgGVc6BywzjzTMg=
Received: from 30.74.144.120(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WY7uW41_1745734016 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 27 Apr 2025 14:06:56 +0800
Message-ID: <5945408b-e4f0-429f-ad25-a67cd2014737@linux.alibaba.com>
Date: Sun, 27 Apr 2025 14:06:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm/huge_memory: Remove useless folio pointers
 passing
To: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: gshan@redhat.com, david@redhat.com, willy@infradead.org, ziy@nvidia.com,
 linmiaohe@huawei.com, hughd@google.com, revest@google.com,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org
References: <20250425103859.825879-1-gavinguo@igalia.com>
 <20250425103859.825879-3-gavinguo@igalia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250425103859.825879-3-gavinguo@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/25 18:38, Gavin Guo wrote:
> Since the previous commit "mm/huge_memory: Adjust try_to_migrate_one() and
> split_huge_pmd_locked()" has simplified the logic by leveraging the
> folio verification in page_vma_mapped_walk(), this patch removes the
> unnecessary folio pointers passing.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@redhat.com/
> Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d7@redhat.com/
> Signed-off-by: Gavin Guo <gavinguo@igalia.com>
> Acked-by: David Hildenbrand <david@redhat.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
