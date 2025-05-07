Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418511DF980;
	Wed,  7 May 2025 06:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601134; cv=none; b=sqKKMefgHIkOIoxk2vCMAaQUuXxQwEhf7U8DRaYucKMGfooUwXwglC9snqgH0kbtxbB4+qgWnU1BBNC2Vch3RUlqRMmaFtrOyAkA795mhvmzFNlEKY1X8qEwaxBJ1t6/mvg9pQ1g+lDOK0F84W7PLARYH6gmc6Ex6i3ntS/oKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601134; c=relaxed/simple;
	bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=muqIfLa+zCs/vyftHdZ3rJVoT/o//Pr0h7EA2eTvpg0v/kIyJJydwldBeplo2HEcuHhN0BRthQ+60O/p2u3pI2zql7HC+1TGgYQC2KROWp91UR46W1I1sD8gOCJhFMukdVCpBPOhtYPY9sHfsVV1wqjReu2CqO38WE67BQwMxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiesUOp6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiesUOp6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5376613a91.3;
        Tue, 06 May 2025 23:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601132; x=1747205932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=NiesUOp6+bqlV6N5Hw4axchsYFi1K6O+2PHApVkWf2dGHDcuV5Xx6GHtMOBkkBO41e
         bmTy7LQ3TqzDXoeBKLcURvblekG3SJwjyK4IrGQ/DVn1F8KzIOYLGPIOCxLzpI0Ni1rL
         byfEMFyWWovEjClDrjYdiYXa3zDsz/IoW9mqi3cbV8uuSOYmtIKEyabgJh6KlgdjVh1B
         jv2F9RM+Wvq8sXB+G2R8fylNOoAcFJpPiNRKrqIQ94XWtUS3g26tOe+0o2ZOQ9rutP5W
         nY7QfeNXsOvgZYXWxdk5QYZEPTVsufBmrEB2jIhevMrHst6IXVNmUXVBDJSKiXS9wN9J
         iRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601132; x=1747205932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=rRo3YanukP99g7neCMfDBl3PdMrlYdvl/Tz3woQcgqhUuw1JbL8h7u8JjOIIlcjekz
         z9wSZkhzobkOQ7j9Lncl3jNj9h4qqayb7S08keFimhpVE0pJFhI6Vd+bwqDKL4H8SlCP
         uvzZMwfpWUDP5r6SHkPE85/zlvwSomNBYf3PPPNQWXWz1o3BWCq7KCdpX8DAl693a2Nq
         eJiuNjRVzSP/kEEeJ1CRmIOBf0H5X3NFiWp0j8tAh/Q/Lb6uWDNvz5LsmqEA8xUOat7d
         XzZmsjw7HUapkeKcaprnZbHVKbLw35kUpdbcHElCcuHUnU6PmRuYByK6H1v1gPvurLNU
         FK0A==
X-Forwarded-Encrypted: i=1; AJvYcCUPUNZ1FFpqEUgbzjJHKQP/d96ubgJrA434/74zhkNsttvhWZ5FK1aKRiBvytuqTXrfvd0pxdTEWRkUvxE5@vger.kernel.org, AJvYcCVkighEU4i3qCbfS8GzpHl2QbSnIQRUF+NBc2nuiekILnZtCQ+kNJFSttU87cLplyuOeM94Q0gCWDrn@vger.kernel.org
X-Gm-Message-State: AOJu0YydyASwVJ3PE/nSr+W86Tm40NZO/dJF8vxiruRfdvuArVqSgiGC
	hsha4dplDHgQyuwfDjbmWRTQtaXtWJM7ZVFfeb+eNnLc4R7jQV6op1VlaDM58fUqtA==
X-Gm-Gg: ASbGncvKdV2guVL58qQtQybv7YLUqlYRCZ+b0b1uisxG8X2sw7WXB/V4GLbZTRaN/c8
	61KkhkXeu6issmjM2IzODPSwcco8csMHXjtzKHg8Gxxk1KVp88poka+i0oO0dMrOdumFygvnGqq
	tXmduByZLTRjZhWnmwLM8vqXVM1AgrFnjeAJJwDSfxsj+QvU450KXgjk4pvXBf9z/OzU3r8EKdw
	FAAEN8CFNJftfwVTF+/xbi4hQ4FAYXCpU84gkj/ERcx3EQnv0ysFdm80B1rJuBYzRdYPsDQwjNT
	xniNieHWKSyYaux0+39KMoo1gNWJTKGGYCvuS6WeTV3k1APZBggIbYkWv/3h67o=
X-Google-Smtp-Source: AGHT+IE1R0+xD8YFgg8XOD5hEde7Pqr3UAxJ1fPGWosaZ3JgY//JiBJll/02wER6xo3fdxcyyvsHNA==
X-Received: by 2002:a17:90a:e7ce:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-30aac26b86cmr3332750a91.27.1746601132185;
        Tue, 06 May 2025 23:58:52 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:58:51 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 10:58:31 +0400
Subject: [PATCH v2 2/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v2-2-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=4723;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
 b=2hmYsIIl3JTTzoNlkemuEqYWoJwtX02w1BOyvcRaRz0UXM/UX9q+mlX+UPe6goxwY67GNIrnI
 C5lJS7thZ5yCGiPc1qogRSL1ukycQShkcrEdQjnvsiEyLYVQV/ILE0y
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add defines for all known registers and their bits to make the code more
self-explanatory. While at that, replace _VAL suffixes with more
intuitive _REG suffixes on register offsets.

No functional changes.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/timer-vt8500.c | 65 ++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index a469b1b5f97233202bf01298b9f612e07026c20c..9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -24,15 +24,31 @@
 
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
-#define TIMER_MATCH_VAL		0x0000
-#define TIMER_COUNT_VAL		0x0010
-#define TIMER_STATUS_VAL	0x0014
-#define TIMER_IER_VAL		0x001c		/* interrupt enable */
-#define TIMER_CTRL_VAL		0x0020
-#define TIMER_AS_VAL		0x0024		/* access status */
-#define TIMER_COUNT_R_ACTIVE	(1 << 5)	/* not ready for read */
-#define TIMER_COUNT_W_ACTIVE	(1 << 4)	/* not ready for write */
-#define TIMER_MATCH_W_ACTIVE	(1 << 0)	/* not ready for write */
+
+#define TIMER_MATCH_REG(x)	(4 * (x))
+#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
+
+#define TIMER_STATUS_REG	0x0014
+#define TIMER_STATUS_MATCH(x)	BIT((x))
+#define TIMER_STATUS_CLEARALL	(TIMER_STATUS_MATCH(0) | \
+				 TIMER_STATUS_MATCH(1) | \
+				 TIMER_STATUS_MATCH(2) | \
+				 TIMER_STATUS_MATCH(3))
+
+#define TIMER_WATCHDOG_EN_REG	0x0018
+#define TIMER_WD_EN		BIT(0)
+
+#define TIMER_INT_EN_REG	0x001c	 /* interrupt enable */
+#define TIMER_INT_EN_MATCH(x)	BIT((x))
+
+#define TIMER_CTRL_REG		0x0020
+#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
+#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
+
+#define TIMER_ACC_STS_REG	0x0024	 /* access status */
+#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
+#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
+#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
 
 #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
 
@@ -43,11 +59,12 @@ static void __iomem *regbase;
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
 	int loops = msecs_to_loops(10);
-	writel(3, regbase + TIMER_CTRL_VAL);
-	while ((readl((regbase + TIMER_AS_VAL)) & TIMER_COUNT_R_ACTIVE)
-						&& --loops)
+
+	writel(TIMER_CTRL_ENABLE | TIMER_CTRL_RD_REQ, regbase + TIMER_CTRL_REG);
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_RD_COUNTER
+	     && --loops)
 		cpu_relax();
-	return readl(regbase + TIMER_COUNT_VAL);
+	return readl(regbase + TIMER_COUNT_REG);
 }
 
 static struct clocksource clocksource = {
@@ -63,23 +80,25 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 {
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
-	while ((readl(regbase + TIMER_AS_VAL) & TIMER_MATCH_W_ACTIVE)
-						&& --loops)
+
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
+	       && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_VAL);
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(1, regbase + TIMER_IER_VAL);
+	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
 
 static int vt8500_shutdown(struct clock_event_device *evt)
 {
-	writel(readl(regbase + TIMER_CTRL_VAL) | 1, regbase + TIMER_CTRL_VAL);
-	writel(0, regbase + TIMER_IER_VAL);
+	writel(readl(regbase + TIMER_CTRL_REG) | TIMER_CTRL_ENABLE,
+	       regbase + TIMER_CTRL_REG);
+	writel(0, regbase + TIMER_INT_EN_REG);
 	return 0;
 }
 
@@ -95,7 +114,7 @@ static struct clock_event_device clockevent = {
 static irqreturn_t vt8500_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evt = dev_id;
-	writel(0xf, regbase + TIMER_STATUS_VAL);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
 	evt->event_handler(evt);
 
 	return IRQ_HANDLED;
@@ -119,9 +138,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -EINVAL;
 	}
 
-	writel(1, regbase + TIMER_CTRL_VAL);
-	writel(0xf, regbase + TIMER_STATUS_VAL);
-	writel(~0, regbase + TIMER_MATCH_VAL);
+	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
+	writel(~0, regbase + TIMER_MATCH_REG(0));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {

-- 
2.49.0

