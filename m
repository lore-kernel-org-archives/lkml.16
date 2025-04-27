Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 46E5E2512C0;
	Sun, 27 Apr 2025 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745753744; cv=none; b=s81hyC1Jyg7Lhs8gp/AGgfMlr6wMCEJpOnrAiS2WSMec7yoRl9q++hbc7Jh6JJF2qMl3fnBTHKTxyzKdrPOX7tVC9lVLcJg4wgifrFRNfuvTMFCEmils/pHZUwUztHK2GK7cl3Wf85nGZ3foXQvyZJgnpnWaHpQ4l+H0DnmOR7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745753744; c=relaxed/simple;
	bh=QOLVD4XARfihC0BVLJ9ka6TW3KW0UYOgHaX04+ZAmNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=DEd6wOfwkU8q2E3RgPwn9WRzrTB7fxEghfoHUIlQ74vPWJKZd2RH0SLeHR0VWc37GIAVXQ05WB03VlrhlNQ0zmrrh+6wtCqJQrdSiINCOBYHA9rUCfkIuOT1yspSzNAoVi3L8yxYrTeWqPTDBlivwYE5X806WvAHxO8rEd/G7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 5661D60196435;
	Sun, 27 Apr 2025 19:35:38 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: 
Cc: Su Hui <suhui@nfschina.com>,
	tglx@linutronix.de,
	eahariha@linux.microsoft.com,
	geert@linux-m68k.org,
	anna-maria@linutronix.de,
	ojeda@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 1/3] time/jiffies: change register_refined_jiffies() to void __init
Date: Sun, 27 Apr 2025 19:35:28 +0800
Message-Id: <20250427113529.1473800-2-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250427113529.1473800-1-suhui@nfschina.com>
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
v2:
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

