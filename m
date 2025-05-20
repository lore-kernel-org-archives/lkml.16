Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EED21E0A2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747700494; cv=none; b=L7n0DBzeF+TAl6LJqL9YmGazbMv3xTGwytcT4odcoizzi+tWnmgH8oaImFYyrp88zv9X/UI2zB8Y1rgdo2IqeiTb1fRw+hZM/HwMxrcIbi3Xu9HJa22xbZqGJnRbdxSTWfBSzsXs6r8m3GbTI+yrwS3KkO7+4D4TOJuFSHf7Qno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747700494; c=relaxed/simple;
	bh=h8xahNqcwqcK2Vll16ny2anHesIxJ0V+5Fdlg3phe34=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LDAQfrCsdhw/yQ8NkzMZu+VU0y5Pbg2cY7S+OjyRgzl6JoJZeL7DOhigxxt5F11w8O7UizdIaFzEFGhQFBIutC+TYKxk+pqhj/wwfyxCywyr3t62G5IKtm+C3t6Crkrok/mY5xhvAwM+vB7GjFoh5ycST4FAdugm5Si1wJlNa/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EmkMpA0B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EmkMpA0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0623C4CEE4;
	Tue, 20 May 2025 00:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747700493;
	bh=h8xahNqcwqcK2Vll16ny2anHesIxJ0V+5Fdlg3phe34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EmkMpA0Bhgrx4p/OGAPNLEnphHy1/QfuFwRUsMGDElV3cmnBAWb09S2O4NQvgKih2
	 jF9BExVDPITXIeSWOOA0igSj4XWu0svzvI8rVkVlBVXhKSj/vAGhDwPxXqcroyoOst
	 MEXsPO+fXdfGQPpYIlqSmdJYNJLACF392o2phvSg=
Date: Mon, 19 May 2025 17:21:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: kent.overstreet@linux.dev, 00107082@163.com, dennis@kernel.org,
 tj@kernel.org, cl@gentwo.org, pasha.tatashin@soleen.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] alloc_tag: allocate percpu counters for module tags
 dynamically
Message-Id: <20250519172132.c46b910bc10857c706866357@linux-foundation.org>
In-Reply-To: <CAJuCfpGgwkAVZJJ-ffLdkBfmggm3=d+Z450matW=TzeQZJ=LDQ@mail.gmail.com>
References: <20250517000739.5930-1-surenb@google.com>
	<20250519155145.8378a397a755c1cc5a3e2d4e@linux-foundation.org>
	<CAJuCfpGgwkAVZJJ-ffLdkBfmggm3=d+Z450matW=TzeQZJ=LDQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 May 2025 16:13:28 -0700 Suren Baghdasaryan <surenb@google.com> wrote:

> > > Fixes: 0db6f8d7820a ("alloc_tag: load module tags into separate contiguous memory")
> > > Reported-by: David Wang <00107082@163.com>
> > > Closes: https://lore.kernel.org/all/20250516131246.6244-1-00107082@163.com/
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  include/linux/alloc_tag.h | 12 ++++++
> > >  include/linux/codetag.h   |  8 ++--
> > >  include/linux/percpu.h    |  4 --
> > >  lib/alloc_tag.c           | 87 +++++++++++++++++++++++++++++++--------
> > >  lib/codetag.c             |  5 ++-
> > >  5 files changed, 88 insertions(+), 28 deletions(-)
> >
> > Should we backport this fix into -stable kernels?  I'm thinking yes.
> 
> Yes, I should have CC'ed stable. The patch this one is fixing was
> first introduced in 6.13. I just tried and it applies cleanly to
> stable linux-6.13.y and linux-6.14.y.
> Should I forward this email to stable or send a separate patch to them?

I added cc:stable to the mm.git copy so all is OK.  That's the usual
workflow.
