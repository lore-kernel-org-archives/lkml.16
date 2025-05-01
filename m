Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6E518C930;
	Thu,  1 May 2025 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105632; cv=none; b=NniKJrvEtzgTZxM+p19Za0p+VLXeiEgn0JoPMrnoruC8tCsqCCKbnweEQxDK4I+4suMilHZyo2YAyL29TdI7adAx1T9pJepZMjA3BXnBonsgOXdstqIlVPafhQ31Pfo4U/D6im0e8MJ3P6+e/6S5YhSNEKjhL5Avctcn8TdFYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105632; c=relaxed/simple;
	bh=MtVg8fuq/9r6k2wGDwg4q3xVzRBBS8NE1+olQpEU+V0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2YxfiG7FAKV5YeGippV3y64rqp4gqCKeg5LLeny+vIAwc6Z2W9jta0Vt5jEOz9io3arv17UYLhdn+pid1JyyeiMwpy7uRMKdybxVdg8fpla93mg+Q1V+IJBFm2MHUUXYOkgzM0dkBDfYi5iCg+5jDYMe7G3Lfc/j5Wo6yI4gJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efL02ZL2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efL02ZL2"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so150859066b.1;
        Thu, 01 May 2025 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746105629; x=1746710429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjG0/ucPJF9AdchtoF8RS69llkGomO6ho0P4112sXhA=;
        b=efL02ZL2tzQH1qmwFPpFcwNhew5Hszu+OPrlHNK3Df1X2HFq+HyeYtVBOWgvXm4/nM
         SBQy3WKf0DsejEDrwAHS2gzMrE8SfoWJd8lceqKv4HYnDpN4nml5ECXFghwdMgkhynqw
         ePr6RgEfW00J0HOvFM7SQUWH475+0NTihBC1SzOZxKwmvZ6/eLMQsQP+mtAJzSTlH0gC
         pjeXHqw6D2fNv4To01xvYEf6WZ5bEItJ6+7mO0lYeONhWQR5f8L2fCMkHp/d4/W4krYs
         uY29rz6nsM3Lyx9j2N2TA9vjjPGnp7WvPxjhWzYcqgmoiy3oih2LVz42B/LpB3K6S6vr
         rSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746105629; x=1746710429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjG0/ucPJF9AdchtoF8RS69llkGomO6ho0P4112sXhA=;
        b=Uj7vElAdroZi7o2BaLYt8lxSkATGszhMh7kPAr9C06HmgWebJ3G9lTGTSPsgXL3Ty6
         mzVDPCrSTINnepFP1Wor+581KS7ItLkM3wWQAE/YFEVBt5WsEprqp22GaaFMWDgw3Zwj
         UZVh+tVc6rSWgwRZfNyWqeynhKINxnaMWR8Obx+ZW1HvkPmwKvBcDOBgEN8D4/cTxQZ0
         VS6SpwN5aQtSCtLeSojOeCOZ1BI1AEHbOPgJtwEiEtrE14pI3mlsIv/gIrIXO1ivGmtE
         3V6dn15M1PX3pKwnUZjyOxMSl621IxW2sBMZd5Xr28WjiF2DZfQ02ftsy3VZHeD5tmKQ
         OP5w==
X-Forwarded-Encrypted: i=1; AJvYcCV7r0rDVjfyF716jIMvncZN3kgGZbvlB5bHOL0pu9puXoe9Wx4tPhF1IO9GlpFCbgxO3Oms6Lxl/TFEiCk=@vger.kernel.org, AJvYcCVTjZ0asmf71yUw2iQKKXxIPom51zaj4TXPTBQeyztYKgCIcHAnXpKTJN8Ck1ThO+1IVnkkzUV2GvQpTBgt@vger.kernel.org, AJvYcCWL9ZxnK/yDYkm/IxNq9h4ax62RvXnog32xRQuI1DETeX7yEJTCjbF3zpa8ZsPpMdE2GnIsLDgYRJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjL7j1SMrPpjxze1FQVJck2QS+p44ivScixw17DwYfXd+89ehn
	EMFTEIzKLIyHm1NbdmdoBSSl3q1dt+Ro99Zfw26boL3HBCXmIXaP5pT2QneU
X-Gm-Gg: ASbGncvitjoTXihPxJGnvpzoTFmrOBwxqH8+qQtEe8YpWHMo9JVVT7Z8Qdw7Jb20u0D
	UNf/1UG3ok6mvF+KY+8v5QDtQ4YCLNflKPW2y5LqhDMBUnHlSwLeiTyETi04OH8i2y8vZpTYgBN
	GXdm0eOQbi0I4JMkFwXukQYitfNmZU4EqpZjDI/zpgLgDcpA3ZredxNf91LAox/HfyFF56TvAdV
	su30diHgoaAikQCmpXjuK59wdxg8uTxGk1As3Mb5X60EEUKngZvczkM41/Yfhefa41q05DawP4T
	F7fgfFSlqZYKY+fzBcAFX5sGopX+hg+7oHUBfzzrQ+rlSqUmYo/ouYk7dwfjmsTGaPYCtqfEkDX
	xy4CpiyWpBf6FchFexJr7uNlqXarxpaQOBSzv6/lFfrY=
X-Google-Smtp-Source: AGHT+IEmUuTseJ7DxZENipTf43v06YRvythvk+qYZutRBjDzblbIGx/unyPnTlamtx+UvKqbb2a85g==
X-Received: by 2002:a17:907:9706:b0:ac4:76e:cdc1 with SMTP id a640c23a62f3a-acee21abe09mr553651866b.21.1746105629057;
        Thu, 01 May 2025 06:20:29 -0700 (PDT)
Received: from puma.museclub.art (p200300cf9f403a007076fa4c1d18edfe.dip0.t-ipconnect.de. [2003:cf:9f40:3a00:7076:fa4c:1d18:edfe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af33sm38785166b.126.2025.05.01.06.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:20:28 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Daniel Grainger <dagr@live.ca>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z90 Formula.
Date: Thu,  1 May 2025 15:19:53 +0200
Message-ID: <20250501132009.726742-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Grainger <dagr@live.ca>

Board and chipset information is from LibreHardwareMonitor [1].

[1] https://github.com/LibreHardwareMonitor/LibreHardwareMonitor

Signed-off-by: Daniel Grainger <dagr@live.ca>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index d2be9db29614..3f5a2d1ffe65 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -20,6 +20,7 @@ Supported boards:
  * ROG CROSSHAIR X670E GENE
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
+ * ROG MAXIMUS Z690 FORMULA
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
  * ROG STRIX X570-E GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 7f2389db8923..d1f913762318 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -283,6 +283,14 @@ static const struct ec_sensor_info sensors_family_intel_600[] = {
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
 	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	[ec_sensor_fan_water_flow] =
+		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbe),
+	[ec_sensor_temp_water_in] =
+		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
+	[ec_sensor_temp_water_out] =
+		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
+	[ec_sensor_temp_water_block_in] =
+		EC_SENSOR("Water_Block_In", hwmon_temp, 1, 0x01, 0x02),
 };
 
 /* Shortcuts for common combinations */
@@ -407,6 +415,13 @@ static const struct ec_board_info board_info_maximus_xi_hero = {
 	.family = family_intel_300_series,
 };
 
+static const struct ec_board_info board_info_maximus_z690_formula = {
+	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
+	.family = family_intel_600_series,
+};
+
 static const struct ec_board_info board_info_crosshair_viii_impact = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
@@ -542,6 +557,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_maximus_xi_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO (WI-FI)",
 					&board_info_maximus_xi_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
+					&board_info_maximus_z690_formula),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VIII IMPACT",
 					&board_info_crosshair_viii_impact),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
-- 
2.49.0

