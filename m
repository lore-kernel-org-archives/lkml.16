Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF501FA178
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381960; cv=none; b=kAFB1ubw/ZN8Q+p5hzWD/d8enq/muOP43XoxMrm8iDKaqA/k5aET69u/qwuWJ+4Gdvmh8lFESArknrX4mGOi3jQi09hgISp5LJ2PDM1YzXj5CMqPcw2g+4anUkHgJXaRO2zMVQHaUebATCZfLZ693DO1IemhDd8ShZdbi4hJ54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381960; c=relaxed/simple;
	bh=BvgbhenQLWMJXDRayQTsM2Ez2thbBd5MX4R6rU61WUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdOjiGS1MTIuKPGxI7yP30kpOHPTlmPv9S2kNrDeJMExNK365MSbUe8A/qjyIXhwhrQXKoHmKe7h5R9BwcsiB+5zAlj3pkCL8IeqpfU++B/F9R33rGZGwPB6q/JOEVZCsjW4WCGqF4tqyFu7+/n0dNfIXOY2RVU4/V29kbFK9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uNg9DVMl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uNg9DVMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AC0C4CEE8;
	Fri, 11 Apr 2025 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744381959;
	bh=BvgbhenQLWMJXDRayQTsM2Ez2thbBd5MX4R6rU61WUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNg9DVMlcv+8hWd7NtOycqfpelxm601x74VXbCgW2Wf3+TkC/eTdZ/hBduyGzmUAo
	 XHMf7jaJL+5uJa2ugYXGQZ1LRuyt8HpSN9EFacl20NXwRYmEHXTy2N6/0w+tm9GGIh
	 76rOXnCpYDDKU5Rs0OYC9X+Jyj79HfJTzGMbi3oE=
Date: Fri, 11 Apr 2025 16:32:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, Dmitry Vyukov <dvyukov@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] panic: lib: Add TAINT for FAULT_INJECTION
Message-ID: <2025041158-opal-aspirin-5909@gregkh>
References: <20250411085355.118180b4@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411085355.118180b4@gandalf.local.home>

On Fri, Apr 11, 2025 at 08:53:55AM -0400, Steven Rostedt wrote:
> --- a/lib/fault-inject.c
> +++ b/lib/fault-inject.c
> @@ -176,6 +176,9 @@ bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags)
>  	if (atomic_read(&attr->times) != -1)
>  		atomic_dec_not_zero(&attr->times);
>  
> +	if (pr_notice_once("Tainting kernel with TAINT_FAULT_INJECTION\n"))
> +		add_taint(TAINT_FAULT_INJECTION, LOCKDEP_STILL_OK);

It took me a while to think that this is the proper place to put it, but
it seems reasonable enough in the end, as you only will set the flag if
a "failure" actually happens.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
