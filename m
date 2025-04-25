Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D4722B8B1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564022; cv=none; b=PUorwebHSfvyAnvKfcOibOUgFPTCGlHbiSqSEqa3MXaGPZoyTQz3XpL1UjysGGp3fzG9eQ2dYFfQt4ZMnmcV+iamHb6Cj45EAR4U8O/fiTWn0QZbgY/rDzGxJTzmXOWoEIDFz3Gfo57qLrIFpEFPjWx4kLy6kGzswV/NElBtW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564022; c=relaxed/simple;
	bh=OywGJRujw/6YnhZAVEYicp44Xz3WfN6HWPNOO0gvg98=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ep8BAO/Qb9G2XdG1iI2YnOiezOvpmyfgEoc6NUlzOkqGYcCnSGdXey7ebTviD1PB71PNyA51Oyr5vuLWWSFjbOT/2/lZsJ7oiJTlsP0AQmi5+nuDJI7H6BcHozr94eHeYopdkc4/nsMXU5ze5Qr8iV3ljQRkbksl0sOHA7b8jTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=FpW+OK78; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="FpW+OK78"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745564008; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=EzgETpgps6czIuGixpdUC16Vm6qBdp3NyDfAu91NC+Q=;
	b=FpW+OK78Hn28rRLPvNZPYXz061rniNZCiJON/JycfYalb5f8WeBPu62QLDRjQAilnyvUvp/F81wy5jYD1mbKqd5a6SZEqogMDScCK28KP8gdFCdaIbPbY3ynpSuttmXVOSUoByylMgQeNcogjWB1AcfEY5aVOu5kdkeUCH4TEFA=
Received: from 30.74.144.113(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WY0OIV6_1745564007 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 25 Apr 2025 14:53:28 +0800
Message-ID: <8905cbf7-7507-44de-8721-b3e75e80732b@linux.alibaba.com>
Date: Fri, 25 Apr 2025 14:53:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/compaction: do not break pages whose order is larger
 than target order
To: Wenchao Hao <haowenchao22@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250424153815.4003-1-haowenchao22@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250424153815.4003-1-haowenchao22@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/24 23:38, Wenchao Hao wrote:
> When scanning free pages for memory compaction, if the compaction target
> order is explicitly specified, do not split pages in buddy whose order
> are larger than compaction target order.

We've already checked this in suitable_migration_target(), so how did 
you observe that there are still attempts to isolate such non-suitable 
free large folios? Please explain your usecase in detail.

> Signed-off-by: Wenchao Hao <haowenchao22@gmail.com>
> ---
>   mm/compaction.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 3925cb61dbb8..b0ed0831c400 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -656,6 +656,17 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
>   
>   		/* Found a free page, will break it into order-0 pages */
>   		order = buddy_order(page);
> +
> +		/*
> +		 * Do not break free pages whose order is larger than
> +		 * compact's desired order
> +		 */
> +		if (cc->order != -1 && order >= cc->order) {
> +			blockpfn += (1 << order) - 1;
> +			page += (1 << order) - 1;
> +			goto isolate_fail;
> +		}
> +
>   		isolated = __isolate_free_page(page, order);
>   		if (!isolated)
>   			break;
