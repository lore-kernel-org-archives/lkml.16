Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2842520B218;
	Sat,  7 Jun 2025 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749292001; cv=none; b=EdPTDlLOLOsFSkZ85oIiDMnOtMEYNNPVW2PaFfpu5UKsj23Q9ti3tPCwL+6fu2zzKjgiJ7hocZG2W1KEuRE6Va0JnRmNHYy0MX1OC4tk/WkESMdFEKjO9oyq52JUvXuOX0hCpdLa2Rr7upcIwpUA/WSpLwO6UsvkUrWxrQ93K04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749292001; c=relaxed/simple;
	bh=xhWjKQ8VDK+b3VbtdhQAl8fVROrwhjeRh5V49FGDdSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KV28x7y3kXPnFDD64kkp+I13Nl+o6EN64TMSYo8+CCt3T0LLdWw98OlAsfE+NYywr55ppXB0TnBOQhBXt7DYguo7ZfLgl/yasJ79LDbkVFOZe26Y+KvDc+SMYXPeAiLEOsatfUirO+D58lNzKX4PkActunnTXySZcVYsKaBPIlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEJnFlye; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEJnFlye"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so1721335f8f.0;
        Sat, 07 Jun 2025 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749291998; x=1749896798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8kMnH4MMHk5QRxG66Od//k1SzcWeydGzVk2zl6BYx08=;
        b=JEJnFlyePfwY+jfl4MCEs0ShxGO8UvWsWQGTOUziwVWhKGy4zYKC9MGXLr4NsAPZOb
         umaoSTZAt06O3JDOWdRMIg8zzMgWJI2jYSob1X9bbvgXaI2ii7W8x+0psrmMqozg5VtG
         yHUThPyb55ML/EHOexgKHb6roc1BcRlXXZkzkq2C/KQeKj616nt9bUvWri6W3JDYMpYn
         KdR9x9dn0g+cpGdsYIFSIiVuzzDweWtjHH+TBTNA1Xp30tA4NjNBYqTT/tCjcX7ux76y
         y5aeItnqeoAmkofmI/vFNHbF32VL2jJIxwR3T7ZsQOcvRWG4BYiy0kq5M4qTg9ypCfjx
         BQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749291998; x=1749896798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kMnH4MMHk5QRxG66Od//k1SzcWeydGzVk2zl6BYx08=;
        b=JdFZoBt4K/BOhoTRANMxxfHpi5R1u50ou6NorTlzMrE9XlNmouaQM3kcEP3VRtzJ1y
         Zo3zWVxzXBOJ/R7L6pZlh4sbsQMraMF+vzD3pTAE9ac6v38KrVWfCHT7mbhA2fHlL73R
         7ozWzYdb046SLQD8Aprx7tS/PTUvif84f7F6GioCxEQWWvRWDs4mVI87VYBmUuvstOHZ
         qIqWarGcJIv+AGETvAh3bCab/9ixNakL+0NdCRG4jwL/UMh7JN80kZTCC1ujLIrDRoX4
         vtFkEK+AatvNVn8YKoKsZ0FKMShh6rS0Awq4wa6c7U8QTHvEpc2Yj+KAACRE0vG5ar+M
         eamQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKatDut4+i719g6NDbBnMgGp/pBsoqjaxCoHmriFywMhu6rZD2XBYjedufw1tB33KRKyH8GUqYsVs619lZ@vger.kernel.org, AJvYcCUeVVS2WhMyg5eE0lQE91UJV9824d3ccmGmm34Er2hJW17slelRH3EwdBXK2I5YOahKAkeP1nQbyYM=@vger.kernel.org, AJvYcCV4Q0xn6vjCSQzMsBRxpifRiK9A8i7MHdi4aJm8BM9Z2cW1bHpCfUyDuG7SWq2KtBXJZc/zihfeiOXKwsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwikEm16ZyHhqlYdHcs02xtW/fPD9afYRfXk9X/2J7rR7Lm8u
	BCzKDla0Kmoqn48ecM5raEDAPp1P4EbFAK3SLx2jNG1zacIDIjqjymKA
X-Gm-Gg: ASbGncsWR86GVa4Xnz7rJn7Y5i1r1rIImzIqw7aP776/4hpb+B5s5lMI//vl72qEfIA
	bFETYwSzL4ejdwb5Cs6vAyU5AcyinPb7zWLhSvFQo6ZAnvktN4Qeiq4YY8d4MCHbIcp/sHTHabU
	VOtPrKh+x/q4G/umtk0ewWcoiNsPzTcfqb2bIYbBgKZ1IqAM2OrF0+rd14t4+du+Cmfj3mAcGs/
	pqluQ3eDKZA2FdIJ7QouiAIWepZRhahWz4nmHUrQeooLGqbJ5iH+w24MbPDKywKWqK6xoeaUZAF
	P9Ap8Ed3HkQ8BYizn5MrrpTUIDmqPJw0x/tKyMRa0o5qVUz750OqWyLYXss5xIE4C1V+7RwRBqD
	tvvW1oEIWuWlihGiuS2IhS3T66yKORYqQRetBkzr6drz6g3xLwZIG+w==
X-Google-Smtp-Source: AGHT+IGDU4BpgZ+v+ZeR2Se3v6PPEanjAJJR9kff7FpbE/7rfV7Lly9gG/GELi3rza45Cr90WLoUTg==
X-Received: by 2002:a5d:64e7:0:b0:3a4:f902:3872 with SMTP id ffacd0b85a97d-3a531cab757mr5178306f8f.19.1749291998211;
        Sat, 07 Jun 2025 03:26:38 -0700 (PDT)
Received: from puma.museclub.art (p200300cf9f0587008b7592e367d28d7e.dip0.t-ipconnect.de. [2003:cf:9f05:8700:8b75:92e3:67d2:8d7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435771sm4395732f8f.63.2025.06.07.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 03:26:37 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ProArt X870E-CREATOR WIFI
Date: Sat,  7 Jun 2025 12:26:14 +0200
Message-ID: <20250607102626.9051-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the ProArt X870E-CREATOR WIFI board.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 28 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 502b0faf3b31..de2f2985f06f 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -11,6 +11,7 @@ Supported boards:
  * Pro WS X570-ACE
  * ProArt X570-CREATOR WIFI
  * ProArt X670E-CREATOR WIFI
+ * ProArt X870E-CREATOR WIFI
  * ProArt B550-CREATOR
  * ROG CROSSHAIR VIII DARK HERO
  * ROG CROSSHAIR VIII HERO (WI-FI)
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index c3d5bcbd63f8..4ac554731e98 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -165,6 +165,7 @@ enum board_family {
 	family_amd_400_series,
 	family_amd_500_series,
 	family_amd_600_series,
+	family_amd_800_series,
 	family_intel_300_series,
 	family_intel_400_series,
 	family_intel_600_series
@@ -260,6 +261,20 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
 		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
 };
 
+static const struct ec_sensor_info sensors_family_amd_800[] = {
+	[ec_sensor_temp_cpu] = EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x30),
+	[ec_sensor_temp_cpu_package] =
+		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
+	[ec_sensor_temp_mb] =
+		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
+	[ec_sensor_temp_vrm] =
+		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
+	[ec_sensor_temp_t_sensor] =
+		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
+	[ec_sensor_fan_cpu_opt] =
+		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
+};
+
 static const struct ec_sensor_info sensors_family_intel_300[] = {
 	[ec_sensor_temp_chipset] =
 		EC_SENSOR("Chipset", hwmon_temp, 1, 0x00, 0x3a),
@@ -377,6 +392,14 @@ static const struct ec_board_info board_info_pro_art_x670E_creator_wifi = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_pro_art_x870E_creator_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
+	.mutex_path = ACPI_GLOBAL_LOCK_PSEUDO_PATH,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_pro_art_b550_creator = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -575,6 +598,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_pro_art_x570_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt X670E-CREATOR WIFI",
 					&board_info_pro_art_x670E_creator_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt X870E-CREATOR WIFI",
+					&board_info_pro_art_x870E_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt B550-CREATOR",
 					&board_info_pro_art_b550_creator),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS X570-ACE",
@@ -1087,6 +1112,9 @@ static int asus_ec_probe(struct platform_device *pdev)
 	case family_amd_600_series:
 		ec_data->sensors_info = sensors_family_amd_600;
 		break;
+	case family_amd_800_series:
+		ec_data->sensors_info = sensors_family_amd_800;
+		break;
 	case family_intel_300_series:
 		ec_data->sensors_info = sensors_family_intel_300;
 		break;
-- 
2.49.0

