Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3743D2D9EF1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030975; cv=none; b=soP3pTFArVHBS5ZJfn8pYqIlzRMuhqk7W6rxZF89YVpbncfK/+zJSEc+J6DY+x/EBZWw+NUfuYCupLb6b9u77wjbpK0zHnZucwADLZRCzoDLEgq9e7QFB6Vn9cn4w6IVB64dGBDIsUvpCldiRl1nJjNDwICNMmEOSklguF/o31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030975; c=relaxed/simple;
	bh=2oV3N21EVG9NEmZuJ5omnfKLZjJInSpP6WwU9F4mZpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nP6MJchbVvsZUKyEyJFdnQs7po866VnsFYOT4f5BUu0DsLcDtPI9QHo0tf7DmzWaSMWzhPZIY3W31FHMHU9EBHbZwkBtNZoWODE6vfIhm7+n58XwLmIHI4zEyahXxnGY70NuMnPRGSPWoJpUshVR/hr1WBK5fw23f4PVogXRwIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsBYYXip; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsBYYXip"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so4639902a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030971; x=1751635771; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2cruWPjz3gexVrRlJMt2yY2YOmBkTyGxfEJbYUktqI=;
        b=rsBYYXiphzUOQsbZBDgtPQ0Njfhr6BqWX3mnspQd10zuUNRlPnFDOjhWpqkr8fGmtR
         QMOkEy6ozIp5M1baudXkiY0fNWJkwkmQN2h36w7MalDQXhCvDFtm4eLMM9sUCim9NHPC
         hrAtZzDuzzj6WItwDs7Eufdez08apAxzKaWG4A92w9dlULTCK9fR6TDpmAN4WpAr7amX
         TEx9rWVP4Er/lHxgVEsy97d4ebln0jpjnrKK7J20R4zFUnWu3FE91oxxE/9B+glMTVgQ
         T8YYzQgHwiM97SsGBprUlZuWMd71zNndeKdmZDoJfpYV3o8W5Jb4axEIO1Y2VDK81CgK
         Clkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030971; x=1751635771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2cruWPjz3gexVrRlJMt2yY2YOmBkTyGxfEJbYUktqI=;
        b=S1Gq/4xglDpRNsXJ6Baki7+n3TN3+Fg+IOD+uZDFjuBUjkT/8oUogVWe1HPT+BFP8l
         Y6zGYYOVyW7oE3qAOS9K64D1Pt5lAJcv4krbtY6cjETbtEpgOoN+naCBfVURBZmyFne1
         LkOiCaOg8paEfpVF4CjxcSQpahxVZBlRyi48fUNjkzShibkfal/bkrzPgLS2rflqHZFR
         xABOpW94n4Urp0RLKv7Jr33ho+/gwp3Z03IaOP8b6YsG0KzKtckpW0JWFax16PfDEbfk
         54qBZx+gpZs7s9C4L7VmKRZ1YxOWJhqVUuti7ghREaWttmv0+AYAWS0NYqozcXPPsMgJ
         xRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQrgC/l028urchCpSvZ0TRJrsoYyMss8lMM//RN12wdkJvhMTKRUjd68zFtv4nkL+JbIQnyINt6XovAGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjLdiZy8/qVzZ15pRX24EJ44GeXV9Yx3EDt1HW7ylVm8m8ha6
	aH4wzlcEMLiRUoY4+nHm5aPja+jTU9RSvyf7rgpr5LvytQbIFuijqAR0kDsifEUX9SSpGwQ1jaq
	actViDfYP3Q==
X-Gm-Gg: ASbGncsLDS74344lN8vJ5NkGioNN3ZhO/Bw5JznqV3XyL1sqkARjl/57ZfA+Cv9XZkl
	2wFS8bjR+KOoSIcau0FXiBKLDEjeE+B5x0SeUQePMc9JizOFH9vR8eIqCZoddxV35ZZVzkZqyWF
	9/mOUHV0m4j2NaZXKNdeu5KOYL1MTKOlpkuQmnRefTskwnZG/C7VYOAAXipogConrLpcAThKcxQ
	K5cABh5cuYHuZ+GK4tTObwLgxS99fj+jM9dxrOL3kGNgsspFNouUiZqaKNGx80Zt57k6CizQ2nL
	TC+cqj3ZzfPSgoDOZ64+XN8JlercOX2yF2W9YXQsOdrfHet++ephPZRE4x/UHQi0hq7FOHAbnw0
	ZBnPuINrSadqGD1ROtLR1wwAXFFRlsIE+T0ze1F8VAo3p+aWQcbE+g+7g
X-Google-Smtp-Source: AGHT+IFZK5c46HhXnjcsG+iKu4lVg84Jm5gZqBHYsY+oJqop8E97nfkHet25Wa24z6oqjQJtzHQGZQ==
X-Received: by 2002:a05:6402:40d0:b0:607:4625:98f5 with SMTP id 4fb4d7f45d1cf-60c88e58024mr2569375a12.23.1751030971492;
        Fri, 27 Jun 2025 06:29:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] gs101 s2mpg10 initial enablement & reboot update (DT)
Date: Fri, 27 Jun 2025 14:29:29 +0100
Message-Id: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALmcXmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNz3fRiQwND3aLUpPz8EmNdC+M0i2QjE/NEg6QkJaCegqLUtMwKsHn
 RsbW1AGKIwG1fAAAA
X-Change-ID: 20250627-gs101-reboot3-83f8c247a0bb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This series goes on top of krzk/for-next commit 62cd64f5b915 ("Merge
branch 'next/dt64' into for-next") [1] for the reason outlined at the
bottom of this cover letter.

This series enables the s2mpg10 PMIC, updates the DT for Google Pixel 6
and 6 Pro (oriole / raven) boards accordingly, and switches these
boards to cold-reboot (instead of warm).

A cold-reboot is a bit more secure than warm-reboot as e.g. RAM
contents will be wiped, and the bootloader will not assume the HLOS has
crashed (as it does with warm-reboot) and will therefore be ready a bit
faster.

For cold-reboot to fully work, the reboot mode (i.e. what to do after
reboot) needs to have been stored in NVMEM for the bootloader.
Therefore this series runtime-depends on the Maxim MAX77759 nvmem
enablement from [2], which was applied to krzk/linux.git (for-next).

Link: https://git.kernel.org/krzk/c/62cd64f5b915 [1]
Link: https://lore.kernel.org/all/20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org/ [2]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      arm64: defconfig: enable Samsung PMIC over ACPM
      arm64: dts: exynos: gs101-pixel-common: add main PMIC node
      arm64: dts: exynos: gs101: switch to gs101 specific reboot

 .../boot/dts/exynos/google/gs101-pixel-common.dtsi   | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi         |  5 +----
 arch/arm64/configs/defconfig                         |  1 +
 3 files changed, 22 insertions(+), 4 deletions(-)
---
base-commit: 62cd64f5b915617ea7978205b336ff21f0801c95
change-id: 20250627-gs101-reboot3-83f8c247a0bb

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

