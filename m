Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33D819CCEC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624656; cv=none; b=Ie9rK2r+xZQPEsozy1f2/vfiIJlzUq3FqjkDjj0fy8bK4rb0ROSQDw5oZi5XWs2YvR+qi4S6Je5Y+92uFODhn2JdGOdClIhRheRarGll+FRvdK0jkDvEr7kNhvFk/1iJr1qyZs5K7BOgk/WMydCUUjj9DZ+nxBgb2RTM+rfpqvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624656; c=relaxed/simple;
	bh=YDZfBA7YZsa8inNsy7EKl+JjFfOB8gKO4XwwMTdKyJE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=byUAN63LF1bv+jnHgCtdzXFsq0Dn4CAXrGZm7IODb2R1uasBTAhF9Wsf+KcJD3+Iw0X0WI0RelqEjvK2QGifgk2qgzqDYLIpOnZuMcR5moHVj/uKdcMKHG0j6VcID+BTpFyyqHXRqzVLI1BdOJaYG5CGV4Iir3otts4bD9W6tUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB50C4CEDD;
	Wed,  2 Apr 2025 20:10:54 +0000 (UTC)
Date: Wed, 2 Apr 2025 16:11:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Petr Mladek <pmladek@suse.com>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, John Ogness
 <john.ogness@linutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <20250402161158.444ca614@gandalf.local.home>
In-Reply-To: <Z-2XVMOJXUjVYXV0@google.com>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
	<CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
	<Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
	<CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
	<CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>
	<Z-2XVMOJXUjVYXV0@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Apr 2025 13:00:20 -0700
Sean Christopherson <seanjc@google.com> wrote:

> "just Google it" does work most of the time, but search engines won't help all
> that much if the maintainer massaged the shortlog and/or changelog, especially
> if the surgery done when applying is significant. 

Actually that's a good point. There's several times I get a patch with an
incoherent subject line, and I will change it without requesting for an
update. And usually in these cases I tend to rewrite the change log as the
submitter isn't a native English speaker and I reword it to make it have
proper grammar and such.

The Link: tag in this case is the only evidence that the commit came from
that email. The patch itself can sometimes be modified if there's a small
conflict with the current code. If it's anything more than "oh there's an
added line just before the code that this patch touches" I'll ask the
submitter to rebase, but for the case the code around the patch changed,
that's enough to make the commit not 100% what was submitted.

-- Steve
