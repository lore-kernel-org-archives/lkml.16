Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8C0155342
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623968; cv=none; b=s02P5JIHkjXYZoYs7qNz4/kcrtnMu1hdZNK0mDZwEyr10OQQDVOqm1orctGoOtCeD75nglJdSK+YTY5TqicGWC++478OxezIja/zYzz31+ZmlllP7jMru552zqJnDi4uk+RU9y3kaXTOmtFrYJk2fjcXjvsAzK6kjgC1kVji1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623968; c=relaxed/simple;
	bh=ZCkQ5jc8nN5gOnGk1wsB5aHmx2mdqZc8/qiHmzxXw3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tgMqBLjRBiMxn51Q7AaPdJari9D9nKRIsljG7y2HWh+oX6FGmvRiyo9obEZkm29AMqMJL4uZxtP2ryCSbkR53QepE6HEagiwEKY8EY9fOSjQHdFRVR/8ageFKC9xOu9X3zmKuLkp1Jco0rjogNjWxpqpt1zVwRKjCXl7fmmBsj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ct65xo4w; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3QV3MXQF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ct65xo4w";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3QV3MXQF"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749623964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aypoXTLE+TevtBzBXpYmLZ0LfIQbeXZh5v8vktdHqDs=;
	b=Ct65xo4w73nouLwyOmJTKVYTwcCioaFsyjLIZSxj4voV+iHl/9jCIhzYV/CbmjMiilzjuh
	6Rcbmi7A1wyhs5rpvTOp2XKJbIpGH+O6iKKytHQEHt2E5feidqztGGpbyUalaMUyIcQMVg
	qqYbAJOHorQr3wvC5ql6NXSPpL9VxP318hGEc/hTQLJ7FkOtF91USHfJ9yv7crtAMT8B2w
	LBDYSEvFsI3j17JD2xmZ2jqyB6e0PJBKDWEEXSdNDMB8+Tj6qJc20LBYSbqrgORGij0xDm
	pDSuZl/HII6eXviVnsIW92K25HKFQZyVFWlIqbSbAVDBXTm41dm/e+A5Kk5+Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749623964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aypoXTLE+TevtBzBXpYmLZ0LfIQbeXZh5v8vktdHqDs=;
	b=3QV3MXQFOGAthxz2Qbrd7b5RhgSeZZr06miVFE9YtXFv+lAINU4dMWi6WmATPm2BSyqFX6
	V77Tfnb8DOZKhHAQ==
To: Gyeyoung Baek <gye976@gmail.com>
Cc: linux-kernel@vger.kernel.org, Gyeyoung Baek <gye976@gmail.com>
Subject: Re: [PATCH] irq: Fix uninitialized pointers
In-Reply-To: <20250527093530.958801-1-gye976@gmail.com>
References: <20250527093530.958801-1-gye976@gmail.com>
Date: Wed, 11 Jun 2025 08:39:23 +0200
Message-ID: <87tt4mok84.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 27 2025 at 18:35, Gyeyoung Baek wrote:

The subject line prefix is wrong. See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

> Fix uninitialized `ops` member's pointers to avoid kernel Oops in

You cannot fix an uninitialized pointer. You only can initialize it
properly.

> `irq_sim_request_resources()`.

No backticks required. fun() is clear on it's own.

Also please describe how this ends up with an oops in
irq_sim_request_resources(). The point is that any dereference of an
uninitialized pointer is resulting in a problem and it does not matter
where.

Dereferencing an uninitialized pointer can cause an Ooops or worse it
can call into some random code when the uninitialized memory contained a
valid pointer, which is way harder to debug than a plain crash.

> index 1a3d483548e2..67fd1de5d197 100644
> --- a/kernel/irq/irq_sim.c
> +++ b/kernel/irq/irq_sim.c
> @@ -222,8 +222,12 @@ struct irq_domain *irq_domain_create_sim_full(struct fwnode_handle *fwnode,
>  	work_ctx->pending = no_free_ptr(pending);
>  	work_ctx->user_data = data;
>  
> -	if (ops)
> +	if (ops) {
>  		memcpy(&work_ctx->ops, ops, sizeof(*ops));
> +	} else {
> +		work_ctx->ops.irq_sim_irq_released = NULL;
> +		work_ctx->ops.irq_sim_irq_requested = NULL;
> +	}

The obvious fix is way more simple. Just allocate work_ctx with
kzalloc() instead of kmalloc(), no?

Thanks,

        tglx
