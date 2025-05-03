Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20E1FAA;
	Sat,  3 May 2025 23:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746313382; cv=none; b=ey0NiUU8I987tdaRkaauSq7jcCzju+Jc9V+FEy+Dcr+T0d/s3+RnGA13SwduYaGkCHTggBtsi47I+wBciSFf6m5LTIhi83iue03vzA2iBjpVbWWN9nzgwWs22J7x6uyGHXjgk9gcoyxqYVwzjPAObTNExIyfK1Ahjvw9SCYuTEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746313382; c=relaxed/simple;
	bh=Ze/ucH/TJIDtmTnwnUkyCVTHkjlJt8F4eCnpOypYzXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8MnMa9Y5kyr4f8pFfBhHnNNKdyXZs9h/sjNFuItkgpStCMDouAidkIzF61Jnxghajjo3Ecejwt/OBEzIAtlDGcVWcCJifcjMJP/AP3fpxhfaCMBOFdYwN5HRNucgvhNi8p4sjeyLPrHmQDenc4S3Ci4dr/lf6JERDhyBVC+iSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLiB81Ft; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLiB81Ft"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39efc1365e4so1416681f8f.1;
        Sat, 03 May 2025 16:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746313379; x=1746918179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlHKqKUaOYpS5+aBx+GgXRJ1qdQccLtNIy7hEaMpn7Q=;
        b=mLiB81Ft4A+MgU8Bk3SW1/MjxiTmeuagwJBlLRT6vmvyM94GCmEM7xMkJTDFZ2aEn3
         xYQDyq0Elwv0Ojd8NXzD/eaeNQABg1SKAr+BvHmIXTuqq6JSc4LRHW4NlyZH+IK9KOKZ
         nb2bOy3A6tE4KIvHr5bUgFKu3m/TmMLcjInRGz2Rh40woPKHgp59qW5jMux/MEc7/ylq
         YdKa9BVYohN5stFylWx6wEzfivhIVrNbl6eFxIp2l9u4wxllH30WgX4Gohif9cbWazjB
         PnBZBtrm9QIbsjstA/jh5wr+mCqoOdscdUsNrH2tBgd/+qR2YAFZ1u6FWyd7T5NsFFR7
         ae/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746313379; x=1746918179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlHKqKUaOYpS5+aBx+GgXRJ1qdQccLtNIy7hEaMpn7Q=;
        b=Evud+LmOZ8GslAaJRqhaRnv9U50RyWzDOtgmkuXAzkVky6syvkd/B2890vHJ8iAv46
         WjvDF/bB1YtlK0kaKm4uG93a1a76Avph2K4NPX/WgOr9IR/MzTCWlk8ZbkSHzV8OBV0M
         f2SMWt0V99/C1USt5CW1Jsfcq10IR16E9bB37HFMCU2gCItAZQ/qzADIg8/O28boB2vA
         Tze7NO9zhGQdVwJPEWShe+oEpcHJPAVZnsCEdB5oKvwDsNx2IWkFrfsCGVGB/MMbnSNv
         ks+UL2XfcXVePyD29JNhlZYTDlg7lLXKcr4pPjdUsOx10J07OSSPtC89cFqDV718tUoU
         ot3A==
X-Forwarded-Encrypted: i=1; AJvYcCUY5uY/fu4qgQvyeRt7mbX8nG2ebK35mPTCpYXnbjgmnwu8whmtpbXxzhwuyK9SZ8noEjjoKGDZYKGn3vir@vger.kernel.org, AJvYcCVQK3GE/qq4BATTmdTQAy+dHEpO5aea8e2IbDDtwekfdqhYHjn99L9YXkhnpkhBmG9b8C5GebweaM4=@vger.kernel.org, AJvYcCXelIn0k4YpFxXzMs2JSZaWVTnhT1ea64SwIuWN2x55ZRdKW9L/4jDgucm7SRrCCzwj0Dd3ZKU89cdRnzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZBQUukDXCe0qbTIZpGafK03NpF7acDXrsdzDuolY5sDUHWzz
	1uJ0kExHYcuW141PTsmYnqZRHUEoNU3JQYU7fSUcSwFuqt7LmY3vvzIJD8pONJ0=
X-Gm-Gg: ASbGnctA+STEDmMECklvFy5FlL/AVb+7QNYl/acCcFTEGjH4/cb+fwjO20A37Y4eV/h
	B5MO0GYRb/SI39S5kP3uWxUCyAROvVcekNm5vukyYWabUdYQEZEquk+WFLxKcHCq7P35cjvif+5
	aCu22yn4KW3hwZmktJ83PLM+XuiqIF7+W6xBeBEQBil7MmOc5mzArAMFdxjdASSA7CJvsOJx/us
	0X1zn8I1Im+6QXvUtnIfw0SmILcJLAiTrBjS1BhbLqqDHbT7fu7pHy5UbfB7gMw9AcVm2z4Vl/C
	4ddePKEOuuZsMwIDeLe0lPSbnLt0K0QAD+XKttbF+FTm7djyIj+uAOLa7w==
X-Google-Smtp-Source: AGHT+IHkqW08MGO8FsSu58uDyOJe87EkK3pwda6LZu/QU05GvHZvgkOsUCyPLD0s4ki5roHaN7On1A==
X-Received: by 2002:a05:6000:4304:b0:39f:e7b:2c87 with SMTP id ffacd0b85a97d-3a099adcdcfmr4716263f8f.29.1746313378572;
        Sat, 03 May 2025 16:02:58 -0700 (PDT)
Received: from puma.museclub.art ([185.189.115.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0c25sm6015860f8f.17.2025.05.03.16.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 16:02:57 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: pkarc <ivanchojara@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (ausus-ec-sensors) add MAXIMUS VI HERO.
Date: Sun,  4 May 2025 01:00:06 +0200
Message-ID: <20250503230020.1005801-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: pkarc <ivanchojara@gmail.com>

Add support for MAXIMUS VI HERO.

Signed-off-by: pkarc <ivanchojara@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 3f5a2d1ffe65..816d1f9947ea 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -4,6 +4,7 @@ Kernel driver asus_ec_sensors
 =================================
 
 Supported boards:
+ * MAXIMUS VI HERO
  * PRIME X470-PRO
  * PRIME X570-PRO
  * PRIME X670E-PRO WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 964673c67597..e0a95197c71b 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -313,6 +313,15 @@ struct ec_board_info {
 	enum board_family family;
 };
 
+static const struct ec_board_info board_info_maximus_vi_hero = {
+	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
+		SENSOR_FAN_CPU_OPT | SENSOR_FAN_WATER_FLOW,
+	.mutex_path = ACPI_GLOBAL_LOCK_PSEUDO_PATH,
+	.family = family_intel_300_series,
+};
+
 static const struct ec_board_info board_info_prime_x470_pro = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
@@ -527,6 +536,8 @@ static const struct ec_board_info board_info_tuf_gaming_x670e_plus = {
 	}
 
 static const struct dmi_system_id dmi_table[] = {
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("MAXIMUS VI HERO",
+					&board_info_maximus_vi_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME X470-PRO",
 					&board_info_prime_x470_pro),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME X570-PRO",
-- 
2.49.0

