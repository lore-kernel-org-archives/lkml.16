Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6D1205E00
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882523; cv=none; b=JHO83QZZk8TI0fwtRbHLn7J9MTT9iisIYN2cPLxxCwCpqpdamaF79iUGjRexSmg66f+tau2fSl9OMdimdMqhTauLrjfeoqpxe0ZyU24DDY3mKu5GCJlHcnVW306lJfp9v7xF8mk3NtZpxBu6rWP/Hh0mMtzfQPGD/RxOnZFoKqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882523; c=relaxed/simple;
	bh=nNHU0usZowE7TIaRkDpQKntsUv2BaRTkYdjYYLPNsmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoAW6w9aU3ZGTsNxmbeB/HZ7UlnNjKYEnS9wfCt+reVC0h/ji5jYO0jwpqHtl5crqxXWqJLN6V4eQtnaVAFlZcLNnqGiLeW1X3BvlZzNGojXvlg6ucOtbwWgTT0unavUXJf9TjMRok+ilczP9seh30hivXMM3C/QNsQffkyv0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAFA41516;
	Thu, 17 Apr 2025 02:35:17 -0700 (PDT)
Received: from [10.163.75.58] (unknown [10.163.75.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25A5E3F59E;
	Thu, 17 Apr 2025 02:35:17 -0700 (PDT)
Message-ID: <c655ec08-1adc-4c50-878a-bdc6445875b7@arm.com>
Date: Thu, 17 Apr 2025 15:05:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmscan: Modify the assignment logic of the scan and
 total_scan variables
To: Hao Ge <hao.ge@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Hao Ge <gehao@kylinos.cn>
References: <20250417092422.1333620-1-hao.ge@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250417092422.1333620-1-hao.ge@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/04/25 2:54 pm, Hao Ge wrote:
> From: Hao Ge <gehao@kylinos.cn>
> 
> The scan and total_scan variables can be initialized to 0
> when they are defined, replacing the separate assignment statements.
> 
> Signed-off-by: Hao Ge <gehao@kylinos.cn>

Acked-by: Dev Jain <dev.jain@arm.com>

> ---
>   mm/vmscan.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index b620d74b0f66..bf360ac4f1cf 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1725,13 +1725,11 @@ static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
>   	unsigned long nr_taken = 0;
>   	unsigned long nr_zone_taken[MAX_NR_ZONES] = { 0 };
>   	unsigned long nr_skipped[MAX_NR_ZONES] = { 0, };
> -	unsigned long skipped = 0;
> -	unsigned long scan, total_scan, nr_pages;
> +	unsigned long skipped = 0, total_scan = 0, scan = 0;
> +	unsigned long nr_pages;
>   	unsigned long max_nr_skipped = 0;
>   	LIST_HEAD(folios_skipped);
>   
> -	total_scan = 0;
> -	scan = 0;
>   	while (scan < nr_to_scan && !list_empty(src)) {
>   		struct list_head *move_to = src;
>   		struct folio *folio;

