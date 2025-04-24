Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE15221FDE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494111; cv=none; b=JYcRKNWCAsiLcNup64GS0NReFzpOrPArtuQ55ER0Snef73Xdt3DHLkF3gl6P6wa0iFVjQYfKfvZ3UqsmQtfKRCEUitSEuQMchfPxliQXkb56GMK6oxVw+Ycw1h96HpUDiMK8GdAlsJ5QW2RVfpQ8ca3KbW959qr6kb8KPqt9PFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494111; c=relaxed/simple;
	bh=wrr6iKvTJh4nKQN21VKqRjWOK2sb/czCDBemrxckoUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifsLUklMnbt/CRojuk6DQ+ZLP+GJILIJtkVZuhraoBZrvlQU1c+IY6u7gq1jgOaYmvZZ0tkKzukSKS/d40F1RZPX/vd+VWULhEpy+uJU3x6eqY79BMR5ISismBHy7/U/gIZniauPQuf16EPvlIP/KF5I8+JC1t0hoZhlbYbpHgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E5FC1063;
	Thu, 24 Apr 2025 04:28:23 -0700 (PDT)
Received: from [10.163.78.97] (unknown [10.163.78.97])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CE1C3F59E;
	Thu, 24 Apr 2025 04:28:24 -0700 (PDT)
Message-ID: <45a10934-f8af-49c5-8d8f-dbd97193158d@arm.com>
Date: Thu, 24 Apr 2025 16:58:20 +0530
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
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/04/25 4:46 pm, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for Transparent Huge
> Page support and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

If you don't mind, I'd also like to be added as reviewer, I am primarily
active in THP stuff : )

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

