Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A97D22F384
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749765843; cv=none; b=TdlL/GMuEGzvOdAShPg588os53qLcLqBA3yifQheU8gdMv5LMx6oukKR590mVhDCJvuzwFhBiKdNENFiL1+ovquzc6GJpTLb9USe2GyoFvBk1TXv5mTii5AXPwwuwfokJc4rTQqOUU5A2K3gYcIsgXBw1x+YLeofeUtNG/1pTns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749765843; c=relaxed/simple;
	bh=xOp9+ySyWdeiHDLdGbl/XZz0dLdjjfSbf4vKk+LB4fI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NmVWVBFvbEdXTDyBy6QIreTkqDtoa0hPNMXlJdcsKY7P+B6pPf+Ar+gXcF23QaGgJdxm9JAFEvfegDhSFepxBgPXj1G8CFAnRKYnisKEry2eCRbvfOPVuP88bErVr6LYyICMQrXKz0+c0tNyzweM9TtIMpa79OqrBe1c4qRWAlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LB9pU7bY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Mr0/8HI4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LB9pU7bY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Mr0/8HI4"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749765839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pO1ViRykxcTrtYuBECel5X50y24X/phoMDcyLguDBKU=;
	b=LB9pU7bYYR6Zo2KbH6bWPXFZND2rSF1cFqqqYqtjNjb52QalI0Xi4jdq4UgWp1Ur8IXczQ
	I84m6/pyzLNqHeCV12EOM94lD81jdPFnnYoVj8tp6CPLtwci1gz190TniQzbfBk+tKyZlY
	P32qpqoMli7UoFoq0u6qHSU5KXbe0PMOZuvwQbSVbSXpeH1Xr/pxC2X/VTYjFkaa63STQi
	XyaIReUlQexQ01XetFmgWL/hsOqDsdNIwRACroYtJNI2ai0Pdvovkr5CHcpYU1kutWF7Rr
	ANWhHmGkkg6yd8hPfOhq27rz7y2A3nvw85F3kFsd9mdNwFGi4W8gJkvWU2VpTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749765839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pO1ViRykxcTrtYuBECel5X50y24X/phoMDcyLguDBKU=;
	b=Mr0/8HI4NtdiePd5gCmPQNWZu6eya3kT/DNttCgPmZlYmyaPuM1kAAozwaBufHa6VdP76h
	7FwxMyOwf4IGoZDQ==
To: Waiman Long <longman@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 3/3] timers: Disable memory pre-allocation of timer
 debug objects
In-Reply-To: <20250606031539.1004644-4-longman@redhat.com>
References: <20250606031539.1004644-1-longman@redhat.com>
 <20250606031539.1004644-4-longman@redhat.com>
Date: Fri, 13 Jun 2025 00:03:58 +0200
Message-ID: <87o6ussjld.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 05 2025 at 23:15, Waiman Long wrote:
> A circular locking dependency lockdep splat was hit recently with a
> debug kernel. The dependency chain (in reverse order) is:
>
>   -> #3 (&zone->lock){-.-.}-{2:2}:
>   -> #2 (&base->lock){-.-.}-{2:2}:
>   -> #1 (&console_sch_key){-.-.}-{2:2}:
>   -> #0 (console_owner){..-.}-{0:0}:
>
> The last one is from calling printk() within the rmqueue_bulk() call in
> mm/page_alloc.c. The "base->lock" is from lock_timer_base() and first
> one is due to calling add_timer_on() leading to debug_object_activate()
> doing actual memory allocation acquiring the zone lock.
>
> The console_sch_key comes from a s390 console driver in driver/s390/cio.
> The console_sch_key -> timer dependency happens because the console
> driver is setting a timeout value while holding its lock. Apparently it
> is pretty common for a console driver to use timer for timeout or other
> timing purposes. So this may happen to other console drivers as well.
>
> One way to break this circular locking dependency is to disallow any
> memory allocation when a timer debug object is being handled. Do this by
> setting the ODEBUG_FLAG_NO_ALLOC flag in the timer_debug_descr
> structure.

Well. I'm absolutely not convinced that this is the right approach.

I have a hard time to find the printk() in rmqueue_bulk(). But if there
is one then it has to go or has to be converted to a deferred printk()
simply because that code can be called from so many contexts, which all
can legitimately create a lock dependency chain into the console drivers
in some way or the other. That's like invoking printk() from the guts of
the scheduler or locking code.

> The figures below show the number of times the debug_objects_fill_pool()
> function has reached the statement right before and after the no_alloc
> check in initial bootup and after running a parallel kernel build on
> a 2-socket 96-threads x86-64 system.
>
> 			 Before      After     non-timer %
> 		 	 ------      -----     -----------
>   Initial bootup	  150,730     148,198     98.3%
>   Parallel kernel build 5,974,464   5,893,116     98.6%
>
> So from object pre-allocation perspective, timer debug objects represent
> just a small slice of the total number of debug objects to be processed.

That math is skewed due to the way how debugobjects handles the
allocations for the global pool.

The initial decision to attempt a refill is:

    count < min_cnt

where min_cnt = 256 + 16 * num_possible_cpus()

That makes _one_ context go into the allocation path unless

    count < min_cnt / 2

which forces all contexts to try allocating in order not to deplete the
pool.

So let's assume we have 16 CPUs, then min_cnt = 512 and therefore
min_cnt / 2 = 256.

As the initial context which allocates when the count goes below 512
might be preempted, the rest of the callers can lower the pool count to
256 easily.

In the 0-day splat the debug_objects OOM happens from o2net_init():

[ 92.566274][ T1] debug_object_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:785) 
[ 92.566777][ T1] init_timer_key (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/include/asm/jump_label.h:36
[ 92.567230][ T1] o2net_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/ocfs2/cluster/tcp.c:2128 (discriminator 3)) 
[ 92.567629][ T1] init_o2nm (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/ocfs2/cluster/nodemanager.c:832) 
[ 92.568023][ T1] do_one_initcall (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1257) 

o2net_init() initializes 255 nodes and each node has three delayed works. Each
delayed work contains a timer for which debugobjects needs to create a
new tracking object. So with your brute force approach of disabling
allocations for timers blindy o2net_init() can trivially deplete the
pool.

For the o2net case this requires that workqueue debugobjects are
disabled, but you can't argue that this is silly because there are other
code paths which do bulk initialization of timers w/o having a work
involved.

So using the percentage of timer operations for evaluating how this
change can cause a debug object OOM is just bogus and wishful thinking.

Let's take a step back and ask the obvious question, when there is
actually consumption of debug objects happening:

  1) For all dynamically initialized objects it happens in
     debug_object_init()

  2) For statically initialized objects it happens in
     debug_object_activate()

#2 is arguably irrelevant as there are not gazillions of statically
   initialized objects, which are trackable by debugobjects

#1 is the vast majority and the good news is that the initialization of
   such objects (after allocation) happens mostly in preemptible context
   with no locks held.

So the obvious thing to try is not adding some random flag to timers
(and tomorrow to RCU and work), but to restrict the allocation
requirement to debug_object_init().

Something like the untested below should make all of these headaches
go away. Except for the general observation that debugobjects is not the
only way to create nasty dependency chains into console driver locks,
but that's a headache the MM folks have to sort out.

Thanks,

        tglx
---        

--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -811,8 +811,6 @@ int debug_object_activate(void *addr, co
 	if (!debug_objects_enabled)
 		return 0;
 
-	debug_objects_fill_pool();
-
 	db = get_bucket((unsigned long) addr);
 
 	raw_spin_lock_irqsave(&db->lock, flags);
@@ -1000,8 +998,6 @@ void debug_object_assert_init(void *addr
 	if (!debug_objects_enabled)
 		return;
 
-	debug_objects_fill_pool();
-
 	db = get_bucket((unsigned long) addr);
 
 	raw_spin_lock_irqsave(&db->lock, flags);
