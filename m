Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E521EB5C9;
	Tue,  6 May 2025 20:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746562018; cv=none; b=PsiVsqLcMO8tOz/feXfI726nwn19Ub4IvxB98Rvm1Smw1VEYp7p1m1eTNTewfDnwPkfF85eVoCiqUDBFirNoFCIoQ+Caen2cB5Kv+FjyN1AsWV7b/aGZwsQ6y0LtWn+RJ47s16kKAWjvthw8KvWJsjkylxlO6h9Oe2ajq3fpsdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746562018; c=relaxed/simple;
	bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZog/0i2vTY1YVUt9OxjDdxXV3PXTPQxPXiXFipIEBHOBerHq/nnAgAmuRFAN51IA6UO48wt8eQ5Ktem7GziM6hYKVtFjuCEKa+itKigKTS/RWbsIZFTyh1Pdo9nUI6ktzG8KxKSI9Myfe3IsRLqskdK27nDFtzUalmmkPZT2v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm/5+0hI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm/5+0hI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22928d629faso57992355ad.3;
        Tue, 06 May 2025 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562016; x=1747166816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=Sm/5+0hI1IchqHdww6IORUm/JyvgfZb3GSM3hLGIfQI1g+6jLCxvU9TF9cFQv9ap9v
         80deJwULUKwWYCCmb1oHcWnMp7C/kCYpIy5mNvDhV6e+csa0kN4f7EvnEowGN8eQcR5j
         TRAsJeBU1Gz6MBavg3VS8srtiPLipxrk+H+5wPhX+dd6cUk1z7Mu/2USyK1IQEZfRYAg
         cAFxtTKR/Hd1SsgXRNAx0Llauq6Km4S5RIKdzQjhtca3H4m/v49YyvV6/ZRZ+EyDWdDz
         oFj5Yxtgvf474X7Y3rGOmCT4lukmj4MttvQ4MBWTjv/BNgvZAmz9ogn9g/u4+tZUOw3S
         m8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562016; x=1747166816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=F3WMVl908SsWytQojcHe/Xk8UN785e3RlAfOS2K1aHcFYCaUvlIcq06Z4Fx5oUjlsJ
         DDHxhrD3H2wxtxsfIranZepuaWof0FUkMiL/j4MDvoRUfRiV+kBUpRMrM9HcnLLlc6mF
         U8QzJ1NWxA7vmTy9v1u/Ljb5N69pSUYHh0HGQzJeZSVHQf1rbuvMx0Cb5iLifHRNCpaN
         dri2Ys1W7cT6eZE8o7nsy0ZbrUj3nunYVN3V8o5JjF9hycbk2hnimCaIE9WTETUC8R1C
         oZSfRDEDUj220pOKfGTKYNK8e/aVXOk1QJyORlHSxsbG61vVgFpelCetfqYP3lDHRq0K
         AnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU59lkSJqcEYvvi3ejiXXjU6/d/2xoHXvocfkpsLozYswj6Pps06stay7povtmcEal3vZsCTTUsiqcO@vger.kernel.org, AJvYcCXZRXi8oFtun0QlgRdUuMrVA8dvOk1eSEyOGVKA5mFEVWyrMCo67e+l1LeaekX/SuhEtB7fYbekxRq7bj0h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0GCe8cIGWaSO38txnOYr/toj/Kvl/0bd8GmKhO7Qb3UvxLzLG
	1dMiOYh5/Okal6T4qW7Mp0kO2oltzUo6aYSn+RCXbrkq8uk2AQvtJTsQUvqvF2M=
X-Gm-Gg: ASbGncvhvBlWvOInY6GBLRd8Y/bdX2RuE502yNMD+X6ttN6ZAnnXjwg98KRauFTr5gn
	qjYsJ8AXDGNHjkz3b+JzYsXCRDGruPK94Ye2A3Rd70T1V5yIxj4hInYz/Fw9QAGNNTVscm38UzY
	l592xCSdbspowKaLDcYgkltTDrEyipJgQb9QUhVD2B+aao/ZpYjIz+JKm8Ne/VbaVigHylzd+km
	OYFhQPOy3mtuUkAMl6Zw2zEESSTLwp9dEg8bICXgjkWYo7oPRZdK2AQbpG6n1fw05TPXiMmC9aN
	65WzP4GKtQUXOESbOWSIaoWoiq7gATP+egm7tU2HPneIi3Us0Sb9
X-Google-Smtp-Source: AGHT+IGlkQfSG4fbE10O+Rqi2AvcS+LbdMEMjae1CsuF7p66CVoyjD6FzSnG3zpc6h+DEromeglE2Q==
X-Received: by 2002:a17:902:f605:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22e5eaa83f7mr8227175ad.28.1746562015546;
        Tue, 06 May 2025 13:06:55 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm78378635ad.62.2025.05.06.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:06:55 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 00:06:12 +0400
Subject: [PATCH 1/3] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v1-1-6b76f7f340a6@gmail.com>
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746562005; l=4723;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
 b=wKzS1x8oJwHG3nz/X+LTVYpDOsWN5aGxHnJtcbMajdohXhyV0gDehxHOEjQVI5EVgZynHb27S
 I5HGX0aKbS8CHX8tYGsRUt6UWhQSW3AVE32ICZgfLUfkD0f7+h1F/1o
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

