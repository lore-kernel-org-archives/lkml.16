Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEEC182D0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748903700; cv=none; b=IAJQO3zx5zs2hlFCVOSSbQ6g7y6dow8VNJxiIeUW7QZOE1rUcK6WBNZJRtxgKhrkWlNVIBGNkzD69QTnV01PD8uy11W9UjH87oPAdxLd1WyRwj+EG2qd/emHMtDIYntiQe81+fQW9TPqm95jTKnBTF9FlizNS8UGxPy4SpzRH0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748903700; c=relaxed/simple;
	bh=I0r8HlHEHZMZBQdFgXJR+5ZLORRLtKIQdIWM17hD9EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pyb5KqsAF4cMLiJsTG7rL7V9sPVKHJ/rG5x4DPTBs36U+21rq40JLqTBoba1u6bm7nvDEo3YmDZXLhWq4EXobhptrD3Yg3IsoPC51APKX7rILu7MrAkd1ECpBOKFoH0xPV7vl1B7nD9YnTBwh4d0t6JBK4CC7bGH00HZ25Xee+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=OdCcr4a+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="OdCcr4a+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e09f57ed4so49669675ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1748903697; x=1749508497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gisDcoPpjnzkdeg7wyEUyVREO6oQMsPscCNJQoCfPb4=;
        b=OdCcr4a+5dH9ecF8yoveYtNNTjycGkqo6oGUPLfvhGLnn/57Mu1CnHgP4ux8xKiKIN
         MGPdev/Fu0cDIOwEoM9omcsbVDdmbD7eduMi2+f1Tdaenct+Cb158xYxkipnlXBoPp0M
         /FxYtxXBri/AJvDiyst9oVg6aFLdKFh5pri3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748903697; x=1749508497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gisDcoPpjnzkdeg7wyEUyVREO6oQMsPscCNJQoCfPb4=;
        b=SxF5xq6kNMQzLUQRgZPSH7UAZaQpoWIcJbuceprogz5h6ucW520yQCZAbTxOXnwP0I
         uXFelKFhjzQ8cSBULyHn16c7WOpfTkAXRny7m4ZqEctts25F0jvkH670c7q/uA8gfNhJ
         GRpx/qu/ZxMgxfwSIdb908dh1b5UnXJCLm0gnYej8+953I2ODVW9fXAduC2vImK2ca1U
         oXGxqI0K9tpesZcYHfywUuVbJ1vs+a7N5CPRChbO/fzgqSalbJVSzWXpofbD/81B2dSQ
         6+HSO2Zo0y57+zNqH1Oz6HbNZhNqQLMizXnTkHRWRE22qs8v3uBVCp4lHagVRk2kA+HV
         cK9Q==
X-Gm-Message-State: AOJu0Yy2lAVbR/USXUwLic/I9Yy8fqyUgPujS1tAF7wPBMsXhfpZghoV
	uSL+Yv8m8CUWcAeF45AgQv/UmrxHg93vqwyVMsu1E2K8rff33FpwuoZJzOQIFC3RGlo=
X-Gm-Gg: ASbGncvBeQx1EDJzUAD88xK6BqXqYEGzrNXroOlbspm0HzFNitQ+jsjrC4aK5qMh8O6
	ORHMwTRkc5Jwvgu9tZQxh43O5P8dtRD7dgrggDG00J1AG3PWU3HaRfIAytQiY+lXg7C+xAjFFgr
	XmwbLYyRB/pwTMS0YA4vF+449qxMdamRrdX8ir/Wap2hlwK5PAghY1xd5kJ2oRTQUetmA5m51FG
	LJWDkFKMhgb794hp5/Y51Qosr8lX4nL10Jq6PMp8WsFSNtGfL/iUmx/AFI6tFAtl51n3BHKUgaS
	ojzjvkNAdyBs77LmHTkqENQeBt1nrNbHPnxN41oPi/z8GtUB2TyB
X-Google-Smtp-Source: AGHT+IG8TcfJYc/8H0X4JilsCkVS4DlUC1+3xYaF4/HK8bkT4e56ad3EvTw+5nX/hMP/0sc2RKufSA==
X-Received: by 2002:a17:902:ccce:b0:235:1b50:7245 with SMTP id d9443c01a7336-235c9d7d3c5mr2727265ad.7.1748903697450;
        Mon, 02 Jun 2025 15:34:57 -0700 (PDT)
Received: from spectre.. ([2406:3003:2006:4886:5ec2:5d7a:4b11:47e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47c0sm75468345ad.175.2025.06.02.15.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 15:34:56 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	stable@kernel.org,
	Daniel J Blueman <daniel@quora.org>,
	Scott Hamilton <scott.hamilton@eviden.com>
Subject: [PATCH RESEND] Prevent unexpected TSC to HPET clocksource fallback on many-socket systems
Date: Tue,  3 Jun 2025 06:32:49 +0800
Message-ID: <20250602223251.496591-1-daniel@quora.org>
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

