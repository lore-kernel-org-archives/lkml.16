Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A84B1448E0;
	Mon, 14 Apr 2025 22:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744668116; cv=none; b=m1Iq/AAw/q3K0xuTRC6XQgzj6bwH3ZCzjzhl3JCbeWi1hM1jgv54WSlxarbCDjN8f+Om+WjM9NLqy8//tC+Aal1oMQFM6KNc31+Tj00VxncCwvLEwCjKBOy166tP0SN8fuU2SBZPuWYuPGooKYhNxHmbrLMqpDGm6r4OXboXPOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744668116; c=relaxed/simple;
	bh=2ycU6iKCnCWzvEpDO0IKF/KqyalrZfuBb3MC3tlhlS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZZvBI6KZAN+mOMRtr+DgrhFJyE9NvG9cFGk/nR9O1j/S9hH7SkFPOfl+agkj7s6VV2HRmXk7lsYckeq661I+dZN5UCh0X3FaypU25QK2eBeGU1GzJBPhPT9Ro2eNMsxaP5lD+4YJ7ml6koP2VbPM3uJC1A4r0nABIOPd1DNCy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzVsk6Kd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzVsk6Kd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso55852795e9.3;
        Mon, 14 Apr 2025 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744668112; x=1745272912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ql+/MgQRZ7yNwEhIlZd81cPtURJutCh2b7dRPFnDxvI=;
        b=gzVsk6KdPo1ck6Da+fz61KOrNllk//yLFqFbjmdfb12JFLv/XWiOtZdfPXsnih9sUd
         F62rhVq9TnjXHrIaUDaMwkeT4PgfP4Jo4uG1rVvLa34IoFDS2pl1Qg0TKbuHyOoPKu1F
         9xCzvXL3ghHlfPO5rTEUzQPtyK5TdkOOOTQmEfHnwt52vAebQprM+lyRCCD48M8BnQ5i
         LwIrW3iNjnKMF5PSTpvGeLtVx7wBuzb1cIcQIOBTC9P5Po6IrYM3zeje/otHnvDWWx22
         mDFIj9XjL23boJsk28DotLic8tK4t+iT/Jl/6vBON+wThBIiP41eyy3gKGFk5mkC0NVa
         2KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744668112; x=1745272912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql+/MgQRZ7yNwEhIlZd81cPtURJutCh2b7dRPFnDxvI=;
        b=ZdOr/3Qy5iHZNlYYLZ0jAm2A38Wigfhx/QPYaljquVrUIkPHlEXaWCaq/zyC7pSoGw
         nQI6XUoB2GZgdO1AIoxPbJuzBQkvXijcP8nJ6/1fydEdz1nXNTsds9qKSPGKFV2V7pyx
         VMXdtjgCSTTeWrSyb1thOMbOAcOqnLe0LN9zRSgJSeBpPXDbExxBUN1e1WqVs7jHw0kF
         y6f5TnmtAtmuj4n5ERPAn+A8s/A0BPnkLCPjwMuwehZee2xXRPI2QvXkVhLk+TkH7Tgx
         eB56MQaI0nU4LQSsIOTLEKCK8cBQNFjfyfNxNo1Puo6eMrontyJRTjNx87uzhX4b/L99
         Nhgw==
X-Forwarded-Encrypted: i=1; AJvYcCUG4HBYNWAH0NtxcBRucECR/9bOusRZnXfoK1MoVemsD1nutfs1OzTBlPtrDMslujzK7+ID3u8Re2uXGpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGAEH7lWtB2ALAGBbNxnoX1TZcKJUI9P4fB2V686+OQOJHW4+s
	v7Dc2h8hx2WpSbaHtnx9VGWd53+DK5GtMSlsFMoMweKUSkuR/Nyt
X-Gm-Gg: ASbGncvskRT5MWMUtNoXlo7HerpMo1LFv6/2DF3b+JaGazzHrKCTjcobwzm0syFEWFw
	N+MUjUQybIpW6KF2UyMm8ENIDJg64rEbABVlSW7gt3s5l91j3n0WNkEJhdB4lk6O7TwrQsEx3sx
	/pMkfeGtXryoesTgP4kqr3hgyf339yGhInzG8cKFAa+hLGz/j4k5AZVJL1C/VsP2gym5CJHOdEB
	4m5YlQVm2S/0HPHk3B9K56GbpHQpftdz0XidaIrmRjxThzEAog8RmDAJZNYitMeM3xRwbp4vqTC
	JOT4tOa5CKA7ahgSys8i5whtXkfK+Tkwj+8kjNZm7KYbvPtpDpbcCbKcALcf
X-Google-Smtp-Source: AGHT+IFHRW0t/wgg33LCmU4H2TI11W3/dyIjeTQA7OJSva1SFx2PORbXybto0JoSn4kfs6HI4JJHSQ==
X-Received: by 2002:a05:600c:a04:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-43f3a93f7c6mr120655375e9.13.1744668112028;
        Mon, 14 Apr 2025 15:01:52 -0700 (PDT)
Received: from localhost.localdomain ([46.120.85.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae977513sm11971546f8f.42.2025.04.14.15.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 15:01:51 -0700 (PDT)
From: Yacov Simhony <ysimhony@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yacov Simhony <ysimhony@gmail.com>
Subject: [PATCH] hwmon: acpi_power_meter: replace deprecated strcpy() with strscpy()
Date: Mon, 14 Apr 2025 18:01:44 -0400
Message-ID: <20250414220145.4111-1-ysimhony@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use strscpy() instead of strcpy() to prevent potential buffer overflows
in acpi_device_name() and acpi_device_class(), which point to fixed-size
buffers.

This change improves safety and aligns with current kernel cleanup efforts.

Signed-off-by: Yacov Simhony <ysimhony@gmail.com>
---
 drivers/hwmon/acpi_power_meter.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 29ccdc2fb..a64497ddb 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -890,8 +890,12 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	resource->sensors_valid = 0;
 	resource->acpi_dev = device;
 	mutex_init(&resource->lock);
-	strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
-	strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
+	strscpy(acpi_device_name(device), 
+		ACPI_POWER_METER_DEVICE_NAME,
+	        MAX_ACPI_DEVICE_NAME_LEN);
+	strscpy(acpi_device_class(device), 
+		ACPI_POWER_METER_CLASS,
+		MAX_ACPI_CLASS_NAME_LEN);
 	device->driver_data = resource;
 
 #if IS_REACHABLE(CONFIG_ACPI_IPMI)
-- 
2.47.0

