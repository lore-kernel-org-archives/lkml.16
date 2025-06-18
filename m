Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5727E7EF;
	Wed, 18 Jun 2025 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231733; cv=none; b=UiFNYZ+sDUxQID3htyUeZVCZ45K7Lr7WUEi6aiDgr4kJd6CtfUeX9QV7JxZa27LuCQmZrVmM4zvndMx5yspE92ClgBIGt5M237V4Pp5Er6mwJLEQlnEurn+zLzzosDo4aj4YXlJrAXO0ijekLVk6WChEE+IuQvbL2abaWaTJdq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231733; c=relaxed/simple;
	bh=PRE6FGSN1BjPHjBVI17kEB92rC2rRHP8mT7w0OsphZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdNnFjmJbnO5lfb29GIPi4BZg2Oo+jo7r+MSYFCVqTMbP59t1itb8MheyOEyFfMdQjcVPC8PsD95wyJsIFKQzERGSwNnNj9UmdSOELLT3bMWSATyvZy0ij5ZWItzkCx6Yu+9kc5QZRCbJkY/Tz2C8Z0HGQE9AFFl+XG8RCIoM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiDFZHaT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiDFZHaT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2360ff7ac1bso46317725ad.3;
        Wed, 18 Jun 2025 00:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750231731; x=1750836531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1MuiMHWsnV5QufWLYV35SMTTVf4gaMpZv1rpKrIrTw=;
        b=MiDFZHaTcMeQyzbCU46k1mGBVUnbzSKCChbmoqPLO7olV9PTXnxNKBJNhj+NfThChQ
         HVUeA0xWMvUye4oZqQ3ND68JGr4TEetmHKj3Fi6eWNJbgiDAaUZ/i/AyyMvk3iPoC+B4
         +B1pF7mcRj8iq25JzCeqe07b6vnMGiqqi1dLDPMoCKCjQW+Kh5whpPXa4kKXcUICYNjr
         SanJW8Bj1+ohR20XTicsurePKpB3tDoj2Zmc5JVb0LpbROLJqnPAv/kq+2LMqT6VvQjL
         Q2k2lL9ygOzHTtl0AixMslwlbsw+dgT9y+bsYUv7CKPn/w96QcFELOzRWs0ZlNZk+Spj
         SPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750231731; x=1750836531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1MuiMHWsnV5QufWLYV35SMTTVf4gaMpZv1rpKrIrTw=;
        b=o5fpi2TL8HnjPPLta1QdImpyTmU55xG0aR0XRV1lVfqdX8kQ1u2qrUh3zvz6uUnYDi
         ISh9QcQD6iRBDgZuSmUNU9r38VfxjhWkrlgZxhWLe1D857GGdMjBR2aiqdPSKZma07LO
         tIf77DjJO5csQ2+MqPI0GwRGd077zB+2tEo4VLsXOCcAEQI4jwcL3xAM537aip2BAH2I
         mEs+80OKTNQWsDpNmt6MpYL/YO83jfs1DDF4L75LOKvt7Hm63pdxsdB0zFjXEVWgHYcx
         qGUYEy0s+K5R+AZE8dFimnQUsX4pBXu44Uk5NaWTTX5DyQRb5BY65Xu0acgmxzkWG1QN
         F4hg==
X-Forwarded-Encrypted: i=1; AJvYcCX/ABIp5uAwib98Zl81dkX1PCIFnYlHFhz+i+QOgpT/sO4jxv0urSLyNGwgNyc2MrCE5NP/jgcZiImCJWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/ODiWljC0Bj3viP17QQ+6UL/jOZO+mhvJz3mJFdvWvevTxwG
	QN2aBbHC/vFXfG/3vtwMPD1QHO4Yb+7erOn4HHT8D4DoQI8gGzhX6s3XwEYM4i+L4Pwj4g==
X-Gm-Gg: ASbGncuD/XGebW4TgRAudzcfJt5jkicc5yglQfaDrvF7/mkhEo6yl8tUMT/6CCrB7sJ
	/DM4ONZuYoep+Bobd+UD+oE/d287zMZ7z6zfCY2xSowECQp6GFyMMZEQBZ/fnIUrF6naiHFErhL
	FPR6k6dHFOnZ5wN2wGzP/MyHbel+1HVubVFXlg0vQZaXqHW+yJmvToG8X81hJQzBhVB/Y7XGqGv
	xkGaYx0yxX468/UXMeHvceGV6L5fQVyrmaWyb0L1ugIhFhC8A9785T/agnSYMS4JxpdoYrbPcZy
	nmtJaFzPR1SBwEkYQQA8Ea2hIyy2WFGPi2U4xF7NeXr8ggTO2fTOPciRTV9wMqDWDwjEpmowYsj
	q
X-Google-Smtp-Source: AGHT+IEZqPp646+YAn+PQWp2CWdcGvqah4RLQRfACStnYbm3Uare7jzimo3ZkmAr0nB7Fi9GnVCzew==
X-Received: by 2002:a17:903:228b:b0:234:a139:11ee with SMTP id d9443c01a7336-2366b144e21mr238950505ad.37.1750231731326;
        Wed, 18 Jun 2025 00:28:51 -0700 (PDT)
Received: from archlinux.lan ([2409:8a20:7f41:bed8:eed6:9106:2c6d:6a36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb87ddsm93173025ad.177.2025.06.18.00.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:28:50 -0700 (PDT)
From: dongfengweixiao@gmail.com
To: jdelvare@suse.com,
	linux@roeck-us.ne
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dee.H.Y" <dongfengweixiao@gmail.com>
Subject: [PATCH] hwmon: (corsair-cpro) Change dependency from HID to HIDRAW
Date: Wed, 18 Jun 2025 15:28:45 +0800
Message-ID: <20250618072845.233204-1-dongfengweixiao@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dee.H.Y" <dongfengweixiao@gmail.com>

This patch updates the dependency of the CORSAIR_CPRO driver in the
hwmon subsystem. Previously, the driver relied on HID, but now it
depends on HIDRAW. This change is aligned with the implementation
in the `ccp_probe()` function, where `HID_CONNECT_HIDRAW` is used,
indicating that the HID raw interface is required for proper operation.

Signed-off-by: Dee.H.Y <dongfengweixiao@gmail.com>
---
 drivers/hwmon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 08a3c863f80a..3f128cacb486 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -475,7 +475,7 @@ config SENSORS_CHIPCAP2
 
 config SENSORS_CORSAIR_CPRO
 	tristate "Corsair Commander Pro controller"
-	depends on HID
+	depends on HIDRAW
 	help
 	  If you say yes here you get support for the Corsair Commander Pro
 	  controller.
-- 
2.49.0

