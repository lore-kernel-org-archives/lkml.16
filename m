Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDF925522B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467487; cv=none; b=ty4Ml5tu9Q7jxyOBcg13pBMwgayCLq+pAfFP9G2hEJtoJ5hYNtupLjumYv9UtcWwXtCnW5Va4YkVtr8pSHteHbmRUTubRMIamg4MCaxkSUAVsLPv/Z4cVYjilecs/SUza0r6uZibmOZ8XklWKjHLq0+nDi7TsCQKtB3oDax88xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467487; c=relaxed/simple;
	bh=bM8Q6YsWlFLyI88UUUxUm6EXpeqldPbasadtcl7jkVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENltdMT0gupK6vcW/sKyhzdCM6tyrgu2r9wqWK1CCkqqdb/wwmw3NPTKeuPQwm0Iv+YlTfLBTc+H1R2WXqy02CnUW90mM5Xbeti0nZpNyJYX+UTavKt3a8q9HMc6OT7G21BnDRZm31a8fHl1TQXAgFaajUb5OsnBNqQ2Yvz3J7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F77113E;
	Mon,  9 Jun 2025 04:11:06 -0700 (PDT)
Received: from [10.1.39.162] (XHFQ2J9959.cambridge.arm.com [10.1.39.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D13663F59E;
	Mon,  9 Jun 2025 04:11:23 -0700 (PDT)
Message-ID: <1c97e1b0-4981-4f3e-bfe4-870a61b859e9@arm.com>
Date: Mon, 9 Jun 2025 12:11:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
Content-Language: en-GB
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Dev Jain <dev.jain@arm.com>
References: <20250609002442.1856-1-21cnbao@gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250609002442.1856-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/06/2025 01:24, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> I have been actively contributing to mTHP and reviewing related patches
> for an extended period, and I would like to continue supporting patch
> reviews.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Barry Song <baohua@kernel.org>

Very much welcome this!

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 99dcf9036b9d..c6770ebe2927 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15845,6 +15845,7 @@ R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>  R:	Nico Pache <npache@redhat.com>
>  R:	Ryan Roberts <ryan.roberts@arm.com>
>  R:	Dev Jain <dev.jain@arm.com>
> +R:	Barry Song <baohua@kernel.org>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org

