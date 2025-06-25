Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78E2BFC95
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869687; cv=none; b=Ttl0H/bHaxqKQwG1f3zGTmmVuXJN6j4q0YYoaTL2/ZbS0CwSPfcmw0CRumeD8w2f1hCU4TyAFauoSRb5NzQteFtrFR6AfWSDREH3/XRBT2NcTFTU64r4NUJij7zQ43Zeyn0Nlmu+T6UPJx4Xi2XWOKOjPVvSamfPicWHWisy+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869687; c=relaxed/simple;
	bh=J1G4wA185/RC88pABxfSgtgPkiCmT4wLJ8Skkm4M8e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OaltcVlUl7HSkiItPVaR4CnHOnIi/dVdSwY+XpQbxSURll42T/02xtVgnoKRCPyLgN5ufvEpGD7/xSKR6kGVWAhVRi6v7Aohx+fPrJ6gGEQLxumSx6qB48GLjYWHtN3qVHopjuvBJFPsrKj4IqPcKU2pk4sZF91f3n4bV25kN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Zrh3HOUS; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Zrh3HOUS"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d38d562a55so5083885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869683; x=1751474483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDCKEZvvy/u8mP8K+Ymdr+bMEt+s7GIZAgO/5a0i/oc=;
        b=Zrh3HOUSnh9X3Mi06r+O5wAyrlxTqvX5qejNnuGMcNOFYuLVNOIOAC2v+LOATfid8F
         P690xyYFui6ZS2y7b3qViATLMWtyxnUh/tjwOgGJjuR4kZudjTn7RZJsIv0QwULQgPt0
         Fm4Om5hynBeBioGll3q7l9lCrLOHX6vIMs25iLAfC4rEfqsGWxaQSUabWqTqVhAFNkar
         CBU9YImOSVPHgVHQ4KBS3WvGc+N6kK5Xj+S3I6EDUCvvxkIwnijbjaAy39Tw6DfMVOn5
         pOF66nan/wpxv60KDDiGRvm+Ua5CvelAr3sl5CRQmKcx5nrYCSOT4iGOx6bGYbYk6c7r
         lKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869683; x=1751474483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDCKEZvvy/u8mP8K+Ymdr+bMEt+s7GIZAgO/5a0i/oc=;
        b=Ah/But7EFwCqtv1A1/3JRX6XgIyx+IBoO7JuqGQ2ZynHCh30Bvs0b8OC4Q/fF41j7V
         odKSuwP6vw5rjDBBZ2+T0MARvs3u7ZVLle9ZPKdVqjMbM8rGshl/0QC3vHsH5VGLIwQ6
         q9UAYRyST/b6FxxbOPMKRLQbJWS6GYJ2T5jfZz9o3ogGH2xG/BAn3UhrArdUrynjM47D
         aI+kyBGDKPAuJEyv9PviP3AnfZf2oSb/ONjFthSAgl0vfQJClR9PvKN0eOdYR0BVqVAy
         ckmiaujch1HIFND2C3Dz1E6feDLXnWDHexyND05iyDlsKTiJXEuhWHO39Fx4caENFpje
         jxfw==
X-Forwarded-Encrypted: i=1; AJvYcCWL4dp6EB+X+I8rp/evhV5jFK1p9xrc07DA8ycO/aED1SEL5uxu+8g10B0l2w2tbIJcljsJOwpQcKLcQ1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNEgizTlMpv+/N8gBtpRW73DjggvVu60r62lhpYEwEdO7wI2Dz
	amWrob0QJchHCFuGiootQnGeLmv8ps/nye8jP0ppQ8mUbHSHLOLYuVHmCiZBiejxCoA=
X-Gm-Gg: ASbGncsBjmA2uSYDURLQJTYOyR2+6k9Zj/3Ai8ksGzeH2jcvLAQox7YnjefhCdgL8Dt
	TEVTdsYranX2QthZ6+we3hB7OblvCJN0PgW0ZttLCItzICMOaSDx3eVF5ZslPdhCYn006LKZ+jR
	JaduWQPTJuQVTQd/7xvTXxiY9El/6IrBcmzNXLTDzIoiB6ZqgHbLgRoAxvrbv0yw65kuevJE+ei
	5Wv7quTMRmGp5rQw44JXruoVhUqa4CtnVyviJ/Es9aNMBdIqR01IV4KctpXMG9xqLWVtrfgbcgc
	GFuD9kt5kVWLMnQACfqip6EDqyeSJC3vz32IcHXshqzDUKpWitW3AS8PbgxrmeQ7yNOcPczvyjC
	oYAw5s53gewyNedNOxALjySp1FJJm0lGehvlxNQPoj7unxA==
X-Google-Smtp-Source: AGHT+IF0qAzBR+5ebXXveqzmLr/2w4QQCNXjecbTJ4SgCA/yOFBNe+rVWxWjr5FO7bLbStXLn3XERQ==
X-Received: by 2002:a05:620a:40cb:b0:7d3:f1ff:5bac with SMTP id af79cd13be357-7d42972ce65mr495536885a.27.1750869683376;
        Wed, 25 Jun 2025 09:41:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:23 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] spacemit: introduce P1 PMIC support
Date: Wed, 25 Jun 2025 11:41:11 -0500
Message-ID: <20250625164119.1068842-1-elder@riscstar.com>
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

This version primarily updates the RTC code (in patch 4) based on
review feedback.  It also adds adds a dependency in patch 2, to
ensure the MFD_SIMPLE_MFD_I2C dependencies are met when selected.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v4

					-Alex
Between version 3 and version 4:
  - I got confirmation from SpacemiT that the RTC hardware does not
    implement the "latch" of registers as documented, and updated the
    RTC code accordingly (looping on read)
  - The RTC set_time() callback now returns an error value if one is
    reported when a regmap write re-enables the RTC
  - Renamed the RTC Kconfig option to be RTC_DRV_SPACEMIT_P1
  - Renamed the RTC source file be "rtc-spacemit-p1.c"
  - Replaced an RTC enumerated type with simple numeric indices
  - A message is no longer reported when devm_rtc_register_device()
    returns an error in the RTC driver
  - CONFIG_MFD_SPACEMIT_P1 now depends on I2C, to avoid a build error
        
Here is version 3 of this series:
  https://lore.kernel.org/linux-rtc/20250622032941.3768912-2-elder@riscstar.com/

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

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 169 ++++++++++++++++++
 12 files changed, 621 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
-- 
2.45.2

