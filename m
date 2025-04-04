Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1FA2080D2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788034; cv=none; b=WMZvxokbzJdG0tTTVNUs9KXIWHa/RKYzkatccy7RKDLrcw9ngLmKtvh/F4GVGQM5tKukwIYrxTQyp2Oldrz9e/Wcld81j3+6Cdo7uV1lVkegY2pz1T0sIaMtXJIhwi/Y2RtVkTKEMY68kFibtHnBa5eOX07XvH4BevhJCuOKRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788034; c=relaxed/simple;
	bh=ED1CtrldUpMVenUgrXLtK1yqfpZmH/dR0gkHBlCerbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iteZZTPLM6rvzHZmGjX6eAqbN8pjkernEBfQZqlmYGC6NNYBeqLgjfoQlkXfBLO1VtaJjFxnvmBe0dnw2Eig189KN7pVfhGRS1snEAYQMsDVi5SFENEDFGgD5JRAyo3E0rEnpypaiW7VfYId8Oo0GulFIuzcTip/I8D5ieeWBYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K+/Q5AAm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zDoWF38+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K+/Q5AAm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zDoWF38+"
Date: Fri, 4 Apr 2025 19:33:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743788030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lFzpvJy2v+qGhIdkZqNllKjFYav6xpjkvXsR37iPbYk=;
	b=K+/Q5AAmcp3ImOYhYGTuc02N1fvgIjc+G+JxBkpMffZzgasz9EqMjAv1EXyNnjbssCe5t+
	A8cQTuTQvXbsp2+GXnOqHHH+MUmcYAwAXU+lloCs6EFF6zjY5yP7rsXes5VhNctT8+5FPb
	Bt1yLRywW6G4r8S+r8W/Di3XHGKJHQt23GM1aAU3fw8JqAtZit2INYh0w+CINA7a/s+Gub
	MYbEWIMtappLLmIaNkyQYQ0/92AYTwi6U4u1GQG0ufJdUmvHuehFREuFKlX5BM3LMmqDhk
	q7dDROHYFNscbDZhrRoYdtlIy21qtxVHs+p90FCebzKd/K1pW8iK/2eqGgb7mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743788030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lFzpvJy2v+qGhIdkZqNllKjFYav6xpjkvXsR37iPbYk=;
	b=zDoWF38+mY4PV/MmReCrjWX0nZNyMjF4sVrWCksV0TucTtQPVtpVPUSu5F1Xm3QIyU8R73
	Y/drfikCEehjhMAQ==
From: Nam Cao <namcao@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:timers/cleanups 5/10] kernel/time/timer_list.c:49:77:
 error: too few arguments provided to function-like macro invocation
Message-ID: <20250404173345.J_5vqqR4@linutronix.de>
References: <202504050045.fyyfMGEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504050045.fyyfMGEQ-lkp@intel.com>

On Sat, Apr 05, 2025 at 01:04:04AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
> head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
> commit: 9453228aa82f20c07670d22c3d54f1be6c4244b4 [5/10] hrtimers: Make callback function pointer private
...
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504050045.fyyfMGEQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/time/timer_list.c:49:77: error: too few arguments provided to function-like macro invocation
>       49 |         SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
>          |                                                                                    ^
>    include/linux/compiler_types.h:78:10: note: macro 'ACCESS_PRIVATE' defined here
>       78 | # define ACCESS_PRIVATE(p, member) ((p)->member)
>          |          ^
> >> kernel/time/timer_list.c:49:47: error: use of undeclared identifier 'ACCESS_PRIVATE'
>       49 |         SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
>          |                                                      ^
>    2 errors generated.

Not sure how did this even get pass by build-test..

Patch below cures it. Thomas, can you stuff it into tip tree, or what do
you prefer?

Best regards,
Nam

diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index 51fa7ae5e2dd..b03d0ada6469 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -46,7 +46,7 @@ static void
 print_timer(struct seq_file *m, struct hrtimer *taddr, struct hrtimer *timer,
 	    int idx, u64 now)
 {
-	SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
+	SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer, function));
 	SEQ_printf(m, ", S:%02x", timer->state);
 	SEQ_printf(m, "\n");
 	SEQ_printf(m, " # expires at %Lu-%Lu nsecs [in %Ld to %Ld nsecs]\n",
