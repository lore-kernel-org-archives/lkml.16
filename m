Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7128E56C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640441; cv=none; b=SqjLxqwtdBSnLWBCi97Z9m9ZtlkHRu1NGKxEawFfnj+LgnVU3w3POs8+8M/dyDgF9K/nR8kVVYaotEP53GviU0w5+AliPDCsnuNnAXrai+vLJn14fsg8lfLOfA662gpnfqsPN3ipB2xzowxFl3PwkoEsSv9bVoIFIch2hbqYGM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640441; c=relaxed/simple;
	bh=8Res91WzHf8xKtboDRgXwfTTaviexcbskYLDrg1xibM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xb+ZPonreCZDpPTePG66KSwfB4TPDteNtWSdk2/rPpc+WODvpAafz4gLccK2YSWJqsA0D8/ibziJ+UZRHZD1f5X+krC0jF+6DAT8LQHVDz3aGW0P0PQiAgIQnCvPBBon/qqnjY24R9UbWcBRzxbjEv+G5uq46p0WcnrLQPiKPpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzpQtOfW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzpQtOfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FACC4CEEB;
	Wed,  7 May 2025 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640440;
	bh=8Res91WzHf8xKtboDRgXwfTTaviexcbskYLDrg1xibM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzpQtOfWtS++zoCcgwAbl8PS/kZGaiXBI8+qoW6+I5UE5B45okdySp/wWePLJRw7F
	 RsOGH1ygH1byMBUfXOSXi2vicayYZzjE6Va58B27yTUwunV4EQ+oLciPwIc4Zrp0Op
	 L790y1PHjLYs1X8fZnVtkhlwHgtSbami0PvwJKIlH0OGJ2xG64CArw3BBsWQTxACFE
	 elC3oN9GHHWwx62Wi8y7v++lp/M+BCAPQVsm5uaIhRpN0F6fPyxVWKieI+f/wOs1KD
	 hQrcs987iqrFYA/Og4Nwnq2YuAwSXxXB+FjeH2ZUxklnBmolCS3aZqcxz4SC/rPd1C
	 Fmsk3LWTql/UQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 07/10] timers: Rename init_timers() => timers_init()
Date: Wed,  7 May 2025 19:53:35 +0200
Message-ID: <20250507175338.672442-8-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507175338.672442-1-mingo@kernel.org>
References: <20250507175338.672442-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical timers_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/timer.h | 2 +-
 init/main.c           | 2 +-
 kernel/time/timer.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 68cf8e28bbe0..153d07dad3cd 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -168,7 +168,7 @@ extern int timer_delete(struct timer_list *timer);
 extern int timer_shutdown_sync(struct timer_list *timer);
 extern int timer_shutdown(struct timer_list *timer);
 
-extern void init_timers(void);
+extern void timers_init(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
 
diff --git a/init/main.c b/init/main.c
index 7f0a2a3dbd29..bf9c5d22953b 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1002,7 +1002,7 @@ void start_kernel(void)
 	init_IRQ();
 	tick_init();
 	rcu_init_nohz();
-	init_timers();
+	timers_init();
 	srcu_init();
 	hrtimers_init();
 	softirq_init();
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 11c6a11a3569..012b9190e859 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -2612,7 +2612,7 @@ static void __init init_timer_cpus(void)
 		init_timer_cpu(cpu);
 }
 
-void __init init_timers(void)
+void __init timers_init(void)
 {
 	init_timer_cpus();
 	posix_cputimers_init_work();
-- 
2.45.2

