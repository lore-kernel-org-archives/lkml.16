Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D31A2645;
	Sat, 29 Mar 2025 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233599; cv=none; b=MavvFu5twQCFcx4T8iaK2XSxWd/HDEktBSmJik3alaxEnjyVS6t1FpI4jU58Q97HFn0Wpwtx5RwQOwyI1jl3WOBrYx/+n3xZRZ8HYSk92wn17xikdq+YC5RJTNr8VZnniefNhH74vZpmtX+8zCpShWbTJ4oVo8mIDVtwAAUxprQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233599; c=relaxed/simple;
	bh=bE6GWgQGK0ROa75RwFSbYgWnzUSnToqDvz6ktr+Sy+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NiBZpY63xGmR5RiTGOjrgav7+BqzUmNC69Ie80ydPAaCmCUXKQDRfYrMLOUAAqh1sYTBAXzw7kxhZDmj7vhd7Bv1gNtBTj7d5kMSfx75kL0SCVTFSCJlOtqaAyaZER1eUrRIASqvYRLb9FT5tXnjYhe1PRnxY7avr3jgofLZLkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fD1D1vtq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fD1D1vtq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2239c066347so68280255ad.2;
        Sat, 29 Mar 2025 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233597; x=1743838397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MtBGS2/x8T2jLqD9M8LJcRz60Pri7ZLNfNVI2fVXvs=;
        b=fD1D1vtqSOttdTcoUEX/WwlcQZxn2VF53zpRNgsnbdq08am4oqvrXVuEA2nGg8oa9i
         KWu3C05JlbRfNZZtYM3GT4zvEOaqIoIFL7H7BhtSdMc5JTtNMDCfmMu/3cn5fHsMQC+e
         ASd+ag7mG5oXvxOFzwH/0htx0owK9YoYFHeGhlWAoTe5a5nL3IlifjISp6b0AuVEttSd
         tZaX+Fz+Za98WGClYGkNh+icpbziWmZRA+AjBhz60oWI+r2c+VPMEOa3c/8Twaf/I0DK
         32z/JfELgTNoYkrx550CTPDlkEE6vnSDl6F0N2FS/xHGsQjzbtza/ZPIKK3BkZ6C7/1G
         vN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233597; x=1743838397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MtBGS2/x8T2jLqD9M8LJcRz60Pri7ZLNfNVI2fVXvs=;
        b=f4ka8ROa2TVzx2XKeCTG40cw0hMKais/tLk+Qo+iqxu1yA89dIjunQWSnxYBUCdcjh
         6t9T7rgOcX827mpIPb42WtguonInQl3Hu3zF0EKPr3ofDA/VqDjxBNfGXObgGphDAl8a
         eSow2KZXahwyauMxJ7ctuWgkae+T7zkfZC63qR9D1M/HKU5zIGezkCnhQDbPmCNoML32
         yuOVyvJfp64+AAhazAT0Pf1SAQKLWyujRynXAryiUyZezcuEcX89Fx5Ioo/twq8eEYjn
         ZCaL07pAC41dFIue3/YFItlxZys6VO1SfOQnoMp4Ub+NgsNL+AXP/lCipXMOxDo+2An7
         mIGA==
X-Forwarded-Encrypted: i=1; AJvYcCVbhyc12BnqQNR29kNWoGevybDqvYsjOm1zb933ANWTEoaRbzrPpIHTuq4GCzEe1mA02fh6XtPzw2wMmA==@vger.kernel.org, AJvYcCVqxV2eMQLUTj9lYcNVGCAR0pm8dfBOihbIABrzfLaXCnCRk7mmLCKk5QBmAHSGQBL4pL+PjXxHY0WBCIM5@vger.kernel.org, AJvYcCXWo4LDjbwlkhNAsyO8+uSAbQQzwGw//iaqkvyOaphlC2OdWehoN4IqlXyJHQLfWoyCb7zil1F3wAJVY9GhAxcDHN29gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy475qvNpzgCX4Zl972uSvk9rdIuF62CqJ4OvJEtTpHbQXj9opd
	U8OwtMHMZuUgXz8rb3voKiHDX94J7/OJooSReWgqDAv7tTV/vNkd
X-Gm-Gg: ASbGnctIVX4zvLFq4ns/mSeel720+vEPAUlFR/ANSx0tTxmxZWEZwAEh/B7hKGeVugD
	P50P/J1Daiz0+5goFiiX7PjBeIveW+a/lJby6wbvj/iuj7yrdITm0IpVfIMe9Cw1NKo6YYLNi9r
	9O/iRYL6+Bk04fZLTle+Dn2xbFGnafHtqOALfx7VS5x1mv6MfYK3kEb5pZcGGABso/KRB3HPj+l
	CBn6u9WX0yJwVYaDHe6SBvc37YwGyqxYJaPOQ3MK39REEEkrwvs0Igm6pBZEmVstIBaMGKuxmMt
	gDsqVJqYx5lKsYu9lhTM60g2F0z4ZTspa7u65uZQ7ZVI
X-Google-Smtp-Source: AGHT+IG7MoE24TOeBqZdX4inNurMY9P3FdclyKLQwUe1o8MigWfim1krViuF+sZyb3ZDkT38wdfhEw==
X-Received: by 2002:a17:902:db01:b0:215:8809:b3b7 with SMTP id d9443c01a7336-2292f946440mr31205625ad.7.1743233596538;
        Sat, 29 Mar 2025 00:33:16 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:16 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:25 -0300
Subject: [PATCH v7 08/12] platform/x86: alienware-wmi-wmax: Add support for
 manual fan control
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-hwm-v7-8-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
X-Mailer: b4 0.14.2

All models with the "AWCC" WMAX device support a way of manually
controlling fans.

The PWM duty cycle of a fan can't be controlled directly. Instead the
AWCC interface let's us tune a fan `boost` value, which has the
following empirically discovered, approximate behavior over the PWM
value:

	pwm = pwm_base + (fan_boost / 255) * (pwm_max - pwm_base)

Where the pwm_base is the locked PWM value controlled by the FW and
fan_boost is a value between 0 and 255.

Expose this fan_boost knob as a custom HWMON attribute.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 174 ++++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 3fe0ac006657874614f906f1292751ffae213c48..6caf3470d7e15e87540b7d933ad74e9877d6ebab 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -14,8 +14,12 @@
 #include <linux/bits.h>
 #include <linux/dmi.h>
 #include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kstrtox.h>
+#include <linux/minmax.h>
 #include <linux/moduleparam.h>
 #include <linux/platform_profile.h>
+#include <linux/pm.h>
 #include <linux/units.h>
 #include <linux/wmi.h>
 #include "alienware-wmi.h"
@@ -183,10 +187,12 @@ enum AWCC_THERMAL_INFORMATION_OPERATIONS {
 	AWCC_OP_GET_FAN_MIN_RPM			= 0x08,
 	AWCC_OP_GET_FAN_MAX_RPM			= 0x09,
 	AWCC_OP_GET_CURRENT_PROFILE		= 0x0B,
+	AWCC_OP_GET_FAN_BOOST			= 0x0C,
 };
 
 enum AWCC_THERMAL_CONTROL_OPERATIONS {
 	AWCC_OP_ACTIVATE_PROFILE		= 0x01,
+	AWCC_OP_SET_FAN_BOOST			= 0x02,
 };
 
 enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
@@ -250,6 +256,7 @@ struct awcc_fan_data {
 	const char *label;
 	u32 min_rpm;
 	u32 max_rpm;
+	u8 suspend_cache;
 	u8 id;
 };
 
@@ -638,6 +645,18 @@ static int awcc_op_get_temperature(struct wmi_device *wdev, u8 temp_id, u32 *out
 	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
 }
 
+static int awcc_op_get_fan_boost(struct wmi_device *wdev, u8 fan_id, u32 *out)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_GET_FAN_BOOST,
+		.arg1 = fan_id,
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
@@ -663,6 +682,19 @@ static int awcc_op_activate_profile(struct wmi_device *wdev, u8 profile)
 	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &out);
 }
 
+static int awcc_op_set_fan_boost(struct wmi_device *wdev, u8 fan_id, u8 boost)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_SET_FAN_BOOST,
+		.arg1 = fan_id,
+		.arg2 = boost,
+		.arg3 = 0,
+	};
+	u32 out;
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &out);
+}
+
 /*
  * HWMON
  *  - Provides temperature and fan speed monitoring as well as manual fan
@@ -827,6 +859,81 @@ static const struct hwmon_chip_info awcc_hwmon_chip_info = {
 	.info = awcc_hwmon_info,
 };
 
+static ssize_t fan_boost_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	int index = to_sensor_dev_attr(attr)->index;
+	struct awcc_fan_data *fan = priv->fan_data[index];
+	u32 boost;
+	int ret;
+
+	ret = awcc_op_get_fan_boost(priv->wdev, fan->id, &boost);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", boost);
+}
+
+static ssize_t fan_boost_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	int index = to_sensor_dev_attr(attr)->index;
+	struct awcc_fan_data *fan = priv->fan_data[index];
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	ret = awcc_op_set_fan_boost(priv->wdev, fan->id, clamp_val(val, 0, 255));
+
+	return ret ? ret : count;
+}
+
+static SENSOR_DEVICE_ATTR_RW(fan1_boost, fan_boost, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_boost, fan_boost, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_boost, fan_boost, 2);
+static SENSOR_DEVICE_ATTR_RW(fan4_boost, fan_boost, 3);
+static SENSOR_DEVICE_ATTR_RW(fan5_boost, fan_boost, 4);
+static SENSOR_DEVICE_ATTR_RW(fan6_boost, fan_boost, 5);
+
+static umode_t fan_boost_attr_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	struct awcc_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return n < priv->fan_count ? attr->mode : 0;
+}
+
+static bool fan_boost_group_visible(struct kobject *kobj)
+{
+	return true;
+}
+
+DEFINE_SYSFS_GROUP_VISIBLE(fan_boost);
+
+static struct attribute *fan_boost_attrs[] = {
+	&sensor_dev_attr_fan1_boost.dev_attr.attr,
+	&sensor_dev_attr_fan2_boost.dev_attr.attr,
+	&sensor_dev_attr_fan3_boost.dev_attr.attr,
+	&sensor_dev_attr_fan4_boost.dev_attr.attr,
+	&sensor_dev_attr_fan5_boost.dev_attr.attr,
+	&sensor_dev_attr_fan6_boost.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group fan_boost_group = {
+	.attrs = fan_boost_attrs,
+	.is_visible = SYSFS_GROUP_VISIBLE(fan_boost),
+};
+
+static const struct attribute_group *awcc_hwmon_groups[] = {
+	&fan_boost_group,
+	NULL
+};
+
 static int awcc_hwmon_temps_init(struct wmi_device *wdev)
 {
 	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
@@ -964,12 +1071,56 @@ static int awcc_hwmon_init(struct wmi_device *wdev)
 	if (ret)
 		return ret;
 
-	priv->hwdev = devm_hwmon_device_register_with_info(&wdev->dev, "alienware_wmi", priv,
-							   &awcc_hwmon_chip_info, NULL);
+	priv->hwdev = devm_hwmon_device_register_with_info(&wdev->dev, "alienware_wmi",
+							   priv, &awcc_hwmon_chip_info,
+							   awcc_hwmon_groups);
 
 	return PTR_ERR_OR_ZERO(priv->hwdev);
 }
 
+static void awcc_hwmon_suspend(struct device *dev)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	struct awcc_fan_data *fan;
+	unsigned int i;
+	u32 boost;
+	int ret;
+
+	for (i = 0; i < priv->fan_count; i++) {
+		fan = priv->fan_data[i];
+
+		ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_FAN_BOOST,
+					       fan->id, &boost);
+		if (ret)
+			dev_err(dev, "Failed to store Fan %u boost while suspending\n", i);
+
+		fan->suspend_cache = ret ? 0 : clamp_val(boost, 0, 255);
+
+		awcc_op_set_fan_boost(priv->wdev, fan->id, 0);
+		if (ret)
+			dev_err(dev, "Failed to set Fan %u boost to 0 while suspending\n", i);
+	}
+}
+
+static void awcc_hwmon_resume(struct device *dev)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	struct awcc_fan_data *fan;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < priv->fan_count; i++) {
+		fan = priv->fan_data[i];
+
+		if (!fan->suspend_cache)
+			continue;
+
+		ret = awcc_op_set_fan_boost(priv->wdev, fan->id, fan->suspend_cache);
+		if (ret)
+			dev_err(dev, "Failed to restore Fan %u boost while resuming\n", i);
+	}
+}
+
 /*
  * Thermal Profile control
  *  - Provides thermal profile control through the Platform Profile API
@@ -1196,6 +1347,24 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	return ret;
 }
 
+static int wmax_wmi_suspend(struct device *dev)
+{
+	if (awcc->hwmon)
+		awcc_hwmon_suspend(dev);
+
+	return 0;
+}
+
+static int wmax_wmi_resume(struct device *dev)
+{
+	if (awcc->hwmon)
+		awcc_hwmon_resume(dev);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(wmax_wmi_pm_ops, wmax_wmi_suspend, wmax_wmi_resume);
+
 static const struct wmi_device_id alienware_wmax_device_id_table[] = {
 	{ WMAX_CONTROL_GUID, NULL },
 	{ },
@@ -1206,6 +1375,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.driver = {
 		.name = "alienware-wmi-wmax",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.pm = pm_sleep_ptr(&wmax_wmi_pm_ops),
 	},
 	.id_table = alienware_wmax_device_id_table,
 	.probe = wmax_wmi_probe,

-- 
2.49.0

