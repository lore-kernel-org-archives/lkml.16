Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8041EBFFD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318276; cv=none; b=dR0joQkFhhrWPDcj55wcwMb7Li46yiG/YyHDUvyqY/YJDQ41K2hVFevoGbS9jJ9XBz9xVyEwymAgcf99agI+P38Ycu/dtJ+csGWH4LUKU9ARofq+H2spAJJm51R/UcyRPRsEAiOOV1FW96jDIzl3m7kIBx8xW1dKaH/aryZapg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318276; c=relaxed/simple;
	bh=xILzUXt1hKmNBNi7Lw/2+izI/47wwH9rJ9RW9DF57CA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qNsy0uSSNtgNYbCQVNbJ3CsORmZMUot1xQy5fah1mDvqmb2T03YGjfuASE97LCDu0BrrquwpAhmavPaiqK7cqZuZj/uvDC8m4hZru8hwHdScd84w71en45dWy57IrH/fneZtSa+T4NWwHyUl9+wa2FIaJTXv8RRssSlLUvYO0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XWcaK/PO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XWcaK/PO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4F9C4CEDD;
	Thu, 10 Apr 2025 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744318275;
	bh=xILzUXt1hKmNBNi7Lw/2+izI/47wwH9rJ9RW9DF57CA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XWcaK/POYcAQu22kur1Bp0DXkxYcEjq6y30cmUpCOZw8sOVGxsuP47pLJ03DilLfR
	 tfjWvAcTGA20KGa4ApL/hnPUQ3Vzj6jEACiUT6f6xHlx2LW5Tq71mXsFwo9JdZBNVd
	 ovC2qxiinJjGTOsRxiASQO473SeTK7sKq2Wsv+mA=
Date: Thu, 10 Apr 2025 13:51:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Akinobu Mita <akinobu.mita@gmail.com>, Peter
 Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, Dmitry
 Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC][PATCH] panic: lib: Add TAINT for FAULT_INJECTION
Message-Id: <20250410135114.1c8bc2987b9a968d92b3a55a@linux-foundation.org>
In-Reply-To: <20250410144359.526476bc@gandalf.local.home>
References: <20250410144359.526476bc@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 14:43:59 -0400 Steven Rostedt <rostedt@goodmis.org> wrote:

> From: Steven Rostedt <rostedt@goodmis.org>
> 
> There's been several times where syzbot reports a bug that was caused by a
> fault injection, but it doesn't report this fact in its email reports.
> The bug report could happen in code that wasn't involved with the fault
> injection due to the code that faulted not cleaning up things properly,
> leading to an unstable kernel, which in turn can trigger issues elsewhere
> that doesn't have a bug (much like a proprietary module could do).
> 
> It would be very useful if the syzbot report notified the developer that
> the test had injected faults into the kernel.
> 
> Introduce a new taint flag 'V' that gets set when a fault injection takes
> place. (Note, there's not many taint flags left, so 'V' looked as good as
> any other value).
> 
> This will let the syzbot see that the kernel had a fault injection during
> the test and can report that it happened when sending out its emails.
> 
> It may also be useful for other bug reports.

Seems sane.  Does any userspace tooling need an update for this?

> --- a/lib/fault-inject.c
> +++ b/lib/fault-inject.c
> @@ -176,6 +176,9 @@ bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags)
>  	if (atomic_read(&attr->times) != -1)
>  		atomic_dec_not_zero(&attr->times);
>  
> +	pr_notice_once("Tainting kernel with TAINT_FAULT_INJECTION\n");
> +	add_taint(TAINT_FAULT_INJECTION, LOCKDEP_STILL_OK);

	if (pr_notice_once("Tainting kernel with TAINT_FAULT_INJECTION\n"))
		add_taint(TAINT_FAULT_INJECTION, LOCKDEP_STILL_OK);

perhaps?

>  	return true;
>  }
>  
> -- 
> 2.47.2
