Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388635947
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132704; cv=none; b=KIP7EilyEIYwUJwGrftb62Dj/1TDCAmkgyEXi7I+XT49PLPA+n36/5fxzihh0levKX3+876+HNgCkAC+1vnF+1lU/IUIvx9zJFR3q5aNThBdT2bUNC3ihzdqOgKySLbKK3x8nvegQaUMKkdCjEZdaCMUDcllSnNZ3CNYdg6g1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132704; c=relaxed/simple;
	bh=W91bQpfXNZR8c2bsacU3SIoLVlODdZYgId2qdCM6s58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gii69TGHKcEezzHM26do3bWTUw9RYEyUsL8YYfEMJCZnfH0ATxHk5xdFyzBsymG8k3VTuBAzCcUeP56v3ThgKW6HueRajs+6usYUHEApmkm24lu+NUeQrUeGCyJrf/v6SC4XVTogkAZVxPNkQHZT9kQ0A2r2dRywxaz7g+O+SUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mH+FpoEL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mH+FpoEL"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so3649336b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 00:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132702; x=1745737502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmeaXxUVGYcoGAVjJ4OOwtWzTNoCxB6YzSoPVdDhvp8=;
        b=mH+FpoELJIu9mo55Lw8AXvWImJESyA0aA1M4d8jk1TYvQQxFb5lDX+jMFY2ExjypCO
         v4oz+PDGODI2izlYf1uw/aewByT6lUDxbdgDAd374HxQ0r6Vie7HIlwfIaMlxA+tea6g
         XEHZQo8njB/KGnIBFB7zCCm41h8PsHxcFGtSUZ7WHVziNzdXDYZqxxDTmThd0z7Ksd+M
         9YLWQJ5BpycuPsmDdinX4cMji2emL67m0eVvUySZdKFt7sm9mBJjdZ1fu7EZAijAp8z9
         NoEYsetGU1avbORIal3vPRMk4xyk5zVOcnVyJZUdoxtLpV7nsQfJawmgDCMvoyveoCq5
         /hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132702; x=1745737502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmeaXxUVGYcoGAVjJ4OOwtWzTNoCxB6YzSoPVdDhvp8=;
        b=jTOkyyTHht4UTHgwjaXvYeoKtGB2X2m5mDthcud1eZ6HIc5GR2LCrUC0iZhgdIRPur
         e1XSi14WZNEeq2wuGRIdREfhXeiBIv38dGKpNvlJwBQI/Q45tBu1yM7kjXXfuRc5+sUi
         5Wyo/kJ5xIaOkGUthbENVIC4hG9gATH2l+M0ygEtnQAxb0rpw+07d+MZ+oRxQJYvNLPt
         ICfCO9yMtyHgmj1X+FvuKXnVnMNgy2JM+6KFkk+frixZNsT0sH8lja4wQrnHN48+F4rw
         4GbDiDGusslfsKsMsGV5jqK065qf4dIT4GMBfe3lnf3jgx0ZN4WD7bHq2mj6aAwsYadZ
         T6eA==
X-Forwarded-Encrypted: i=1; AJvYcCUBVJIfkLcgBiBk3lFdimXDSiiBcwdactrM+2y7Pp6BjkxPZ1geInAXfMmodjjb0bGpYagrIXLhdlEv7bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5lJXn1fl+ra20VHaIhSx/97pj4HIJxTa46Vi+NKiuOuIjU/ZX
	AOKUSOMCMwe9PhbQ24lfWZNQ0oBk2uvIAq0JXoexeEknXvfCMQJDp5pYN6uCreI=
X-Gm-Gg: ASbGncs9thVrsVygGuTh2XQry9dNhB3FrePrpLshpLS/SyIfsInwlMm6fge1Monh6h3
	CTQr5Z624m4+qwk9Q7FIEmXY7DeAfMCSpBgXqflxTOaer4M2wLKiuuxLkOENLZgSMOGYtQQa9ca
	6BCmqzrxNmUjmciXkcZIchcb/K7OgF/TuODvQUbGy0LgeU2CIiSxwnNDEOQO7xi+x8GB0Ufrkyh
	GWKKR3TPW3H2r/f3pq4rp1ACMzvekSZ1cCLg1at48IarE28xiMOah3p16UVkrdsyC682Z2AjtN+
	orDYpMEnG4GqEJJPQA6n1UH4jxQIxg==
X-Google-Smtp-Source: AGHT+IFx8mnkCm3C+pdkB4oHWAvoXoy60Ij5qZBakPGfhlMZ/vRsdrSNmQaXTxpzNl9oHvgKDHi1sg==
X-Received: by 2002:a05:6a21:920d:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-203cc5ce2bdmr11487230637.5.1745132701993;
        Sun, 20 Apr 2025 00:05:01 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:05:01 -0700 (PDT)
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
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 2/6] pwm: pxa: add optional reset control
Date: Sun, 20 Apr 2025 15:02:47 +0800
Message-ID: <20250420070251.378950-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
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
v2: No change

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

