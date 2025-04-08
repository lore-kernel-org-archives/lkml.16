Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E2A2AE86;
	Tue,  8 Apr 2025 20:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145123; cv=none; b=Lufqx3m/2i/PC1+w82EXrbgtfAexRHXqo3Bv1HxUFTLor5nnoEN2t3VYvOGpMzLjt2KnyRdhPvMa4zFpQ6HlWlnQtloNyi6eWxOKoWlMw8hWa+B1nkLM7nC0meGsj28dk/je0X4RyLcpioImYUy8Yxu+wob/emeBTiVgQifuklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145123; c=relaxed/simple;
	bh=1bNz92khaSe4WMhhscdfBsFjURuC1gcvssQOQNGpYjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ArVpO/nW1gvSEHVLNdjlErdNE+x5qyg0IyU6aRDLzEEHdEQIKIDuoBAJDweHjETDPU0O1FOceEA5FU/XZDS3yI7sAaXsR1Za/0X1DkcJvYYefu4WZM3CS04ElOqdDnvf5c1YxJwjwNOz8ujb9R4TBwVaOkOR10FZy7WJokaW51U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki9q3AZR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki9q3AZR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf257158fso42643755e9.2;
        Tue, 08 Apr 2025 13:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744145119; x=1744749919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=omhZP3ALIIlr2e/LbZBz1i8GirHA+tc1abtfH/xxT/M=;
        b=Ki9q3AZRkCecnKPiu4B3J8z0f4wA3ux77Yp1b8WnVgLg0q0jsH8M5h8/73ueZ7XxrP
         AUvcC9KSYrN/ogEyaCJ+v65CqtkKkl3pHcEjI5/swx6/olqEqRZxYg9etl0pYTaIE6BO
         gLXCfgEl0r9Ir1X0IWLTXIybKkoa+YKXT1DUrvOdIFPQAU+dY4aGh9PhBbLld6YVZnCY
         Ad4FsDpm+ee0a314Z6tGpRKTxNZIe7bKXpXdIJCi42QPQZ0vLY31XQsy25ih817DrPwS
         hhn/11tfhE90CYcFAKOWkd3W0ZgLm9QBkSaVnJUsLwSxlaYpArILs4JVteNtEJR3fdue
         YRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145119; x=1744749919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omhZP3ALIIlr2e/LbZBz1i8GirHA+tc1abtfH/xxT/M=;
        b=q4uqk943UYYvW5zMJbt28xNruf08cZS2T02XR/1yoywA+9uCi0R6280NvxBlJWG2SH
         xQmpwR8aQlXSB97MIvKYOVacVlEXL1X7OcBJvKcrO6XdTLFIVOkoaWgP7PUtLk+D/NqI
         mWjg0xBtixbI66Qi0M3w8TFD0eW7y7eqcW3jsUVRA6lK4fIpIOp8TdLcoBNAaO4PKrst
         eewtukRCKNgdCxQDPq5qmo+ZKvC+XW7B6drdYtjTtMipemQPtUDrmBJPrHr4BQQNODHS
         8+5cUbeHrGwd8na8qIXr0FMJ2V+ITavqbXKFrenL8pXBVbFM7vTyQvTpSiwAzgmoQn4W
         O57Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx2+qJFfJDXpSWDLuqihYoSiNm5J8LE+1Fo1tt/z4KKgta7fOx1QfQTydxfmqJrHO0EQYhU9H564cWNw==@vger.kernel.org, AJvYcCW+ih63vxHgnYL1Fr5awci7oVmE0DJwxuz596p+GAdkIZdXUA7LDkVg6FmdRnZDWrLAQWw9Katoj6l2mOOL@vger.kernel.org
X-Gm-Message-State: AOJu0YybSY+CesWmRibyP3M5gTNgV1FUCv5XzLut+XjSLEoXWxpwh3Vn
	rChue19Sr4/LDhNL0pfzJdua2CPBaHXdoM/OiYmOg/KO/HBmQdzw
X-Gm-Gg: ASbGnctE5vQg7IvL32FiJf03JsGxhcaq/SXUF8q34RxIf1sVuCRWMXnOAVoF2qGECSY
	GesuYow7XCBzes7E/SRgEHl3SrBPvY4g868sKKKwqwB0c0sl2UG381+t5xe1+6GBDQOK2lUixM2
	9M2dBalwMO3C1BQSNNKmn764j2QRGq3ZpdQzM2uT+IGiu4u2JpbPb2rRsem7xOS62zG3RB6mpAF
	+coiTiL/DEqEF65TlMJKJiSrY3pwGGvceH62+r4JJUBKCmG0EyVmobEQ/KUNRyhCG+wy5noeLYb
	NeYaTW+uNhk5OTvFsLxBbIe4KQc+E70tOZhUVUxSHLjsNHX9I05NjRGTHhUqO7TyZ0O2NH44fex
	79GZ59g7v9ETTfe9Z3zl8+lRb2znaPIKALJUESZHEOKYg8JcuffOgx2HGSQ==
X-Google-Smtp-Source: AGHT+IEM4n/lgRB2B3BWnpgXUOcCM6lMw6L9Kn9Tr/16AUjgRht6FtU4JPrSapVivJcvJgcXfDkbkw==
X-Received: by 2002:a05:600c:1ca0:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-43f1ff39bebmr732195e9.25.1744145118952;
        Tue, 08 Apr 2025 13:45:18 -0700 (PDT)
Received: from puma.museclub.art (p200300cf9f403a007076fa4c1d18edfe.dip0.t-ipconnect.de. [2003:cf:9f40:3a00:7076:fa4c:1d18:edfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f11eaf4cdsm20265945e9.1.2025.04.08.13.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:45:18 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) sort sensor definition arrays
Date: Tue,  8 Apr 2025 22:44:57 +0200
Message-ID: <20250408204505.11412-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arrays have to be sorted by the sensor register bank and index
because this is what the sensor reading function expects. So sort them
and leave a comment for future contributors.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 006ced5ab6e6..ec428c5e97d4 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -169,7 +169,10 @@ enum board_family {
 	family_intel_600_series
 };
 
-/* All the known sensors for ASUS EC controllers */
+/* All the known sensors for ASUS EC controllers. These arrays have to be sorted
+ * by the full ((bank << 8) + index) register index (see asus_ec_block_read() as
+ * to why).
+*/
 static const struct ec_sensor_info sensors_family_amd_400[] = {
 	[ec_sensor_temp_chipset] =
 		EC_SENSOR("Chipset", hwmon_temp, 1, 0x00, 0x3a),
@@ -183,10 +186,10 @@ static const struct ec_sensor_info sensors_family_amd_400[] = {
 		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
 	[ec_sensor_in_cpu_core] =
 		EC_SENSOR("CPU Core", hwmon_in, 2, 0x00, 0xa2),
-	[ec_sensor_fan_cpu_opt] =
-		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xbc),
 	[ec_sensor_fan_vrm_hs] =
 		EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
+	[ec_sensor_fan_cpu_opt] =
+		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xbc),
 	[ec_sensor_fan_chipset] =
 		/* no chipset fans in this generation */
 		EC_SENSOR("Chipset", hwmon_fan, 0, 0x00, 0x00),
@@ -194,10 +197,10 @@ static const struct ec_sensor_info sensors_family_amd_400[] = {
 		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xb4),
 	[ec_sensor_curr_cpu] =
 		EC_SENSOR("CPU", hwmon_curr, 1, 0x00, 0xf4),
-	[ec_sensor_temp_water_in] =
-		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x0d),
 	[ec_sensor_temp_water_out] =
 		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x0b),
+	[ec_sensor_temp_water_in] =
+		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x0d),
 };
 
 static const struct ec_sensor_info sensors_family_amd_500[] = {
@@ -239,19 +242,20 @@ static const struct ec_sensor_info sensors_family_amd_500[] = {
 
 static const struct ec_sensor_info sensors_family_amd_600[] = {
 	[ec_sensor_temp_cpu] = EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x30),
-	[ec_sensor_temp_cpu_package] = EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
+	[ec_sensor_temp_cpu_package] =
+		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
 	[ec_sensor_temp_mb] =
 	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
 	[ec_sensor_temp_vrm] =
 		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
+	[ec_sensor_fan_cpu_opt] =
+		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 	[ec_sensor_temp_water_in] =
 		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
 	[ec_sensor_temp_water_out] =
 		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
-	[ec_sensor_fan_cpu_opt] =
-		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 };
 
 static const struct ec_sensor_info sensors_family_intel_300[] = {
-- 
2.49.0

