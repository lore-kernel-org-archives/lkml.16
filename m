Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0BB21420A;
	Wed, 28 May 2025 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429256; cv=none; b=TKszv73P6Zu7oGWF34yUZMrCOgJCrrFlI2Qx0VPpvsdymXQJHFNak2f87zWAplAdoCYgJqWh/Y45uMFpM4b1rDmcw+4cDVF4jbD5TbzsHKjQoAbvQtK/0GZew8/zzbiQ5+4u93QsLTxFqpYfkENt7kap8tgswkTL1wUvqaUljcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429256; c=relaxed/simple;
	bh=omHnnaMYiI3z9v7a0i+pY5TrO643XV25EVbm5T9UU9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J+PHJQGN7/oJ7Jwh7u5DxpqXhJ8y71PXCiJRm2bmdfuyvF159opMNAyEC77razS0h2LRLtc3Xz2btjShStNwavMydY+OGTfEWXThGtEF5D+9udcPQDoLrRTeKZDDKyQw8b55K7y8huUnZHH8Ki9Loez92TTMOc961ysmC3t5bw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgH3ylZs; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgH3ylZs"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e5962a0f20so423775137.1;
        Wed, 28 May 2025 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748429253; x=1749034053; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Grhradj8SMvIxpwrClEy7uZGD8VCYzZE/q2hkCqHoBU=;
        b=GgH3ylZsY1GQ1ohyNKoUag6Ob7QpSUxNvW4y4wJu7fC5OptwunSG7Af0PGfd7t8CiO
         valihaqy/LmVbkdK7r+I1On1VKHWSkVwxQxKy3157hg66k2fcck9Pqd+vlC6yhnPLd10
         gQ0MUihNt9Vt++xUpeOtKs5JRgxPy6JoK2hviqZHgonsylFrkOlWT1TtUdIy4dsxTzPa
         yO4nHRebyZPe0LnJgTxL874e5Y1vp0c0oEUiEjLHnGCMfnOq4ZZa1H+oJ0FpR6hGjtop
         vlyvzstc/Xv/RcdnTnmNTf3+JiLCU4cx5kjqWMn2FuVqqHsXz4VfyP4fGz7oygMK2CqV
         xZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429253; x=1749034053;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Grhradj8SMvIxpwrClEy7uZGD8VCYzZE/q2hkCqHoBU=;
        b=Pobt0X5xL/9JA9hDrdoUakllcRp0kC23srXFf0TazRjoDB3JvH92tHGlHqkMMLIaOQ
         rNYGdXjJffTnBnh1dmnQ6E5UPf5/TM9jGR794uQiBGjSu9DYorPDWYEVB3iJIwFDrbaU
         j2yMa/mzUMysctuP7Df8C1oghFAEOFVFl0FUvMaiA2UFycOck7LktJxUu9f9Xj5izkWu
         PB9sMob8EpPsI7Lwx7gMdc8aXBopjIsJtmAUF2A0fHokYA2GaPG+ThhGlS+39CEIBnZp
         7Y0ycWCmpk2S+C9BGEyHWFWK1cAD8dk3lYTuVu1IhffQtZf8rxyY6A9D0RlSnlMcRrHx
         SLdw==
X-Forwarded-Encrypted: i=1; AJvYcCXDI4eCBhZLOXlsFxPKemPKFFzGcB0tU3nyAL6aAsMRO9AM5UyFzJeFYrhk8JDiGPJLCDeNtY/EsQeXS0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgScRV18b0m1ct/YxpomrSInpas0FOQON1I+2i7SZP/qgfJ6Ab
	S1CKmm1Pqgygw9/yFsOg7MjginvELADOoyjB8syKL569zwTtHp6rMKvw
X-Gm-Gg: ASbGncszMl+zpbsHVCuS9sGvQjOSZsHkCCvXhRka6Mmm1AHiBt6p0kQd2zPOHWDIct3
	6qamNozmItFDtL1ACx89YNAdSMVLfpZjhEkqI+tl3lxJUDCbO9bdlkwCvZhZyXedeg2O3+VaaOg
	Oh6mSQ0djT8gCdzAmxu+QQ82/rniYISZ0qqHsSgVTVLxdaqk1LXYy/nB6Z1yNrwwYBmQDHJTwCA
	7Myu880py9UOMPoJnQLRfnGXHOODU14WKA0jopwmL4ZQhmk0/1rWGd0cghNSm04lMpIS6qMp/c8
	t2tuPpENazgA5Iau7Qd/CFReAFhKKZk2loywL32MUdvnzae8yg==
X-Google-Smtp-Source: AGHT+IG3jiwFDZejGjn5cDhMvMWPN2GDQ0kGzRZAjjWTxC6fDs3vGHmBHjnbXZOMxKvdco7ORGa8mA==
X-Received: by 2002:a05:6102:5126:b0:4e4:5e11:6848 with SMTP id ada2fe7eead31-4e45e116d65mr7117269137.23.1748429253248;
        Wed, 28 May 2025 03:47:33 -0700 (PDT)
Received: from [192.168.1.26] ([181.85.227.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e59fc12830sm550404137.2.2025.05.28.03.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:47:32 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 28 May 2025 07:47:22 -0300
Subject: [PATCH] platform/x86: alienware-wmi-wmax: Add appropriate labels
 to fans
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-awcc-labels-v1-1-6aa39d8e4c3d@gmail.com>
X-B4-Tracking: v=1; b=H4sIALnpNmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyML3cTy5GTdnMSk1JxiXWNzI0MzI1Nzo8QUcyWgjoKi1LTMCrBp0bG
 1tQApgUGiXQAAAA==
X-Change-ID: 20250528-awcc-labels-372162572ad7
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4448; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=omHnnaMYiI3z9v7a0i+pY5TrO643XV25EVbm5T9UU9w=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlmLw9FVnFM7OnQfN9/wTSPzaxmZt7H+wfvp199+GjSL
 e1tk3XudpSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEppczMhzRTbl8LJ/z0Txl
 kexw2V4jzmULc3dmXCmUDMvgtDzrvZeRYXPQtYMZj6/OeqKwkmXfcQUr3f0WJTybBBQTvV/uyQ0
 8xw4A
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add known fan type IDs and match them to an appropriate label in
awcc_hwmon_read_string().

Additionally, add the AWCC_TEMP_SENSOR_FRONT type, which was inferred
from it's related fan type in supported systems.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 100 ++++++++++++++++---------
 1 file changed, 63 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index c42f9228b0b255fe962b735ac96486824e83945f..b25eb3225d8e5385384880a9cb480aaf3cb4d0a8 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -273,9 +273,29 @@ enum AWCC_SPECIAL_THERMAL_CODES {
 
 enum AWCC_TEMP_SENSOR_TYPES {
 	AWCC_TEMP_SENSOR_CPU			= 0x01,
+	AWCC_TEMP_SENSOR_FRONT			= 0x03,
 	AWCC_TEMP_SENSOR_GPU			= 0x06,
 };
 
+enum AWCC_FAN_TYPES {
+	AWCC_FAN_CPU_1				= 0x32,
+	AWCC_FAN_GPU_1				= 0x33,
+	AWCC_FAN_PCI				= 0x34,
+	AWCC_FAN_MID				= 0x35,
+	AWCC_FAN_TOP_1				= 0x36,
+	AWCC_FAN_SIDE				= 0x37,
+	AWCC_FAN_U2_1				= 0x38,
+	AWCC_FAN_U2_2				= 0x39,
+	AWCC_FAN_FRONT_1			= 0x3A,
+	AWCC_FAN_CPU_2				= 0x3B,
+	AWCC_FAN_GPU_2				= 0x3C,
+	AWCC_FAN_TOP_2				= 0x3D,
+	AWCC_FAN_TOP_3				= 0x3E,
+	AWCC_FAN_FRONT_2			= 0x3F,
+	AWCC_FAN_BOTTOM_1			= 0x40,
+	AWCC_FAN_BOTTOM_2			= 0x41,
+};
+
 enum awcc_thermal_profile {
 	AWCC_PROFILE_USTT_BALANCED,
 	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
@@ -314,7 +334,6 @@ struct wmax_u32_args {
 
 struct awcc_fan_data {
 	unsigned long auto_channels_temp;
-	const char *label;
 	u32 min_rpm;
 	u32 max_rpm;
 	u8 suspend_cache;
@@ -896,6 +915,9 @@ static int awcc_hwmon_read_string(struct device *dev, enum hwmon_sensor_types ty
 		case AWCC_TEMP_SENSOR_CPU:
 			*str = "CPU";
 			break;
+		case AWCC_TEMP_SENSOR_FRONT:
+			*str = "Front";
+			break;
 		case AWCC_TEMP_SENSOR_GPU:
 			*str = "GPU";
 			break;
@@ -906,7 +928,46 @@ static int awcc_hwmon_read_string(struct device *dev, enum hwmon_sensor_types ty
 
 		break;
 	case hwmon_fan:
-		*str = priv->fan_data[channel]->label;
+		switch (priv->fan_data[channel]->id) {
+		case AWCC_FAN_CPU_1:
+		case AWCC_FAN_CPU_2:
+			*str = "CPU Fan";
+			break;
+		case AWCC_FAN_GPU_1:
+		case AWCC_FAN_GPU_2:
+			*str = "GPU Fan";
+			break;
+		case AWCC_FAN_PCI:
+			*str = "PCI Fan";
+			break;
+		case AWCC_FAN_MID:
+			*str = "Mid Fan";
+			break;
+		case AWCC_FAN_TOP_1:
+		case AWCC_FAN_TOP_2:
+		case AWCC_FAN_TOP_3:
+			*str = "Top Fan";
+			break;
+		case AWCC_FAN_SIDE:
+			*str = "Side Fan";
+			break;
+		case AWCC_FAN_U2_1:
+		case AWCC_FAN_U2_2:
+			*str = "U.2 Fan";
+			break;
+		case AWCC_FAN_FRONT_1:
+		case AWCC_FAN_FRONT_2:
+			*str = "Front Fan";
+			break;
+		case AWCC_FAN_BOTTOM_1:
+		case AWCC_FAN_BOTTOM_2:
+			*str = "Bottom Fan";
+			break;
+		default:
+			*str = "Unknown Fan";
+			break;
+		}
+
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -1051,40 +1112,6 @@ static int awcc_hwmon_temps_init(struct wmi_device *wdev)
 	return 0;
 }
 
-static char *awcc_get_fan_label(unsigned long *fan_temps)
-{
-	unsigned int temp_count = bitmap_weight(fan_temps, AWCC_ID_BITMAP_SIZE);
-	char *label;
-	u8 temp_id;
-
-	switch (temp_count) {
-	case 0:
-		label = "Independent Fan";
-		break;
-	case 1:
-		temp_id = find_first_bit(fan_temps, AWCC_ID_BITMAP_SIZE);
-
-		switch (temp_id) {
-		case AWCC_TEMP_SENSOR_CPU:
-			label = "Processor Fan";
-			break;
-		case AWCC_TEMP_SENSOR_GPU:
-			label = "Video Fan";
-			break;
-		default:
-			label = "Unknown Fan";
-			break;
-		}
-
-		break;
-	default:
-		label = "Shared Fan";
-		break;
-	}
-
-	return label;
-}
-
 static int awcc_hwmon_fans_init(struct wmi_device *wdev)
 {
 	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
@@ -1138,7 +1165,6 @@ static int awcc_hwmon_fans_init(struct wmi_device *wdev)
 		fan_data->id = id;
 		fan_data->min_rpm = min_rpm;
 		fan_data->max_rpm = max_rpm;
-		fan_data->label = awcc_get_fan_label(fan_temps);
 		bitmap_gather(gather, fan_temps, priv->temp_sensors, AWCC_ID_BITMAP_SIZE);
 		bitmap_copy(&fan_data->auto_channels_temp, gather, BITS_PER_LONG);
 		priv->fan_data[i] = fan_data;

---
base-commit: 9c96808f10d84156b5e98e16176b725ec5a1386f
change-id: 20250528-awcc-labels-372162572ad7
-- 
 ~ Kurt

