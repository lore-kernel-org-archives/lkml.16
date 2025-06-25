Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1441F4612
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845942; cv=none; b=coWukQLyygtpqMHBHOUb3PtermgCSO4HQshlHKK1xSAxpVrUlbB3sJiQxVXF8MpYcJjy8T3XpCF7etCbJq2VrxaKTQiLKIUsKjhDEvNksBPLVqtKCeZ06UjQpNjhyr9bWaM2Ah5rfC6zX1sgivkXTehwp85bXZfN3lB1XngR8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845942; c=relaxed/simple;
	bh=rHcXDMORzi9ySLjCAFmcCgO62FhtY0Y4qCEwxCwVjZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvXeJt1jjBq2MmlAH+UG7h9QOMErcAJmh67Try3urkwDJ9xxAYR3ZAf/jUazLi5ujGLqfVcmheRIoLd6QT8JJb4EYx+FhD57Rbvy95Uj62yrAjlRrsf/ICnG8afqRt//e8Sza/X7GVjRlIixT80OWJKoj7q2kS0We4mxoDT5npc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Eu8k0aZN; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Eu8k0aZN"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750845934; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=H0JonyXpzOqWlle3ErNWkPnEUQnUnfWFaYTN0l2CrLg=;
	b=Eu8k0aZNKXYkB9TEZSyJEE9/9HUkPRxy5/zZrM7fd97QndqihB2LgY4h5iP742DxVc7w8al0634wu1rhw4/xtmHljU539u6q1xamlbQBkL6VCiGh6ZNVqUogRxhfmM742zZwWCBPSCnO600Le1NGvWbJi3rJR2LBVnDe2V/n7d8=
Received: from 30.74.144.110(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WewhP5l_1750845932 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 18:05:34 +0800
Message-ID: <dba5a7c2-1a7a-4b40-8a05-1dbba467065e@linux.alibaba.com>
Date: Wed, 25 Jun 2025 18:05:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as THP co-maintainer
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lorenzo,

On 2025/6/25 17:52, Lorenzo Stoakes wrote:
> I am doing a great deal of review and getting ever more involved in THP
> with intent to do more so in future also, so add myself as co-maintainer to
> help David with workload.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

I appreciate your help and great work.

Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b9a4fa905e1..a8a963e530a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15945,9 +15945,9 @@ F:	mm/swapfile.c
>   MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>   M:	Andrew Morton <akpm@linux-foundation.org>
>   M:	David Hildenbrand <david@redhat.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>   R:	Zi Yan <ziy@nvidia.com>
>   R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> -R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>   R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>   R:	Nico Pache <npache@redhat.com>
>   R:	Ryan Roberts <ryan.roberts@arm.com>
> --
> 2.50.0

