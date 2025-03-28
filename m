Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4356C1B95B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130868; cv=none; b=tru6h4pDO3mwezNsPwRS4MCFG9JvalppcxawgXioU4B2qppITY4BNksPR/VtKTIJi89uxkqlkrl8acBKAdTnzSRn/h3BL6UFHBLV+1I+Q1mYqLY6dbYAePuFG5CqcGsjQW/PvUuh6JtyNNVLGpH1CBtU9+J8rAftX8i1MDH6Dkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130868; c=relaxed/simple;
	bh=vc3KMrbx1MaWhkCTeaxpwqhEaD1Hg8QfUyJjf/55Avg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4Zsm2kcNEt82muBtPamm6XNsFQpBgy6Q8aNWz+iM7G7NR4AL+ZsuEbreJypjCK6yWfLOc49Q6WSxzGO6rxEIN4khv27c3kzm68uBPcb1WWUW7rUDa8UIBv+v5LlRYiMu/o9dMV+KN/K6K8d/YEoS7mLteCScNGzNBGCatPRWGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54F8C4CEE4;
	Fri, 28 Mar 2025 03:01:05 +0000 (UTC)
Date: Thu, 27 Mar 2025 23:01:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
Message-ID: <20250327230104.660a4b35@batman.local.home>
In-Reply-To: <CAHk-=wjhT_xPdATLmfmdWCM7gKApvTyino_ffko5z1YumJDAHA@mail.gmail.com>
References: <20250327171037.032bf7e7@gandalf.local.home>
	<CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
	<20250327212447.24e05e7e@batman.local.home>
	<CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
	<20250327220106.37c921ea@batman.local.home>
	<CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
	<CAHk-=wjhT_xPdATLmfmdWCM7gKApvTyino_ffko5z1YumJDAHA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 19:19:33 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 27 Mar 2025 at 19:17, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > But NO, that is *not* what is used by the code.
> >
> > You literally use "struct page *" whenever you want to mmap it.
> >
> > If the *only* thing that was used was the virtual address, this
> > wouldn't be a discussion.  
> 
> Just to clarify: if you don't mmap this into user space, then that's
> fine. Then you can keep just the kernel virtual address.
> 
> And I already told you that that is one option: just don't mmap.

When I found that the physical memory mapped code when mapped to user
space was causing crashes as the virt_to_page() code didn't work with
vmap(), that was exactly what I did, and mentioned that it would be an
easy fix, but I guess not in a way you liked.

 https://lore.kernel.org/all/20250215144719.404616dc@batman.local.home/

- Prevent mmap()ing persistent ring buffer

  The persistent ring buffer uses vmap() to map the persistent memory.
  Currently, the mmap() logic only uses virt_to_page() to get the page
  from the ring buffer memory and use that to map to user space. This works
  because a normal ring buffer uses alloc_page() to allocate its memory.
  But because the persistent ring buffer use vmap() it causes a kernel
  crash.  Fixing this to work with vmap() is not hard, but since mmap() on
  persistent memory buffers never worked, just have the mmap() return
  -ENODEV (what was returned before mmap() for persistent memory ring
  buffers, as they never supported mmap. Normal buffers will still allow
  mmap(). Implementing mmap() for persistent memory ring buffers can wait
  till the next merge window.

> 
> But as long as you insist on mmaping the buffer into user space, you
> follow the rules. And the rules are that you don't play games. You do
> this RIGHT, or you don't do it at all.

Are you OK with the idea of moving the mapping code into the ring
buffer code (which I think is cleaner) and then keeping track of that
to get to the pages with the helper function?

struct page *rb_get_page(struct trace_buffer *buffer, unsigned long addr)
{
	if (buffer->flags & RB_FL_PHYSICAL) {
		addr -= buffer->vmap_start;
		addr += buffer->phys_start;
		return pfn_to_page(addr >> PAGE_SHIFT);
	}
	return virt_to_page(addr);
}

It doesn't keep track of the pages themselves, as then I would need to
keep track of both the virtual and physical addresses. But since the
pages are either allocated via page_alloc() and converted by
page_address(), or is mapped on a physically contiguous memory area,
where the physical address can be easily calculated.

Or is this too hacky for you?

> 
> And you don't lie about things and claim that the only thing that is
> used is the kernel virtual address.

I didn't say the "only thing" I said most of the code. The memory
mapping to user space is very new, and used for tooling that is doing
streaming, where it consumes the data without saving it. It is only
using it for calculations, where memory mapping is faster than reading
as is doesn't have the overhead of a copy. But as this is new, it feels
like an exception and not the rule. Hence, why I said most of the code
doesn't care about struct page. Maybe you see this as lying, but to me,
it's simply my point of view.

-- Steve
