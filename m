Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF2C1922DE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463238; cv=none; b=qcw6XdkaGGQJQy05vGT/qmKWgxT8VsOCylnjSHBaANd0ZGMk0O7PvOlrtUexD6XYcBmx2cQ524m6GmjBBrMJGE50EDIpOctzC6QRR65VoEnykwPIldtO3CtdEzRsmEwBUHraDOpBTvQWFhf6QTspH9Y0V7KHhOvz7ixzKxdt0kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463238; c=relaxed/simple;
	bh=nIvcSEERO01qes+DATalwAUekvv2EmYlih5o6aIUXts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EgbQJavz8em5uCq2qppSKhy+Ii9NQMnwupZTCNu7eMHw1uuftEVzzkPJaGk3qJL8GrxGP0Zraf0J2rY0TO7NLxbiQ0qOyD+nP9Tz+XuNlm/HydRYfZtM65TroDNWOUVA+qRziGdQYDVONloIJol9LkYFMAPS9Db1yncCkzQmhp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aHYHB5UV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t5z/Jb4v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aHYHB5UV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t5z/Jb4v"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749463235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nini9F9YY5ZHZB2FB7rlj7GaEmxQXIlpYFFdiwLKqY=;
	b=aHYHB5UVzehkjISmMnR8Q+IT+mR2Ad9vhXzqIyt/SpCaD3sfiiPSe+NtZkdPzofpqhuxlm
	Ddz4fyjUCC0YhwxJS62u9H+1/1xwOysKgvqYqjpO1cO4+7nGJZVbFTRBK2gieabyYp6sF4
	4eJM5j4vtC7Lm92XRz8yC+P20DdIspVPcC0jDAzLAOJWPwJs3a6ULZEv6XX9L0lpscM2pD
	9Yeu6x4rU03MkN0m1mTltcqeGgFEntI4hCxiC2ybJGmLOUbNXuEnhgDGf2Ow6A+vqqpP5s
	Y1JG+ep9KrTYKxWusowD5a9XfAa3pjUtdRsDQSQVp06d0Rwm9kzw0tRAhCwSrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749463235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nini9F9YY5ZHZB2FB7rlj7GaEmxQXIlpYFFdiwLKqY=;
	b=t5z/Jb4vOdN4Xx4oVd2VKJp3JmIJ/PQzQ++6daGxklroC9QjypRE6q+vzoaE/anBMxME/p
	wIkq3QhcPaZvycCA==
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch V2 06/45] genirq/proc: Switch to lock guards
In-Reply-To: <fbe8512c-ca7d-7a8c-887c-98eba94e1da9@huawei.com>
References: <20250429065337.117370076@linutronix.de>
 <20250429065420.373998838@linutronix.de>
 <873b0e9a-0e71-0eaf-b057-8a118d9ccabf@huawei.com>
 <fbe8512c-ca7d-7a8c-887c-98eba94e1da9@huawei.com>
Date: Mon, 09 Jun 2025 12:00:34 +0200
Message-ID: <875xh5p73x.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 09 2025 at 15:15, Zenghui Yu wrote:
> On 2025/6/8 20:45, Zenghui Yu wrote:
>> On 2025/4/29 14:54, Thomas Gleixner wrote:
> Plus,
>
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index b0e0a7332993..57facdc30d55 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -964,7 +964,7 @@ __irq_do_set_handler(struct irq_desc *desc,
> irq_flow_handler_t handle,
>  void __irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int
> is_chained,
>  		       const char *name)
>  {
> -	scoped_irqdesc_get_and_lock(irq, 0)
> +	scoped_irqdesc_get_and_buslock(irq, 0)

What for? Which problem are you trying to solve here?

>  		__irq_do_set_handler(scoped_irqdesc, handle, is_chained, name);
>  }
>  EXPORT_SYMBOL_GPL(__irq_set_handler);
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index c94837382037..400856abf672 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -659,7 +659,7 @@ void __disable_irq(struct irq_desc *desc)
>
>  static int __disable_irq_nosync(unsigned int irq)
>  {
> -	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
> +	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {

That's broken as __disable_irq_nosync() can be invoked from
non-preemtible contexts.

>  		__disable_irq(scoped_irqdesc);
>  		return 0;
>  	}
> @@ -789,7 +789,7 @@ void __enable_irq(struct irq_desc *desc)
>   */
>  void enable_irq(unsigned int irq)
>  {
> -	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
> +	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {

Ditto.

Can you stop making random changes and instead provide the actual
information to decode the OOPS?

>  string+0x110/0x3b8 (P)
>  vsnprintf+0x2f0/0xac8
>  seq_printf+0x180/0x220
>  show_interrupts+0x4e0/0x7e0

This means the print in show_interrupts() accesses an invalid
pointer. So the obvious thing to do is:

  scripts/faddr2line vmlinux show_interrupts+0x4e0/0x7e0

and provide the information, which of the gazillions of seq_printf()'s
in that function causes the problem.

I'm pretty sure that is has absolutely nothing to do with the guard()
conversions.

Thanks,

        tglx
