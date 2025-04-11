Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63B15098F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377313; cv=none; b=LdF6yInKphtNBhLeWaKWE34+FG0EE4Qy2tIiMyae033O7cwpWAjBFxuPLGU2MMkBW+5O/Z2vTJY402gS4hiROhyoMn4H3qI5k+BfHY2XYlaY2iUsq9tQ9e4JxA2UMVeq3wlmLhGdMA7yk2Mk/xPPQwXaruWyV1O2oSt4obAsII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377313; c=relaxed/simple;
	bh=UlAsKNHUgln7eAumKMzvqbycdRrzhxEOvoeet7XkcNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwX5QMDXForCZdwqzyFfHeZQe7eUDv1BC7ZJqkb0+iragmzxJS2zqQefTZmlmREo/492dt2+1+pkQesV7d9ssPsRGU84McQ+L5zD2ON77rzvCXWH8T6N4U6C29pIHrh5dxIzT50vy1SFeBPWva7g0hwrWIBwc9335hc9xg2ECmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DXvP1l+R; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DXvP1l+R"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22928d629faso19696845ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377310; x=1744982110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWAPb5H6B8HVYPSKWIXFA9rVM/O356OndjYJjviUmrA=;
        b=DXvP1l+RztnBGu56rBULaljSaXdM/ENvEblXvAg0Yrd1RSkRTFK6gZYuT/dXIiNFk2
         VndpQVNw+QPnj5YDKNFJu0Z9G7RXroUnlxVci6TAdyDXmkSPNpR+T8PIm+CoLkqR4li6
         9PZyx7dfrsmQv5Q6ZZQGlhPbMWaj6kXQoSCMuAVp++OBJKz8fhcBioY3N5AR6dHovfpz
         yCkNMeN97okI8/TF3CstIR+Irrp9oBTyPXDUI3jcT1rb38Yv7COBq1FaM6qaPrjMQsks
         MZE78a09Qw9OB7wUY0PFMTwJq9kHz+pKOcmWp97txRT5ohOT20FFCqucrxCqbbqyd46y
         39Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377310; x=1744982110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWAPb5H6B8HVYPSKWIXFA9rVM/O356OndjYJjviUmrA=;
        b=YOetuQqcE7EDhk6pVywBEetZLHC9w8KgmWQ9lDPPpjfI6qI0O4ubhl55ZXcQCYpN7P
         F5pAiA3Ko0nLzFXhTD1nbP+it4URSt1FJ9DzAUO516xVR4cqNrXaekLLRMdJ/IgZEiOW
         eHOme2UN+6WPzcA9+mM0QObd0lcOsJyy1eUMs4G/s13i/11WuJTEELKKPES4O+CNkaeq
         ThFpHgjecI8NgV+xo63PiqEnytboPEe0KXqen56/aWD8RHoflB/39+0aL5l6oiVHxpOG
         5qQbHhAsbPXJsHBTUD2jH9KraHsiMm2Z3HRooCXdPFS+81o+EE6t+nNgXDSNtBlYVWic
         BfIw==
X-Forwarded-Encrypted: i=1; AJvYcCU8+dClIJPhuGPyikjWtObN7ew2uiefnGzMJ3xFYRyD5Y0qvI+VW50kGp6Bk70Rhe706GG+qi/vlhQeJYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztLnQwCPwSJ4lOYfhgqIh/Crw49aveZHZSw4Ui4LNrs34+sgVO
	Qh+qgkcIbhngYBhaA734j/ZzT2tGVmW4/5YqVQgzojNvgCTCkLp3t02Kqaf5C7c=
X-Gm-Gg: ASbGncuBAVngrZL++j46uMbZ5IrAjQUqxMkiOMJjUPTuO4QLcYv5qDA7P1Wr8NwD+RF
	0Zv4mDcHIXqyblhLZm16lq/j59nxJVlkQi2osmEmXxyhxP4flDcFAY8Am3bPazDlyKWwnSGdl4g
	gZN7YimuQE6olp3PVJYeT5agXKeA11ahar2TZCOVr+i7wFDt15tcj7FfZuHTEMxCRF837lKtJJc
	KwR0JTj1yZUomRl5q3C5wULb/3peo7fv22CARRrTcFdq3DKysvOVCJETeUaSX4tTxNl01lSMdck
	bOuzDSxiU/zAW7+yIYa355YeVDXqndI=
X-Google-Smtp-Source: AGHT+IHIndEecRT3AvZxYCriHYkwaE37vFsVhEAY5FozYiaAsXwZj9EbWpr4y1scyShWVdTuh6BCLg==
X-Received: by 2002:a17:902:dac3:b0:223:66a1:4503 with SMTP id d9443c01a7336-22bea4bce88mr32987205ad.30.1744377309837;
        Fri, 11 Apr 2025 06:15:09 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:15:09 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/9] pwm: pxa: add optional reset control
Date: Fri, 11 Apr 2025 21:14:16 +0800
Message-ID: <20250411131423.3802611-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support optional reset control for the PWM PXA driver.

During the probe, it acquires the reset controller using
devm_reset_control_get_optional_exclusive_deasserted() to get and deassert
the reset controller to enable the PWM channel.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/pwm/pwm-pxa.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 430bd6a709e9..dd9c6af0f672 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -25,6 +25,7 @@
 #include <linux/io.h>
 #include <linux/pwm.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 
 #include <asm/div64.h>
 
@@ -49,10 +50,10 @@ MODULE_DEVICE_TABLE(platform, pwm_id_table);
 #define PWMDCR_FD	(1 << 10)
 
 struct pxa_pwm_chip {
-	struct device	*dev;
-
-	struct clk	*clk;
-	void __iomem	*mmio_base;
+	struct device		*dev;
+	struct clk		*clk;
+	void __iomem		*mmio_base;
+	struct reset_control	*reset;
 };
 
 static inline struct pxa_pwm_chip *to_pxa_pwm_chip(struct pwm_chip *chip)
@@ -179,6 +180,11 @@ static int pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->clk))
 		return PTR_ERR(pc->clk);
 
+	pc->reset = devm_reset_control_get_optional_exclusive_deasserted(
+			&pdev->dev, NULL);
+	if (IS_ERR(pc->reset))
+		return PTR_ERR(pc->reset);
+
 	chip->ops = &pxa_pwm_ops;
 
 	if (IS_ENABLED(CONFIG_OF))
-- 
2.43.0

