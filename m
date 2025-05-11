Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2652609FD;
	Sun, 11 May 2025 20:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996298; cv=none; b=aQ2a2EQCqBiYD7LTjgjfn4hBgC0qcc6n7N6gIqQN53+hJQUz0nkd9JcC7/2gpO1clZTrDbFQs+RzpPC4ZEPFoCGFLp8ssE7Bn5YBwEFJjJQyYVChY4MEOO7+aC/h4uvXQ513og9TPqfSmYIjSFgURnV1RXE8QhPCPJ3zcWAlBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996298; c=relaxed/simple;
	bh=kpBnwgNwczqcxbMFE6cot4862GY10n56IFvMiPvIr0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMbhUbzMsNl6ZJNsUbv/xTr8RwnhmASYzUZpUyn794wBkDXoSZi+yJxot+Ai5wKB7kz4kPIIAdb09jlV13HdtzY4znPWwv0dwDTpPrVdbptG73ShvKF8SbhnUAxmBSSAR6kKDZ7yX3dZxY1CL5umdYhdyxJsTGGD/remv6w8sY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ZesEwHQ9; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ZesEwHQ9"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 1CD982E0A4DC;
	Sun, 11 May 2025 23:44:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996294;
	bh=WopzrnfLWFUOpLXJ+4tce4MrUTHEiUC4E4KKMWifksY=; h=From:To:Subject;
	b=ZesEwHQ9a65YY7n11HqOHny55dcX+0oiNB/E53vY0MSEgdlCcS85h5qBi7HdxhcnB
	 97eyXjuqY8XUYbomVb+IV1yC4VysvIDYFvUoZtYgeuChjLOmkoL1wj7Y2HTHEPEsug
	 Lc6SqqJ6fKGqLgdw/NOtNuZoShtUw4n9NWYM4phE=
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
Subject: [PATCH v1 07/10] platform/x86: msi-wmi-platform: Add charge_threshold
 support
Date: Sun, 11 May 2025 22:44:24 +0200
Message-ID: <20250511204427.327558-8-lkml@antheas.dev>
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
 <174699629404.27973.5787412059925961155@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The battery of MSI laptops supports charge threshold. Add support for it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/Kconfig            |   1 +
 drivers/platform/x86/msi-wmi-platform.c | 110 ++++++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index fd3da718731e7..51a34ab476ffc 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -744,6 +744,7 @@ config MSI_WMI
 
 config MSI_WMI_PLATFORM
 	tristate "MSI WMI Platform features"
+	depends on ACPI_BATTERY
 	depends on ACPI_WMI
 	depends on HWMON
 	select ACPI_PLATFORM_PROFILE
diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 6498f4b44fe53..46928fb4da8a6 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -31,6 +31,7 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
+#include <acpi/battery.h>
 
 #include <linux/unaligned.h>
 
@@ -79,6 +80,7 @@
 /* Get_Data() and Set_Data() Params */
 #define MSI_PLATFORM_PL1_ADDR	0x50
 #define MSI_PLATFORM_PL2_ADDR	0x51
+#define MSI_PLATFORM_BAT_ADDR	0xd7
 
 static bool force;
 module_param_unsafe(force, bool, 0);
@@ -118,6 +120,7 @@ enum msi_wmi_platform_method {
 
 struct msi_wmi_platform_quirk {
 	bool shift_mode;	/* Shift mode is supported */
+	bool charge_threshold;	/* Charge threshold is supported */
 	int pl_min;		/* Minimum PLx value */
 	int pl1_max;		/* Maximum PL1 value */
 	int pl2_max;		/* Maximum PL2 value */
@@ -128,6 +131,7 @@ struct msi_wmi_platform_data {
 	struct msi_wmi_platform_quirk *quirks;
 	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
 	struct device *ppdev;
+	struct acpi_battery_hook battery_hook;
 	struct device *fw_attrs_dev;
 	struct kset *fw_attrs_kset;
 };
@@ -211,12 +215,14 @@ static const char * const msi_wmi_platform_debugfs_names[] = {
 static struct msi_wmi_platform_quirk quirk_default = {};
 static struct msi_wmi_platform_quirk quirk_gen1 = {
 	.shift_mode = true,
+	.charge_threshold = true,
 	.pl_min = 8,
 	.pl1_max = 43,
 	.pl2_max = 45
 };
 static struct msi_wmi_platform_quirk quirk_gen2 = {
 	.shift_mode = true,
+	.charge_threshold = true,
 	.pl_min = 8,
 	.pl1_max = 30,
 	.pl2_max = 37
@@ -1013,6 +1019,94 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
 	return 0;
 }
 
+static int msi_platform_psy_ext_get_prop(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *data,
+					 enum power_supply_property psp,
+					 union power_supply_propval *val)
+{
+	struct msi_wmi_platform_data *msi = data;
+	u8 buffer[32] = { 0 };
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		buffer[0] = MSI_PLATFORM_BAT_ADDR;
+		ret = msi_wmi_platform_query(msi, MSI_PLATFORM_GET_DATA,
+					     buffer, sizeof(buffer));
+		if (ret)
+			return ret;
+
+		val->intval = buffer[1] & ~BIT(7);
+		if (val->intval > 100)
+			return -EINVAL;
+
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int msi_platform_psy_ext_set_prop(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *data,
+					 enum power_supply_property psp,
+					 const union power_supply_propval *val)
+{
+	struct msi_wmi_platform_data *msi = data;
+	u8 buffer[32] = { 0 };
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		if (val->intval > 100)
+			return -EINVAL;
+		buffer[0] = MSI_PLATFORM_BAT_ADDR;
+		buffer[1] = val->intval | BIT(7);
+		return msi_wmi_platform_query(msi, MSI_PLATFORM_SET_DATA,
+					      buffer, sizeof(buffer));
+	default:
+		return -EINVAL;
+	}
+}
+
+static int
+msi_platform_psy_prop_is_writeable(struct power_supply *psy,
+				   const struct power_supply_ext *ext,
+				   void *data, enum power_supply_property psp)
+{
+	return true;
+}
+
+static const enum power_supply_property oxp_psy_ext_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+};
+
+static const struct power_supply_ext msi_platform_psy_ext = {
+	.name			= "msi-platform-charge-control",
+	.properties		= oxp_psy_ext_props,
+	.num_properties		= ARRAY_SIZE(oxp_psy_ext_props),
+	.get_property		= msi_platform_psy_ext_get_prop,
+	.set_property		= msi_platform_psy_ext_set_prop,
+	.property_is_writeable	= msi_platform_psy_prop_is_writeable,
+};
+
+static int msi_wmi_platform_battery_add(struct power_supply *battery,
+					struct acpi_battery_hook *hook)
+{
+	struct msi_wmi_platform_data *data =
+		container_of(hook, struct msi_wmi_platform_data, battery_hook);
+
+	return power_supply_register_extension(battery, &msi_platform_psy_ext,
+					       &data->wdev->dev, data);
+}
+
+static int msi_wmi_platform_battery_remove(struct power_supply *battery,
+					   struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &msi_platform_psy_ext);
+	return 0;
+}
+
 static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user *input,
 					      size_t length, loff_t *offset)
 {
@@ -1245,6 +1339,13 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 	if (ret < 0)
 		return ret;
 
+	if (data->quirks->charge_threshold) {
+		data->battery_hook.name = "MSI Battery";
+		data->battery_hook.add_battery = msi_wmi_platform_battery_add;
+		data->battery_hook.remove_battery = msi_wmi_platform_battery_remove;
+		battery_hook_register(&data->battery_hook);
+	}
+
 	msi_wmi_platform_debugfs_init(data);
 
 	msi_wmi_platform_profile_setup(data);
@@ -1252,6 +1353,14 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 	return msi_wmi_platform_hwmon_init(data);
 }
 
+static void msi_wmi_platform_remove(struct wmi_device *wdev)
+{
+	struct msi_wmi_platform_data *data = dev_get_drvdata(&wdev->dev);
+
+	if (data->quirks->charge_threshold)
+		battery_hook_unregister(&data->battery_hook);
+}
+
 static const struct wmi_device_id msi_wmi_platform_id_table[] = {
 	{ MSI_PLATFORM_GUID, NULL },
 	{ }
@@ -1265,6 +1374,7 @@ static struct wmi_driver msi_wmi_platform_driver = {
 	},
 	.id_table = msi_wmi_platform_id_table,
 	.probe = msi_wmi_platform_probe,
+	.remove = msi_wmi_platform_remove,
 	.no_singleton = true,
 };
 module_wmi_driver(msi_wmi_platform_driver);
-- 
2.49.0

