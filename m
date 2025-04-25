Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4631EB1B9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572488; cv=none; b=ISTHk+i4PICP4s/EtUtg6x3ufqn+KNhVtvv2jBZ7ntxNxny5vNRScLrgQZ9ky7+Tzo+GZK/4rWmumnaiW8hEToEVM6yyfh2wM4PsqI+41TKu2hZEo2oaD8WkUv1jurVA0xyvnC9DoqpwZtC2X1DhfT0C/bHdzcO5D/JyeQsTj3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572488; c=relaxed/simple;
	bh=X7LNTifkwfMspY3F2/RrIThv3IqklC9Hyk69zZ4lGXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/KnPv4nafY+/URC1vA0xZhLbUzTTwaJWLSgsexftPoFaplaJ3/CkSeKS1ptQv2PtmNbXOh+lmcrSrObRaPzlHod+XYxAREOz0oUyYJqY2ZOvUwN9thq3rH3LXHE+hujbbNpeYdwmjPrR/I8qQb6SVHox+fS+9JDft3OnRhKLxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L7XXrFBy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xCbVB9H8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L7XXrFBy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xCbVB9H8"
Date: Fri, 25 Apr 2025 11:14:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745572485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xaLel4vvYqzBPjcrJ8bkkg4VvvEWb5f3ZRJvMBzEWWQ=;
	b=L7XXrFByB8uijdBzg8+95DfSdwOI+scCE+SgJCOea4beyMoOzYl0TwFWi+glVp0S4DluQx
	63KzURd/rYRtpiq73xRj1OEShIZ64u0645210ud9nkub2rZhJKARG1Rs4PlQl8VJz4qGc3
	FExRHvW+K6ymJCwiy6rGwSK2c4JVs6xmkuM9UPcRGJEGT7ERmTJM8NbLfzbs/eKNAiWNzo
	3nGWSBB/yJ+uRXjdBBaljxKaRjzQ1gDNlla+RrIPv954e2nZSA3fl2vao2HDHjT3vEK+Ji
	aC/7ZeZvaVnjn+kDoamWgQ2/NFnLMpF48baa5OliWdwktGVTFOTT7soZ4GNgwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745572485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xaLel4vvYqzBPjcrJ8bkkg4VvvEWb5f3ZRJvMBzEWWQ=;
	b=xCbVB9H8LtWQuT+lUNNXibE0rzOS4YfuOgm0OhE3IHfUoMl9vTW1hXKtI2+STt4r4Di0G7
	lbXsYOhkl9h5eTBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <llong@redhat.com>
Cc: linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH] local_lock: Add local_lock access for a CPU-local
 pointer
Message-ID: <20250425091443.2HMvQfPv@linutronix.de>
References: <20250417160057.jFRLMwfF@linutronix.de>
 <393a4c7f-c48f-4da1-a059-4c10f4094386@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <393a4c7f-c48f-4da1-a059-4c10f4094386@redhat.com>

On 2025-04-18 22:52:29 [-0400], Waiman Long wrote:
> > Adding a _local to the function name would be a bit too local. I added
> > _this instead but don't like it very much. Anyone with a better naming?
> 
> The "this" suffix looks a bit weird. Since you had introduced localtry_lock
> before, maybe you can follow a similar scheme like localcpu_lock.
> 
> My 2 cents.

Okay. Better.
We usually have function() and __function() which is the internal
implementation with some changes/ presets. Now if we apply this here
and shift the this_cpu_ptr() from __ to main one, like:

diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
index 1a0bc35839e36..d5e8c7a298055 100644
--- a/include/linux/local_lock.h
+++ b/include/linux/local_lock.h
@@ -133,10 +133,10 @@ DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
 		    unsigned long flags)
 
 #define local_lock_nested_bh(_lock)				\
-	__local_lock_nested_bh(_lock)
+	__local_lock_nested_bh(this_cpu_ptr(_lock))
 
 #define local_unlock_nested_bh(_lock)				\
-	__local_unlock_nested_bh(_lock)
+	__local_unlock_nested_bh(this_cpu_ptr(_lock))
 
 DEFINE_GUARD(local_lock_nested_bh, local_lock_t __percpu*,
 	     local_lock_nested_bh(_T),
diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index 67bd13d142fac..bc6e6cc5dca99 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -126,11 +126,11 @@ do {								\
 #define __local_lock_nested_bh(lock)				\
 	do {							\
 		lockdep_assert_in_softirq();			\
-		local_lock_acquire(this_cpu_ptr(lock));	\
+		local_lock_acquire(lock);	\
 	} while (0)
 
 #define __local_unlock_nested_bh(lock)				\
-	local_lock_release(this_cpu_ptr(lock))
+	local_lock_release(lock)
 
 /* localtry_lock_t variants */
 
@@ -275,12 +275,12 @@ typedef spinlock_t localtry_lock_t;
 #define __local_lock_nested_bh(lock)				\
 do {								\
 	lockdep_assert_in_softirq_func();			\
-	spin_lock(this_cpu_ptr(lock));				\
+	spin_lock(lock);				\
 } while (0)
 
 #define __local_unlock_nested_bh(lock)				\
 do {								\
-	spin_unlock(this_cpu_ptr((lock)));			\
+	spin_unlock((lock));			\
 } while (0)
 
 /* localtry_lock_t variants */


Then I could use __local_lock_nested_bh(lock) where "lock" is already
the actual lock pointer.

> Cheers,
> Longman

Sebastian
