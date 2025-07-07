Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4D27AC34
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876086; cv=none; b=uxtaWEKfbFAJwh50siIx3mIbIhrlpOREhp036YfEiAdlw3u3Dml2uPiXw45DU1Rd8nMG6PrEiyFEpkHotfjzQXR8NE6iN7wbwZZ/weL5Va9O1W36ZglhrlsG2TScqqXEm2X8L3b+U53PuIJ79R29SWoVzvHEVcGbnEQBt5O5lkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876086; c=relaxed/simple;
	bh=REDttirfsJlFO7OpsoIYpKcHqpgtFT0zAuY6MizcGfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+3lwHKO8mwCe9puKdRXbumiE8D+aESyA1VUSuz9ml8SFhV37pdFP2dHSQ71ona0KkTr8xqLRSCntQLwGgnVD2OYGx3CNvf7cyM8bl9AVvTQl17F5wzqczkdxSfdmAucN+mQ8lx5xZTz5YbttSnlGnO+rLe48PFQx0u3Wpd4Mk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=KlIUnSnc; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KlIUnSnc"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751876081; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=al3xd+vqfx8QYsniRark/BwtIMxmJYpnPra7XC6K1e8=;
	b=KlIUnSncfNDhPgUzrD2GiqhaZFBP5UYyCg9tXHDggRFraYYlE+Wz18nutfnDMj3+LZB5Uzx+z9IjnrvebIaDl6DN5vXWidbRntxhdqEeG5QWMYtaFK1ZMuxifix6vcsRPJ4MRtysDyg4bpoogJGphyhoKpnIJTubnJsQkwmaSi0=
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wi3TIo._1751876079 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Jul 2025 16:14:40 +0800
Message-ID: <f3a54399-6a1b-467f-97d7-ee2481ac811b@linux.alibaba.com>
Date: Mon, 7 Jul 2025 16:14:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] mm/shmem, swap: simplify swapin path and result
 handling
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250704181748.63181-1-ryncsn@gmail.com>
 <20250704181748.63181-8-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250704181748.63181-8-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/7/5 02:17, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Slightly tidy up the different handling of swap in and error handling
> for SWP_SYNCHRONOUS_IO and non-SWP_SYNCHRONOUS_IO devices. Now swapin
> will always use either shmem_swapin_direct or shmem_swapin_cluster,
> then check the result.
> 
> Simplify the control flow and avoid a redundant goto label.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 31 +++++++++++++------------------
>   1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 1fe9a3eb92b1..782162c0c4e0 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2327,33 +2327,28 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   			count_vm_event(PGMAJFAULT);
>   			count_memcg_event_mm(fault_mm, PGMAJFAULT);
>   		}
> -		/* Skip swapcache for synchronous device. */
>   		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> +			/* Direct mTHP swapin skipping swap cache & readhaed */
>   			folio = shmem_swapin_direct(inode, vma, index, swap,
>   						    index_entry, order, gfp);
> -			if (!IS_ERR(folio)) {
> +			if (IS_ERR(folio)) {
> +				error = PTR_ERR(folio);
> +				folio = NULL;
> +				goto failed;
> +			} else {

The 'else' can be avoided, otherwise LGTM.

>   				if (folio_test_large(folio))
>   					swap = index_entry;
>   				skip_swapcache = true;
> -				goto alloced;
>   			}
> -
> -			/*
> -			 * Direct swapin handled order 0 fallback already,
> -			 * if it failed, abort.
> -			 */
> -			error = PTR_ERR(folio);
> -			folio = NULL;
> -			goto failed;
> -		}
> -		/* Cached swapin with readahead, only supports order 0 */
> -		folio = shmem_swapin_cluster(swap, gfp, info, index);
> -		if (!folio) {
> -			error = -ENOMEM;
> -			goto failed;
> +		} else {
> +			/* Cached swapin with readhaed, only supports order 0 */
> +			folio = shmem_swapin_cluster(swap, gfp, info, index);
> +			if (!folio) {
> +				error = -ENOMEM;
> +				goto failed;
> +			}
>   		}
>   	}
> -alloced:
>   	if (order > folio_order(folio)) {
>   		/*
>   		 * Swapin may get smaller folios due to various reasons:

