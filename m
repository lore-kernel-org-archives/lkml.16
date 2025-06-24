Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472D29A9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750724787; cv=none; b=a63aIjjcFMYQZgKgE9eTczycj/rmpKajeUbHxOToegU4PJ3XZFC2KV+AUpheJH4TLUV5I5q2k3zsGOy6E+2Fz6OGMmX2XSm1AWaimVlmJK0AD5FVnySfSGrq7KVZ81gqIFwksxD7ppZx6Oy2gR0XQGEoqbbU7TDgag479eu0RR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750724787; c=relaxed/simple;
	bh=duEciue33Z3MQ56jPuP56Sm3bgLD49Omj4FwP8LeFsE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bBEK5xvFOuJXSL60TaQxG5b7JNKH7AfBXHWH3FF5cwgfSh34CbIgLPqWhzcYceZ8Q3Aslg6aP8aFTEuAcVXFsHWySLHnt8Zdi5r9V1dQCUXPxr4nT+GJsypFWx4fg4hhV7SPHorDDXbpwZn8O8L7kHj357M45pKTczpVNaYRN5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzBbh88T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzBbh88T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9914C4CEEA;
	Tue, 24 Jun 2025 00:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750724787;
	bh=duEciue33Z3MQ56jPuP56Sm3bgLD49Omj4FwP8LeFsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KzBbh88Tmn3X2r4aQ82Hir102RZIraA4Dq60iZi6pAL9AFH2pv7EeUAaM4cnyjnmh
	 MiSU1tKD3kIDdhwbKXM29iOJoZXip6TY8C57bDFOgSfQaGfKguXmVIeAMlfYy33nAr
	 epZACP7RcNKwqBakyp9Mz4a3lfxjxCiDr/Pvz4vHdL8r2nqSNz9EKGvsj2I3SgcYvx
	 GKIkCh24OE17fpMJujUfAxI6cqIjgfucTNGOpsm7W4C8ZokjWMiYc9u6tW+XXlFknY
	 F5/g6G1QLv8IMu2+V6GZ1BOWKjV4QMI3onGnHWvl2hLOvu29Uz0esuC0Ai3+clqceZ
	 2KSnmQlJX62+w==
Date: Tue, 24 Jun 2025 09:26:20 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, zi.li@linux.dev, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, jstultz@google.com,
 kent.overstreet@linux.dev, leonylgao@tencent.com,
 linux-kernel@vger.kernel.org, longman@redhat.com, mhiramat@kernel.org,
 mingo@redhat.com, mingzhe.yang@ly.com, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, tfiga@chromium.org,
 will@kernel.org, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH RFC 2/3] locking/rwsem: clear reader-owner on unlock to
 reduce false positives
Message-Id: <20250624092620.3346ac39e882434aafb0b93d@kernel.org>
In-Reply-To: <20250612042005.99602-3-lance.yang@linux.dev>
References: <20250612042005.99602-1-lance.yang@linux.dev>
	<20250612042005.99602-3-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 12:19:25 +0800
Lance Yang <ioworker0@gmail.com> wrote:

> From: Lance Yang <lance.yang@linux.dev>
> 
> When CONFIG_DETECT_HUNG_TASK_BLOCKER is enabled, a stale owner pointer in a
> reader-owned rwsem can lead to false positives in blocker tracking.
> 
> To mitigate this, let’s try to clear the owner field on unlock, as a NULL
> owner is better than a stale one for diagnostics.

Can we merge this to [PATCH 1/3]? It seems that you removed #ifdef and
remove it. This means in anyway we need the feature enabled by DEBUG_RWSEMS.

Thanks,

> 
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
>  kernel/locking/rwsem.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> index 6cb29442d4fc..a310eb9896de 100644
> --- a/kernel/locking/rwsem.c
> +++ b/kernel/locking/rwsem.c
> @@ -205,14 +205,12 @@ bool is_rwsem_reader_owned(struct rw_semaphore *sem)
>  		return false;
>  	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
>  }
> -#endif
>  
> -#ifdef CONFIG_DEBUG_RWSEMS
>  /*
> - * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
> - * is a task pointer in owner of a reader-owned rwsem, it will be the
> - * real owner or one of the real owners. The only exception is when the
> - * unlock is done by up_read_non_owner().
> + * With CONFIG_DEBUG_RWSEMS or CONFIG_DETECT_HUNG_TASK_BLOCKER configured,
> + * it will make sure that the owner field of a reader-owned rwsem either
> + * points to a real reader-owner(s) or gets cleared. The only exception is
> + * when the unlock is done by up_read_non_owner().
>   */
>  static inline void rwsem_clear_reader_owned(struct rw_semaphore *sem)
>  {
> -- 
> 2.49.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
