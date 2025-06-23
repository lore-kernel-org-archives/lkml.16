Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC21E1DFE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706770; cv=none; b=qWm7CDvzwgQU6PT70sMWOeRntPpK029KPpFb2UgrFcIwZtUMwKPLktgsYil3MthzSZ9b+WmcOdTcQmI/s35xKwm4/PrH0eHlYfQaF88wlKGzh1AmIHaIWecGYUGOgvVu/CxzB5/bEsAkHXkatrKlp7OkWu+vtHddnS/hnxQMOVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706770; c=relaxed/simple;
	bh=M2CqLZ0we9DeOHjdeaLn157gWrOfT6VUa3BCVJb11LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKLfYvLYMo+33rABdp4wwqbkRn41MxI7SRrE40qlgI8E/4BG9DM5AqrkWyvSpXgcpSZE3pptZqAcAwN7a0uGwuibGfMFCfYPIr2m8kZyRiikjb2TAH+AD/zjhx9Xucu6h1GSkMvaJAi2HVUDlrbU55urqbwfC2Gw4RmnikfevMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ax6vwBo6; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ax6vwBo6"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso9616601a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750706766; x=1751311566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMV1moI4oywoM9xdSdqey4ZkIFS6cCeNCpT5ft900Nc=;
        b=ax6vwBo60+BZmTpCGoiGzUyWGkQzvcYm8TzlwSEh882bcfecKeA8aF4klIyMNnMjB+
         F2guyL0UPcD4hSfnGSKon44SWOYs4qT8w2f0PP9nwS7XDopzRb6okNAnkGrpuG4PUHr0
         mWBqqbKeDI2Kc2n1QqNxw79ISAmqXLZmesq653CyBC+ph50dA7WSp+922ucXOk93ioEc
         cV8KtzAOJQB/9cdHIm5qz7ymDsV58CiHWi06yQ7clod+YNIarpNy3ioDZhASxYKZr1WR
         qSgDblDVuPco/Ly/vzll0IeTvJb9dn3mAIbKVdQVFfaInSoTUoCNXpCH7FGd/B6/MucR
         WmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706766; x=1751311566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMV1moI4oywoM9xdSdqey4ZkIFS6cCeNCpT5ft900Nc=;
        b=Oj9kU7CH+FoQDxPDYIkyKUBcZkzOJX+N+kqddA46MiyVOWN2Km13OkK/a3I5EwJENs
         F/P2o0gPLVTdnWb7NtP6XxCnIEsYSJjcM3EAzR0gWfQLra6eSZfEBs9XGRvM2dwUS8oZ
         k8UvbQ1/E36I6hSzyL2Qd8j6EksqqszcCbfizdpgigSghEZWsAIG5n7bPgvPkjCC+MlX
         BYGqtIa3PklzHLacvmOeA9puUlw1lAnf+7O9ghIHj5hoqGPcYC0C+TPtLn2UbpLZEqYw
         UIqBxi2mb5sQfWdm4EChH89CFrCA24mN25TbmbStO91QOUMjF1c4yoRRL82VdTw2jlYG
         ltJQ==
X-Forwarded-Encrypted: i=1; AJvYcCULuIyqY7zCl1+rbpN74+r6Jp8qqrUYwYHUMmCeA3Bhq6c+LOIsXsHdcUDCVdTnKhIju/IflktNn7mDCHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdw8Mky0V5TxiJIkvLMCHi9K/UJ0srqYiz5M+vQtaBkZLWN70N
	QEQrojEMp0vcYNV5fabLPPxjYrmty56Ljc8usyNz26gHKNbWaBXyrk+O9kNB0ftM4uA=
X-Gm-Gg: ASbGncvHUYGX6LSum/wCrYI6KUNRbP6DtKVfR7HoDy8or2on0+I6CbCudzCw01Li2XH
	Aud/rUhHi5QvM8loncEqP8qioKuSmQp5LmKFWhEVMciULy9sKaAyOO4bpoEutc1XGiUs0hP9Z6e
	CVuNrvtKdmPxUb/bzOsOjHhOwiVInX4rjbhrPrQNE+1BbBMnzrUrGiqpWUX3aTZYlPR4XEDYC7Z
	cwXvg1HuJnCcZWHjoGILQNgmVE8iDABZaMa4cn/xnmPb86W4ZgAjO/9hvKQufRypDi9j5uA8FgY
	YEgy6THQY3OhZM+1ZNTGj2F2PLLJd8o1U9R2STrMI9zZGHhTRLGjApg+TvY=
X-Google-Smtp-Source: AGHT+IFJuXhaFRH27Fy79DnV1ailWssd+BP+YwZERJQll/onbOiIQacL7DjMugkt2pRsUdVvzMgAHA==
X-Received: by 2002:a17:907:7286:b0:ade:4300:6c8f with SMTP id a640c23a62f3a-ae057c4685fmr1388618566b.57.1750706766045;
        Mon, 23 Jun 2025 12:26:06 -0700 (PDT)
Received: from localhost ([2001:4090:a244:83c4:9fe4:a128:a20c:8b84])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae053e7fbd9sm750159166b.33.2025.06.23.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:26:05 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 23 Jun 2025 21:24:29 +0200
Subject: [PATCH 2/3] clocksource/drivers/timer-ti-dm: Add clocksource
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topic-ti-dm-clkevt-v6-16-v1-2-b00086761ee1@baylibre.com>
References: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
In-Reply-To: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6695; i=msp@baylibre.com;
 h=from:subject:message-id; bh=M2CqLZ0we9DeOHjdeaLn157gWrOfT6VUa3BCVJb11LI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozIVfaCOUxRperz7JTlI9acqGHp+r7auijwl8wW523Vp
 /bIzdjRUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABP5JcDwh19bwGDXh7mRv6+V
 bI3odWZnjnBXNjjx+OvLvffena2VX8zwz7Ts4YWk3/F/69fE/Dw6h6vqbMO+pBm+f7ZUaxl5bFD
 qYwUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add support for using the TI Dual-Mode Timer as a clocksource. The
driver automatically picks the first timer that is marked as always-on
on with the "ti,timer-alwon" property to be the clocksource.

The timer can then be used for CPU independent time keeping.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/clocksource/timer-ti-dm.c | 137 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 136 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index e9e32df6b56664bc0bd94050380314a757d05ebd..085609ba2d249dcc8f53c8aaa831d8fbe69b3753 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -20,6 +20,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/clocksource.h>
 #include <linux/cpu_pm.h>
 #include <linux/module.h>
 #include <linux/io.h>
@@ -27,8 +28,10 @@
 #include <linux/err.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/dmtimer-omap.h>
+#include <linux/sched_clock.h>
 
 #include <clocksource/timer-ti-dm.h>
 
@@ -141,12 +144,23 @@ struct dmtimer {
 	struct notifier_block nb;
 	struct notifier_block fclk_nb;
 	unsigned long fclk_rate;
+
+	struct dmtimer_clocksource *clksrc;
 };
 
 static u32 omap_reserved_systimers;
 static LIST_HEAD(omap_timer_list);
 static DEFINE_SPINLOCK(dm_timer_lock);
 
+struct dmtimer_clocksource {
+	struct clocksource dev;
+	struct dmtimer *timer;
+	unsigned int loadval;
+};
+
+static resource_size_t omap_dm_timer_clocksource_base;
+static void __iomem *omap_dm_timer_sched_clock_counter;
+
 enum {
 	REQUEST_ANY = 0,
 	REQUEST_BY_ID,
@@ -1073,6 +1087,107 @@ static const struct dev_pm_ops omap_dm_timer_pm_ops = {
 
 static const struct of_device_id omap_timer_match[];
 
+static void omap_dm_timer_find_alwon(void)
+{
+	struct device_node *np;
+
+	for_each_matching_node(np, omap_timer_match) {
+		struct resource res;
+
+		if (!of_device_is_available(np))
+			continue;
+
+		if (!of_property_read_bool(np, "ti,timer-alwon"))
+			continue;
+
+		if (of_address_to_resource(np, 0, &res))
+			continue;
+
+		omap_dm_timer_clocksource_base = res.start;
+
+		of_node_put(np);
+		return;
+	}
+
+	omap_dm_timer_clocksource_base = -1;
+}
+
+static struct dmtimer_clocksource *omap_dm_timer_to_clocksource(struct clocksource *cs)
+{
+	return container_of(cs, struct dmtimer_clocksource, dev);
+}
+
+static u64 omap_dm_timer_read_cycles(struct clocksource *cs)
+{
+	struct dmtimer_clocksource *clksrc = omap_dm_timer_to_clocksource(cs);
+	struct dmtimer *timer = clksrc->timer;
+
+	return (u64)__omap_dm_timer_read_counter(timer);
+}
+
+static u64 notrace omap_dm_timer_read_sched_clock(void)
+{
+	/* Posted mode is not active here, so we can read directly */
+	return readl_relaxed(omap_dm_timer_sched_clock_counter);
+}
+
+static void omap_dm_timer_clocksource_suspend(struct clocksource *cs)
+{
+	struct dmtimer_clocksource *clksrc = omap_dm_timer_to_clocksource(cs);
+	struct dmtimer *timer = clksrc->timer;
+
+	clksrc->loadval = __omap_dm_timer_read_counter(timer);
+	__omap_dm_timer_stop(timer);
+}
+
+static void omap_dm_timer_clocksource_resume(struct clocksource *cs)
+{
+	struct dmtimer_clocksource *clksrc = omap_dm_timer_to_clocksource(cs);
+	struct dmtimer *timer = clksrc->timer;
+
+	dmtimer_write(timer, OMAP_TIMER_COUNTER_REG, clksrc->loadval);
+	dmtimer_write(timer, OMAP_TIMER_CTRL_REG, OMAP_TIMER_CTRL_ST | OMAP_TIMER_CTRL_AR);
+}
+
+static int omap_dm_timer_setup_clocksource(struct dmtimer *timer)
+{
+	struct device *dev = &timer->pdev->dev;
+	struct dmtimer_clocksource *clksrc;
+	int err;
+
+	__omap_dm_timer_init_regs(timer);
+
+	timer->reserved = 1;
+
+	clksrc = devm_kzalloc(dev, sizeof(*clksrc), GFP_KERNEL);
+	if (!clksrc)
+		return -ENOMEM;
+
+	clksrc->timer = timer;
+	timer->clksrc = clksrc;
+
+	clksrc->dev.name = "omap_dm_timer";
+	clksrc->dev.rating = 300;
+	clksrc->dev.read = omap_dm_timer_read_cycles;
+	clksrc->dev.mask = CLOCKSOURCE_MASK(32);
+	clksrc->dev.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	clksrc->dev.suspend = omap_dm_timer_clocksource_suspend;
+	clksrc->dev.resume = omap_dm_timer_clocksource_resume;
+
+	dmtimer_write(timer, OMAP_TIMER_COUNTER_REG, 0);
+	dmtimer_write(timer, OMAP_TIMER_LOAD_REG, 0);
+	dmtimer_write(timer, OMAP_TIMER_CTRL_REG, OMAP_TIMER_CTRL_ST | OMAP_TIMER_CTRL_AR);
+
+	omap_dm_timer_sched_clock_counter = timer->func_base + _OMAP_TIMER_COUNTER_OFFSET;
+	sched_clock_register(omap_dm_timer_read_sched_clock, 32, timer->fclk_rate);
+
+	err = clocksource_register_hz(&clksrc->dev, timer->fclk_rate);
+	if (err)
+		return dev_err_probe(dev, err, "Could not register as clocksource\n");
+
+	return 0;
+}
+
 /**
  * omap_dm_timer_probe - probe function called for every registered device
  * @pdev:	pointer to current timer platform device
@@ -1086,8 +1201,12 @@ static int omap_dm_timer_probe(struct platform_device *pdev)
 	struct dmtimer *timer;
 	struct device *dev = &pdev->dev;
 	const struct dmtimer_platform_data *pdata;
+	struct resource *res;
 	int ret;
 
+	if (!omap_dm_timer_clocksource_base)
+		omap_dm_timer_find_alwon();
+
 	pdata = of_device_get_match_data(dev);
 	if (!pdata)
 		pdata = dev_get_platdata(dev);
@@ -1160,6 +1279,16 @@ static int omap_dm_timer_probe(struct platform_device *pdev)
 
 	timer->pdev = pdev;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (omap_dm_timer_clocksource_base && res &&
+	    res->start == omap_dm_timer_clocksource_base &&
+	    !IS_ERR_OR_NULL(timer->fclk)) {
+		ret = omap_dm_timer_setup_clocksource(timer);
+		if (ret)
+			return ret;
+	}
+
 	pm_runtime_enable(dev);
 
 	if (!timer->reserved) {
@@ -1187,6 +1316,9 @@ static int omap_dm_timer_probe(struct platform_device *pdev)
 	return 0;
 
 err_disable:
+	if (timer->clksrc)
+		clocksource_unregister(&timer->clksrc->dev);
+
 	pm_runtime_disable(dev);
 	return ret;
 }
@@ -1201,10 +1333,13 @@ static int omap_dm_timer_probe(struct platform_device *pdev)
  */
 static void omap_dm_timer_remove(struct platform_device *pdev)
 {
-	struct dmtimer *timer;
+	struct dmtimer *timer = dev_get_drvdata(&pdev->dev);
 	unsigned long flags;
 	int ret = -EINVAL;
 
+	if (timer->clksrc)
+		clocksource_unregister(&timer->clksrc->dev);
+
 	spin_lock_irqsave(&dm_timer_lock, flags);
 	list_for_each_entry(timer, &omap_timer_list, node)
 		if (!strcmp(dev_name(&timer->pdev->dev),

-- 
2.49.0

