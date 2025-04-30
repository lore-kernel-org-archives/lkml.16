Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D7B9317BCE;
	Wed, 30 Apr 2025 03:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983667; cv=none; b=iB6MuIx91jrPpiAfTWJLCN5qGETGOVsmHiBP+E4tn8FnVgmUVsPotWeONvsDviOzbXr0Vc+mRGTorKK0w298eR5jL4tYnkzxpksz0X/sZ23R3e4oPfZ4la3sQ8NgJsDiQ873SH0SgGmkqWeYNhYpygiby55cEY926F5VnJ6TkoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983667; c=relaxed/simple;
	bh=TA/oaPhLaGpyOFSU6/CEZ4CaYsUYo367iaGcEsvtJSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=TXHfnDD22p0emBlPGw0C+FouG2+rCWWhjk6Q/IN4jy0pQ3tuDSQhtTihq2A/r5cMXf9QHzaTORNU/D6SlPgaJnDmsO2YKdOHPSPzEy6Cio5HP0n5No5ISe5L5Nydy2tRWn9261F4Ph/B4ximQRrxUzCd6JAOo0UyFRT4CJPd6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id C76576019013B;
	Wed, 30 Apr 2025 11:27:38 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jstultz@google.com
Cc: Su Hui <suhui@nfschina.com>,
	tglx@linutronix.de,
	eahariha@linux.microsoft.com,
	geert@linux-m68k.org,
	anna-maria@linutronix.de,
	ojeda@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3 1/3] time/jiffies: change register_refined_jiffies() to void __init
Date: Wed, 30 Apr 2025 11:27:32 +0800
Message-Id: <20250430032734.2079290-2-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250430032734.2079290-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_refined_jiffies() is only used in setup code and always return 0.
Mark it to __init to save some bytes and change it to void.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2/v3:
 - No change. 

 include/linux/jiffies.h | 2 +-
 kernel/time/jiffies.c   | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
index 0ea8c9887429..91b20788273d 100644
--- a/include/linux/jiffies.h
+++ b/include/linux/jiffies.h
@@ -59,7 +59,7 @@
 /* LATCH is used in the interval timer and ftape setup. */
 #define LATCH ((CLOCK_TICK_RATE + HZ/2) / HZ)	/* For divider */
 
-extern int register_refined_jiffies(long clock_tick_rate);
+extern void register_refined_jiffies(long clock_tick_rate);
 
 /* TICK_USEC is the time between ticks in usec assuming SHIFTED_HZ */
 #define TICK_USEC ((USEC_PER_SEC + HZ/2) / HZ)
diff --git a/kernel/time/jiffies.c b/kernel/time/jiffies.c
index bc4db9e5ab70..34eeacac2253 100644
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -75,13 +75,11 @@ struct clocksource * __init __weak clocksource_default_clock(void)
 
 static struct clocksource refined_jiffies;
 
-int register_refined_jiffies(long cycles_per_second)
+void __init register_refined_jiffies(long cycles_per_second)
 {
 	u64 nsec_per_tick, shift_hz;
 	long cycles_per_tick;
 
-
-
 	refined_jiffies = clocksource_jiffies;
 	refined_jiffies.name = "refined-jiffies";
 	refined_jiffies.rating++;
@@ -100,5 +98,4 @@ int register_refined_jiffies(long cycles_per_second)
 	refined_jiffies.mult = ((u32)nsec_per_tick) << JIFFIES_SHIFT;
 
 	__clocksource_register(&refined_jiffies);
-	return 0;
 }
-- 
2.30.2

