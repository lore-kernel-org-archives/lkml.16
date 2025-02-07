Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E58479;
	Fri,  7 Feb 2025 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738966619; cv=none; b=HuR3RqB00jzEGip201cAVf4udoQHEXGKv5BGdhxpVkqr3YKE2e8xFNW4RDQxzIFroWi3ZCDv6CKbkmE6wU9G2BdHi+eVkXn+hsZ5Y1Yf044AH+Z2aUl40ZmfN9+2NBLgE3RFxZhXipstkm4OerWIV5zmn8Z6xrySae+fXOJNdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738966619; c=relaxed/simple;
	bh=vBguwXYtPq2YWrzcJrg+d/ZEDpXox2WcEHb2Zy7c7eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7KKC5ZZHQxp8z+auOg9P4ARKBvpoByITE7QFcGj777tHeCgOPUNUrAleeDb2PMBM5n7G11R+QaadhX6HtgQasGMN98IEXk9hviPEmng8kK6GX9jirLTSV55gbQSIWObdGx5iDfAUu2i0cluWlfd59KsejxHiI8nVf4eEM40/7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AAYITtmD; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AAYITtmD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=giX8OGERwfO4MHhAX700Y15yzZhxddmBA51O/pJlx9o=; b=AAYITtmDEiu1aMKUL25OhuP4Km
	7y3Uc/Dxmajc1tLFw2Z+q0OHmEaZzfj6mtBiHcZOOQXD+wg4wik1cB0hA63URPfaSqid0BMQAmrkE
	adzUTEZOcmySqN7tBuT1ZqGPb10W68PEgCXPCg6sCAFaxPm90JEvA6h/lHnT+mVCpGI6dlVmilYxr
	XnGCPLB3YMNKDAtGMfFbUUFnd5WxAVEdhnvDTTyX2IioKhtB+C+5y+TGX5EXjSvqdWojPICCDsA0f
	0AGQtIvIpyJ5dMG5E2YOYMY9KluYwIt18CE2l+3Hyt48J9w5P5Cu3V1DKh7ErcugqdIcb7CyCAfOG
	fMSWYtFQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWeS-0000000HJx6-2HzP;
	Fri, 07 Feb 2025 22:16:45 +0000
Message-ID: <8edae47f-2b70-4a47-9141-c728037cc029@infradead.org>
Date: Fri, 7 Feb 2025 14:16:38 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/arch: remove deprecated function name
To: Jiayuan Chen <mrpre@163.com>, linux-doc@vger.kernel.org, corbet@lwn.net
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 linux-kernel@vger.kernel.org
References: <20250207125504.728688-1-mrpre@163.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250207125504.728688-1-mrpre@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/7/25 4:55 AM, Jiayuan Chen wrote:
> The dumpstack.c file has undergone many modifications, and the
> print_context_stack() function was removed or rewritten a long time ago,
> so it's better to remove the incorrect guidance.
> 
> I also want to preserve the original contributor info by keeping email
> address and name.
> 
> Signed-off-by: Jiayuan Chen <mrpre@163.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/arch/x86/kernel-stacks.rst | 51 +++++++++---------------
>  1 file changed, 18 insertions(+), 33 deletions(-)
> 
> diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
> index 738671a4070b..45b7a225da11 100644
> --- a/Documentation/arch/x86/kernel-stacks.rst
> +++ b/Documentation/arch/x86/kernel-stacks.rst
> @@ -112,41 +112,26 @@ Printing backtraces on x86
>  ==========================
>  
>  The question about the '?' preceding function names in an x86 stacktrace
> -keeps popping up, here's an indepth explanation. It helps if the reader
> -stares at print_context_stack() and the whole machinery in and around
> -arch/x86/kernel/dumpstack.c.
> +keeps popping up. This provides guidance about it. It helps if the reader
> +stares at printk_stack_addressk() and its callers and pays special
> +attention to the 'reliable' parameter ('?' basically means that the
> +address is unreliable).
>  
> -Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:
> +The detail about '?' can be found in the comments within dumpstack.c:
> +::
>  
> -We always scan the full kernel stack for return addresses stored on
> -the kernel stack(s) [1]_, from stack top to stack bottom, and print out
> -anything that 'looks like' a kernel text address.
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
>  
> -If it fits into the frame pointer chain, we print it without a question
> -mark, knowing that it's part of the real backtrace.
>  
> -If the address does not fit into our expected frame pointer chain we
> -still print it, but we print a '?'. It can mean two things:
> +You can also get more info from Ingo's original emal. [1]_
>  
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
> +.. [1] https://lore.kernel.org/lkml/20150521101614.GA10889@gmail.com/

-- 
~Randy

