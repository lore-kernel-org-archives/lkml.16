Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CDC226CFD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495749; cv=none; b=rMuRTdnz7QgK3K6/wQaJfpmhshsnLRH8hfl98xQPalVu8EvUCOXAuBDisRECkE0ylDNs3XWbpA+aJuyx4fo5ZvywWszs1ymXyChMZO/qbQcqL4QYnHCBulSGnGWNhV6k4DNw/4DAOjABqXmWLuY0rC6iNd7Z1IMHP6s6Jp9zCFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495749; c=relaxed/simple;
	bh=0jw40mVAtnU+Ji6Iv79ivcYg3S4c4XSusqNKFJkrs3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMT201GO4eimWh/qTBk5IyJT3mzQvy9t5g9X4s3lROYut7u2715K5eAxSFEtOGPZ54qH4OodN4eSnHJbOeegL5/DawGkjplMvb/9o7s3Er4WFZsbtK+an13orPP6iNUn4pB5a+y8zbydlFflhbTXWGSJohjKE0KSWSuDsQS1onE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 506D81063;
	Thu, 24 Apr 2025 04:55:41 -0700 (PDT)
Received: from [10.1.30.200] (XHFQ2J9959.cambridge.arm.com [10.1.30.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD1BF3F59E;
	Thu, 24 Apr 2025 04:55:44 -0700 (PDT)
Message-ID: <797dcdba-6970-4f30-9060-173d322e9b9f@arm.com>
Date: Thu, 24 Apr 2025 12:55:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2025 12:16, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for Transparent Huge
> Page support and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  MAINTAINERS | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4015227645cc..85cd47a28a0a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15563,6 +15563,29 @@ S:	Maintained
>  F:	include/linux/secretmem.h
>  F:	mm/secretmem.c
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
>  MEMORY MANAGEMENT - USERFAULTFD
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  R:	Peter Xu <peterx@redhat.com>

