Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5227450
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334651; cv=none; b=QG0l8m++n9fOzh/YNiLviM+RIC3/+cjY2MbiWbrXMQXuv192WbHpcPZPh9GkvT9VfUhwNnT675G9HD1b22/dXQjPzHHeT6T+S9keb4UUJz/67tAMzGWJaf8P3AuxVKaCJjuyIv2KStjC+gg+hg1ktAx1Xz/sWSzqRe+wMFfIrfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334651; c=relaxed/simple;
	bh=d+5NAtdM9y42hO2DhrbwDSCyNa9a2dVJzJYWEqgsfog=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IB6GBwpkeOXhdHbYX1g02LcT3NXBFPe7H7vldB4KBCAstrbEkS/REFhi8oDCjODUhEBaev7a4ZGCP8mrBEPu5Z3TBoHpCW8ef0qN+wTBfELaxY7lbkaOZNTtDLUXwdb/QzZcLb5MzSnXzoo+FL3Glrd3cGUqLeLI14XOrznnasY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AD7C4CEDD;
	Fri, 11 Apr 2025 01:24:09 +0000 (UTC)
Date: Thu, 10 Apr 2025 21:25:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Akinobu Mita <akinobu.mita@gmail.com>, Peter
 Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, Dmitry
 Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC][PATCH] panic: lib: Add TAINT for FAULT_INJECTION
Message-ID: <20250410212532.01646a92@gandalf.local.home>
In-Reply-To: <20250410135114.1c8bc2987b9a968d92b3a55a@linux-foundation.org>
References: <20250410144359.526476bc@gandalf.local.home>
	<20250410135114.1c8bc2987b9a968d92b3a55a@linux-foundation.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 13:51:14 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> > It may also be useful for other bug reports.  
> 
> Seems sane.  Does any userspace tooling need an update for this?

Well, the syzbot does show the taints in their reports. It can use that to
explicitly state that the kernel has fault injections, or at least the
developer can see the taint.

> 
> > --- a/lib/fault-inject.c
> > +++ b/lib/fault-inject.c
> > @@ -176,6 +176,9 @@ bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags)
> >  	if (atomic_read(&attr->times) != -1)
> >  		atomic_dec_not_zero(&attr->times);
> >  
> > +	pr_notice_once("Tainting kernel with TAINT_FAULT_INJECTION\n");
> > +	add_taint(TAINT_FAULT_INJECTION, LOCKDEP_STILL_OK);  
> 
> 	if (pr_notice_once("Tainting kernel with TAINT_FAULT_INJECTION\n"))
> 		add_taint(TAINT_FAULT_INJECTION, LOCKDEP_STILL_OK);
> 
> perhaps?

I'm fine with that too. I can send a v2.

-- Steve

> 
> >  	return true;
> >  }
> >  
