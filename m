Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459173E47B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462046; cv=none; b=khDwvi225F7HX/+HGsymsRYBB0tNBhgbJ1TKPO1JVJLtQjPV6mfm2Ie6yUCp3Ga7IkCmJXCXtxFAlQexREty8gj/eJqNyafAcp1gHKGHTxH6aRM9QUImSKQtvg/xBZS0oGG7NNd6kOh3sRgfABVdp5ViTVXL9SU1327Bv/bMF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462046; c=relaxed/simple;
	bh=6Ok35Jc2sYOa5RJIwfF2Usbs4iwCcwm7AGdULF2JQRU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ifVU20P9RWb1QO0AwKHVMJ0oOkqbNLk85Wkcyy48FwN/BIT/P8nUWbaZHoz1oZ1sP1uipaOjt/JrBp3aSLEzJo9qJdq0dHa7DwO8S50AY6IsBUtzArSAM6psjIhOT4EdmIWhUNcCZNGlOilJjcI/qHQDVO7eFIAf/M3BE7B2SE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tLxfHdOb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tLxfHdOb"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff5296726fso13610018a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462042; x=1744066842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ks/+cexj6+RLY5eRG4PKENu5maSP4eS1YiUdcvp3QUk=;
        b=tLxfHdOb1WxlbVWLzcQJbyNIOtngg7QpUjy6G4aSL33pjQWkwHGxGpDBYsKEJOQN7H
         ewccztSgEHVyBfgbFp/VHA1swxf+TKBFDhbhtRoh3IzA6O0GiKIuW5CNlPj4w1+IeiI0
         9SRBp4K4pQva/DrbctRCC0MltJruDFk3a+MybyZQ/JpXWcGHsv8hkeNdOCOjFnvk3VIw
         xkiJoVjewibruBxblk5He30vzwVHkCgJ9n8E34SQpGWbO9ARPtFnjFL9EgsZcHiYrH86
         JBD2HIQdCZ412mRSuZBPNKYnOiPdiVkOsef78Rl4eCtAbe6Wlp8rai3CKZqHHTyiiqBV
         NmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462042; x=1744066842;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ks/+cexj6+RLY5eRG4PKENu5maSP4eS1YiUdcvp3QUk=;
        b=c99Rd5qPYLy0vfnOUVtTqvLTfbo+cTihd5vVxs/89vHZnFpfabE5KkMkQM7KGR2tdZ
         FD4L8nd4uKTC9JsXUxFSewiCrUjU0YkuuLnc773zYHKD9rAlD21pwVQXKVXv3uwAlHHb
         yYt4p7Twd5v3Vs8EyjKd5b3jRjtyoUY3/NSjInH3OAzoydpGzdgYLwXO0SOY4+JcjhU2
         z1JkFolYZbuLxUDA4eiG/P9zvzHgSIIccabBsPhPDlKFItvMMwUbOoyGiI9bRyi+Nw2Y
         1d/GvG8WQg5HlcKKWvhvPvJOf+IvrVftxPFa/rUvzqe5hnePul8dsnDrIEPkkSk5N5Gx
         mFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKU4xBkWylVdhWMxBdvZrlJ0bN7XnOj3HgMZNTNa8iuzzY878WpzX8SjJeILciwAbnwV4v8lVjbWWhg5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Yeixu99gFUULEFey4hDbYKMHxb+ZfdAYhXHMAW/+9TJRo3z5
	zzDDbSIYQ7Su7lboW3yrKpEVyOBsniCnPt/OVjDHOorH0l+/27fTmHwj8/ytYjBAD3Uf4mhGiE8
	L3yx6Uu+6N/0kdmBC7O/8Mi89Bw==
X-Google-Smtp-Source: AGHT+IEltaWMh5mxqWCSOc5LwIIwISS15CHmoIhdVB3ul9l1TDM+bcKrNYeQAGpdOsN2DGV2kSzXTrnq7LHwPcjzh+w=
X-Received: from pgcv23.prod.google.com ([2002:a05:6a02:5317:b0:af9:318c:41a1])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2d0c:b0:1f5:a98d:3d8a with SMTP id adf61e73a8af0-2009f8042d4mr21446912637.40.1743462042575;
 Mon, 31 Mar 2025 16:00:42 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-1-willmcvicker@google.com>
Subject: [PATCH v1 0/6] Add module support for Arm64 Exynos MCT driver
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series adds support to build the Arm64 Exynos MCT driver as a module. This
is only possible on Arm64 SoCs since they can use the Arm architected timer as
the clocksource. Once the Exynos MCT module is loaded and the device probes,
the MCT driver is used as the wakeup source for the arch_timer.

These patches are originally from the downstream Pixel 6 (gs101) kernel found
at [1] and have been adapted for upstream. Not only has the Exynos MCT driver
been shipping as a module in the field with Android, but I've also tested this
seris with the upstream kernel on my Pixel 6 Pro.

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream kernel
can be found at [2].

Note2, this series is based off of linux-next/master commit 405e2241def8 ("Add
linux-next specific files for 20250331").

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
[2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main/README.md?ref_type=heads

Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Add module support

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set local timer interrupts as percpu

Will Deacon (1):
  arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

Will McVicker (3):
  of/irq: Export of_irq_count for modules
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms                 |  1 -
 arch/arm64/boot/dts/exynos/google/gs101.dtsi |  3 ++
 drivers/clocksource/Kconfig                  |  3 +-
 drivers/clocksource/exynos_mct.c             | 55 ++++++++++++++++----
 drivers/of/irq.c                             |  1 +
 5 files changed, 51 insertions(+), 12 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog

