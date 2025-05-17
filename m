Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868871E884
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 19:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747511955; cv=none; b=OGbLC3pJCsdaHJHeWW8iifb07bixvjzkOFixQe4lBeM7YFMcKY/I8Jpb2LhxiiJywwBhRBntomNZGiUu2PdWYV5bbVC47QFIRmmgxXTAd/4KM+OAWWulKMdodRYhxunr1BM8692LXgTnY09arslOEY9DKOgKqm2Hfd4/bUyYPAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747511955; c=relaxed/simple;
	bh=Fy9Jzjm/Cthiwh61ury4KghazjHI9CMqXRRmqF43Vwk=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P8i94CElQE/PtG71aYPS59NWpUJvFh/spt5oocjNx1hEpp09KDoOXG03eYgllR+zJjJP+K69tFMLwWYyPT6sPvcgJ1xc6SXtH19RtFE3hwX9LtaFZmTH5TVgfhu0KBWkn61MfUMoUMfnjTwMncnMs/lcN5qg8DQh4Kd7PdyQSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BvzHe/Is; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q+y/llOj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BvzHe/Is";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q+y/llOj"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747511951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cOJMi2ml2Dp8lrtNuYE1nMsJo8SReHGLhNAZZYs7mA=;
	b=BvzHe/Is/iUohMKl4tjyZLLBxYfCPG4fsE2hUs7sNxxB/71P5mSsJCWVXZJ7UYj5rliT0Y
	o9cj9gZRSQxuYv37Gx81jUw1DL1W86Jif4rsjcO9XBjfXPscv8fjERO1uGlAYnzLZggN6y
	yD9RXdQhwYAiX3b7wLPOYGb964rfXY6JTwpqB8GrdFu7tUvGnbMBM7Rv7WHsneHHbWfqx4
	W7tUgWGijs3hCci0eFpKor22Kb2FAqXu2kaXRkT2XYIfDXSesbRXZ4a1iAIT0P5x5pju/H
	j8bmkPt2w39KNxtr056gA6yeS/9RNgUyjEZ6+NZQ+tUE95vvLSZCn8hVlBIeqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747511951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cOJMi2ml2Dp8lrtNuYE1nMsJo8SReHGLhNAZZYs7mA=;
	b=Q+y/llOjEkB2TiNhdwBI655KmbK0Cs4EuOmVpDDGx4mdz/3dHT06/oY46OZ4rzZ/I6jOyH
	/kQer4hUoksDHSDA==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip/msi-lib: Honor the MSI_FLAG_PCI_MSI_MASK_PARENT
 flag
In-Reply-To: <20250517103011.2573288-1-maz@kernel.org>
References: <20250517103011.2573288-1-maz@kernel.org>
Date: Sat, 17 May 2025 21:59:10 +0200
Message-ID: <875xhzhuup.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 17 2025 at 11:30, Marc Zyngier wrote:
> +	/*
> +	 * If the parent domain insists on being in charge of masking, obey
> +	 * blindly. The default mask/unmask become the shutdown/enable
> +	 * callbacks, ensuring that we correctly start/stop the interrupt.
> + 	 * We make a point in not using the irq_disable() in order to
> +	 * preserve the "lazy disable" behaviour.
> +	 */
> +	if (info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT) {
> +		chip->irq_shutdown	= chip->irq_mask;
> +		chip->irq_enable	= chip->irq_unmask;

This is only correct, when the chip does not have dedicated
irq_shutdown/enable callbacks. And I really hate the asymmetry of this.

> +		chip->irq_mask		= irq_chip_mask_parent;
> +		chip->irq_unmask	= irq_chip_unmask_parent;
> +	}

I'm still trying to understand, what's the actual problem is you are
trying to solve.

MSIs are edge type interrupts, so the interrupt handling hotpath usually
does not mask at all. The only time masking happens is when it's lazy
disabled or during affinity changes, which is not the end of the world.

Thanks,

        tglx
