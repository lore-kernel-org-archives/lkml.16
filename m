Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04F02DCC0D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763597; cv=none; b=OJqJxogn6+3fnpo073fQiVPQd0Y2tSMBPqo0j5Z30FMCx41TuZnWrdpdEeUn3oPSmEpH4B5nbc6/rmaEX2lAXbjDKN3F852ZTomxPspFxlcqiFUCYYEF8o97T6AdQfLvXllPwKaQMVP/zO7/2SC4Vly/BH85u0/g/JFy8khiLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763597; c=relaxed/simple;
	bh=z9vBA3YsVpHiIKElLc6TODkLKSKyTHoadPnWVCCMMZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7zhBOwQWQGKsE1fX+F8zG3K2HuAcH/ZtdlLwc8gvkJF4UkiBytM2eCnvd5xdF5Ot01qrOW3eeKKqXPHXAeP3cenosZa9j8N2jVXIRAXl5IHwo4ZUOyf43A1ERL45F8ldKlujoVrYkY8rYOUm271/Y264gua4PCjeeo4w5tJwpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWcCBFHU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWcCBFHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748763595; x=1780299595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z9vBA3YsVpHiIKElLc6TODkLKSKyTHoadPnWVCCMMZo=;
  b=PWcCBFHU8S7o6rb1nx8PyhHHr3zzygY5jxH/EUvFMIsUThzsYCKoErgY
   qLE01cy07U+vNmQNd5oegJDgtmheGL+cmvUtoaFt8tFMruZ9olkTaePIn
   E8IbWwTCBlrOWXSTaKpYjsTQsBHWCPCdXkZp+wOhuVbu9csJ4cpYPMu1j
   oOAD+746WaraaFDEySLjvFshFCnjWz1PW2jdSNMg24oMNU8YIxVUw3uxY
   m6KWWmIimxgz/A8LWea0GGPdtGm8FqZgjokdacpgTAwj+fqOfYv7/1e83
   j7HgYxhFySlfSkDe//LWgDOLXmSayMKgs/uXZKHSLK3fMfXEDJRYfLN5s
   w==;
X-CSE-ConnectionGUID: YkYJcsAJQMaaYr2a79WqEA==
X-CSE-MsgGUID: 7QwK7QKXSZSzaPLX8UjpCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61852930"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="61852930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 00:39:54 -0700
X-CSE-ConnectionGUID: gKPmBmd+Qjybz+v5EtndMQ==
X-CSE-MsgGUID: ijIfiKRtSkWsqz3IdwzXhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="148143059"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.35.3])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 00:39:50 -0700
Date: Sun, 1 Jun 2025 15:39:47 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>, yi1.lai@intel.com
Subject: Re: [PATCH v12 14/21] futex: Allow to resize the private local hash
Message-ID: <aDwDw9Aygqo6oAx+@ly-workstation>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416162921.513656-15-bigeasy@linutronix.de>

On Wed, Apr 16, 2025 at 06:29:14PM +0200, Sebastian Andrzej Siewior wrote:
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
>   16 <= 4 * number_of_threads <= global_hash_size
> where number_of_threads can not exceed the number of online CPUs. Should
> the user PR_FUTEX_HASH_SET_SLOTS then the auto scaling is disabled.
> 
> [peterz: reorganize the code to avoid state tracking and simplify new
> object handling, block the user until changes are in effect, allow
> increase and decrease of the hash].
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  include/linux/futex.h    |   3 +-
>  include/linux/mm_types.h |   4 +-
>  kernel/futex/core.c      | 290 ++++++++++++++++++++++++++++++++++++---
>  kernel/futex/requeue.c   |   5 +
>  4 files changed, 281 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/futex.h b/include/linux/futex.h
> index 1d3f7555825ec..40bc778b2bb45 100644
> --- a/include/linux/futex.h
> +++ b/include/linux/futex.h
> @@ -85,7 +85,8 @@ void futex_hash_free(struct mm_struct *mm);
>  
>  static inline void futex_mm_init(struct mm_struct *mm)
>  {
> -	mm->futex_phash =  NULL;
> +	rcu_assign_pointer(mm->futex_phash, NULL);
> +	mutex_init(&mm->futex_hash_lock);
>  }
>  
>  #else /* !CONFIG_FUTEX_PRIVATE_HASH */
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index a4b5661e41770..32ba5126e2214 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1033,7 +1033,9 @@ struct mm_struct {
>  		seqcount_t mm_lock_seq;
>  #endif
>  #ifdef CONFIG_FUTEX_PRIVATE_HASH
> -		struct futex_private_hash	*futex_phash;
> +		struct mutex			futex_hash_lock;
> +		struct futex_private_hash	__rcu *futex_phash;
> +		struct futex_private_hash	*futex_phash_new;
>  #endif
>  
>  		unsigned long hiwater_rss; /* High-watermark of RSS usage */
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index 53b3a00a92539..9e7dad52abea8 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -40,6 +40,7 @@
>  #include <linux/fault-inject.h>
>  #include <linux/slab.h>
>  #include <linux/prctl.h>
> +#include <linux/rcuref.h>
>  
>  #include "futex.h"
>  #include "../locking/rtmutex_common.h"
> @@ -57,7 +58,9 @@ static struct {
>  #define futex_hashmask (__futex_data.hashmask)
>  
>  struct futex_private_hash {
> +	rcuref_t	users;
>  	unsigned int	hash_mask;
> +	struct rcu_head	rcu;
>  	void		*mm;
>  	bool		custom;
>  	struct futex_hash_bucket queues[];
> @@ -129,11 +132,14 @@ static inline bool futex_key_is_private(union futex_key *key)
>  
>  bool futex_private_hash_get(struct futex_private_hash *fph)
>  {
> -	return false;
> +	return rcuref_get(&fph->users);
>  }
>  
>  void futex_private_hash_put(struct futex_private_hash *fph)
>  {
> +	/* Ignore return value, last put is verified via rcuref_is_dead() */
> +	if (rcuref_put(&fph->users))
> +		wake_up_var(fph->mm);
>  }
>  
>  /**
> @@ -143,8 +149,23 @@ void futex_private_hash_put(struct futex_private_hash *fph)
>   * Obtain an additional reference for the already obtained hash bucket. The
>   * caller must already own an reference.
>   */
> -void futex_hash_get(struct futex_hash_bucket *hb) { }
> -void futex_hash_put(struct futex_hash_bucket *hb) { }
> +void futex_hash_get(struct futex_hash_bucket *hb)
> +{
> +	struct futex_private_hash *fph = hb->priv;
> +
> +	if (!fph)
> +		return;
> +	WARN_ON_ONCE(!futex_private_hash_get(fph));
> +}
> +
> +void futex_hash_put(struct futex_hash_bucket *hb)
> +{
> +	struct futex_private_hash *fph = hb->priv;
> +
> +	if (!fph)
> +		return;
> +	futex_private_hash_put(fph);
> +}
>  
>  static struct futex_hash_bucket *
>  __futex_hash_private(union futex_key *key, struct futex_private_hash *fph)
> @@ -155,7 +176,7 @@ __futex_hash_private(union futex_key *key, struct futex_private_hash *fph)
>  		return NULL;
>  
>  	if (!fph)
> -		fph = key->private.mm->futex_phash;
> +		fph = rcu_dereference(key->private.mm->futex_phash);
>  	if (!fph || !fph->hash_mask)
>  		return NULL;
>  
> @@ -165,21 +186,119 @@ __futex_hash_private(union futex_key *key, struct futex_private_hash *fph)
>  	return &fph->queues[hash & fph->hash_mask];
>  }
>  
> +static void futex_rehash_private(struct futex_private_hash *old,
> +				 struct futex_private_hash *new)
> +{
> +	struct futex_hash_bucket *hb_old, *hb_new;
> +	unsigned int slots = old->hash_mask + 1;
> +	unsigned int i;
> +
> +	for (i = 0; i < slots; i++) {
> +		struct futex_q *this, *tmp;
> +
> +		hb_old = &old->queues[i];
> +
> +		spin_lock(&hb_old->lock);
> +		plist_for_each_entry_safe(this, tmp, &hb_old->chain, list) {
> +
> +			plist_del(&this->list, &hb_old->chain);
> +			futex_hb_waiters_dec(hb_old);
> +
> +			WARN_ON_ONCE(this->lock_ptr != &hb_old->lock);
> +
> +			hb_new = __futex_hash(&this->key, new);
> +			futex_hb_waiters_inc(hb_new);
> +			/*
> +			 * The new pointer isn't published yet but an already
> +			 * moved user can be unqueued due to timeout or signal.
> +			 */
> +			spin_lock_nested(&hb_new->lock, SINGLE_DEPTH_NESTING);
> +			plist_add(&this->list, &hb_new->chain);
> +			this->lock_ptr = &hb_new->lock;
> +			spin_unlock(&hb_new->lock);
> +		}
> +		spin_unlock(&hb_old->lock);
> +	}
> +}
> +
> +static bool __futex_pivot_hash(struct mm_struct *mm,
> +			       struct futex_private_hash *new)
> +{
> +	struct futex_private_hash *fph;
> +
> +	WARN_ON_ONCE(mm->futex_phash_new);
> +
> +	fph = rcu_dereference_protected(mm->futex_phash,
> +					lockdep_is_held(&mm->futex_hash_lock));
> +	if (fph) {
> +		if (!rcuref_is_dead(&fph->users)) {
> +			mm->futex_phash_new = new;
> +			return false;
> +		}
> +
> +		futex_rehash_private(fph, new);
> +	}
> +	rcu_assign_pointer(mm->futex_phash, new);
> +	kvfree_rcu(fph, rcu);
> +	return true;
> +}
> +

Hi Sebastian Andrzej Siewior,

Greetings!

I used Syzkaller and found that there is KASAN: null-ptr-deref Read in __futex_pivot_hash in linux-next next-20250527.

After bisection and the first bad commit is:
"
bd54df5ea7ca futex: Allow to resize the private local hash
"

All detailed into can be found at:
https://github.com/laifryiee/syzkaller_logs/tree/main/250531_004606___futex_pivot_hash
Syzkaller repro code:
https://github.com/laifryiee/syzkaller_logs/tree/main/250531_004606___futex_pivot_hash/repro.c
Syzkaller repro syscall steps:
https://github.com/laifryiee/syzkaller_logs/tree/main/250531_004606___futex_pivot_hash/repro.prog
Syzkaller report:
https://github.com/laifryiee/syzkaller_logs/tree/main/250531_004606___futex_pivot_hash/repro.report
Kconfig(make olddefconfig):
https://github.com/laifryiee/syzkaller_logs/tree/main/250531_004606___futex_pivot_hash/kconfig_origin
Bisect info:
https://github.com/laifryiee/syzkaller_logs/tree/main/250531_004606___futex_pivot_hash/bisect_info.log
bzImage:
https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/250531_004606___futex_pivot_hash/bzImage_fefff2755f2aa4125dce2a1edfe7e545c7c621f2
Issue dmesg:
https://github.com/laifryiee/syzkaller_logs/blob/main/250531_004606___futex_pivot_hash/bzImage_fefff2755f2aa4125dce2a1edfe7e545c7c621f2

"
[  266.064649] Adding 124996k swap on ./swap-file.  Priority:0 extents:1 across:124996k
[  266.075472] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#11] SMP I
[  266.075983] KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
[  266.076337] CPU: 0 UID: 0 PID: 1168 Comm: repro Tainted: G    B D             6.15.0-next-20250527-fefff2755f2a #1
[  266.076882] Tainted: [B]=BAD_PAGE, [D]=DIE
[  266.077073] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.o4
[  266.077594] RIP: 0010:plist_del+0xf3/0x2d0
[  266.077803] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 a6 01 00 00 49 8d 7f 08 4c 8b 73 10 48 b8 00 00 00 00 00 0
[  266.078640] RSP: 0018:ffff8880159dfc40 EFLAGS: 00010202
[  266.078886] RAX: dffffc0000000000 RBX: ffff88800f2397e8 RCX: ffffffff85ca6b25
[  266.079327] RDX: 0000000000000001 RSI: 0000000000000008 RDI: 0000000000000008
[  266.079658] RBP: ffff8880159dfc70 R08: 0000000000000001 R09: ffffed1002b3bf7d
[  266.079989] R10: 0000000000000003 R11: 000000000000000c R12: ffff88800f239800
[  266.080311] R13: ffff88800f2397f0 R14: 0000000000000000 R15: 0000000000000000
[  266.080635] FS:  00007f8c127ff640(0000) GS:ffff8880e355f000(0000) knlGS:0000000000000000
[  266.080998] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  266.081260] CR2: 00007f8c127fee38 CR3: 00000000149da003 CR4: 0000000000770ef0
[  266.081594] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  266.081919] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[  266.082248] PKRU: 55555554
[  266.082377] Call Trace:
[  266.082496]  <TASK>
[  266.082605]  __futex_pivot_hash+0x2b0/0x520
[  266.082815]  futex_hash_allocate+0xb26/0x10b0
[  266.083028]  ? __pfx_futex_hash_allocate+0x10/0x10
[  266.083261]  ? __sanitizer_cov_trace_switch+0x58/0xa0
[  266.083508]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
[  266.083756]  ? static_key_count+0x69/0x80
[  266.083948]  futex_hash_prctl+0x20c/0x650
[  266.084146]  __do_sys_prctl+0x1a0d/0x2170
[  266.084347]  ? __pfx___do_sys_prctl+0x10/0x10
[  266.084563]  __x64_sys_prctl+0xc6/0x150
[  266.084742]  ? syscall_trace_enter+0x14d/0x280
[  266.084956]  x64_sys_call+0x1a25/0x2150
[  266.085144]  do_syscall_64+0x6d/0x2e0
[  266.085324]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  266.085558] RIP: 0033:0x7f8c1283ee5d
[  266.085731] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 8
[  266.086550] RSP: 002b:00007f8c127fed48 EFLAGS: 00000246 ORIG_RAX: 000000000000009d
[  266.086895] RAX: ffffffffffffffda RBX: 00007f8c127ff640 RCX: 00007f8c1283ee5d
[  266.087219] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000000000004e
[  266.087546] RBP: 00007f8c127fed60 R08: 0000000000000000 R09: 0000000000000000
[  266.087869] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f8c127ff640
[  266.088191] R13: 0000000000000013 R14: 00007f8c1289f560 R15: 0000000000000000
[  266.088521]  </TASK>
[  266.088631] Modules linked in:
[  266.088810] ---[ end trace 0000000000000000 ]---
[  266.089030] RIP: 0010:__futex_pivot_hash+0x271/0x520
[  266.089265] Code: e8 84 a5 58 04 48 8b 45 d0 48 c1 e8 03 42 80 3c 28 00 0f 85 5e 02 00 00 48 8b 45 d0 4c 8b 30 4c 0
[  266.090087] RSP: 0018:ffff88801b43fc80 EFLAGS: 00010206
[  266.090332] RAX: 0007c018e000003c RBX: 003e00c7000001c9 RCX: ffffffff81799536
[  266.090660] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff8880227e8888
[  266.090983] RBP: ffff88801b43fcf8 R08: 0000000000000001 R09: ffffed1003687f7d
[  266.091309] R10: 0000000000000003 R11: 6e696c6261736944 R12: ffff888014430d68
[  266.091634] R13: dffffc0000000000 R14: 003e00c7000001e1 R15: ffff888014430a80
[  266.091950] FS:  00007f8c127ff640(0000) GS:ffff8880e355f000(0000) knlGS:0000000000000000
[  266.092319] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  266.092582] CR2: 00007f8c127fee38 CR3: 00000000149da003 CR4: 0000000000770ef0
[  266.092915] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  266.093243] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[  266.093608] PKRU: 55555554
[  266.093738] note: repro[1168] exited with preempt_count 1
"

I also tried lastest linux-tag next-20250530. This issue can be reproduced. Here is the log:

"
[   50.554828] Adding 124996k swap on ./swap-file.  Priority:0 extents:1 across:124996k
[   50.563846] Oops: general protection fault, probably for non-canonical address 0xe028fc18c0000065: 0000 [#4] SMP KI
[   50.564384] KASAN: maybe wild-memory-access in range [0x014800c600000328-0x014800c60000032f]
[   50.564774] CPU: 1 UID: 0 PID: 813 Comm: repro Tainted: G    B D             6.15.0-next-20250530-kvm #3 PREEMPT(v
[   50.565314] Tainted: [B]=BAD_PAGE, [D]=DIE
[   50.565514] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.o4
[   50.566028] RIP: 0010:__futex_pivot_hash+0x204/0x530
[   50.566278] Code: e8 f1 e6 5b 04 48 8b 45 d0 48 c1 e8 03 42 80 3c 28 00 0f 85 d1 02 00 00 48 8b 45 d0 4c 8b 30 4c 0
[   50.567119] RSP: 0018:ffff88801241fc80 EFLAGS: 00010206
[   50.567372] RAX: 00290018c0000065 RBX: 014800c600000310 RCX: ffffffff8179ecdc
[   50.567706] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88801d5d1708
[   50.568036] RBP: ffff88801241fcf8 R08: 0000000000000001 R09: ffffed1002483f7d
[   50.568364] R10: 0000000000000003 R11: 00000000bd9dfb48 R12: ffff88801429bf00
[   50.568699] R13: dffffc0000000000 R14: 014800c600000328 R15: 0000000000000001
[   50.569035] FS:  00007f183fe43640(0000) GS:ffff8880e3652000(0000) knlGS:0000000000000000
[   50.569415] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   50.569691] CR2: 00007f183fe42e38 CR3: 000000001115c005 CR4: 0000000000770ef0
[   50.570026] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   50.570349] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[   50.570684] PKRU: 55555554
[   50.570820] Call Trace:
[   50.570946]  <TASK>
[   50.571060]  futex_hash_allocate+0xb3a/0x1060
[   50.571279]  ? sigprocmask+0x24e/0x370
[   50.571470]  ? __pfx_futex_hash_allocate+0x10/0x10
[   50.571703]  ? rcu_is_watching+0x19/0xc0
[   50.571899]  ? __sanitizer_cov_trace_switch+0x58/0xa0
[   50.572152]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
[   50.572416]  ? static_key_count+0x63/0x80
[   50.572608]  ? __sanitizer_cov_trace_const_cmp8+0x1c/0x30
[   50.572870]  futex_hash_prctl+0x1fe/0x650
[   50.573069]  __do_sys_prctl+0x4a3/0x2110
[   50.573270]  ? __pfx___do_sys_prctl+0x10/0x10
[   50.573486]  ? __audit_syscall_entry+0x39f/0x500
[   50.573714]  __x64_sys_prctl+0xc6/0x150
[   50.573905]  ? syscall_trace_enter+0x14d/0x280
[   50.574120]  x64_sys_call+0x1a2f/0x1fa0
[   50.574314]  do_syscall_64+0x6d/0x2e0
[   50.574497]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   50.574736] RIP: 0033:0x7f183fc3ee5d
[   50.574911] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 8
[   50.575748] RSP: 002b:00007f183fe42d48 EFLAGS: 00000246 ORIG_RAX: 000000000000009d
[   50.576105] RAX: ffffffffffffffda RBX: 00007f183fe43640 RCX: 00007f183fc3ee5d
[   50.576434] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000000000004e
[   50.576768] RBP: 00007f183fe42d60 R08: 0000000000000000 R09: 0000000000000000
[   50.577105] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f183fe43640
[   50.577444] R13: 000000000000000c R14: 00007f183fc9f560 R15: 0000000000000000
[   50.577781]  </TASK>
[   50.577887] Modules linked in:
[   50.578095] ---[ end trace 0000000000000000 ]---
[   50.578316] RIP: 0010:__futex_pivot_hash+0x204/0x530
[   50.578559] Code: e8 f1 e6 5b 04 48 8b 45 d0 48 c1 e8 03 42 80 3c 28 00 0f 85 d1 02 00 00 48 8b 45 d0 4c 8b 30 4c 0
[   50.579394] RSP: 0018:ffff888012557c80 EFLAGS: 00010206
[   50.579643] RAX: 00798018e0000056 RBX: 03cc00c700000299 RCX: ffffffff8179ecdc
[   50.579975] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff8880117f8488
[   50.580303] RBP: ffff888012557cf8 R08: 0000000000000001 R09: ffffed10024aaf7d
[   50.580669] R10: 0000000000000003 R11: 6e696c6261736944 R12: ffff888012cf0000
[   50.581597] R13: dffffc0000000000 R14: 03cc00c7000002b1 R15: 0000000000000001
[   50.581937] FS:  00007f183fe43640(0000) GS:ffff8880e3652000(0000) knlGS:0000000000000000
[   50.582309] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   50.582583] CR2: 00007f183fe42e38 CR3: 000000001115c005 CR4: 0000000000770ef0
[   50.582977] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   50.583294] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[   50.583622] PKRU: 55555554
[   50.583758] note: repro[813] exited with preempt_count 1
"

Hope this cound be insightful to you.

Regards,
Yi Lai

---

If you don't need the following environment to reproduce the problem or if you
already have one reproduced environment, please ignore the following information.

How to reproduce:
git clone https://gitlab.com/xupengfe/repro_vm_env.git
cd repro_vm_env
tar -xvf repro_vm_env.tar.gz
cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
  // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
  // You could change the bzImage_xxx as you want
  // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
You could use below command to log in, there is no password for root.
ssh -p 10023 root@localhost

After login vm(virtual machine) successfully, you could transfer reproduced
binary to the vm by below way, and reproduce the problem in vm:
gcc -pthread -o repro repro.c
scp -P 10023 repro root@localhost:/root/

Get the bzImage for target kernel:
Please use target kconfig and copy it to kernel_src/.config
make olddefconfig
make -jx bzImage           //x should equal or less than cpu num your pc has

Fill the bzImage file into above start3.sh to load the target kernel in vm.


Tips:
If you already have qemu-system-x86_64, please ignore below info.
If you want to install qemu v7.1.0 version:
git clone https://github.com/qemu/qemu.git
cd qemu
git checkout -f v7.1.0
mkdir build
cd build
yum install -y ninja-build.x86_64
yum -y install libslirp-devel.x86_64
../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
make
make install 

> +static void futex_pivot_hash(struct mm_struct *mm)
> +{
> +	scoped_guard(mutex, &mm->futex_hash_lock) {
> +		struct futex_private_hash *fph;
> +
> +		fph = mm->futex_phash_new;
> +		if (fph) {
> +			mm->futex_phash_new = NULL;
> +			__futex_pivot_hash(mm, fph);
> +		}
> +	}
> +}
> +
>  struct futex_private_hash *futex_private_hash(void)
>  {
>  	struct mm_struct *mm = current->mm;
> -	struct futex_private_hash *fph;
> +	/*
> +	 * Ideally we don't loop. If there is a replacement in progress
> +	 * then a new private hash is already prepared and a reference can't be
> +	 * obtained once the last user dropped it's.
> +	 * In that case we block on mm_struct::futex_hash_lock and either have
> +	 * to perform the replacement or wait while someone else is doing the
> +	 * job. Eitherway, on the second iteration we acquire a reference on the
> +	 * new private hash or loop again because a new replacement has been
> +	 * requested.
> +	 */
> +again:
> +	scoped_guard(rcu) {
> +		struct futex_private_hash *fph;
>  
> -	fph = mm->futex_phash;
> -	return fph;
> +		fph = rcu_dereference(mm->futex_phash);
> +		if (!fph)
> +			return NULL;
> +
> +		if (rcuref_get(&fph->users))
> +			return fph;
> +	}
> +	futex_pivot_hash(mm);
> +	goto again;
>  }
>  
>  struct futex_hash_bucket *futex_hash(union futex_key *key)
>  {
> +	struct futex_private_hash *fph;
>  	struct futex_hash_bucket *hb;
>  
> -	hb = __futex_hash(key, NULL);
> -	return hb;
> +again:
> +	scoped_guard(rcu) {
> +		hb = __futex_hash(key, NULL);
> +		fph = hb->priv;
> +
> +		if (!fph || futex_private_hash_get(fph))
> +			return hb;
> +	}
> +	futex_pivot_hash(key->private.mm);
> +	goto again;
>  }
>  
>  #else /* !CONFIG_FUTEX_PRIVATE_HASH */
> @@ -664,6 +783,8 @@ int futex_unqueue(struct futex_q *q)
>  	spinlock_t *lock_ptr;
>  	int ret = 0;
>  
> +	/* RCU so lock_ptr is not going away during locking. */
> +	guard(rcu)();
>  	/* In the common case we don't take the spinlock, which is nice. */
>  retry:
>  	/*
> @@ -1065,6 +1186,10 @@ static void exit_pi_state_list(struct task_struct *curr)
>  	struct futex_pi_state *pi_state;
>  	union futex_key key = FUTEX_KEY_INIT;
>  
> +	/*
> +	 * The mutex mm_struct::futex_hash_lock might be acquired.
> +	 */
> +	might_sleep();
>  	/*
>  	 * Ensure the hash remains stable (no resize) during the while loop
>  	 * below. The hb pointer is acquired under the pi_lock so we can't block
> @@ -1261,7 +1386,51 @@ static void futex_hash_bucket_init(struct futex_hash_bucket *fhb,
>  #ifdef CONFIG_FUTEX_PRIVATE_HASH
>  void futex_hash_free(struct mm_struct *mm)
>  {
> -	kvfree(mm->futex_phash);
> +	struct futex_private_hash *fph;
> +
> +	kvfree(mm->futex_phash_new);
> +	fph = rcu_dereference_raw(mm->futex_phash);
> +	if (fph) {
> +		WARN_ON_ONCE(rcuref_read(&fph->users) > 1);
> +		kvfree(fph);
> +	}
> +}
> +
> +static bool futex_pivot_pending(struct mm_struct *mm)
> +{
> +	struct futex_private_hash *fph;
> +
> +	guard(rcu)();
> +
> +	if (!mm->futex_phash_new)
> +		return true;
> +
> +	fph = rcu_dereference(mm->futex_phash);
> +	return rcuref_is_dead(&fph->users);
> +}
> +
> +static bool futex_hash_less(struct futex_private_hash *a,
> +			    struct futex_private_hash *b)
> +{
> +	/* user provided always wins */
> +	if (!a->custom && b->custom)
> +		return true;
> +	if (a->custom && !b->custom)
> +		return false;
> +
> +	/* zero-sized hash wins */
> +	if (!b->hash_mask)
> +		return true;
> +	if (!a->hash_mask)
> +		return false;
> +
> +	/* keep the biggest */
> +	if (a->hash_mask < b->hash_mask)
> +		return true;
> +	if (a->hash_mask > b->hash_mask)
> +		return false;
> +
> +	return false; /* equal */
>  }
>  
>  static int futex_hash_allocate(unsigned int hash_slots, bool custom)
> @@ -1273,16 +1442,23 @@ static int futex_hash_allocate(unsigned int hash_slots, bool custom)
>  	if (hash_slots && (hash_slots == 1 || !is_power_of_2(hash_slots)))
>  		return -EINVAL;
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
>  	fph = kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
>  	if (!fph)
>  		return -ENOMEM;
>  
> +	rcuref_init(&fph->users, 1);
>  	fph->hash_mask = hash_slots ? hash_slots - 1 : 0;
>  	fph->custom = custom;
>  	fph->mm = mm;
> @@ -1290,26 +1466,102 @@ static int futex_hash_allocate(unsigned int hash_slots, bool custom)
>  	for (i = 0; i < hash_slots; i++)
>  		futex_hash_bucket_init(&fph->queues[i], fph);
>  
> -	mm->futex_phash = fph;
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
> +		}
> +	}
>  	return 0;
>  }
>  
>  int futex_hash_allocate_default(void)
>  {
> +	unsigned int threads, buckets, current_buckets = 0;
> +	struct futex_private_hash *fph;
> +
>  	if (!current->mm)
>  		return 0;
>  
> -	if (current->mm->futex_phash)
> +	scoped_guard(rcu) {
> +		threads = min_t(unsigned int,
> +				get_nr_threads(current),
> +				num_online_cpus());
> +
> +		fph = rcu_dereference(current->mm->futex_phash);
> +		if (fph) {
> +			if (fph->custom)
> +				return 0;
> +
> +			current_buckets = fph->hash_mask + 1;
> +		}
> +	}
> +
> +	/*
> +	 * The default allocation will remain within
> +	 *   16 <= threads * 4 <= global hash size
> +	 */
> +	buckets = roundup_pow_of_two(4 * threads);
> +	buckets = clamp(buckets, 16, futex_hashmask + 1);
> +
> +	if (current_buckets >= buckets)
>  		return 0;
>  
> -	return futex_hash_allocate(16, false);
> +	return futex_hash_allocate(buckets, false);
>  }
>  
>  static int futex_hash_get_slots(void)
>  {
>  	struct futex_private_hash *fph;
>  
> -	fph = current->mm->futex_phash;
> +	guard(rcu)();
> +	fph = rcu_dereference(current->mm->futex_phash);
>  	if (fph && fph->hash_mask)
>  		return fph->hash_mask + 1;
>  	return 0;
> diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
> index b0e64fd454d96..c716a66f86929 100644
> --- a/kernel/futex/requeue.c
> +++ b/kernel/futex/requeue.c
> @@ -87,6 +87,11 @@ void requeue_futex(struct futex_q *q, struct futex_hash_bucket *hb1,
>  		futex_hb_waiters_inc(hb2);
>  		plist_add(&q->list, &hb2->chain);
>  		q->lock_ptr = &hb2->lock;
> +		/*
> +		 * hb1 and hb2 belong to the same futex_hash_bucket_private
> +		 * because if we managed get a reference on hb1 then it can't be
> +		 * replaced. Therefore we avoid put(hb1)+get(hb2) here.
> +		 */
>  	}
>  	q->key = *key2;
>  }
> -- 
> 2.49.0
> 
