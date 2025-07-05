Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4821CC62
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731313; cv=none; b=EqW6CnApNPR3bAcygoVvpZJnM6sDFpZKaF2rPdCF0xnU0uhhgiU32C5MXA0j+InorpTNBeuzc2+fRqtnmvGc+FYyYrzl2vCGU2TbWkBbvww7Jf9UYcZwZ1sYmDbV5sPYIVIZn9KpkmnV5TVptXrPYM+MeJPfwkzQ9pYlW4cCvI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731313; c=relaxed/simple;
	bh=YTCvM6xT4swTppL0LF810dVRwQDUkf1CXpVmR/TeTqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjFqwG/9iKzvETWm3kVlW2Fly4fRKfcJecyw4AhMS/sIn2L+GOrZIiZEPZaayFoT13XU4T35ZTo8n5Cc9hrXUmr8mcFb6Hb4cfu+bAzfdh1QmecPxJ5wSD2Qn+q4E8klb1qsufOYAS/qTi+oDNmOvqXvhC2QJeaodLJRBeqpdJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/dNdUk7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/dNdUk7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ce671a08so9150615e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731310; x=1752336110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtO45+gxKc100ULFTXAZJv1qOyrhGptNrJ2i3YUCpgM=;
        b=j/dNdUk7LUacSOnSkDhpueO53FlHkTsEUIRPFtTzhUtwimLggMJdv68W4sZ7bW6I5R
         8ENNhezBnIPg0Ij/S1YAJK6LVCYRN3xEDZG6zUVbGjwZkekyQxhUSRRp8aeWvkF5V9+V
         wIrBzRKjIht9KqlY6JCvSbF2J/a+twd7kb3Svp6iQvrfkTdaswlGquwcZ/sNN66jFqAe
         x+1w6V0uUE/hCp0HZGoiK48Ese0rWgpmT4Kz/7RpeCbfIvQTWIUOcOvOXc1rbyk2F13T
         VXQtXNZ6jSK7YqAJBfJkzpoEUAhUChs1r7ZeUr9dCdQFCM7zd+AkIwlQYyduGILCrsHM
         VuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731310; x=1752336110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtO45+gxKc100ULFTXAZJv1qOyrhGptNrJ2i3YUCpgM=;
        b=tAGbpBe0aWJI3dXTdIoA0War1XhZxH/9pX37+LAUGUqd1MD46CYhT7JE9SrQ48xS6j
         ul/8tWlEET5DiBb5LlRx81NcPBk9pTptaP/jtm3nI60rQ72GmoPIN3zxqMdXwWu20qBZ
         jR4JOP8de8FzMYR89a61b0WiDKEGzlmNBEW11/y+zUlqTYpMyCWKLFIILVB9YFyv2Q5A
         P/1SDL81TSwNw2I2MJCBsLrBvLSJ7wHO2qKWp3dPRkrcqQf0JSbRNpC/qnhFFeaqdMpH
         M84c0xkZUPF/ZrhA1ewgCz+0RKocJifAC+icJxD5Ue5uRU4ON2/5VKuBeXTLPOtxpPQz
         bvvg==
X-Forwarded-Encrypted: i=1; AJvYcCVSvb1VkSYopeJPtRnuWEgkS79ApilguQOybMZZk+KWuOr2KXuXRUWITVT0YaZxCxTJlQamnF4VNmZ4w+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6XVG0tYtIyhAyPs8sVBhr24Qxyae628Y6+nuStY9kB4plF2L5
	qBGWIq5V4fyhjUy05l8qCiaJmcfkTnj3wANJ5jUEw2oIganamiZ02vgdBWJz8N29HyFIKEtn9kj
	voAOH
X-Gm-Gg: ASbGncsQuIEDmpwcHD1nRJJWYG76unSnQd8jNPprJaC9BxddQZ7yLyp9GsEOvanfeb/
	CA7zpy0Lrn21S9HoiDI+uiqs1CC5Ueaxh6263/HunptEqnjDgbTrXKm9IflwhKLuJDfZLoF2OTa
	EFctl7MSWkAqWvmJ9nUub3dklEnsFF8Qi4ovbfL6StD/oqhLVS3994kCk+VwZMIfZCZmaStL0Ts
	K/BbZ/FlzmqayKEKJoA1z/dlzBvwx4Y9R7Ffaem5MppybPwyvLHd7hY+00oMZWGWpakx6uTmal1
	vmlChcOAubSLFNY56xWF7e0HpKcbT6y7ebXPCN8pOmI4fLB7GRbImXfHhwi0Db4tQpMBVL+edNe
	7+hkhiOSU7NuNDBl+DotbdiY=
X-Google-Smtp-Source: AGHT+IGNNIzpabo9CNNg236XjV7oRz6Zz/uGEiAZU3lxdu2aM2o9jsXW0ci8uDwR5HLC/YeNBSzung==
X-Received: by 2002:a05:600c:8b08:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-454b4e747e7mr67072455e9.10.1751731309932;
        Sat, 05 Jul 2025 09:01:49 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:49 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/20] clocksource/drivers/vf-pit: Enable and disable module on error
Date: Sat,  5 Jul 2025 18:01:20 +0200
Message-ID: <20250705160129.3688026-14-daniel.lezcano@linaro.org>
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

Encapsulate the calls to writel to enable and disable the PIT module
and make use of them. Add the missing module disablement in case of
error.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 2799cff2a296..043e36b2165d 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -13,10 +13,12 @@
 /*
  * Each pit takes 0x10 Bytes register space
  */
-#define PITMCR		0x00
 #define PIT0_OFFSET	0x100
 #define PIT_CH(n)       (PIT0_OFFSET + 0x10 * (n))
 
+#define PITMCR(__base)	(__base)
+
+#define PITMCR_FRZ	BIT(0)
 #define PITMCR_MDIS	BIT(1)
 
 #define PITLDVAL(__base)	(__base)
@@ -52,6 +54,16 @@ static inline struct pit_timer *cs_to_pit(struct clocksource *cs)
 	return container_of(cs, struct pit_timer, cs);
 }
 
+static inline void pit_module_enable(void __iomem *base)
+{
+	writel(0, PITMCR(base));
+}
+
+static inline void pit_module_disable(void __iomem *base)
+{
+	writel(PITMCR_MDIS, PITMCR(base));
+}
+
 static inline void pit_timer_enable(struct pit_timer *pit)
 {
 	writel(PITTCTRL_TEN | PITTCTRL_TIE, PITTCTRL(pit->clkevt_base));
@@ -253,11 +265,11 @@ static int __init pit_timer_init(struct device_node *np)
 	clk_rate = clk_get_rate(pit_clk);
 
 	/* enable the pit module */
-	writel(~PITMCR_MDIS, timer_base + PITMCR);
+	pit_module_enable(timer_base);
 
 	ret = pit_clocksource_init(pit, name, timer_base, clk_rate);
 	if (ret)
-		goto out_disable_unprepare;
+		goto out_pit_module_disable;
 
 	ret = pit_clockevent_init(pit, name, timer_base, clk_rate, irq, 0);
 	if (ret)
@@ -267,7 +279,8 @@ static int __init pit_timer_init(struct device_node *np)
 
 out_pit_clocksource_unregister:
 	clocksource_unregister(&pit->cs);
-out_disable_unprepare:
+out_pit_module_disable:
+	pit_module_disable(timer_base);
 	clk_disable_unprepare(pit_clk);
 out_clk_put:
 	clk_put(pit_clk);
-- 
2.43.0

