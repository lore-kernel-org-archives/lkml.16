Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE672D9783
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632515; cv=none; b=YBca9mqvqDRn4pXLHGnT6s15tjVMUx8YSOugpnfxgeKqYusrQHHOyQ4VVe9HPZ/SePoiATRKQZxjk3d+UiHhluqWh/HfnqGMGvN1S2r8l1A7BWkquOmy0udIUkl42dP91kwc8kpCYyml8UpuwgXNAayAy8HslRRXC+7YIQF4A6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632515; c=relaxed/simple;
	bh=1EEsk3CakOIK6uLy9xJ0+8ZrzcRqWqydDglc717WYjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QZp6nMQAOxWgBW45OZUnZ6nE1obCdCa5DW1HS3YP1oh+wlxYGkP20PIZ3jwaAyMxUh6yQhDvrxQKNWnuEd7LnTI7obwHnqEADRx11kjYU9es7u4azdEBcZcU21Iew3rysHr7G/InZaKKZG7tC+mfqIOu8rWhH0SMMqSPSw0xe2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Sb3dBoLN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S4duA70Q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Sb3dBoLN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S4duA70Q"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751632511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MQ8S2P6tr58+gxioMqiPvqUsLz1lP2Wb0NQnRQjJAB8=;
	b=Sb3dBoLNnSkyajIhodo7cj/Di50cmVQJQ6QziMvNOtfU4fjiN2J3auhKj3Taq8Ab1bYFDL
	lVZJL6QeCpwvKZDMOnRHODSVICPS5MXo8WpX0IoK+H9pmonNPvj1JB9BzevTq3ORgSHmba
	r1KAI7GDu1G9yh9D/lzTqmTfKPvAFiVd8cvBLP/XGTDWIqY+KqD4yPQgsoyCl4l9hP5ukf
	wz99pIa0ZLC4dTHJYDSarIs4nEIqTViJMpGfsDQLTyGauvelgntWjjFygOLricvKifAJAG
	NO8+RL1VU5JaqBrYo/XP3zj/flThqccCypUuGKBA96/jOHwsyO59Pe/m3+4mcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751632511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MQ8S2P6tr58+gxioMqiPvqUsLz1lP2Wb0NQnRQjJAB8=;
	b=S4duA70QNhQb/AOlTDxvtZ36FBu7BcQF9mVE8vZZtFhBz6yi98lXkm4DArhqMekcQRpxHI
	cVP3cfIZpURydDDQ==
Date: Fri, 04 Jul 2025 14:34:47 +0200
Subject: [PATCH] um: Re-evaluate thread flags repeatedly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250704-uml-thread_flags-v1-1-0e293fd8d627@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAGbKZ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNj3dLcHN2SjKLUxJT4tJzE9GLdlDRDCxNTY9Mks2RzJaC2gqLUtMw
 KsJHRsbW1ANeAsBBiAAAA
X-Change-ID: 20250703-uml-thread_flags-df184535b6c7
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nam Cao <namcao@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751632510; l=2500;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1EEsk3CakOIK6uLy9xJ0+8ZrzcRqWqydDglc717WYjg=;
 b=Ncey8gWeakla09DCNmGT3PSI/G9tKWkGd/DZxzcF5ZZH1bZxFJDEx048UdBMeaa0DqoGYlR1t
 ct4Kep8B/9eASY5WMF/EJkgJgvAHZBnfvjcn7P6Hmx4XQCrxM5QjLzg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The thread flags may change during their processing.
For example a task_work can queue a new signal to be sent.
This signal should be delivered before returning to usespace again.

Evaluate the flags repeatedly similar to other architectures.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 arch/um/include/asm/thread_info.h |  4 ++++
 arch/um/kernel/process.c          | 20 ++++++++++++--------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/um/include/asm/thread_info.h b/arch/um/include/asm/thread_info.h
index f9ad06fcc991a2b10e2aa6059880b993e3d60a2d..eb9b3a6d99e84751a0b48ba516aaf25752e90873 100644
--- a/arch/um/include/asm/thread_info.h
+++ b/arch/um/include/asm/thread_info.h
@@ -50,7 +50,11 @@ struct thread_info {
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_MEMDIE		(1 << TIF_MEMDIE)
 #define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
+#define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SECCOMP		(1 << TIF_SECCOMP)
 #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
 
+#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL | \
+				 _TIF_NOTIFY_RESUME)
+
 #endif
diff --git a/arch/um/kernel/process.c b/arch/um/kernel/process.c
index 0cd6fad3d908d43e84ebc821676e05377ec641e9..1be644de9e41ecdb94d379760ee8790c1d0657c6 100644
--- a/arch/um/kernel/process.c
+++ b/arch/um/kernel/process.c
@@ -82,14 +82,18 @@ struct task_struct *__switch_to(struct task_struct *from, struct task_struct *to
 void interrupt_end(void)
 {
 	struct pt_regs *regs = &current->thread.regs;
-
-	if (need_resched())
-		schedule();
-	if (test_thread_flag(TIF_SIGPENDING) ||
-	    test_thread_flag(TIF_NOTIFY_SIGNAL))
-		do_signal(regs);
-	if (test_thread_flag(TIF_NOTIFY_RESUME))
-		resume_user_mode_work(regs);
+	unsigned long thread_flags;
+
+	thread_flags = read_thread_flags();
+	while (thread_flags & _TIF_WORK_MASK) {
+		if (thread_flags & _TIF_NEED_RESCHED)
+			schedule();
+		if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
+			do_signal(regs);
+		if (thread_flags & _TIF_NOTIFY_RESUME)
+			resume_user_mode_work(regs);
+		thread_flags = read_thread_flags();
+	}
 }
 
 int get_current_pid(void)

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250703-uml-thread_flags-df184535b6c7

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

