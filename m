Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506D82957B4
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747069769; cv=none; b=DJRPDu2aZwyf7OGXChgM8ZghVYFKFoZgaWXZEyny7APGyNciCZzFfKcgKMv7EgzZhGT0WfiB3HDCjxoWyIcWr5a3z/YqmaV/jcDR+mmZGZC+zgpJpFmZso9TJ0HjXzMQLp3oZmNPJcBViEJmta34HYdc9GAv15aXxagYF45W/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747069769; c=relaxed/simple;
	bh=KN+BalTZObaLwr9dLx72cSrNDW6JS71GgaSDZm64U5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYyqLtm0DAeObISo2LlaPHd6EGFpqTDWciNxVR8TfG7RMjoNsFJLB3VtmQi4gU65admLdobIqyIrsR/8ysBOCIF6PK2L5q/Rkm7ONnCBnFAYxr4vOCchljko6niX7WugS1YS21rhj8f6LDy+9KPgDdY+XLIFRyIJCf/ZKvXo8yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iRTPiAKC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iRTPiAKC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fc4fc27983so494a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747069765; x=1747674565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xA4hXDiJTOqrw9v7C63HCsGIrY+T2CW3IJC/Gos96Q=;
        b=iRTPiAKCB5lXQaq9Tg1XE3JDHNUT0c0yiZGs258mpaxuvUD39+Dkl6KU5gPbKJlyDA
         8ErJLQyfLveLCXVTbdc68pKTCUJXoICxoH2NzAOFyW+lc7BAEsVpwfMTGDQAjoOC4YEB
         wjNi6D5CbC95gYE3O4cEWeuIIAWnx5Sa+PPximvQ8tyi+3eo0fXxSyt8JdHg3OVqXqsk
         JxNgYBGsYkvqQq62/dlTH3XLP22TQKFK4GH6w/Sh3j9ZkF6bc6PNMu72kF4BY7Xz5+no
         4xGITJ+wh93o3ATM+sowGpS0DG5Uqoi1lWnJ+kFy+UXTyLmLV0lHzG631qdr1V7F7r3k
         P7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747069765; x=1747674565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xA4hXDiJTOqrw9v7C63HCsGIrY+T2CW3IJC/Gos96Q=;
        b=i7bb3046RSx1Q+LiHr4dmoThbHQpRY2XbZGgLe9FA0berbuC0TA4Y70rbhYJ9n+GOT
         R0o9RjB7/2Gjn8W9dIPxp53qbjW2BIM9zttwHwMyCmXIYhMjfMbTnA/Q2c0yzoSNLZlM
         fzlY3AxTGyUMjLB53YgHtrh5a21P0eblzG4O3+PDTkFLWseDqrvJO9ncu3uSlqJIpmj3
         H2/dRd8iSVpZLH9+Whp6WG2YF9z54tjP70U5uP6zbyo/8brS9okOM/bRDnAnRefPyram
         LiEcU8r+Djny3J7j5Hy+ABXHTcIFCKNxHLQ6Esx02NZnBJKXYRFeYkqn9CTygwFLDJkC
         kAUA==
X-Forwarded-Encrypted: i=1; AJvYcCWT2S4fHwIqseq7P0pqyU0kvPwEX0e/m4XQgWY6UmaKZagsCGSqHk3XKeoNrGLbWMRpqf2neWBjuH6hsX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxubWlqssgeUz7aeyV2GRMJmVEsgX3w0vmWzm1zM9RmGheDjVo
	iQfW+8mrmVbjzmrdi2FYUntbnA4BZJabmNbyjnluElRKu6LRrzjxqvSeUbpDjf+/mR6Erhc4j94
	cgyWluv2im9WTWWggQhnjP2HlqMmMb2ANIpMr
X-Gm-Gg: ASbGnctrMflzc48FB3TkgccYdIn/XqQ6YZBibzzr3gs2HpC4Ti0PRahi8yUhuXlSJMM
	QhOfVgHddXxlZMnAoIdz2iqhYjCgbXqtSfixb8oZGkg/oIIxhHBPEx1QXS3r04Wbssp1x8hhfvK
	obvYhA60wuLnRN+2t9ntUgBfKamHyo2IaEass42jJ2YHb2tHqmGNiubU8if2o=
X-Google-Smtp-Source: AGHT+IHcOgWNDsuVhEhzn0EYH1WFbiw9zSlOfSNM8iF5SvBUQFz6ojSSaePK3bgKsjQtCwbXMxK3NhJBcJSkE6DzCgE=
X-Received: by 2002:a50:cd08:0:b0:5fd:6065:7bbc with SMTP id
 4fb4d7f45d1cf-5fd60657bf5mr95281a12.0.1747069765111; Mon, 12 May 2025
 10:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <682196ed.050a0220.f2294.0053.GAE@google.com> <81a0d2da-d863-4a6e-8d3b-b899d38ea605@kernel.dk>
In-Reply-To: <81a0d2da-d863-4a6e-8d3b-b899d38ea605@kernel.dk>
From: Jann Horn <jannh@google.com>
Date: Mon, 12 May 2025 19:08:49 +0200
X-Gm-Features: AX0GCFuq_g4AfY0PHmir37iGT2R5rx3E-VYkDkABiEeWv2bw0Ptt1mi7L2zvqoc
Message-ID: <CAG48ez20ot+-H1DmJ86COL4p_oif4mw9dvBRD7Ff5B-=axhtPQ@mail.gmail.com>
Subject: Re: [syzbot] [io-uring] KCSAN: data-race in copy_mm / percpu_counter_destroy_many
To: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Pedro Falcato <pfalcato@suse.de>
Cc: syzbot <syzbot+8be9bf36c3cf574426c8@syzkaller.appspotmail.com>, 
	asml.silence@gmail.com, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	Linux-MM <linux-mm@kvack.org>, dennis@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+mmap maintainers

On Mon, May 12, 2025 at 3:51=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> On 5/12/25 12:36 AM, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    3ce9925823c7 Merge tag 'mm-hotfixes-stable-2025-05-10-1=
4-2..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D14ff74d4580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6154604431d=
9aaf9
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D8be9bf36c3cf5=
74426c8
> > compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89=
dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/afdc6302fc05/d=
isk-3ce99258.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/fc7f98d3c420/vmli=
nux-3ce99258.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/ea7ca2da2258=
/bzImage-3ce99258.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+8be9bf36c3cf574426c8@syzkaller.appspotmail.com
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KCSAN: data-race in copy_mm / percpu_counter_destroy_many
> >
> > write to 0xffff8881045e19d8 of 8 bytes by task 2123 on cpu 0:
> >  __list_del include/linux/list.h:195 [inline]
> >  __list_del_entry include/linux/list.h:218 [inline]
> >  list_del include/linux/list.h:229 [inline]
> >  percpu_counter_destroy_many+0xc7/0x2b0 lib/percpu_counter.c:244
> >  __mmdrop+0x22e/0x350 kernel/fork.c:947
> >  mmdrop include/linux/sched/mm.h:55 [inline]
> >  io_ring_ctx_free+0x31e/0x360 io_uring/io_uring.c:2740
> >  io_ring_exit_work+0x529/0x560 io_uring/io_uring.c:2962
> >  process_one_work kernel/workqueue.c:3238 [inline]
> >  process_scheduled_works+0x4cb/0x9d0 kernel/workqueue.c:3319
> >  worker_thread+0x582/0x770 kernel/workqueue.c:3400
> >  kthread+0x486/0x510 kernel/kthread.c:464
> >  ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >
> > read to 0xffff8881045e1600 of 1344 bytes by task 5051 on cpu 1:
> >  dup_mm kernel/fork.c:1728 [inline]
> >  copy_mm+0xfb/0x1310 kernel/fork.c:1786
> >  copy_process+0xcf1/0x1f90 kernel/fork.c:2429
> >  kernel_clone+0x16c/0x5b0 kernel/fork.c:2844
> >  __do_sys_clone kernel/fork.c:2987 [inline]
> >  __se_sys_clone kernel/fork.c:2971 [inline]
> >  __x64_sys_clone+0xe6/0x120 kernel/fork.c:2971
> >  x64_sys_call+0x2c59/0x2fb0 arch/x86/include/generated/asm/syscalls_64.=
h:57
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xd0/0x1a0 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > Reported by Kernel Concurrency Sanitizer on:
> > CPU: 1 UID: 0 PID: 5051 Comm: syz.1.494 Not tainted 6.15.0-rc5-syzkalle=
r-00300-g3ce9925823c7 #0 PREEMPT(voluntary)
>
> This doesn't look like an io_uring issue, it's successive setup and teard=
own
> of a percpu counter. Adding some relevant folks.

This is an intentional-but-dodgy data race:

dup_mm() does memcpy() of the entire old mm_struct, while the old
mm_struct is not yet locked, in order to initialize some parts of the
new mm_struct that are expected to be stable (I guess?); and then
afterwards re-initializes all the important fields with proper
locking.

(What happens in the KCSAN report is that one mm is being forked while
an **unrelated** mm is being destroyed; and the unrelated mm's
destruction involves a linked list deletion at mm.rss_stat[].list, and
the two mm's happen to be adjacent on this linked list, so destroying
the unrelated mm updates a linked list element embedded in the first
mm.)

This design is pretty dirty, and it would be a good idea to get rid of
that memcpy() by going through every mm_struct field, checking whether
it is already initialized after the memcpy(), and figuring out proper
initialization if it isn't; another easier, less clean approach would
be to just slap a data_race() annotation around the memcpy() for now.

From a quick look, I think these are the fields that might not be reinitial=
ized:

Fields that are safe to copy without lock because they're immutable:

 - mmap_{compat_,}{legacy_,}base
 - task_size
 - binfmt

Fields which could actually race but only if CRIU-specific APIs raced
with execve:

 - {start,end}_{code,data}
 - start_brk, start_stack
 - {arg,env}_{start,end}
 - saved_auxv

Fields which actually look like they might be data racing in practice
(but with most of these, probably not much bad stuff actually results
from that):

 - membarrier_state
 - mm_cid_next_scan
 - brk
 - numa_scan_offset
 - tlb_flush_batched
 - ksm_merging_pages, ksm_rmap_items, ksm_zero_pages

And then there's arch-specific stuff in mm_context_t, I haven't looked
at that for all architectures. But there is some pretty dodgy stuff in
there too, for example on X86 the mm->context.vdso_image pointer can
be updated through the CRIU API concurrently with the memcpy(), and it
doesn't look like that pointer is re-initialized later, so I think
that could theoretically result in a torn pointer being accessed later
on in the child. (Note that memcpy() is very much not guaranteed to
copy pointer-sized fields atomically, though it tends to often do that
in practice.)
