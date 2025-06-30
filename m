Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB5F8460
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267151; cv=none; b=ZJ92rLYSEn/e+JUiQgAUFtRow+Ry96CVfLQfskTjfNrpxFv9sG3Fo+bQm5XSw6BIA06Lhxvvo5hmfUofFX7bRTq1btI3tkTrkrsLe6vXjAk3ZAbdtLn3lBx2voyvfoyte55OP4WNtOoEKgBUdzVkBmV3307KIriCQEHDf7g2KLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267151; c=relaxed/simple;
	bh=+P877cxGaLfbPiiI3ZSDXbUsyQp1eDv2BViZtiMKwAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjK7CZNAOQkUgb4Xtw4LrTmUjdQ9dtzoyRdcyUja8TBUy+Gl/GYgV78QRCJGIEEsgZMRqTWyPBc4R64+dvEQq+1E+0zcV/0c/wiBPfvmqeYXTkyPxpwAnh1Dy7yVMMezAwLe+DPApuBVniyTqUEeV8b4yduLMv7IGQbPqv9FmsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=kCUFhb/G; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kCUFhb/G"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751267141; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qfF4EXeW44arUrZzInGrjdsKzLu93XNyi+vgFlSYaow=;
	b=kCUFhb/GD3/cpMyP6gAjMDEDo3qvXJI79XckOOtJtdSlH6I7KKi4PPMbVjfMYTW4X1sR1YRajVGb+MCdzCkCPmRqViPS5Cy6TxeJLcTezhah50dqs4GsYI7/P0hm8b7qTYyRjj3d3TUYTt4qxs3VY6P0OszvkIV44LpQqNtsxmw=
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wg5UHDY_1751267139 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 15:05:40 +0800
Message-ID: <53a3a4e5-6fb1-4a50-89f4-81ecc499dae6@linux.alibaba.com>
Date: Mon, 30 Jun 2025 15:05:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] mm/shmem, swap: fix major fault counting
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250627062020.534-1-ryncsn@gmail.com>
 <20250627062020.534-7-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250627062020.534-7-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/27 14:20, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> If the swapin failed, don't update the major fault count. There is a
> long existing comment for doing it this way, now with previous cleanups,
> we can finally fix it.

Sounds reasonable to me. Additionally, swapin failure is a rare event, 
so I think this patch will have little impact on user statistics.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 5f2641fd1be7..ea9a105ded5d 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2316,12 +2316,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   	/* Look it up and read it in.. */
>   	folio = swap_cache_get_folio(swap, NULL, 0);
>   	if (!folio) {
> -		/* Or update major stats only when swapin succeeds?? */
> -		if (fault_type) {
> -			*fault_type |= VM_FAULT_MAJOR;
> -			count_vm_event(PGMAJFAULT);
> -			count_memcg_event_mm(fault_mm, PGMAJFAULT);
> -		}
>   		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
>   			/* Direct mTHP swapin without swap cache or readahead */
>   			folio = shmem_swapin_direct(inode, vma, index,
> @@ -2341,6 +2335,11 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		}
>   		if (!folio)
>   			goto failed;
> +		if (fault_type) {
> +			*fault_type |= VM_FAULT_MAJOR;
> +			count_vm_event(PGMAJFAULT);
> +			count_memcg_event_mm(fault_mm, PGMAJFAULT);
> +		}
>   	}
>   	/*
>   	 * We need to split an existing large entry if swapin brought in a

