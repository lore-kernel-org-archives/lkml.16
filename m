Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A3715746E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743125089; cv=none; b=B5VHp7DZdxQT68CrKEuMQcDC5jjoB5vDfu7DuCcbSmflmCVReilqyvhit4q0PIwJeBvF/sC/PMPMsAUqc1SUFsxVXvWPaGPO97uURvoYz7ymVmujBIuaFgSRZsoEp12gAUSUtViI+5Q7t5QHUJCJ6XA9vMHDCp1ZoxxdiaDEqNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743125089; c=relaxed/simple;
	bh=26LsSNb03F/iEoTtwFgR1N24emaGpC0FYyg59/2Mc0s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNSvcAW7kkJyvoOQ5CPkL/es6h6EvLTyKV9YznYRQWpIi+s25ambr4MQwM6KkDV1ADbQ05z5g75W/UIb3OAeMnxqD2HjukcxsEzERglaXfeoFVmDQuNl7ecXEjVfGbq+3fJIhxmvteaFgKQwhXvN5rqft02MCkd5SDR3dKdiyko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5969CC4CEDD;
	Fri, 28 Mar 2025 01:24:48 +0000 (UTC)
Date: Thu, 27 Mar 2025 21:24:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
Message-ID: <20250327212447.24e05e7e@batman.local.home>
In-Reply-To: <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
References: <20250327171037.032bf7e7@gandalf.local.home>
	<CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 17:59:54 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 27 Mar 2025 at 14:09, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > - Allow persistent ring buffer to be memory mapped  
> 
> Steven, I'm not going to tell you again.

Yes, I figured this would be the most controversial pull request I sent
you.

> 
> And that "subbuf_order" thing looks *very* suspicious, since it means
> that any non-order-zero case will look up pages using
> 'vmalloc_to_page()', bvut then happily go on to assume that the
> allocations are physically adjacent in those subbof_order chunks.
> 
> IOW, code like this:
> 
>                 if (virt_addr_valid(cpu_buffer->subbuf_ids[s]))
>                         page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
>                 else
>                         page = vmalloc_to_page((void
> *)cpu_buffer->subbuf_ids[s]);
> 
>                 for (; off < (1 << (subbuf_order)); off++, page++) {
>                         if (p >= nr_pages)
>                                 break;
> 
>                         pages[p++] = page;
>                 }
> 
> is NOT acceptable, because look how it first looks the page up using
> vmalloc_to_page() ("because it was vmalloc'ed") and then it just does
> "page++" as if it was some physically contiguous thing.

The pages are never vmalloc'd, it's only ever vmap()'d on top of
contiguous physical memory or allocated via alloc_page() in the order
given. Thus, we do not support non consecutive physical memory.

And when it is vmap()'d it's still just order of zero, but shouldn't be
an issue even if it wasn't zero as it still is contiguous memory. The
only reason we have vmap() is because the reserved memory code returns
a physical location and not a virtual one.

> 
> Hint: those two things do not go together.
> 
> I'm *hoping* that subbuf_order is always zero for anything that has
> been allocated with vmalloc(), and that this is another of those "it
> works, even though it looks like crap".
> 
> But my point is that the code shouldn't be written in a way where it
> just *happens* to work, and "hoping" is not a strategy for long-term
> maintenance.
> 
> IOW, you should not have code that first says "I have no clue how this
> was allocated, so I'll ask the VM", and then in the very next breath
> says "oh, I'll just treat this as a physically contiguous allocation
> even if it was a vmalloc address".

We act as it is physically contiguous because that's all that is supported.

Now I agree that it isn't the best design to have the tracing code map
the physical address to virtual and pass that in to the ring buffer
allocator. Instead, it should pass in the contiguous physical memory
and have the ring buffer map it to the virtual address. That way
there's no chance of passing in vmalloc memory that is not contiguous.
We could set a flag that states if it was allocated via alloc_page or
was mapped by physical memory and use that flag to determine how to get
to the page. There would be no "hope this is contiguous" issue then.

-- Steve
