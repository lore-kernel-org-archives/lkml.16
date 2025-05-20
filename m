Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C242E628
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747705700; cv=none; b=KEQlallR+fQeYwbKqRnQqcASGMEKnTOaSCRgmc5qzToOsiiu1MLvq5GnIdvNprfOLAC2miD4zQR8J1ZsZEeViq4LKt0q8ofW2SdYA+B4h8nC5a2klg14su+lCEmrOkhvdvCNPu1lyZPetNgN8ZYyfSFXbutqHbCdm9T3GVlTdgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747705700; c=relaxed/simple;
	bh=I0r8HlHEHZMZBQdFgXJR+5ZLORRLtKIQdIWM17hD9EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3Qmu7ZS6pv0BGxr4Y+DtoL7Lb78WMhWOD5EUNICiwjglnhyyiaYU5KEpmc4jr9hCQci4mqm9snboZk9BDqsVPV3QaVkxXerp6B4192pNhv7ScbQ69GQSbLUMVATs7OH5lw4Y1Q5EBmT1C8HHWXIxbNyTro6ZSFTCkR5OP2XGmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=OTtI9hyN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="OTtI9hyN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231e8553248so29913535ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1747705698; x=1748310498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gisDcoPpjnzkdeg7wyEUyVREO6oQMsPscCNJQoCfPb4=;
        b=OTtI9hyNaV2RzlcJU6DbcKkJRV6SbTm7bXkOY99pTt4hwe3JSBr9+3ylxfB33V+7wg
         KcDWqM58ev+dtDXkPRAcSCH5QP8OETKuxbmxQLt6muib2LOpoDWohqxcWtCk3LblU9EH
         lL/VWxXUDbXXUfvuYqk8pU2lp1bo7Itod8Fik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747705698; x=1748310498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gisDcoPpjnzkdeg7wyEUyVREO6oQMsPscCNJQoCfPb4=;
        b=go2tGTgme+FcKShqy4g6owFSsX6795Zrr0Op1FgLIulCTF0bD6WU3h2at8PptUVmxO
         vIYZoahjHlc3aWZa3N+EkOqXuO8NAWGeIp8QIPqjl+t67S/gM6cFFqIIplE19trpZTOc
         hpjZO33kNdogHarbYcC144QgpPGeqDP/wHl90sYMNCHhQEkjEgdK1y7UF2DWRQmkYhXk
         lpoQ2XBqv/4KdWbm6WqTNEw+vDfw9CkxM8mSfefGJvqBMTB37/FGdOWkm0ReobjKZmvH
         BE6vXMUUVLbSn1Brbg2GM7UbDb4GEJ55O2DnB+L3wt2tya0MM5hFD1U8ym1/PpbSE0KU
         7SCg==
X-Gm-Message-State: AOJu0Yzi5EVYYYTE2JGZe3EvydtvoV8FnNlwMkQPaZpmpcWled24sJiE
	I3dXwtmo/KZG9wfA3E7bdUS9Bj4vob1r36B14EhfH1m8OChtafWEEIDbZrAD1emv0Tc=
X-Gm-Gg: ASbGncua7KEdw8z1uDcUMWA7+2CONrO0qZ9neHHZ7M7I/HSfB0AnL87rk4kY3XlJQnD
	6wrr+WpzFn+OxOdlNNKocWzIQgwm9T+vV3ZYMufNkZPHMadWn6iUn39U9sfas1sqZi719voPxg2
	u+A4VVRhlcPfc1QYY7XABlyeGVXVUQ7hcSwjcYUpcr89f3t0szZ3NrYv7owA+U69u/JF0K1duu3
	kJ5nl7HQDccxWugQerVzEyg4Jsjzw0f09eP1bIqdKWlh2Q71m/2kYEVBndrQvObInv4T62EzvhK
	JbG6+njfgR423kxSfLuGt/jwcIy84LOzNEAMG8KZm469f8v0XipzP0nqfiQoL7kO
X-Google-Smtp-Source: AGHT+IGS0SFAfAA6pHGjLkoJ6CblijEJ+AkAMupsvi5VPfRo9Y9DtMGyKa7DiFn80ngKm2tvH8G5oQ==
X-Received: by 2002:a17:902:f551:b0:227:eb61:34b8 with SMTP id d9443c01a7336-231de31b3e6mr217938005ad.25.1747705697995;
        Mon, 19 May 2025 18:48:17 -0700 (PDT)
Received: from spectre.. ([2406:3003:2006:4886:7585:d64b:ff48:a43e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4eedb59sm66143005ad.257.2025.05.19.18.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 18:48:17 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	stable@kernel.org,
	Daniel J Blueman <daniel@quora.org>,
	Scott Hamilton <scott.hamilton@eviden.com>
Subject: [PATCH RESEND] Prevent unexpected TSC to HPET clocksource fallback on many-socket systems
Date: Tue, 20 May 2025 09:47:43 +0800
Message-ID: <20250520014750.112450-1-daniel@quora.org>
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

