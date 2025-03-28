Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948BE17C77
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743134450; cv=none; b=USaj8wqZ9S+KYIDP1f/Acef0zOGT1ADqF29iCvq5Aea9IGTfEUoDWn5AeYR8JXZWUNmnPXSUFAj/fbcKDfMPRm8r4DFxMsCx4VsYLkyXJ7zjOo+Hmu1UZK1qhm07n+vLz5Qwa7hrsIbdFwhlw+d0fy1lYArNePkRsbuJQ+b5xB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743134450; c=relaxed/simple;
	bh=pDaPWywyqyaz237NQye6X+8VLH8zRc47wHGHvihEDzI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVzWVIcWaNBarO+MiAmU5wQ3/QY6yjLT64r41ihc2owZy/AkffrTkgkLjEt77Crx4F/7jGt0RskdTNmXz05ekv2GfJgMJXotG5By83oja/yPJFDmlRgF2vnPKQtIoYuDV24H46QvUEThW7i1D5IzrdQO6itqSJnOm3rciPGZX6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0216EC4CEE4;
	Fri, 28 Mar 2025 04:00:48 +0000 (UTC)
Date: Fri, 28 Mar 2025 00:00:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>, Vincent Donnefort
 <vdonnefort@google.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
Message-ID: <20250328000047.58109225@batman.local.home>
In-Reply-To: <CAHk-=wio-SF6dm+QeBW7HN7TFOK1noEm_EVob2UGyUwRYz=L9Q@mail.gmail.com>
References: <20250327171037.032bf7e7@gandalf.local.home>
	<CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
	<20250327212447.24e05e7e@batman.local.home>
	<CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
	<20250327220106.37c921ea@batman.local.home>
	<CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
	<CAHk-=wjhT_xPdATLmfmdWCM7gKApvTyino_ffko5z1YumJDAHA@mail.gmail.com>
	<20250327230104.660a4b35@batman.local.home>
	<CAHk-=wh3VnL5Rpuh7tCitOKYDPqWoucFNCh6b3-JR6qZtxCiCw@mail.gmail.com>
	<CAHk-=wio-SF6dm+QeBW7HN7TFOK1noEm_EVob2UGyUwRYz=L9Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Adding Vincent who did the user space memory mapping code, and is
working on having pKVM hyperviser mapping with this as well.

Some background too. The user space memory mapping work came out of a
discussion between Vincent and I at the tracing summit in 2023. Where
pKVM adds a hypervisor context that is not the kernel. It acts as a go
between of the kernel (host) and the guest, were the kernel does not
have access to the guest memory, nor to the hypervisor memory. But just
like user space, memory between the kernel and the hypervisor can be
mapped to each.

As the hypervisor is a black box, Vincent was looking for a way to add
tracing to it where the kernel can't manipulate the pages but can read
the hypervisor trace content. When discussing this, we found that this
had the same requirements as memory mapping the buffer with user space,
and since that was a long time request for tooling that only read the
buffer and never saved it, we decided to do the work with user space
and eventual move it to the pKVM hypervisor.

The code is going to be split up a bit to allow the hypervisor to use
some of it. That was destined for 6.16 as well.

Since Vincent has working code for pKVM, and this may change, not to
mention that he's the original author of this code, it would be good
for him to see if he can also clean up this code in the process ;-)

Vincent,

The code for memory mapping needs to be cleaned up a bit. Namely, the
fact that we have two ways to map the ring buffer (one using the normal
kernel allocation the other with physically mapped memory). Ideally we
should keep track of the pages a bit better. I can fix up the
physically mapped memory part, but I'm not sure how this is going to
affect the pKVM changes you are making.

-- Steve


On Thu, 27 Mar 2025 20:36:00 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 27 Mar 2025 at 20:19, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Thu, 27 Mar 2025 at 20:01, Steven Rostedt <rostedt@goodmis.org> wrote:  
> > >
> > > Are you OK with the idea of moving the mapping code into the ring
> > > buffer code (which I think is cleaner) and then keeping track of that
> > > to get to the pages with the helper function?
> > >
> > > struct page *rb_get_page(struct trace_buffer *buffer, unsigned long addr)
> > > {
> > >         if (buffer->flags & RB_FL_PHYSICAL) {
> > >                 addr -= buffer->vmap_start;
> > >                 addr += buffer->phys_start;
> > >                 return pfn_to_page(addr >> PAGE_SHIFT);
> > >         }
> > >         return virt_to_page(addr);
> > > }  
> >
> > I think that would have been *enormously* better, yes  
> 
> .. actually, thinking a bit more about it, I think you want another
> level of abstraction to deal with the chunking side (ie I think you
> want to make the subbuf_ids[] thing explicit and the 'page order' as
> well).
> 
> So you have that 'meta_buffer' thing for the first page, but you also
> have that subbuf_ids[] array with pages chunked by 'order'), and I
> think you need another level of abstraction for those.
> 
> IOW, you'd have 'rb_get_meta_buffer_page()' for the first page, and
> then something like 'rb_get_buffer_page()' for the subbuf_id[] thing.
> 
> Or something in that direction. I didn't look *too* closely at what
> the code actually needs, I'm just trying to make sure that you don't
> pass random kernel addresses around, but something more structured.
> 
> Preferably maybe just the page index *within* the ring buffer,
> perhaps, and have the helper function do the whole "is this the meta
> buffer or one of the subbuf_id things"?
> 
> Hmm?
> 
> More clear abstraction is what I'm looking for, in other words.
> 
>               Linus

