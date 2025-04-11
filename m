Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDBA22FF2E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392367; cv=none; b=PwXJhMCwRJ7TM1mz2cp3qZPDRVEAac/Sjx7Y7KNpThy2lywODAXmEA6CW0fVCGbK8OCcQMzAW8PYyg47W53JRnavwWWmUKs9Gq8poxX47w+tbFnVJMRK0wA826RVH97MOrqYa47QfDdSatvXDvxbWWNFMfpdOWnSTYOrKykNOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392367; c=relaxed/simple;
	bh=PBO0xSBl3p+r5w619Txk9CxWoMlSPUwJ3nwex/gboJ0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=K8ESUXo9n8zdb9vldrhamOZNSOOZj1Hj1lW++6cM9XAr4JCjUQuzAGCQXb3l5baoVgsQlVByZ8Lo54XQBxGSBfI2xVR0u8jAlUUvlbsuqOvvoS1k4v1QRFSZGcpKLzGqD0lB2nKHlL40SmPCvXGp5NHTPIxogw/0Xq2n0+3joco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5b38276deso40917885ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744392365; x=1744997165;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O4gngChlZ7BxpJPRfiXTb/5w+H5IwZDyEhTyXXgIiH4=;
        b=JgMrxfLhuv47nqCROw9B6T2gNKrpy5euYO+aQNX7d7N4GUXA+92iyVxQxL1dYSCecE
         SJmhjLALh066VlqSyaXR6YU6GfLRswK+roDaJo+0b/HX8w/m63kTlvuMprqyv4hVpqmc
         eHIVZN4rtkUwvQrntN453RCGEqENeBg/3GAc2nqgoyzEtE6A8X7Sgyt1E+NrYiwqLXSl
         3mu1yZeE1x8nV8f1iPaSM+eTsaYchTcijjy1FaNLoEiXNrhK3TWEkDbS24Ma0C+wx+p+
         rFu4rm2gYMkmepdkTWvZd9sSQD0RWWJSIjpbB1IGtrOn9aawu/nvy/NET8NRmC/synaW
         mJIw==
X-Gm-Message-State: AOJu0YwZisnnUwM3HKJS1tmZpZOybe3HV/1XDmPEFafbZ3pAr+LKe9EZ
	3G5YLBiUDyl5yv37Dks2ZXNrPIUOwAGk4zm7sdoTsN4vnIfPTrxbmKoIqZQr6iI9nniby7fivly
	xvl7KhANs9si5cciXnVNQQ/XsGBy+KLq0nch5V1n1DLL+5GGJVX22URU=
X-Google-Smtp-Source: AGHT+IEV66fyj2YObKPV50sNdpOn+sY6hAE8jIOGYrvK56ixa6HA/XPpp6hFIv8iTP84eTAgGZc+dlHnkUhzql90z7hpxCb8mlz7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148d:b0:3d4:700f:67e7 with SMTP id
 e9e14a558f8ab-3d7ec26b6f6mr34774065ab.17.1744392365089; Fri, 11 Apr 2025
 10:26:05 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:26:05 -0700
In-Reply-To: <0000000000004aa700061379547e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f950ad.050a0220.2c5fcf.0004.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bpf?] possible deadlock in __bpf_ringbuf_reserve
From: syzbot <syzbot+850aaf14624dc0c6d366@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [bpf?] possible deadlock in __bpf_ringbuf_reserve
Author: memxor@gmail.com

On Fri, 11 Apr 2025 at 19:19, syzbot
<syzbot+850aaf14624dc0c6d366@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> possible deadlock in __bpf_ringbuf_reserve
>
> ============================================
> WARNING: possible recursive locking detected
> 6.15.0-rc1-syzkaller-ge618ee89561b #0 Not tainted
> --------------------------------------------
> kworker/2:3/6044 is trying to acquire lock:
> ffffc90006f360d8 (&rb->spinlock){-.-.}-{2:2}, at: __bpf_ringbuf_reserve+0x36e/0x4b0 kernel/bpf/ringbuf.c:423
>
> but task is already holding lock:
> ffffc900070410d8 (&rb->spinlock){-.-.}-{2:2}, at: __bpf_ringbuf_reserve+0x36e/0x4b0 kernel/bpf/ringbuf.c:423
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(&rb->spinlock);
>   lock(&rb->spinlock);
>
>  *** DEADLOCK ***
>
>  May be due to missing lock nesting notation
>
> 6 locks held by kworker/2:3/6044:
>  #0: ffff88801b48ad48 ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
>  #1: ffffc90004c1fd18 ((work_completion)(&(&ssp->srcu_sup->work)->work)){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214
>  #2: ffff88801ea8f158 (&ssp->srcu_sup->srcu_gp_mutex){+.+.}-{4:4}, at: srcu_advance_state kernel/rcu/srcutree.c:1701 [inline]
>  #2: ffff88801ea8f158 (&ssp->srcu_sup->srcu_gp_mutex){+.+.}-{4:4}, at: process_srcu+0x73/0x1920 kernel/rcu/srcutree.c:1861
>  #3: ffffffff8e3c15c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
>  #3: ffffffff8e3c15c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
>  #3: ffffffff8e3c15c0 (rcu_read_lock){....}-{1:3}, at: __bpf_trace_run kernel/trace/bpf_trace.c:2362 [inline]
>  #3: ffffffff8e3c15c0 (rcu_read_lock){....}-{1:3}, at: bpf_trace_run2+0x1b6/0x590 kernel/trace/bpf_trace.c:2404
>  #4: ffffc900070410d8 (&rb->spinlock){-.-.}-{2:2}, at: __bpf_ringbuf_reserve+0x36e/0x4b0 kernel/bpf/ringbuf.c:423
>  #5: ffffffff8e3c15c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
>  #5: ffffffff8e3c15c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
>  #5: ffffffff8e3c15c0 (rcu_read_lock){....}-{1:3}, at: __bpf_trace_run kernel/trace/bpf_trace.c:2362 [inline]
>  #5: ffffffff8e3c15c0 (rcu_read_lock){....}-{1:3}, at: bpf_trace_run2+0x1b6/0x590 kernel/trace/bpf_trace.c:2404
>
> stack backtrace:
> CPU: 2 UID: 0 PID: 6044 Comm: kworker/2:3 Not tainted 6.15.0-rc1-syzkaller-ge618ee89561b #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Workqueue: rcu_gp process_srcu
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>  print_deadlock_bug+0x1e9/0x240 kernel/locking/lockdep.c:3042
>  check_deadlock kernel/locking/lockdep.c:3094 [inline]
>  validate_chain kernel/locking/lockdep.c:3896 [inline]
>  __lock_acquire+0xff7/0x1ba0 kernel/locking/lockdep.c:5235
>  lock_acquire kernel/locking/lockdep.c:5866 [inline]
>  lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5823
>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>  _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:162
>  __bpf_ringbuf_reserve+0x36e/0x4b0 kernel/bpf/ringbuf.c:423
>  ____bpf_ringbuf_reserve kernel/bpf/ringbuf.c:474 [inline]
>  bpf_ringbuf_reserve+0x57/0x90 kernel/bpf/ringbuf.c:466
>  bpf_prog_385141c453c15099+0x36/0x5d
>  bpf_dispatcher_nop_func include/linux/bpf.h:1316 [inline]
>  __bpf_prog_run include/linux/filter.h:718 [inline]
>  bpf_prog_run include/linux/filter.h:725 [inline]
>  __bpf_trace_run kernel/trace/bpf_trace.c:2363 [inline]
>  bpf_trace_run2+0x230/0x590 kernel/trace/bpf_trace.c:2404
>  __bpf_trace_contention_begin+0xc9/0x110 include/trace/events/lock.h:95
>  __traceiter_contention_begin+0x5a/0xa0 include/trace/events/lock.h:95
>  __preempt_count_dec_and_test arch/x86/include/asm/preempt.h:95 [inline]
>  class_preempt_notrace_destructor include/linux/preempt.h:482 [inline]
>  __do_trace_contention_begin include/trace/events/lock.h:95 [inline]
>  trace_contention_begin.constprop.0+0xde/0x160 include/trace/events/lock.h:95
>  __pv_queued_spin_lock_slowpath+0x109/0xcf0 kernel/locking/qspinlock.c:219
>  pv_queued_spin_lock_slowpath arch/x86/include/asm/paravirt.h:572 [inline]
>  queued_spin_lock_slowpath arch/x86/include/asm/qspinlock.h:51 [inline]
>  queued_spin_lock include/asm-generic/qspinlock.h:114 [inline]
>  do_raw_spin_lock+0x20e/0x2b0 kernel/locking/spinlock_debug.c:116
>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:111 [inline]
>  _raw_spin_lock_irqsave+0x42/0x60 kernel/locking/spinlock.c:162
>  __bpf_ringbuf_reserve+0x36e/0x4b0 kernel/bpf/ringbuf.c:423
>  ____bpf_ringbuf_reserve kernel/bpf/ringbuf.c:474 [inline]
>  bpf_ringbuf_reserve+0x57/0x90 kernel/bpf/ringbuf.c:466
>  bpf_prog_385141c453c15099+0x36/0x5d
>  bpf_dispatcher_nop_func include/linux/bpf.h:1316 [inline]
>  __bpf_prog_run include/linux/filter.h:718 [inline]
>  bpf_prog_run include/linux/filter.h:725 [inline]
>  __bpf_trace_run kernel/trace/bpf_trace.c:2363 [inline]
>  bpf_trace_run2+0x230/0x590 kernel/trace/bpf_trace.c:2404
>  __bpf_trace_contention_begin+0xc9/0x110 include/trace/events/lock.h:95
>  __traceiter_contention_begin+0x5a/0xa0 include/trace/events/lock.h:95
>  __do_trace_contention_begin include/trace/events/lock.h:95 [inline]
>  trace_contention_begin+0xc1/0x130 include/trace/events/lock.h:95
>  __mutex_lock_common kernel/locking/mutex.c:603 [inline]
>  __mutex_lock+0x1a6/0xb90 kernel/locking/mutex.c:746
>  srcu_advance_state kernel/rcu/srcutree.c:1701 [inline]
>  process_srcu+0x73/0x1920 kernel/rcu/srcutree.c:1861
>  process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
>  process_scheduled_works kernel/workqueue.c:3319 [inline]
>  worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
>  kthread+0x3c2/0x780 kernel/kthread.c:464
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
>
>
> Tested on:
>
> commit:         e618ee89 Merge tag 'spi-fix-v6.15-rc1' of git://git.ke..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10461c04580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=36c5de4d99134dda
> dashboard link: https://syzkaller.appspot.com/bug?extid=850aaf14624dc0c6d366
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>
> Note: no patches were applied.

#syz test: https://github.com/kkdwivedi/linux.git res-lock-next
