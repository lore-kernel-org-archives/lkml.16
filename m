Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E2718EFD1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749702018; cv=none; b=oyiX3fbBex5amZbopG4hFst2C9d/m1jdHLC68k9B2QfpidwcXe0dOUwxlidysG7ztvPPf0tPRnEG76BtAprrKtSsQCg2NiEgv3q9bQHYf1dSklIv5dvBpyWfxCHztxdQMChsy2SLKJZvU4fdAGgkML+X0Q5rWNje6PoohygQKww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749702018; c=relaxed/simple;
	bh=YtVuhdDFhkiyy6k3UXFHjI9pLcHTjEXoJ3m9S8DtA1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DSsibz7cAiktG6cOTOutzHQrmvtsHvodKSFaAn8Z1Mbz0pZEdvhx6cft0aY2R10YAvPtwL7zgfWLQFLuS7fvbZ21g5dwm9O7gubUVgU20+8I2PuIxQJK9P41Jr2GFW4svtR6QNePie1BkhA5WOC8hwCDFEIVGI4PoT0jMGZyNP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/TgHzQx; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/TgHzQx"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso439716b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749702016; x=1750306816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/oJA+/pMM+r8skY0Sy7euJgpsfBpkoRiiJD5vVTuvXw=;
        b=Y/TgHzQxzRL/PeemST02nHpioGTFE3MYFGOv+KYcux0RA41zCUU8W3ex38fdlK/j7k
         ajlmVJE9IxYBG1PDP5imxQRIm1lFEV0TsURpLTXlWqqyPAQPhvquF8qQ+DCATTrem3P5
         QL5vZtGZKifjRUzbYyZVh0YBoyd9+UE7CPQKCmvCkBQQnJ7R9sTWUpWmtP28eTqeEeZP
         pyBlmMDovuBKsH8C7rmdSwOU8w3MVV6P8qbcYg9pA2RsNs+/MzVf68inI+8sAcrlG8jb
         luCG25+2mYpejdAlBVxXrEkAv0fNMJMbeUJcgw7shqxyMFna6EcgdWXb/esWI9RQnPkJ
         +2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749702016; x=1750306816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oJA+/pMM+r8skY0Sy7euJgpsfBpkoRiiJD5vVTuvXw=;
        b=B9hcYkz7ajX9eRGfUSqv/zhDG8C/07aeVJpWfHJlN17jWZp8+ToAzyL1YnCwkiR/6p
         rgaFHFayS2eV3QTmI4G07UqaGGlzcL+xFJsyNNAnNOTUqMCfOFFVMmxE/qWpIAXt9yvW
         05mGY5gJQcaAL8DxT1BRXDfJFdSU+2MfJXla/b6RxsQN18yHh2gqjoueJ2nBkr1gfwxc
         u+qqU1RGM+3yl9QpbTIHyHd/b1X6NOf5nHrb2pTgwGEJ+vWz5GX9D//tzGpUIwVZUfIz
         RNjmvBeJYRq7Z7s/rfvhZIGt6QsBMst+UE943R371jI2/SiRNQ550tCF90sWX85rVzm9
         OB5A==
X-Forwarded-Encrypted: i=1; AJvYcCUcOo2YSmpjVMGTn+PRIW1NyiHG/M46UFB4iWRK0Wi4glCjixhhqcVJ93GdBO+kz2HobzzaWeJLE9Q9UIE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6b9KjY0IISYslcA9pQsWIGWtHeUG/dU4CWy4I+669SOQhiCHV
	ZmxO+uBn4E5ZRN0irvoC+4YYeJFmNUty75PdYSnWc1NiltyrP8LfeZJy
X-Gm-Gg: ASbGncsh87v2PLrdxOeJkSSuLUS0eC87Se1LltOXZvrt01j0GhpsJ9m+WsQPrK/ajRy
	Kud5+Hu1cZZEzw5NCfAnvgfYU4z8q+xBESG2dJDDxg2GhU3BEKoe1YXJDCLISLDrDSgZAaLWSiQ
	HvSQ/NaQw/OWUuMZkdzPvGoO4bGZU9gJjVbQryKFF8awMKFY71k+J/K4/GOXHTfqO6lA6BhcP3I
	fNm7gLBVpGhQRNhtoAXUkiVgaxRyeSwBqJCU8EX1FNkE47ozadby2O/MCDj8tf76NfdDSIg7ft5
	CpBjnzmXBxqMZ7AsI1P5V1HQXkSf64IZKkhd7lDJHYbnEShSAg6Ak4ovZ19eu5F5N/QU1Eg=
X-Google-Smtp-Source: AGHT+IFrICv0uvFeYxF7lQUwfHCC+ZGTWZMSQZaRDgvQ3927CItSQCP0Tr/vRnYsUL5hGN1oQ6kUcQ==
X-Received: by 2002:a05:6a00:4504:b0:746:2c7f:b271 with SMTP id d2e1a72fcca58-7486cb63ecamr7783273b3a.9.1749702015627;
        Wed, 11 Jun 2025 21:20:15 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([103.88.46.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748809d2b79sm439361b3a.92.2025.06.11.21.20.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Jun 2025 21:20:15 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: zi.li@linux.dev,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	will@kernel.org
Subject: [PATCH RFC 0/3] extend hung task blocker tracking to rwsems
Date: Thu, 12 Jun 2025 12:19:23 +0800
Message-ID: <20250612042005.99602-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Inspired by mutex blocker tracking[1], and having already extended it to
semaphores, let's now add support for reader-writer semaphores (rwsems).

The approach is simple: when a task enters TASK_UNINTERRUPTIBLE while
waiting for an rwsem, we just call hung_task_set_blocker(). The hung task
detector can then query the rwsem's owner to identify the lock holder.

Tracking works reliably for writers, as there can only be a single writer
holding the lock, and its task struct is stored in the owner field.

The main challenge lies with readers. The owner field points to only one
of many concurrent readers, so we might lose track of the blocker if that
specific reader unlocks, even while others remain. This is not a
significant issue, however. In practice, long-lasting lock contention is
almost always caused by a writer. Therefore, reliably tracking the writer
is the primary goal of this patch series ;)

With this change, the hung task detector can now show blocker task's info
like below:

[Thu Jun 12 11:01:33 2025] INFO: task rw_sem_thread2:36526 blocked for more than 122 seconds.
[Thu Jun 12 11:01:33 2025]       Tainted: G S         O        6.16.0-rc1 #1
[Thu Jun 12 11:01:33 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[Thu Jun 12 11:01:33 2025] task:rw_sem_thread2  state:D stack:0     pid:36526 tgid:36526 ppid:2      task_flags:0x208040 flags:0x00004000
[Thu Jun 12 11:01:33 2025] Call Trace:
[Thu Jun 12 11:01:33 2025]  <TASK>
[Thu Jun 12 11:01:33 2025]  __schedule+0x7c7/0x1930
[Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? _raw_spin_lock_irq+0x8a/0xe0
[Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[Thu Jun 12 11:01:33 2025]  schedule+0x6a/0x180
[Thu Jun 12 11:01:33 2025]  schedule_preempt_disabled+0x15/0x30
[Thu Jun 12 11:01:33 2025]  rwsem_down_write_slowpath+0x447/0x1090
[Thu Jun 12 11:01:33 2025]  ? __pfx_rwsem_down_write_slowpath+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __pfx___might_resched+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __pfx_thread2_func+0x10/0x10 [rw_sem_test_2]
[Thu Jun 12 11:01:33 2025]  down_write+0x125/0x140
[Thu Jun 12 11:01:33 2025]  ? __pfx_down_write+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? msleep+0x91/0xf0
[Thu Jun 12 11:01:33 2025]  ? __raw_spin_lock_irqsave+0x8c/0xf0
[Thu Jun 12 11:01:33 2025]  thread2_func+0x37/0x70 [rw_sem_test_2]
[Thu Jun 12 11:01:33 2025]  kthread+0x39f/0x750
[Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ret_from_fork+0x25d/0x320
[Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ret_from_fork_asm+0x1a/0x30
[Thu Jun 12 11:01:33 2025]  </TASK>
[Thu Jun 12 11:01:33 2025] INFO: task rw_sem_thread2:36526 <writer> blocked on an rw-semaphore likely owned by task rw_sem_thread1:36525 <writer>
[Thu Jun 12 11:01:33 2025] task:rw_sem_thread1  state:S stack:0     pid:36525 tgid:36525 ppid:2      task_flags:0x208040 flags:0x00004000
[Thu Jun 12 11:01:33 2025] Call Trace:
[Thu Jun 12 11:01:33 2025]  <TASK>
[Thu Jun 12 11:01:33 2025]  __schedule+0x7c7/0x1930
[Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __mod_timer+0x304/0xa80
[Thu Jun 12 11:01:33 2025]  ? irq_work_queue+0x6a/0xa0
[Thu Jun 12 11:01:33 2025]  ? __pfx_vprintk_emit+0x10/0x10
[Thu Jun 12 11:01:33 2025]  schedule+0x6a/0x180
[Thu Jun 12 11:01:33 2025]  schedule_timeout+0xfb/0x230
[Thu Jun 12 11:01:33 2025]  ? __pfx_schedule_timeout+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __pfx_process_timeout+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? down_write+0xc4/0x140
[Thu Jun 12 11:01:33 2025]  msleep_interruptible+0xbe/0x150
[Thu Jun 12 11:01:33 2025]  ? __pfx_thread1_func+0x10/0x10 [rw_sem_test_2]
[Thu Jun 12 11:01:33 2025]  thread1_func+0x37/0x60 [rw_sem_test_2]
[Thu Jun 12 11:01:33 2025]  kthread+0x39f/0x750
[Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ret_from_fork+0x25d/0x320
[Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
[Thu Jun 12 11:01:33 2025]  ret_from_fork_asm+0x1a/0x30
[Thu Jun 12 11:01:33 2025]  </TASK>

[1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com/

Thanks,
Lance

Lance Yang (3):
  locking/rwsem: make owner helpers globally available
  locking/rwsem: clear reader-owner on unlock to reduce false positives
  hung_task: extend hung task blocker tracking to rwsems

 include/linux/hung_task.h | 18 +++++++++---------
 include/linux/rwsem.h     | 12 ++++++++++++
 kernel/hung_task.c        | 29 +++++++++++++++++++++++++----
 kernel/locking/rwsem.c    | 31 +++++++++++++++++++++++--------
 4 files changed, 69 insertions(+), 21 deletions(-)

-- 
2.49.0

