Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998622E2660
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034195; cv=none; b=Jz80EfLrHQX0M+FX4oWVkFc3acaa8mLfNknZIGd27EaDjHpxO53q7/PCWvLE61CDtKujaRAhF2DHX6X6dOM1vj+19KogHK8pZGjjnVgEBrWTTOPtzLdo7ctRtrlyE96rS42nlObCXizwO+RP/96PPQcbZtvYOS+Pvxtpowxu3ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034195; c=relaxed/simple;
	bh=9jXWU2dNETFNQehlpjPu6e0VDdTp9Tr5HNt485rVJMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=km3/db1w3YcgXkr1kw1N34Izh7trc+TRh1BA3IA19Pl3dziYVvsaC1Ho8m4cv5Awl/ATEriqMNrWkEBFjHGhblsEHOSonooZnYKtk8wLoScsFja0+XvKE4if66hV4KCtr9sZJG5yULmCrg2mnB1SaKo+dS2X/rxd9weHpH1GQdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hpd5Aoqp; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hpd5Aoqp"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fad8b4c927so20627266d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034192; x=1751638992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xyZq4ZAe7ICNNo6naMBuUx3eFwikmrrS2wObQQXZubE=;
        b=hpd5Aoqp6xpRgJUysGUQe1ljmU0mkz+zGtZpDPyhUY3tW+OgVd8oWYLYCUh2KZuYOj
         oOl53HNtQIZgfa5+xda9sCrnhtCTOrSnX0FIOIXDtaX7o/A2gyyz+vuaUdYN4/c649PS
         sORznL1jFslAp4ioyTe3GR/pOW5iBlmuNuXXpZB6JjHgX4hd67HJVQ7McYMOgoTkqzz/
         /rQJbTx8xW//+3rtjBlit1xEY8kofsGAW81NkVzl7JoeSPsKE09/9ec0D91LXBOZ5DOA
         GxhtWOEs7czvonLpjX2p92axBOTsZ3fHg8paqR76el8g2p5hvaWr4vtTJzSDjaKpOZ2x
         rbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034192; x=1751638992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyZq4ZAe7ICNNo6naMBuUx3eFwikmrrS2wObQQXZubE=;
        b=DLkbYb4QO93FM1u7B9wQSXlD7UyNl+dN8VGjDaZFg9vdUxqbSXgZTDfD2npBOGB2AE
         H47A7b5W2rtzRFUTS/C/2TFf34gchcBmFWBuH19LxE0eqfhvPkQgpdSC/nKsc4Zu1ku3
         +IFRNNtuliNbrKLQWgd+AW7dgCNvpC+SMsuXmXJ19ui41u5xqTluTI0o7hBbdeF6zjjb
         nVDdwJYASzOKfBFCaTrYUBPBToOY1hagngfCw8Dajkohauat6TRchL08ExmQeq3BHv0Y
         BBsavLQ3mz8lqsRdJdWlNLcCtrMsLJzTBGRST/fwmCDWpjQPQ05axM/imIxtehIcM3mx
         TmDA==
X-Forwarded-Encrypted: i=1; AJvYcCWXQk78/+QpPhXf5WqJLB/apLyN2j9J3CV9ruksILTSeYsFYM2/++h6pTUfP4eHoiS1muMS2NIAd3+vIzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVmEKAqXlQrPiMUoxJT/ztMQpwkClCiRE4yZBYLkfaaGKQNOg
	boGnQil99K8YchoIzfNoOzi3wqbxS0vHUHs3etZdXKzTcuWiym/uMSFcxwlrBPQecP0=
X-Gm-Gg: ASbGnctK/pYWrNlgKwxNnwQFWaWx6PtwAfSpy9NwBH4sPcIArBAJBwWLIibjPbBYR9P
	CwuZfyWH/aTOJCiVn8BVApasjnQOO9v49PQlWd82j/i/SzmfQJZnBp1pFsg0th7lCVPFKhGqQrM
	AgYu9bjoEn6yIh0Ke0xsQDBgfnSnYSCnTQpScN2jvAr7vednth2SNpp0k+XUi2y8ZOfdke8WhJs
	/BGfOths02hJu3pOV3q8bOnjkilUu9YWq5vDiDd7ZWHjUqBBrVGw48X8owOVkOAPEnOmhoV0A0y
	Y02ZBaNOkNbGuLn8nxP817Zlj5zl9GnhfybL6JlYRXV0viNkZjYC8c77DrN+Zgov6t07JMuO237
	6upO9Ml5gNjk+ZiFzvM11PuKkabVPb30qSpE=
X-Google-Smtp-Source: AGHT+IHDtikB0oMUAvmWbAoxLBUqg4pB9xk/P6eVhjckLobTee+bJmH7aBt6iZAeNjzgw6e4ZS5Fcg==
X-Received: by 2002:a05:6214:2e43:b0:6fb:6114:1034 with SMTP id 6a1803df08f44-700131c4812mr68071916d6.39.1751034192321;
        Fri, 27 Jun 2025 07:23:12 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:11 -0700 (PDT)
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
Subject: [PATCH v6 0/8] spacemit: introduce P1 PMIC support
Date: Fri, 27 Jun 2025 09:22:59 -0500
Message-ID: <20250627142309.1444135-1-elder@riscstar.com>
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

This version adds a new patch to change the simple MFD driver as
suggested by Lee Jones.  Rather than specifying a full regmap config
for each simple MFD, specify the max_register value desired in the
simple_mfd_data structure.  That supports all existing devices (which
don't use the regmap_config option), as well as the SpacemiT P1
(which specifies the max_register).

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v6

Between version 5 and version 6:
  - Added Rob Herring's reviewed-by to patch 1
  - Add the simple MFD functionality suggested by Lee Jones
  - Update patch 3 (previously 2) accordingly

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.

Alex Elder (8):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: specify max_register
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
 drivers/mfd/simple-mfd-i2c.c                  |  30 ++--
 drivers/mfd/simple-mfd-i2c.h                  |   2 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 620 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 2aeda9592360c200085898a258c4754bfe879921
-- 
2.45.2

