Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A9C1B6D0F;
	Sat,  8 Feb 2025 05:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991833; cv=none; b=rb+kvV+/PJRzh+XyoFazMI96Bl/BAp21DWOXsdPNiMgrwr+8Lh28OPR+cq6ydvlNrr77YcoOw2e4b/4fBsb0aMk6O35yZyJeUYiUm7FKlecSml8csORoWluHAIgsbQcwg7MGruX9+rZ5BsIGe+YBB5SYA1qwW8uccfn8DVxBMeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991833; c=relaxed/simple;
	bh=Twen0jVCoMYxUM9BpY9R0VcejpmIG3T5HQXJkM8Rp/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWqbStbkDVivmq1I43qupFbMKPfI3+Pf5Kb5BR1/QvECzr4VbuCZckpHj6R21RE8rYyoPrdBNJSa58c0kOSdowcv5cbTdRVgVcVO3+0rwkYgu1j4NbCbMLEDxWVmh3hQIGVfYj1EQ+N/GI+caQaIROZ19MzCY7z7i2RoPV9khlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iShDXW2b; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iShDXW2b"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e53c9035003so1999082276.2;
        Fri, 07 Feb 2025 21:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991829; x=1739596629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYttPlgEcN4Cf6Au1A4MigyPKR+OwvlvZlYPz13VZbc=;
        b=iShDXW2bjnfPd0u5FJnIkR9tG95OYRD8NLpIyQR9iOGHdPD/CQtv8rJ20dvV9/Ecle
         yA0ViMXYDwlIgca6BNts7MgZ20dIbC2Tewujcj8S4nAzjNFTL2NH1UYFVE4GVk92cFno
         bRar0h3PUKko8UE2sFNo6c28mbXMZ9jyVE0+kdDf9ly/URja2W9i3aic+HiWiQ8pf3E1
         bulFpM1GzQyCi5wgE/1aqpcN3fzKJivIe2xYz4dg2Oe7+D36tzGyeslbrqGM13D54pKM
         NMv4o7r4HkI95roz0juNoukvlxbqvKhOP7JpV77jR9mWFACzr1ndtG0U+5kqlE6eZp7o
         JW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991829; x=1739596629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYttPlgEcN4Cf6Au1A4MigyPKR+OwvlvZlYPz13VZbc=;
        b=is03rKK0zzbdjCuRMiSgV/iDjOWtYT/1otT30hHQ9gmZGKTC67dhz0JvW9jnVHp9Xa
         Qpv1JSHP0xcMTABKspMpTXwc6xGr6Wt/k/aDGlTFIONE07yBaldwDSWiY+IQoiJTx1wt
         IE15MUPSJPoMI4MW7txhL0AI/qwBmfoTK842ab4i7EHyNfORXCdCcuGBxwqSddz22esh
         MA7YCYmkBnZGwKeL4NHe4TvLSjUrv62q03gd5DQXqgQ1WrvojDy17t7q2E/bv+C43bgh
         Nd7wCNt5YXVahkK42WKQDRGbEiBVi1deLoZwAeE4wX4Rgmk9YH0VEW+zfKIHsUVuVmae
         Gx2w==
X-Forwarded-Encrypted: i=1; AJvYcCXxq8L4DPfFiN+Ud3SNjBXdxJoyBelouR6oC99uvKGBnCCLmpNheo6ddUYVsVXjE+INeQp0Ne6fsvfRElE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNyq5YQDbBSXEnlHJ0zmIKfWgt/x/M/2UPEtWgQT71ynnP/Ko
	oVTUNh1bkiSVvSXcORNgLDWvAoK60/6gZx5i90nJ4l8ncS/QGbeeyoO37Q==
X-Gm-Gg: ASbGncvOgcqmMJLTMVu/bzyQy92Y4xnAv+7ThPk8+zSU8KKo4PAwzC66aUdS0VzHa0B
	UiQ3LlmOmGJX1haWm3arje22pcB52Kjd48zuT/dLE9WCwEnn1MsnBOWJXgDTIIcxLhP7RRHMDw9
	3y24XFlEFsSXhVOuS+JqPE4NstvZ33VIR3oPaIhuf5WaPFdBl2W4x+3oLAuWh6vEittbvARxSDE
	HU/5k+daCV2U+wbMynb2yj6CkIM27unhiquQi3opEJB5NbW1zLsTaFASeT9XZwCvwFblTbvaLXQ
	Z3g7Eh2sse2P3xOni41iing=
X-Google-Smtp-Source: AGHT+IGfrdTfXOcobn8spbJ8oKTLLA/9qdZPw+dFY5zcizCfwfjRoZpktVFxLC6ZGM2sxEqwtVmWtg==
X-Received: by 2002:a5b:c:0:b0:e5b:53ec:69e0 with SMTP id 3f1490d57ef6-e5b53ec6c32mr1879327276.40.1738991829396;
        Fri, 07 Feb 2025 21:17:09 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:17:09 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/10] platform/x86: alienware-wmi-wmax: Add support for manual fan control
Date: Sat,  8 Feb 2025 00:16:12 -0500
Message-ID: <20250208051614.10644-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208051614.10644-1-kuurtb@gmail.com>
References: <20250208051614.10644-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All models with the "AWCC" WMAX device support a way of manually
controlling fans.

The PWM duty cycle of a fan can't be controlled directly. Instead the
AWCC interface let's us tune a PWM `boost` value, which has the
following empirically discovered behavior over the PWM value:

	pwm = pwm_base + (pwm_boost / 255) * (pwm_max - pwm_base)

Where the pwm_base is the locked PWM value controlled by the EC and
pwm_boost is a value between 0 and 255.

This pwm_boost knob is exposed as a standard `pwm` attribute.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-wmax.c    | 55 +++++++++++++++++--
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 5f02da7ff25f..06d6f88ea54b 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -13,6 +13,7 @@
 #include <linux/dmi.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
+#include <linux/minmax.h>
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
 #include <linux/overflow.h>
@@ -176,10 +177,12 @@ enum AWCC_THERMAL_INFORMATION_OPERATIONS {
 	AWCC_OP_GET_MIN_RPM			= 0x08,
 	AWCC_OP_GET_MAX_RPM			= 0x09,
 	AWCC_OP_GET_CURRENT_PROFILE		= 0x0B,
+	AWCC_OP_GET_FAN_BOOST			= 0x0C,
 };
 
 enum AWCC_THERMAL_CONTROL_OPERATIONS {
 	AWCC_OP_ACTIVATE_PROFILE		= 0x01,
+	AWCC_OP_SET_FAN_BOOST			= 0x02,
 };
 
 enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
@@ -563,12 +566,13 @@ static inline int awcc_thermal_information(struct wmi_device *wdev, u8 operation
 	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
 }
 
-static inline int awcc_thermal_control(struct wmi_device *wdev, u8 profile)
+static inline int awcc_thermal_control(struct wmi_device *wdev, u8 operation,
+				       u8 arg1, u8 arg2)
 {
 	struct wmax_u32_args args = {
-		.operation = AWCC_OP_ACTIVATE_PROFILE,
-		.arg1 = profile,
-		.arg2 = 0,
+		.operation = operation,
+		.arg1 = arg1,
+		.arg2 = arg2,
 		.arg3 = 0,
 	};
 	u32 out;
@@ -684,6 +688,11 @@ static umode_t awcc_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_type
 		if (channel < priv->fan_count)
 			return 0444;
 
+		break;
+	case hwmon_pwm:
+		if (channel < priv->fan_count)
+			return 0644;
+
 		break;
 	default:
 		break;
@@ -698,6 +707,7 @@ static int awcc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	struct awcc_priv *priv = dev_get_drvdata(dev);
 	struct awcc_temp_channel_data *temp;
 	struct awcc_fan_channel_data *fan;
+	u32 fan_boost;
 	int ret;
 
 	switch (type) {
@@ -742,6 +752,16 @@ static int awcc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			return -EOPNOTSUPP;
 		}
 
+		break;
+	case hwmon_pwm:
+		fan = &priv->fan_data[channel];
+
+		ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_FAN_BOOST,
+					       fan->id, &fan_boost);
+		if (ret)
+			return ret;
+
+		*val = fan_boost;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -796,10 +816,27 @@ static int awcc_hwmon_read_string(struct device *dev, enum hwmon_sensor_types ty
 	return 0;
 }
 
+
+static int awcc_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	u8 fan_id = priv->fan_data[channel].id;
+
+	switch (type) {
+	case hwmon_pwm:
+		return awcc_thermal_control(priv->wdev, AWCC_OP_SET_FAN_BOOST,
+					    fan_id, (u8)clamp_val(val, 0, 255));
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static const struct hwmon_ops awcc_hwmon_ops = {
 	.is_visible = awcc_hwmon_is_visible,
 	.read = awcc_hwmon_read,
 	.read_string = awcc_hwmon_read_string,
+	.write = awcc_hwmon_write,
 };
 
 static const struct hwmon_channel_info * const awcc_hwmon_info[] = {
@@ -814,6 +851,12 @@ static const struct hwmon_channel_info * const awcc_hwmon_info[] = {
 			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
 			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX
 			   ),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT
+			   ),
 	NULL
 };
 
@@ -954,8 +997,8 @@ static int awcc_platform_profile_set(struct device *dev,
 		}
 	}
 
-	return awcc_thermal_control(priv->wdev,
-				    priv->supported_profiles[profile]);
+	return awcc_thermal_control(priv->wdev, AWCC_OP_ACTIVATE_PROFILE,
+				    priv->supported_profiles[profile], 0);
 }
 
 static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
-- 
2.48.1

