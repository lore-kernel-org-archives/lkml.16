Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D782A207A25
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481410; cv=none; b=uH/ZJ6E1FSM1lkQ26tMZGUR18+EZrmhMR7JXTTcGhLrVIZ2g1nltK1Ff+w772r/E/T/lCAiOtj4zj3zUModRUWmrbA44uUaf2DSlf38BK0xhY9g/kciVwIzXK0lmC2OZOIBsyq6BKRi8oNzWC5UZr4i1aWiZ+eECp3P5mvUYeRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481410; c=relaxed/simple;
	bh=+hANYyFQtx1EgGjBCpJ7MWJJnAreVe2idWvmWxuQ4/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8s/76ChpqHw9TuMJFEF89aUZfJL9qXFx7XqkB5l9lDw9uqNqRCVhUNfVZYcY1BMVvt6btXiejgqIaqciT/t+HMJJvpMUu8WGrF1Wb099uX9zYYR4wOIIgq0idB9uDuOq0/RWYJnE6E0iZWSIkz0aQHIgXdt7Dc5HIC3EnHfjWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JwlsYelQ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JwlsYelQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AN+3dNxn3MY1vaRKcmzsO/FoebdtS2q00kaPMAJNXwI=; b=JwlsYelQsGAowRchvEmrbJqvWi
	N2dCyoVbHLS81zxL37vsF9Hve9gKukrpxDIUKMow85qeaPxygI23ObMpgyc9zhhCHG0AqoxGoJAxR
	+N6h1veFBfJ2iRAXR2Ku7v0R11I4k3GKFKuuMbJcnTOeE+yA5xfcyQ3mHfhz+eIP15Cx0IvbYsI8N
	18Kmhz1iyA9iAMMp1AcNsBXJMbv73fiD0OY9p1MfXTnnQLAw33zlJTfOfPJt/oejvf208lYMEQ6XW
	KhHP+ft4T0/MdYCZSRukH0j+Ie7P2mwcLUU76yJOzWQU54tkoiNt+lUoNeVnf9E3lYNBBv+VuwGtP
	0qXxmS2Q==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uC3Xc-003uVS-F7; Mon, 05 May 2025 23:43:19 +0200
Message-ID: <7a0da763-08ae-4e3a-a630-2ce3d32e477e@igalia.com>
Date: Mon, 5 May 2025 18:43:16 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/21] futex: Move futex_queue() into
 futex_wait_setup()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-4-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250416162921.513656-4-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Em 16/04/2025 13:29, Sebastian Andrzej Siewior escreveu:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> futex_wait_setup() has a weird calling convention in order to return
> hb to use as an argument to futex_queue().
> 
> Mostly such that requeue can have an extra test in between.
> 
> Reorder code a little to get rid of this and keep the hb usage inside
> futex_wait_setup().
> 
> [bigeasy: fixes]
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

[...]

> diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
> index 25877d4f2f8f3..6cf10701294b4 100644
> --- a/kernel/futex/waitwake.c
> +++ b/kernel/futex/waitwake.c
> @@ -339,18 +339,8 @@ static long futex_wait_restart(struct restart_block *restart);
>    * @q:		the futex_q to queue up on
>    * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
>    */
> -void futex_wait_queue(struct futex_hash_bucket *hb, struct futex_q *q,
> -			    struct hrtimer_sleeper *timeout)
> +void futex_do_wait(struct futex_q *q, struct hrtimer_sleeper *timeout)

Update the name in the kernel doc comment as well. Also drop from the 
comment the part that says "futex_queue() and ..."

>   {
> -	/*
> -	 * The task state is guaranteed to be set before another task can
> -	 * wake it. set_current_state() is implemented using smp_store_mb() and
> -	 * futex_queue() calls spin_unlock() upon completion, both serializing
> -	 * access to the hash list and forcing another memory barrier.
> -	 */
> -	set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
> -	futex_queue(q, hb, current);
> -
>   	/* Arm the timer */
>   	if (timeout)
>   		hrtimer_sleeper_start_expires(timeout, HRTIMER_MODE_ABS);
> @@ -578,7 +568,8 @@ int futex_wait_multiple(struct futex_vector *vs, unsigned int count,
>    * @val:	the expected value
>    * @flags:	futex flags (FLAGS_SHARED, etc.)
>    * @q:		the associated futex_q
> - * @hb:		storage for hash_bucket pointer to be returned to caller
> + * @key2:	the second futex_key if used for requeue PI
> + * task:	Task queueing this futex
>    *
>    * Setup the futex_q and locate the hash_bucket.  Get the futex value and
>    * compare it with the expected value.  Handle atomic faults internally.
> @@ -589,8 +580,10 @@ int futex_wait_multiple(struct futex_vector *vs, unsigned int count,
>    *  - <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb is unlocked
>    */
>   int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
> -		     struct futex_q *q, struct futex_hash_bucket **hb)
> +		     struct futex_q *q, union futex_key *key2,
> +		     struct task_struct *task)
>   {
> +	struct futex_hash_bucket *hb;
>   	u32 uval;
>   	int ret;
>   
> @@ -618,12 +611,12 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
>   		return ret;
>   
>   retry_private:
> -	*hb = futex_q_lock(q);
> +	hb = futex_q_lock(q);
>   
>   	ret = futex_get_value_locked(&uval, uaddr);
>   
>   	if (ret) {
> -		futex_q_unlock(*hb);
> +		futex_q_unlock(hb);
>   
>   		ret = get_user(uval, uaddr);
>   		if (ret)
> @@ -636,10 +629,25 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
>   	}
>   
>   	if (uval != val) {
> -		futex_q_unlock(*hb);
> -		ret = -EWOULDBLOCK;
> +		futex_q_unlock(hb);
> +		return -EWOULDBLOCK;
>   	}
>   
> +	if (key2 && futex_match(&q->key, key2)) {
> +		futex_q_unlock(hb);
> +		return -EINVAL;

Please add this new ret value in the kernel doc too.
