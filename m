Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA62217704
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268290; cv=none; b=LLZEX3oxdtrAMJ+WSZi6mfUzE164QVUDJ1eyhxM0fhw6vCLS5f/eSn49Hci5u3SWYyiZtMEEfQ9AfPdthwbhHDNqhX7owd39paZ8o6drSBIoCrwAu3lrGc35svhvIEjlUMR1K1eL4eQwCBxlDNC4vctMKu5qWMm9LbrXtMuOxL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268290; c=relaxed/simple;
	bh=yuON+dCC7nR1Z56t2DHFyKGVGNZljvXsafghrJjNU8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYkis5dWBG0VvOPDRgb2kcpMS5I+4SrTzL755JQ6MAjP9am6N3nBWnJSbuAWG8GBT3+Xr19C7uQrpPfAVrUKkeun+4Slpa1NmSlBwMFPMqf+2VoYK4dR8o5XgWqkv2JwsNUiOl9NAZSB8iUXeS9dViluvF+pvOqPzmcUCYom0fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=gokvFfCU; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="gokvFfCU"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751268286; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=pAOeCrfOd2UplQbpDhRXR3pcI2FjIBmJ9quPrr2A9Tc=;
	b=gokvFfCUTkrC9+lqdWr+reUg+STrxMuqmzxhown/9t7szqzMr65y117qdbAgPGJ9IHyEiXCBkgJpNNXew30q2Z37tSGCXqeoX/pU8LXdoKaf0Djk3YevBLz/siy+6bPEWfKPbgRUEEFln1AodDMOcRS83fgDyz+F5GdzrNGLOG4=
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wg5a4LZ_1751268284 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 15:24:44 +0800
Message-ID: <19e1d864-a0b5-4854-9f10-56cf6be7638d@linux.alibaba.com>
Date: Mon, 30 Jun 2025 15:24:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] mm/shmem, swap: never use swap cache and readahead
 for SWP_SYNCHRONOUS_IO
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250627062020.534-1-ryncsn@gmail.com>
 <20250627062020.534-6-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250627062020.534-6-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/27 14:20, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Currently if THP swapin failed due to reasons like partially conflicting
> swap cache or ZSWAP enabled, it will fallback to cached swapin.
> 
> Right now the swap cache has a non-trivial overhead, and readahead is
> not helpful for SWP_SYNCHRONOUS_IO devices, so we should always skip
> the readahead and swap cache even if the swapin falls back to order 0.
> 
> So handle the fallback logic without falling back to the cached read.
> 
> Also slightly tweak the behavior if the WARN_ON is triggered (shmem
> mapping is corrupted or buggy code) as a side effect, just return
> with -EINVAL. This should be OK as things are already very wrong
> beyond recovery at that point.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 68 ++++++++++++++++++++++++++++++------------------------
>   1 file changed, 38 insertions(+), 30 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 5be9c905396e..5f2641fd1be7 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1975,13 +1975,15 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
>   	return ERR_PTR(error);
>   }
>   
> -static struct folio *shmem_swap_alloc_folio(struct inode *inode,
> +static struct folio *shmem_swapin_direct(struct inode *inode,
>   		struct vm_area_struct *vma, pgoff_t index,
>   		swp_entry_t entry, int order, gfp_t gfp)
>   {
>   	struct shmem_inode_info *info = SHMEM_I(inode);
>   	int nr_pages = 1 << order;
>   	struct folio *new;
> +	pgoff_t offset;
> +	gfp_t swap_gfp;

Nit: The term 'swap' always reminds me of swap allocation:) But here 
it's actually about allocating a folio. Would 'alloc_gfp' be a better 
name? Otherwise look good to me.
