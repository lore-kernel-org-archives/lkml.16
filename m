Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC78F246791
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682076; cv=none; b=g/ebvF1/PFpfZ9kbBPl0az2ZT4iOCdXoIDGf7Gb/DFae85U1fW8jl5UXsqYS5KlOByUKfVrhDKXhb5lYOsF2iHrsm1AbQENjowS1HBiKYFYN0NqJCp3v9397lGpwLEWFNHDx5rMgVJo56H2s37nYvi2dCbSkFOOb04KjKnnHuhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682076; c=relaxed/simple;
	bh=StnkZkswzc1DDVKbjSfHiuVq8IOtiYuEMR2T0Re636A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dk6R/Qxl5u2x9cMGvmE8VqC+BpCEsTer7g9LukSnvCmMlkz3L9rGJAh3/4iqx+OePAmAcECLbNJmNS8ZixG4Ji1+b06ZxCk9bNxGNwiGP8h+ij2p/IPpyp/QMbQZJTXe0N2m6L8iRzhtnSe8SUxRA62ZErN/47I9GoEY966a8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oi4BCk1M; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oi4BCk1M"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so11369a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682070; x=1751286870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MARF29OAc+PmRb66ojviU3MyiMZnld7oCbVgQnwRVc=;
        b=Oi4BCk1MiYdPR8o2Zqnrn84nZJR/Cg19/hSMDhFqdsre9zY1lDMgPOONcRj3DrSmPt
         wFrH8T+kC7Ymx/Dep1pacEi9aM27NckKnjM8HTl0nI+LObnRu66SbxypgibDX+A7e9PA
         myJdF3t9/9mY+YdG5oUfHmMECB9BW2nIq0/IRw11UdtBaPMyQB+BnTR15jMDcdhnvdtN
         cxbVXHm7RSlIOjPbP4sH27CpaPego0ux3H10LMyT1djO6hidl9DxlGchNR8TnOihxTjk
         7xhbIzWCLdvTKaosjKI0EzLf8J/+evi6ytlqPgzRll2vkP3LN/9tgvUAJxcliNMGf4gw
         fyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682070; x=1751286870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MARF29OAc+PmRb66ojviU3MyiMZnld7oCbVgQnwRVc=;
        b=inwcQnIP8wSv0li02v+bMns+Sjf679h+uLNv/3uX1Y1G+BbS60mL0ATSWQ7n41Bxrl
         xUSya73onJTkQXRWbA+bzwkjyz5s1l2SLqY2qvREwgHozBEIlz2SzD1uV6W3e8NyxILJ
         Ge9GB/Gq+ztcFdioRRr2ds9SsV8eOPvw7dd8WPw1Mghb5gUls3mdQDKjyzWDbFAvK5Ji
         Wq5bfORdDNYUwQ1Mo7kjKum54qn8pQEQVB3rE5b1X15nVa/V/lfAcirMwJBXQ6uSqR11
         bRMSYDiks1CVL6SGSuBAQ3zADV2rEa/2ie0TIDuU2ym0b1EmmvsOidsHMjQGA3bhvtCY
         ZsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb0w62rRdu/trf5mLNiLT4J56UqSxHzybMXc5a1FFNDyD6nSpohC+WPnkUZtOMU+5D8xvZXRxUCLq2hWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7CZtXStyPklL1dweHAkHCnMisu1g1im7tvm4+krZjVMjImhMO
	tjfErGfodpedFsNUqJdHJbmYBgA9JHo8mtlCYVFj4BWBS38YPNpxAQgJyGm0pk6BQy/7QfHJdP4
	QJW9n6fv12pP/YZtCfqK7IafJVGDEgW8=
X-Gm-Gg: ASbGncvIkk1E94MpaGLo+BymQps/HdWe02ziKDPuFPJLWdmqyxfK9Vm3iAUpIgDNQp2
	k188ljqJ1RrEBADXncHjA6qt4jIyvTw33nYTO0WZbnOfKAf0D1/wmXpvC3xzaDIGnOhG4T8MnA7
	I1KpbhazarMKlyuy4KdYxE7chpek63rSOqmPu0DULfdraNuZM=
X-Google-Smtp-Source: AGHT+IFN2ePmEegPKI3R3D03/EdjNcmNMCvNHwHrFbdO+vY/Yd9yUIqd0Argi2GfklD5puMN7GILO747WP5HJPvzLGI=
X-Received: by 2002:a05:6402:42d4:b0:607:fd58:aafe with SMTP id
 4fb4d7f45d1cf-60a1d19f9a3mr11536967a12.30.1750682069857; Mon, 23 Jun 2025
 05:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612042005.99602-1-lance.yang@linux.dev>
In-Reply-To: <20250612042005.99602-1-lance.yang@linux.dev>
From: Lance Yang <ioworker0@gmail.com>
Date: Mon, 23 Jun 2025 20:33:53 +0800
X-Gm-Features: AX0GCFuZXdhRcty-2nx10S2tlR0LdDrUW3UyVX9eSI9SnhHQpckp20RQCAfDORs
Message-ID: <CAK1f24=MV1=7HjuYrts0jJzLFCzS7p+sZuSwky1BarHOCgooEQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] extend hung task blocker tracking to rwsems
To: akpm@linux-foundation.org
Cc: zi.li@linux.dev, anna.schumaker@oracle.com, boqun.feng@gmail.com, 
	joel.granados@kernel.org, jstultz@google.com, kent.overstreet@linux.dev, 
	leonylgao@tencent.com, linux-kernel@vger.kernel.org, longman@redhat.com, 
	mhiramat@kernel.org, mingo@redhat.com, mingzhe.yang@ly.com, 
	peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org, 
	tfiga@chromium.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gently ping ;p

On Thu, Jun 12, 2025 at 12:20=E2=80=AFPM Lance Yang <ioworker0@gmail.com> w=
rote:
>
> Hi all,
>
> Inspired by mutex blocker tracking[1], and having already extended it to
> semaphores, let's now add support for reader-writer semaphores (rwsems).
>
> The approach is simple: when a task enters TASK_UNINTERRUPTIBLE while
> waiting for an rwsem, we just call hung_task_set_blocker(). The hung task
> detector can then query the rwsem's owner to identify the lock holder.
>
> Tracking works reliably for writers, as there can only be a single writer
> holding the lock, and its task struct is stored in the owner field.
>
> The main challenge lies with readers. The owner field points to only one
> of many concurrent readers, so we might lose track of the blocker if that
> specific reader unlocks, even while others remain. This is not a
> significant issue, however. In practice, long-lasting lock contention is
> almost always caused by a writer. Therefore, reliably tracking the writer
> is the primary goal of this patch series ;)
>
> With this change, the hung task detector can now show blocker task's info
> like below:
>
> [Thu Jun 12 11:01:33 2025] INFO: task rw_sem_thread2:36526 blocked for mo=
re than 122 seconds.
> [Thu Jun 12 11:01:33 2025]       Tainted: G S         O        6.16.0-rc1=
 #1
> [Thu Jun 12 11:01:33 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_s=
ecs" disables this message.
> [Thu Jun 12 11:01:33 2025] task:rw_sem_thread2  state:D stack:0     pid:3=
6526 tgid:36526 ppid:2      task_flags:0x208040 flags:0x00004000
> [Thu Jun 12 11:01:33 2025] Call Trace:
> [Thu Jun 12 11:01:33 2025]  <TASK>
> [Thu Jun 12 11:01:33 2025]  __schedule+0x7c7/0x1930
> [Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? _raw_spin_lock_irq+0x8a/0xe0
> [Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  schedule+0x6a/0x180
> [Thu Jun 12 11:01:33 2025]  schedule_preempt_disabled+0x15/0x30
> [Thu Jun 12 11:01:33 2025]  rwsem_down_write_slowpath+0x447/0x1090
> [Thu Jun 12 11:01:33 2025]  ? __pfx_rwsem_down_write_slowpath+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx___might_resched+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx_thread2_func+0x10/0x10 [rw_sem_test_2=
]
> [Thu Jun 12 11:01:33 2025]  down_write+0x125/0x140
> [Thu Jun 12 11:01:33 2025]  ? __pfx_down_write+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? msleep+0x91/0xf0
> [Thu Jun 12 11:01:33 2025]  ? __raw_spin_lock_irqsave+0x8c/0xf0
> [Thu Jun 12 11:01:33 2025]  thread2_func+0x37/0x70 [rw_sem_test_2]
> [Thu Jun 12 11:01:33 2025]  kthread+0x39f/0x750
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ret_from_fork+0x25d/0x320
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ret_from_fork_asm+0x1a/0x30
> [Thu Jun 12 11:01:33 2025]  </TASK>
> [Thu Jun 12 11:01:33 2025] INFO: task rw_sem_thread2:36526 <writer> block=
ed on an rw-semaphore likely owned by task rw_sem_thread1:36525 <writer>
> [Thu Jun 12 11:01:33 2025] task:rw_sem_thread1  state:S stack:0     pid:3=
6525 tgid:36525 ppid:2      task_flags:0x208040 flags:0x00004000
> [Thu Jun 12 11:01:33 2025] Call Trace:
> [Thu Jun 12 11:01:33 2025]  <TASK>
> [Thu Jun 12 11:01:33 2025]  __schedule+0x7c7/0x1930
> [Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __mod_timer+0x304/0xa80
> [Thu Jun 12 11:01:33 2025]  ? irq_work_queue+0x6a/0xa0
> [Thu Jun 12 11:01:33 2025]  ? __pfx_vprintk_emit+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  schedule+0x6a/0x180
> [Thu Jun 12 11:01:33 2025]  schedule_timeout+0xfb/0x230
> [Thu Jun 12 11:01:33 2025]  ? __pfx_schedule_timeout+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx_process_timeout+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? down_write+0xc4/0x140
> [Thu Jun 12 11:01:33 2025]  msleep_interruptible+0xbe/0x150
> [Thu Jun 12 11:01:33 2025]  ? __pfx_thread1_func+0x10/0x10 [rw_sem_test_2=
]
> [Thu Jun 12 11:01:33 2025]  thread1_func+0x37/0x60 [rw_sem_test_2]
> [Thu Jun 12 11:01:33 2025]  kthread+0x39f/0x750
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ret_from_fork+0x25d/0x320
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ret_from_fork_asm+0x1a/0x30
> [Thu Jun 12 11:01:33 2025]  </TASK>
>
> [1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469=
.stgit@mhiramat.tok.corp.google.com/
>
> Thanks,
> Lance
>
> Lance Yang (3):
>   locking/rwsem: make owner helpers globally available
>   locking/rwsem: clear reader-owner on unlock to reduce false positives
>   hung_task: extend hung task blocker tracking to rwsems
>
>  include/linux/hung_task.h | 18 +++++++++---------
>  include/linux/rwsem.h     | 12 ++++++++++++
>  kernel/hung_task.c        | 29 +++++++++++++++++++++++++----
>  kernel/locking/rwsem.c    | 31 +++++++++++++++++++++++--------
>  4 files changed, 69 insertions(+), 21 deletions(-)
>
> --
> 2.49.0
>
