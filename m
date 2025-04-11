Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C284964E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377288; cv=none; b=MHhum1Tah0CtDZ3jravyoKs85ifaBPT76iNtgCVqJfzNoEMXNCO1Key447rVPJT18hGtZ+GZZkNoLzTQI7sOMrtfoIVl/DI+mH0puKFQ5nvlJRjgHkEBEGC1oMttWVSM/uX2qFAGb9HbMywcp0KuDwMOgn1phd9aNxG1vyoXA7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377288; c=relaxed/simple;
	bh=Ch+fqjo2jOucp0Q9pAQyUt/W5onTs4h2zU2vjVST0DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+Yb6PTXPi3u6H6PiLQ8P81wPeh/CfJ2K0eSzBcz187ZlMIJLoFeGoiC6Wbh4kxk1ONkg84M19DoXmZueuo4kvGDAUaZbQRPu/VGRV5mF0/6CpggX7HzknJgpWCHZji/4257p7bPEAkmKmzDUTE8UA1myXSA/IMwKfQ/bctRltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YISnwPCH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YISnwPCH"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2243803b776so27886905ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377285; x=1744982085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qre57TZAkUnswgts6IEzV2m9ITum31ZFo8SGzVvPyaw=;
        b=YISnwPCHC8kQ/fAup7XrwmZdjgBTADXQdZLFTT2H/5OOanZ6o150UNLBzZpTuPUXwm
         9ifEncMow4a1BRQ+Ei6RIeb6Fd+Q0zay6935qCwSvE6VSLKpcP7J9y3wIb9LqEt7aMDd
         MPkPznR61ZINfBASUK1RYlwTOyKpA7K71fiFOaMB6O+Iqwk/a81DiScaLvlrT8KI00+3
         /qSfPIE4LqpvYeAjndh8JRBBr2dMDGVXm9WSBsuD4N6NmeHkk4IbeJOU4O5eAzaYe+vN
         1mNgsqDdUu8FE1Ti9QvOiHMnfbbcg7poQIlituVF5YAbhvnIg9tAVjhKz3Qb9zk+PxKE
         3ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377285; x=1744982085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qre57TZAkUnswgts6IEzV2m9ITum31ZFo8SGzVvPyaw=;
        b=a5FCacKHt0dzKhR3tf6Lr1WlTFVFA/+Vk4xYkEMuW7rVgRG56HcxZn3vNToVbApQ7h
         cwFV4YpWhfoIF9P5IofhXYF9SQt3ReTGxDOBNc6ItDfQ9WU+tIdMVwJvZ5WBEmeqQAKH
         oSC/OAUbCKeo2WE61qXjEexmo1u0YuWDLB4w71UGv1fO33qt0ByIJ1j4y8+RmYgwABA3
         VNq8YAvz4VBeEUY+i/xs9iBcbpZjCFCbxD02XR2VKbYum2NHvWjm2VVALFzBKPqv3Vwz
         xYT8fjku/iEWyFU9FYOlefO1YkuG0Voa9hZBXM/AwcCeDBNIZMhAYLgWTMG8lZJVx/Am
         fCSg==
X-Forwarded-Encrypted: i=1; AJvYcCXp6IlA09wUWmb93pcZTUGxPij8H4FwNj9bVvHE6vqbjSw2jM7K4394820AcpwNrPK2BmZGSC5b7fhhXFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnV4VbLT2rnVgC9qcoZWO4Pa9EAPg6mW/NUQh3N34kTW8NaNa+
	1MBBBbx6CHqpBYQYas8m32yK/8+0sT80RNMzvyxl8YvnZDEsXLBZN6iOZUCwbss=
X-Gm-Gg: ASbGncv6zSGEsfS+kC7R+SFFN4VQ2P5CyH78kevbyUOS8/3vl1Tjo5ng+u4oODGxskg
	zvUX0R7rcqckviNJpwCmLsOL3BBVCPyQLgOG5T+5hzEP3pY5+G9pmLf0Xb08r8TZFliwkwJp2yZ
	xmxqM//8GQhdQvAeRQaF7GTqXg+BKneuGYSAozJCQuli5bzL1Tjwo/l6jmv61K7AU9Mn0Jc1rzd
	x2v6gzvMcWyZkN0iY1jcNL+ha8pomGCQAtksgPnSBmer0iJP7vpvCSfZ0vTwI9CUhuVryRWjMpy
	CckiVUvxpX9+5/FcIsrojr8RJ4t11LU=
X-Google-Smtp-Source: AGHT+IGUnh0jzuOwIhS7mW3GbrnlxFqJLF/GhatlTQ8Fz+bqzUxj4AuJt7AlIxLYz74Fdql/j1nWVg==
X-Received: by 2002:a17:903:2a8e:b0:215:9642:4d7a with SMTP id d9443c01a7336-22bea3dd45bmr41851535ad.0.1744377285123;
        Fri, 11 Apr 2025 06:14:45 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:14:44 -0700 (PDT)
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
Subject: [PATCH 0/9] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Fri, 11 Apr 2025 21:14:14 +0800
Message-ID: <20250411131423.3802611-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset updates the PWM_PXA driver and related device tree
bindings to support the SpacemiT K1 SoC. The changes include
modifications to driver support, configuration options, and device tree
bindings, enabling PWM functionality on the SpacemiT K1 platform.

It has been verified on the Banana Pi BPI-F3 board using PWM14, which is
specified as a pwm-backlight. The related device tree nodes are set to
"disabled" in patch 7, as a reference for future use when the display
driver is upstreamed and can be enabled all-together.

It is built upon:
1) the clock controller driver that Haylen Chu
currently has sent out for review at v6:
  https://lore.kernel.org/lkml/20250401172434.6774-1-heylenay@4d2.org/
2) the reset controller driver that Alex Elder
currently has sent for review at v3:
https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

It consists of the following patches:
Patch 1: Add optional resets property to PXA PWM bindings.
Patch 2: Add reset control support in the PXA PWM driver.
Patch 3: Add spacemit,k1-pwm compatible string to DT bindings.
Patch 4: Extend PXA PWM driver to support SpacemiT K1.
Patch 5: Add 20 PWM nodes for K1 in the device tree.
Patch 6: Add pinctrl settings for PWM0 to PWM19.
Patch 7: Add PWM14 backlight support for BPI-F3 board.
Patch 8: Add ARCH_SPACEMIT dependency to PWM_PXA Kconfig.
Patch 9: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.

                     - Guodong Xu

Guodong Xu (9):
  dt-bindings: pwm: marvell,pxa: add optional property resets
  pwm: pxa: add optional reset control
  dt-bindings: pwm: marvell,pxa: add support to spacemit K1
  pwm: pxa: add support for spacemit K1
  riscv: dts: spacemit: add PWM support for K1 SoC
  riscv: dts: spacemit: Add pinctrl configurations for PWM0-PWM19
  riscv: dts: spacemit: Add PWM14 backlight support for BPI-F3
  pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
  riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

 .../bindings/pwm/marvell,pxa-pwm.yaml         |   4 +
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  32 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 315 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++
 arch/riscv/configs/defconfig                  |   2 +
 drivers/pwm/Kconfig                           |   2 +-
 drivers/pwm/pwm-pxa.c                         |  16 +-
 7 files changed, 546 insertions(+), 5 deletions(-)

-- 
2.43.0

