Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3554E27E067
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341118; cv=none; b=R0pLQ/TXk68BL3n4YkSjUrNOiRJ5GX25mcTVlOTxC17ztPjYBrKrEyXc0STkwuLhQJVwGJNWD69XkWQ5NiBG2Ll3Wkzf9iCydclCvp4f5hXlt14BdA4BxsOXWNnF7ICuKcNbw3q3yNNA/b3OiuJLWBkmS7GDHHlgXZeyfEXjik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341118; c=relaxed/simple;
	bh=pz9rugOFzrRuRoXAnRvW6ba1xJ5wAStNuPyS+4gVoGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ap2h5mVRrHZj4ymJFs4t0lB23Ax6pV0P7o2gXT5FsYEtp0enlCnmV0RVotWytTLFLsBPxQDie/VULWsyG7O4N4hw1yHVyIDlcgMKkCHA5TNsBaCp4G/dmFaBbWiypkVaO8SeqmevYd7s0WG8KE0aFkEbzNI6AGqCQGBi4So+wxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eAxy8bMW; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eAxy8bMW"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3de2869dd74so2861815ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341115; x=1750945915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4/kRfI7GtIIigr3/HBRf4Is34RYmI+DLhB76yDRywQ=;
        b=eAxy8bMWf9KKIyvyJzcIGnRwHxza13MNgOG30hYqlH/doXsyoFqkiRqhdIOY/9bDR3
         NzNvHy3PW7Gi+eJimQepGg6750tPVxVnErMxA5ccGh4pp/HnXlkh/imjuCifmmqwOVdd
         PepMqIQbldNZgJXg0vMGIzpnbzFKcJDyvxfyAjtd/jiQGgdgyqLlSWEOj4giVor6iqmD
         8GgcatNyQR4xN8loMniESE/uOZdNAb10WXUuEjnh09mG7LBsmjuf9DBkwD5nPpAYcUFr
         8PG2WMpEjTt6b7Ky5or6vtLULq290A6P1owBsDUnQqeHtxq34hRbF8Ob5J2eSxv0hKXD
         ITDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341115; x=1750945915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4/kRfI7GtIIigr3/HBRf4Is34RYmI+DLhB76yDRywQ=;
        b=cqgTE359Oy7LfjQFpedS7o9n3bfeE4aLmc1CcfIRGtyU9o8ouSmKy8a6wWmc7/xfPN
         exmsDHQUkfOvTk5Gnbpl6+hkzJYoTOdaQfOhFRg+SHmFbPZEVbZGzDVz4ZcHA9QRQqj/
         KUCj6EoVwsBDT8Md+zXL1jxOeaAyNpFQBTOGLxy2Mi4ELmoyJ92gMpQ7ra5xl3bMQmZm
         Ogiehv2sjn1+QpRlByKlcTCWerKE74SsrjbtP9gXIq0J+W7duopdJAjCbSkOzBe3umR9
         B4QGd03ZB7h422sRHkOxPZMZNzIZYatI31/JsGtwMRwpTGq/xKVrc/UMwrU6wQ1slQmJ
         7E0A==
X-Forwarded-Encrypted: i=1; AJvYcCWZj1MlQTF/oVgnymQgFwmH+U137iDcXNXTMLAYmVElX/xvYj7O0kGauD1vPlATFVx6KE7w5uEsFbhI1h4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/uP7Wm/qPtcwDUMlk7gAuSVKQlw50/fZqUbEXfeuwmReoW+v
	x0SpSDVLzKTM+eVj0A/5R1tM9av1bpe+Kz17ukKFV0/DAB6f2iKGD/coQDtSeDFmVt0=
X-Gm-Gg: ASbGncvnnztpSw3OGppe8C7QmqmeKmqW36og0FhzbPg5n7UR5ypPE+wvJqGWrfbWR1o
	I19TrJkSMK1r4SFvnrD1bvJaUhpIE/Mkaq4W0Sh6N0Hxabm9Q2nRh/HaD5daVSCae9Dq5SvOKZj
	JCnecmQlzj7BoROP4LonzO4MCqnt0kEwrquk3hhO5WREmigvQz6QzUoztqxpi5ZqVVZ2qZJpQtj
	Of5bAlVyBh+YP+dBcQzUKMDz/FJO5OEVeRCWn178SayHM+FKkDyWvpcOUBHw0cU0DtBgOA8VuxE
	qbh8FuQJY51SYnHNbPuGlW6lntSDiPuJj/2gYWOv96uP/ZnUopiL28gZZ9x1Pl8Ygrok6KZ3wnB
	9UrT3Lf604sO2XimOd5uwaHTkQbNQaq4=
X-Google-Smtp-Source: AGHT+IFrbensFAkg/HByCyIpWD6NGm/n/XxGHWXyYgLJ12Gm8oYiEV2EbCqtiQI2rbB+Z4f+NfDTKw==
X-Received: by 2002:a05:6e02:17cb:b0:3dd:8663:d182 with SMTP id e9e14a558f8ab-3de07d6875emr211780235ab.13.1750341115180;
        Thu, 19 Jun 2025 06:51:55 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] spacemit: introduce P1 PMIC and regulator support
Date: Thu, 19 Jun 2025 08:51:44 -0500
Message-ID: <20250619135151.3206258-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements six buck
converters and twelve LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as a driver for its regulators.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v2

					-Alex

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

Alex Elder (6):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: spacemit: add support for SpacemiT PMICs
  regulator: spacemit: support SpacemiT P1 regulators
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  13 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/spacemit-pmic.c                   |  83 +++++++++
 drivers/regulator/Kconfig                     |  11 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++++
 10 files changed, 508 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/mfd/spacemit-pmic.c
 create mode 100644 drivers/regulator/spacemit-p1.c

base-commit: 2c923c845768a0f0e34b8161d70bc96525385782
-- 
2.45.2

