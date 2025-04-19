Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E118B1EE00F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102200; cv=none; b=C47zyY/gb2jrrEhyBV2pVGoEW3dG6k4ZlxTm4vn77g3Vxs5ypdbkUTcdYhSC2Dy70qjJgKPE5uh/jbTiF3JJf3nawTyRPc3KQ91uSd8ppXFpJmcokvNeOXmaK50eAUtiquM63zdv3+HG7fv8o3XTmjeVjRK3WDWb2RyYiKGmcdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102200; c=relaxed/simple;
	bh=wGNSmSQ5zw3gyNhGvR46HcmOlVbNO9SbE3D0l6D6Lc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N03DnVhmrxdnYWRSyVjVQddIXpITJnbSyTLK3jk8leO1lavaYlFIWuWr+gsKpn0ngzUF/11jG0iZszCyBXxmyBh8qNe3RA//HSfJmigOXyTMIo1VtnrxEAqfeeppJ4ZkpujEdJ4GdHejnN+6aUq/2AkVQPdpOZiaLzas0tXKaqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QmYOwT5b; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmYOwT5b"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549b116321aso3285680e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102197; x=1745706997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKbKBVNuxHHKFMXQV5jdXdd9fdcW7JzXWBFz1LBqwDs=;
        b=QmYOwT5bKjnPFENPk96H1Q+1xT6L90R8tCLsQnyxfUkIPXskI7afu9IWPwsRvCGQTM
         hOeW9gjSKGD8oQ5j8ii7c7oMT/JcyT8pQ6Rhu1RwpQjDIKyMGEFyIhWJ4HOMaHFuhiZM
         8TTf704p9EWEHlQnMQFtfRBUPc50ZpQJ9hWLsdfrUvUBeXVOWjXGnKvjyfjR4mKGKABZ
         xfsal7DCewV+hDxqmiQo/kIRa7n527HmqYNUztEOquq+8e0NKQZBbBypVWldJ6WXHBCO
         2OlxSIYgoajr8ztbBI/LC4a0LvhKQ3osIgntloxLTfZbJTf1UrPtrW4Q8w1CY86Qd1WS
         DvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102197; x=1745706997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKbKBVNuxHHKFMXQV5jdXdd9fdcW7JzXWBFz1LBqwDs=;
        b=SeR+i96e2/FDe05ZmjD0iAJO0o/hwOAvXwWJL5wiCRXIDEb9HNn5AUETA+yZf5x8XV
         nqCuAr7uyWYoWRatIOoKOprPMPeEOdbeTX4EwAZ/8uEzjsst0eoYKpdyZp0TguPsXLvy
         1fCaPao6E+LBjpUwpjfV/prGBctmQgGP1F+VAZKhw/hl7pR1jLnLjQVhfYyOSU3I4Sko
         pkwHQi7CPngERQ7CPPXC0OdyK81YXAy5X+U6qWc85N+nSD8GgNbe6o7om3z6N5YxcV4V
         W9nFvNqUR6bdcYvh5f2mTPvED6XqqRH6Y7nAx5PWeg3BVajvhQPGycOukChacxTOmOaw
         cAYg==
X-Forwarded-Encrypted: i=1; AJvYcCUf30dHNFmVTWoEOxQYpEUxhJl/sd3GCXdBPS5h0L6a6dNLFU0/i69/tQiRNUVXFbTvbh46Ur3ip73CfYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEsxBNn10U6MroGFy4lBmR9L6T35S9/UHa4mtase7XQCShKbjk
	VjI5NVbv/NDngIdq5D2H9pxVVNmzp+vffaqQ8Yc8l0BU/IAYfPJbs980MSjtI4A=
X-Gm-Gg: ASbGnctuGU1B3VNioQRG/fF65gPlf5TxgrE7dAzL5Qp9pI5N4zZ7ScVWQGbXkdltQyR
	6+uVY/2AT8KuyZ7855deaxinA0q+SVGbfdofGVwsDOxqKfjA7o22TNV6MsGJAj0erhaCT0lAW53
	OVxJZZWTX9mKr0Kn9y/dRumHdFXfwqrWYmIWxYGBhVsRf0oRVtCwZuCcneK5dqEv7+Nk0DLrYne
	4VvuFCGlUyl/7e08cmn0OF/vBQ4IPvYi3msc2XiKssio174ecsajyEf4jfCDNauxc3wWNX5dIKW
	NOdBpczv92+WEGMSY3g2EJYhAlEpzzCcnpb1aBnojUvFBpOSzGk=
X-Google-Smtp-Source: AGHT+IGEswbN+axVcFAc6ETBdVjgjfsIKWDzjM2+TEM0R4FVCzATThuev3a/7i06beqEJHQx3Z2hMw==
X-Received: by 2002:a05:6512:a82:b0:549:8809:ee32 with SMTP id 2adb3069b0e04-54d6e62cbfcmr2154163e87.22.1745102196896;
        Sat, 19 Apr 2025 15:36:36 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:18 +0200
Subject: [PATCH v6 31/31] ARM: entry: Reimplement local restart in C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-31-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2

The former local restart hack to restart syscalls inside
the kernel if we get restart signals while processing a
system call was deleted when converting the architecture
to generic entry.

This makes strace tests fail so the hack is necessary.

Now, after the conversion to generic entry, restore the
order by reimplementing this with two TIF flags that
help us to issue system call restarts immediately in the
kernel.

This is essentially a reimplementation of commit 81783786d5cf
"ARM: 7473/1: deal with handlerless restarts without leaving
the kernel" from 2012, but in C, on top of generic entry.

Link: http://lists.infradead.org/pipermail/linux-arm-kernel/2012-June/104733.html
Link: https://lore.kernel.org/all/1340377626-17075-1-git-send-email-will.deacon@arm.com/
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/thread_info.h |  4 ++++
 arch/arm/kernel/signal.c           | 17 +++++++++++++----
 arch/arm/kernel/syscall.c          | 22 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 84e58a9cdab63ad264c2cd2bad64239d1912cbe7..09dcaeef645a4ab45f40a14f8d7b46f408225f81 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -150,6 +150,8 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 #define TIF_USING_IWMMXT	17
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
 #define TIF_RESTORE_SIGMASK	19
+#define TIF_LOCAL_RESTART	20
+#define TIF_LOCAL_RESTART_BLOCK	21
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
@@ -157,6 +159,8 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_USING_IWMMXT	(1 << TIF_USING_IWMMXT)
+#define _TIF_LOCAL_RESTART	(1 << TIF_LOCAL_RESTART)
+#define _TIF_LOCAL_RESTART_BLOCK (1 << TIF_LOCAL_RESTART_BLOCK)
 
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 35d2bb3cd2b442dac164548037262e065fbfe12a..a4fc6522124fd3ac3df7149ba38cf4b097196e06 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -541,7 +541,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 	unsigned int retval = 0, continue_addr = 0, restart_addr = 0;
 	bool syscall = (syscall_get_nr(current, regs) != -1);
 	struct ksignal ksig;
-	int restart = 0;
+	bool restart = false;
+	bool restart_block = false;
 
 	/*
 	 * If we were from a system call, check for system call restarting...
@@ -557,12 +558,12 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 		 */
 		switch (retval) {
 		case -ERESTART_RESTARTBLOCK:
-			restart -= 2;
+			restart_block = true;
 			fallthrough;
 		case -ERESTARTNOHAND:
 		case -ERESTARTSYS:
 		case -ERESTARTNOINTR:
-			restart++;
+			restart = true;
 			regs->ARM_r0 = regs->ARM_ORIG_r0;
 			regs->ARM_pc = restart_addr;
 			break;
@@ -593,8 +594,16 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 	} else {
 		/* no handler */
 		restore_saved_sigmask();
-		if (unlikely(restart) && regs->ARM_pc == restart_addr)
+		if (unlikely(restart) && regs->ARM_pc == restart_addr) {
+			/*
+			 * These flags will be picked up in the syscall invocation code,
+			 * and a local restart will be issued without exiting the kernel.
+			 */
+			set_thread_flag(TIF_LOCAL_RESTART);
+			if (restart_block)
+				set_thread_flag(TIF_LOCAL_RESTART_BLOCK);
 			regs->ARM_pc = continue_addr;
+		}
 	}
 	return;
 }
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index ed3ab51283c06c1398ece2ad3ee1fae16cd03ee8..20b59f5dfdc8d2e8c168ac04c2244cb6371e5672 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -11,6 +11,7 @@ __visible void invoke_syscall(void *table, struct pt_regs *regs, int scno)
 {
 	int ret;
 
+local_restart:
 	scno = syscall_enter_from_user_mode(regs, scno);
 	/* When tracing syscall -1 means "skip syscall" */
 	if (scno < 0) {
@@ -34,4 +35,25 @@ __visible void invoke_syscall(void *table, struct pt_regs *regs, int scno)
 	syscall_set_return_value(current, regs, 0, ret);
 
 	syscall_exit_to_user_mode(regs);
+
+	/*
+	 * Handle local restart: this means that when generic entry
+	 * calls arch_do_signal_or_restart() because a signal to
+	 * restart the syscall arrived while processing a system call,
+	 * we set these flags for the thread so that we don't even
+	 * exit the kernel, we just restart right here and clear
+	 * the restart condition.
+	 *
+	 * This is done because of signal race issues on ARM.
+	 */
+	if (test_thread_flag(TIF_LOCAL_RESTART)) {
+		if (test_thread_flag(TIF_LOCAL_RESTART_BLOCK)) {
+			scno = __NR_restart_syscall - __NR_SYSCALL_BASE;
+			/* Make this change visible to tracers */
+			task_thread_info(current)->abi_syscall = scno;
+			clear_thread_flag(TIF_LOCAL_RESTART_BLOCK);
+		}
+		clear_thread_flag(TIF_LOCAL_RESTART);
+		goto local_restart;
+	}
 }

-- 
2.49.0

