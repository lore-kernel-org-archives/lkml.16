Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5AA2192FB;
	Thu, 29 May 2025 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509351; cv=none; b=Ord4PchMtW3YJmT6WcqRK3cXrx+alQojHCXmuBF0zCVg4FlHQykc8O8z+8JynkPT/fjC+aSlBkHMS2ZmhlOVB1zA+ZVm+rlFXWeqifUwtoQ8wb2+iQIajo1pauFX9qB+tlSYFFR32rkE/C2BWBlGHC8Zpzw3R6DFi1EVOTMHzFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509351; c=relaxed/simple;
	bh=sMkdftC0+Tx/IZelfW2inRhlPRbTlYeUucKCNb7CRMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iuWRJ6Cc8KrHZu1U5MzTX8L5Pemcm+Gqa7l9g/8cN/lHIAbgJGbOt23URgCcZ1janGgRvWEghRcF44vPaGkyes1ZxFHNBA0YQH+yLCJVWxB8WYJe74zXCas+xfoubaQaKr23247KbqHpoArZ8cBkB4ouOqXkaO7+foXRNePqrqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNFiDfnm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNFiDfnm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so7263405e9.1;
        Thu, 29 May 2025 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748509348; x=1749114148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8AXfRWEnLXngbO6ozFx9Vdj+sRj7LpGEVmnez0nbKG8=;
        b=JNFiDfnmrDT7w1plt23ylGhR00wAkKHlbXfiMaCspLQKscn9bg4b3ML4nVae1XGPIk
         RCQeGUlSi/AG/Y85vnsjsB4Gv8OqubUCGRApEG6C8iVFPOek7mezRXLnaeMY3A6pq84Y
         dvV53si2iZqzXGCHXxXiH+0DjEWSMfQRp9wwk5lBjAd6xjwBvmIGlmhRF0LO5duyf3BT
         64JjINN+nfUKHss3Eqz8gq73qT2G5rV4qSh/zcwo54FaGgl/v4ecGrhnpUcMpyBcOIn6
         +fRjwbai9TfYj1WQmiOg0+bYR5Du1fFiOZ+8Mo3ynyrnwVI4Ztsunnuda5V2/ZWsNcN5
         FxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748509348; x=1749114148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AXfRWEnLXngbO6ozFx9Vdj+sRj7LpGEVmnez0nbKG8=;
        b=bOssOGdAiUmMhNFg+8T50+71K9CZpXa8zTQsbOyoXWgQzmE7gPt7Ifm6Has/p1JSFG
         9ubZscNiMSY9MCWDgLpX5c/Ko/9IBwrB9C4izN2MP9fMsI1tKryyk/bp63dw50alGYs8
         M0VPiITEtOr0f0y5i1CiprmE+WQvVXN5Yucjt6MRY6lesn7MW8eRJ/EecsES6CpIRlzy
         SfTVa0n/PfqZZ4s74S6mi3kwWfgGPgX28RxCwEs4gqePLNmTrheu2xLoCF4gbEPCwZRB
         TFXPvYldjY0xiCDYk+/w+cETRt4UlePt1PAwdRQAXaxOJiTM5g4hT+Y9bYVs0samjmpw
         k3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD8Oak8C3hyPujTQp7p5qQNtKuQvqlqftJUudaHp7Yc2PyN8Wt/2MTvV/w2YCaDykbafy9wulboHo=@vger.kernel.org, AJvYcCX3y+PRBK866Uc/7JHfNpBaMc0TulswOxt5u3vBFnrq/VXpuWnCkOvM6BzxJhn/oxYNmfNA339KUdCHKcu6@vger.kernel.org, AJvYcCXg+K1WHPCYjRF6OrC7h5eX+Al/u70kboWo37GnaWo1RwKbpnjF4Z1HH5EgVop/Qtu8/irK/jpug+CfmPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCAX6KtIlAq/QuE2pjIHzLHSGkDzq0k0kgJwNT/O4Gxj2AatJ+
	RlplPL1oo6k2nYIvJD2mqh6L3bV3JAnXayEWFJYU4i6Gil8NFs6f4Nc7
X-Gm-Gg: ASbGncsBOr44S/yeeusPcAiS1bL+VhN7tnS2YyYmgJn3/F0+eV8GPBpqMrVdnPuQkNq
	BzgryWv3UXZFmkqVdZ/TVWBoaQAvjBGN4zATCiIcbBtehnCLoBzOOH5Y+2PEODmfbuub0XeAWfc
	+ugIAcsc+G1cGLQKreBn880UCFTEmnogV7kMFLEWnBW69C1WTWJTdIFbDKcwmNTV8sI8i/TUD3i
	vaAhf+VMnUS/gUipqeckbbOSZ15E+S5qcimgSI173V8DNDZAZ6VOlHnEFvuL8AMEaDpxi2WVpzW
	SGbGaQld7Q5qh1l2PWM0pYN+Ckq6HWwro5JX7RE1GZRnJVYh2VELcVOpGgYLRR95SqrWYBPqmm3
	DcBIikE/EvNQ8hd89PIIZMVMHLf2xLZQNyejQGpXED+obknwGBewq1A==
X-Google-Smtp-Source: AGHT+IFS+6s+jXMSUM+bVy+Oz+xiERYfpm6I7yWMzURvuDDqqqnXdeEsGmmT/Co0X8obLIFaytbc0g==
X-Received: by 2002:a05:600c:3b25:b0:450:b240:aaab with SMTP id 5b1f17b1804b1-450d0566ea5mr13600055e9.8.1748509348003;
        Thu, 29 May 2025 02:02:28 -0700 (PDT)
Received: from puma.museclub.art (p200300cf9f4db30084345851a1a1c45b.dip0.t-ipconnect.de. [2003:cf:9f4d:b300:8434:5851:a1a1:c45b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc17a04sm14057565e9.24.2025.05.29.02.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:02:27 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Roy Seitz <royseitz@bluewin.ch>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add support for ROG STRIX Z490-F GAMING
Date: Thu, 29 May 2025 11:01:41 +0200
Message-ID: <20250529090222.154696-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roy Seitz <royseitz@bluewin.ch>

This adds support for the ROG STRIX Z490-F GAMING board.

Signed-off-by: Roy Seitz <royseitz@bluewin.ch>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 32 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 816d1f9947ea..502b0faf3b31 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -29,6 +29,7 @@ Supported boards:
  * ROG STRIX X570-F GAMING
  * ROG STRIX X570-I GAMING
  * ROG STRIX Z390-F GAMING
+ * ROG STRIX Z490-F GAMING
  * ROG STRIX Z690-A GAMING WIFI D4
  * ROG ZENITH II EXTREME
  * ROG ZENITH II EXTREME ALPHA
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index e0a95197c71b..c3d5bcbd63f8 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -166,6 +166,7 @@ enum board_family {
 	family_amd_500_series,
 	family_amd_600_series,
 	family_intel_300_series,
+	family_intel_400_series,
 	family_intel_600_series
 };
 
@@ -279,6 +280,20 @@ static const struct ec_sensor_info sensors_family_intel_300[] = {
 		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
 };
 
+static const struct ec_sensor_info sensors_family_intel_400[] = {
+	[ec_sensor_temp_chipset] =
+		EC_SENSOR("Chipset", hwmon_temp, 1, 0x00, 0x3a),
+	[ec_sensor_temp_cpu] = EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x3b),
+	[ec_sensor_temp_mb] =
+		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x3c),
+	[ec_sensor_temp_t_sensor] =
+		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
+	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	[ec_sensor_fan_cpu_opt] =
+		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
+	[ec_sensor_fan_vrm_hs] = EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
+};
+
 static const struct ec_sensor_info sensors_family_intel_600[] = {
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
@@ -498,6 +513,18 @@ static const struct ec_board_info board_info_strix_z390_f_gaming = {
 	.family = family_intel_300_series,
 };
 
+static const struct ec_board_info board_info_strix_z490_f_gaming = {
+	.sensors = SENSOR_TEMP_CHIPSET |
+		SENSOR_TEMP_CPU |
+		SENSOR_TEMP_MB |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM |
+		SENSOR_FAN_CPU_OPT |
+		SENSOR_FAN_VRM_HS,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX,
+	.family = family_intel_400_series,
+};
+
 static const struct ec_board_info board_info_strix_z690_a_gaming_wifi_d4 = {
 	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM,
 	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
@@ -586,6 +613,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x570_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
 					&board_info_strix_z390_f_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-F GAMING",
+					&board_info_strix_z490_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z690-A GAMING WIFI D4",
 					&board_info_strix_z690_a_gaming_wifi_d4),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG ZENITH II EXTREME",
@@ -1061,6 +1090,9 @@ static int asus_ec_probe(struct platform_device *pdev)
 	case family_intel_300_series:
 		ec_data->sensors_info = sensors_family_intel_300;
 		break;
+	case family_intel_400_series:
+		ec_data->sensors_info = sensors_family_intel_400;
+		break;
 	case family_intel_600_series:
 		ec_data->sensors_info = sensors_family_intel_600;
 		break;
-- 
2.49.0

