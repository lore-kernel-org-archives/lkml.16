Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEAADDA8;
	Thu,  6 Feb 2025 00:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802000; cv=none; b=LwuUvzU/aPXvimzPegxltSUdWq9ycUAnYv/PP/hQ0gmiUpGz+Aym3uxoRPuKvN7VdZKHdB16OrLKX1+ieGVLSx1iFQUXRPd+t3fbSy//lvzuGUoR7NbAH9c8blDIieL16HJrhuxejT6R0zkidPUFv+VKCEkKtP1P7S0FHXGx7H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802000; c=relaxed/simple;
	bh=JQU31/eBMumGK/y474bnjAS9L6di9TI/in6y76m1tS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YiAnE8+CkMxwWMTK7n/mIP6A1kVSolde/owkBJ+ZKVxobHWA/sdzibjLdIq72nvnj4vJ4fjnbaP+BcahjxRQ3Rwcd9pa48UfvFv5T7sF5cLiI36qhOiAF5zyKYHqSROvGzQ5cw+5hbZa9g0hd/npq5P36Qq9SQUjuxFjmEzhil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=azxRmQsy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="azxRmQsy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=c2cZwaXHdVn2MdjWizwyaY/IsNIaCB2/noejX4wAdcU=; b=azxRmQsyyXfqI4Etd/eCRpl9R+
	YBORqZYsr3VX8w4NlReIE4myF8FxrWQ06pK8vdsGanP1ltxCqshZG/K1gIAYPEgvO+5z5o9LnmqvS
	n2/nrP3uvfk55vq4U7KDO9beLXv5vIWqRrZAw368uAlxZkGgnlS3H//4w2mI0uAgQ8dH58Fk+D6er
	oEuQ6bA3pwUL/GEKOI1feYmblNY2UrX9zWV9rvPk6EK27Ep3W1Em9VJOHWtAhNupVnrvQ+sB7PqyB
	ck7Q54AYodVG+RkzCSDZIPdUQy8Apot/vZ5EaPMQxbiDAIIWLaO36bMsDqYWTerWKQMH72yi5u7zH
	g3k5YbMg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfppP-00000005E6o-3HCW;
	Thu, 06 Feb 2025 00:33:12 +0000
Message-ID: <e085496c-f267-44e7-94e3-c09521981439@infradead.org>
Date: Wed, 5 Feb 2025 16:33:02 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/arch: remove deprecated function name
To: Jiayuan Chen <mrpre@163.com>, linux-doc@vger.kernel.org, corbet@lwn.net
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 linux-kernel@vger.kernel.org
References: <20250114094832.350073-1-mrpre@163.com>
 <20250116162056.186121-1-mrpre@163.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250116162056.186121-1-mrpre@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi:

On 1/16/25 8:20 AM, Jiayuan Chen wrote:
> The dumpstack.c file has undergone many modifications, and the
> print_context_stack() function was removed or rewritten a long time ago,
> so it's better to remove the incorrect guidance.
> 
> I also want to preserve the original contributor info by keeping email
> adress and name.
> 
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---
>  Documentation/arch/x86/kernel-stacks.rst | 51 +++++++++---------------
>  1 file changed, 18 insertions(+), 33 deletions(-)
> 
> diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
> index 738671a4070b..f780f4b09761 100644
> --- a/Documentation/arch/x86/kernel-stacks.rst
> +++ b/Documentation/arch/x86/kernel-stacks.rst
> @@ -112,41 +112,26 @@ Printing backtraces on x86
>  ==========================
>  
>  The question about the '?' preceding function names in an x86 stacktrace
> -keeps popping up, here's an indepth explanation. It helps if the reader
> -stares at print_context_stack() and the whole machinery in and around
> -arch/x86/kernel/dumpstack.c.
> +keeps popping up, here provides guidance about it. It helps if the reader

         popping up. This provides

> +stares at printk_stack_addressk() and its callers and pay special

                                                         pays

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
> +You can also get more info from Ingo's original emal [1]_

                                                   email
and end that sentence with a period ('.').

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

