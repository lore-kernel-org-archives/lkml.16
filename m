Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60043244E8C;
	Mon, 10 Feb 2025 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211482; cv=none; b=u7uQGPyU2y0YxCIWfRxU32beW3bj6H1GZJr1CAkEtKuLN//EusA6+vcmIqyOc/owlXJN3tgT7/1b6/IrUoPzCQl3mlC5PdlbCokO4h0DdLKviCxYjcOZdBgFFFTwZ+8Bte5alHonR8XH9PovoPMZKti5i/KK/4t7DdrY2MIt54Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211482; c=relaxed/simple;
	bh=UguPET4pHfk1EhUUOm2Xzv4gC7EqvxTKpd8UaOXRQd0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tUOKyuYs1pHKMLryWERHFyXitYvmwCSu3cToTu74UEo73DERveVGU/LTuCHdGQrSA6hh8kAs682iTHcP5eMX5T7w0lYLMztYdm0yTxsOFqpHGUSrVkELVYAhUt528bGNci7ir0u0y31ua4Pvfra2oE9OepZ9S4ral0giJcbNBeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=i/pKcKP8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="i/pKcKP8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5D119411A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739211480; bh=r1tBbKSVje12XQe+r2wNxIvvdpr4Ck7WodjBys+sE1E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i/pKcKP8radJ26HRi/QPxgYOoGtvLVyrOrUvMWrpmhMxqR6e7pkg1W5sSMTe7RbK3
	 N30BtFXUR0WGtuP43I3MwM+1ceVayUaok8q3ViiBeG658JdVJXkmLwFKzXVRXvZTlc
	 H6cbBWp2sYiW6y5w9hbU/5TH9R2rNHI6ayNwUdHmBr1rfRaQb4Qmy1MPwKDgwQH6ZB
	 0kQ5pOu4j2EK8d8YXuLfk9aMqOv+7cjD9yTFEy3hAFcAgzs4BY5jluBscTvGabV0gP
	 nHFkZ+M1lVr7M7Hu5hK/rs+jKSR2sn9WVo8Rn3kGts/SsnFXbzHNTVCRYrnFPp07eN
	 jrqcEkCl9GJ8Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5D119411A7;
	Mon, 10 Feb 2025 18:18:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jiayuan Chen <mrpre@163.com>, rdunlap@infradead.org, bagasdotme@gmail.com
Cc: linux-doc@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 linux-kernel@vger.kernel.org, Jiayuan Chen <mrpre@163.com>
Subject: Re: [PATCH v4] docs/arch: remove deprecated function name
In-Reply-To: <20250208081832.121337-1-mrpre@163.com>
References: <20250208081832.121337-1-mrpre@163.com>
Date: Mon, 10 Feb 2025 11:17:59 -0700
Message-ID: <87ldudzmso.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jiayuan Chen <mrpre@163.com> writes:

> print_context_stack() was removed in 2016 by commit c8fe4609827ae
> ("x86/dumpstack: Remove dump_trace() and related callbacks"). Remove
> the now-inaccurate guide.
>
> While at it, also link to Ingo's explanatory message.
>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> ---
> V3 -> V4: Made changes based on Bagas's suggestion.
> V1 -> V3: Made changes based on suggestions from Randy and Jonathan.
> ---
>  Documentation/arch/x86/kernel-stacks.rst | 60 +++++++++---------------
>  1 file changed, 22 insertions(+), 38 deletions(-)

You didn't add Randy's Reviewed-by

This change is more than just removing a function name, though, so the
subject line is a bit off.  There's enough changing here that I would
really rather have an ack from the x86 folks before applying it.

Thanks,

jon

> diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
> index 738671a4070b..4cb68433272d 100644
> --- a/Documentation/arch/x86/kernel-stacks.rst
> +++ b/Documentation/arch/x86/kernel-stacks.rst
> @@ -112,41 +112,25 @@ Printing backtraces on x86
>  ==========================
>  
>  The question about the '?' preceding function names in an x86 stacktrace
> -keeps popping up, here's an indepth explanation. It helps if the reader
> -stares at print_context_stack() and the whole machinery in and around
> -arch/x86/kernel/dumpstack.c.
> -
> -Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:
> -
> -We always scan the full kernel stack for return addresses stored on
> -the kernel stack(s) [1]_, from stack top to stack bottom, and print out
> -anything that 'looks like' a kernel text address.
> -
> -If it fits into the frame pointer chain, we print it without a question
> -mark, knowing that it's part of the real backtrace.
> -
> -If the address does not fit into our expected frame pointer chain we
> -still print it, but we print a '?'. It can mean two things:
> -
> - - either the address is not part of the call chain: it's just stale
> -   values on the kernel stack, from earlier function calls. This is
> -   the common case.
> -
> - - or it is part of the call chain, but the frame pointer was not set
> -   up properly within the function, so we don't recognize it.
> -
> -This way we will always print out the real call chain (plus a few more
> -entries), regardless of whether the frame pointer was set up correctly
> -or not - but in most cases we'll get the call chain right as well. The
> -entries printed are strictly in stack order, so you can deduce more
> -information from that as well.
> -
> -The most important property of this method is that we _never_ lose
> -information: we always strive to print _all_ addresses on the stack(s)
> -that look like kernel text addresses, so if debug information is wrong,
> -we still print out the real call chain as well - just with more question
> -marks than ideal.
> -
> -.. [1] For things like IRQ and IST stacks, we also scan those stacks, in
> -       the right order, and try to cross from one stack into another
> -       reconstructing the call chain. This works most of the time.
> +keeps popping up. Here's the explanation, that helps when the reader
> +stares at printk_stack_addressk() and its callers and pays special
> +attention to the 'reliable' parameter ('?' basically means that the
> +address is unreliable).
> +
> +The answer can be found in the comments within show_trace_log_lvl() body
> +in arch/x86/kernel/dumpstack.c::
> +
> +    /*
> +     * Scan the stack, printing any text addresses we find.  At the
> +     * same time, follow proper stack frames with the unwinder.
> +     *
> +     * Addresses found during the scan which are not reported by
> +     * the unwinder are considered to be additional clues which are
> +     * sometimes useful for debugging and are prefixed with '?'.
> +     * This also serves as a failsafe option in case the unwinder
> +     * goes off in the weeds.
> +     */
> +
> +For more information, see also Ingo's email. [1]_
> +
> +.. [1] https://lore.kernel.org/lkml/20150521101614.GA10889@gmail.com/
> -- 
> 2.43.5
