Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548023FC7D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945120; cv=none; b=MJ+57MijjjirDHmn/uUXbZey5IdQBUSH73qvAWfGz0oodZ+9ZYh5lqkTvK9XrDCS9wYJzbjVXMEPxr7/xczxaVGamqVxSCIm63n0JXrgEWx156MQy65SdPE0I2aYAf4zvLD/ZnrLT6lkh0jDu3P35H9b0Su6pXBfmUYmNnw3tpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945120; c=relaxed/simple;
	bh=lEwmq7bj2YIf2fOKIkICfPl3oC8yqKYgyFS1caz+Aqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRCXq6VRxtPACoHpxQ9dluuf5yRYJu3Yc450rg9js6mqu1V+g6bcL6Aizg9WFYfKTK6kmVWIx0JqaoKnTEoW0oUW2pxlwkv4PUDt65dkJfQxpDR/PsndWKc1NGV9Jmfw+6CqdAL02bFaH38Tlt+h9hRySQsoJlPfYWShz2gc5oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqXL/HRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqXL/HRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C309C4CEE9;
	Tue, 29 Apr 2025 16:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945119;
	bh=lEwmq7bj2YIf2fOKIkICfPl3oC8yqKYgyFS1caz+Aqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqXL/HRCMU/lrBaf9lX3mTYuST2StOFq9o7ox8z4hUHLPol+F6gPyzREkeTNM0gU0
	 FogbuOllCL4wiKK6J0DbkGMr/846nz1/vLG/PCg35O04U5zrH/vWI+A1cc6/GyDKqj
	 SSeCpF+PFt6TCzWwmO5bs8MS2An7LCN0XjaOGOY7iqwo03zqM0gEBXdcUyaOgohMtA
	 WkLVnQlupIrm9610BPAxvZ6S1NGtiuChYYF0TnpvDNtfa9xiXMHZ7dslhBGuV+Ws+o
	 Ls2foZv3SEzx57K4V2tdNxiN7m19H9n7p+QpSlvYGr7Qp2TRffN/aHqCUAf5bBdsHh
	 kVYU7DMLJklmw==
From: carlos.bilbao@kernel.org
To: tglx@linutronix.de,
	seanjc@google.com,
	jan.glauber@gmail.com
Cc: bilbao@vt.edu,
	pmladek@suse.com,
	akpm@linux-foundation.org,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	takakura@valinux.co.jp,
	john.ogness@linutronix.de,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH v3 1/2] panic: Allow for dynamic custom behavior after panic
Date: Tue, 29 Apr 2025 10:06:37 -0500
Message-ID: <20250429150638.1446781-2-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Introduce panic_set_handling() to allow overriding the default post-panic
behavior with a priority-based mechanism.

Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
Reviewed-by: Jan Glauber (DigitalOcean) <jan.glauber@gmail.com>
---
 include/linux/panic.h |  2 ++
 kernel/panic.c        | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/linux/panic.h b/include/linux/panic.h
index 2494d51707ef..cf8d4a944407 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -98,4 +98,6 @@ extern void add_taint(unsigned flag, enum lockdep_ok);
 extern int test_taint(unsigned flag);
 extern unsigned long get_taint(void);
 
+void panic_set_handling(void (*fn)(void), int priority);
+
 #endif	/* _LINUX_PANIC_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index a3889f38153d..559304546f2e 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -276,6 +276,25 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
 		crash_smp_send_stop();
 }
 
+/*
+ * If set, this function is called after a kernel panic is handled. It can
+ * be assigned using panic_set_handling(), which supports priority-based
+ * logic. For example, specific architectures may provide a default handler
+ * (priority 0) that halts the system to conserve CPU resources.
+ */
+static void (*panic_halt)(void);
+
+static int panic_halt_priority;
+
+void panic_set_handling(void (*fn)(void), int priority)
+{
+	if (panic_halt && priority <= panic_halt_priority)
+		return;
+
+	panic_halt_priority = priority;
+	panic_halt = fn;
+}
+
 /**
  *	panic - halt the system
  *	@fmt: The text string to print
@@ -467,6 +486,9 @@ void panic(const char *fmt, ...)
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
 	nbcon_atomic_flush_unsafe();
 
+	if (panic_halt)
+		panic_halt();
+
 	local_irq_enable();
 	for (i = 0; ; i += PANIC_TIMER_STEP) {
 		touch_softlockup_watchdog();
-- 
2.47.1

