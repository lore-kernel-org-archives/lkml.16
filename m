Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CBF28C2DE;
	Fri,  4 Jul 2025 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632774; cv=none; b=IvrgzTUzhVOoWn9rgDMuMMULwtsZYg6VpUl4n0cNaRu2a4gXcxKccExxYoJ5fQ4aljrlxotiSPOXmbate0kMLB8zNL0WM0rTxZPHWyjjTErYVcLIrbgrvBy9uPpGo20DP6ppyXBlCSnvE5vFeLWGt/ZeyN+fVoawi3d9bzZiSHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632774; c=relaxed/simple;
	bh=Qs6+HE89AUgmyAavkV7HuAS3JlNL54D/qBhAGlU+hDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dka6Ruh2wRJXLe2JtBK6lKrIZYME3kC0oxCbqorotlIzRgr8E5yunyLlj4yv9YtY9+YaJnqtLoHo43kscQGvZCTZaeHNpwIFVxv2tN8mv9fwxYemLGE6lFaHLJrjD+q8qPe/l0RdX+Jqv5GJnNzPlBAixtbchRBL1+PbdGWVdbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Unioj+V4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Unioj+V4"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so170406366b.3;
        Fri, 04 Jul 2025 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751632770; x=1752237570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDenIljNSTVSHWuGkdw4tF8oL0H0P+4SvxvPT0+Mmn8=;
        b=Unioj+V4KVbxeR7aXQKKHAYgZEDAIW+lS1wVrN++dF6TTKbsTdhS/dt3pf5va5oGCx
         kSenZvK00fFV8qAaI+xIC7Lk8z+zsUZ21dyXRRJPalBGe3YxCYbF9uYqam8fdN1ngm1/
         tsEAbbya7+SrxCNMPWWU1rWzlIf28UvofpdwzAoF/kfUaAEa93Eet8Z+7zna6q00LydM
         Ico/0rEweSvmMa1LRjN+80+qw/slufRTaWFERLHeHze1yYVgTHaOERIo/FZldo+F7FzF
         MV6N5xtY18OoNOsbusGSfRkt8lBCED/1nGapL6XMrYhEfbSsusWyMRx0yQzU29iKIDtx
         fiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632770; x=1752237570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDenIljNSTVSHWuGkdw4tF8oL0H0P+4SvxvPT0+Mmn8=;
        b=jRGg5Gz3jvfBTp7yRwAiduXljqtsmaZGMmXS/CfQ59yDkrLo8jX4nEAHhI+ck2QbBq
         ueTreUwsOhNL/wCAIlr3qf8pHoobYB0tNoj3dfBfGZX+2pscJ3W/EPbJ8aM4svhc/oHq
         baRL6g+ipRa5wpdQLC/xAEvgHn6bL3Bvi+UVhukJ0rlCHCCP9uNL6sSj7k0XUBL9lTXo
         drkdWPiNcC/z57cpvtdNJ9t+SkYTCdCCYu7whmIBEPKnDQX6iJY5zXi6FfxQZ4gOzRli
         AbnfV/oIAKMoNYyFl40hXfbICyAh3ekIE7jWXep+lOGRQkPR3pPH2/OcBzqVE4WEHGNb
         t+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXErg5GaicQp3qDrEMvR7CvhcvQZtv3tLuHcEjP1sLZo1hANUbKOMeNeF+Usu29GI0sLBqNJIw0EPOU@vger.kernel.org
X-Gm-Message-State: AOJu0YxFULN+jxumVtg2XIyzjkgMyUIzmQp5PTaXD6rIdSueaDj7MvKO
	7pnCW8YEVbbQ9sLTnf3WxekBQhJOMc/X+FUGpZM/ZjoUVPJiSe6IVn5PdeZH7w==
X-Gm-Gg: ASbGncvXD+/L5/Ytl+vhHQuwceh9H0NL+YpVcrWyC+i9sgs2TMIbHAiVKX7I613fV9r
	spRPm19zRhKexHqMsh7p9eJrRT1YtR0unlzevPtRu7qKrVALCbuyCQSv2Obe6qGjv5s60D7aVEr
	OtmDTNgvKfX7TQj3ghN3qtkFf3RzdSwsrcmvBUfOxw/NZXZrQiyG4MuLfFUU1xG7Bt7vNuS9CYr
	RBJ9QV/0/JwLKPUuzbBz6mINR2+MO1KLRnYuNVFXlRx+9o2Qvp5UAxJs+qwCwDCQ4KioNOYjGPk
	w+XaXSBs6Y2fzf0tz1zEzPsRX/M6UKH6plbgywDY8xvERLEE+LWBW2l9W/YxZ4OBK9di17R+gU3
	Vu+hJ6lFO2YIdHqgn/Xk7nJVnNuXgncgLYvEKXA==
X-Google-Smtp-Source: AGHT+IHFs68AZZz0zAG5AIayraRDywgGlGWjDo3QxMusR1i+ctcGkK+kv7pAFk360y80o2YcGXtRRw==
X-Received: by 2002:a17:907:3c85:b0:ae3:6744:3677 with SMTP id a640c23a62f3a-ae3fbd0b99amr239581166b.32.1751632770048;
        Fri, 04 Jul 2025 05:39:30 -0700 (PDT)
Received: from masalkhi.. (ip-078-042-182-222.um17.pools.vodafone-ip.de. [78.42.182.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b43264sm166648066b.141.2025.07.04.05.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:39:29 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luoyifan@cmss.chinamobile.com,
	abd.masalkhi@gmail.com
Subject: [PATCH v5 0/3] Add support for STMicroelectronics M24LR EEPROM/NFC chips
Date: Fri,  4 Jul 2025 12:39:11 +0000
Message-ID: <20250704123914.11216-1-abd.masalkhi@gmail.com>
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
 - EEPROM access via the nvmem subsystem using a secondary I2C dummy
   client.

Tested on: M24LR04E-R using Yocto on Raspberry Pi 4

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>

Abd-Alrhman Masalkhi (3):
  dt-bindings: eeprom: Add ST M24LR support
  eeprom: add driver for ST M24LR series RFID/NFC EEPROM chips
  ABI: sysfs: add documentation for ST M24LR EEPROM and control
    interface

 .../ABI/testing/sysfs-bus-i2c-devices-m24lr   | 100 +++
 .../devicetree/bindings/eeprom/st,m24lr.yaml  |  52 ++
 drivers/misc/eeprom/Kconfig                   |  18 +
 drivers/misc/eeprom/Makefile                  |   1 +
 drivers/misc/eeprom/m24lr.c                   | 653 ++++++++++++++++++
 5 files changed, 824 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
 create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
 create mode 100644 drivers/misc/eeprom/m24lr.c

-- 
2.43.0

