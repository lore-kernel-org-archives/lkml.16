Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF96286D7C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289922; cv=none; b=WejreyfQDAaluHXE91LT3dg8pCU8ypfnPLoi1oFuzKyCqcadG80ADUQFhz86WS5Sd8Cc3Vdk7pwCKzYzfcjufScKObOV4Lpp4xZgv/K/Z6zl5/+MYjnNrQ3Bw6Ag2lflV4IlJPgR0zd8SqnpOhkYzNpPXHHX3ac2U3b2iOQLw5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289922; c=relaxed/simple;
	bh=nw2p3FUhd0fWCOYmLIW1otAQCs1wirO1cygYNgDC2iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgRmahlEb660p/6mYK5mCg1Sy6q/J1cAY7C2YNhNt24W22xaBuKsfD3Yjlfl7pNLcwyCTLG4GnQzir7z1XdPvKsE1tgKnPkkyUjVAgVbRAKPYzNZte/q/oZ+IccnJC68Nn9b4QIc3+MS3bbbhz/N6ii1PSw/nA3nCKnvLQosA0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jfU6nxJF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jfU6nxJF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=752n4eOQyQyxODp2lrgC+KbSsWOCzefn7SxojfJy6lA=; b=jfU6nxJFjKhZJMZjQLvuN1f4+w
	WI6SIQeZ5+zj1bJkbTCOCAfgUtdAyjUfXg8vb6EDBa0LuioVMIn+Nk2oY0w7MDbJLYq/ZpswXR57v
	WUHCL/OEWvyQWX3/l2a6SAEt4J5kIOhUy0vu9a75IBNBhkRQTzyJRmz2bfIQYYVSTg9/XSHIlJkAG
	GHB8e8xnGxRHioztgR9a5AHg1TxvPH12la+2LBzM2HicLH8Y4JQa1LNIv+D3O4ngfgMa1bkss9yJD
	A6MiI+Gl313zlDgEmg/Cp/11D89zKp5cepdmaUBP3i/8EDXivPX8xIi5JHBkZW3XY4KcshgiHoetC
	5P7k0aDg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEVa-00000006mPG-02G4;
	Mon, 30 Jun 2025 13:25:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 90C44300125; Mon, 30 Jun 2025 15:25:17 +0200 (CEST)
Date: Mon, 30 Jun 2025 15:25:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Wladislav Wiebe <wladislav.wiebe@nokia.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org, mingo@kernel.org,
	tglx@linutronix.de, akpm@linux-foundation.org,
	bigeasy@linutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irq: add support for warning on long-running IRQ handlers
Message-ID: <20250630132517.GM1613376@noisy.programming.kicks-ass.net>
References: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630124721.18232-1-wladislav.wiebe@nokia.com>

On Mon, Jun 30, 2025 at 02:46:44PM +0200, Wladislav Wiebe wrote:
> Introduce a new option CONFIG_IRQ_LATENCY_WARN that enables warnings when
> IRQ handlers take an unusually long time to execute.
> 
> When triggered, the warning includes the CPU, IRQ number, handler address,
> name, and execution duration, for example:
> 
>   [CPU0] latency on IRQ[787:bad_irq_handler+0x1/0x34 [bad_irq]], took: 5 jiffies (~50 ms)
> 
> To keep runtime overhead minimal, this implementation uses a jiffies-based
> timing mechanism. While coarse, it is sufficient to detect problematic IRQs.

local_clock() was found to be excessively expensive?
