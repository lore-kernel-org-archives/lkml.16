Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABEE1E2853
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263360; cv=none; b=tsri+fDKREH1IT5+rR5oKPNKhSouVwoRv0yB6clRGBd0GbaS9wNfd9ooCsy4WRz6ykNKQn/YfmG/SVxQnXQO1i808MtU0EJ4T6V/uMCLnTEEC31Zh8v/v2b0lEBB1JAh3SxWauOec2X7YMWzfoeBP61RDft6fMi4QFdHSh87lS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263360; c=relaxed/simple;
	bh=dLi5JKR6ufG2dYi6XT+ewltmtm9RyIzmokJF9TH3Ar4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LEatgeELnWoRDES+AdGo/uQzjslkBSjb7ae8ks7HaIg0wSwmztLczuRQlkHNJH5hspIUVYLEYbpvcVqccSIZUQvjhz0ld5kDgqcRu9t7pfG2yJfwJFA/ObQRvc3AaB7n7dWD5pE6wlxAkROZ6STpx5OzQkEeeLYCHYIRFoJEyms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mwbM+Y1c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mwbM+Y1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AE6C4CEE4;
	Mon, 21 Apr 2025 19:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745263360;
	bh=dLi5JKR6ufG2dYi6XT+ewltmtm9RyIzmokJF9TH3Ar4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mwbM+Y1c8/Um6XJE5PIr7/KJSc4ZF1T8Ofe+t82hopbM2/W5RSWsig5rkPr6xboMD
	 0SNfju7JbXbnYE2gvo8oOGSaczBnNm76+Y+O7bQGMdXWOD2jRj/2ZfD1CBsif+euBQ
	 jwwDPKLZZ3+tRO/Nf45hl99WkP0iR0eOZzukLDfM=
Date: Mon, 21 Apr 2025 12:22:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lance Yang" <lance.yang@linux.dev>
Cc: "David Hildenbrand" <david@redhat.com>, mingzhe.yang@ly.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, "Lance Yang"
 <ioworker0@gmail.com>
Subject: Re: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
Message-Id: <20250421122239.710f5d63487853556cb8f57e@linux-foundation.org>
In-Reply-To: <641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
References: <20250418152228.20545-1-lance.yang@linux.dev>
	<20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
	<641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 21 Apr 2025 05:13:03 +0000 "Lance Yang" <lance.yang@linux.dev> wrote:

> > Can we just slap "#ifdef CONFIG_MM_ID" around the whole function? It
> > 
> > should have no callers, right? If the linker ends up complaining then
> > 
> > something went wrong.
> 
> The reason we can't simply add #ifdef CONFIG_MM_ID around folio_test_large_maybe_mapped_shared()
> is because its caller folio_maybe_mapped_shared() relies on IS_ENABLED(CONFIG_MM_ID).
> 
> If we do, with CONFIG_TRANSPARENT_HUGEPAGE=N, we'll hit compilation errors like:
> 
> ./include/linux/mm.h: In function ‘folio_maybe_mapped_shared’:
> ./include/linux/mm.h:2337:16: error: implicit declaration of function ‘folio_test_large_maybe_mapped_shared’; did you mean ‘folio_maybe_mapped_shared’? [-Werror=implicit-function-declaration]
>  2337 |         return folio_test_large_maybe_mapped_shared(folio);
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                folio_maybe_mapped_shared
> cc1: some warnings being treated as errors

That's OK - provide a declaration of folio_maybe_mapped_shared() but no
definition.  So the compiled-out code can be compiled and the linker
will confirm that it's never actually called.


