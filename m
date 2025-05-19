Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F281E51EE
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695107; cv=none; b=EHZuc1ri5n1R28b4t2Pvc+/s9egTMSZ4ARTvlWvsRnAtO/G8HVvuntZjlt33ecX9etsbTDSQr2adT3clqOdnKzVGNC5wuzdDj45pzBjqZ9h4qVGOaAw63uJX6OrwtK/UXl8/g57VTj1ZZejfxzRWfpmSHnQTvbBfvpoLeCWaMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695107; c=relaxed/simple;
	bh=v4Wia9xCrnWWI5GZDNnqXasRaUvjMa17Oaiy7dpE2h8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EvjaBZf3CSx1XizrOuNuBdzIGmNolGyu6GsKTiVpsFaprSujJzHCOkWeGx432UNXKXax0MATstEHGsPGu48EatdnK/x3dq5p8FYxJfkSNN5ofugmMW+PgWzxaOcim4GmTz9a+bkibMT8/tCRXJC5J1vMlfflnMqH2Pnd29hWg9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZKWUgjiq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZKWUgjiq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540F8C4CEEF;
	Mon, 19 May 2025 22:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747695106;
	bh=v4Wia9xCrnWWI5GZDNnqXasRaUvjMa17Oaiy7dpE2h8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZKWUgjiq+Am/E7Rph+CjGcTLi/M0vSbdBKUd1z+hGvy5F5ZSxmIDY90AGRP1dDn4m
	 cp3cI580RSNzuXkrBDxQBXey8JxVgeL+zW/XvYVxF9EhyolZ05pb9MjysaQyaRoncc
	 ErVH4vr2xFfVsLP1JalSmP+tDQxIbVcNK6vRR8i0=
Date: Mon, 19 May 2025 15:51:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: kent.overstreet@linux.dev, 00107082@163.com, dennis@kernel.org,
 tj@kernel.org, cl@gentwo.org, pasha.tatashin@soleen.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] alloc_tag: allocate percpu counters for module tags
 dynamically
Message-Id: <20250519155145.8378a397a755c1cc5a3e2d4e@linux-foundation.org>
In-Reply-To: <20250517000739.5930-1-surenb@google.com>
References: <20250517000739.5930-1-surenb@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 May 2025 17:07:39 -0700 Suren Baghdasaryan <surenb@google.com> wrote:

> When a module gets unloaded it checks whether any of its tags are still
> in use and if so, we keep the memory containing module's allocation tags
> alive until all tags are unused. However percpu counters referenced by
> the tags are freed by free_module(). This will lead to UAF if the memory
> allocated by a module is accessed after module was unloaded. To fix this
> we allocate percpu counters for module allocation tags dynamically and
> we keep it alive for tags which are still in use after module unloading.
> This also removes the requirement of a larger PERCPU_MODULE_RESERVE when
> memory allocation profiling is enabled because percpu memory for counters
> does not need to be reserved anymore.
> 
> Fixes: 0db6f8d7820a ("alloc_tag: load module tags into separate contiguous memory")
> Reported-by: David Wang <00107082@163.com>
> Closes: https://lore.kernel.org/all/20250516131246.6244-1-00107082@163.com/
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/alloc_tag.h | 12 ++++++
>  include/linux/codetag.h   |  8 ++--
>  include/linux/percpu.h    |  4 --
>  lib/alloc_tag.c           | 87 +++++++++++++++++++++++++++++++--------
>  lib/codetag.c             |  5 ++-
>  5 files changed, 88 insertions(+), 28 deletions(-)

Should we backport this fix into -stable kernels?  I'm thinking yes.
