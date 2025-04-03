Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE862505D6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696896; cv=none; b=TNWtpuIxdxaH8CmjMbdcq8tF2+DNoJrxDnBMG7BuU+WzVKfgE+bNClLHNkHkTQMFzH7wK3lbBdv33/KG2MjzEgqPJqwwvj3mHXoathi3C9dWihfrOH7SPCmJAu4uhc9hM4/jjF71btMYkPQsUfg/BL/ojWj9kF2kQoACP/e+rDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696896; c=relaxed/simple;
	bh=lMxjdbVlogar1x6TACc28yrwZY0Hr3g26oRXM732pUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Af50JLdZ7qSEBTYv/2W8PELq412PZg80HsQDTWro2IpohDzjxMFC6NAt/n7YTy9DnVASfrhTshyB71NzBksdtsUVGtjiTha9FUJRx6x0ckZnCQV/yGMr5Y6y/Vvbs+804Qpvu4QlKSyD9KmZjmaQ027gv5mlVZ6S+IhIzdXJr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYL3Ebdo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYL3Ebdo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CB4C4CEE3;
	Thu,  3 Apr 2025 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743696896;
	bh=lMxjdbVlogar1x6TACc28yrwZY0Hr3g26oRXM732pUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYL3Ebdo2egcQxLrRTXZ8I2cAHDqgjpZHcFl3jbUMnxL7uEmrqeiEo3heZ0lNvIrt
	 ytBVWbgg+HVv/ZfJGN6CXiFHRW5jas4NV8WvcLZMJYSxFFHeaMFjhGV3OioRRMHtIb
	 oWhNq388njjseYIJbF0F87K/k4c3tQ4TNtcP0fHSKpXvKc+ETDgHxgN7Vqv5o4v2ZE
	 PfWyPcN5eAxHNx7vuiSb9PE5LmzcvlW0fW65MZpG0nVdVFL3zccJFII2PRcYcBdeki
	 6+ECfHbgoZNeUORXOA+55zLEDZPMshxEGCnEnAiO0NjLLtRTl/ztUewWWUSw/ifSLc
	 cC61ckwTTwN1w==
Date: Thu, 3 Apr 2025 09:14:54 -0700
From: Kees Cook <kees@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <202504030913.B50F046CB7@keescook>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
 <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
 <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
 <CAHp75Vf=tYmWXDUZDqcMK4i8k6_VBqGttw6-mEgt6VhvRVFwuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf=tYmWXDUZDqcMK4i8k6_VBqGttw6-mEgt6VhvRVFwuA@mail.gmail.com>

On Wed, Apr 02, 2025 at 10:25:46PM +0300, Andy Shevchenko wrote:
> I actually don't know what the benefit of __printf() attribute from
> security (?) point of view is. I may speculate that this helps to
> validate the format string and arguments (when provided as ...) and
> helps with potential wrong argument sizes, etc. Kees, what do you
> think about Linus' proposal?

It's a bit low on the severity list since we long ago removed %n, but
it's effectively a form of type-checking for arguments to printf. I look
at it more as a robustness/correctness checker. If we can make it work,
it's good to have. And it looks like Nathan's suggestion will make it
feasible.

-Kees

-- 
Kees Cook
