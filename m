Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAE326289
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 11:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743940007; cv=none; b=CFJRdcgonanRbh4x+4p7Uv7GP/GaHTiFNPLBw00DfCjGemrskDGhzJZkeVhjhXMwt/cDlXrCBxqNx0ZTsi4EQVNHkBact19G22En7kkLsYY5vfWHRWGHWVtNxsws0fD8M04vFH7FEjmbA6OTC/UU2zxTl/geYvXQRzvwCFuGveo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743940007; c=relaxed/simple;
	bh=qqe6Zi6MQG+sA1pxEyvmzL5igGv8DBuT289dblK3TGs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SLaNIUL0GPrC5MNKcwsQ4fRJpJGaMs4NGALPnrJt76q5y2FOlILbZLb9j5A5Wtxr/jlYMb9nc3+d6M4Cs/MH6mWFbI4pDn7k0wDI4qyt/tIDN8fOsfXPMzDFB97DIeT2EqgKGF5Gn5Pzd535PWuigCDAJBOWqyDnHd3LdtE7E0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OMxbjjzX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KtW31cbm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OMxbjjzX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KtW31cbm"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743940003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o7S/wiaEjaLl4Hv30YoGRRVs9Yys2GtJ8UB6Hqcas3A=;
	b=OMxbjjzXJaPO9OxLKCD4wOvRFqdlejj0E38+HwaqPoXt9WGcUNCqGZzzdGOFnWcZl9EZy6
	XHxpvj0nuOJjLkOcKjnqbw02/tCwwVQP6WSn7xWv/ikRPguNe/3j+Q5nFToA3Hbh9re2IJ
	5j275DIwBW499HI1pxaaQ9cicCb27AuV28Ar8w5wuR+iFSl/c3kBNq7560We5G9Y+wC2Av
	OtfvQAZkhPgdSX4daRRtx0VOqU9bBne3MBAckD0czcIzZHFbOERuIbr/lGI6oBafQ+VeZ1
	1w6SE0ysqMyL+kIDi4Yr1HHFvBmIALYhP4ZNE0gtsyJ8jHeXIkKfkdTey5jffg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743940003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o7S/wiaEjaLl4Hv30YoGRRVs9Yys2GtJ8UB6Hqcas3A=;
	b=KtW31cbmapYQlGQu+4GnEFrLBgVZ8wzictKTSdbYfeERFJIVr9X+A7V8aro9xpiX8AlCmj
	AP6pYOXeSiX35jCg==
To: I Hsin Cheng <richard120310@gmail.com>,
 syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de, frederic@kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, Alexander
 Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry
 Vyukov <dvyukov@google.com> 
Subject: Re: [RFC PATCH RESEND] timerqueue: Complete rb_node initialization
 within timerqueue_init
In-Reply-To: <20250405080533.519290-1-richard120310@gmail.com>
References: <67e52451.050a0220.2f068f.0027.GAE@google.com>
 <20250405080533.519290-1-richard120310@gmail.com>
Date: Sun, 06 Apr 2025 13:46:43 +0200
Message-ID: <878qodwlzw.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Apr 05 2025 at 16:05, I. Hsin Cheng wrote:
> The children of "node" within "struct timerqueue_node" may be uninit
> status after the initialization. Initialize them as NULL under
> timerqueue_init to prevent the problem.

Which problem?

It's completely sufficient to use RB_INIT_NODE() on initialization.

As you did not provide a link and no explanation, I had to waste some
time to search though the syzbot site and looked at the actual issue:

BUG: KMSAN: uninit-value in rb_next+0x200/0x210 lib/rbtree.c:505
 rb_next+0x200/0x210 lib/rbtree.c:505
 rb_erase_cached include/linux/rbtree.h:124 [inline]
 timerqueue_del+0xee/0x1a0 lib/timerqueue.c:57
 __remove_hrtimer kernel/time/hrtimer.c:1123 [inline]
 __run_hrtimer kernel/time/hrtimer.c:1771 [inline]
 __hrtimer_run_queues+0x3b7/0xe40 kernel/time/hrtimer.c:1855
 hrtimer_interrupt+0x41b/0xb10 kernel/time/hrtimer.c:1917
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1038 [inline]
 __sysvec_apic_timer_interrupt+0xa7/0x420 arch/x86/kernel/apic/apic.c:1055
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x7e/0x90 arch/x86/kernel/apic/apic.c:1049

So this code removes a queued timer from the RB tree and that KMSAN
warning happens in rb_next(), which is invoked from rb_erase_cached().

The issue happens in lib/rbtree.c:505

505:    while (node->rb_left)
506:          node = node->rb_left;

which is walking the tree down left. So that means it hits a pointer
which points to uninitialized memory.

All timers are queued with rb_add_cached(), which calls rb_link_node()
and that does:

    node->rb_left = node->rb_right = NULL;

Which means there can't be a timer enqueued in the RB tree which has
rb_left/right uninitialized.

So how does this end up at uninitialized memory? There are two
obvious explanations:

    1) A stray pointer corrupts the RB tree

    2) A queued timer has been freed

So what would this "initialization" help? Nothing at all.

We are not adding some random pointless initialization to paper
over a problem which is absolutely not understood.

Thanks,

        tglx


