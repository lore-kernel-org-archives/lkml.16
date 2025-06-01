Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908CA23CE;
	Sun,  1 Jun 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748791831; cv=none; b=lmVLJHUODFGePsYX2yytiouf+U6PpJ/atWUCHXn2g08oaDBzf5zH6jy20i5iJQ6KtFfzdKdpuNmfZf2ESw/hNZ2YxKk9StdhSh4tVii9E0TBQbqOmH4eO/nzk5UImVFbuI61NKWVl9WCjZhoCLkdm4H+cqY3BfYkAjVKhUmHeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748791831; c=relaxed/simple;
	bh=Hb6o0ccxWzXHTO6c+n9JpnzMCaGhphZV0oUFYf61xNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKnHTapLDFSn3onOGHFne4y5PRvD7af40mTSxwVsThWgDB3V3wu2P0taYTrNQ02B4pnTuJxaPbl80hm35axKTz9MRF0qqAZzAxyWL+nr/Rp7K4sOpOUHWwddUuC4vee38iocETpQsgjDKycdDOUmOmw4gMvJuWuixzLlt9qS5Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BL/V6vUZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BL/V6vUZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45024721cbdso28032605e9.2;
        Sun, 01 Jun 2025 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748791828; x=1749396628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNUQ8alZZyPEopmGs1jmwHY+Y0x3dDOgFkHsTDFu+M8=;
        b=BL/V6vUZyavBP2CISKfPprjog7obs8wOxiPBZcYRgEO/8Oqnn5koHXUopAWCbVs6/4
         5LPRxJNqecL2LBfFWLYJ/dkA/jS2loR8+NJpGz6CxAoG55d9WWtqgF7Bp1J387IaM1rN
         kSqBZdtS/AH3jMrVgtwqyb65bTFmj3Fp/+1X7E8OcwqazkybVdD2tyAawzPdbdYnMu5c
         B+TYMIad0+E8tffiq4T79ExxNA8WADfnhZzPF8fDApk2IWPd1nV8By65YyNUOR5rdaDJ
         efrnikpP5G+1gOB5WI7hhcLDW1M0SQtqH5b/+tbEWUSeoq7uZyrzvresAImz/qY0w87F
         pN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748791828; x=1749396628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNUQ8alZZyPEopmGs1jmwHY+Y0x3dDOgFkHsTDFu+M8=;
        b=owy9AbYHcRETewFmbRaVA+inxKnxAS+moHFN8h/Lwlc+ceIudkSLOmwLvCTm3Gj+zF
         Tox3IkR0nGqQKymsxjmyN5oTGdkmfIeGXAX+QH9QscHOvgVEmwEaN+6UuF6+Y8T4w1X0
         X6gOvHe3lAz1fmJuEeoIvMnkAwGcezLTANDMUoENaYk6kOvW35gTjvQhs629YYNbQBzq
         lCTD3mDkjSTAgrEkMDyDKM60xm7EdiBj8AcSOpkPcA3hjDoj3DY+pBiLM+ixqFjJBsVT
         MpXE05SlwtI6x+V5vdf9LKJpjn7QBXteK+oTBMztfkXQK0ttc1IWuubVh/cqhPvzLSXb
         Axhg==
X-Forwarded-Encrypted: i=1; AJvYcCWadPEZ9QjH30JeqCdGceT85nLkFKF87833jsr4UMRRFZeXp0X2QogqUaPyP44fldwwZ9F5HB1jJOjt@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcN2FHCtX938GfdXHTBT2OdTd+ZNgUszM62GyDTmzLvIWwSuM
	OCWBM66iYWQgEYrgXgbIH8oGEUlrNKK1fTamv/MbNuwBr6MmHCQEjqYV0HV4Ax/F
X-Gm-Gg: ASbGncubhR8fkEeSjYK5j1ukfR7bq6abKzZgJIN6U2C3vhAVKfA3DLVleb6IgImXFSw
	IrRDTvQgCjAcAkgOOGcEpH81Pc9dDmKdmAzmMxHcPbpzxUBnitz/FUpbF5D3rB/ZtC3S99CMlQ8
	X3Pa+/yDuFHn/gvoQIEeo0AvgXTLhiGeKU0eFghXU+blk3EvGlRhBQzWHaJ2BJBSu/UzByLNsAU
	lqD0olF6R1Zl44Bu7RNWSMvJmnUxRBFJYCifJX8rwIQoiAZN3LvO9/ZESg7rMaRI6ZSwqhuVy9g
	JblczHwLDdX/FCZv/HoVayGeAMIJKziXebT2KFqS7rJXnkupiDa36txeP/Prupf06ieFSeink55
	ngnPHBFx0cZJ16a0j6HF/mQ==
X-Google-Smtp-Source: AGHT+IHM2il1Wmej5P+2/rFFm9ssBYJr/Sr5YeiktbFrYfI24cee6q5AJo5ROsfEIACMi0us/Oj1Fg==
X-Received: by 2002:a05:600c:620f:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-450d6452cadmr116440765e9.0.1748791827469;
        Sun, 01 Jun 2025 08:30:27 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-115-37.web.vodafone.de. [109.43.115.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d800671csm88780205e9.30.2025.06.01.08.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 08:30:26 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v2 0/3] Add control driver for ST M24LR RFID/NFC EEPROM chips
Date: Sun,  1 Jun 2025 15:30:18 +0000
Message-ID: <20250601153022.2027919-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the control interface of STMicroelectronics 
M24LR RFID/NFC EEPROM devices, such as the M24LR04E-R. The chip exposes two 
I2C addresses and two distinct address spaces: one for the system parameter 
sector and another for the EEPROM memory. These address spaces overlap (both
start at address 0). Due to this overlap, the chip cannot be represented by a
single Device Tree node and handled by the standard at24 driver.

While it might be possible to model the system parameter sector and EEPROM
as two separate DT nodes, each handled by the standard at24 driver, this
leads to synchronization problems. For example, if a multi-page EEPROM write
is in progress and a control command (e.g., a i2c write lock) is issued
concurrently, it can result in incomplete or inconsistent writeing.

To overcome these issues, while maintaining a clean architecture and ensuring
synchronization, the chip is managed by two drivers:

1- The first driver exposes the system parameter sector and acts as an I2C mux
   (gate) for EEPROM access. Using an I2C mux solves the synchronization issue.
   This patch series implements this driver.
2- The second is the standard at24 driver, which handles the EEPROM.

Tested on: M24LR04E-R using Yocto on Raspberry Pi 4

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>

Abd-Alrhman Masalkhi (3):
  dt-bindings: eeprom: Add ST M24LR control interface
  misc: add sysfs control driver for ST M24LR series RFID/NFC chips
  ABI: sysfs: document control attributes for ST M24LR

 .../testing/sysfs-bus-i2c-devices-m24lr_ctl   |  96 +++
 .../devicetree/bindings/eeprom/st,m24lr.yaml  |  72 ++
 drivers/misc/Kconfig                          |  15 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/m24lr_ctl.c                      | 677 ++++++++++++++++++
 5 files changed, 861 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr_ctl
 create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
 create mode 100644 drivers/misc/m24lr_ctl.c

-- 
2.43.0

