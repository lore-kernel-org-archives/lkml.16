Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0347224F6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743129843; cv=none; b=mlvn9VuudxuJTPMLAo3tWhh0gZzflBkNJADyBKCd1zgfMB67evQqTiFdkt6ii8H4GbzkndIizEaUrY9odHNbkXs4XWPbVq2q+ugeXSOXlCpVyKiNdfjgZFMQXQBdzYjNuF48UsFNKG2+04FH5BUXZD4rZ/R1QU0qcUxMq27AsYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743129843; c=relaxed/simple;
	bh=melhj2XUeJbE19ULo2hyF+Vm6LGG4m2cpLHp34erCZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L2nxY6MGwNoYfLGSDHf17axt6w1X+5O9vaqsSFCnu4jCbJ7RxCK2rYeb6czqZANDVbigYjtKvlqWXnOUWcd2xc0gI7sHwv3UgbMuPMVgbsgnnlD2dQmGt8FIH1/b04HH2Mxas6gxmm6jaBbA6LP+CWOIgdfsG6oCeV/j0HfNgd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240ACC4CEDD;
	Fri, 28 Mar 2025 02:44:02 +0000 (UTC)
Date: Thu, 27 Mar 2025 22:44:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
Message-ID: <20250327224400.304bc106@batman.local.home>
In-Reply-To: <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
References: <20250327171037.032bf7e7@gandalf.local.home>
	<CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
	<20250327212447.24e05e7e@batman.local.home>
	<CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
	<20250327220106.37c921ea@batman.local.home>
	<CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 19:17:34 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 27 Mar 2025 at 19:01, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > Let me explain this better. Yes it uses alloc_page() but that's just an
> > intermediate function. What is saved is the page_address(page), as that
> > is what is used by the code.  
> 
> I understood.
> 
> But NO, that is *not* what is used by the code.
> 
> You literally use "struct page *" whenever you want to mmap it.

When we want to map it to user space, which was added in 6.10. Before
that struct page was hardly used.

> 
> If the *only* thing that was used was the virtual address, this
> wouldn't be a discussion.
> 
> As it is, you allocate it in form A, then you turn it into *either*
> form B or C, and then when you need form A again you turn it back. And
> you do so in a particularly disgusting and random way.
> 
> > The virtual address needs to be created as that's all the code cares
> > about.  
> 
> Stop LYING.

I'M NOT LYING, and honestly I'm quite offended that you accused me of
lying!

I make it a point to point out very clearly what I'm doing and have
never tried to sneak something past you. That's why our arguments have
been from the cover letter and not the patches themselves.

> 
> If that was "all the code cared about" we'd not have this discussion.
> 
> It clearly wants things *back* as 'struct page' again. Stop making
> shit up and maki9ng excuses for your bad code.

Before 6.10 (from 2.6.28 through to 6.9), the only uses of struct page
was in the allocation and freeing of the ring buffer. It wasn't used
before that. The virtual address is what the kernel writes to, it's
what was read.

We just started allowing the ring buffer to be memory mapped by user
space in 6.10. But that's not even the main way the buffer is read.
Most of the time, the buffer is read by the "trace" file and that is
where the kernel translates the buffer into human readable text. That
most definitely doesn't need the struct page.

Note, in the splice case, the tracing code does convert it back to a
struct page. But if you do splice on a memory mapped buffer, the ring
buffer code allocates a new page and copies it, as the memory mapped
buffer can not be passed to splice as that requires giving up ownership.

But when you read the "trace" or "trace_pipe" file, or even read the
"trace_pipe_raw", the struct page is never used.

> 
> And yes, it would probably be fine to just keep it as *both* in parallel.
> 
> But honestly, if you only save one thing - as you currently do - you
> should save the thing that is more fundamental.
> 
> That's 'struct page *'. That's the allocation, that's the thing you
> need for mmap, and that's what you *should* have used for
> de-allocation too (even if I think you currently just end up using the
> virtual mapping and depend on the VM code undoing your mapping).
> 
> Anyway, I'm not arguing any more. I'm telling you that this code will
> 
>  (a) not be pulled this merge window
> 
>  (b) not be pulled EVER unless you clean it up
> 
>  (c) you need to stop with this hackery
> 
> Apparently you knew it was ugly hackery, since you said "I figured
> this would be the most controversial", so it wasn't a surprise to you
> that I'm complaining.

Well, it wasn't that I thought it was hackery, it was that it feels like
you are looking for anything to yell at me for at every pull request I
do. And this one I figured you would find something with.

> 
> Why did you send it then? Because I'm serious - this has been a
> pattern, and I  AM DONE.

Because I didn't feel it was as hackery as you do. I'm not even doing
this work alone. I even talk with the memory management folks. They are
not telling me it's hackery.

> 
> Next time, I won't bother to explain why I'm not pulling, because
> apparently even when I explain, you just start making excuses and
> making more garbage up.
> 
> Next time, you're going in the spam filter.
> 
> Because it's annoying that I have to go through your pull requests so
> carefully, but what makes me truly fed up is that this KEEPS
> HAPPENING, and then when I complain you just start arguing about it
> even though you seem to have been aware that the code was shit.

I'm sorry that you feel this way, perhaps I should quit and find
another profession :-p

-- Steve
