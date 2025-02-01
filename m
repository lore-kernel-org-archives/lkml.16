Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB78EEAA
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 06:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738389893; cv=none; b=fnZB8pqUyG19N3DYOi58k8K+bBG2boD/DIpfS1wF3cFgm8MDvmt4PkE963piYMB/vYWfUcjP74VOxyzKP03AWYepASucm01i/yf9sDT1DTtRYZr4cIGYpBCpTpLF3PageC0Zi4kJja/YwXqahFE15gnQRrY5du594WrkRWD957k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738389893; c=relaxed/simple;
	bh=V3Fr+oD7uddCkqfLwqgDCMk5SutMY43IylFOVmt69lU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=S0tD7GwWu48yPEvf9hTeYnz/WRJkUMLEZcWFAHK0lPPze2qgUPu29lkDmBe6gaCMBiP3D6HQHCgvlxkzU2YFFxA/Fg0gUyYnnaU/8vdvOVLZ20IwjXymh8uQebf2ZDC5W1yc5xQhhYSUmOSa0X4tYDMAdHHFPpcwyFeBqEi7ZQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=hXD+DFjz; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="hXD+DFjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738389873; bh=iioojh+LGQGulhuRme/2HbKiXRhqNg5Jnxhf9Jrx16M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hXD+DFjzEjS/5riXUD501ZiVwQj/5XcXq7SwUSweA513/zsaIsOG+hiQ5JzRF7e6s
	 FgVZbfrGuda2istogStESgaGqlw8o4EFkEbTELxXMJ8UORenqZ6tqZ+pCu+3VEfjTG
	 Oj7zON4l8u0WM5RbqD4OrFWkdjf81/wf+S+PmfKc=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9930:6b25:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id CB73323C; Sat, 01 Feb 2025 13:50:55 +0800
X-QQ-mid: xmsmtpt1738389055t0e6ab7oa
Message-ID: <tencent_E5E3A2A44C1761976566C7D3658377C96A05@qq.com>
X-QQ-XMAILINFO: MIAHdi1iQo+zKyQnaZy6IlhbheDprG9g47avB7dToYg1YHak3rmZgvo8ZtWKMx
	 1q/EgVkkM7HYF+HszDNWiZzgnK51CN1jgNnlwOq3ycri422zOxyrgCwLMLBCVwUtSF7y1hdMYi95
	 JWZMCooRYMB54QkLfD8zphuy7qEDzvvMvlysfSmPetMknotNtW0KovJ7eejq1cwLMQaa7z2abzHv
	 +WGT5todhiPnf5ERYqHRekJJFSP1SH5ozAMno/Y3fDGhX4bOXkJ9X0N07gC7Ewp5/sf5x0TwMRyp
	 fGiPYOyPyypR2qtRK042zw4VV04/5FHpPTDk3t+8RZOCQFUs+8+mYhMLf0C9NRk05CLhx6pN97c/
	 Xu705Un45RrM60EHCb8cOmMBHEdNcos3Tik0CV0ufk9RrCO9VbJ+ijoQfAVSMWz8SoFdQZgmMt0W
	 rFysfeSrpHy0KRMbhyCmbqpTGT5EaE+liCcTSFaa1Z3CBA61T/RPg+JYjGBHxE4b8DmQ89Y3hijg
	 qxGWDcIHKG36klxEw3bD5bideXEHiXuB4r36Zt7ZN6wQ4KYOxLaHAE54xiThjXc7dViufeyobazw
	 dWAzBVErZzjwDbARLXmPI6p4egYuzmVeMVW7CaqiGnJRV6hbLdUYeKscS1504HeJgu3uqPzSLB0J
	 FEKEq4Qhp143hGWnLGNjLi990sIfUZfGkAl4jujUi4bQgm5fAFYE2lzTfvEMHjSJKP5ekxO0IukD
	 tfs/OZBo4xu8T3rkplsO5rbSTY7+QQV/kC972ulPEIk6jyopX9k5glIzGx6Z8tqSajCjZN4oywxF
	 +H3zsPPJ/jh06E48dBRff6xsFZTqFUmyWP9CpKoJj5Nmb0kKIiJP5Y2+Ubr7XBucE5jua8YyktRD
	 4VIrW7ITybvgDUm8NWa52h+X9iU/jW0zOFAZi+suGGBRYMqbNlRwQxCrRh71aoMw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] tracing: keep the event lock balanced
Date: Sat,  1 Feb 2025 13:50:55 +0800
X-OQ-MSGID: <20250201055054.965082-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <679d36da.050a0220.163cdc.0010.GAE@google.com>
References: <679d36da.050a0220.163cdc.0010.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a bad unlock balance in seq_read_iter(). [1]

The reproducer uses "/proc/thread-self/fail-nth" to make s_start() fail when
applying for memory, thus exiting s_start() before acquiring event_mutex.
This destroys the lock holding and reclaiming process in the start() and
stop() processes in seq_read_iter().

Hold the event mutex before allocating memory in s_start() to avoid this
problem.

[1]
WARNING: bad unlock balance detected!
6.13.0-syzkaller-09760-g69e858e0b8b2 #0 Not tainted
-------------------------------------
syz-executor359/5828 is trying to release lock (event_mutex) at:
[<ffffffff8239231f>] seq_read_iter+0x5ff/0x12b0 fs/seq_file.c:251
but there are no more locks to release!

other info that might help us debug this:
1 lock held by syz-executor359/5828:
 #0: ffff88802fd120a0 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xd8/0x12b0 fs/seq_file.c:182

stack backtrace:
CPU: 0 UID: 0 PID: 5828 Comm: syz-executor359 Not tainted 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_unlock_imbalance_bug kernel/locking/lockdep.c:5289 [inline]
 print_unlock_imbalance_bug+0x1aa/0x1f0 kernel/locking/lockdep.c:5263
 __lock_release kernel/locking/lockdep.c:5528 [inline]
 lock_release+0x525/0x6f0 kernel/locking/lockdep.c:5872
 __mutex_unlock_slowpath+0xa3/0x6a0 kernel/locking/mutex.c:891
 seq_read_iter+0x5ff/0x12b0 fs/seq_file.c:251
 seq_read+0x39f/0x4e0 fs/seq_file.c:162
 vfs_read+0x1df/0xbf0 fs/read_write.c:563
 ksys_read+0x12b/0x250 fs/read_write.c:708
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: b355247df104 ("tracing: Cache ":mod:" events for modules not loaded yet")
Reported-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c041985778e4069e1ce3
Tested-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 kernel/trace/trace_events.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 4cb275316e51..991dd17887ea 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -1600,12 +1600,12 @@ static void *s_start(struct seq_file *m, loff_t *pos)
 	struct set_event_iter *iter;
 	loff_t l;
 
+	mutex_lock(&event_mutex);
+
 	iter = kzalloc(sizeof(*iter), GFP_KERNEL);
 	if (!iter)
 		return NULL;
 
-	mutex_lock(&event_mutex);
-
 	iter->type = SET_EVENT_FILE;
 	iter->file = list_entry(&tr->events, struct trace_event_file, list);
 
-- 
2.43.0

