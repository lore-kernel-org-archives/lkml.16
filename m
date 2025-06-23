Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C82F2D4B40
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706774; cv=none; b=bucloVS1wuxGySV8nBOZNC4MWwCV3LoIZ4NYKh07FIHSAkvhUdcZowWJGThL3GHQGJHCyDQexoU7ad+8TIeBD/dk5d4hs7Fz/pBreTaVaShYoo+gMdMBXWO/Ak4oMKb4g1/qW55X2wg1Bw6LZ0NzIkbtpMk9hj7mQChjrmeYOvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706774; c=relaxed/simple;
	bh=XwwMkrgJbQ+iphWDh7a1A3iYblM9/iVX+IUeIy/8wrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCTQHSocVfFLPHHjbuzz7JPvxzE/A9FDWJ/teGY01fLJp7qLspEKTcSm1FjZg6DELeHeZ/jIs5Uz+cK1TRiflzxHEPgqdH4hvEWjpZpYpNf7z9AADzbT9dzvXhGXdjNJ+/enNSCYWu8K0L5SbU9/tjQ8ptCLGLt6Y+aebNH6UHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GMcHEavG; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GMcHEavG"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-addda47ebeaso952848766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750706767; x=1751311567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHvDFrJ6H1+v1HU0C9Dh3b9mcZBS7rbiWmZCIgdgUQQ=;
        b=GMcHEavG7nqxHVl7o/7fX7lO+e+q28z0dzSxgpSnFTM+IiW1BVrisBrFW+YOgVc4Mg
         XcviGwuiWwiHTNulfqqKRc9gPei6Jr0F8Q+pfJryttL7+X6rCiB7WEHVGUqZL1SCVk6l
         tPOJKQ6FQOTogZtK6/g4gYZbcYu3lNYV3pq8nxMa+hpSEaFeARRzkQHr34PeBzkdxay3
         VGtKvEjFOQPBEopzWAx6UfSlaDoHy/tyng9biIP/KfqVxhdaDvkr7z5ZU9lua4pbsTX8
         gvHNe88H/jHXVWFc6qtlFHiZdOpTiSY3PIAHcrLRhDCuBkJzLEobiKVMYpInx+29YoWJ
         glmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706767; x=1751311567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHvDFrJ6H1+v1HU0C9Dh3b9mcZBS7rbiWmZCIgdgUQQ=;
        b=Wa4yrKyQOcO4ICvK9jNze4m5e5dO4nu1vTZbS6VcCizFj9nKkw6Ud32Ny5Dtr88AJT
         SkTMke6+qzUbXBW83S409M2Inbt46DECFpg/+OfGHfUu9ahwz4mtnNvxGkAiKLKEMeOT
         9xF2KKGlVk4FXbFVNX0fe7twydauhndvyqaKuiyWcMHg7Y2NEMSN5DDLjsry76MVVjLp
         axTuHCKm+5TP+ksl7d3MwYEhLb8BI0LHFNN1/PpVQDgJNvqBZPUjSbU5ixkVffwxQH9Q
         WJVk0to3CBgjWwJP9Yq9gUD+KSfgjP9GhtWSCpIvajXBFS7jE8AOpQjGyxh+8BY62XiI
         0dpw==
X-Forwarded-Encrypted: i=1; AJvYcCVo2v996vODTtEaodJwLR0ZvEZJ3dC52Gw2WNsnYh52kPdpfvPGLvPhX5gCBdfJVZtZiK7GMCPfSQxbwYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTdQlwcn1mLLVcd2l+4sEdcJz0LKI9bxsQ1+jXN3yY7r/OdbAg
	YDz6fo0ophYxKzDj5c/lSWZbtQiqaRVauW5dnG1rdusi1lM5QPfv7BySX6TJEedSIrQ=
X-Gm-Gg: ASbGncvetmIbWxL1JRQQqCUZEfgwuRrUnaksv0KU+AHaoFDmLKT2eyTDMNnI+kZES6D
	4Cpnf32Fax9vqgWBUzV4oZKlvD4ae0rX2qtNJBiU0mhdvOQ2G2i1RvKKthWWogJYVk+tlameFpV
	WlBGG5nqT2YW3alqgYfFL52AzSZUG27g5KIUf59n77Pj8HTpG/Mj6PnHUL/THF5uS6gVkF3ZyW8
	X83BIwoKYXf/n8LFVWos07mCuos3ZUuzWp+5X+tNtDofstnZnvYI6GOIU5+sZuEm7W2zGizIMGB
	EUQo1A/VumNUBJrg3CNT46cIM2d8+98Sb2AHhr98NCfwRBERrlHqJgNBpUw/8Gf8VkLqHg==
X-Google-Smtp-Source: AGHT+IGSavjgIZ9sXrSj5rozKvqmWef3mvFzR/a5f+aszpHgcxKWhvv9wF7jXblJfFcjqdtuPSj0KA==
X-Received: by 2002:a17:907:c0e:b0:adf:f883:aa78 with SMTP id a640c23a62f3a-ae0578d5db5mr1417258966b.10.1750706767405;
        Mon, 23 Jun 2025 12:26:07 -0700 (PDT)
Received: from localhost ([2001:4090:a244:83c4:9fe4:a128:a20c:8b84])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae09d72008dsm113675466b.55.2025.06.23.12.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:26:06 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 23 Jun 2025 21:24:30 +0200
Subject: [PATCH 3/3] clocksource/drivers/timer-ti-dm: Add clockevent
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topic-ti-dm-clkevt-v6-16-v1-3-b00086761ee1@baylibre.com>
References: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
In-Reply-To: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6658; i=msp@baylibre.com;
 h=from:subject:message-id; bh=XwwMkrgJbQ+iphWDh7a1A3iYblM9/iVX+IUeIy/8wrc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozIVa6b1nHzFvuuE5l2+5prcPXkp5q3yh2MGFZ+WHPW1
 Saj5zZTRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEzE/AfDX6E1+z8zFzyLjt+6
 LT/HZ73Djvd790Xl2bw12OkofXWpQwDD/4zX57jMvaZ0/TL8+/xAoJ7y91nz+Walxq8XNxU3n3/
 jORsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add support for using the TI Dual-Mode Timer for clockevents. The second
always on device with the "ti,timer-alwon" property is selected to be
used for clockevents. The first one is used as clocksource.

This allows clockevents to be setup independently of the CPU.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/clocksource/timer-ti-dm.c | 138 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 133 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 085609ba2d249dcc8f53c8aaa831d8fbe69b3753..a17e3e81508793a46cdee815bde3ad17fedd55e7 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -21,8 +21,10 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clocksource.h>
+#include <linux/clockchips.h>
 #include <linux/cpu_pm.h>
 #include <linux/module.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -158,7 +160,14 @@ struct dmtimer_clocksource {
 	unsigned int loadval;
 };
 
+struct omap_dm_timer_clockevent {
+	struct clock_event_device dev;
+	struct dmtimer *timer;
+	u32 period;
+};
+
 static resource_size_t omap_dm_timer_clocksource_base;
+static resource_size_t omap_dm_timer_clockevent_base;
 static void __iomem *omap_dm_timer_sched_clock_counter;
 
 enum {
@@ -1091,6 +1100,9 @@ static void omap_dm_timer_find_alwon(void)
 {
 	struct device_node *np;
 
+	if (omap_dm_timer_clocksource_base && omap_dm_timer_clockevent_base)
+		return;
+
 	for_each_matching_node(np, omap_timer_match) {
 		struct resource res;
 
@@ -1103,13 +1115,22 @@ static void omap_dm_timer_find_alwon(void)
 		if (of_address_to_resource(np, 0, &res))
 			continue;
 
-		omap_dm_timer_clocksource_base = res.start;
+		if (!omap_dm_timer_clocksource_base) {
+			omap_dm_timer_clocksource_base = res.start;
+			continue;
+		}
 
-		of_node_put(np);
-		return;
+		if (res.start != omap_dm_timer_clocksource_base) {
+			omap_dm_timer_clockevent_base = res.start;
+
+			of_node_put(np);
+			return;
+		}
 	}
 
-	omap_dm_timer_clocksource_base = -1;
+	if (!omap_dm_timer_clocksource_base)
+		omap_dm_timer_clocksource_base = -1;
+	omap_dm_timer_clockevent_base = -1;
 }
 
 static struct dmtimer_clocksource *omap_dm_timer_to_clocksource(struct clocksource *cs)
@@ -1188,6 +1209,105 @@ static int omap_dm_timer_setup_clocksource(struct dmtimer *timer)
 	return 0;
 }
 
+static struct omap_dm_timer_clockevent *to_dm_timer_clockevent(struct clock_event_device *evt)
+{
+	return container_of(evt, struct omap_dm_timer_clockevent, dev);
+}
+
+static int omap_dm_timer_evt_set_next_event(unsigned long cycles,
+					    struct clock_event_device *evt)
+{
+	struct omap_dm_timer_clockevent *clkevt = to_dm_timer_clockevent(evt);
+	struct dmtimer *timer = clkevt->timer;
+
+	dmtimer_write(timer, OMAP_TIMER_COUNTER_REG, 0xffffffff - cycles);
+	dmtimer_write(timer, OMAP_TIMER_CTRL_REG, OMAP_TIMER_CTRL_ST);
+
+	return 0;
+}
+
+static int omap_dm_timer_evt_shutdown(struct clock_event_device *evt)
+{
+	struct omap_dm_timer_clockevent *clkevt = to_dm_timer_clockevent(evt);
+	struct dmtimer *timer = clkevt->timer;
+
+	__omap_dm_timer_stop(timer);
+
+	return 0;
+}
+
+static int omap_dm_timer_evt_set_periodic(struct clock_event_device *evt)
+{
+	struct omap_dm_timer_clockevent *clkevt = to_dm_timer_clockevent(evt);
+	struct dmtimer *timer = clkevt->timer;
+
+	omap_dm_timer_evt_shutdown(evt);
+
+	omap_dm_timer_set_load(&timer->cookie, clkevt->period);
+	dmtimer_write(timer, OMAP_TIMER_COUNTER_REG, clkevt->period);
+	dmtimer_write(timer, OMAP_TIMER_CTRL_REG,
+		      OMAP_TIMER_CTRL_AR | OMAP_TIMER_CTRL_ST);
+
+	return 0;
+}
+
+static irqreturn_t omap_dm_timer_evt_interrupt(int irq, void *dev_id)
+{
+	struct omap_dm_timer_clockevent *clkevt = dev_id;
+	struct dmtimer *timer = clkevt->timer;
+
+	__omap_dm_timer_write_status(timer, OMAP_TIMER_INT_OVERFLOW);
+
+	clkevt->dev.event_handler(&clkevt->dev);
+
+	return IRQ_HANDLED;
+}
+
+static int omap_dm_timer_setup_clockevent(struct dmtimer *timer)
+{
+	struct device *dev = &timer->pdev->dev;
+	struct omap_dm_timer_clockevent *clkevt;
+	int ret;
+
+	clkevt = devm_kzalloc(dev, sizeof(*clkevt), GFP_KERNEL);
+	if (!clkevt)
+		return -ENOMEM;
+
+	timer->reserved = 1;
+	clkevt->timer = timer;
+
+	clkevt->dev.name = "omap_dm_timer";
+	clkevt->dev.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	clkevt->dev.rating = 300;
+	clkevt->dev.set_next_event = omap_dm_timer_evt_set_next_event;
+	clkevt->dev.set_state_shutdown = omap_dm_timer_evt_shutdown;
+	clkevt->dev.set_state_periodic = omap_dm_timer_evt_set_periodic;
+	clkevt->dev.set_state_oneshot = omap_dm_timer_evt_shutdown;
+	clkevt->dev.set_state_oneshot_stopped = omap_dm_timer_evt_shutdown;
+	clkevt->dev.tick_resume = omap_dm_timer_evt_shutdown;
+	clkevt->dev.cpumask = cpu_possible_mask;
+	clkevt->period = 0xffffffff - DIV_ROUND_CLOSEST(timer->fclk_rate, HZ);
+
+	__omap_dm_timer_init_regs(timer);
+	__omap_dm_timer_stop(timer);
+	__omap_dm_timer_enable_posted(timer);
+
+	ret = devm_request_irq(dev, timer->irq, omap_dm_timer_evt_interrupt,
+			       IRQF_TIMER, "omap_dm_timer_clockevent", clkevt);
+	if (ret) {
+		dev_err(dev, "Failed to request interrupt: %d\n", ret);
+		return ret;
+	}
+
+	__omap_dm_timer_int_enable(timer, OMAP_TIMER_INT_OVERFLOW);
+
+	clockevents_config_and_register(&clkevt->dev, timer->fclk_rate,
+					3,
+					0xffffffff);
+
+	return 0;
+}
+
 /**
  * omap_dm_timer_probe - probe function called for every registered device
  * @pdev:	pointer to current timer platform device
@@ -1204,7 +1324,7 @@ static int omap_dm_timer_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	if (!omap_dm_timer_clocksource_base)
+	if (!omap_dm_timer_clocksource_base || !omap_dm_timer_clockevent_base)
 		omap_dm_timer_find_alwon();
 
 	pdata = of_device_get_match_data(dev);
@@ -1281,6 +1401,14 @@ static int omap_dm_timer_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
+	if (omap_dm_timer_clockevent_base && res &&
+	    res->start == omap_dm_timer_clockevent_base &&
+	    !IS_ERR_OR_NULL(timer->fclk)) {
+		ret = omap_dm_timer_setup_clockevent(timer);
+		if (ret)
+			return ret;
+	}
+
 	if (omap_dm_timer_clocksource_base && res &&
 	    res->start == omap_dm_timer_clocksource_base &&
 	    !IS_ERR_OR_NULL(timer->fclk)) {

-- 
2.49.0

