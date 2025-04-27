Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B644B2343AF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 06:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745733950; cv=none; b=rGt59tAhROfOm/bkb3tj7SCtt0mB3rXIq2VQOXWMJUuMbO8/7V4gLnMXbyexCNwX/ambCQCIiH2EMoF7VBN4GROYcacoECKHZQbKlurWaGREZqvt61hG+z0GFSLkd5ltUPS1En3kuA3uavmRb25gRFb/R3qL9U9ePSTk9bKtLu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745733950; c=relaxed/simple;
	bh=WCRgJwGFiscDS9s+la7Bw3jtrCTld3qoxSSBwkR+DoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqT6sfTcp+HwGoIQPjQAGs9M3vxdMI+r47Dlk/zNLPGCFWSpCOUve0suPk6s/0Ov9JurYJgIUdgogiaerj7NVxHRtoehvJhTghzNp2z5LYiHOx74gKARmz8eg4ZMzs1WHS2N8gyMrMobOBPLyloKpbXM7lGmu5St+GFa+9SG2oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=losPkBoZ; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="losPkBoZ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745733936; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=OAjq9LNbHWJusiKPmnwrKHajD1aAkosJ1OT3e2o8rvg=;
	b=losPkBoZKdfGVWfw0enqBiuMt/eizSwRP3idJHyuF0UkC7bkYiHcN9It6zDU5fSAZntNTnlPjJXYynz7zxQIVqX2+7mLFGASCV4dEOy9HJGkgyOf3wzQmzToEY5Sm0d0cUB+PYvajU0uQ74+o5sJ0KgT/q2zHHeAzQIJ0SwPx4s=
Received: from 30.74.144.120(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WY7rxZ4_1745733935 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 27 Apr 2025 14:05:35 +0800
Message-ID: <ec1eca29-4ac7-4b5c-a962-b81ee4b77d75@linux.alibaba.com>
Date: Sun, 27 Apr 2025 14:05:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm/huge_memory: Adjust try_to_migrate_one() and
 split_huge_pmd_locked()
To: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: gshan@redhat.com, david@redhat.com, willy@infradead.org, ziy@nvidia.com,
 linmiaohe@huawei.com, hughd@google.com, revest@google.com,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org
References: <20250425103859.825879-1-gavinguo@igalia.com>
 <20250425103859.825879-2-gavinguo@igalia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250425103859.825879-2-gavinguo@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/25 18:38, Gavin Guo wrote:
> The split_huge_pmd_locked function currently performs redundant checks
> for migration entries and folio validation that are already handled by
> the page_vma_mapped_walk mechanism in try_to_migrate_one.
> 
> Specifically, page_vma_mapped_walk already ensures that:
> - The folio is properly mapped in the given VMA area
> - pmd_trans_huge, pmd_devmap, and migration entry validation are
> performed
> 
> To leverage page_vma_mapped_walk's work, moving TTU_SPLIT_HUGE_PMD
> handling to the while loop checking and removing these duplicate checks
> from split_huge_pmd_locked.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@redhat.com/
> Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d7@redhat.com/
> Signed-off-by: Gavin Guo <gavinguo@igalia.com>
> Acked-by: David Hildenbrand <david@redhat.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
