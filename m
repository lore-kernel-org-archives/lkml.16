Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B023D6D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562989; cv=none; b=rCjfcKHsFdDJ8ESlT/XCXfy0c5RHlT5+ieiU2Etprvw8+4TSAJWjGxM4wtkXn7DP+9WiIJm+ohMjp4exhwWdrUq5vyia0rWo9qd2IVvB4du2wfqF8Jl1/2cma71mQ7A8zsUYPUZE5P+ZqHRtTkMu552adZujy452yaq0dd+pMJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562989; c=relaxed/simple;
	bh=reQ/ACXzC0FPxqlDRYXVLqxNB2esQfycAhNqUDmVLbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IDHGRXNU5GBuLwUZ8sxfuq1oxj5pi2qgEjh6uY9MgUME4VBehC/sWlGQDrzMwORYnwQfFI8XPUn0q7qUgT6Wgcnk16mSX8ovIZjcbrP4hyIsozc7zsB5G3U4M5lvc76yL1CD3WPSUq/uBiw3hQg7BjLQGmDYUcsMAB7TUlq1ek0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hmpmnB+/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hmpmnB+/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fada2dd785so39477006d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562986; x=1751167786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgrserUFU/DcGo28DBPZa+gth4hnjdPTKAQjzFeKIM8=;
        b=hmpmnB+/0htnlBZhnKYEm/ndtv4SnPGFeK4mOk7/JiQAdPGOac3ZCr1te0PzGvxsev
         lQHqBApyz0hezG8GvPLvhV7Z1yygx2ySvInDX9MzakrqlQnt3zQux+g+MzlRF1Tt+eEe
         xb1zk+YGiP1WbMdnAfy6A1+GQSWL6DCQyYErhD2Op9fXORH9HU2F6G6pHUo/zwpH68ao
         e7QgJbEXr6KinRJwapGjyMlDiSpqm+JM8TIOmhjw1tQ/by1gwqYQrwUcTpdxalSGN//F
         m+LcM2h93xvMCDbfYb0jPlonkKkSdkQog9ZnJDU8h9oeA/VLbHqPeZlzzrqg38EP2N+w
         ymeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562986; x=1751167786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgrserUFU/DcGo28DBPZa+gth4hnjdPTKAQjzFeKIM8=;
        b=VaDFJNRNHKE2l92hx6SYeMd1RA31RKErVmbKZAKI/W39m+JD1LrzGPyzjXDhUxdp6l
         +TnVI6JGcAFieM/cSs/oUojoR0KdU/JYFO6jBomBcSsuKM8PrCPPPvnd1aj6vVAs3Mk5
         DW57wwCcnFnBozimSxkKp64uNPe947q4KbR4MwnoiL6JgTspC3ujEhvqGHyRAgFPjw3P
         538BEuGeJ20UiYRj7o84XBcw0mbVTTxEBeBcYBAohr3qZ1F/+xhxCBV1eqGxlqGmPMEO
         GSEHkkZk58NBloHQ7bSfFGfGv7X9M64yxPdmozAyhIx308hstZ6XwqXDxEbJF1W/zzoI
         c3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWpPkEdj89N9hvmnVZW4m4UmEfjsL69PkEt3iBcHJZYSSIduA5Trjst6EpZBF7FJKbRxZM6TzpDWdUh8Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5g08HW6KhH5HF8hgufGK+7/CXJ0tNCR4rqYqvm7QFoc69Urho
	J3P+aNqZoBZmSDTX43sBg//ArjlS+DzQzlT8sl4yZlFEXnZPbla2ww8jnyd+/4gPsUY=
X-Gm-Gg: ASbGncsAyU0bRCZSFjv+cPvaKKg1A1y4OnnLWZxhtPltdJGgKOODhF28wzb8EAmR6xn
	XDe2MMvHF6R2LfrwU1TDOwn405Eql4z3uRp+nFfvhzwtnU5SRtdIBUW/R06KyFwxBhMRZlE+JXr
	hzEVgM1lExpAreFhR24r0nXbjkzR9atDSxruw5y78s4Mdt9O5gChoWUlkCuDpJeVmo9Fyoa0ZhF
	lDfh19/N0E5/FLXX4lI/JludPTa5MeL2wp+GffNDlIaWWOzF15C+N3NiJYZbFJuljDlBaO4cPN1
	p7NJ8kZKd4SZtTvj9A2ZahtafqrvG64vNMNxHVIltrt8JPJTGaxK4wPnos0Yr/BS/dJeSo/GIbd
	VwBI+dRUXZDto8vujmrLJhduiCwVnEWWw9Hw=
X-Google-Smtp-Source: AGHT+IFeIAU1AkteDl39FgQydYRwtm5GM125i8YSXLkjgyUSEEtkYenBUd8CxZ/YJ2gC3UkZwdaRjQ==
X-Received: by 2002:a05:6214:509c:b0:6fa:fb7d:6e4c with SMTP id 6a1803df08f44-6fd0a54d8c8mr142353156d6.25.1750562985883;
        Sat, 21 Jun 2025 20:29:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] spacemit: introduce P1 PMIC support
Date: Sat, 21 Jun 2025 22:29:32 -0500
Message-ID: <20250622032941.3768912-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
converters and 12 LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v3

					-Alex
Between version 2 and version 3:
  - Removed "spacemit-pmic.c" and updated "simple-mfd-i2c.c" instead
  - Added an RTC driver, so that the MFD has more than one sub-device
  - Other suggestions were directed at "spacemit-pmic.c"

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Reviewed-by tag from Mark Brown to patch 3
  - Implemented suggestions from Vivian Wang:
      - Fixed a typo in the subject line in patch 1
      - Now use module_i2c_driver() for the PMIC driver in patch 2
      - Added MODULE_ALIAS() for both drivers (patches 2 and 3)
      - Defined and used DRV_NAME in both drivers
      - Added additional Kconfig module help text for both drivers

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  10 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-p1.c                          | 137 +++++++++++++++
 12 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-p1.c


base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
-- 
2.45.2

