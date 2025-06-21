Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58210E5
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750476926; cv=none; b=kRX4Ki7ztIhyhQ0ICxvLAnoYKC8hFiEEVo26r/SuTFQt43ybPXXMopvq9jwV9yfYDu8sn8aQL+i3JXyKKlM78GivXahgaxf04d181Ri0GMPDW4jZlgVFjJJgWOy03HGN0IuMJSO/SdPZ0SkNhx6vBlDKOiJFFwhtCUycOdp6wUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750476926; c=relaxed/simple;
	bh=eOLBai7j8+8NLikgepiPGrNyAvVYgF3/D0CWtMFasHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlTqr4PGeWRDlxpXiARscgxk/Pz8pn+yib/n1WL6Gy6/eDyw9g369wIhIustqrNwiXkMOy8LAudSi6FlV0qw9Kiw44/axK+IQxh5mvWNWjGaxHzx4W1/UYTDVM6t7QGa+fyaLceVGty5n3aoUfYI0s+tQOsB3Ci/HVa+Tw8UQNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=t0tHDc4k; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="t0tHDc4k"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750476916; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Hilh9U+GU8w5Sd/eiSB6zkwXKCB3Iw8Lnj4ZM9d3woY=;
	b=t0tHDc4kF7V8xrfBbH2mJs/LlTwR08GCMUGhWtiv4lH3Poo1K3F4XQrK9vC+ewX+Ck1IFqGGPeM0L8PEETUenwuZvHGPjczLssZUY+QKqIQrO3c27BS9HhrtSJShhPMASsJvanRSq/Q1G6hXrxHFh0KbY0KQ+sju86aa8WVl31A=
Received: from 192.168.0.102(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeMhrAi_1750476914 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 21 Jun 2025 11:35:15 +0800
Message-ID: <7a2dbb2b-7421-40f0-8f41-b920a518c8aa@linux.alibaba.com>
Date: Sat, 21 Jun 2025 11:35:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add memfd, shmem quota files to shmem
 section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Hugh Dickins <hughd@google.com>
References: <20250617161359.166955-1-lorenzo.stoakes@oracle.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250617161359.166955-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/18 00:13, Lorenzo Stoakes wrote:
> These files seem best suited to shmem.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   MAINTAINERS | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08045f9efadd..eda30a41e5ad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15735,7 +15735,6 @@ F:	Documentation/admin-guide/mm/
>   F:	Documentation/mm/
>   F:	include/linux/gfp.h
>   F:	include/linux/gfp_types.h
> -F:	include/linux/memfd.h
>   F:	include/linux/memory_hotplug.h
>   F:	include/linux/memory-tiers.h
>   F:	include/linux/mempolicy.h
> @@ -25041,8 +25040,11 @@ M:	Hugh Dickins <hughd@google.com>
>   R:	Baolin Wang <baolin.wang@linux.alibaba.com>
>   L:	linux-mm@kvack.org
>   S:	Maintained
> +F:	include/linux/memfd.h
>   F:	include/linux/shmem_fs.h
> +F:	mm/memfd.c
>   F:	mm/shmem.c
> +F:	mm/shmem_quota.c
>   
>   TOMOYO SECURITY MODULE
>   M:	Kentaro Takeda <takedakn@nttdata.co.jp>

