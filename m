Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E0012B73
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745807848; cv=none; b=YLq2SaWqyR9zV/yIBtbhQP7rySmmRN1yDHNprnX7lAccbSpQauSVki7T8+x8T7+duv1q/mdHp/nIWcs5XH6UZwTMYIiXsWJV12ymZL4rhpo4vA1MZLCmVID87zh2EQ/RpUtxJXfDu7YijfYmwTVgWvAF3qnJf1VMokL902Cmw2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745807848; c=relaxed/simple;
	bh=6fvWMDIO0ZG9p86UfrPxBOfFczCpDrYJmP96sdk8FKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StNvj6cuL88+OQs1yV/XRkNH4+8VkPauSlhEPOoH4t+NQQKvWcR0yCs3Xl/25AJ4GzrvjV7pZNqdVWcZBQ/0gzlRKo4k7TBy/jn8cilYKL2JoNOk1z4PVrZ/0vpl0uiWCp4Ra6U0Hp+TGC9gsRr4Mv+Ur+fRAHxXA2iHP4ZXJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=grEP+UQB; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="grEP+UQB"
Message-ID: <2cd68d9e-bfa8-4b45-a153-c836a0ab7ac8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745807843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dddlu8SlfIbvlkyJoQntWYQp8R9CcBSBlvP38HYBRd0=;
	b=grEP+UQBuWPzjLqzv+lXMqzNtOlHqf3gMr2Z9k42SfvuwSXn3CZCOD0Ihpa7TQZndM997x
	mr4bLruAXCSJTFA5UF713UD1e+9BE29bKQa+kKzDwFyh0EdR8dpjgzxuz4hQ89jHY0573R
	lp7batGkhPoySZqRMSYQHVo7ZuPZtrQ=
Date: Sun, 27 Apr 2025 19:37:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ARC: unwind: Use built-in sort swap to reduce code size
 and improve performance
To: Yu-Chun Lin <eleanor15x@gmail.com>, vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, visitorckw@gmail.com
References: <20250409171116.550665-1-eleanor15x@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20250409171116.550665-1-eleanor15x@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/9/25 10:11, Yu-Chun Lin wrote:
> The custom swap function used in sort() was identical to the default
> built-in sort swap. Remove the custom swap function and passes NULL to
> sort(), allowing it to use the default swap function.
>
> This change reduces code size and improves performance, particularly when
> CONFIG_MITIGATION_RETPOLINE is enabled. With RETPOLINE mitigation, indirect
> function calls incur significant overhead, and using the default swap
> function avoids this cost.
>
> $ ./scripts/bloat-o-meter ./unwind.o.old ./unwind.o.new
> add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-22 (-22)
> Function                                     old     new   delta
> init_unwind_hdr.constprop                    544     540      -4
> swap_eh_frame_hdr_table_entries               18       -     -18
> Total: Before=4410, After=4388, chg -0.50%
>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Added to for-curr.

Thx,
-Vineet

> ---
> Compile test only
>
>  arch/arc/kernel/unwind.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> index d8969dab12d4..789cfb9ea14e 100644
> --- a/arch/arc/kernel/unwind.c
> +++ b/arch/arc/kernel/unwind.c
> @@ -241,15 +241,6 @@ static int cmp_eh_frame_hdr_table_entries(const void *p1, const void *p2)
>  	return (e1->start > e2->start) - (e1->start < e2->start);
>  }
>  
> -static void swap_eh_frame_hdr_table_entries(void *p1, void *p2, int size)
> -{
> -	struct eh_frame_hdr_table_entry *e1 = p1;
> -	struct eh_frame_hdr_table_entry *e2 = p2;
> -
> -	swap(e1->start, e2->start);
> -	swap(e1->fde, e2->fde);
> -}
> -
>  static void init_unwind_hdr(struct unwind_table *table,
>  			    void *(*alloc) (unsigned long))
>  {
> @@ -345,7 +336,7 @@ static void init_unwind_hdr(struct unwind_table *table,
>  	sort(header->table,
>  	     n,
>  	     sizeof(*header->table),
> -	     cmp_eh_frame_hdr_table_entries, swap_eh_frame_hdr_table_entries);
> +	     cmp_eh_frame_hdr_table_entries, NULL);
>  
>  	table->hdrsz = hdrSize;
>  	smp_wmb();

