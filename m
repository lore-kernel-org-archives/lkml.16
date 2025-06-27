Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1181AB52D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009377; cv=none; b=rdO68uwCGDxU9kOzl66DoFr6Y33Ija1D7M7SI06NZH5JGR1NUxk+WM5JhqYYbLY+GaWWrcStNE8R7DRmtGpCkowhgjjJys0sykL0FuLNXk4GBtZH0u9iYzElR69c5doOjznC8jD/tNdtsG/BeS4x21zAiVF+ia9Mw25Xy4CRjFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009377; c=relaxed/simple;
	bh=OiS/bpRXSmhNz+/EPrsvr3tnfdVrFREmT1aYWyq8jUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBVtQ1ZbuwgbFwcbTeMhLGzC1uD/7XPMK2R+28Ooo1ZTo6+7lbCklADW3Xgv1ADBJ39DLWafOqAxMOnS658QRM+zCEje9I5sS+44PgfO0FKzixJrAiqtjXsIgdypnHYY6wVIWpjjl1Ao4hpdi0mLstOdbu3Ke5AE0sYCLWMIfF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdRRu9sr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdRRu9sr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4531e146a24so9471765e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009373; x=1751614173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90bdELHSHEeKPOaBiZKt2XXQdDJR9fs8Epm5yqsnQkk=;
        b=HdRRu9srjeof7eRsZPZAcGXzJzaWc87MuK/gKt+Ydy4GKKp0Oo0Df2sLsTa7V2zcRJ
         gpGv5B8au9eOMzvCla+ixUGXmB1d/qm9n3/yIu4bLZCiwxYOitr0bdxbad0a6VtA+puI
         J8sqoVBzY+XnO4IHwQrQRoA4ePOcppOmmwb8E1TGUJyKfScxsH2lGCIsOCg6QXHrkob7
         JvIfigFLnikF2WQAVzki3CaXQPM++CInHIBwifzx9BX1o3KZtOupg1UKVOuS+wi3RsAF
         Tgda2kPbV02Ok+NG/vDbUo9Zq8i2rLVrxQFL2Q3z15+B5Qh5tBOcqMFWx7Wa0ck++p3E
         ov6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009373; x=1751614173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90bdELHSHEeKPOaBiZKt2XXQdDJR9fs8Epm5yqsnQkk=;
        b=YjmXqwYf9LTa0CmhsoD+MCueoGFUSc8Dh3MGdjZsD6wQLQQdVsi+iZGXRC9dE9f5Hq
         xR1PLay6QCBkgDhxYT/qBRHZpC6y7uhDcnX8QKT0/X/P2pVNVbxqAlvW+UaLILMKnSd9
         zgIaJ0a45aX83aSbiXlqQZc2dcFyMFIb8+IuJqO82oDGBpjVewi5+ABl+qqJNTyBnqXC
         MxtTwGDHikNylXHbu7DWPRlmqVdxjawq+hD1elvu/tBxvtkVH/W3LlPjNRN1gU2EzfEE
         8Qnc6d0wx8BhAmvZ2yhYKnhvzfcmHDnkCxQLH0vZWLS+FILk00I+vTxkT2ooL1tviVfv
         QHHg==
X-Forwarded-Encrypted: i=1; AJvYcCWr3GbywBlYwjzijgRYq0MR4ziHOVxno1/nzLHphNKwu5jvibYLCJrGZ1hHXMJPEFOfh9Rd5jFeOxfXbsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSfztOcjc56Ax8RLTg5ZiNLS3eDNT7bj6aNNLltsWCA2qGthTY
	00kn7dHYekACKDNV56Be5kBRR+6/+MK4t2XFnkTP90HB+Nt8B9KCyPuzCQ+yhw==
X-Gm-Gg: ASbGnctJ81xNkLmvkQMBXYNYeFKD64BiY5j+1IfqvodiD0jmCQcUJluqBX6MXPNl4qK
	CROglPQ6vTf2Xi1Sa+WvNmeg7usXIb6G0iynbsU0mG3/7EB30FcURoTSK7xSC69Op+ZPQ7tX9gz
	WRGi1vOPX8o3qu5p+z9CZkHG/msVCXWJc1D7oXAoOZOKEmSKo4PRX+cCNuWK/ynZRVAFh/U8cmz
	mvCgqqClvf4gviruKGMOuWYRiB26bvI4Vaf5VXy8vT0kj99SwWbknRvsxaUZ+2fmDeKfYNv+lD6
	8DAfgaxaK1egYjeWPqUlZ/BPQ7Ov52v2WpjAY/IYFafIuaP7
X-Google-Smtp-Source: AGHT+IEgOol+rDyw88ng96qQK5C3s3LAj7Qa4nxh27Jdh6yGRrWRs//2Knx6/2vLI91t9x1FjUi3Lg==
X-Received: by 2002:a05:600c:530d:b0:442:ffa6:d07e with SMTP id 5b1f17b1804b1-4538ef33a85mr17622685e9.1.1751009372955;
        Fri, 27 Jun 2025 00:29:32 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::302c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e72b6sm1955665f8f.15.2025.06.27.00.29.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Jun 2025 00:29:32 -0700 (PDT)
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
Subject: [PATCH 0/3] extend hung task blocker tracking to rwsems
Date: Fri, 27 Jun 2025 15:29:21 +0800
Message-ID: <20250627072924.36567-1-lance.yang@linux.dev>
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

[Fri Jun 27 15:21:34 2025] INFO: task cat:28631 blocked for more than 122 seconds.
[Fri Jun 27 15:21:34 2025]       Tainted: G S                  6.16.0-rc3 #8
[Fri Jun 27 15:21:34 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[Fri Jun 27 15:21:34 2025] task:cat             state:D stack:0     pid:28631 tgid:28631 ppid:28501  task_flags:0x400000 flags:0x00004000
[Fri Jun 27 15:21:34 2025] Call Trace:
[Fri Jun 27 15:21:34 2025]  <TASK>
[Fri Jun 27 15:21:34 2025]  __schedule+0x7c7/0x1930
[Fri Jun 27 15:21:34 2025]  ? __pfx___schedule+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? policy_nodemask+0x215/0x340
[Fri Jun 27 15:21:34 2025]  ? _raw_spin_lock_irq+0x8a/0xe0
[Fri Jun 27 15:21:34 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[Fri Jun 27 15:21:34 2025]  schedule+0x6a/0x180
[Fri Jun 27 15:21:34 2025]  schedule_preempt_disabled+0x15/0x30
[Fri Jun 27 15:21:34 2025]  rwsem_down_read_slowpath+0x55e/0xe10
[Fri Jun 27 15:21:34 2025]  ? __pfx_rwsem_down_read_slowpath+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? __pfx___might_resched+0x10/0x10
[Fri Jun 27 15:21:34 2025]  down_read+0xc9/0x230
[Fri Jun 27 15:21:34 2025]  ? __pfx_down_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? __debugfs_file_get+0x14d/0x700
[Fri Jun 27 15:21:34 2025]  ? __pfx___debugfs_file_get+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? handle_pte_fault+0x52a/0x710
[Fri Jun 27 15:21:34 2025]  ? selinux_file_permission+0x3a9/0x590
[Fri Jun 27 15:21:34 2025]  read_dummy_rwsem_read+0x4a/0x90
[Fri Jun 27 15:21:34 2025]  full_proxy_read+0xff/0x1c0
[Fri Jun 27 15:21:34 2025]  ? rw_verify_area+0x6d/0x410
[Fri Jun 27 15:21:34 2025]  vfs_read+0x177/0xa50
[Fri Jun 27 15:21:34 2025]  ? __pfx_vfs_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? fdget_pos+0x1cf/0x4c0
[Fri Jun 27 15:21:34 2025]  ksys_read+0xfc/0x1d0
[Fri Jun 27 15:21:34 2025]  ? __pfx_ksys_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  do_syscall_64+0x66/0x2d0
[Fri Jun 27 15:21:34 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Fri Jun 27 15:21:34 2025] RIP: 0033:0x7f3f8faefb40
[Fri Jun 27 15:21:34 2025] RSP: 002b:00007ffdeda5ab98 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Fri Jun 27 15:21:34 2025] RAX: ffffffffffffffda RBX: 0000000000010000 RCX: 00007f3f8faefb40
[Fri Jun 27 15:21:34 2025] RDX: 0000000000010000 RSI: 00000000010fa000 RDI: 0000000000000003
[Fri Jun 27 15:21:34 2025] RBP: 00000000010fa000 R08: 0000000000000000 R09: 0000000000010fff
[Fri Jun 27 15:21:34 2025] R10: 00007ffdeda59fe0 R11: 0000000000000246 R12: 00000000010fa000
[Fri Jun 27 15:21:34 2025] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000fff
[Fri Jun 27 15:21:34 2025]  </TASK>
[Fri Jun 27 15:21:34 2025] INFO: task cat:28631 <reader> blocked on an rw-semaphore likely owned by task cat:28630 <writer>
[Fri Jun 27 15:21:34 2025] task:cat             state:S stack:0     pid:28630 tgid:28630 ppid:28501  task_flags:0x400000 flags:0x00004000
[Fri Jun 27 15:21:34 2025] Call Trace:
[Fri Jun 27 15:21:34 2025]  <TASK>
[Fri Jun 27 15:21:34 2025]  __schedule+0x7c7/0x1930
[Fri Jun 27 15:21:34 2025]  ? __pfx___schedule+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? __mod_timer+0x304/0xa80
[Fri Jun 27 15:21:34 2025]  schedule+0x6a/0x180
[Fri Jun 27 15:21:34 2025]  schedule_timeout+0xfb/0x230
[Fri Jun 27 15:21:34 2025]  ? __pfx_schedule_timeout+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? __pfx_process_timeout+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? down_write+0xc4/0x140
[Fri Jun 27 15:21:34 2025]  msleep_interruptible+0xbe/0x150
[Fri Jun 27 15:21:34 2025]  read_dummy_rwsem_write+0x54/0x90
[Fri Jun 27 15:21:34 2025]  full_proxy_read+0xff/0x1c0
[Fri Jun 27 15:21:34 2025]  ? rw_verify_area+0x6d/0x410
[Fri Jun 27 15:21:34 2025]  vfs_read+0x177/0xa50
[Fri Jun 27 15:21:34 2025]  ? __pfx_vfs_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? fdget_pos+0x1cf/0x4c0
[Fri Jun 27 15:21:34 2025]  ksys_read+0xfc/0x1d0
[Fri Jun 27 15:21:34 2025]  ? __pfx_ksys_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  do_syscall_64+0x66/0x2d0
[Fri Jun 27 15:21:34 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Fri Jun 27 15:21:34 2025] RIP: 0033:0x7f8f288efb40
[Fri Jun 27 15:21:34 2025] RSP: 002b:00007ffffb631038 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Fri Jun 27 15:21:34 2025] RAX: ffffffffffffffda RBX: 0000000000010000 RCX: 00007f8f288efb40
[Fri Jun 27 15:21:34 2025] RDX: 0000000000010000 RSI: 000000002a4b5000 RDI: 0000000000000003
[Fri Jun 27 15:21:34 2025] RBP: 000000002a4b5000 R08: 0000000000000000 R09: 0000000000010fff
[Fri Jun 27 15:21:34 2025] R10: 00007ffffb630460 R11: 0000000000000246 R12: 000000002a4b5000
[Fri Jun 27 15:21:34 2025] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000fff
[Fri Jun 27 15:21:34 2025]  </TASK>

[1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com/

Thanks,
Lance

---
RFC -> v1:
 * Patch #01 #02 Pick RB from Masami - thanks!
 * Merge [PATCH RFC 2/3] into patch #01 (per Masami)
 * Add the patch #03 to extend the test module to handle the rwsem
   blocking case (per Masami)
 * https://lore.kernel.org/all/20250612042005.99602-1-lance.yang@linux.dev

Lance Yang (2):
  locking/rwsem: make owner helpers globally available
  hung_task: extend hung task blocker tracking to rwsems

Zi Li (1):
  samples: enhance hung_task detector test with read-write semaphore
    support

 include/linux/hung_task.h           | 18 +++----
 include/linux/rwsem.h               | 12 +++++
 kernel/hung_task.c                  | 29 +++++++++--
 kernel/locking/rwsem.c              | 31 ++++++++---
 samples/Kconfig                     |  7 ++-
 samples/hung_task/hung_task_tests.c | 81 ++++++++++++++++++++++++++---
 6 files changed, 146 insertions(+), 32 deletions(-)

-- 
2.49.0

