Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AB61DED6D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215076; cv=none; b=dGynk3Fy6OnZrA/JxWzc7ktqaHVpqnu7FdM0em+g84mr8OtfQiTyJYJZMvTevot8V3uQwhlf3XjFsMhPeXOSJTFZUINbw5+VECmIcGJI9YpsS1DSigqPXlPjWcq00E864a65lQBaHSz9AQOOByprKqLr9n7LREPU3D2UlyPPgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215076; c=relaxed/simple;
	bh=1lDRHFUEcYA1sqyG+3ynNDFcoDdNGWXTq+cTWlF2Zmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brxGEZ29OY42fvxal4nQC0aBpM1HMtpQIPlO2wOMLvaY5+RmNXSZ3oTfuPgqiLoeztTnlq2vJzKEqr+QQSUmfAn0jnjFjswCdpC3ccf9MrKDWSghA0Pgh3nn75UbEg/ZjKr3tb4HYFPvl+1Keq4fcMkm6dWCf1dy3kSCqAKGCr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lCa+/oEK; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lCa+/oEK"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747215064; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=SRfQBr8tFcfh0SvdA/mIg1g7T/s8SfnIEXb2RdwapC4=;
	b=lCa+/oEKDnxUdWDfcYZvX5mKnOQQf9av6lEPzvY0K7XHt8yq9zazPBwwaSKz/fJHtdhMPHAw1MGE6AvRovue11nbncigKgmdlYtZhWtfIxkdx2HJO5Wrr5UuEBOsuSx7OZqvQ5OxeTksqhojTMikWxfFvul8605aaqes8nTuG8s=
Received: from 30.74.144.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WalMYN2_1747215063 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 17:31:04 +0800
Message-ID: <fe00c756-8c1c-4219-af16-8bb9f6300bbc@linux.alibaba.com>
Date: Wed, 14 May 2025 17:31:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mm: shmem: keep inode in swaplist when failed to
 allocate swap entry in shmem_writepage()
To: Kemeng Shi <shikemeng@huaweicloud.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250514165047.946884-1-shikemeng@huaweicloud.com>
 <20250514165047.946884-5-shikemeng@huaweicloud.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250514165047.946884-5-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/15 00:50, Kemeng Shi wrote:
> Even if we fail to allocate a swap entry, the inode might have previously
> allocated entry and we might take inode containing swap entry off swaplist.
> As a result, try_to_unuse() may enter a potential dead loop to repeatedly
> look for inode and clean it's swap entry.
> Address this by keeping inode in swaplist even if we fail to allocate
> swap entry as it does not pose significant problem to keep inode without
> swap entry in swaplist.
> 
> Fixes: b487a2da3575b ("mm, swap: simplify folio swap allocation")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>   mm/shmem.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 0fed94c2bc09..dfd2f730833c 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1651,8 +1651,6 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
>   		BUG_ON(folio_mapped(folio));
>   		return swap_writepage(&folio->page, wbc);
>   	}
> -
> -	list_del_init(&info->swaplist);

If 'info->swapped' is 0, we can still remove it?
