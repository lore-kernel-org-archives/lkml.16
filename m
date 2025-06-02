Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4B51A0BE0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862034; cv=none; b=BlqC31rvPc9fBmLj0Wak3gu79WeeoWXuc/SwtK/niHkwS2ErbBv/VJCwbePCDgidrGzWX08ckwOQARP/MuQXFk5j+dc2dkQFBtpd/gI2+owLFTddlJSZwsri7Dc28bY04E6xgvCSvKBuu+bSHfhSCP4EkJYF00RLR1Ox5KyADbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862034; c=relaxed/simple;
	bh=ls2JLD5Mz8NbZxf/6R50L93ped0rqAxJ3miLIh+YWAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNt9AZBp9xMJcu79Q1AzFbY+uDQ2VJ0lI36YnYpQVuYPwEI8sAf8F1/RUYY5eyoJZpQNqpI5I1nDFkMtbs+MYxCcJCzXPUlSN9qd8YQLvhWUMKVfiUSepNKCCDBw7wohW1vmh38czqzVMu092whJwDqs4F8yT7t0KT5eDf53rjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D8Cazi66; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BksKiEsO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D8Cazi66";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BksKiEsO"
Date: Mon, 2 Jun 2025 13:00:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748862029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UT6nzUN7LhHmg9W3rwJe+klPpPhJk6BH+tSclxjHD78=;
	b=D8Cazi66nno62Iy89tsIDly4bGW12mxtafP/9lS+C8PP73oNauatwVhI5g/H9xlxRe027o
	JP7yGA4J92TrI84gXD2OVyHlwPhp+Dwqs7kaaJGLSTfiRuBlQfd28aT0Pp+lJCLmuHutTm
	zlcTqp60r7if+L9/0dMln7hD2pEpxO1mVniyRg24NLz2z2tXSC8/Z5GuFMsu9/wzO9sQOz
	iDQ8A3BD55zIy9uv1vgy2UX/Vvpc8uOU8XCH0cJ33Ofk1rX9n4nnRt/vLea4idsb/a01TQ
	Hbwxu2qfcBfXjcElMeRz7WDNF6C6JYcDeuzh/hEpKHs+GySBqeXI0ppITQ+uWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748862029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UT6nzUN7LhHmg9W3rwJe+klPpPhJk6BH+tSclxjHD78=;
	b=BksKiEsODfl6LDONoXd+Wi0hwK4MqSiYzxsD/ygjoCAh7u6NGOcTbqiN3V4BjHsGTJfTEB
	730w55zLZQZc2LDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Lai, Yi" <yi1.lai@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>, yi1.lai@intel.com
Subject: Re: [PATCH v12 14/21] futex: Allow to resize the private local hash
Message-ID: <20250602110027.wfqbHgzb@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
 <aDwDw9Aygqo6oAx+@ly-workstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aDwDw9Aygqo6oAx+@ly-workstation>

On 2025-06-01 15:39:47 [+0800], Lai, Yi wrote:
> Hi Sebastian Andrzej Siewior,
Hi Yi,
> Greetings!
> 
> I used Syzkaller and found that there is KASAN: null-ptr-deref Read in __futex_pivot_hash in linux-next next-20250527.
> 
> After bisection and the first bad commit is:
> "
> bd54df5ea7ca futex: Allow to resize the private local hash
> "

Thank you for the report. Next time please trim your report. There is no
need to put your report in the middle of the patch.

The following fixes it:

----------->8--------------

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Mon, 2 Jun 2025 12:11:13 +0200
Subject: [PATCH] futex: Verify under the lock if global hash is in use

Once the global hash is requested there is no way back to switch back to
the per-task private hash. This is checked at the begin of the function.

It is possible that two threads simultaneously request the global hash
and both pass the initial check and block later on the
mm::futex_hash_lock. In this case the first thread performs the switch
to the global hash. The second thread will also attempt to switch to the
global hash and while doing so, accessing the nonexisting slot 1 of the
struct futex_private_hash.
This has been reported by Yi Lai.

Verify under mm_struct::futex_phash that the global hash is not in use.

Reported-by: "Lai, Yi" <yi1.lai@linux.intel.com>
Closes: https://lore.kernel.org/all/aDwDw9Aygqo6oAx+@ly-workstation/
Fixes: bd54df5ea7cad ("futex: Allow to resize the private local hash")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 1cd3a646c91fd..abbd97c2fcba8 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1629,6 +1629,16 @@ static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
 		mm->futex_phash_new = NULL;
 
 		if (fph) {
+			if (cur && !cur->hash_mask) {
+				/*
+				 * If two threads simultaneously request the global
+				 * hash then the first one performs the switch,
+				 * the second one returns here.
+				 */
+				free = fph;
+				mm->futex_phash_new = new;
+				return -EBUSY;
+			}
 			if (cur && !new) {
 				/*
 				 * If we have an existing hash, but do not yet have
-- 
2.49.0


Sebastian
