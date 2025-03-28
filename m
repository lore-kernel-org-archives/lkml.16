Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D126AC3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743132451; cv=none; b=cdr9+OVOz2Ofa/r3Oc3Q7ZTL6VOt7HDJQWMEczU1n28KGvko+BHpqu0pXBjj7N30O5qWxmdMdGmwNAcFMzkVYtvsfrYgIpRX5BRmxdKj3X72ogW8ge2xFEQEwtBTMkOBKq02R1VNAV6gXCvOmWkmx5rajx7l1k5aggyVQs5dLH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743132451; c=relaxed/simple;
	bh=+ymYX1lWgUWHrnm9NwuxfIBaFe0iGWJkOpsUodpvUnU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJ6VJfLx2T248Ytz/zFobenGgJ8n10bAt4aVj+9Sd9nwnj7/OSvsnHJptugwLNgu4EL9U3ddTL2prQzALxowsaqEk7AoyyEftlkLCF6C6ispFfvJINYuqiUh5Rhlur/DmY+hmeJ60bZixCtaQ+qltOh7vJWj6K5+BzCFyiGz1zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4CBC4CEDD;
	Fri, 28 Mar 2025 03:27:30 +0000 (UTC)
Date: Thu, 27 Mar 2025 23:27:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
Message-ID: <20250327232729.031be0b4@batman.local.home>
In-Reply-To: <CAHk-=whzQAYKuoFm9WGOE-QJJ47xvh0VN+RW1EEPCHTERQntQA@mail.gmail.com>
References: <20250327171037.032bf7e7@gandalf.local.home>
	<CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
	<20250327212447.24e05e7e@batman.local.home>
	<CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
	<20250327220106.37c921ea@batman.local.home>
	<CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
	<20250327224400.304bc106@batman.local.home>
	<CAHk-=whzQAYKuoFm9WGOE-QJJ47xvh0VN+RW1EEPCHTERQntQA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 20:05:14 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > I'M NOT LYING, and honestly I'm quite offended that you accused me of
> > lying!  
> 
> What's the definition of lying again? Saying something that wasn't
> true? That's literally what you did. You claimed only the virtual
> address was used. That's *CLEARLY* not true.

This is more of a confusing of the words. I did say "that's all the
code cares about", I meant the code that is used for recording and
reporting the events. I thought it was obvious that I didn't mean the
mmapped code. It wasn't lying, it was a miscommunication.

> 
> > Before 6.10 (from 2.6.28 through to 6.9), the only uses of struct page
> > was in the allocation and freeing of the ring buffer. It wasn't used
> > before that. The virtual address is what the kernel writes to, it's
> > what was read.  
> 
> What the hell is your point?
> 
> Bringing up something that *used* to be true, but isn't any longer true?

My point was that I can't *just* use the struct page. It sounds to me
that you want me to to refactor all of the code to handle struct page
even when the consumer is in the kernel.

> 
> So face the music. The fact that you mmap the thing means that now it
> needs 'struct page'. Stop making excuses, stop making things up, and
> just deal with it.

Again, are you suggesting that the code needs to be converted to using
struct page for all of it? Even for the kernel consumer code?

> 
> or don;t.
> 
> > But when you read the "trace" or "trace_pipe" file, or even read the
> > "trace_pipe_raw", the struct page is never used.  
> 
> Again, WHAT IS YOUR POINT?
> 
> Those aren't the issues. The issue is that you added mmap. Stop
> bringing up completely irrelevant issues. Stop saying "but but but
> other code doesn't need it".
> 
> The code directly under discussion clearly does in fact need it and use it.

I guess, are you asking to save the struct page for every allocation,
and not using virt_to_page() to get it? In other words, do I need to
increase the memory footprint to add another pointer because the code
can be mmapped?

	page = page_alloc();
	bpage->page = page_address(page);
	bpage->struct_page = page;

??

> 
> So when you go "this will cause controversy", you should take a step
> back, and think about how you can *avoid* writing things in an ugly
> manner.

Because this was the code we last had an argument about, which is why I
figured it would be "controversial". You don't need to read more into
it than that.

> 
> Instead you just went for it, and here we are.

Again, it wasn't because I thought it was hackery, but because this is
the code we last argued about. Hence, why I thought it was the most
"controversial".

> 
> So for next time, just don't repeat the same ugly hackery five times
> in a row, for one thing. If that code had been *clean* code, I would
> almost certainly not have reacted to the nasty "translate pointers
> back and forth".
> 
> But as it is, instead of having some clear abstractions and helper
> functions to do things in one place with sane tests for "if this is a
> ,TRACE_ARRAY_FL_BOOT thing, we have a clearly separate path" you
> repeated the disgusting hackery overr and overr and made sure it was
> front and center.
> 
> Now it's too late. I've seen that horror, and I'm not willing to take it.
> 
> You need to keep the 'struct page' around for mmap. Instead of living
> in the past and saying "before mmap, we didn't need it", just realize
> that the "before mmap" situation is not relevant any more. We're not
> there.
> 
> Or just say "mmap just isn't worth the pain of cleaning up this code".

So you are saying that you want this to save the page struct directly
then. My only concern with that is the added memory to save the
structure when it could be easily calculated.

As I work on memory limited devices, I try not to waste memory when
there's another way to get what is needed.

-- Steve
