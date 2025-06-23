Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFCC10E5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750649852; cv=none; b=L4qk+r8JC4BjUenkqho7zUSe7NhPmzDgowJ+/2gwaCdTnpP3kUM2N+A57NKJcvwFcpPeNLKT+8Vmq7I31x4YtNqI98Ra7Dv1d7q1nUwWmt1sNYXE0Oxj1jAAi8cZ78DOjR6ZAXku63QkvpAYIfPco+q5o9+rfJ730DfN3ztF+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750649852; c=relaxed/simple;
	bh=PrvOGg5BbBktbQesyzywlMLk6uwm3bjMQeyOjQmfKLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWOVl9rpJK3bHoJzF0AHHv8lRxcwmSqEzPcpouly2OZ1BlaJECthrrwVMISSgs/voZV+1BMQzdhJCneNc/JAIeEm+eIQ087SzyG0iBx+vcZFakT26Dr5uq2mzm3hBBj1MDOnrB9TRw1YSh39eikt9tKGWHZjqGAm6dc0rn0R9QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=mTk5AwNg; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mTk5AwNg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750649847; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=X95Z8bS+8nuD4P3ijqDpImaVXrUo0x81pQGKzn2BuJY=;
	b=mTk5AwNgfd49RqwMhBNQ1/05FwgxXQkIHPdiGK84UrnFlTNB/rKmvVOtg/KUoo7ZcuZzek/BOFl6KfCFpH8u3QQLaWrPFc5umTCRE6DENppDXHGvJ2ovZ+Vd8j1LcTeHVKqVbOCxrfKvIHOQiW9V39ROt5v2s9Y11vRKQcnCfDI=
Received: from 30.74.144.128(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeSQwSG_1750649844 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 23 Jun 2025 11:37:25 +0800
Message-ID: <e7b6b4bd-5294-4fe9-bcc6-225013e7828c@linux.alibaba.com>
Date: Mon, 23 Jun 2025 11:37:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mm/shmem, swap: improve mthp swapin process
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250619175538.15799-1-ryncsn@gmail.com>
 <20250619175538.15799-4-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250619175538.15799-4-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kairui,

On 2025/6/20 01:55, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Tidy up the mTHP swapin code, reduce duplicated codes and slightly
> tweak the workflow.
> 
> For SWP_SYNCHRONOUS_IO devices, we should skip the readahead and swap
> cache even if the swapin falls back to order 0. Readahead is not helpful
> for such devices.

Yes, agree.

> Also consolidates the mTHP related check to one place so they are now
> all wrapped by CONFIG_TRANSPARENT_HUGEPAGE, and will be trimmed off by
> compiler if not needed.

I like your idea. But I found this patch hard to review, since you you 
mixed too many changes into one patch. I think you could at least split 
it into 3 patches to make it easier for the reviewer to review and test:

1. consolidate the mTHP related check to one place (cleanup)
2. tidy up the mTHP swapin code (cleanup)
3. skip swapcache for order 0
