Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3C29E115
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866737; cv=none; b=Zt5r3SawkwETfGmyxArZokxvPJmGwukPFf7L/zmUJoRFFGZfYvPyMu30VUBjUoypJrEH49+qxV6DtQVRPT4jJNXGejGit2dXteoZ2v5mBmjzEHsfJ1WVjjclDM57GV5/fO7fIdnL6O0b0gotpOYtANKdWoVWWMY1fojw25y2Ak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866737; c=relaxed/simple;
	bh=2dEZxA9znoi4/j5ZU/wsEM4CqiVDW+cT8z82gn8Ynjg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hbz/xY05LpjpJPMHFEDfoPNnDV+HoUdza97Od5PEujzskuqDf4N8RGYOiRn6DtIEnZm2GEdL0n01tp3WWo/SemczUHjsA21IrfEjl3ANJ2QeajamKv1KAe+90jBXZtCuuZt8V/Nid9F+re/9++8Yb+hW0Tiv5RiJyP9Xk1xd1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YQ7j0L7b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YQ7j0L7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750866734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UprNKi29neeOtDuoBhXpguAmiHeVIiz0UMx6QLlk6uM=;
	b=YQ7j0L7b1ulUgjcyrspFipMTFJleTbAa80l3DsGCYvnA/Bt1FAqoeyA+M/vMgrfqHt1sql
	/emDf1VJcKmNtfKlSQvyg8bLvws3Q1CN2SnnRwW38hXIipysorPgAP/tsw2BGyl/I5HG2J
	kv7JKe26Wdh1zGWd4SN8g+gKvPc8uYs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-BGOi_mIoOfmPUAMFk8NzsQ-1; Wed, 25 Jun 2025 11:52:12 -0400
X-MC-Unique: BGOi_mIoOfmPUAMFk8NzsQ-1
X-Mimecast-MFC-AGG-ID: BGOi_mIoOfmPUAMFk8NzsQ_1750866730
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so6368939a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866727; x=1751471527;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UprNKi29neeOtDuoBhXpguAmiHeVIiz0UMx6QLlk6uM=;
        b=b/evZQEIAG51eXhxoh86wqpVrAKYVl7w6a0uRKx3xAYKkrc+kPQVENRDilXMi9fvzg
         zIhWrKTzjdu62o+95mZnYDPdS6ZZpYeAoAJXG4+OedoTEc6xlPpcKlfFeX54CpQqXaNP
         bv5lD5fQCFzjayNLr4u5lOAI/l8oLR/s5wnZY1Oqj8Fq6GKc2Ugj+5H4u6YR/utjZqnF
         R0Z/81sp+v3ZXd8ZTNQm9P6bHqob48Ojo+MLIDUDMJPPVZ5FT2r+yZ5yX0Snqw/VD4b1
         EZj27fTlUyoAtec/WjLUrxK3+wCenSXo0AknFmROV54avqP0Wj+f+Vx7pY2MYpzFdiAL
         ApOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhvDzU5xhxPHIR146qfb8Zfn7Dx42T2/NeUaE61NJKF4OapEVlqoiIL9WschdtShSTD69g4OYo/RN2KdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzST5niFq5V5kvE5aHo2Fz98HmlUI14nWNQncGcS2jvjvXotBA
	SgPlJQ9N1EapXpthhw76tVfuv0v1pbt+8QRYzpAxN99/rcMyQNBWFjEraAk8KX5N/9HLZ9lL0RZ
	k0SKRB8khlNpfugCshskHaF4RM/xsEqexZ0LDjg1o2NsB3uwg2o+r0HovR9upU7m6HOWP0t3xUQ
	Ie
X-Gm-Gg: ASbGncsHL+Rc5025y/DeiO46XrFE4H5Og5UB0+cVbqnt4M/xmb1M/WWdiJkZ6sSTPH1
	6sBNs4Gou0xoo7TF12ToDxGGuLzQAZDACYOFqFhKzackOI2lY50gx4BMd8dauVLlH2JN1FYmu6/
	fWO0WXQ451wSvWutTk3ydA1jk89YHoqZHpxSZpLqGLxSqlbU4f0NVNn5jKqxZI1VOfssrxDWKF1
	1J+2uBoYNLkCwD++Q8KCZjrsOvdzkgRlj7H72Cwf6R6K+scQw43PkXjZRSnvE6UtRNsraE6EY1H
	SYT7P28qDOoNMqVekoRikn6c5qvRTwTPqy97IZMf7iESczwj/eRPl+/MQOJsFcN6v0yk
X-Received: by 2002:a17:90b:1fce:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-315f269fa68mr4355050a91.32.1750866727502;
        Wed, 25 Jun 2025 08:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGglaSDui+roskZocwG9xuSyfP0Kpa0z0xiQ8gfEl8NwUolpzM/PIXW3EJfCfspj5HFPWW0bw==
X-Received: by 2002:a17:90b:1fce:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-315f269fa68mr4355024a91.32.1750866727029;
        Wed, 25 Jun 2025 08:52:07 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53ea827sm2146576a91.41.2025.06.25.08.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:52:05 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <c649c8ec-6c1b-41a3-90c5-43c0feed7803@redhat.com>
Date: Wed, 25 Jun 2025 11:52:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] Introduce simple hazard pointers
To: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, lkmm@lists.linux.dev
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
 Breno Leitao <leitao@debian.org>, aeh@meta.com, netdev@vger.kernel.org,
 edumazet@google.com, jhs@mojatatu.com, kernel-team@meta.com,
 Erik Lundgren <elundgren@meta.com>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <20250625031101.12555-2-boqun.feng@gmail.com>
Content-Language: en-US
In-Reply-To: <20250625031101.12555-2-boqun.feng@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/25 11:10 PM, Boqun Feng wrote:
> As its name suggests, simple hazard pointers (shazptr) is a
> simplification of hazard pointers [1]: it has only one hazard pointer
> slot per-CPU and is targeted for simple use cases where the read-side
> already has preemption disabled. It's a trade-off between full features
> of a normal hazard pointer implementation (multiple slots, dynamic slot
> allocation, etc.) and the simple use scenario.
>
> Since there's only one slot per-CPU, so shazptr read-side critical
> section nesting is a problem that needs to be resolved, because at very
> least, interrupts and NMI can introduce nested shazptr read-side
> critical sections. A SHAZPTR_WILDCARD is introduced to resolve this:
> SHAZPTR_WILDCARD is a special address value that blocks *all* shazptr
> waiters. In an interrupt-causing shazptr read-side critical section
> nesting case (i.e. an interrupt happens while the per-CPU hazard pointer
> slot being used and tries to acquire a hazard pointer itself), the inner
> critical section will switch the value of the hazard pointer slot into
> SHAZPTR_WILDCARD, and let the outer critical section eventually zero the
> slot. The SHAZPTR_WILDCARD still provide the correct protection because
> it blocks all the waiters.
>
> It's true that once the wildcard mechanism is activated, shazptr
> mechanism may be downgrade to something similar to RCU (and probably
> with a worse implementation), which generally has longer wait time and
> larger memory footprint compared to a typical hazard pointer
> implementation. However, that can only happen with a lot of users using
> hazard pointers, and then it's reasonable to introduce the
> fully-featured hazard pointer implementation [2] and switch users to it.
>
> Note that shazptr_protect() may be added later, the current potential
> usage doesn't require it, and a shazptr_acquire(), which installs the
> protected value to hazard pointer slot and proves the smp_mb(), is
> enough for now.
>
> [1]: M. M. Michael, "Hazard pointers: safe memory reclamation for
>       lock-free objects," in IEEE Transactions on Parallel and
>       Distributed Systems, vol. 15, no. 6, pp. 491-504, June 2004
>
> Link: https://lore.kernel.org/lkml/20240917143402.930114-1-boqun.feng@gmail.com/ [2]
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>   include/linux/shazptr.h  | 73 ++++++++++++++++++++++++++++++++++++++++
>   kernel/locking/Makefile  |  2 +-
>   kernel/locking/shazptr.c | 29 ++++++++++++++++
>   3 files changed, 103 insertions(+), 1 deletion(-)
>   create mode 100644 include/linux/shazptr.h
>   create mode 100644 kernel/locking/shazptr.c
>
> diff --git a/include/linux/shazptr.h b/include/linux/shazptr.h
> new file mode 100644
> index 000000000000..287cd04b4be9
> --- /dev/null
> +++ b/include/linux/shazptr.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Simple hazard pointers
> + *
> + * Copyright (c) 2025, Microsoft Corporation.
> + *
> + * Author: Boqun Feng <boqun.feng@gmail.com>
> + *
> + * A simple variant of hazard pointers, the users must ensure the preemption
> + * is already disabled when calling a shazptr_acquire() to protect an address.
> + * If one shazptr_acquire() is called after another shazptr_acquire() has been
> + * called without the corresponding shazptr_clear() has been called, the later
> + * shazptr_acquire() must be cleared first.
> + *
> + * The most suitable usage is when only one address need to be protected in a
> + * preemption disabled critical section.
> + */
> +
> +#ifndef _LINUX_SHAZPTR_H
> +#define _LINUX_SHAZPTR_H
> +
> +#include <linux/cleanup.h>
> +#include <linux/percpu.h>
> +
> +/* Make ULONG_MAX the wildcard value */
> +#define SHAZPTR_WILDCARD ((void *)(ULONG_MAX))
> +
> +DECLARE_PER_CPU_SHARED_ALIGNED(void *, shazptr_slots);
> +
> +/* Represent a held hazard pointer slot */
> +struct shazptr_guard {
> +	void **slot;
> +	bool use_wildcard;
> +};
> +
> +/*
> + * Acquire a hazptr slot and begin the hazard pointer critical section.
> + *
> + * Must be called with preemption disabled, and preemption must remain disabled
> + * until shazptr_clear().
> + */
> +static inline struct shazptr_guard shazptr_acquire(void *ptr)
> +{
> +	struct shazptr_guard guard = {
> +		/* Preemption is disabled. */
> +		.slot = this_cpu_ptr(&shazptr_slots),
> +		.use_wildcard = false,
> +	};
> +
> +	if (likely(!READ_ONCE(*guard.slot))) {
> +		WRITE_ONCE(*guard.slot, ptr);
> +	} else {
> +		guard.use_wildcard = true;
> +		WRITE_ONCE(*guard.slot, SHAZPTR_WILDCARD);
> +	}
Is it correct to assume that shazptr cannot be used in a mixed context 
environment on the same CPU like a task context and an interrupt context 
trying to acquire it simultaneously because the current check isn't 
atomic with respect to that?
> +
> +	smp_mb(); /* Synchronize with smp_mb() at synchronize_shazptr(). */
> +
> +	return guard;
> +}
> +
> +static inline void shazptr_clear(struct shazptr_guard guard)
> +{
> +	/* Only clear the slot when the outermost guard is released */
> +	if (likely(!guard.use_wildcard))
> +		smp_store_release(guard.slot, NULL); /* Pair with ACQUIRE at synchronize_shazptr() */
> +}

Is it better to name it shazptr_release() to be conformant with our 
current locking convention?

Cheers,
Longman

