Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0CD38385
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738912204; cv=none; b=QO4GpA2k6PAnB63ZtVFwRA1DI3ayYkYFQODRGvCZW8Acj8tJgh3ApZrx/32yZ83dxOp1HF8z4M+nCVyuhfvn8Z/VnfR/4/HNSyjLcAHuV7zvzmIFoUVcS0AbSu3oBjFvIwULIdIOmiZ2Ng7/kVSThSryjzyeRzwn9L4qeCaJOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738912204; c=relaxed/simple;
	bh=AS7AdIFs6SprWXcbV6EN43xa4zMu++EGCkGI67Tx9TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kw8pYcUd0NGgj1hUVKLEaCLoxImCteu1S2KW47neP0+dsJM0CzzM3Q4Cc7PUXw6J46P5K1oza/si+P/184z2xBnF7kldyT3YZ+KIg4YUYriD+nzZFXD97zsun1I76w0eNA0HiLCod+TT8cRPeq2BMbaiNXDOkEBcEOjtrvyFjWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93588FEC;
	Thu,  6 Feb 2025 23:10:23 -0800 (PST)
Received: from [10.162.43.18] (K4MQJ0H1H2.blr.arm.com [10.162.43.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9E983F5A1;
	Thu,  6 Feb 2025 23:09:57 -0800 (PST)
Message-ID: <10610b21-45a7-4ada-b421-f4d378877450@arm.com>
Date: Fri, 7 Feb 2025 12:39:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/mlock: Fix WARN_ON_ONCE condition.
To: Liu Ye <liuye@kylinos.cn>, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250207060448.146606-1-liuye@kylinos.cn>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250207060448.146606-1-liuye@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/02/25 11:34 am, Liu Ye wrote:
> The condition in WARN_ON_ONCE(cpu_online(cpu)) should be !cpu_online(cpu)
> to ensure the warning is triggered when the CPU is offline.
> 
> Signed-off-by: Liu Ye <liuye@kylinos.cn>
> ---
>   mm/mlock.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mlock.c b/mm/mlock.c
> index cde076fa7d5e..40acf7897917 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -224,7 +224,7 @@ void mlock_drain_remote(int cpu)
>   {
>   	struct folio_batch *fbatch;
>   
> -	WARN_ON_ONCE(cpu_online(cpu));
> +	WARN_ON_ONCE(!cpu_online(cpu));
>   	fbatch = &per_cpu(mlock_fbatch.fbatch, cpu);
>   	if (folio_batch_count(fbatch))
>   		mlock_folio_batch(fbatch);


No idea about this code path but mlock_drain_remote() is called by 
page_alloc_cpu_dead() which expects an offlined CPU according to the 
comments.
