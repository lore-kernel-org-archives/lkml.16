Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FF817E4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749278698; cv=none; b=BiYdE5zOtCqoeoGZhGD/LKUb6eDoMnnZkPocHHHdE7/JQte10fjECjUGJ2lAy007FzT8CeUq9PUTSRkzxKzQCRaRFUwlL7P9TNf5iAl4o8zbLpuwRmPeu9x3L5geogyhtR8ATI+fcLzuW7PVt3CW6B12LAAsNvTouFXkIgyC/lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749278698; c=relaxed/simple;
	bh=XrzgOI+heenrDxJJeYCwoX9kXVgRlvgON1xvAGxx3Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lpiNITDLDN2nxf8JHEQ81fWfnqbSCGjjQhHCTKVooidSdHonnNcrosi1bYRTITgUIAKt8Ty7Hwex7fhFULttIsg2Ob7maDT+MqlUqlPaxe9YK9w2IVwuGUV6RWchl/0/EaaAI1t4NmW3I2bYfsneTcAuwUaD077Eu1RFu5PaoH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIRdSzW1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIRdSzW1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74264d1832eso3205488b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749278696; x=1749883496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tkrsOLWLC5gfCnDszW8DS6/NG6hGLzsPa0I/uPxNhzw=;
        b=NIRdSzW1/ZwkhwTf0p79MjGsMdutc+7hYz77dQYoAlnCft8sl7WVYv4b4INnA6l5K4
         ZXe0lloAZaW/GybXVCCzF9UAWMSijXkMDlEyVV5ipycJWXgtRMSLFSpNt9zQYUmXbFKm
         CcHq5sjIJoXbbTzV+Swtq5OZlw6B5+S0CEU7sM1maCc6MlDoYRrhsOigno5yTzerJC7J
         qvRymNBm7bGg/hGXg/nyTo2y56ncXY7AKDtLVTaDkQb1zvdG99zpTGEPPxv/iIBayY9y
         y6ZR6CgehhLo4Y79gdRdp5Nqxx0fIcxdoUoNFSGxuhcyG39RlDFb8EsHlWZ13/Lc5TEX
         5bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749278696; x=1749883496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkrsOLWLC5gfCnDszW8DS6/NG6hGLzsPa0I/uPxNhzw=;
        b=dU6bCIy8/MX6Ex+5lzjgb8sfS3JFjNXu0j2F4fNeCGB40baCtrYZt7IFECa1aKyay2
         sjL2kslWJhybXLsE1WwWO9NYJHuUcP32NRL6I7gfVlo2kfBLeNBXM58M2qS1jc7d/DRV
         YIA6PBnHax0IzCr3CezRa5jHwq/cjFoO66z0Gq/DVpIVWewZzBmlvY3re1WYHUCa+bFG
         Sv55b+yUP6yS6f8nIe3NpnZaIecDAlDtpBOCEsDKdDYGkuuZkyxA3p7YWke6Io8qgiR5
         VfD3z87HqEcotgu9T/yy2q0BWP/m4TPDi9+6JPqrwTqIsXFmX3RAc6WcFZaktCFaP44O
         GFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX70LOTwYn1DQfG68ftCcd8R1gzllfBdj08EEZ0AJcu+GOm121zOoDbprVq7oRR1gHcOj4XBUE2K3rQZTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96rLXb5UlAbHg+x5a5Wz1GaiG0y0wnf2DRXdRgm+G5qUEVtdK
	5HtyJjYmCMms6p+kio1b+NoTUnXcgyGL1ljyXoeAFEonNjzcjIfl9nkF
X-Gm-Gg: ASbGnctV94tmvLVgS/mIBKc4NFnJfJ2x+SVBlSJQypZTkYk7BCAhHCXu0AImMzuTlPy
	Vp9loqBnCyeZ5UXB3kX0mPhJDEHnWPaQOOyJzZ0muULZl5zG8ZGK68s0PTBOC9NJqh2oG9sU1yw
	x5qdLqf90f4uTqc9FyAJ2rspMSAJXFelbWfMt7XSyfP2+R7IXhrjWrHOewXdemcR5voYs8FzuSW
	UdC/Xv5lhgxY15yTpx7fapET4O4mssIRdyNI1aDO0CLfPpuOxBcq5EUl77Em3QCcMiT7KEykIa/
	D7Bld79sGMS9+esytQr1+DecPoInv7/9yWihfD2vjuGmFP7JB0YcEOBWsR1uDG9ljqOORDtutet
	gTiDgmQ==
X-Google-Smtp-Source: AGHT+IG15np8jwL1RH+tCgJ7tj3XTAc1PB9rg+J1u6HKSakj62Y6BuMwzrVfTkGMItj1SD9wqVJaug==
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-74827f330a7mr7827344b3a.23.1749278695973;
        Fri, 06 Jun 2025 23:44:55 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:bf5b:2e56:6e66:c9ef:ed1b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c8a6bsm2288885b3a.142.2025.06.06.23.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 23:44:55 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: jann@thejh.net,
	keescook@chromium.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] futex: don't leak robust_list pointer on exec race
Date: Sat,  7 Jun 2025 12:14:44 +0530
Message-ID: <20250607064444.4310-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the get_robust_list() and compat_get_robust_list() syscalls
used rcu_read_lock() to access the target task's robust list pointer.
However, rcu_read_lock() is not sufficient when the operation may sleep
(e.g., locking or user-spaces access), nor does it prevent the task from
exiting while the syscall is in progress.

This patch replaces rcu_read_lock() with
get_task_struct()/put_task_struct() to ensure the task is pinned during
syscall execution prevent use-after-free.

Additionally, the robust_list pointer can be modified during exec()
causing a race condition if accessed concurrently. To fix this we
introduce down_read_killable(&exec_update_lock), a read lock on a
rw_semaphore protecting signal_struct members that change during exec.

This read-write semaphore allows multiple concurrent readers of
robust_list, while exec() takes the write lock to modify it, ensuring
synchronization.

This prevents an attacker from determining the robust_list or
compat_robust_list userspace pointer of a process created by executing
a setuid binary. Such an attack could be performed by racing
get_robust_list() with setuid execution. The impact of this issue is that
the attacker could theoretically bypass ASLR when attacking setuid
binaries.

Overall, this patch fixes a use-after-free and race condition by
properly pinning the task and synchronizing access to robust_list,
improving syscall safety and security.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Suggested-by: Jann Horn <jann@thejh.net>
Link: https://lore.kernel.org/linux-fsdevel/1477863998-3298-5-git-send-email-jann@thejh.net/
Link: https://github.com/KSPP/linux/issues/119
---
 kernel/futex/syscalls.c | 59 ++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
index 4b6da9116aa6..27e44a304271 100644
--- a/kernel/futex/syscalls.c
+++ b/kernel/futex/syscalls.c
@@ -53,31 +53,43 @@ SYSCALL_DEFINE3(get_robust_list, int, pid,
 	unsigned long ret;
 	struct task_struct *p;
 
-	rcu_read_lock();
-
-	ret = -ESRCH;
-	if (!pid)
+	if (!pid) {
 		p = current;
-	else {
+		get_task_struct(p);
+	} else {
+		rcu_read_lock();
 		p = find_task_by_vpid(pid);
+		/* pin the task to permit dropping the RCU read lock before
+		 * acquiring the semaphore
+		 */
+		if (p)
+			get_task_struct(p);
+		rcu_read_unlock();
 		if (!p)
-			goto err_unlock;
+			return -ESRCH;
 	}
 
+	ret = down_read_killable(&p->signal->exec_update_lock);
+	if (ret)
+		goto err_put;
+
 	ret = -EPERM;
 	if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
 		goto err_unlock;
 
 	head = p->robust_list;
-	rcu_read_unlock();
+
+	up_read(&p->signal->exec_update_lock);
+	put_task_struct(p);
 
 	if (put_user(sizeof(*head), len_ptr))
 		return -EFAULT;
 	return put_user(head, head_ptr);
 
 err_unlock:
-	rcu_read_unlock();
-
+	up_read(&p->signal->exec_update_lock);
+err_put:
+	put_task_struct(p);
 	return ret;
 }
 
@@ -459,31 +471,42 @@ COMPAT_SYSCALL_DEFINE3(get_robust_list, int, pid,
 	unsigned long ret;
 	struct task_struct *p;
 
-	rcu_read_lock();
-
-	ret = -ESRCH;
-	if (!pid)
+	if (!pid) {
 		p = current;
-	else {
+		get_task_struct(p);
+	} else {
+		rcu_read_lock();
 		p = find_task_by_vpid(pid);
+		/* pin the task to permit dropping the RCU read lock before
+		 * acquiring the semaphore
+		 */
+		if (p)
+			get_task_struct(p);
+		rcu_read_unlock();
 		if (!p)
-			goto err_unlock;
+			return -ESRCH;
 	}
 
+	ret = down_read_killable(&p->signal->exec_update_lock);
+	if (ret)
+		goto err_put;
+
 	ret = -EPERM;
 	if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
 		goto err_unlock;
 
 	head = p->compat_robust_list;
-	rcu_read_unlock();
+	up_read(&p->signal->exec_update_lock);
+	put_task_struct(p);
 
 	if (put_user(sizeof(*head), len_ptr))
 		return -EFAULT;
 	return put_user(ptr_to_compat(head), head_ptr);
 
 err_unlock:
-	rcu_read_unlock();
-
+	up_read(&p->signal->exec_update_lock);
+err_put:
+	put_task_struct(p);
 	return ret;
 }
 #endif /* CONFIG_COMPAT */
-- 
2.49.0

