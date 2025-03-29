Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979AB1DD9D1;
	Sat, 29 Mar 2025 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233597; cv=none; b=X5y2TsFQeecmK/ZAqIV9RCdN+KGgOEkZneD9urtSUnD5DZxYDH16yUT1xTM9ed4J4gu6gKTWpyNe+BiIrV8Gp4tohRq4HRsF48lLeOHKQJs41F8M/vxCmWBrKsGSsy6Crp7imjUt/l2EU8onZJvAYlQYQfG+ci1IukwN5pkVFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233597; c=relaxed/simple;
	bh=tJPI6XY8+qOQsPMgCyIx1Nc0CbBjtIKADrwfxDwCSnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DylrgFReFboWsmWTwMxZ5xiji+XTB7fJzappWQG4o3kGdoG07rhRMQBpZnnKEmpdWVGXfueP8z+dpJlAQ/ho8f6ZojbDbZwQVnMHGqbLVGGMfSHHq8ufnya4LrUsFx8Z/2FG+FYL49jLxsMcB4AqPpS1yOZWzS3Rch+eQG8VLOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVIUE8pJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVIUE8pJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2279915e06eso64214965ad.1;
        Sat, 29 Mar 2025 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233594; x=1743838394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CzCk/+ZEkmYsZI5nEA5+PmPUTVAVE2lnIBa7jr4QLY=;
        b=bVIUE8pJlSGsC771FQZRAPiRGVPv+IRlW7F8sFDwFU5xqnYJifi5iyqtXrXdJAlrV9
         4Jmo2Rid+i6u7nVIwW+71F86m29JrEPCpb9+d4Ha50/qAm53prQD/pgO2hQj5d9XV+Zo
         kAuBxxxljDkQvrBCQSLc1P1aws5QArrbMLlVSUTNvFvTlA9sFSCVIoxNMrx4Kqn8lScT
         NdSr0pndorT90t/1SA0lgAFg7vb8wPHnWa3Yd8Gp4xzjxQ0WtF+tIrrXuJv2SvfDVqyr
         7L2+xLtwwE9xQaHh4dFi/noEcTrGR2Buj4UxnsqVoy5rh8OT4E2dEMFAuuIhU9u62sw0
         MnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233594; x=1743838394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CzCk/+ZEkmYsZI5nEA5+PmPUTVAVE2lnIBa7jr4QLY=;
        b=OQ2Wob1SgE3iS1Nut2skW9wCkZLb6uGrdsyGbINrpqI3uCgNP5E6b+cLEshyNPaY6F
         noI+ALjnEeItf32lQBRUEWnoV9cZaLtxu3wmuEbFfchQCirwJWDTqqGDUMRI5gihlHZT
         CT2iXBuKHA0A+WP52WWKK4f2p9tUn0PFghPOtEuz7xU3xxNePSVzLby0rNGZUyvL7KlE
         DxNjzqmWL2UfIRHtcYf2aWz5puArFf+ZqQ+cdlECe7qN/QHq8+git2QNmGC2riS6cmJJ
         8AwHsP4IfIfuPP17o/FyhPePsnOocpbrQ4ah7ihsjGhTCuIs/CJhmcUZDSSfjYnVGQup
         /0nw==
X-Forwarded-Encrypted: i=1; AJvYcCU1pEdGJNLbK5fwQBgXBO4UbzeSq5eJdfHfoBrz/JiXowb/CQFYljQI2dEY3fJ+9WF5PXhMTsbSCSm2BjbNp/Gap/54tQ==@vger.kernel.org, AJvYcCWs5yZXDMtuEh9nGxLobVwUIY07UvjuuOj6z3P6nqf9CtHju9TmwRLCkGPdqDELtNL9/TkCFYCeZ8kt2Ejm@vger.kernel.org, AJvYcCXYVwo+LZWM/tPVIx9CldlX6aTrNaqfSAuk9IKuPRrYGpX6zsfNaRoodgzvE0YAKjVeVH+EfWxJfOGE5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDh7mqB7TpFCfiahgbIxbfHJxPFJPnDOa40Jce+9uaeOVrElfw
	6rDQOgurQzd4NAZ5lTw6CPtwgCxeqCTF2/msmbHcPBGI8CyemV7x
X-Gm-Gg: ASbGncsC0ItoumREY3B5o+sJ/pADZ3Sn1HLK3AX5+Eawg2QJQkC559GKk1rlpE0+M7f
	6lu0rqmmKcKlMDWC49yXxUaDM0mNWsKUSUJnz8gN1FKKVLx1JqM+M8U6rIlHeUJCkyxiQd0Maue
	GYnTOFNT7xetSRj6r7MaKqnnAY79n+ZY7BNO2puMC+wilAxJUvQ5JBqPRXkp3jW3osOaEWWA9AD
	J9PPh8klzU4U5HuAnXGTlc9wwsWOuqwspZeb2eUxzjwGAdh+204iZ0okZ8a+R+iYQVlsoA2Jg99
	eF4XJLY7xNl8vRAhw4qVqeTbCx76orV5CSVvX1F3yH1f
X-Google-Smtp-Source: AGHT+IGlZBnBaps8SptGLe5hwUJwqD1sitC4IcUnJ11+3QvFWpylhvP+6zc4Nn9rUXarj/rKVvgI1w==
X-Received: by 2002:a17:902:d2d1:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-2292f95d8bdmr27841645ad.19.1743233593499;
        Sat, 29 Mar 2025 00:33:13 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:13 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:24 -0300
Subject: [PATCH v7 07/12] platform/x86: alienware-wmi-wmax: Add HWMON
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-hwm-v7-7-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
X-Mailer: b4 0.14.2

All models with the "AWCC" WMAX device support monitoring fan speed and
temperature sensors. Expose this feature through the HWMON interface.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Kconfig              |   1 +
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 396 +++++++++++++++++++++++++
 2 files changed, 397 insertions(+)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index f8a0dffcaab7c3b423472c5b9093011334a698c8..f7107b0c55f27c9be70f50b36dd2e7bab42a6960 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -22,6 +22,7 @@ config ALIENWARE_WMI
 	depends on DMI
 	depends on LEDS_CLASS
 	depends on NEW_LEDS
+	depends on HWMON
 	help
 	 This is a driver for controlling Alienware WMI driven features.
 
diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 5bf8264a1063b7d3310100d0edbfd0b9447dbe74..3fe0ac006657874614f906f1292751ffae213c48 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -10,10 +10,13 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/dmi.h>
+#include <linux/hwmon.h>
 #include <linux/moduleparam.h>
 #include <linux/platform_profile.h>
+#include <linux/units.h>
 #include <linux/wmi.h>
 #include "alienware-wmi.h"
 
@@ -26,6 +29,7 @@
 #define WMAX_METHOD_BRIGHTNESS			0x3
 #define WMAX_METHOD_ZONE_CONTROL		0x4
 
+#define AWCC_METHOD_GET_FAN_SENSORS		0x13
 #define AWCC_METHOD_THERMAL_INFORMATION		0x14
 #define AWCC_METHOD_THERMAL_CONTROL		0x15
 #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
@@ -40,6 +44,12 @@
 
 /* Arbitrary limit based on supported models */
 #define AWCC_MAX_RES_COUNT			16
+#define AWCC_ID_BITMAP_SIZE			(U8_MAX + 1)
+#define AWCC_ID_BITMAP_LONGS			BITS_TO_LONGS(AWCC_ID_BITMAP_SIZE)
+
+static bool force_hwmon;
+module_param_unsafe(force_hwmon, bool, 0);
+MODULE_PARM_DESC(force_hwmon, "Force probing for HWMON support without checking if the WMI backend is available");
 
 static bool force_platform_profile;
 module_param_unsafe(force_platform_profile, bool, 0);
@@ -50,16 +60,19 @@ module_param_unsafe(force_gmode, bool, 0);
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
@@ -157,9 +170,18 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 	},
 };
 
+enum AWCC_GET_FAN_SENSORS_OPERATIONS {
+	AWCC_OP_GET_TOTAL_FAN_TEMPS		= 0x01,
+	AWCC_OP_GET_FAN_TEMP_ID			= 0x02,
+};
+
 enum AWCC_THERMAL_INFORMATION_OPERATIONS {
 	AWCC_OP_GET_SYSTEM_DESCRIPTION		= 0x02,
 	AWCC_OP_GET_RESOURCE_ID			= 0x03,
+	AWCC_OP_GET_TEMPERATURE			= 0x04,
+	AWCC_OP_GET_FAN_RPM			= 0x05,
+	AWCC_OP_GET_FAN_MIN_RPM			= 0x08,
+	AWCC_OP_GET_FAN_MAX_RPM			= 0x09,
 	AWCC_OP_GET_CURRENT_PROFILE		= 0x0B,
 };
 
@@ -182,6 +204,11 @@ enum AWCC_SPECIAL_THERMAL_CODES {
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
@@ -218,6 +245,14 @@ struct wmax_u32_args {
 	u8 arg3;
 };
 
+struct awcc_fan_data {
+	unsigned long auto_channels_temp;
+	const char *label;
+	u32 min_rpm;
+	u32 max_rpm;
+	u8 id;
+};
+
 struct awcc_priv {
 	struct wmi_device *wdev;
 	union {
@@ -233,6 +268,10 @@ struct awcc_priv {
 
 	struct device *ppdev;
 	u8 supported_profiles[PLATFORM_PROFILE_LAST];
+
+	struct device *hwdev;
+	struct awcc_fan_data **fan_data;
+	unsigned long temp_sensors[AWCC_ID_BITMAP_LONGS];
 };
 
 static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PROFILE_LAST] = {
@@ -497,6 +536,19 @@ static int awcc_wmi_command(struct wmi_device *wdev, u32 method_id,
 	return 0;
 }
 
+static int awcc_get_fan_sensors(struct wmi_device *wdev, u8 operation,
+				u8 fan_id, u8 index, u32 *out)
+{
+	struct wmax_u32_args args = {
+		.operation = operation,
+		.arg1 = fan_id,
+		.arg2 = index,
+		.arg3 = 0,
+	};
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_GET_FAN_SENSORS, &args, out);
+}
+
 static int awcc_thermal_information(struct wmi_device *wdev, u8 operation, u8 arg,
 				    u32 *out)
 {
@@ -562,6 +614,30 @@ static int awcc_op_get_resource_id(struct wmi_device *wdev, u8 index, u8 *out)
 	return 0;
 }
 
+static int awcc_op_get_fan_rpm(struct wmi_device *wdev, u8 fan_id, u32 *out)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_GET_FAN_RPM,
+		.arg1 = fan_id,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
+}
+
+static int awcc_op_get_temperature(struct wmi_device *wdev, u8 temp_id, u32 *out)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_GET_TEMPERATURE,
+		.arg1 = temp_id,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
+}
+
 static int awcc_op_get_current_profile(struct wmi_device *wdev, u32 *out)
 {
 	struct wmax_u32_args args = {
@@ -587,6 +663,313 @@ static int awcc_op_activate_profile(struct wmi_device *wdev, u8 profile)
 	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &out);
 }
 
+/*
+ * HWMON
+ *  - Provides temperature and fan speed monitoring as well as manual fan
+ *    control
+ */
+static umode_t awcc_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	const struct awcc_priv *priv = drvdata;
+	unsigned int temp_count;
+
+	switch (type) {
+	case hwmon_temp:
+		temp_count = bitmap_weight(priv->temp_sensors, AWCC_ID_BITMAP_SIZE);
+
+		return channel < temp_count ? 0444 : 0;
+	case hwmon_fan:
+		return channel < priv->fan_count ? 0444 : 0;
+	case hwmon_pwm:
+		return channel < priv->fan_count ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int awcc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	const struct awcc_fan_data *fan;
+	u32 state;
+	int ret;
+	u8 temp;
+
+	switch (type) {
+	case hwmon_temp:
+		temp = find_nth_bit(priv->temp_sensors, AWCC_ID_BITMAP_SIZE, channel);
+
+		switch (attr) {
+		case hwmon_temp_input:
+			ret = awcc_op_get_temperature(priv->wdev, temp, &state);
+			if (ret)
+				return ret;
+
+			*val = state * MILLIDEGREE_PER_DEGREE;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		break;
+	case hwmon_fan:
+		fan = priv->fan_data[channel];
+
+		switch (attr) {
+		case hwmon_fan_input:
+			ret = awcc_op_get_fan_rpm(priv->wdev, fan->id, &state);
+			if (ret)
+				return ret;
+
+			*val = state;
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
+	case hwmon_pwm:
+		fan = priv->fan_data[channel];
+
+		switch (attr) {
+		case hwmon_pwm_auto_channels_temp:
+			*val = fan->auto_channels_temp;
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
+	u8 temp;
+
+	switch (type) {
+	case hwmon_temp:
+		temp = find_nth_bit(priv->temp_sensors, AWCC_ID_BITMAP_SIZE, channel);
+
+		switch (temp) {
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
+		*str = priv->fan_data[channel]->label;
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
+			   HWMON_T_LABEL | HWMON_T_INPUT,
+			   HWMON_T_LABEL | HWMON_T_INPUT,
+			   HWMON_T_LABEL | HWMON_T_INPUT,
+			   HWMON_T_LABEL | HWMON_T_INPUT
+			   ),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_LABEL | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX
+			   ),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_AUTO_CHANNELS_TEMP,
+			   HWMON_PWM_AUTO_CHANNELS_TEMP,
+			   HWMON_PWM_AUTO_CHANNELS_TEMP,
+			   HWMON_PWM_AUTO_CHANNELS_TEMP,
+			   HWMON_PWM_AUTO_CHANNELS_TEMP,
+			   HWMON_PWM_AUTO_CHANNELS_TEMP
+			   ),
+	NULL
+};
+
+static const struct hwmon_chip_info awcc_hwmon_chip_info = {
+	.ops = &awcc_hwmon_ops,
+	.info = awcc_hwmon_info,
+};
+
+static int awcc_hwmon_temps_init(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
+	unsigned int i;
+	int ret;
+	u8 id;
+
+	for (i = 0; i < priv->temp_count; i++) {
+		/*
+		 * Temperature sensors IDs are listed after the fan IDs at
+		 * offset `fan_count`
+		 */
+		ret = awcc_op_get_resource_id(wdev, i + priv->fan_count, &id);
+		if (ret)
+			return ret;
+
+		__set_bit(id, priv->temp_sensors);
+	}
+
+	return 0;
+}
+
+static char *awcc_get_fan_label(struct device *dev, u32 temp_count, u8 temp_id)
+{
+	char *label;
+
+	switch (temp_count) {
+	case 0:
+		label = "Independent Fan";
+		break;
+	case 1:
+		switch (temp_id) {
+		case AWCC_TEMP_SENSOR_CPU:
+			label = "Processor Fan";
+			break;
+		case AWCC_TEMP_SENSOR_GPU:
+			label = "Video Fan";
+			break;
+		default:
+			label = "Unknown Fan";
+			break;
+		}
+
+		break;
+	default:
+		label = "Shared Fan";
+		break;
+	}
+
+	return label;
+}
+
+static int awcc_hwmon_fans_init(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
+	unsigned long fan_temps[AWCC_ID_BITMAP_LONGS];
+	unsigned long gather[AWCC_ID_BITMAP_LONGS];
+	u32 min_rpm, max_rpm, temp_count, temp_id;
+	struct awcc_fan_data *fan_data;
+	unsigned int i, j;
+	char *label;
+	int ret;
+	u8 id;
+
+	for (i = 0; i < priv->fan_count; i++) {
+		fan_data = devm_kzalloc(&wdev->dev, sizeof(*fan_data), GFP_KERNEL);
+		if (!fan_data)
+			return -ENOMEM;
+
+		/*
+		 * Fan IDs are listed first at offset 0
+		 */
+		ret = awcc_op_get_resource_id(wdev, i, &id);
+		if (ret)
+			return ret;
+
+		ret = awcc_thermal_information(wdev, AWCC_OP_GET_FAN_MIN_RPM, id,
+					       &min_rpm);
+		if (ret)
+			return ret;
+
+		ret = awcc_thermal_information(wdev, AWCC_OP_GET_FAN_MAX_RPM, id,
+					       &max_rpm);
+		if (ret)
+			return ret;
+
+		ret = awcc_get_fan_sensors(wdev, AWCC_OP_GET_TOTAL_FAN_TEMPS, id,
+					   0, &temp_count);
+		if (ret)
+			return ret;
+
+		for (j = 0; j < temp_count; j++) {
+			ret = awcc_get_fan_sensors(wdev, AWCC_OP_GET_FAN_TEMP_ID,
+						   id, j, &temp_id);
+			if (ret)
+				break;
+
+			temp_id = FIELD_GET(AWCC_RESOURCE_ID_MASK, temp_id);
+			__set_bit(temp_id, fan_temps);
+		}
+
+		label = awcc_get_fan_label(&wdev->dev, temp_count, temp_id);
+		if (!label)
+			return -ENOMEM;
+
+		fan_data->id = id;
+		fan_data->min_rpm = min_rpm;
+		fan_data->max_rpm = max_rpm;
+		fan_data->label = label;
+		bitmap_gather(gather, fan_temps, priv->temp_sensors, AWCC_ID_BITMAP_SIZE);
+		bitmap_copy(&fan_data->auto_channels_temp, gather, BITS_PER_LONG);
+		priv->fan_data[i] = fan_data;
+
+		bitmap_zero(fan_temps, AWCC_ID_BITMAP_SIZE);
+	}
+
+	return 0;
+}
+
+static int awcc_hwmon_init(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
+	int ret;
+
+	priv->fan_data = devm_kcalloc(&wdev->dev, priv->fan_count,
+				      sizeof(*priv->fan_data), GFP_KERNEL);
+	if (!priv->fan_data)
+		return -ENOMEM;
+
+	ret = awcc_hwmon_temps_init(wdev);
+	if (ret)
+		return ret;
+
+	ret = awcc_hwmon_fans_init(wdev);
+	if (ret)
+		return ret;
+
+	priv->hwdev = devm_hwmon_device_register_with_info(&wdev->dev, "alienware_wmi", priv,
+							   &awcc_hwmon_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(priv->hwdev);
+}
+
 /*
  * Thermal Profile control
  *  - Provides thermal profile control through the Platform Profile API
@@ -751,6 +1134,12 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
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
@@ -831,6 +1220,13 @@ int __init alienware_wmax_wmi_init(void)
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
2.49.0

