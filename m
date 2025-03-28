Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F67462
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166170; cv=none; b=s2HlcdyBuwjcRb2LI/C05ucNWbGQ95llAcKYnUJS4CicXSYWOfFkUuvHEyRwYqbhjkwd08cMfWLFzkoY+08LY4hUURPP0xRnOF28sNTvrhwAzLKO01jMv6EH0k/Ml728k6Txvbr2pWAQo6Ehh19x1KlDiwJNwzzIYCrbnKpHj8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166170; c=relaxed/simple;
	bh=Riou5R4ifOy+z9yJU1kljmBEAWRUsBI/I6rfdHoLPng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCLxFlDjt6PfegL1ppblJGxcZUPXDkm3erGPtotEwDRR7lBIUhh4seWBeiBNJElxUU5xGx5xQ4AEDLQWzOk4ihf8RZM59snCkIKmKmlbmK48AvnDrYLvKwo2EwTVtlbSJ0rmUQjOdnK0YnUEhV64yEmFRY9NU1CBKi39uCrfn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC63BC4CEE4;
	Fri, 28 Mar 2025 12:49:27 +0000 (UTC)
Date: Fri, 28 Mar 2025 08:50:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
Message-ID: <20250328085018.50d84db9@gandalf.local.home>
In-Reply-To: <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
References: <20250327171037.032bf7e7@gandalf.local.home>
	<CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
	<20250327212447.24e05e7e@batman.local.home>
	<CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
	<20250327220106.37c921ea@batman.local.home>
	<CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

> Anyway, I'm not arguing any more. I'm telling you that this code will
> 
>  (a) not be pulled this merge window
> 
>  (b) not be pulled EVER unless you clean it up
> 
>  (c) you need to stop with this hackery

This entire debate was on the very first commit that allowed the persistent
ring buffer to be memory mapped by user space, which introduced the:

	if (virt_addr_valid((void *)cpu_buffer->subbuf_ids[s]))
		page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
	else
		page = vmalloc_to_page((void *)cpu_buffer->subbuf_ids[s]);

"hack" that you hate.

This commit was the first thing added as I wrote it right after fixing the
issue that caused it to crash when user space tried to map it. I basically
fixed it and forgot about it (which is why there were 5 instances of that
code, where I did plan on at least wrapping it, but forgot).

Most of the work was Masami's saving the module addresses in the persistent
ring buffer so that it can be retrieved after a crash. That code is totally
unrelated to this.

I just did a rebase removing this commit and one commit that fixed not
adding a typecast of a long to a pointer in virt_addr_valid() (yes, my
pseudo code had the same bug with the virt_to_page() but I didn't compile
it, I actually wrote that directly in the email).

No other commit depends on this commit. Are you fine with the rest of the
pull request? I can start running it through my tests without these changes.

-- Steve


