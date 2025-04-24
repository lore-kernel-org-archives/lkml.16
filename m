Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF91F4E39
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497419; cv=none; b=ggZo6he8Ftwvkcv7dmNFum875hrs6k8YD+HDjYUENgeKwMACrWd73MjnYM8w4LMZbZoZzzv+RGajVtk3SQ1y5PiQ9yedII7nJ5a230Uao+QpFSDTDafF7rcUZvVTZJKxYxgY9iyjh1zT5XWKgc9fq16XFY6IPptz4xMMa11jKyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497419; c=relaxed/simple;
	bh=mXZOHEUBupZHktCPTVKd8yB6QTUCIvtbcbVx6DCjiDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyLdz8Sd4dfrEB8NyMGq8dui25FUoVKitQagB8tufyUoPzL7BujZKGdeZPYLmy/pYdrYwoCx5yXWSL2yyxqXUfRhuAtQxilMoCUmZNqtQPoGmvueW6nDmwuTMTRG9yyrtgvCUfk+KvB9pv/vHZ3VatszqIo7xANZPH3a3+FrG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Wi2J5lgm; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Wi2J5lgm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745497413; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=zpub1jmjoji2uYCdEiNcOjtnZyPJVo9jnaF8plubUf4=;
	b=Wi2J5lgm4BTfVzU8QGKLb9j6tvL2ww1PXJqrCIVbWALePmn0SIrHR5ZUa6TfKpZfWjeSHxgZRI86GBejNP8Hp1+3fPEx6jJDb5oRhdvZfrcU8QwsGFLclECbNfEznCL3n6QJDV+8HO1dN4/fgE7Hgl4pqiJBQdQjSQdR2l+/HPo=
Received: from 192.168.1.7(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WXzOCae_1745497412 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Apr 2025 20:23:32 +0800
Message-ID: <e5b17a65-fa66-4fc8-9acd-d58800b48a1c@linux.alibaba.com>
Date: Thu, 24 Apr 2025 20:23:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/24 19:16, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for Transparent Huge
> Page support and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   MAINTAINERS | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4015227645cc..85cd47a28a0a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15563,6 +15563,29 @@ S:	Maintained
>   F:	include/linux/secretmem.h
>   F:	mm/secretmem.c
>   
> +MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Nico Pache <npache@redhat.com>
> +R:	Ryan Roberts <ryan.roberts@arm.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/admin-guide/mm/transhuge.rst
> +F:	include/linux/huge_mm.h
> +F:	include/linux/khugepaged.h
> +F:	include/trace/events/huge_memory.h
> +F:	mm/huge_memory.c
> +F:	mm/khugepaged.c
> +F:	tools/testing/selftests/mm/khugepaged.c
> +F:	tools/testing/selftests/mm/split_huge_page_test.c
> +F:	tools/testing/selftests/mm/transhuge-stress.c
> +
>   MEMORY MANAGEMENT - USERFAULTFD
>   M:	Andrew Morton <akpm@linux-foundation.org>
>   R:	Peter Xu <peterx@redhat.com>
