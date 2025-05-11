Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2958264FBB;
	Sun, 11 May 2025 20:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996305; cv=none; b=pd9Welb5iZdp0wPbJdI4zRxUK7zo4/g8mJo3tIBGZdKOhFNAS2l1KmYCF/revfkdUWrofTTT+xgk2T/e4T1I63tY0eNZLwKFmJw6lW3BgnndauqtffauXO7v43UxH2Vg8xPi95UYriYZ4BGeexzqbPte5oc7doj/MIG48o90tkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996305; c=relaxed/simple;
	bh=orJ8j/3ajnfYd3uDV2+SFkRISKEac5ehE16CTuEw1eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NORRHoczhuuyPRQCGxtdScdlq+LBb+D22sCrrbay+t84k/fuCRMwlhjbnyemGsHu61zWVAnYWnk++704pNsvDRdJyozXZlMTFdaLxpRLwFACR7fKBe1r5dzBokdDuYihUNHaImvP3meBQyP37xERy03bDVJE19L/ek1SYEaZLnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=tmQC8lgf; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="tmQC8lgf"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id AB49A2E0A4EA;
	Sun, 11 May 2025 23:44:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996301;
	bh=Enb2hpri1htzmtmoOfLTI9UZyxly8NwM8OPV3n/jH3Q=; h=From:To:Subject;
	b=tmQC8lgfWNLsbtuszcxNtW+/jFiB/zKXw4HpKzaKbSQR3duV1mNKmN/0b0OEIELtI
	 pv4vKxaN77nnP2QKM+Pf2gj54uJWnzof2S97WqDB5NjeqGF5LeGluSWgF2SFqJh+1z
	 JencDpHdmlq+O/oEvKLwxX4ZJW6Tw27noCTT9tIo=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 89.150.168.38) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Kurt Borja <kuurtb@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 10/10] platform/x86: msi-wmi-platform: Restore fan curves
 on PWM disable and unload
Date: Sun, 11 May 2025 22:44:27 +0200
Message-ID: <20250511204427.327558-11-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174699630136.28218.12400765318638031012@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

MSI software is a bit weird in that even when the manual fan curve is
disabled, the fan speed is still somewhat affected by the curve. So
we have to restore the fan curves on unload and PWM disable, as it
is done in Windows.

Suggested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/msi-wmi-platform.c | 123 +++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 7dafe17d4d6be..a917db0300c06 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -123,16 +123,25 @@ struct msi_wmi_platform_quirk {
 	bool shift_mode;	/* Shift mode is supported */
 	bool charge_threshold;	/* Charge threshold is supported */
 	bool dual_fans;		/* For devices with two hwmon fans */
+	bool restore_curves;	/* Restore factory curves on unload */
 	int pl_min;		/* Minimum PLx value */
 	int pl1_max;		/* Maximum PL1 value */
 	int pl2_max;		/* Maximum PL2 value */
 };
 
+struct msi_wmi_platform_factory_curves {
+	u8 cpu_fan_table[32];
+	u8 gpu_fan_table[32];
+	u8 cpu_temp_table[32];
+	u8 gpu_temp_table[32];
+};
+
 struct msi_wmi_platform_data {
 	struct wmi_device *wdev;
 	struct msi_wmi_platform_quirk *quirks;
 	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
 	struct device *ppdev;
+	struct msi_wmi_platform_factory_curves factory_curves;
 	struct acpi_battery_hook battery_hook;
 	struct device *fw_attrs_dev;
 	struct kset *fw_attrs_kset;
@@ -219,6 +228,7 @@ static struct msi_wmi_platform_quirk quirk_gen1 = {
 	.shift_mode = true,
 	.charge_threshold = true,
 	.dual_fans = true,
+	.restore_curves = true,
 	.pl_min = 8,
 	.pl1_max = 43,
 	.pl2_max = 45
@@ -227,6 +237,7 @@ static struct msi_wmi_platform_quirk quirk_gen2 = {
 	.shift_mode = true,
 	.charge_threshold = true,
 	.dual_fans = true,
+	.restore_curves = true,
 	.pl_min = 8,
 	.pl1_max = 30,
 	.pl2_max = 37
@@ -507,6 +518,94 @@ static struct attribute *msi_wmi_platform_hwmon_attrs[] = {
 };
 ATTRIBUTE_GROUPS(msi_wmi_platform_hwmon);
 
+static int msi_wmi_platform_curves_save(struct msi_wmi_platform_data *data)
+{
+	int ret;
+
+	data->factory_curves.cpu_fan_table[0] =
+		MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE;
+	ret = msi_wmi_platform_query_unlocked(
+		data, MSI_PLATFORM_GET_FAN,
+		data->factory_curves.cpu_fan_table,
+		sizeof(data->factory_curves.cpu_fan_table));
+	if (ret < 0)
+		return ret;
+	data->factory_curves.cpu_fan_table[0] =
+		MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE;
+
+	data->factory_curves.gpu_fan_table[0] =
+		MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE;
+	ret = msi_wmi_platform_query_unlocked(
+		data, MSI_PLATFORM_GET_FAN,
+		data->factory_curves.gpu_fan_table,
+		sizeof(data->factory_curves.gpu_fan_table));
+	if (ret < 0)
+		return ret;
+	data->factory_curves.gpu_fan_table[0] =
+		MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE;
+
+	data->factory_curves.cpu_temp_table[0] =
+		MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE;
+	ret = msi_wmi_platform_query_unlocked(
+		data, MSI_PLATFORM_GET_TEMPERATURE,
+		data->factory_curves.cpu_temp_table,
+		sizeof(data->factory_curves.cpu_temp_table));
+	if (ret < 0)
+		return ret;
+	data->factory_curves.cpu_temp_table[0] =
+		MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE;
+
+	data->factory_curves.gpu_temp_table[0] =
+		MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE;
+	ret = msi_wmi_platform_query_unlocked(
+		data, MSI_PLATFORM_GET_TEMPERATURE,
+		data->factory_curves.gpu_temp_table,
+		sizeof(data->factory_curves.gpu_temp_table));
+	if (ret < 0)
+		return ret;
+	data->factory_curves.gpu_temp_table[0] =
+		MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE;
+
+	return 0;
+}
+
+static int msi_wmi_platform_curves_load(struct msi_wmi_platform_data *data)
+{
+	u8 buffer[32] = { };
+	int ret;
+
+	memcpy(buffer, data->factory_curves.cpu_fan_table,
+	       sizeof(data->factory_curves.cpu_fan_table));
+	ret = msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_FAN,
+					      buffer, sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	memcpy(buffer, data->factory_curves.gpu_fan_table,
+	       sizeof(data->factory_curves.gpu_fan_table));
+	ret = msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_FAN,
+					      buffer, sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	memcpy(buffer, data->factory_curves.cpu_temp_table,
+	       sizeof(data->factory_curves.cpu_temp_table));
+	ret = msi_wmi_platform_query_unlocked(
+		data, MSI_PLATFORM_SET_TEMPERATURE, buffer, sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	memcpy(buffer, data->factory_curves.gpu_temp_table,
+	       sizeof(data->factory_curves.gpu_temp_table));
+	ret = msi_wmi_platform_query_unlocked(
+		data, MSI_PLATFORM_SET_TEMPERATURE, buffer, sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+
 static umode_t msi_wmi_platform_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 					   u32 attr, int channel)
 {
@@ -603,9 +702,19 @@ static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor_types ty
 				return -EINVAL;
 			}
 
-			return msi_wmi_platform_query_unlocked(
+			ret = msi_wmi_platform_query_unlocked(
 				data, MSI_PLATFORM_SET_AP, buffer,
 				sizeof(buffer));
+			if (ret < 0)
+				return ret;
+
+			if (val == 2 && data->quirks->restore_curves) {
+				ret = msi_wmi_platform_curves_load(data);
+				if (ret < 0)
+					return ret;
+			}
+
+			return 0;
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -1373,6 +1482,13 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 
 	msi_wmi_platform_profile_setup(data);
 
+	if (data->quirks->restore_curves) {
+		guard(mutex)(&data->wmi_lock);
+		ret = msi_wmi_platform_curves_save(data);
+		if (ret < 0)
+			return ret;
+	}
+
 	return msi_wmi_platform_hwmon_init(data);
 }
 
@@ -1382,6 +1498,11 @@ static void msi_wmi_platform_remove(struct wmi_device *wdev)
 
 	if (data->quirks->charge_threshold)
 		battery_hook_unregister(&data->battery_hook);
+
+	if (data->quirks->restore_curves) {
+		guard(mutex)(&data->wmi_lock);
+		msi_wmi_platform_curves_load(data);
+	}
 }
 
 static const struct wmi_device_id msi_wmi_platform_id_table[] = {
-- 
2.49.0

