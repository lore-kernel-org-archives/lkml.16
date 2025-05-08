Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5424B1E72
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737801; cv=none; b=h3Z6XOWQEb1pYR9mj9B3RJqLBoh5G8KgWuWuZOUnHje8C3zHcRlmU0HpZs2i/aQUU35D+6Zy6W21vqoy38Ve2xcQhWDc2iyR8TnzVDMsU4iMtTQ4rk53so0J3JAHZBxlg0fOcFI3NE0e3T/dYL9YzQYgMGbF5/AlKJnszpyDmYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737801; c=relaxed/simple;
	bh=AspQiYiDfD9oPuNJINvY3TsqDGMNk+pxms9QsqXwRQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=OuyMEmyXeDmdeQ767PnRSjNWFF1TB5AgbKZ3UR5/spBm3bFGO+beNjqPhNiiCSay+23iQQSzWd23tVdb4RpQWYZI5Hs+pUXxiA1GyzQ47axINWoBd37v7riDzg0dTcEcE5ObIIPJr8wBuWeNYOy8MJy3o9VtUkuVo7NWUjtzfvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sI36F/X4; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sI36F/X4"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250508205630euoutp01397d95507e55ab2e0524d946256d9b33~9qMQUvPG60842108421euoutp01N
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:56:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250508205630euoutp01397d95507e55ab2e0524d946256d9b33~9qMQUvPG60842108421euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746737790;
	bh=/ocaXfewUhHMkzZHKFfw8gEw3TvUb5hIlSMokuCUJPo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sI36F/X4m9VGfkD/OfRgx4ZoJl9p1Dd1r+VmcdJubgz4miUiyeJLxyFh0AmZs5Ms9
	 pAVUGaEOjJRWqmY6fqnnGpDa8txxZZ5ByPxKLcUpBqZ53YYW3qgwW6l+hsu9mEm45G
	 MsdbeIq4sWVwPQ7r2QPOP5hcSnN5mlYjZZXYF9Gk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250508205629eucas1p2f8f2032c2d651be176acdf6ac4aa79cd~9qMPS9hOv3080530805eucas1p2x;
	Thu,  8 May 2025 20:56:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250508205629eusmtip1b07b46c53638fe17ab83567bb05ffdc7~9qMPD5MZ10665906659eusmtip1t;
	Thu,  8 May 2025 20:56:29 +0000 (GMT)
Message-ID: <46ed4040-ca11-4157-8bd7-13c04c113734@samsung.com>
Date: Thu, 8 May 2025 22:56:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 12/45] genirq/chip: Rework handle_nested_irq()
To: Thomas Gleixner <tglx@linutronix.de>, LKML
	<linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250429065420.744042890@linutronix.de>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250508205629eucas1p2f8f2032c2d651be176acdf6ac4aa79cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250508205629eucas1p2f8f2032c2d651be176acdf6ac4aa79cd
X-EPHeader: CA
X-CMS-RootMailID: 20250508205629eucas1p2f8f2032c2d651be176acdf6ac4aa79cd
References: <20250429065337.117370076@linutronix.de>
	<20250429065420.744042890@linutronix.de>
	<CGME20250508205629eucas1p2f8f2032c2d651be176acdf6ac4aa79cd@eucas1p2.samsung.com>

On 29.04.2025 08:55, Thomas Gleixner wrote:
> Use the new helpers to decide whether the interrupt should be handled and
> switch the descriptor locking to guard().
>
> Fixup the kernel doc comment while at it.
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> ---
>   kernel/irq/chip.c |   78 ++++++++++++++++++++++++------------------------------
>   1 file changed, 36 insertions(+), 42 deletions(-)
>
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -450,48 +450,6 @@ void unmask_threaded_irq(struct irq_desc
>   	unmask_irq(desc);
>   }
>   
> -/*
> - *	handle_nested_irq - Handle a nested irq from a irq thread
> - *	@irq:	the interrupt number
> - *
> - *	Handle interrupts which are nested into a threaded interrupt
> - *	handler. The handler function is called inside the calling
> - *	threads context.
> - */
> -void handle_nested_irq(unsigned int irq)
> -{
> -	struct irq_desc *desc = irq_to_desc(irq);
> -	struct irqaction *action;
> -	irqreturn_t action_ret;
> -
> -	might_sleep();
> -
> -	raw_spin_lock_irq(&desc->lock);
> -
> -	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
> -
> -	action = desc->action;
> -	if (unlikely(!action || irqd_irq_disabled(&desc->irq_data))) {
> -		desc->istate |= IRQS_PENDING;
> -		raw_spin_unlock_irq(&desc->lock);
> -		return;
> -	}
> -
> -	kstat_incr_irqs_this_cpu(desc);
> -	atomic_inc(&desc->threads_active);
> -	raw_spin_unlock_irq(&desc->lock);
> -
> -	action_ret = IRQ_NONE;
> -	for_each_action_of_desc(desc, action)
> -		action_ret |= action->thread_fn(action->irq, action->dev_id);
> -
> -	if (!irq_settings_no_debug(desc))
> -		note_interrupt(desc, action_ret);
> -
> -	wake_threads_waitq(desc);
> -}
> -EXPORT_SYMBOL_GPL(handle_nested_irq);
> -
>   static bool irq_check_poll(struct irq_desc *desc)
>   {
>   	if (!(desc->istate & IRQS_POLL_INPROGRESS))
> @@ -544,6 +502,42 @@ static inline bool irq_can_handle(struct
>   }
>   
>   /**
> + * handle_nested_irq - Handle a nested irq from a irq thread
> + * @irq:	the interrupt number
> + *
> + * Handle interrupts which are nested into a threaded interrupt
> + * handler. The handler function is called inside the calling threads
> + * context.
> + */
> +void handle_nested_irq(unsigned int irq)
> +{
> +	struct irq_desc *desc = irq_to_desc(irq);
> +	struct irqaction *action;
> +	irqreturn_t action_ret;
> +
> +	might_sleep();
> +
> +	scoped_guard(raw_spinlock_irq, &desc->lock) {
> +		if (irq_can_handle_actions(desc))

This should be "if (!irq_can_handle_actions(desc))" to fix nested irqs handling in today's linux-next.


> +			return;
> +
> +		action = desc->action;
> +		kstat_incr_irqs_this_cpu(desc);
> +		atomic_inc(&desc->threads_active);
> +	}
> +
> +	action_ret = IRQ_NONE;
> +	for_each_action_of_desc(desc, action)
> +		action_ret |= action->thread_fn(action->irq, action->dev_id);
> +
> +	if (!irq_settings_no_debug(desc))
> +		note_interrupt(desc, action_ret);
> +
> +	wake_threads_waitq(desc);
> +}
> +EXPORT_SYMBOL_GPL(handle_nested_irq);
> +
> +/**
>    *	handle_simple_irq - Simple and software-decoded IRQs.
>    *	@desc:	the interrupt description structure for this irq
>    *
>
>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

