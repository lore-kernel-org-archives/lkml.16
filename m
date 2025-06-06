Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F780288C29;
	Fri,  6 Jun 2025 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211635; cv=none; b=mfxa+sDcnDHJGuRNwE4HFih0smDLMIiZPtPHEpmBs9ka4iayjkMCh0o+RbVdPGOj1QNCBSIHeadI2Q9lMAZulZNTqIU8mlCorJKiuZdaawA+g4jHRy+/k48T4QLo8uBhEAWftb68xmpZica2m3zdMiH2f83VTlDricmJ1cL5zTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211635; c=relaxed/simple;
	bh=yLJY0BRHWTXa3UHtKPNGBZr3m05ayE2UCFaKiHPe/T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tD4BXirxTIADgDfmQSqg+5Y1kvOhej5VPHTEGOSL2NpRemUfM/m7DwS+GfyPbW9JvcbHCncBpipLBeyOYbQkg+hXKoDDS78aZiEg6H/X15kQO+xtXhkimktOC/edMWLekBWLR7X9R8XcfJ5ua05yKhHP4nmXqlLL/BTNOXqi8gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQBauKso; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQBauKso"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1133522f8f.2;
        Fri, 06 Jun 2025 05:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749211631; x=1749816431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ95E9EY23axZFcMUppGnCR3XLsVeg2NtUQTaqPaYkE=;
        b=BQBauKsojKwLtDwte6HuFguys1dKXLg0lwxtqkLYzNtQXn3KM+ih7MUGLA6lo4Su9q
         UTgW58UrQHhgqx/MT1thaCfNTgxnkFtfCoAUuSvVw04E6Q3g6UdX+fssUyrx6ye1LcB6
         NsMdwnqQz2LC/mGKb+qsuo1Q6q+NzenE5ISWXLPm7VEwh3SyJa3qOXTNuEBwU/7aztaF
         PNL0vW1GFvRnOs3lH3C/sFE5JlD9mcVdH20A4xqc/RDp7y3xmEB2/PljMtjOW4FVQh/h
         t9Z57Otm+6SVDrbdvl/MYBu7sMRyj4XcQANfuHFyNilsb2LfeDx3s8nKHYsr51bq6jA+
         DK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211631; x=1749816431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJ95E9EY23axZFcMUppGnCR3XLsVeg2NtUQTaqPaYkE=;
        b=AQwG0LD+kdJa32Uc954uEsRmC4Gd76E0NhZ7slGeZiK2OG7swI8US7fCovMeWOfwBD
         +8o0lqzBcVTQ3fqulzXcTxEhgRuU8IhHIKhTPTCopt2m+EQF7y7RvHNadTTh/d7cwhIz
         uO5yisyufNF/nz/Qck0RtudI1fTjV9IlMrZnhbi3ZL3ebSSm0NQQ5BdXWz/lqQu8l8zR
         6XFUgYYcqDN4c8wCxqmlymHnVCwaW96JsBxnKKX1ojA3OAmLTTT+9269ZgBVMA8BwNFc
         XkIsCLM7Z2nKWV7FTKwZZdbjMdP0Bu0waUJFfxpsPHk3X0mZ1fdoUZRPSWazmo6uKtlV
         rkiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPrc7w5e84/qiEkxZZ13XMBfKFQriAOoxmaXqX7ZTHPZyEJHtQnxQyKZPLJOfm+UwzAlFJgv/8IJOA@vger.kernel.org
X-Gm-Message-State: AOJu0YwbAtUxDEMBQg6wSvrdLyH4mA3j+oe2XIecHOtJiOdDbPAfv3Jx
	pvq9OjZWcveBo2SC2SFv3zjb2A4z0bB5yubxaVvTZ0ysIy3wUvOu7+YZnoQn51xI
X-Gm-Gg: ASbGnctyNnLgBP4Gd2fx+bioZB0nQA08pjB5jAxlG5lOlqcJpcgOikW5bDGy2P0ccwQ
	yMHzOCk1TviEDPU4OCrDURz5E+ohcyZcNN4gQnrFbk4Ok2Eiq1oicxdnkIbB1ZTnl09ZHQ/lIU0
	W/O9wGjJbSe7c/5hNXanPraMW5ghPyd4kawzOZnHIl5/kL+Di964484qUjKW3rF43GOMVx0eigp
	lxEIQm5kaL6Tee8ks9nNKklxbil97/6nXRixPOANiJfzg5qG6SH3mJH6hDcsGAUAj23WPEeHxpR
	aDR9S8MYkcOv01Gj+N6YkS2qvRp7hU3boTR+vFYSJgKFBG/5stUGecLCOKIXkBXrHLyqhdYdfdn
	UQAe5zDChQ81uDjeROFeodPSb
X-Google-Smtp-Source: AGHT+IEOtEM9TP1fLEZNVP7do6r2cKStJcuv9OdTia/zzf1zi2+54zrnJ9cEAcb2CZHeUg90uRNjBQ==
X-Received: by 2002:a05:6000:22c4:b0:3a5:276b:1ec0 with SMTP id ffacd0b85a97d-3a531ce1597mr2396156f8f.45.1749211631108;
        Fri, 06 Jun 2025 05:07:11 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm1671874f8f.74.2025.06.06.05.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:07:10 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v3 0/3] Add support for STMicroelectronics M24LR EEPROM/NFC chips
Date: Fri,  6 Jun 2025 12:06:28 +0000
Message-ID: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the STMicroelectronics M24LR series
RFID/NFC EEPROM devices. These chips expose two I2C addresses: the primary
one provides access to system control and configuration registers, while
the secondary address is used for EEPROM access.

The driver implements both functionalities:
 - A sysfs-based interface for the control and system parameter registers.
 - EEPROM access via the nvmem subsystem using a secondary I2C dummy client.

Brief summary of changes in v3:
 - Full support for ST M24LR chips, including integrated EEPROM access
   within the same driver-no need for the at24 driver.
 - Dropped usage of the I2C mux API.
 - Switched to using the NVMEM subsystem for EEPROM access.
 - Removed reference to the i2c-mux binding.
 - Added reference to the nvmem binding to reflect EEPROM integration.
 - Updated the reg property to support devices exposing two I2C
   addresses, one for control and one for EEPROM.

Tested on: M24LR04E-R using Yocto on Raspberry Pi 4

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>

Abd-Alrhman Masalkhi (3):
  dt-bindings: eeprom: Add ST M24LR support
  misc: add driver for ST M24LR series RFID/NFC EEPROM chips
  ABI: sysfs: add documentation for ST M24LR EEPROM and control
    interface

 .../ABI/testing/sysfs-bus-i2c-devices-m24lr   |  96 +++
 .../devicetree/bindings/misc/st,m24lr.yaml    |  54 ++
 drivers/misc/Kconfig                          |  17 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/m24lr.c                          | 705 ++++++++++++++++++
 5 files changed, 873 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
 create mode 100644 Documentation/devicetree/bindings/misc/st,m24lr.yaml
 create mode 100644 drivers/misc/m24lr.c

-- 
2.43.0

