Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF3E27A929
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716201; cv=none; b=BsQIjWAhuB9iKbyxQUMzs375y1nRl+dinry9KQ0h2P66uAMcs6uRDRfNz8wYpzseDQ8UYjH67zHapRXbBOjDqKvu7yg7t8TSmApB+4CeNS0gJ/FoVdYIiu1h2rqCV/9da+uThE6iIfO8k6IpmaFThY5ghpCvHu7YTb+mFhgJsY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716201; c=relaxed/simple;
	bh=0izrL55S9QPINgj0wFeSasAYR9hX8ZBsbH7dO0ZONrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=od5kcmJ/gJMvBoRbnvrVmhbw8ltlYM7OGoPpIuuhRt1vmPdHkd/+Ypym+GFvgdzwzYvD5vMeoP/ax2f//2y+yZ/0WiYpdQKcqQ++k+Ezm5KBLIe4+rk1mLPtxoVy7uAhgL04D26b4OgWbmFQNvO+HxZ2bLGLx4NabX6mzagfqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bGwg4a9e; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bGwg4a9e"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250508145631euoutp0247b95feabf1c0b5fc9f1f2fb54abffa2~9lR8luCCu0456004560euoutp02k
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:56:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250508145631euoutp0247b95feabf1c0b5fc9f1f2fb54abffa2~9lR8luCCu0456004560euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746716191;
	bh=PjestXYG3tptWSJQojrY2AhtO+uHpbAKRX3M3V7CCuQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bGwg4a9eaRlplHmFJW3vuGMhMU9CmikUpiunhwJWn6wXviqtOZS9dzNlzhqXX/OzY
	 yLpeaV7Mfa4tlOiMYRey0hNlpMK9kjZftZo2z4we070O9JETYK9qTl3RXJDaRaGlSQ
	 N9GDiUnNN5feVZ+TvLc0YgI2jrkouZP8HxuMmijg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250508145631eucas1p2f5369234fee8eb86761d70d028d6c82d~9lR8cajPR1350513505eucas1p2e;
	Thu,  8 May 2025 14:56:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250508145630eusmtip1f6b3ad9a6e834aef86a7b9048d0fd9c8~9lR789yWH0332503325eusmtip1o;
	Thu,  8 May 2025 14:56:30 +0000 (GMT)
Message-ID: <45b7034e-67f4-4f8b-bef3-5350f6419e79@samsung.com>
Date: Thu, 8 May 2025 16:56:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 09/45] genirq/cpuhotplug: Convert to lock guards
To: Thomas Gleixner <tglx@linutronix.de>, LKML
	<linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250429065420.560083665@linutronix.de>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250508145631eucas1p2f5369234fee8eb86761d70d028d6c82d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250508145631eucas1p2f5369234fee8eb86761d70d028d6c82d
X-EPHeader: CA
X-CMS-RootMailID: 20250508145631eucas1p2f5369234fee8eb86761d70d028d6c82d
References: <20250429065337.117370076@linutronix.de>
	<20250429065420.560083665@linutronix.de>
	<CGME20250508145631eucas1p2f5369234fee8eb86761d70d028d6c82d@eucas1p2.samsung.com>

Hi Thomas,

On 29.04.2025 08:55, Thomas Gleixner wrote:
> Convert all lock/unlock pairs to guards and tidy up the code.
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> ---
>   kernel/irq/cpuhotplug.c |   10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> --- a/kernel/irq/cpuhotplug.c
> +++ b/kernel/irq/cpuhotplug.c
> @@ -177,9 +177,8 @@ void irq_migrate_all_off_this_cpu(void)
>   		bool affinity_broken;
>   
>   		desc = irq_to_desc(irq);
> -		raw_spin_lock(&desc->lock);
> -		affinity_broken = migrate_one_irq(desc);
> -		raw_spin_unlock(&desc->lock);
> +		scoped_guard(raw_spinlock, &desc->lock)
> +			affinity_broken = migrate_one_irq(desc);
>   
>   		if (affinity_broken) {
>   			pr_debug_ratelimited("IRQ %u: no longer affine to CPU%u\n",
> @@ -244,9 +243,8 @@ int irq_affinity_online_cpu(unsigned int
>   	irq_lock_sparse();
>   	for_each_active_irq(irq) {
>   		desc = irq_to_desc(irq);
> -		raw_spin_lock_irq(&desc->lock);
> -		irq_restore_affinity_of_irq(desc, cpu);
> -		raw_spin_unlock_irq(&desc->lock);
> +		scoped_guard(raw_spinlock, &desc->lock)

The above should be "scoped_guard(raw_spinlock_irq, &desc->lock)", otherwise the cpu hotplug is broken as in today's linux-next.


> +			irq_restore_affinity_of_irq(desc, cpu);
>   	}
>   	irq_unlock_sparse();
>   
>
>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

