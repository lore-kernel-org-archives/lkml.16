Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DBD1ACED1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132665; cv=none; b=MfKvguTzBSXqpZV7mlJXj6gqdDR7OMEsbdJB9/cpj5XLshon6M+0aXm1s4apU/SGvYZD4qWvuchJFgHpY8la/yGGzzTAcFa8EIA+Yarapq3WQjmXyS5KREQ0xHWlFAWZyRULBxCbKF5gxp6Dxgq4FcVbztbRIe5mpSiKh+ejnAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132665; c=relaxed/simple;
	bh=hn7YA7XmCyOpYGIUjgJ8uMsi3N8R4QuPxrjMUjRQFKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zj4SBGPlzp1JmCL3GmyuqM6vkzF/NfYCiBSN6ADCZ/ONRUBAqJnxvjw4QbGL0rmt+ulb6Ir/iBpEjKdnDWTgfhzgZSkZd/RhAUarVsRQr0IgKsuOVjLKXgkc8w9a+Z+GWNlknD81qWYadj06LFFcjYtudWIDCGzOVEuIBrjrPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dyHewTCW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dyHewTCW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so3649158b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 00:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132662; x=1745737462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLrawCtHSQaSge3rP8I64g0W6VpqwKb/nSX+gldLJv4=;
        b=dyHewTCWmKHwB7zJbrX5zZixFiGLQQ62XkcZu4tRDEqToH2t0vB41BDO/00Zjc7nnz
         BTQhneIeIdJKQy2jzSDYAN3iDpQ2UzsuFT/35hKmhnOj/+RhmK7U3OtyRV7BC0YZMKZn
         MClaDOvjj4UvYl/NOXb90n6vTZZBvNK1OAR6QAg0GdxhdqutwMFk9fSg/5wNm37dfP11
         ua3R3X7UhqfISrM4v4fFU+Q4+GVH1B9m0yEnnIhxLGMN9ZW9zf2R/wh9g+vcm5Blt7SI
         Gtf+8T8Icnv1HHNbaq+mr14jZSAL//Y81C2IktBYpeQtRRDsVypwJPQVQzt0aDeMbHPn
         q9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132662; x=1745737462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLrawCtHSQaSge3rP8I64g0W6VpqwKb/nSX+gldLJv4=;
        b=FstE6zLTVWpySt9gjDsPgZQKyTRLn36rxG/HBqly7ko3ajT+ABnbP9xJjeFrlkJBmm
         symVTOPJye5bxZ5KCYTMd3/cbGTmqA1gxmh9RmnQqFez1r/RTVj1sjG988q+WOtqVo5u
         dvaBgiD+RGPTV7/foohkHm6e98zt+f6nybOEkgN78wu73pPcd57jjMMKRVeaCviOIuFI
         5BEgmRJ6FDQnFdYY2BufMM/MInFjU9GPHYDr3+ojuQFlpTnxvotPkHim2+q6HcmYcn8o
         gvw56o5C3uZXG6DWMRQENR1sWCSMSd7Hrw8hmaY6G798O5wPGzTtleERe48nQhjSFU2H
         zUOA==
X-Forwarded-Encrypted: i=1; AJvYcCVCIeaMn9afvXWMaBkNtQZFbAuBVVnvasf/zgv+Y7QwTHd5lrnraAEwLinR0WzIYm8s36qZVR1N3LQ/Foo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8V6/odaFhP98yCpFu3VadQu3x/AiYJu3Mw9kqyHRVzlrd2NNU
	Oztdg4lgxR2UsSEMhxFiy/1v4hH5ND4PIogk78DYvd3Z9QiekUCYJix/3v+Ae9M=
X-Gm-Gg: ASbGncuqXoD7ZuHVWPVZsD7V3IH8g+P3nH4837gNAHb+2ifpa+B/WgXqepzQN2Umcb3
	M6txE2fahXWPzv/2+GYggalSg57/UaX+ECfKmWOAKrhmPjXhSNY/62RoUxZ3fJUJ9uS67M+1kqZ
	/ZuatDLVqZ0IaTSrmoBCuo6hM93aFWO5F0RJYJTA9FSZX9okX5AF0twJaAdhtcYNCClSqlWJqvW
	FbMbkWkibc28vQfqJh8BzZ/ryWk9iO08UDANWwnkSPk9Wijm/31s9PvEZ+dCpPVgsEdMzS0RSEK
	hBB3lWPq3SpGzhuMbroP8I9+azIOJA==
X-Google-Smtp-Source: AGHT+IGsw49Y1EZHbpB/CU2efSGqgI49mepGyjPNnwH7IpvujjQyW84NHrrsk0hDbuCp/nEw8aQw0Q==
X-Received: by 2002:a05:6a20:d705:b0:1f3:1ba1:266a with SMTP id adf61e73a8af0-203cc4ae6ddmr10558452637.0.1745132662405;
        Sun, 20 Apr 2025 00:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:04:21 -0700 (PDT)
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
Subject: [PATCH v2 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Sun, 20 Apr 2025 15:02:45 +0800
Message-ID: <20250420070251.378950-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA driver
and updates related device tree bindings. The changes enable PWM
functionality on the K1 platform through driver enhancements,
configuration updates, and device tree additions.

Functionality has been verified on the Banana Pi BPI-F3 board using PWM14,
configured as a pwm-backlight. Per community feedback, the actual
pwm-backlight node is not included in this patchset but can be found in
patch 7 of the v1 series.

This patchset is based on the following dependencies:
1. Clock controller driver, posted by Heylen Chu (v8), with
   most of it has been accepted:
https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
2. Reset controller driver, posted by Alex Elder (v5):
https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com/

Major differences between v2 and v1:
 - Dropped the addition of spacemit,k1-pwm as a compatible string in the
   PWM_PXA driver; instead, it now falls back to marvell,pxa910-pwm.
 - Removed pinctrl settings for all PWM nodes (pwm0-pwm14); only the
   pwm14_1 configuration is included in this version.
 - Changed PWM_PXA from built-in to a loadable module (=m) in the
   riscv defconfig.

V2 consists of the following patches:
Patch 1: Add spacemit,k1-pwm compatible string (with fallback to
           marvell,pxa910-pwm) and support optional resets property.
Patch 2: Add reset controller support to the PWM_PXA driver.
Patch 3: Add device tree nodes for all 20 PWM instances on K1.
Patch 4: Add pinctrl settings for PWM14.
Patch 5: Add ARCH_SPACEMIT dependency to the PWM_PXA Kconfig entry.
Patch 6: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.

Best regards,
Guodong Xu

v1:
https://lore.kernel.org/all/20250411131423.3802611-1-guodong@riscstar.com/

Guodong Xu (6):
  dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
  pwm: pxa: add optional reset control
  riscv: dts: spacemit: add PWM support for K1 SoC
  riscv: dts: spacemit: add pwm14_1 pinctrl setting
  pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
  riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

 .../bindings/pwm/marvell,pxa-pwm.yaml         |  17 +-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   2 +
 drivers/pwm/Kconfig                           |   2 +-
 drivers/pwm/pwm-pxa.c                         |  14 +-
 6 files changed, 212 insertions(+), 10 deletions(-)

-- 
2.43.0

