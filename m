Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FEC1DB15F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619231; cv=none; b=uhZPgOkpbIoDm15HUWmoseFWc7p/urig74deofqfvSOTmeD1aGi/IYD+kAE6WprEQAHVoFd/nmIjP3JXKn/v9Bxtu8jqkieXOxzPjaxRW0xTLUQnpWVWYm5kXYmAZiTmzpSIN/tVyY2tksnKSuLIo4JCt4xdNnO2u6u5jBSJ1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619231; c=relaxed/simple;
	bh=np0cMghiJdoxQPkkziDl+wbr0pm4ud+qtP6U26O+p+Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4V2Fm6GvGIA9FUUacn72m5jq3XnlCPmqVT/z47gIR6393rFNqBCDRxYNUn+txw3FDim5xJvk+vLDHxUCjsTFvTH03mmbOwP8KRSlgZ01Zqri5enaNKHSDLpZhF8eS+FPhI0s4P2LOLBd/g87J5YnBhfuLFIPbEEOkVstF4T10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id c851a200-0ff1-11f0-9b7d-005056bdf889;
	Wed, 02 Apr 2025 21:39:17 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 21:39:17 +0300
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
 <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>

Wed, Apr 02, 2025 at 10:12:27AM -0700, Linus Torvalds kirjoitti:
> On Wed, 2 Apr 2025 at 05:58, Petr Mladek <pmladek@suse.com> wrote:
> >
> > please pull few more printk-related changes from
> 
> Pulled. However, I reacted to this mess:

Yeah, this is the most plausible solution (rather workaround) proposed by
Rasmus. He thinks that GCC fails to recognize that va_format() is not what it
thinks it is.

>   +#pragma GCC diagnostic push
>   +#ifndef __clang__
>   +#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
>   +#endif
> 
> do we really need a "#ifndef __clang__" there? It's "#pragma GCC"
> after all, and the diagnostic push/pop are done unconditionally.

Yes. Clang complains on unknown pragma.

> I can well imagine that yes, we need it for some strange and stupid
> reason, but it looks wrong, and the commit message doesn't explain why
> we'd need it.

Ah, sorry, since Rasmus said something like "and add necessary magic to make
clang work" I mistakenly assumed that's kinda obvious that this is GCC only
stuff.

> And once again the "Link" is completely useless and doesn't point to
> any explanation, only points to the submission that has all the same
> info.

The problem with (automatic) Link tag is that it points to the latest version
of the patch where all of the discussion have been settled down. And more (but
maybe not full) information is available on the previous versions. The fix
would be to have some kind of version tracking system for the series (oh,
sounds like Gerrit :).

> I hate those things. The disappointment is real: "Oh, an explanation"
> followed by "No, just useless noise, doing a google search would
> almost certainly have been more productive".

-- 
With Best Regards,
Andy Shevchenko


