Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB571DEFDD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751429587; cv=none; b=XQiKgz1S6uwFxbLo7v7xXQzv4Yiw3LtnGIhDmslHHA7xEWAqIIQZQs/th32DBSsiyP8rMNsOkdTgWx6/R5zU22DSOVrny15zf1eUBKiBAMUXS8GGhReFJQfu3qF3jYe3TJRJrMBKeWz8MrOVWZqNDMvjXCbOZ9afgblNY1us82c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751429587; c=relaxed/simple;
	bh=xsMI5q7BO2aP1C2oETOvSm6pGPV9xxNQ5Dt1IrfGaIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKV0D6W2lxterSPbVQT7DgzspTg+bwPfKG+RKYObPowKk+cY4kY0ej6o5iCYw2AGpKXta9XwmpsBV4L7dLAQDWHrh2rc2yERcO/I82loEgnRIknKzWPGfpFjyiOJwtXz8NocWBZIMN148qIiTYSX7en4FBiM/xx+itpYG8L+iu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEF371595;
	Tue,  1 Jul 2025 21:12:48 -0700 (PDT)
Received: from [10.163.88.114] (unknown [10.163.88.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E0F13F58B;
	Tue,  1 Jul 2025 21:13:02 -0700 (PDT)
Message-ID: <8d4aeea1-fff4-4e3a-a83f-67c429afa653@arm.com>
Date: Wed, 2 Jul 2025 09:42:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/cma: Use str_plural() in
 cma_declare_contiguous_multi()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250630132318.41339-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250630132318.41339-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/25 6:53 PM, Thorsten Blum wrote:
> Use the string choice helper function str_plural() to simplify the code
> and to fix the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
> 
>   opportunity for str_plural(nr)
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  mm/cma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index c0b2630a1b81..c40d53298801 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -22,6 +22,7 @@
>  #include <linux/mm.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/log2.h>
>  #include <linux/cma.h>
>  #include <linux/highmem.h>
> @@ -548,8 +549,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
>  			(unsigned long)total_size / SZ_1M);
>  	else
>  		pr_info("Reserved %lu MiB in %d range%s\n",
> -			(unsigned long)total_size / SZ_1M, nr,
> -			nr > 1 ? "s" : "");
> +			(unsigned long)total_size / SZ_1M, nr, str_plural(nr));
>  	return ret;
>  }
>


Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
