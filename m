Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7044222094
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743127269; cv=none; b=NR4TjRk6GHRQbVHj8wXDZdIjYqp12836dgfVMaLE6ekDM8G9VUYf9mOnckt3rv1NwUo3433ygM8Q/LNQS+Z2N3iRGUKEOfneB+gm0L9++EDA7q5pF7O3V+lMFQsLxgvIkcD/IPvDeWMqWFGOT09ta6J2Q+RFa4GBOVUDofgvZkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743127269; c=relaxed/simple;
	bh=lS156lXSmbxj9WGPbtOyKYq7PavFbCd34yFZE+Eaxyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t2xfmt5L1TrQFsVpQ2rC10CnQg4X/9gjqp/ZghcQPuAg8aJlcw3uUkJYdclzPqKCyEnBWZgwL2oCvN50umLS4CDG79sEoi9nWWeIsJ4uEpv9lv+uNFzkGszxCnriZtuR8O7He14uMr7gdjxqlhk6elPaXerlM2qJbZSlrIkk0Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0981AC4CEDD;
	Fri, 28 Mar 2025 02:01:07 +0000 (UTC)
Date: Thu, 27 Mar 2025 22:01:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
Message-ID: <20250327220106.37c921ea@batman.local.home>
In-Reply-To: <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
References: <20250327171037.032bf7e7@gandalf.local.home>
	<CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
	<20250327212447.24e05e7e@batman.local.home>
	<CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 18:31:55 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 27 Mar 2025 at 18:24, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > The pages are never vmalloc'd, it's only ever vmap()'d on top of
> > contiguous physical memory or allocated via alloc_page() in the order
> > given. Thus, we do not support non consecutive physical memory.  
> 
> Christ, that just makes it EVEN WORSE.\

Let me explain this better. Yes it uses alloc_page() but that's just an
intermediate function. What is saved is the page_address(page), as that
is what is used by the code. That is, the allocation uses alloc_page()
but then immediately converted to page_address() to use. The page
itself is just an temp variable to get contiguous memory, as the
sub-buffers must be contiguous.

> 
> Just keep track of the actual original physical allocation, then!
> 
> By all means vmap it too for whoever wants the virtual allocation, but
> remember the *real* allocation, and keep it as a 'struct page'
> together with the order that you already have.

The virtual address needs to be created as that's all the code cares
about. For the case where the physical memory is passed in, it requires
a vmap(). The struct page is only needed when the ring buffer is going
to be mmapped to user space.

> 
> And then you never use vmalloc_to_page() - or even virt_to_page() - at
> all, because you actually know your base allocation, and keep it in
> that form that so much of this code wants in the first place.
> 
> Having a a nice reliable 'struct page *' (together with that size
> order) and keeping it in that form would be *so* much cleaner.
> 
> Instead of randomly translating it to (two different!) kinds of
> virtual kernel addresses and then translating it back when you wanted
> the original proper format.

By moving the physical mapping of the code into the ring buffer code, I
can set a flag for the buffer to mark it as being mapped directly, and
we can save the struct pages for this location (easily found by the
address). Then to get the page, it could be a simple helper function of:

struct page *rb_get_page(struct trace_buffer *buffer, unsigned long addr)
{
	if (buffer->flags & RB_FL_PHYSICAL) {
		addr -= buffer->vmap_start;
		addr += buffer->phys_start;
		return pfn_to_page(addr >> PAGE_SHIFT);
	}
	return virt_to_page(addr);
}


