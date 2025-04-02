Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6DD537FF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743623015; cv=none; b=tFrsiKMsxf+9os9IoBWZfTxZRhSEigL/6ROit9NlexcJ8/dC9+lAKZ+OpVAhfHOegFt1uGhBA1bgPZ2IMtkCX26MovyOM1dBpmaCYAG/0VGIbXOgpAKRtCTmaUCK/C7L05uoOxKZqL+ojJode0svWmMzPYfM3FtpgRYRRYgfgbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743623015; c=relaxed/simple;
	bh=Z690YHD6rT0c5u1gkMgmx/NvQAQ595ayecrhytvUoP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQ3EhnoEdJ8cot19FdeDvUac4B+7jurh9/iuxVh0XbSc9wOa8wn6u7IM/8uAE3EL900xy56jfRpA8oRbhs/bqrzaEJ4C3oP5eXDxca+Ad6m7l8jQ2uJdvEl6DE8q6+6lh8JKnyrgrfH23cUV4iqBWcbfccRG+obzx4Ob8OK3rlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AAAC4CEDD;
	Wed,  2 Apr 2025 19:43:32 +0000 (UTC)
Date: Wed, 2 Apr 2025 15:44:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Petr Mladek
 <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, John
 Ogness <john.ogness@linutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <20250402154435.5b0aad22@gandalf.local.home>
In-Reply-To: <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
	<CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
	<Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
	<CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
	<CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Apr 2025 12:10:08 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> People sometimes argue that it's good for belated Ack's etc. But
> Christ - they are *belated*.

I would also argue that it's good for the actual ack, because it gives you
a link back to email were it was likely acked, in case you want to confirm
it was acked.

Also, it's a case to prove Cc's, as there's been times that I've seen
someone add a "Cc:" to the commit log but not actually Cc the person in the
email!

My scripts do add the link back to the submission, but I also make it a
point to separate out Link: tags that hold actual discussions that happened
outside the patch submission.

For example, my last patch post had:

    ring-buffer: Use flush_kernel_vmap_range() over flush_dcache_folio()
    
    Some architectures do not have data cache coherency between user and
    kernel space. For these architectures, the cache needs to be flushed on
    both the kernel and user addresses so that user space can see the updates
    the kernel has made.
    
    Instead of using flush_dcache_folio() and playing with virt_to_folio()
    within the call to that function, use flush_kernel_vmap_range() which
    takes the virtual address and does the work for those architectures that
    need it.
    
    This also fixes a bug where the flush of the reader page only flushed one
    page. If the sub-buffer order is 1 or more, where the sub-buffer size
    would be greater than a page, it would miss the rest of the sub-buffer
    content, as the "reader page" is not just a page, but the size of a
    sub-buffer.
    
    Link: https://lore.kernel.org/all/CAG48ez3w0my4Rwttbc5tEbNsme6tc0mrSN95thjXUFaJ3aQ6SA@mail.gmail.com/
    
    Cc: stable@vger.kernel.org
>   Cc: Linus Torvalds <torvalds@linux-foundation.org>
>   Cc: Masami Hiramatsu <mhiramat@kernel.org>
>   Cc: Mark Rutland <mark.rutland@arm.com>
>   Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>   Cc: Andrew Morton <akpm@linux-foundation.org>
>   Cc: Vincent Donnefort <vdonnefort@google.com>
>   Cc: Vlastimil Babka <vbabka@suse.cz>
>   Cc: Mike Rapoport <rppt@kernel.org>
>   Link: https://lore.kernel.org/20250402144953.920792197@goodmis.org
    Fixes: 117c39200d9d7 ("ring-buffer: Introducing ring-buffer mapping functions");
    Suggested-by: Jann Horn <jannh@google.com>
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

The above ">" lines are added by my scripts. The top Link: is the
discussion (which I keep separate as it is easy to see and is used for
people wanting to see the discussion that was not part of the submission)
where as the bottom Link points to the patch submission which sometimes
also includes the discussion. That is, the Link that is above the other
tags is to the discussion that was likely what was the reason for this
patch to be created.

One case where this is also useful for my work flow, is that when I do a
new version, I will use that bottom link to cut and paste it in my
submission of the second version, by changing it to:

  Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
  ---
  Change since v5: https://lore.kernel.org/linux-trace-kernel/20250401225842.261475465@goodmis.org/

  - Use %pa instead of %lx for start and size sizes (Mike Rapoport)


Where I moved the bottom Link from patch v5 below the "---" and added the
Changes since v5: with that link to v5. Now, if you go from the git Link to
the submission, you also get a link to the previous version, which probably
has a discussion on why it was changed. And that link has a link to the
previous submission from that.

Hence, the Link tags hold the chain to get you to every version of the
patch. In a lot of the cases, the earlier versions have the discussions.

Note, for patch series, I sometimes do not have the individual patches
have the link back to the previous version, but I make sure the cover
letter does have the link back to the previous version.

In practice, I have found this very useful and has given me the history of
the change that landed in git.

Automating the Link tags and making sure every new version has a link to
the previous version will likely take you to the discussions to why the
patch was written the way it was written.

-- Steve
