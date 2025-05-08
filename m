Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B3285418
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731220; cv=none; b=gAhGF+OwgZFgXwxTH6PYOnQaCyL+LJCbSRz9ic/wvmu+HtGiiSZ78kEVGga8mqrh8Tz1PFLiAq0ETh2hq5VJFHSBTgkJIeWdRQ1A8Xwzu05vZFjMeBR0U0kA35tmlakoEN+53Ai1kJQtqQwoS3J+w27fccB3q8sQYa8GuIH5Nr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731220; c=relaxed/simple;
	bh=SDw25esHimzbK0c3lNT2aG+VPxDaFxXMBZt6/6Z1uoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIBTYPXDD1oAonyAIkmOTfllJPYaVRvGmRpqQ1IEd6axoqngkEH/Xi3ZwkgzMnyZSeEmMVViVkavgXEjJpU+yWQ3Joyo8btEhluASi/m+B7F2Q6ryS0X1ee+njJdZuKRnN18B22E3m2n6OUrPymCCcxS5r522tKaD/nfsQwXkWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=eGUxP445; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="eGUxP445"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eyH7G/LMGai4+gSdq8gesc+I+KT+jSNBoL2FO4006ss=; b=eGUxP445i2QM/o4ndOHyqsdrdf
	EA1Nh8ty+2ORy+of09+XWBTxo3raHGw2rHIRWDCwT8ib3hTzcGD7stu+4P7EE6ppTo7L7i9fcdEKp
	fd/1aCKEvPNu071lBnakPFBMJ/eh8Dg3kSLWt/B4Xy3fPLZQsAex6HxGfxVbvQw1zqS2o3JKT4qQ/
	hz9fcTnuU+vj90294kgDxMVLtLOb7pEnV0PssjrD1YeCTNVRuBiqWsk1+9vS/aHiZSQM3ArA7k3Rd
	Plu3hkkPSN+Ck60n1/EwizEaPm6yA1MCACTEfO9Au7Km7opJFE7NM+pWBL+6sDVeSJ3MO0Ma6qGJk
	MuLzsw1g==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uD6VZ-005NFb-9I; Thu, 08 May 2025 21:06:34 +0200
Message-ID: <0cd48028-8eed-49c1-b4b8-798037457c8e@igalia.com>
Date: Thu, 8 May 2025 16:06:28 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 10/21] futex: Introduce futex_q_lockptr_lock()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-11-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250416162921.513656-11-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Em 16/04/2025 13:29, Sebastian Andrzej Siewior escreveu:
> futex_lock_pi() and __fixup_pi_state_owner() acquire the
> futex_q::lock_ptr without holding a reference assuming the previously
> obtained hash bucket and the assigned lock_ptr are still valid. This
> isn't the case once the private hash can be resized and becomes invalid
> after the reference drop.
> 
> Introduce futex_q_lockptr_lock() to lock the hash bucket recorded in
> futex_q::lock_ptr. The lock pointer is read in a RCU section to ensure
> that it does not go away if the hash bucket has been replaced and the
> old pointer has been observed. After locking the pointer needs to be
> compared to check if it changed. If so then the hash bucket has been
> replaced and the user has been moved to the new one and lock_ptr has
> been updated. The lock operation needs to be redone in this case.
> 
> The locked hash bucket is not returned.
> 
> A special case is an early return in futex_lock_pi() (due to signal or
> timeout) and a successful futex_wait_requeue_pi(). In both cases a valid
> futex_q::lock_ptr is expected (and its matching hash bucket) but since
> the waiter has been removed from the hash this can no longer be
> guaranteed. Therefore before the waiter is removed and a reference is
> acquired which is later dropped by the waiter to avoid a resize.
> 
> Add futex_q_lockptr_lock() and use it.
> Acquire an additional reference in requeue_pi_wake_futex() and
> futex_unlock_pi() while the futex_q is removed, denote this extra
> reference in futex_q::drop_hb_ref and let the waiter drop the reference
> in this case.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   kernel/futex/core.c    | 25 +++++++++++++++++++++++++
>   kernel/futex/futex.h   |  3 ++-
>   kernel/futex/pi.c      | 15 +++++++++++++--
>   kernel/futex/requeue.c | 16 +++++++++++++---
>   4 files changed, 53 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index 5e70cb8eb2507..1443a98dfa7fa 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -134,6 +134,13 @@ struct futex_hash_bucket *futex_hash(union futex_key *key)
>   	return &futex_queues[hash & futex_hashmask];
>   }
>   
> +/**
> + * futex_hash_get - Get an additional reference for the local hash.
> + * @hb:                    ptr to the private local hash.
> + *
> + * Obtain an additional reference for the already obtained hash bucket. The
> + * caller must already own an reference.
> + */

This comment should come with patch 6 (that creates the function) or 
patch 14 (that implements the function).

>   void futex_hash_get(struct futex_hash_bucket *hb) { }
>   void futex_hash_put(struct futex_hash_bucket *hb) { }
>   
> @@ -615,6 +622,24 @@ int futex_unqueue(struct futex_q *q)
>   	return ret;
>   }
>   
> +void futex_q_lockptr_lock(struct futex_q *q)
> +{
> +	spinlock_t *lock_ptr;
> +
> +	/*
> +	 * See futex_unqueue() why lock_ptr can change.
> +	 */
> +	guard(rcu)();
> +retry:
> +	lock_ptr = READ_ONCE(q->lock_ptr);
> +	spin_lock(lock_ptr);
> +
> +	if (unlikely(lock_ptr != q->lock_ptr)) {
> +		spin_unlock(lock_ptr);
> +		goto retry;
> +	}
> +}
> +
>   /*
>    * PI futexes can not be requeued and must remove themselves from the hash
>    * bucket. The hash bucket lock (i.e. lock_ptr) is held.
> diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
> index bc76e366f9a77..26e69333cb745 100644
> --- a/kernel/futex/futex.h
> +++ b/kernel/futex/futex.h
> @@ -183,6 +183,7 @@ struct futex_q {
>   	union futex_key *requeue_pi_key;
>   	u32 bitset;
>   	atomic_t requeue_state;
> +	bool drop_hb_ref;

This new member needs a comment:

  * @drop_hb_ref:	True if an extra reference was acquired by a pi 
operation, and needs an extra put()
