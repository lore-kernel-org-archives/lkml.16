Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E129A4C76
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775085; cv=none; b=VOuLg0vAChJVr9SbrhBVoR0Udiyl/4cIgQqe84gCwF6zPKDuY+4Te9Ws+DCSj55hSJU/9fXytaLx0JMNHEtX2ggov0Ge4FqLNX/ovZEMf7SU2Gzn2rkZawn7M6usWrRiuTKcBVhaa9XR14ZSAkO2oUCPcrn+st6rAj8YbUsLy7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775085; c=relaxed/simple;
	bh=ci0XTZC+lZLwMBG4GJcetQrouOA5OLoejddhV3v8paA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIgWk4DzyAJoZ6FreaSi1Oj5m65POBrimgWgqCfEc3CmOAIHa6HW+oR85g0+jp6uiqrWx60c+rC+EClwRgoDq1SqhnOxIfowOMCKDDzruJ5tbYG70VV3UZ7NclJZPkhuCXmR+KBNI5H2MkNGZttjTCZY+OI3gtvg8GUCcU+gw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFllq47I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFllq47I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA18C4CED6;
	Wed,  5 Feb 2025 17:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738775084;
	bh=ci0XTZC+lZLwMBG4GJcetQrouOA5OLoejddhV3v8paA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFllq47ItRXgIcQXZmLmcw0DPDNtl9nPsAOrYwVDTJKjUxHqiksvdo0al8ARggZUu
	 tor+VkXTdi1Tnzf4suHanT7u+/gmn2rwSMB6MzRbKznEa12X69QENvuycPH6t5D0EV
	 2pSj/uHYFje56vp/NSbpmvFrSRV5Rkf7NK+4dSp8wKRR8sM/j0yFb0jOLebSVDq0xj
	 tt5V8ACPtlQLi7Kd9Ufgm5Yk8mqO0IfPBesecRAWjfkdBcgfpmBniGJAQ0d1VwEpu6
	 NO1BoQqjluOYMV2/a9jfq65msyWZNoMUBqM7Gza5izYRKZRa5g7rQO/8dWEZLCOa/q
	 f21zs1O8HTUkg==
Date: Wed, 5 Feb 2025 18:04:41 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, vschneid@redhat.com, leitao@debian.org
Subject: Re: [PATCH RFC context_tracking] Make RCU watch
 ct_kernel_exit_state() warning
Message-ID: <Z6OaKXsPuyl2hO0J@localhost.localdomain>
References: <19bebbeb-db36-4801-bc3d-2c39989b6152@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19bebbeb-db36-4801-bc3d-2c39989b6152@paulmck-laptop>

Le Sat, Feb 01, 2025 at 10:44:02AM -0800, Paul E. McKenney a écrit :
> The WARN_ON_ONCE() in ct_kernel_exit_state() follows the call to
> ct_state_inc(), which means that RCU is not watching this WARN_ON_ONCE().
> This can (and does) result in extraneous lockdep warnings when this
> WARN_ON_ONCE() triggers.  These extraneous warnings are the opposite
> of helpful.
> 
> Therefore, invert the WARN_ON_ONCE() condition and move it before the
> call to ct_state_inc().  This does mean that the ct_state_inc() return
> value can no longer be used in the WARN_ON_ONCE() condition, so discard
> this return value and instead use a call to rcu_is_watching_curr_cpu().
> This call is executed only in CONFIG_RCU_EQS_DEBUG=y kernels, so there
> is no added overhead in production use.
> 
> Reported-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Valentin Schneider <vschneid@redhat.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>


> 
> diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> index 938c48952d26..fb5be6e9b423 100644
> --- a/kernel/context_tracking.c
> +++ b/kernel/context_tracking.c
> @@ -80,17 +80,16 @@ static __always_inline void rcu_task_trace_heavyweight_exit(void)
>   */
>  static noinstr void ct_kernel_exit_state(int offset)
>  {
> -	int seq;
> -
>  	/*
>  	 * CPUs seeing atomic_add_return() must see prior RCU read-side
>  	 * critical sections, and we also must force ordering with the
>  	 * next idle sojourn.
>  	 */
>  	rcu_task_trace_heavyweight_enter();  // Before CT state update!
> -	seq = ct_state_inc(offset);
> -	// RCU is no longer watching.  Better be in extended quiescent state!
> -	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && (seq & CT_RCU_WATCHING));
> +	// RCU is still watching.  Better not be in extended quiescent state!
> +	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !rcu_is_watching_curr_cpu());
> +	(void)ct_state_inc(offset);
> +	// RCU is no longer watching.
>  }
>  
>  /*
