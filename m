Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8600B1F2377
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636864; cv=none; b=eIsWbjjft4ALParFOSqOrlz9DCwN7izs2btXk+Hs99YTHCwKOFA0JiguUPMOF84J0Uz5ZKLsaCgwedIDtiJrbteEKWOFKEpUIsdCuH0oTWlW9vvyZbnL0O3NhOr6xUfn0EZd27sCLEtivMvMk+3h/h642js8i17YIXbM8K4a69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636864; c=relaxed/simple;
	bh=aZvczYfKaJF4cNqcRzosp+W7t0cH8E2U2PIdZ7jOXF0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sCqSSJ48bf7N8QEAwDKPncZCZjJY2OZ1a/vR7phG/5vavO1coyIUkihlmTL2ZpB2RLFee7Boiv7z9egwuO8csssU/JP0S6ybmVtBzKPBxZoY3dHhzDEgvcRB8GqPvzhF9glD3OpXWlMePZqxsuQHJiDKZf1Z1GT9IsUbfi5Mo+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G0fjEFrr; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G0fjEFrr"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso385755a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636862; x=1744241662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uhm3xVklIWTKuMJm0mSzjGk571zlKSg++5EFQ/Jj698=;
        b=G0fjEFrrewe58o0O/dIPGFRJ2Q5DJPwfvc7yh2BlwCoKldlMegeoETlTRoUZO5LxuE
         BSpb8p0VQjz3pV1qPeSi3Ftfy/527wf2nhRIRZa59v/4qMT6VvI3Jbq1ebD9QI8dp18M
         mj4WdsAHKit4Co2BQ4vPTGIDm5gFVWsugefxmEynC7AyBTR6IcsexiXIAdvgC1gnAWPN
         3e5RaZB6rBCbtWyta27xrVkbqbma+NSQQztWsBXBxAT3AlOIYPXlefXRPf7gbOE41URL
         MRDAA5t8nIpPG92h/M/tUciCnL2SVk6f7A+NlKuHHxdnEg3W+FYC+BJyohRZvftPsJck
         ZzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636862; x=1744241662;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uhm3xVklIWTKuMJm0mSzjGk571zlKSg++5EFQ/Jj698=;
        b=BmuHj8z16Xxdcoxt/p9bxPYUTSExikSFoZAp+DChij3g8o6e8EG3cXl8Jm/d6ef7Ci
         CiE82g9MFOBWuLDT8mF4y0CuyXa45fWMBaQdDeXB6q5D+75xdyehdvjkD2bnl/8v/edc
         TEPBA7gdP8yUjynd52p65pJ68jwF/csv6pHVzJAHu7Hyl7HvZDRQEPUeBv/FMdj24oRS
         IQuA/hopgXPgLY1R7IdCVlglHugdTDkZwPdS0r+lSpatvoaT2xEpCRQD9r3KYHgXJm/l
         mSpeTiKnR29UnFIhZCQAkr8NLO5cAvlJHSLGxsbYt3+3iqaL5lr9kz4/oDFhoKtKwyKQ
         Q0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXQQLQrGoB/oADK3RdJMizXTOaM94tM0fAtELCAKKr4Zot274b8EWrn+uSk/UGkAQsK1qRyyQe8R1xVEfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcqY5e8RHKCGhzMjjUU1zg8fDMoI0pTFAIONJ5ILQh9YnI1mG
	xzc0yxXgr421NJ7bOaaqN+xsIVgkSrrlpDMWv2KDNjdk/tkHMUKRcdnM/RBRuvyospW0Dtgmdsv
	+XCWCut2qBiARyc2T8BiKyo+9xw==
X-Google-Smtp-Source: AGHT+IHt2tBE/ySgcrK/aC6qisiJrm0y2T2ylyFoUuqW/+VzNsS93Xv/9MgD55Nz7V6Ag3uAgbyOVnY+ensGH6+wQbU=
X-Received: from pjyf12.prod.google.com ([2002:a17:90a:ec8c:b0:2f9:dc36:b11])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c0d:b0:2fe:b8ba:62de with SMTP id 98e67ed59e1d1-3053215e814mr25102035a91.25.1743636861828;
 Wed, 02 Apr 2025 16:34:21 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-1-willmcvicker@google.com>
Subject: [PATCH v2 0/7] Add module support for Arm64 Exynos MCT driver
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series adds support to build the Arm64 Exynos MCT driver as a module. =
This
is only possible on Arm64 SoCs since they can use the Arm architected timer=
 as
the clocksource. Once the Exynos MCT module is loaded and the device probes=
,
the MCT is used as the wakeup source for the arch_timer to ensure the devic=
e
can wakeup from the "c2" idle state.

These patches are originally from the downstream Pixel 6 (gs101) kernel fou=
nd
at [1] and have been adapted for upstream. Not only has the Exynos MCT driv=
er
been shipping as a module in the field with Android, but I've also tested t=
his
seris with the upstream kernel on my Pixel 6 Pro.

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream k=
ernel
can be found at [2].

Note2, this series is based off of linux-next/master commit 405e2241def8 ("=
Add
linux-next specific files for 20250331").

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main=
/README.md?ref_type=3Dheads

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
Cc: Hosung Kim <hosung0.kim@samsung.com>
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Cc: Will Deacon <will@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org

---
Changes in v2:
- Re-worked patch v1 5 based on Rob Herring's review to use the compatible =
data
  for retrieving the mct_init function pointer.
- Updated the Kconfig logic to disallow building the Exynos MCT driver as
  a module for ARM32 configurations based on Krzysztof Kozlowski's findings=
.
- Added comments and clarified commit messages in patches 1 and 2 based on
  reviews from John Stultz and Youngmin Nam.
- Fixed an issue found during testing that resulted in the device getting
  stuck on boot. This is included in v2 as patch 5.
- Collected *-by tags
- Rebased to the latest linux-next/master.

---
Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Add module support

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set local timer interrupts as percpu

Will Deacon (1):
  arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

Will McVicker (4):
  of/irq: Export of_irq_count for modules
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms                 |  1 -
 arch/arm64/boot/dts/exynos/google/gs101.dtsi |  3 +
 drivers/clocksource/Kconfig                  |  3 +-
 drivers/clocksource/exynos_mct.c             | 73 ++++++++++++++++----
 drivers/of/irq.c                             |  1 +
 5 files changed, 67 insertions(+), 14 deletions(-)

--=20
2.49.0.472.ge94155a9ec-goog

