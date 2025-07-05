Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C8620FABC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731307; cv=none; b=hJ92/ZKaMUky4OkxbfbRhoPto9536UlHfYOsoN9xkb2F5KbsGiUiDii2oGjspzJuoK9+835GQZUDHJoY8+tZEB1KzcG4A9JFaZ7WTSYQnA1QQ/c916xaUKqcyg8MSH8rgzQpuaKnb6Mly4xcwoMiAFGWcVaeoTHMDlNIYgfBeCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731307; c=relaxed/simple;
	bh=jpSsgVmo545R6Fs7k3JvSGXq45XPdnMEYua0cmzMR10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXr5GRTv8bs8iBkyU1rsNVQUxeAN/enDYxuiJJL7dgnJ6bfIlFb9fBOZscRYisL4Zh/a11/1FTrFjxG2xjRVN9zTOWt3NH7p7G0HT/+d7LO+nwxuBJDN3x7xPm0FiG8v0WlzcCNAv1fZv4aQkL7Pc4QX2GMlV7xqMCJuUBc7z0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2TMqWwG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2TMqWwG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453749aef9eso5764325e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731304; x=1752336104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUsxmHI16pe+iZ8+pv+ck2V4zWW0Na+WzCoL+5yxEKQ=;
        b=C2TMqWwGgVqAwiOOdA1KNBJs2CW+7GOc+SwYs6w9mAQlT0LWc5S1oezQThw1biqWJN
         xn+qVhkPlrbLwLgAqEK7vu59vSaNXR4Nq9UpRQAHbmvMrhYbKliZFbq+O0MogmIcpH4V
         cIyHRHiI2mMMwj6ArcMfP8ZB4/HInjKBCxhRtmIfAVWwF6vEHv56n44DrwQ+dMjyDF0z
         nbE30lJAnJQUd4DqGOm80JD3kIr5PoQ8+wYA85VeOVdKUPVmtVHRlwCkZ2RtdhmW986x
         gH3kCs0HZQWKjeOIftMEwoZo1YVxhCX+sHiEYbatZFFwb34XfkSU/QCQR4qUnPoFRTJu
         jV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731304; x=1752336104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUsxmHI16pe+iZ8+pv+ck2V4zWW0Na+WzCoL+5yxEKQ=;
        b=BacCBf641ArqnlTzWbeExDl8jXBgj9Dq1l4r0Jc0bOc5glfxsVSz/jFlCeMnPPVgIC
         +wUH0WnFEXih8xUxZtqQvDSabch2JvZind8O3gW6pwYpcRaWBRX+qCY9vgP7ucucUKmz
         DJIr7MKnIno1/NgXa+3zG1uRYh0bQQkZkcgi2lxBiuPbTZrkM3f0XP/W0rQlhgpodyt/
         uvc77NbLFf2H43r9mskQEIMcTFolGXJnzzrO1QepRSyWKb2KFT90/3y5+ZUGxFD658F/
         9NqKBfRFWJNdLQM8NYm2RgMlcbetooR6Kem9kCYeGqbC746BcpWT7PDev7v8M5AmUy+R
         EAzg==
X-Forwarded-Encrypted: i=1; AJvYcCUFPT2OtRoyFZUlUbPgaxVPby3YxsGHN4FspS7VX/HGb2Pm1nd4Ub3qpkdI7uyBh/zFvja72V1IilX7U5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/X3vf2Ni1aNx2ZEi/uvT74cRDVHDHOaMiS+FH2v8O83ycQ1b5
	dzISZT0u9Zx7nDXx3634GWEKTentMEticzsJuTSwTkoLy3YguFOqcpq/Lr3R8LS5vEU=
X-Gm-Gg: ASbGncuF72jtFRzDBniK6hVqrkz4RX4V1wAjMgn+5PCza8Er79pMIsn4TXp6+lMxRf2
	b+di/SBOx7eonlAsvOZjlbVPxpl1E2tYDI6jUuw0aDWuItyY5bS0/qC63PPqrgKdFCZjgi1514y
	+cImulN2SCHEXrwZYPoScpJVeTdLbfsuDj7Uk0K0EOvGzDsQ/+wDXSecmlPA3jwsvtvNwyYr3Rh
	jM86N+pitbP8VURp7+7q6k/ipvgJL6wdYjK6R09kjgpwWQQnqDDNudh9CPxAaqHTOBmaTWUlYuj
	DSBRLLeGgwX3qFqqo4FNptU+m653OT4MW9BGzxW+TYgcgByubQBOqGloqAZSK+lyDVP5ZuAW00L
	vTqJXJv5aR2Hz
X-Google-Smtp-Source: AGHT+IGzerrCTXQuEdTY6Z3UMBommonlkj7ahpYePAZGtvXJ/CHr5sdZDaeVN00disSSpbO2UXOJ3Q==
X-Received: by 2002:a05:600c:1c1f:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-454bb85e7c5mr26723275e9.16.1751731303752;
        Sat, 05 Jul 2025 09:01:43 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:42 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/20] clocksource/drivers/vf-pit: Allocate the struct timer at init time
Date: Sat,  5 Jul 2025 18:01:13 +0200
Message-ID: <20250705160129.3688026-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having a static global structure for a timer, let's
allocate it dynamically so we can create multiple instances in the
future to support multiple timers. At the same time, add the
rollbacking code in case of error.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 48 +++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 3c1ac05626de..e1f1e66a2664 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -37,8 +37,6 @@ struct pit_timer {
 	struct clocksource cs;
 };
 
-static struct pit_timer pit_timer;
-
 static void __iomem *clksrc_base;
 
 static inline struct pit_timer *ced_to_pit(struct clock_event_device *ced)
@@ -189,38 +187,66 @@ static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
 
 static int __init pit_timer_init(struct device_node *np)
 {
+	struct pit_timer *pit;
 	struct clk *pit_clk;
 	void __iomem *timer_base;
 	unsigned long clk_rate;
 	int irq, ret;
 
+	pit = kzalloc(sizeof(*pit), GFP_KERNEL);
+	if (!pit)
+		return -ENOMEM;
+
+	ret = -ENXIO;
 	timer_base = of_iomap(np, 0);
 	if (!timer_base) {
 		pr_err("Failed to iomap\n");
-		return -ENXIO;
+		goto out_kfree;
 	}
 
+	ret = -EINVAL;
 	irq = irq_of_parse_and_map(np, 0);
-	if (irq <= 0)
-		return -EINVAL;
+	if (irq <= 0) {
+		pr_err("Failed to irq_of_parse_and_map\n");
+		goto out_iounmap;
+	}
 
 	pit_clk = of_clk_get(np, 0);
-	if (IS_ERR(pit_clk))
-		return PTR_ERR(pit_clk);
+	if (IS_ERR(pit_clk)) {
+		ret = PTR_ERR(pit_clk);
+		goto out_iounmap;
+	}
 
 	ret = clk_prepare_enable(pit_clk);
 	if (ret)
-		return ret;
+		goto out_clk_put;
 
 	clk_rate = clk_get_rate(pit_clk);
 
 	/* enable the pit module */
 	writel(~PITMCR_MDIS, timer_base + PITMCR);
 
-	ret = pit_clocksource_init(&pit_timer, timer_base, clk_rate);
+	ret = pit_clocksource_init(pit, timer_base, clk_rate);
 	if (ret)
-		return ret;
+		goto out_disable_unprepare;
+
+	ret = pit_clockevent_init(pit, timer_base, clk_rate, irq, 0);
+	if (ret)
+		goto out_pit_clocksource_unregister;
+
+	return 0;
 
-	return pit_clockevent_init(&pit_timer, timer_base, clk_rate, irq, 0);
+out_pit_clocksource_unregister:
+	clocksource_unregister(&pit->cs);
+out_disable_unprepare:
+	clk_disable_unprepare(pit_clk);
+out_clk_put:
+	clk_put(pit_clk);
+out_iounmap:
+	iounmap(timer_base);
+out_kfree:
+	kfree(pit);
+
+	return ret;
 }
 TIMER_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init);
-- 
2.43.0

