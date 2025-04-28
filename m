Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D11214A8A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883923; cv=none; b=sr8YFdfjf7SNMU5VdWSmq8WqAL5jwcp1P5JS3cZ6EjZkWCWKZ/IgmrLeC4ZwrCMOPrvoqZCdUnOP2H1hCmfvUma/gQiKmReBVh7kwldCXlFT6iJYK8beZTYwccfJKkAtQW6fR+dRx69dN0fxP5qwZxz3F5RR8XKzvvIOuho6Urs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883923; c=relaxed/simple;
	bh=FSacFZ9dJEJb48n63iZ9igxm6yKlAmEtqNgt/zpRG9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh156/5g47VxusJYfp7SC9OPZQj6v5v4WRs2yiO6oagqg7uy/PvUzkzZ//xmLF5iMi7aF7AXS2HQx6mscrXJWVFdvjC8ob4lwST1YdOks0AKn/0S/ZxcQ7nwU/6sAp53Dm2OPZFu+YdePb5DZ+Kh714Vhi9bm4PZIsFJjLELABk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZTTdgst; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZTTdgst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF4DC4CEE4;
	Mon, 28 Apr 2025 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745883922;
	bh=FSacFZ9dJEJb48n63iZ9igxm6yKlAmEtqNgt/zpRG9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aZTTdgstcIuA6N29aq6tPoqKxXOJmtG+fEJvSm4My/XkMoneh9Ql8YrAHQQLxsMvO
	 rnN18S8h6FQylxo47nxWwEVlgtZ/SxrNrOGFh0XKWtW7G0Kbe9OwsoDEaW1HAoWmOO
	 w0RByRiByfcfMegHT8px7Khd7e+JrzTC4uO+GLOYNGQ4rR8kDMfUcd6ZEtcApIZZbx
	 85tN+nIblTKIHz1mv7WybbjUpVz8AOu+XmBZqn6x/SXLiSgIj5ItPGNfOjaaOjL12U
	 T8kYUE5WbA6agtupbriX3HJz1tX1mOCc8huq0l8wfYKlrt5Gk8Hj/Xde5woYT2T/6Y
	 WwawAxceDs6CQ==
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
Subject: [PATCH v2 1/2] panic: Allow for dynamic custom behavior after panic
Date: Mon, 28 Apr 2025 16:59:51 -0500
Message-ID: <20250428215952.1332985-2-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Introduce panic_set_handling() to allow overriding the default post-panic
behavior.

Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
---
 include/linux/panic.h |  2 ++
 kernel/panic.c        | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

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
index a3889f38153d..2cdd83b4afb6 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -276,6 +276,30 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
 		crash_smp_send_stop();
 }
 
+/*
+ * This is the default function called after a kernel panic has been
+ * handled. Higher priority alternatives can be set with function
+ * panic_set_handling()
+ *
+ */
+static void after_panic_handling(void)
+{
+	mdelay(PANIC_TIMER_STEP);
+}
+
+static void (*panic_halt)(void) = after_panic_handling;
+static int panic_hlt_priority;
+
+void panic_set_handling(void (*fn)(void), int priority)
+{
+	if (priority <= panic_hlt_priority)
+		return;
+
+	panic_hlt_priority = priority;
+	panic_halt = fn;
+}
+EXPORT_SYMBOL_GPL(panic_set_handling);
+
 /**
  *	panic - halt the system
  *	@fmt: The text string to print
@@ -467,6 +491,9 @@ void panic(const char *fmt, ...)
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

