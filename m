Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302C62A8C1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007176; cv=none; b=FcQZ5PzGlpfPKibundifSkQHgoTsNMFpd6EKcyXqGgtxiXTfvNKXAZk+OPq1+dWQv7SDQwHBEiRDX7u1IumkzdqwydQDtTdCkz73BoqwZNTKPSnOGkRCmn4zss9Nu12nG2F5cVKOnBZ4/dJ4eugVKdWU6IlGuyC2GoV//22sN2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007176; c=relaxed/simple;
	bh=XJTd3GoIw0tq3NOQ+vf3VqM3R68xl+7w/5d7Ws3c4js=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RKRAAFNyXkiu2SA0Jbk4IjtHZbKBAOFG/36+u1bCSbUcflSlIUzz2FRXsP+bHd+hvRhjMzPuxw3Jz6+K6whesXLqvSwK11vUJQhoazzgPltFbxtxkOT0wkhEBDSBYsE3fLdMpiIWM8s5wzkEauBLJlbCg5V5sR4eRv16b4dNV6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zqOC2w5q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/Wcif2q8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zqOC2w5q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/Wcif2q8"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744007171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NDhQJ/t15EySqNMSJwo0T9+q87wLcRofE5O8cA2eoM=;
	b=zqOC2w5qTPayNONDyYUx1a0HVCAXMdoUEY6JEROy9Xi9nW7cCpnTBfeBqcKFqOzwq2I++f
	6sJdziw3cWVPRPu2vSWNw2aatT0h2q/ifnpbXFNHciPbq/t81WKIQEYvn7EXqXd0hdZnBL
	JoT8D5h2T8PgqwEZtD2978aj9UH6QlyckRHvUrZOm2CqFj84mTUIGyrDZ1tGhxfgpH+a/2
	rmlmQKrpIR+YXxZeIFhcNfCfspydmAjGhVwzXkfOGQdR5KFlDQt3xfsMXCCg7eCAZ3YETI
	1S1YFZk8YC3TggPaEmj09FJp8mj5Jt4j9PXZGEM1RpY/lihple151wIWYhXw0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744007171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NDhQJ/t15EySqNMSJwo0T9+q87wLcRofE5O8cA2eoM=;
	b=/Wcif2q8sa6pdJkzn2mox+ebiSKFMMt8xQnb4BYkXDvDYTOdILKESpSD5LNJfOqrFZu6b2
	mmAOyP6pyrS/wICQ==
To: Maxim Kochetkov <fido_max@inbox.ru>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peterz@infradead.org, elver@google.com,
 namcao@linutronix.de, samuel.holland@sifive.com,
 daniel.lezcano@linaro.org, apatel@ventanamicro.com
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Subject: Re: [PATCH 1/1] time/sched_clock: move sched_clock_register() out
 of .init section
In-Reply-To: <20250404050540.13507-1-fido_max@inbox.ru>
References: <20250404050540.13507-1-fido_max@inbox.ru>
Date: Mon, 07 Apr 2025 08:26:11 +0200
Message-ID: <8734ekwkqk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 04 2025 at 08:05, Maxim Kochetkov wrote:
> The sched_clock_register() is widely used by clocksource timer
> drivers. The __init prefix forces them to be initialized using
> macro TIMER_OF_DECLARE with __init prefixed function.

No, it does not. It requires that they are built in, not more.

> Clocksource devices can be consumers of some external irq, clocks,
> resets, e.t.c. Such devices can't be correctly probed if this
> dependencies are provided by platform drivers. Because of regular
> platform devices are not probed at this moment.
>
> We can convert clocksource drivers to platform device drivers to
> fix this issue, but __init prefix in sched_clock_register()
> prevents it.

Again. It does not. What the __init prefix prevents is that the driver
can be built as a module and loaded late.

> So lets drop __init prefix to allow platform device drivers to use
> sched_clock_register().

s/So let's//

"So let's" means nothing.

Also this has nothing to do with platform device drivers. It's all about
modules and nothing else.

Thanks,

        tglx
