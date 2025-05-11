Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC421891AB
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746969572; cv=none; b=WjY1Hoo1l4h6LWEa67hWdBnfLJYhRlobiLP15U5C8xGIxeiHW2+oePi3Qfut72WpBrHQUzqFqXLSi0FqcgTcEcaEGPcXImMwjRV8bP6SSGxZcKTKxw2rluIDFKC9tUD6Q32DL770MscRwBv3Gzpkwu0FGplV4aMZJ1xhWkTBOpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746969572; c=relaxed/simple;
	bh=I0r8HlHEHZMZBQdFgXJR+5ZLORRLtKIQdIWM17hD9EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EqJGQVKBgf499lgkl39ioaUWX7PASAnwfPemg9VJhNAO8NVZG1BJv3pQYhr3CtkLJ0e7arxwoK5HUDaNBonKOwWvSjKMomfaMc2le8c7iXG984TFUQbYyO3YHt0vzT5VRFVrP1E3gj1Ffu4hWqqLvUvpCM8z72Sh2AMF9pMSd/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=Lnv7G0up; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="Lnv7G0up"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e73e9e18556so3377660276.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1746969569; x=1747574369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gisDcoPpjnzkdeg7wyEUyVREO6oQMsPscCNJQoCfPb4=;
        b=Lnv7G0upIeqWCTrVChq9053cyoTwlmwCz8eds2a9YpmnPvpaEm/Xikm+V0dhfEh53e
         le39gx19BMnb1CJGcFNYVGehZXptC5ERpxT0Mj10/ALlDAlHk4BgjOMiLQdazxuNTNrT
         ydVXFtjP6UqGgdIkeC+hmYWq8Q2CeT4IhMohM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746969569; x=1747574369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gisDcoPpjnzkdeg7wyEUyVREO6oQMsPscCNJQoCfPb4=;
        b=odel95PTxgvChnETDdeLZIMiIcZ/HHN3SILt2U38A/dfL9bjC+uqVU395nEQa4JQx6
         iSd4DbqBfpDBri2w/QF7ZHMLiIHr9UwNaDVgQJRhm2Ae7q037j4sGM5CpHlTf9TWoD70
         HkC225kvvJwxqnJt4z+ebePtcJOHAsBiv3w7r4Gt9+pmjniu9GJYfOcH5A9g4gC7wv2p
         v2wwSen0ZnJV0ymjEgtKhwg1147eO5kzc20jjsSQ4ZzpHt2gAbmH0GYl+QeWTy11W7Hq
         +yCJaRPfgbbbizW1e0Tqm2dZHGxBAeytmqMbON4Nrfgdc40TI+EH4MZ88lzX/TDkOQEM
         Q7hg==
X-Gm-Message-State: AOJu0Yy3yDM99i6MUf9uRgw8hURwKKhICJZcVQvOZuQUj8HiMH4bGc+d
	DTUeQxvqvRaUE4PWIxHPBPC9B2bQgFb6rtvlcvNZNu0heTZ9hnP0vs1H0vNjyrNsAeI8qO9R4uJ
	V
X-Gm-Gg: ASbGncuSnf/H6qRcjtbePAIaCsocRfSS+niWHoaMn2DPJ1apa2ouuRq6v6SwoCuLQyJ
	ZcT6BFvgn8l8HR56Xg8G2mJj9iqYBZc6nQNbAb71EB3QHp6UvwJvVLjQ7h3xPK+DFW1uCeUpr5I
	4y6wN9ifa+fBIJ/XHNE/2yrv1zUELAugP0yIDYocpvNy5gkpSQI3wqcwA45nabJwYBGRlo9Duvq
	y8qi9THtgZuOFSzcLqhxJg4L8J3A2+CYDTyacYonO1eJkT/OXhvO3+nOfzBFjZTxA4fhxsgklVY
	dmlvQEQU891gWNQr3U+nH9VxPHYgC5bdeeILYRfamXRaUn5epUs+lg==
X-Google-Smtp-Source: AGHT+IHmsGSrCy1MKijDg2jk1wm7zFeHpGqXPRNBv7WzlYrib1GkvOgE8y01mcBI9TPq3QjOi4blyA==
X-Received: by 2002:a05:6902:1028:b0:e79:1566:6505 with SMTP id 3f1490d57ef6-e7915666998mr5089795276.20.1746969569526;
        Sun, 11 May 2025 06:19:29 -0700 (PDT)
Received: from spectre.. ([2406:3003:2006:3f45:f900:4749:adc5:9cc8])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7ab4bf8705sm407565276.12.2025.05.11.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:19:28 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	stable@kernel.org,
	Daniel J Blueman <daniel@quora.org>,
	Scott Hamilton <scott.hamilton@eviden.com>
Subject: [PATCH] Prevent unexpected TSC to HPET clocksource fallback on many-socket systems
Date: Sun, 11 May 2025 21:19:21 +0800
Message-ID: <20250511131922.145736-1-daniel@quora.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On systems with many sockets, kernel timekeeping may quietly fallback from
using the inexpensive core-level TSCs to the expensive legacy socket HPET,
notably impacting application performance until the system is rebooted.
This may be triggered by adverse workloads generating considerable
coherency or processor mesh congestion.

This manifests in the kernel log as:
 clocksource: timekeeping watchdog on CPU1750: Marking clocksource 'tsc' as unstable because the skew is too large:
 clocksource:                       'hpet' wd_nsec: 503029760 wd_now: 48a38f74 wd_last: 47e3ab74 mask: ffffffff
 clocksource:                       'tsc' cs_nsec: 503466648 cs_now: 3224653e7bd cs_last: 3220d4f8d57 mask: ffffffffffffffff
 clocksource:                       Clocksource 'tsc' skewed 436888 ns (0 ms) over watchdog 'hpet' interval of 503029760 ns (503 ms)
 clocksource:                       'tsc' is current clocksource.
 tsc: Marking TSC unstable due to clocksource watchdog
 TSC found unstable after boot, most likely due to broken BIOS. Use 'tsc=unstable'.
 sched_clock: Marking unstable (882011139159, 1572951254)<-(913395032446, -29810979023)
 clocksource: Checking clocksource tsc synchronization from CPU 1800 to CPUs 0,187,336,434,495,644,1719,1792.
 clocksource: Switched to clocksource hpet

Scale the default timekeeping watchdog uncertinty margin by the log2 of
the number of online NUMA nodes; this allows a more appropriate margin
from embedded systems to many-socket systems.

This fix successfully prevents HPET fallback on Eviden 12 socket/1440
thread SH120 and 16 socket/1920 thread SH160 Intel SPR systems with
Numascale XNC node controllers.

Reviewed-by: Scott Hamilton <scott.hamilton@eviden.com>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 kernel/time/Kconfig       | 8 +++++---
 kernel/time/clocksource.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index b0b97a60aaa6..48dd517bc0b3 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -200,10 +200,12 @@ config CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
 	int "Clocksource watchdog maximum allowable skew (in microseconds)"
 	depends on CLOCKSOURCE_WATCHDOG
 	range 50 1000
-	default 125
+	default 50
 	help
-	  Specify the maximum amount of allowable watchdog skew in
-	  microseconds before reporting the clocksource to be unstable.
+	  Specify the maximum allowable watchdog skew in microseconds, scaled
+	  by the log2 of the number of online NUMA nodes to track system
+	  latency, before reporting the clocksource to be unstable.
+
 	  The default is based on a half-second clocksource watchdog
 	  interval and NTP's maximum frequency drift of 500 parts
 	  per million.	If the clocksource is good enough for NTP,
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index bb48498ebb5a..43e2e9cc086a 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -10,7 +10,9 @@
 #include <linux/device.h>
 #include <linux/clocksource.h>
 #include <linux/init.h>
+#include <linux/log2.h>
 #include <linux/module.h>
+#include <linux/nodemask.h>
 #include <linux/sched.h> /* for spin_unlock_irq() using preempt_count() m68k */
 #include <linux/tick.h>
 #include <linux/kthread.h>
@@ -133,9 +135,12 @@ static u64 suspend_start;
  * under test is not permitted to go below the 500ppm minimum defined
  * by MAX_SKEW_USEC.  This 500ppm minimum may be overridden using the
  * CLOCKSOURCE_WATCHDOG_MAX_SKEW_US Kconfig option.
+ *
+ * If overridden, linearly scale this value by the log2 of the number of
+ * online NUMA nodes for a reasonable upper bound on system latency.
  */
 #ifdef CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
-#define MAX_SKEW_USEC	CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
+#define MAX_SKEW_USEC	(CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US * max(ilog2(nr_online_nodes), 1))
 #else
 #define MAX_SKEW_USEC	(125 * WATCHDOG_INTERVAL / HZ)
 #endif
@@ -1195,6 +1200,8 @@ void __clocksource_update_freq_scale(struct clocksource *cs, u32 scale, u32 freq
 	 * comment preceding CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US above.
 	 */
 	if (scale && freq && !cs->uncertainty_margin) {
+		pr_info("Using clocksource watchdog maximum skew of %uus\n", MAX_SKEW_USEC);
+
 		cs->uncertainty_margin = NSEC_PER_SEC / (scale * freq);
 		if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
 			cs->uncertainty_margin = 2 * WATCHDOG_MAX_SKEW;
-- 
2.48.1

