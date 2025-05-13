Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689732472AC
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131487; cv=none; b=lethLmvmWfkKmwYlWoihDIAlxMFN/wrNiCiH5koVTRK4HseDHh2bN0V/kTqxTo8rDZUvqh36v2+CSvyI5DBftFYPxc1OSPUxHgsfyVonKsoN8b3C/dqegqqx7EuhcISEiRjhEwZA0xR2tV9A7hpblxAlJH2YZJyQIrO9gFlaiQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131487; c=relaxed/simple;
	bh=+2q8Agc8OAUp6ljVH2smijkPt4WizUEwcy8s1vXQJ20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCY8bmc7OJwqY0AvhB2H++3RLoGkAqvFH96ioEO8vfwOfZio8Ttl2ulwhd6TCW7V61EMWYXTtFywM3uMcwJjK7YiokwuPsImydU7xIPkHKoLfaczWh/HpvHjTA1hXD6EjanGFjvcgXusDZSJJvX5I/mkUhKeqw1lts+cvvkgv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hvngAvHZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hvngAvHZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso2731825e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131483; x=1747736283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpW/hDUMz7zX4tvSsgRzaXUuXymLo1IwYeqOqY+OOaY=;
        b=hvngAvHZN5WQlPgbX0ezxnYSOavz4yIEBzt1lkt50yRPJrn8zaehjS2rfSpk1zTQ+h
         utK3maQQ0ncICCxbLHdJmRCt7pTmSNrhhRON2SuU+quDzIaZbI73OaPIJDkCGt8uV94p
         dnqDCoI4Rcc+i6tt3V3zWQaDDy5QbFoJPuf5vMzqC8Y5RvP/rsX84N0rY4sxJfdVBsRA
         bIQJffHZXK6XsIfZ7DBK0LPTrkQ6aK2MfrZOYrwgrvPyXOt5QrfuOpLJcpcC2vc1hfaC
         Z3AgqTWA6OxS+bbWFvblpehyZS31ywEzbrCG9orju/aHFyIZSfyCyOdG2lIcr2jIYAja
         KD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131483; x=1747736283;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpW/hDUMz7zX4tvSsgRzaXUuXymLo1IwYeqOqY+OOaY=;
        b=PXp/zoCmbz2RH29e2GIRnRTDqFDZuK/c9zkycK8L44/QDADqbOwTsG61VUcGe4s4Md
         PJlVK2QRPmskoLmI26xXtd8V9RuAg+A93P23FI+WBk5xIqCGtxFCF0cmra4AUkTHXENt
         sQRYzqZFigNtNRZNLNEt5hFPr0olOP1XxtHfrlphTBI4kTLz7TwPt6sAeUHXeHUtclAo
         r/p0aYPZVOY1uEBK1IrKIhv4T6xePwViPMy8NJCZazCG/0fETF/Wt7WjBTa3begfjiSF
         ulJ7+j63VoOyKtCNX/Vsle+DQ40QqELDnt13dEoOxMCgPrl8h3qfLNmfZ+5zX4GES2bT
         izZg==
X-Forwarded-Encrypted: i=1; AJvYcCWL8wUwhITrslyMEZGWI1mFTWXw7GL/55UFmVMq12mjTP+Fpz++rSae9kULAnqKAcYboH5aCxjzj9r4ZRI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5y9sv06Pnu9vSOWAUt86h72hKvwxejA+3RwjMLHzi3Tn5G6xE
	G9dMr1Us5cXGVk1aTJPKAFZhfy5k3OBX5WY4n3hwJXBuOyyiGltOP8iQMBV6qhE=
X-Gm-Gg: ASbGncsY8gKjr0vmrCeb2053lyId3E0ddz4w6EoxFYWJ4syFG5e/VV9ZcH/6w/bgDdv
	+EQPLjh4qJwPp/6MAsQ5BZOcMTEXnoO4lmy+JXdqWc6zgopMQ6JZXnO2QX/Mf31ANyCfnjBcy/I
	Un+UpBFHl/fODQgEU34r4hwqzGRf1QpcIhDjEQeoZ+/dgk0xWhjXrYd8STXQlDr/l7xm30/8rmh
	+X/boLLlpIzvr4F0E+kNbdqorgJp5dI+7xYkdkyC+Qzs396Sm5kfD/SwUQkwP9PY2pShL1n+Fh5
	rt5HFiwp9nA0QBrYZrgfElx9jp47lxCVt/FrCMbhnwkH1PBx/WTSv7H4sZ28uFv0XPSXGsLi0ZQ
	74XNpJDLVPRh5ySdCgjtD9yBrun+8I8XO9Aiimnw=
X-Google-Smtp-Source: AGHT+IExUE1z2q+MGTB1BjX3tNGd6iZlgfApNxaHiNcVQa6gR897h0allbxYsieVlwmVMw+6ixRyLQ==
X-Received: by 2002:a5d:59a8:0:b0:3a0:9dd1:bb59 with SMTP id ffacd0b85a97d-3a1f64a1f8dmr4843504f8f.15.1747131482665;
        Tue, 13 May 2025 03:18:02 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d37fsm15914997f8f.68.2025.05.13.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:18:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 5/5] arm64: defconfig: enable ACPM protocol and Exynos mailbox
Date: Tue, 13 May 2025 12:17:54 +0200
Message-ID: <20250513101754.23158-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FwRadgPxJRm5xEAehJ8JywumbY0idjddVQyEPezOekk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxxSNRzisqVNsQAPPyyKC0GMYtidRZ+mahC2q
 7a1kCi49W+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMcUgAKCRDBN2bmhouD
 1w3qD/9sV5S/8zWHdb9HmJxyJzng+j2RQ2MTrzMvGp10HAMWKOtVz9EDQHAJMQMdafDO+uf0Rcn
 +BEeZ1ux9bk0u+rnA6dUyLWCOj24BWQE1C7RdSLNJkxclO+6Hw9SGS+RXnfOTFibwP9+dVgAyXE
 VVyYEWajD26bKBNBuE3UZjRnT/6J4z6V/tOZtQHJ+13yYFIrHSjLL0btX7NYRXxET4WD4LsgWHe
 374UyWm0OSfJSjFUbcaHZmBAnG2pRtYvt1nCQkkKFsNRnIGEwWWu7PuyUjIXpRX1f0kOwHdy2ve
 wdxqllBxYV+WuXXVdwXxE/bqEmhzRpkYpywjtbdle1n74T2y/xXSbTDrvJUSCcHC9GUl9RRZh4f
 IewbY7pR7uJz1FACllnaVt530k0XgjglyNAddTkdg/dyfCw89dXLU98eFZS1TmJAWv9BJDdkfh2
 rGF1BubmwZZlS0Fsk8W6axywjM6j8Lbnyz5R3kZlUDA/vxOC+oFkuEGljRkELxTDOh2NgoF8grQ
 YCatdNfWkqRROfgpNl4Qd3o4tD7SzQ8rRmy3/l0Ooyl1NtsYotU5osF9iYZd3CFpH1I/nfPz239
 qFYG/WtuE2OOjlNc2Mlk+acCDrCiGU7c6f2OmCM6NXc5N8LZzm03jpLphu5Wn3UQjk7XgqU2ncP zt+WBUBpI6quNpQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Link: https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..5c85e5da152f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -265,6 +265,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1416,6 +1417,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y
-- 
2.45.2

