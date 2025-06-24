Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77DC19D080
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750724259; cv=none; b=p4ehuAzoRpcmhNbcgPqkicqKm8D4aiGnlmBzzbUkTTEOlq3ufKtshazD/GtXxkA8cEWimbGK5PMDmlhFVrJ1bwbnUA4zQghEbmVoJwnJGh46lgck+gpoa5mE1EOJWSZhJcM7uHorpu93a0vZPPX82PBMu6tYqn+3V4iRxaK5ccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750724259; c=relaxed/simple;
	bh=o+v4lK1Ijp81f8YHyslKho/ngACy3vmkWV/zLRrVAJo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nnJX36r4fLkdDr6NGR7n1TcrV/kJcNdKAjG9rXiJyVVIVaxTcA2RK/mTsCZYE0vuf+kBUn6oIi9MlWAjoJ7xRCO1IUwskPeE7E+ctAz4ttMtmeIBJwsdQ77oOmelXC08pAqin1DlQJijyZXNAx8aas8oKV2Up4e3hXfZq9IeQkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p55P0z+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p55P0z+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE676C4CEEA;
	Tue, 24 Jun 2025 00:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750724258;
	bh=o+v4lK1Ijp81f8YHyslKho/ngACy3vmkWV/zLRrVAJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p55P0z+JRFL5pp9PD2HqnGNMfSFW7SSI0qHf2U3z3GM7VlrggFqN+vzMDR8a7ZxH8
	 rEAju40FWlxjaVY/RO+PJ3xVMeMKViCqxLWGQ6VNIvb2yItQacd4O4CQm4kgYS7sEW
	 3x4VGycouXtbl8pLtC83FgmzzvLdThzLllqYYw1tzDrWAgIttb2Ebjn1fhANRc59aC
	 ofeRsR9H7M7tniwEE/qcokBerA3CDNK8HMrAuQT0Jgm/xIRW+DlbyFaef8i7h/NHPR
	 BV3H+Tul0ym9DilUAujzYljY6mQrGYcKjnXv+DaVTgalB7SknhfAGwWQ3q4pv2HFR3
	 OH+bRecZsFy6A==
Date: Tue, 24 Jun 2025 09:17:31 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, zi.li@linux.dev, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, jstultz@google.com,
 kent.overstreet@linux.dev, leonylgao@tencent.com,
 linux-kernel@vger.kernel.org, longman@redhat.com, mhiramat@kernel.org,
 mingo@redhat.com, mingzhe.yang@ly.com, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, tfiga@chromium.org,
 will@kernel.org, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH RFC 1/3] locking/rwsem: make owner helpers globally
 available
Message-Id: <20250624091731.f4d3cf296943ce45e97a631f@kernel.org>
In-Reply-To: <20250612042005.99602-2-lance.yang@linux.dev>
References: <20250612042005.99602-1-lance.yang@linux.dev>
	<20250612042005.99602-2-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Jun 2025 12:19:24 +0800
Lance Yang <ioworker0@gmail.com> wrote:

> From: Lance Yang <lance.yang@linux.dev>
> 
> In preparation for extending blocker tracking to support rwsems, make the
> rwsem_owner() and is_rwsem_reader_owned() helpers globally available for
> determining if the blocker is a writer or one of the readers.
> 

Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks!

> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
>  include/linux/rwsem.h  | 12 ++++++++++++
>  kernel/locking/rwsem.c |  8 +++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
> index c8b543d428b0..544853bed5b9 100644
> --- a/include/linux/rwsem.h
> +++ b/include/linux/rwsem.h
> @@ -132,6 +132,18 @@ static inline int rwsem_is_contended(struct rw_semaphore *sem)
>  	return !list_empty(&sem->wait_list);
>  }
>  
> +#if defined(CONFIG_DEBUG_RWSEMS) || defined(CONFIG_DETECT_HUNG_TASK_BLOCKER)
> +/*
> + * Return just the real task structure pointer of the owner
> + */
> +extern struct task_struct *rwsem_owner(struct rw_semaphore *sem);
> +
> +/*
> + * Return true if the rwsem is owned by a reader.
> + */
> +extern bool is_rwsem_reader_owned(struct rw_semaphore *sem);
> +#endif
> +
>  #else /* !CONFIG_PREEMPT_RT */
>  
>  #include <linux/rwbase_rt.h>
> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> index 2ddb827e3bea..6cb29442d4fc 100644
> --- a/kernel/locking/rwsem.c
> +++ b/kernel/locking/rwsem.c
> @@ -181,11 +181,11 @@ static inline void rwsem_set_reader_owned(struct rw_semaphore *sem)
>  	__rwsem_set_reader_owned(sem, current);
>  }
>  
> -#ifdef CONFIG_DEBUG_RWSEMS
> +#if defined(CONFIG_DEBUG_RWSEMS) || defined(CONFIG_DETECT_HUNG_TASK_BLOCKER)
>  /*
>   * Return just the real task structure pointer of the owner
>   */
> -static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
> +struct task_struct *rwsem_owner(struct rw_semaphore *sem)
>  {
>  	return (struct task_struct *)
>  		(atomic_long_read(&sem->owner) & ~RWSEM_OWNER_FLAGS_MASK);
> @@ -194,7 +194,7 @@ static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
>  /*
>   * Return true if the rwsem is owned by a reader.
>   */
> -static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
> +bool is_rwsem_reader_owned(struct rw_semaphore *sem)
>  {
>  	/*
>  	 * Check the count to see if it is write-locked.
> @@ -205,7 +205,9 @@ static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
>  		return false;
>  	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
>  }
> +#endif
>  
> +#ifdef CONFIG_DEBUG_RWSEMS
>  /*
>   * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
>   * is a task pointer in owner of a reader-owned rwsem, it will be the
> -- 
> 2.49.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
