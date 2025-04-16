Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB923536B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794374; cv=none; b=ge7ZmPa8CCbwJeGyYGvkQVl3v+dHgbltiaYyw4s3HQDto2Irwd3dEH0zq6SQxsSd8LGpIAVUDMnt6ouwUnPMwVs3gdROGyxtQ8Ov34cLpDaYQio5fex7Tk7LRXbAZ/NEXEtlSKOk06PskX1HCghNBbMc30VNPv4vrhQBU/y0vTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794374; c=relaxed/simple;
	bh=TwT0WEI3t8j8AY5SxN+VdSoF7onNqf22mkSer7bxXD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GL5O/d8l61GBMGsDOdOXbXKBs7voBxrzaNtejLNY4qWpsnR8E+EcpFaLXvUYm6rvckWW6CnVJOE1g9gukGxlq/TW5Xjr8uxhDRDhOVv73Ip0aI75v6rT4x9WBcacb3ms3PoMSlDzTJSVLiMPOzCHXablng4+MnqxwiDl0dBzy/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikA/ph5B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikA/ph5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50651C4CEE9;
	Wed, 16 Apr 2025 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794374;
	bh=TwT0WEI3t8j8AY5SxN+VdSoF7onNqf22mkSer7bxXD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ikA/ph5Becgcx4YCbIsCIHst/W1hLWo0DfVgyYwbLnrViGBR8Nrprxjoe23SyARrc
	 de09VN1CHkrZBMHIjKM4PSrpkZEAVCWPmkA3tqWKK56Zwymb4QIeGrs3g2YKJ/h6pN
	 uPZFAaHJDDeOJVPs3Evs1akJr4ZG71i811Rg0gqYPPAf5VQq177o9YrcTFrgSRXkUy
	 WE4cZlwVwuJ/J2FXajbYxQgdJH521Znfwv/2qKRGImbMvGuTWtojq+zgeHjPBAhWSV
	 Pcdas2yC9MSSQrj6GF/NMfuI2WWRzTwYQ+HQW7ra92nSYEDoqTpg26caRQuSnuB/pJ
	 6ta64OEf2SjCg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 10/10] treewide, timers: Rename init_timers() => timers_init()
Date: Wed, 16 Apr 2025 11:05:44 +0200
Message-ID: <20250416090544.3311613-11-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416090544.3311613-1-mingo@kernel.org>
References: <20250416090544.3311613-1-mingo@kernel.org>
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
index ab025aa7cce1..0d97d8369f71 100644
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
index fa2782eb6931..007b30fc383b 100644
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

