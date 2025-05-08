Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264C1E4BE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736355; cv=none; b=FDvbyZ8qL3kGphLqu/arpeEPLWAgxUUCKZlLRP42wZli2BxyEzXrVGCb0XIZ3X5mVGclLjjdbRfAFFGc44DUQ9/6T0cGb9BgL7/6kw6S/Bk2UoZsIfseP2k5ZiapdTcXWwPJprngumcneKlNoHg3NjsivxILo8f9mwY3hFTmnis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736355; c=relaxed/simple;
	bh=Qji27TG4Wcaik19NZMo+zT027xVFBqGmH7nzbnpDhDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SX17S3r7XPnsjO8Zr7ZFNRr39jR9AXHWZbtPZkr2VKfqaC7W+Q5tJvASErHqeYlbDAu/lsR1qa5CfoN8XJofnJEztWkVh+toffy9FJSEurwDPrQo8gHs6zKjOg5ZMRnSrdENSEVm725ioPVtnMN3fpxZ738mnyYje1JVVT//gLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=R0ntjtPN; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="R0ntjtPN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/28+qjO1dkftAcZ35PQFRGingKQttWDhQN5Wxoccutc=; b=R0ntjtPNIMdZYgcubDxwnAy0iw
	vHAGlpfk9spdEEdEQDFKvRE5p7HxhB/+fd9RBX+oWijBz+avedxwU1k4uxdPQb7NjxtvSTfJb+IL9
	y2odHfI4rk8zDWuUIzRjx5vZj3WJr7vBslcMTDTZNhLQ60/+T8fOBEAkIUEFNOc68UQKq5e00ldkI
	zrn46MqMptyocW6EcZICXm0vmuXs0OvebopS8jHCKhHsMBvgJYPg4ywMog/w7pTgUvQ+JPIKz6ayR
	vLKAl3mLEuxeUyaleFclIJZxqSDZ+jbSlTkqCW8C7jXoF+M73poqKcor+nK9hyyUCXEMJxGxBZ+rP
	lF99P1OA==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uD7qf-005POI-CA; Thu, 08 May 2025 22:32:27 +0200
Message-ID: <986dcbc0-0505-496a-ae75-e0c1bd7c2725@igalia.com>
Date: Thu, 8 May 2025 17:32:24 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/21] futex: Allow to resize the private local hash
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250416162921.513656-15-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Em 16/04/2025 13:29, Sebastian Andrzej Siewior escreveu:
> The mm_struct::futex_hash_lock guards the futex_hash_bucket assignment/
> replacement. The futex_hash_allocate()/ PR_FUTEX_HASH_SET_SLOTS
> operation can now be invoked at runtime and resize an already existing
> internal private futex_hash_bucket to another size.
> 
> The reallocation is based on an idea by Thomas Gleixner: The initial
> allocation of struct futex_private_hash sets the reference count
> to one. Every user acquires a reference on the local hash before using
> it and drops it after it enqueued itself on the hash bucket. There is no
> reference held while the task is scheduled out while waiting for the
> wake up.
> The resize process allocates a new struct futex_private_hash and drops
> the initial reference. Synchronized with mm_struct::futex_hash_lock it
> is checked if the reference counter for the currently used
> mm_struct::futex_phash is marked as DEAD. If so, then all users enqueued
> on the current private hash are requeued on the new private hash and the
> new private hash is set to mm_struct::futex_phash. Otherwise the newly
> allocated private hash is saved as mm_struct::futex_phash_new and the
> rehashing and reassigning is delayed to the futex_hash() caller once the
> reference counter is marked DEAD.
> The replacement is not performed at rcuref_put() time because certain
> callers, such as futex_wait_queue(), drop their reference after changing
> the task state. This change will be destroyed once the futex_hash_lock
> is acquired.
> 
> The user can change the number slots with PR_FUTEX_HASH_SET_SLOTS
> multiple times. An increase and decrease is allowed and request blocks
> until the assignment is done.
> 
> The private hash allocated at thread creation is changed from 16 to
>    16 <= 4 * number_of_threads <= global_hash_size
> where number_of_threads can not exceed the number of online CPUs. Should
> the user PR_FUTEX_HASH_SET_SLOTS then the auto scaling is disabled.
> 
> [peterz: reorganize the code to avoid state tracking and simplify new
> object handling, block the user until changes are in effect, allow
> increase and decrease of the hash].
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   include/linux/futex.h    |   3 +-
>   include/linux/mm_types.h |   4 +-
>   kernel/futex/core.c      | 290 ++++++++++++++++++++++++++++++++++++---
>   kernel/futex/requeue.c   |   5 +
>   4 files changed, 281 insertions(+), 21 deletions(-)
> 

[...]

>   static int futex_hash_allocate(unsigned int hash_slots, bool custom)
> @@ -1273,16 +1442,23 @@ static int futex_hash_allocate(unsigned int hash_slots, bool custom)
>   	if (hash_slots && (hash_slots == 1 || !is_power_of_2(hash_slots)))
>   		return -EINVAL;
>   
> -	if (mm->futex_phash)
> -		return -EALREADY;
> -
> -	if (!thread_group_empty(current))
> -		return -EINVAL;
> +	/*
> +	 * Once we've disabled the global hash there is no way back.
> +	 */
> +	scoped_guard(rcu) {
> +		fph = rcu_dereference(mm->futex_phash);
> +		if (fph && !fph->hash_mask) {
> +			if (custom)
> +				return -EBUSY;
> +			return 0;
> +		}
> +	}
>   
>   	fph = kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
>   	if (!fph)
>   		return -ENOMEM;
>   
> +	rcuref_init(&fph->users, 1);
>   	fph->hash_mask = hash_slots ? hash_slots - 1 : 0;
>   	fph->custom = custom;
>   	fph->mm = mm;
> @@ -1290,26 +1466,102 @@ static int futex_hash_allocate(unsigned int hash_slots, bool custom)
>   	for (i = 0; i < hash_slots; i++)
>   		futex_hash_bucket_init(&fph->queues[i], fph);
>   
> -	mm->futex_phash = fph;

If (hash_slots == 0), do we still need to do all of this work bellow? I 
thought that using the global hash would allow to skip this.

> +	if (custom) {
> +		/*
> +		 * Only let prctl() wait / retry; don't unduly delay clone().
> +		 */
> +again:
> +		wait_var_event(mm, futex_pivot_pending(mm));
> +	}
> +
> +	scoped_guard(mutex, &mm->futex_hash_lock) {
> +		struct futex_private_hash *free __free(kvfree) = NULL;
> +		struct futex_private_hash *cur, *new;
> +
> +		cur = rcu_dereference_protected(mm->futex_phash,
> +						lockdep_is_held(&mm->futex_hash_lock));
> +		new = mm->futex_phash_new;
> +		mm->futex_phash_new = NULL;
> +
> +		if (fph) {
> +			if (cur && !new) {
> +				/*
> +				 * If we have an existing hash, but do not yet have
> +				 * allocated a replacement hash, drop the initial
> +				 * reference on the existing hash.
> +				 */
> +				futex_private_hash_put(cur);
> +			}
> +
> +			if (new) {
> +				/*
> +				 * Two updates raced; throw out the lesser one.
> +				 */
> +				if (futex_hash_less(new, fph)) {
> +					free = new;
> +					new = fph;
> +				} else {
> +					free = fph;
> +				}
> +			} else {
> +				new = fph;
> +			}
> +			fph = NULL;
> +		}
> +
> +		if (new) {
> +			/*
> +			 * Will set mm->futex_phash_new on failure;
> +			 * futex_private_hash_get() will try again.
> +			 */
> +			if (!__futex_pivot_hash(mm, new) && custom)
> +				goto again;

Is it safe to use a goto inside a scoped_guard(){}?


