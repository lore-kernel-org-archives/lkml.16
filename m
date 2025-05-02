Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9CA95E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189278; cv=none; b=h4z+E2b/29PGsQ71bneR/9ja2qVot1GzK9jWPY7YOdbomMgSdeXTJq4sP6n2a75Uu5yifig4YH2iq8gEdyLfQ7NiqnbDRVA/Q79AL8xY1eo6euyyGiYfE6ltBwyKUZQTyBDty87eItq9hlFoGXqwsgujLp7DAAkzR0awojeIm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189278; c=relaxed/simple;
	bh=g7A0sbkQ4Aynm7fwdnm7WH5a5k+uVhYF0BxdHKNF7Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRE00AUIdSSryeAf00rj9qU+lXdwMHLaqX/hnjOXxAGauqfh7KVY8xYBemOqXYQnban9YUb5OOvhSuFsQACcgZH9sZQ1gB9qbLf0f03EDpjdYUwy0jOQKTbXgsS0pseInnmoM8RcoiW7cd1Ji439KVhv0P/OnXzuYK/gxYPXD4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ELO2151L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aplA9bZ4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ELO2151L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aplA9bZ4"
Date: Fri, 2 May 2025 14:34:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746189275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ELROxN1hM3HYk1nE1ZM0lckEfEoPs+ETna07i6Nbuo=;
	b=ELO2151Ld++sm/3cMYKVH+Mg05H/0pumh7u1hRazIUV6n1m2wfFvJ/ooqwYpEnUtL6Q1IZ
	qNi00hPcDCBl3y+UjOBaBnnUq1cxxeAtXWZzyEDrhkRKqlY9BjREjvI1g4ASKuofmMKXYn
	AOium2JteJnL+AfggBWf/jpgxc31nIemKadWwdH8jTf7KUsXdxjKila7km6akmkM1+A99i
	ut0yuE9LuWQRAV7cBrvuzKV8KQ7oI4rzNMEANQQ9UjbS0kSbccUNGZaG+1xp2uWd4vP3Ft
	QwMAyhe0lutM1wqS3P8HYPDQPIiMfs3qP15aWAvglePZKI24TH4AiY+GVvnFkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746189275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ELROxN1hM3HYk1nE1ZM0lckEfEoPs+ETna07i6Nbuo=;
	b=aplA9bZ4Yvgoslu5e4uU7ZLM/cHGCMQaRqonQ9f+eIaPogCuiBvIHwigNycpC6u6I6Iubb
	5FfH4bIVAuY+VgDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	kprateek.nayak@amd.com
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250502123433.AHDVLZdY@linutronix.de>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502015955.3146733-2-prakash.sangappa@oracle.com>

On 2025-05-02 01:59:52 [+0000], Prakash Sangappa wrote:
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index 20154572ede9..b26adccb32df 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -98,8 +99,12 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
>  
>  		local_irq_enable_exit_to_user(ti_work);
>  
> -		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
> -			schedule();
> +		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {

I asked to limit this to LAZY only.

> +		       if (irq && rseq_delay_resched())
> +			       clear_tsk_need_resched(current);
> +		       else
> +			       schedule();
> +		}
>  
>  		if (ti_work & _TIF_UPROBE)
>  			uprobe_notify_resume(regs);

Sebastian
