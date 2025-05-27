Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468D326A08C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355749; cv=none; b=h2+0pddTZPx/es7J1ycgt0X1q+NcfSUx8hD7pm5PDN5fL0DonGOffRRxRC75Gc3+XPP9LoU0ypHBypJwIJDbX1QNTa42tIwh5rlr45mZPTM42UFIbZSUsj2qFsiQlxZsD/mJ9tPvU7gBcZPxCr43/A02O7cORN/bZJK8hYB0cdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355749; c=relaxed/simple;
	bh=fz1BwwKnJX7bc80mYPOCVnFSqDej/v92nKTSRfGdeUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXdOxZcUW/xpPLiVByhZ1Rw+KUsZ+pgqWrm0EoaBp9j8GPMBL+LWyIzXh0c8bp6D9n22ZACeftwFxv+sfXnj4BXP6B48TyuEpSVH9amriRzCw0r4JP3CSALDSPZt4tCWae7OEIgHoJojMX8y8seudidW0YZNzkXKFjJMtwtETQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JMwuimLT; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JMwuimLT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BWHwqSSCz3w9Vxwmz8RCUy0hTjpLsuKSzcXgAbqJdVo=; b=JMwuimLT/CfUWl4n3oGdiVOPYQ
	r2DtkjsunGds9f0jvdoBMF2nU+J+T91n6eIF/PK1gdzJ8IsEQJMZ9FfIjpXsHwgXl9ca0FKDPWjSS
	X2ds2RNjSfsknVefwtX+HYEjDC0m5MJWli+SJofI5C2/rOVgxijuuf3ARVQAWAQCUbs0i4bILx09t
	Q6C29n2mj7OWZDcP2fkiNtodbU85zRr8ShcqGTsejvXnWFFECj3DACpRhUtjVZ/C4SlYKLIgaMUCC
	ylU0CbhIYGDeaL1QGOf+HfCqzAmJ8FkAI2opRiZN2OlMsiAnPfFCAW3e1GzyJ+CdAGMmF+AE241Jp
	UqozQOfA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvC6-0000000CUrG-2bbZ;
	Tue, 27 May 2025 14:22:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1BF6B3002CE; Tue, 27 May 2025 16:22:18 +0200 (CEST)
Date: Tue, 27 May 2025 16:22:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: syzbot <syzbot+9afaf6749e3a7aa1bdf3@syzkaller.appspotmail.com>
Cc: andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [syzbot] [kernel?] KASAN: wild-memory-access Read in
 get_futex_key
Message-ID: <20250527142217.GA7747@noisy.programming.kicks-ass.net>
References: <6835bfe3.a70a0220.253bc2.00b5.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6835bfe3.a70a0220.253bc2.00b5.GAE@google.com>

On Tue, May 27, 2025 at 06:36:35AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    785cdec46e92 Merge tag 'x86-core-2025-05-25' of git://git...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=13e47df4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d7ed3189f3c3d3f3
> dashboard link: https://syzkaller.appspot.com/bug?extid=9afaf6749e3a7aa1bdf3
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ad26d4580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=157f3170580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/af5446d375b0/disk-785cdec4.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/eb59d48f91fb/vmlinux-785cdec4.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/188617605a08/bzImage-785cdec4.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9afaf6749e3a7aa1bdf3@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: wild-memory-access in instrument_atomic_read include/linux/instrumented.h:68 [inline]
> BUG: KASAN: wild-memory-access in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
> BUG: KASAN: wild-memory-access in node_state include/linux/nodemask.h:429 [inline]
> BUG: KASAN: wild-memory-access in get_futex_key+0x595/0x1540 kernel/futex/core.c:587
> Read of size 8 at addr 1fffffff818b9088 by task syz-executor931/5831
> 
> CPU: 0 UID: 0 PID: 5831 Comm: syz-executor931 Not tainted 6.15.0-syzkaller-01958-g785cdec46e92 #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>  kasan_report+0xe0/0x110 mm/kasan/report.c:634
>  check_region_inline mm/kasan/generic.c:183 [inline]
>  kasan_check_range+0x100/0x1b0 mm/kasan/generic.c:189
>  instrument_atomic_read include/linux/instrumented.h:68 [inline]
>  _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
>  node_state include/linux/nodemask.h:429 [inline]
>  get_futex_key+0x595/0x1540 kernel/futex/core.c:587

Does the this help?

---
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 19a2c65f3d37..e9e46293c0c1 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -583,8 +583,7 @@ int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
 		if (futex_get_value(&node, naddr))
 			return -EFAULT;
 
-		if (node != FUTEX_NO_NODE &&
-		    (node >= MAX_NUMNODES || !node_possible(node)))
+		if ((unsigned)node >= nr_node_ids || !node_possible(node))
 			return -EINVAL;
 	}
 
