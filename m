Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87992253922
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642856; cv=none; b=Z3GYuMSCIXx+NfBmKWVRRSOeJ+VlDPFmbkpTDD8qzSxtGRKyYEGESlDSvhhMSmLhezoMdtllc0Us9S8pEblQnOywxvAGxRv+tytfZgFZEE5SxRzyCtnh0GepFinKb0eKQtIMHVwLGFUXGWTgaIeoy76wpbasSnKQBsu1Pl4tpfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642856; c=relaxed/simple;
	bh=lvqoNSMMRUiMI5p/ukxq7iqd+kNmC0+NOboH8vRJkSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JF/yl44lgbvLOKeMxfjqsNnTEZpigrOmWamev8q1CcnNAQtqO9PPjTTdDHKq1lSI8j0RU+rdfMlvT9J75WS+PDl9koMkbvbeRWCTP64tkJRM79hU/7CN8TQhlnl8/zc+ZrZaTRwnT0Hl7kJS59OCTTW5HBogJK3Ona8dS4xzzgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9Tsx7Jv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9Tsx7Jv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7376dd56f60so3010986b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642854; x=1745247654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMvyPCkulpOa7+ubiJvqclMs/foKsE6WscCrPYZ3zJQ=;
        b=M9Tsx7JvC3zBYUjdgvBf7C0sd0UOXRwfpHlQZLeYoUfrEXdmtDfr2HpfsQcD/MwsHc
         1VCXN/EOrPVHIbkDhOC5TCZ5muK/l/fsOl8OL2+uXnpvjQjG0cceDkNpAN2IywV9ALco
         c664ZIhWFrmMZZxIPjo/MJSn0oMIjKSk54tAKzKmN+gYzHZdhNjBUvkVxO7l2tUiZk+U
         IsYawsykQjq6s0Ofxlq10kFOfJkuVXs3ZeYhn0oMew7E9HyUCTmetG00HENl3RzjM5an
         lTdFFe9KfacBXJJWo8kijpM6/meen2FjAMl9Ui8JVaQx44k1S5FBnEbGL4zg0O1L/8oS
         ypvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642854; x=1745247654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMvyPCkulpOa7+ubiJvqclMs/foKsE6WscCrPYZ3zJQ=;
        b=jv5HHlfXccQthIWq0Vd7CFjkAZegI/MvxOfSJpAKCSgO3WNLnSu2v8M0HEorPOzcH2
         KJ2ufEsK1h5w9MxyQA5XFD7dKkd8e4MiDG/dk7J3gjerMalDJMY05CL5ZtoSxWSylubk
         A1ubuAcFbZuimmoEfmhdIJ8Q4zg8Tq5dO6Tf9sRw6/pGLE+fvuHanrCKBi5E09XrzbVZ
         mrmKwB5MuZg4w3d+V6/eRF87IvQY/uxWWM/saw57BsVkstqoIKcqqMq+7vn1Qs3afwjY
         fQAfKWw5AHkzhn8Fze5CH7BuLncFS3ocTZ0/JaPwxUY+GB83c7qaoam/C0Q+3gKB6UT8
         EOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWyvuyYMrMpFmOrbFBNa8WmF8B94HOypnAqVIVhjeIDReYE3OxugFpgPpQVG5ZCgdRMAScheiA+FzOjUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjmuy7ubJ60bvtiRi4xJbOa0lhiiLpY/XJeKWPXFU3sDOii5yg
	Ahtbze6JqB30uhW5AixjsN7vaiZNV0GGtL5alX/DXwiMp1t7XWOG
X-Gm-Gg: ASbGncvXzum6ImX1pF1FcEjRod0VBQAggPru/NfQvUJm/uHlZDW1PJqHEqMOZuJ/thh
	/Ox2/V9NkhmiNAY3/aClhfqdOY5lw1gESzCjoivTgsjvVDJbDNnEXFg1Q+wD424Ed6rX0KyBA+R
	4bOl+PBQhQNjxEM5qArTNzP4VGT/weHwl7h554H1zKGt3p7qHEqKU04zw/VSf/q+TVN6ZqV8tfX
	mAFCZQU3p/nqucFmwneD1EtbaULjixoP9B0nuY5gMvYFnGp78t1OBrJSVEOXFmOAmFJP3Y9eeTF
	lJhnl/fXvGyejMH/TaTLwvE1oZRroNtFDA2B5lN5Q3+TLSfP
X-Google-Smtp-Source: AGHT+IEHMDyd4qEkCgflAtgcj102OBdosO7rckXM8nQiIOqvJ4WQQkCPwyJsAyii6C/5n7HcZoITyw==
X-Received: by 2002:a05:6a00:398b:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-73bd119d036mr14994715b3a.4.1744642851833;
        Mon, 14 Apr 2025 08:00:51 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e0b95sm6726329b3a.82.2025.04.14.08.00.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 08:00:51 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: akpm@linux-foundation.org
Cc: will@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	longman@redhat.com,
	mhiramat@kernel.org,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	joel.granados@kernel.org,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	amaindex@outlook.com,
	jstultz@google.com,
	Lance Yang <ioworker0@gmail.com>
Subject: [PATCH v5 0/3] hung_task: extend blocking task stacktrace dump to semaphore
Date: Mon, 14 Apr 2025 22:59:42 +0800
Message-ID: <20250414145945.84916-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Inspired by mutex blocker tracking[1], this patch series extend the
feature to not only dump the blocker task holding a mutex but also to
support semaphores. Unlike mutexes, semaphores lack explicit ownership
tracking, making it challenging to identify the root cause of hangs. To
address this, we introduce a last_holder field to the semaphore structure,
which is updated when a task successfully calls down() and cleared during
up().

The assumption is that if a task is blocked on a semaphore, the holders
must not have released it. While this does not guarantee that the last
holder is one of the current blockers, it likely provides a practical hint
for diagnosing semaphore-related stalls.

With this change, the hung task detector can now show blocker task's info
like below:

[Tue Apr  8 12:19:07 2025] INFO: task cat:945 blocked for more than 120 seconds.
[Tue Apr  8 12:19:07 2025]       Tainted: G            E      6.14.0-rc6+ #1
[Tue Apr  8 12:19:07 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[Tue Apr  8 12:19:07 2025] task:cat             state:D stack:0     pid:945   tgid:945   ppid:828    task_flags:0x400000 flags:0x00000000
[Tue Apr  8 12:19:07 2025] Call Trace:
[Tue Apr  8 12:19:07 2025]  <TASK>
[Tue Apr  8 12:19:07 2025]  __schedule+0x491/0xbd0
[Tue Apr  8 12:19:07 2025]  schedule+0x27/0xf0
[Tue Apr  8 12:19:07 2025]  schedule_timeout+0xe3/0xf0
[Tue Apr  8 12:19:07 2025]  ? __folio_mod_stat+0x2a/0x80
[Tue Apr  8 12:19:07 2025]  ? set_ptes.constprop.0+0x27/0x90
[Tue Apr  8 12:19:07 2025]  __down_common+0x155/0x280
[Tue Apr  8 12:19:07 2025]  down+0x53/0x70
[Tue Apr  8 12:19:07 2025]  read_dummy_semaphore+0x23/0x60
[Tue Apr  8 12:19:07 2025]  full_proxy_read+0x5f/0xa0
[Tue Apr  8 12:19:07 2025]  vfs_read+0xbc/0x350
[Tue Apr  8 12:19:07 2025]  ? __count_memcg_events+0xa5/0x140
[Tue Apr  8 12:19:07 2025]  ? count_memcg_events.constprop.0+0x1a/0x30
[Tue Apr  8 12:19:07 2025]  ? handle_mm_fault+0x180/0x260
[Tue Apr  8 12:19:07 2025]  ksys_read+0x66/0xe0
[Tue Apr  8 12:19:07 2025]  do_syscall_64+0x51/0x120
[Tue Apr  8 12:19:07 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Tue Apr  8 12:19:07 2025] RIP: 0033:0x7f419478f46e
[Tue Apr  8 12:19:07 2025] RSP: 002b:00007fff1c4d2668 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Tue Apr  8 12:19:07 2025] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f419478f46e
[Tue Apr  8 12:19:07 2025] RDX: 0000000000020000 RSI: 00007f4194683000 RDI: 0000000000000003
[Tue Apr  8 12:19:07 2025] RBP: 00007f4194683000 R08: 00007f4194682010 R09: 0000000000000000
[Tue Apr  8 12:19:07 2025] R10: fffffffffffffbc5 R11: 0000000000000246 R12: 0000000000000000
[Tue Apr  8 12:19:07 2025] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[Tue Apr  8 12:19:07 2025]  </TASK>
[Tue Apr  8 12:19:07 2025] INFO: task cat:945 blocked on a semaphore likely last held by task cat:938
[Tue Apr  8 12:19:07 2025] task:cat             state:S stack:0     pid:938   tgid:938   ppid:584    task_flags:0x400000 flags:0x00000000
[Tue Apr  8 12:19:07 2025] Call Trace:
[Tue Apr  8 12:19:07 2025]  <TASK>
[Tue Apr  8 12:19:07 2025]  __schedule+0x491/0xbd0
[Tue Apr  8 12:19:07 2025]  ? _raw_spin_unlock_irqrestore+0xe/0x40
[Tue Apr  8 12:19:07 2025]  schedule+0x27/0xf0
[Tue Apr  8 12:19:07 2025]  schedule_timeout+0x77/0xf0
[Tue Apr  8 12:19:07 2025]  ? __pfx_process_timeout+0x10/0x10
[Tue Apr  8 12:19:07 2025]  msleep_interruptible+0x49/0x60
[Tue Apr  8 12:19:07 2025]  read_dummy_semaphore+0x2d/0x60
[Tue Apr  8 12:19:07 2025]  full_proxy_read+0x5f/0xa0
[Tue Apr  8 12:19:07 2025]  vfs_read+0xbc/0x350
[Tue Apr  8 12:19:07 2025]  ? __count_memcg_events+0xa5/0x140
[Tue Apr  8 12:19:07 2025]  ? count_memcg_events.constprop.0+0x1a/0x30
[Tue Apr  8 12:19:07 2025]  ? handle_mm_fault+0x180/0x260
[Tue Apr  8 12:19:07 2025]  ksys_read+0x66/0xe0
[Tue Apr  8 12:19:07 2025]  do_syscall_64+0x51/0x120
[Tue Apr  8 12:19:07 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Tue Apr  8 12:19:07 2025] RIP: 0033:0x7f7c584a646e
[Tue Apr  8 12:19:07 2025] RSP: 002b:00007ffdba8ce158 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Tue Apr  8 12:19:07 2025] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f7c584a646e
[Tue Apr  8 12:19:07 2025] RDX: 0000000000020000 RSI: 00007f7c5839a000 RDI: 0000000000000003
[Tue Apr  8 12:19:07 2025] RBP: 00007f7c5839a000 R08: 00007f7c58399010 R09: 0000000000000000
[Tue Apr  8 12:19:07 2025] R10: fffffffffffffbc5 R11: 0000000000000246 R12: 0000000000000000
[Tue Apr  8 12:19:07 2025] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[Tue Apr  8 12:19:07 2025]  </TASK>

[1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com

Thanks,
Lance

---
v4 -> v5:
 * #01 Add comments for the blocker field, suggested by Andrew
 * #02 Reduce unnecessary #ifdef directives, suggested by Andrew
 * https://lore.kernel.org/all/20250320064923.24000-1-ioworker0@gmail.com

v3 -> v4:
 * #01 #02 Pick RB from Masami - thanks!
 * #03 Pick AB from Masami - thanks!
 * Extract the type from the blocker and use a switch-case instead of
if-else, suggested by Masami
 * https://lore.kernel.org/all/20250319081138.25133-1-ioworker0@gmail.com

v2 -> v3:
 * Remove the unnecessary WARN_ON_ONCE check for 'current->blocker',
 suggested by Masami
 * Drop the redundant #ifdef for including the hung task header file,
 suggested by Masam
 * Unify the samples into 'hung_task_tests.c', suggested by Masami
 * https://lore.kernel.org/all/20250314144300.32542-1-ioworker0@gmail.com

v1 -> v2:
 * Use one field to store the blocker as only one is active at a time,
 suggested by Masami
 * Leverage the LSB of the blocker field to reduce memory footprint,
 suggested by Masami
 * Add a hung_task detector semaphore blocking test sample code
 * https://lore.kernel.org/all/20250301055102.88746-1-ioworker0@gmail.com

Lance Yang (2):
  hung_task: replace blocker_mutex with encoded blocker
  hung_task: show the blocker task if the task is hung on semaphore

Zi Li (1):
  samples: extend hung_task detector test with semaphore support

 include/linux/hung_task.h           | 99 +++++++++++++++++++++++++++++
 include/linux/sched.h               |  6 +-
 include/linux/semaphore.h           | 15 ++++-
 kernel/hung_task.c                  | 55 ++++++++++++----
 kernel/locking/mutex.c              |  5 +-
 kernel/locking/semaphore.c          | 57 +++++++++++++++--
 samples/Kconfig                     |  9 +--
 samples/hung_task/Makefile          |  2 +-
 samples/hung_task/hung_task_mutex.c | 66 -------------------
 samples/hung_task/hung_task_tests.c | 97 ++++++++++++++++++++++++++++
 10 files changed, 319 insertions(+), 92 deletions(-)
 create mode 100644 include/linux/hung_task.h
 delete mode 100644 samples/hung_task/hung_task_mutex.c
 create mode 100644 samples/hung_task/hung_task_tests.c

-- 
2.49.0

