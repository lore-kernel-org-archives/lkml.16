Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B2D1C84A0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744943790; cv=none; b=VRbl6UBdGVc3UcGVT6jrL6la/gbTCpPtvJtvBoqT0ipzqdGCJF9wVZXj378AW96QE8qU3+rQS7CLBVDTQkRrLwbV9EZ2J0XpylSblqj26vVsClL9lWCPnQoi0GuShl0QadyTAFKug9xKo4WHIWmK7JLGf45OgHlspZtsDPH38zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744943790; c=relaxed/simple;
	bh=FTl7Q5XRnGG/z7yA2jnIcdaCMVMzFKXY7SOCzfxworo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X//YFC/LKIOaXF/CpnJPGtBJvEXViLTbTXB4rmpms8rlFJfV0PeH9ViL2R7Hhg2CkNY7x+TQ+HgAwrchnRS0WcDaiTcVeg9+kyF8QGee1IIsuoFyPwM4DNKpuUoDNAClx4IjN+5bzN4LxoSNllaGIoyVEg7q7FfhQM/t/ZOrwJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aaTqAWJ4; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aaTqAWJ4"
Message-ID: <cf8e2dba-83dd-4ad3-b98d-2e463ea569d9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744943775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbE8PCxj37IlfzeB23r98u0SEU9TacNSUq2UwVU1+Ag=;
	b=aaTqAWJ4vWMSW3JKJLdxB+V6toZe5COJtDrFrTe3YygJoTCx+cj8cFUMAZxFSQa0VdkWaG
	mOGyXLvF1+F/KnTGW10tDstqV04gRCIoK76cl2pcDZmw6SOQkrAKqbchj65/FIr6YdDkMN
	gZl4IdXmdFc2lbgbELuxvI/JHf414V0=
Date: Fri, 18 Apr 2025 10:36:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 21/28] mm: zswap: prevent lruvec release in
 zswap_folio_swapin()
To: Muchun Song <songmuchun@bytedance.com>, hannes@cmpxchg.org,
 mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
 muchun.song@linux.dev, akpm@linux-foundation.org, david@fromorbit.com,
 zhengqi.arch@bytedance.com, yosry.ahmed@linux.dev, nphamcs@gmail.com
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-mm@kvack.org, hamzamahfooz@linux.microsoft.com,
 apais@linux.microsoft.com
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-22-songmuchun@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250415024532.26632-22-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/4/15 10:45, Muchun Song wrote:
> In the near future, a folio will no longer pin its corresponding
> memory cgroup. So an lruvec returned by folio_lruvec() could be
> released without the rcu read lock or a reference to its memory
> cgroup.
> 
> In the current patch, the rcu read lock is employed to safeguard
> against the release of the lruvec in zswap_folio_swapin().
> 
> This serves as a preparatory measure for the reparenting of the
> LRU pages.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

It should be rare to race with folio reparenting process, so
it seems ok not to "reparent" this counter "nr_disk_swapins".

Reviewed-by: Chengming Zhou <chengming.zhou@linux.dev>

Thanks.

> ---
>   mm/zswap.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 204fb59da33c..4a41c2371f3d 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -752,8 +752,10 @@ void zswap_folio_swapin(struct folio *folio)
>   	struct lruvec *lruvec;
>   
>   	if (folio) {
> +		rcu_read_lock();
>   		lruvec = folio_lruvec(folio);
>   		atomic_long_inc(&lruvec->zswap_lruvec_state.nr_disk_swapins);
> +		rcu_read_unlock();
>   	}
>   }
>   
