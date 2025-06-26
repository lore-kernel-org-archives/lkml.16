Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0FF288C30
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947517; cv=none; b=mLpTGDv8L8Yixyqe20cI9QjgME5KSj3U1fST5H7p/7mvs+SR7zjpKkhaqgdH7dHqjA6kYvx193RhtPFL3+SflFIOe0+Eb7NaNgYk0pXlElVkqZTYO0qfYOGBg/6Aas26Pjn/lXTg6kt7uGXbgwQnGvXh2fqX25rSn0xyDDxfS9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947517; c=relaxed/simple;
	bh=X0GjaqTTAa5JidnwmIm7FesIRgbpydxFUu/Rva0HYuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJYlKRkSLyzwo2cfUeCnthmCcssuuv4WfEqUQKURvuZIxo5OMnSsZU/wY0YN1ajytc/F0TLeSZiDcKoVzk8lRGIS9T4MzFy8KKJ2YgW/SwSZY/qNjhYlw1r5w0KlKtFus2hHdLOk5ZHrHvwcUMQTU8UDd49UNEmPfbtPXdS4GQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VNMLL8rl; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VNMLL8rl"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a6f6d52af7so11828961cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947513; x=1751552313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1+njo/PU0WQA3UwaVXdY9MyHtDa5fqeWJD6Uqs2k9w=;
        b=VNMLL8rllbupPZMvcyxhWWcoHrF6OS0EKkR/8C2YYXpkhhfnuSGgzKE5ReCi6P0MsY
         MfmsRVlki/es7j3vwOn0MPJOLxYRsLu8kmc2DjTi9oTaDFcLHKBKg6d7uQDMkOmOmQVs
         LUWVV8vQfGf/qNhGB0v/fZnHmGaIje++/mJbTTfnn5J/dSOHNwUtjH5Sdy/wZ9JI2aEZ
         1mhNK3s0cjIbDid3M5csMOTADJop6mONVhjQItwPyTUhnVZwOQVy/W11rVpK6vFJ4phd
         HsKxBnqLcBgCNX5PAGYk7mz1aguP+uynBOLNqBoYM2FbM/z1PqRWuK8dsdFBobyhTWKt
         /4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947513; x=1751552313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1+njo/PU0WQA3UwaVXdY9MyHtDa5fqeWJD6Uqs2k9w=;
        b=ByQxk1g0KNxG43eJ6iOgVrt0kiLHptEdOUrEiFvJq/QZg45sD+u4B1xl7ZkoDzSJUF
         5+AW5OicgF8CoAjYGNn2170OIRqn9QSH5EZmrencPfr0/C0dkcuCnH4iHe+q84v2BiTw
         3ZAvdECk55+K84RnO5eSlULNlLspNbRo760GkxH8ur9JHvkkbx7RqC433gwrX6twUBM+
         xxq/Nfz1LasdqRMXwhVtjjRE36jyMWGtb2Bcp6bDNJ0YF/ugyrNxukE+MGGS+E8ne3MH
         GL/21tLgeoVY7HNfTP0wPGKUdQsWEaqjhKlctT31gQmd+JxG7mHf1zh0RD92OduR2PAK
         vd4g==
X-Forwarded-Encrypted: i=1; AJvYcCX94ameC/M4tlmtmtV3gnUwVebDTBZiF0ED1jPcYIUEnEnvHLb3qDEldV7PUPRuk+qC1XRay+fTonC1RX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZQqp95kauDLPhIxySMkAi/v9M8zBQoYVFnwS5S8rHIF4urNc
	OPp9B1K9y4T5vskBzpW11LJAuwUXzKVfu0WUrV5TDrfCIi/vRAYhr6Fcw/C4eClsc+8=
X-Gm-Gg: ASbGnctkUzcxpDjTNkstVDRWFr62vRW5sLQgXrz962eH1bw+8oZmem63+3fVfqhuDNg
	o+niHUhSEZ+Fw6LsslYRrYEnoEul/VZx4TSo/IOrOYwwtVF9hs4yY4evYniDtDX0wSkA3ESdpuB
	wmCdBvWMVEwMQYcc3bIWzj8G9kqRFcHhfmMnZ0aHfhsvE1OZpmYagP+X0KDboDySO9vOJKyh9lg
	JzNtmLAZBVoLOP4umisQ0GLtyWR/Z13/Bv/Mpe1HcZK3IsP3yN5IG2loyZvvCCs9E3jS6bjyY81
	Z1sVYQ5qObn5+4OlVHOSCGS40WRModIkMCchpWmGmNPECxJ/mj2LiajIFGvRY+t+v0JzPFrIzv+
	IjGDxCBkecjnWkMvLG1IVHDtAqwVwWc7ap3A=
X-Google-Smtp-Source: AGHT+IH50fVe+8buCV/yNDQQL4G1EmkNFITk4SYtG40d0e2VPlg856V2s5HzZ2dfEIhiKOw+A+yqaA==
X-Received: by 2002:ac8:7d43:0:b0:4a5:a7a8:fd83 with SMTP id d75a77b69052e-4a7f2a3c555mr61902301cf.44.1750947512103;
        Thu, 26 Jun 2025 07:18:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:31 -0700 (PDT)
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
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] spacemit: introduce P1 PMIC support
Date: Thu, 26 Jun 2025 09:18:19 -0500
Message-ID: <20250626141827.1140403-1-elder@riscstar.com>
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

This version updates the RTC code in patch 4 based on a few review
comments from Alexandre Belloni.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v5

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 12 files changed, 619 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
-- 
2.45.2

