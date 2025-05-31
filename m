Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FC8201100;
	Sat, 31 May 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748679133; cv=none; b=dBLJIcQiu4Ba1p4+rBx6nv6IDn/8AkR56Y3fwBaOcCgAGAt8s++cDd6RpvErwXItXJxVDPV8f3TrmO71NZOFGrIrGsQ00OUy/vQI89odZryjHLK3rp4+o+BE7IE5Ne1CmneyqFx8GvcA1TzOe3O2FnVsRdKV4HXV7YvOj665Eq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748679133; c=relaxed/simple;
	bh=P3pQFUlHC2T+Lsk5XbiDJySKsgqtLIg7wivM/Q6sk5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FA5jY2oudaQoc7Rx+846JuOFmmKd9YeeHR+Sen1dHOK3BY6EGT4qcp3CQYJwBFFz+MMEC9mYWoUXErV1ts44y7+jVUXKqPIY6QxkzE6YnKsftM2tIov5KPToLToWhCuFgXytttfRhWhiTru+kriMmmvL9nEcL7MvMD66vddZfic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpmMpOF9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpmMpOF9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-602e203db66so4677190a12.1;
        Sat, 31 May 2025 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748679128; x=1749283928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AfO4E8Rzlk2gOURhivC7ZagCRJfFLxz51Y/1loYq04U=;
        b=SpmMpOF9P63R/sMgNIXf7AWhgnbNa+twYMCMtZJVRLSJ9dBPFQw6PSjMuYx+SOLKhW
         O4z8h71vuy1fRHojmC76qPthMDo0nJJHWl0uS+KpNgQq4kLYbQUv3vQ2Q8Q89T5qyRVA
         UXKXpYwOwUSxFzy5VjIstta75Qibkv1EXSqebdsaxsIpoIm/9jvIwih2/n6tR9cRpB81
         PhK234A2ps/NdStH2RuTX/RV825XNteM/M8j1oJmyfhy43E5cbiDMn2T49U7LURDLRA1
         jGWzpyqtSKr971He5D+rasOGtbknWqQhcLxpnF3RRSWuwXjiTVcB8IwTpj1BGMWAvBl9
         NDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748679128; x=1749283928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfO4E8Rzlk2gOURhivC7ZagCRJfFLxz51Y/1loYq04U=;
        b=orIJHQZKAkPIXX049LK1m/78A95nDNKE7Uulb8U4xgYZ1qIVjN2Rkesg2+Mj5kScg9
         9GcNzs37/V9fmsto96jZHtRPqXSI1UWgjeoDPNrczqOIAnGrkoIUUS5o/z2D5Oro5Oi9
         bLinVzPv4cuJ/Y1oTncpCPjPMBmh3Ctnz5O9RXhFMN/4dL3gK/RthkghkoqQY+nhjChX
         cMpPE0sxo4J1Aar/sEY5JZX1itp85oy7CP0ae9ueA/2UtkNTDmj7kzTJ3iquiYOVR51A
         uSFqZfq/Fy60+E1/pT2L6iiGwZ6Btqwh+djAA6ABEUesEqbO3ZxxXW6hJKy++Vrndc0U
         o27g==
X-Forwarded-Encrypted: i=1; AJvYcCUrtTfsFitv3J6FYLpzrvs6VVoveADEO70tlKjvp+nbfk/3dlVyRJJkqrdAwbC3tKTn5Vk0g3EZoUFx@vger.kernel.org
X-Gm-Message-State: AOJu0YxAB26NjMnwdIiBJCpiFooAVgAcMGR939V4oe3u9DQIdzw0UiLd
	YHD3c9lDYCqy5uJQneq0qNyOZ80q9vqVruIUKn1pshkilUf81gtuEhWqREHSOiEC
X-Gm-Gg: ASbGncvth7opwMl4idF009VwpgvgwaR7tkM/r0BE+jADNYxAq8HdaX3Ox143ICHPqPJ
	UFIkyjw/yG7DO1rIvTmVqCeyrGLy8uWrs0j4PA8JGq5CfU//fRUZohBZqYSa6Wx4YLhXLr1Ycbm
	HUjOTxwQenjfuVWwhkAtycTv7LI0RXnyJGsx5TVGF8zSNX1tcxU9iLoiglkA3ku4QbSjkosJ0D5
	fb3SbSgR2kM5Uhncp51zI3v24H2d54ikjBW5BMRSegQcT9tPJVzEOnAmJSZ/x9A1iqsMxibGwG8
	AaHchaTFamhC0WSpl0+yIkLVCWAbnuAjHoH/xSgiEspF+rBIWhA8EhnK8iOpSAMgI9Yl3HrMuXV
	rl7QRHlQiTb5fhQ==
X-Google-Smtp-Source: AGHT+IGWHk4OucGEDJm7f3jkomn6fGr5i/tOtSrccUKqoTFVtwiiy0fzabYXBPVtBVVuj9Zg+B6IFg==
X-Received: by 2002:a17:907:9411:b0:ad8:87ae:3f66 with SMTP id a640c23a62f3a-adb495eabe6mr99990666b.60.1748679127694;
        Sat, 31 May 2025 01:12:07 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-114-141.web.vodafone.de. [109.43.114.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf05csm451352766b.113.2025.05.31.01.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 01:12:07 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	abd.masalkhi@gmail.com
Subject: [PATCH 0/3] Add control driver for ST M24LR RFID/NFC EEPROM chips
Date: Sat, 31 May 2025 08:11:56 +0000
Message-ID: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the control interface of
STMicroelectronics M24LR RFID/NFC EEPROM devices, such as M24LR04E-R.

The device exposes two I2C addresses: one for the control interface
and another for EEPROM memory. To support this design, the driver
acts as an I2C mux (gate), exposing the EEPROM as a child node
handled by the standard at24 driver. Using the mux not only enables
clean separation of functions but also allows synchronize access to
the device.

Patches:
  - Patch 1: Adds Device Tree binding for the control interface.
  - Patch 2: Adds the sysfs-based control driver.
  - Patch 3: Adds a MAINTAINERS entry for the driver.

Tested on: m24lr04e-r 

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>

Abd-Alrhman Masalkhi (3):
  dt-bindings: misc: Add binding for ST M24LR control interface
  misc: add sysfs control driver for ST M24LR series RFID/NFC chips
  MAINTAINERS: Add entry for ST M24LR control driver

 .../devicetree/bindings/misc/st,m24lr.yaml    |  70 ++
 MAINTAINERS                                   |   8 +
 drivers/misc/Kconfig                          |  15 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/m24lr_ctl.c                      | 677 ++++++++++++++++++
 5 files changed, 771 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/st,m24lr.yaml
 create mode 100644 drivers/misc/m24lr_ctl.c

-- 
2.43.0

