Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025519F424;
	Sat,  8 Feb 2025 05:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991830; cv=none; b=AH3PXsIU1p3ixezgXcowHXfuC1ZkzTZAhjy1kJrdyWf1Hz11nVGJKtA//z+y1LUMt0wQ9HlxNAuiIMfYIORQum1O4ZZwhfhlUy1xTVrN+nFoRar8o3fQsNMOttA5YdgL4OoPRhfVJBq3UDVX2p85ElGyH/pvQzPJLc0P2wi3VXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991830; c=relaxed/simple;
	bh=1Anp77FcN7bxOnMpEO+v5PROUi84UI4+cUCYiiJdw64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyn48un0z3dkW+SBxJaQJCn4VfAweVWcTo2GCJe8X/J4DqRzf0gdw2KzTB2TlMDko++xj1fBVnJXSEHv59/naadagohEExzw6kP8cEM5DB5Zrq46wMaRwjS08ls8tX/ukzamdF0BeD6c7wckPHK9aEqtN5zxfeIhSSuEs9cFYoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRiMC5Yd; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRiMC5Yd"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e589c258663so2932288276.1;
        Fri, 07 Feb 2025 21:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991827; x=1739596627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYJ506aWVCpMesdUlUZdBnyCzfpI5labEdaE/TF9xbw=;
        b=mRiMC5YdizYYvbWoS7cmoJJ0D66UK/CXeaq5DGzMpzs0h7Z2LfOQzEgkFrECmV+mnF
         pT2iPR7gC7Mc7abLCsh79tHsped46Amy2slL6SsdfDmdvgbdlLyUfMLj9pVbdzSYxm8a
         JbpYW9uonNWbcvJO7md2T4Skfo+iwMHnbK1/57XpOthczi01lDk2EnpQcEE1JYH2bt77
         lp8k4iYE2vL4xvOfbvaDGynSghROowSar0wcqst1Ygcg41BVSta8xp37QFZKV8HSepCg
         KHi/Cj1hE92ZmA8uuCyF7c0tAnyhrwRoFO3yffoaBk9dHQOAuVJirbBm3DCLBEzS8J+N
         BYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991827; x=1739596627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYJ506aWVCpMesdUlUZdBnyCzfpI5labEdaE/TF9xbw=;
        b=n9vXVyWcrG4ONDhQM41dQdT5ndAUOmRdd38dRmbat175sX88VOyspkAv4ngXqVv+9d
         SLZQV36MbC4Spc8xr/FklTkSLsEd7he/Pf34PH7ADy83wwtBvJNOSWxotIalsYUurV1h
         h5ui5VZfbXGfCkBFbxF7gqvB3AnA5sU08MWDZJSlOJkQ9uMyhycWCacpF5+CDnnf5vka
         VXXCMje2QUBLtxxtMlXnH0XEAD+9yCwTdyaThwOzHaLIaB/ZE09Cd8f/bKoJAXj3jimX
         kNojQjamdeEaZQqE0Noe6wF+bPStPzeChvxSMKQsVHSRNZsxvo4oALkOkNAx1V5/1+Ko
         xhHA==
X-Forwarded-Encrypted: i=1; AJvYcCUytafs0XAahBTrbhuGuD6awZ9jgipFbOOkl2O8beFpZpfTBWmtjHmGUrqyCTRkBastcjnYAxvwMKoA2XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQhSH4xFPtFP7rNwk7YUyDy3dB60LgUdYuYq6fspPqO+RfZp1t
	/Ing/Eue+I9TxW1Uz5k3nYO6S93iGKQ96IYZ66hCab0YVSV0ocFh
X-Gm-Gg: ASbGncvyL6Hf7VXksaGoaR7B98BnK6eQupI8cgkzmmQw+00g9FB2lvHBTlnsJqQ16T4
	Ma3h1zoLW82RDuD1Tt4xmaMh4CCP3N7Y/bIUTl66jdlsLEjFYfCGKCSPOL/nOhb2c2u+UxlW07S
	/Yl36v8JoHDPQZzYX52ehqiXSbznArX4ctRzAqYd6PF+JLIS5mFajv+B9Jhi4KTuKBKQVV9II7s
	529c/cdI5UQl5TXiqlVYXaXULOfvAb0ncXxy2GvHVdU298FH6Gp6xJz4cgNk1rd8tuDhqTP8O53
	/04Ad6V6qpU9sZtFoZnkNRU=
X-Google-Smtp-Source: AGHT+IHTbBgxymXKR89/yBx9fqLWG3XQhHJ2DfMSVkyLPisTDv0BD9O1uzxW0Wo+qfnLZYdctR7WAQ==
X-Received: by 2002:a05:6902:1b90:b0:e5a:e774:d238 with SMTP id 3f1490d57ef6-e5b4616c69dmr5400693276.2.1738991827389;
        Fri, 07 Feb 2025 21:17:07 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:17:06 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/10] platform/x86: alienware-wmi-wmax: Add HWMON support
Date: Sat,  8 Feb 2025 00:16:11 -0500
Message-ID: <20250208051614.10644-8-kuurtb@gmail.com>
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

All models with the "AWCC" WMAX device support monitoring fan speed and
temperature sensors. Expose this feature through the HWMON interface.

Sensor readings are cached for 1 second before refreshing them to
mitigate the performance cost of calling WMI methods.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Kconfig             |   1 +
 .../platform/x86/dell/alienware-wmi-wmax.c    | 341 ++++++++++++++++++
 2 files changed, 342 insertions(+)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index f8a0dffcaab7..85a57c01aaad 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -43,6 +43,7 @@ config ALIENWARE_WMI_WMAX
 	bool "Alienware WMAX WMI device driver"
 	default y
 	depends on ALIENWARE_WMI
+	depends on HWMON
 	select ACPI_PLATFORM_PROFILE
 	help
 	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep and
diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 0d31156f43bb..5f02da7ff25f 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -11,9 +11,13 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/dmi.h>
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
 #include <linux/moduleparam.h>
+#include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/platform_profile.h>
+#include <linux/units.h>
 #include <linux/wmi.h>
 #include "alienware-wmi.h"
 
@@ -26,6 +30,7 @@
 #define WMAX_METHOD_BRIGHTNESS			0x3
 #define WMAX_METHOD_ZONE_CONTROL		0x4
 
+#define AWCC_METHOD_GET_FAN_SENSORS		0x13
 #define AWCC_METHOD_THERMAL_INFORMATION		0x14
 #define AWCC_METHOD_THERMAL_CONTROL		0x15
 #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
@@ -36,6 +41,10 @@
 #define AWCC_THERMAL_MODE_MASK			GENMASK(3, 0)
 #define AWCC_RESOURCE_ID_MASK			GENMASK(7, 0)
 
+static bool force_hwmon;
+module_param_unsafe(force_hwmon, bool, 0);
+MODULE_PARM_DESC(force_hwmon, "Force probing for HWMON support without checking if the WMI backend is available");
+
 static bool force_platform_profile;
 module_param_unsafe(force_platform_profile, bool, 0);
 MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
@@ -45,16 +54,19 @@ module_param_unsafe(force_gmode, bool, 0);
 MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
 
 struct awcc_quirks {
+	bool hwmon;
 	bool pprof;
 	bool gmode;
 };
 
 static struct awcc_quirks g_series_quirks = {
+	.hwmon = true,
 	.pprof = true,
 	.gmode = true,
 };
 
 static struct awcc_quirks generic_quirks = {
+	.hwmon = true,
 	.pprof = true,
 	.gmode = false,
 };
@@ -152,9 +164,17 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 	},
 };
 
+enum AWCC_GET_FAN_SENSORS_OPERATIONS {
+	AWCC_OP_GET_TEMP_SENSOR_ID		= 0x02,
+};
+
 enum AWCC_THERMAL_INFORMATION_OPERATIONS {
 	AWCC_OP_GET_SYSTEM_DESCRIPTION		= 0x02,
 	AWCC_OP_GET_RESOURCE_ID			= 0x03,
+	AWCC_OP_GET_TEMPERATURE			= 0x04,
+	AWCC_OP_GET_CURRENT_RPM			= 0x05,
+	AWCC_OP_GET_MIN_RPM			= 0x08,
+	AWCC_OP_GET_MAX_RPM			= 0x09,
 	AWCC_OP_GET_CURRENT_PROFILE		= 0x0B,
 };
 
@@ -177,6 +197,11 @@ enum AWCC_SPECIAL_THERMAL_CODES {
 	AWCC_SPECIAL_PROFILE_GMODE		= 0xAB,
 };
 
+enum AWCC_TEMP_SENSOR_TYPES {
+	AWCC_TEMP_SENSOR_CPU			= 0x01,
+	AWCC_TEMP_SENSOR_GPU			= 0x06,
+};
+
 enum awcc_thermal_profile {
 	AWCC_PROFILE_USTT_BALANCED,
 	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
@@ -213,6 +238,23 @@ struct wmax_u32_args {
 	u8 arg3;
 } __packed;
 
+struct awcc_fan_channel_data {
+	u8 id;
+	u32 state;
+	u32 min_rpm;
+	u32 max_rpm;
+	u8 temp_sensor;
+	u64 timestamp;
+	struct mutex lock; /* protects state and timestamp */
+};
+
+struct awcc_temp_channel_data {
+	u8 id;
+	u32 state;
+	u64 timestamp;
+	struct mutex lock; /* protects state and timestamp */
+};
+
 struct awcc_priv {
 	struct wmi_device *wdev;
 	union {
@@ -228,6 +270,10 @@ struct awcc_priv {
 
 	struct device *ppdev;
 	u8 supported_profiles[PLATFORM_PROFILE_LAST];
+
+	struct device *hwdev;
+	struct awcc_temp_channel_data *temp_data;
+	struct awcc_fan_channel_data *fan_data;
 };
 
 static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PROFILE_LAST] = {
@@ -492,6 +538,18 @@ static int __awcc_wmi_command(struct wmi_device *wdev, u32 method_id,
 	return 0;
 }
 
+static inline int awcc_get_fan_sensors(struct wmi_device *wdev, u8 fan_id, u32 *out)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_GET_TEMP_SENSOR_ID,
+		.arg1 = fan_id,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+
+	return __awcc_wmi_command(wdev, AWCC_METHOD_GET_FAN_SENSORS, &args, out);
+}
+
 static inline int awcc_thermal_information(struct wmi_device *wdev, u8 operation,
 					   u8 arg, u32 *out)
 {
@@ -562,6 +620,276 @@ static inline int awcc_op_get_resource_id(struct wmi_device *wdev, u8 index, u32
 	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
 }
 
+/*
+ * HWMON
+ *  - Provides temperature and fan speed monitoring as well as manual fan
+ *    control
+ */
+static int awcc_hwmon_update_temp(struct wmi_device *wdev,
+				  struct awcc_temp_channel_data *data)
+{
+	u32 temp;
+	int ret;
+
+	lockdep_assert_held(data->lock);
+
+	if (time_is_after_jiffies64(data->timestamp + secs_to_jiffies(1)))
+		return 0;
+
+	ret = awcc_thermal_information(wdev, AWCC_OP_GET_TEMPERATURE, data->id,
+				       &temp);
+	if (ret)
+		return ret;
+
+	data->state = temp * MILLIDEGREE_PER_DEGREE;
+	data->timestamp = get_jiffies_64();
+
+	return 0;
+}
+
+static int awcc_hwmon_update_fan(struct wmi_device *wdev,
+				 struct awcc_fan_channel_data *data)
+{
+	u32 rpm;
+	int ret;
+
+	lockdep_assert_held(data->lock);
+
+	if (time_is_after_jiffies64(data->timestamp + secs_to_jiffies(1)))
+		return 0;
+
+	ret = awcc_thermal_information(wdev, AWCC_OP_GET_CURRENT_RPM, data->id,
+				       &rpm);
+	if (ret)
+		return ret;
+
+	data->state = rpm;
+	data->timestamp = get_jiffies_64();
+
+	return 0;
+}
+
+static umode_t awcc_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	const struct awcc_priv *priv = drvdata;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < priv->temp_count)
+			return 0444;
+
+		break;
+	case hwmon_fan:
+		if (channel < priv->fan_count)
+			return 0444;
+
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int awcc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	struct awcc_temp_channel_data *temp;
+	struct awcc_fan_channel_data *fan;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		temp = &priv->temp_data[channel];
+
+		switch (attr) {
+		case hwmon_temp_input:
+			mutex_lock(&temp->lock);
+			ret = awcc_hwmon_update_temp(priv->wdev, temp);
+			mutex_unlock(&temp->lock);
+			if (ret)
+				return ret;
+
+			*val = temp->state;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		break;
+	case hwmon_fan:
+		fan = &priv->fan_data[channel];
+
+		switch (attr) {
+		case hwmon_fan_input:
+			mutex_lock(&fan->lock);
+			ret = awcc_hwmon_update_fan(priv->wdev, fan);
+			mutex_unlock(&fan->lock);
+			if (ret)
+				return ret;
+
+			*val = fan->state;
+			break;
+		case hwmon_fan_min:
+			*val = fan->min_rpm;
+			break;
+		case hwmon_fan_max:
+			*val = fan->max_rpm;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int awcc_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				  u32 attr, int channel, const char **str)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	u8 temp_id;
+
+	switch (type) {
+	case hwmon_temp:
+		temp_id = priv->temp_data[channel].id;
+
+		switch (temp_id) {
+		case AWCC_TEMP_SENSOR_CPU:
+			*str = "CPU";
+			break;
+		case AWCC_TEMP_SENSOR_GPU:
+			*str = "GPU";
+			break;
+		default:
+			*str = "Unknown";
+			break;
+		}
+
+		break;
+	case hwmon_fan:
+		temp_id = priv->fan_data[channel].temp_sensor;
+
+		switch (temp_id) {
+		case AWCC_TEMP_SENSOR_CPU:
+			*str = "Processor Fan";
+			break;
+		case AWCC_TEMP_SENSOR_GPU:
+			*str = "Video Fan";
+			break;
+		default:
+			*str = "Unknown Fan";
+			break;
+		}
+
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops awcc_hwmon_ops = {
+	.is_visible = awcc_hwmon_is_visible,
+	.read = awcc_hwmon_read,
+	.read_string = awcc_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info * const awcc_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_LABEL | HWMON_T_INPUT,
+			   HWMON_T_LABEL | HWMON_T_INPUT,
+			   HWMON_T_LABEL | HWMON_T_INPUT
+			   ),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX
+			   ),
+	NULL
+};
+
+static const struct hwmon_chip_info awcc_hwmon_chip_info = {
+	.ops = &awcc_hwmon_ops,
+	.info = awcc_hwmon_info,
+};
+
+static int awcc_hwmon_init(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
+	u32 id, temp_sensor, min_rpm, max_rpm;
+	int ret;
+
+	priv->fan_data = devm_kcalloc(&wdev->dev, priv->fan_count,
+				      sizeof(*priv->fan_data), GFP_KERNEL);
+	if (!priv->fan_data)
+		return -ENOMEM;
+
+	priv->temp_data = devm_kcalloc(&wdev->dev, priv->temp_count,
+				       sizeof(*priv->temp_data), GFP_KERNEL);
+	if (!priv->temp_data)
+		return -ENOMEM;
+
+	for (u32 i = 0; i < priv->fan_count; i++) {
+		/*
+		 * Fan IDs are listed first at offset 0
+		 */
+		ret = awcc_op_get_resource_id(wdev, i, &id);
+		if (ret)
+			return ret;
+
+		ret = awcc_thermal_information(wdev, AWCC_OP_GET_MIN_RPM, id,
+					       &min_rpm);
+		if (ret)
+			return ret;
+
+		ret = awcc_thermal_information(wdev, AWCC_OP_GET_MAX_RPM, id,
+					       &max_rpm);
+		if (ret)
+			return ret;
+
+		ret = awcc_get_fan_sensors(wdev, id, &temp_sensor);
+		if (ret)
+			return ret;
+
+		priv->fan_data[i].id = FIELD_GET(AWCC_RESOURCE_ID_MASK, id);
+		priv->fan_data[i].min_rpm = min_rpm;
+		priv->fan_data[i].max_rpm = max_rpm;
+		priv->fan_data[i].temp_sensor = temp_sensor;
+		ret = devm_mutex_init(&wdev->dev, &priv->fan_data[i].lock);
+		if (ret)
+			return ret;
+	}
+
+	for (u32 i = 0; i < priv->temp_count; i++) {
+		/*
+		 * Temperature sensors IDs are listed after the fan IDs at
+		 * offset `fan_count`
+		 */
+		ret = awcc_op_get_resource_id(wdev, i + priv->fan_count, &id);
+		if (ret)
+			return ret;
+
+		priv->temp_data[i].id = FIELD_GET(AWCC_RESOURCE_ID_MASK, id);
+		ret = devm_mutex_init(&wdev->dev, &priv->temp_data[i].lock);
+		if (ret)
+			return ret;
+	}
+
+	priv->hwdev = devm_hwmon_device_register_with_info(
+		&wdev->dev, "alienware_wmi", priv, &awcc_hwmon_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(priv->hwdev);
+}
+
 /*
  * Thermal Profile control
  *  - Provides thermal profile control through the Platform Profile API
@@ -734,6 +1062,12 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
+	if (awcc->hwmon) {
+		ret = awcc_hwmon_init(wdev);
+		if (ret)
+			return ret;
+	}
+
 	if (awcc->pprof) {
 		ret = awcc_platform_profile_init(wdev);
 		if (ret)
@@ -814,6 +1148,13 @@ int __init alienware_wmax_wmi_init(void)
 	if (id)
 		awcc = id->driver_data;
 
+	if (force_hwmon) {
+		if (!awcc)
+			awcc = &empty_quirks;
+
+		awcc->hwmon = true;
+	}
+
 	if (force_platform_profile) {
 		if (!awcc)
 			awcc = &empty_quirks;
-- 
2.48.1

