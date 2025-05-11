Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A661E2613;
	Sun, 11 May 2025 20:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996295; cv=none; b=Ypma3kixX1rGCkmfSrDdubF0l6ByzMwNWwRu9R7qYhrnTQSnt8ziCm/NjWRenEp5ZXc6GAd0SQGRrix5eGXzN0LsWb+tidT3GtxXzg7nSzyYDdC/Ve5OUsv05OoNAzIbnZFYWtxAx+4CIZfi2XWgI7CowmfhSed9bsZ9JbPsoJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996295; c=relaxed/simple;
	bh=gDFJ9+K1kVVChodFDOpA1BknylLr1pIcjGCP+rcoI2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwCa2wprQ8uSgMtbEk+Q9GLWLwwBsMXUlN9jAtI1EDpIE2dtMDh334zS+0xPISVyKLG02epYENBb9gQXEF+84L7wUIgPespcNaP/KmT0fpHAJpBXjlzrq+oweOvXKo2FrFNqsIie/53fvByUEc8FMVC9a1Et01A1FicXMMXef3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=x+d/d9Bc; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="x+d/d9Bc"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 814282E0A4D3;
	Sun, 11 May 2025 23:44:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996289;
	bh=HWQUNkPUDvHGDiPDP1/+nuZxOazjs5/3q5rXh/7y6Zo=; h=From:To:Subject;
	b=x+d/d9BcYedOvht1aGHDslE652va8KpIODQX0VO34pQuFdSyC8vhzvxaG8WCXfQYm
	 pZrEfwyvhKkZVNg0qcURliqpcv0NMfv31+PzvdKLBUcouLClT1HF6yAJiDwX7FUGsw
	 TE1z4XlRRO0kenMJWP074fSvnnHIpRAStl3PxvMI=
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
Subject: [PATCH v1 05/10] platform/x86: msi-wmi-platform: Add platform profile
 through shift mode
Date: Sun, 11 May 2025 22:44:22 +0200
Message-ID: <20250511204427.327558-6-lkml@antheas.dev>
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
 <174699628919.27833.13898849900911197689@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

MSI's version of platform profile in Windows is called shift mode.
Introduce it here, and add a profile handler to it.

It has 5 modes: sport, comfort, green, eco, and user.
Confusingly, for the Claw, MSI only uses sport, green, and eco,
where they correspond to performance, balanced, and low-power.
Therefore, comfort is mapped to balanced-performance, and user to
custom.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/Kconfig            |   1 +
 drivers/platform/x86/msi-wmi-platform.c | 117 ++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index bee98251b8f0b..57a48910c8fd4 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -746,6 +746,7 @@ config MSI_WMI_PLATFORM
 	tristate "MSI WMI Platform features"
 	depends on ACPI_WMI
 	depends on HWMON
+	select ACPI_PLATFORM_PROFILE
 	help
 	  Say Y here if you want to have support for WMI-based platform features
 	  like fan sensor access on MSI machines.
diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 9ac3c6f1b3f1d..c0b577c95c079 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -17,6 +17,7 @@
 #include <linux/dmi.h>
 #include <linux/errno.h>
 #include <linux/fixp-arith.h>
+#include <linux/platform_profile.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/kernel.h>
@@ -63,6 +64,16 @@
 #define MSI_PLATFORM_AP_FAN_FLAGS_OFFSET	1
 #define MSI_PLATFORM_AP_ENABLE_FAN_TABLES	BIT(7)
 
+/* Get_Data() and Set_Data() Shift Mode Register */
+#define MSI_PLATFORM_SHIFT_ADDR		0xd2
+#define MSI_PLATFORM_SHIFT_DISABLE	BIT(7)
+#define MSI_PLATFORM_SHIFT_ENABLE	(BIT(7) | BIT(6))
+#define MSI_PLATFORM_SHIFT_SPORT	(MSI_PLATFORM_SHIFT_ENABLE + 4)
+#define MSI_PLATFORM_SHIFT_COMFORT	(MSI_PLATFORM_SHIFT_ENABLE + 0)
+#define MSI_PLATFORM_SHIFT_GREEN	(MSI_PLATFORM_SHIFT_ENABLE + 1)
+#define MSI_PLATFORM_SHIFT_ECO		(MSI_PLATFORM_SHIFT_ENABLE + 2)
+#define MSI_PLATFORM_SHIFT_USER		(MSI_PLATFORM_SHIFT_ENABLE + 3)
+
 static bool force;
 module_param_unsafe(force, bool, 0);
 MODULE_PARM_DESC(force, "Force loading without checking for supported WMI interface versions");
@@ -100,12 +111,14 @@ enum msi_wmi_platform_method {
 };
 
 struct msi_wmi_platform_quirk {
+	bool shift_mode;	/* Shift mode is supported */
 };
 
 struct msi_wmi_platform_data {
 	struct wmi_device *wdev;
 	struct msi_wmi_platform_quirk *quirks;
 	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
+	struct device *ppdev;
 };
 
 struct msi_wmi_platform_debugfs_data {
@@ -150,8 +163,10 @@ static const char * const msi_wmi_platform_debugfs_names[] = {
 
 static struct msi_wmi_platform_quirk quirk_default = {};
 static struct msi_wmi_platform_quirk quirk_gen1 = {
+	.shift_mode = true
 };
 static struct msi_wmi_platform_quirk quirk_gen2 = {
+	.shift_mode = true
 };
 
 static const struct dmi_system_id msi_quirks[] = {
@@ -561,6 +576,90 @@ static const struct hwmon_chip_info msi_wmi_platform_chip_info = {
 	.info = msi_wmi_platform_info,
 };
 
+static int msi_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
+{
+	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
+	set_bit(PLATFORM_PROFILE_BALANCED, choices);
+	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	return 0;
+}
+
+static int msi_wmi_platform_profile_get(struct device *dev,
+					enum platform_profile_option *profile)
+{
+	struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	u8 buffer[32] = { };
+
+	buffer[0] = MSI_PLATFORM_SHIFT_ADDR;
+
+	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	if (buffer[0] != 1)
+		return -EINVAL;
+
+	switch (buffer[1]) {
+	case MSI_PLATFORM_SHIFT_SPORT:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		return 0;
+	case MSI_PLATFORM_SHIFT_COMFORT:
+		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
+		return 0;
+	case MSI_PLATFORM_SHIFT_GREEN:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		return 0;
+	case MSI_PLATFORM_SHIFT_ECO:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		return 0;
+	case MSI_PLATFORM_SHIFT_USER:
+		*profile = PLATFORM_PROFILE_CUSTOM;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int msi_wmi_platform_profile_set(struct device *dev,
+					enum platform_profile_option profile)
+{
+	struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
+	u8 buffer[32] = { };
+
+	buffer[0] = MSI_PLATFORM_SHIFT_ADDR;
+
+	switch (profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		buffer[1] = MSI_PLATFORM_SHIFT_SPORT;
+		break;
+	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
+		buffer[1] = MSI_PLATFORM_SHIFT_COMFORT;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		buffer[1] = MSI_PLATFORM_SHIFT_GREEN;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		buffer[1] = MSI_PLATFORM_SHIFT_ECO;
+		break;
+	case PLATFORM_PROFILE_CUSTOM:
+		buffer[1] = MSI_PLATFORM_SHIFT_USER;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, sizeof(buffer));
+}
+
+static const struct platform_profile_ops msi_wmi_platform_profile_ops = {
+	.probe = msi_wmi_platform_profile_probe,
+	.profile_get = msi_wmi_platform_profile_get,
+	.profile_set = msi_wmi_platform_profile_set,
+};
+
 static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user *input,
 					      size_t length, loff_t *offset)
 {
@@ -742,6 +841,22 @@ static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
 	return 0;
 }
 
+static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data *data)
+{
+	int err;
+
+	if (!data->quirks->shift_mode)
+		return 0;
+
+	data->ppdev = devm_platform_profile_register(
+		&data->wdev->dev, "msi-wmi-platform", data,
+		&msi_wmi_platform_profile_ops);
+	if (err)
+		return err;
+
+	return PTR_ERR_OR_ZERO(data->ppdev);
+}
+
 static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 {
 	struct msi_wmi_platform_data *data;
@@ -775,6 +890,8 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 
 	msi_wmi_platform_debugfs_init(data);
 
+	msi_wmi_platform_profile_setup(data);
+
 	return msi_wmi_platform_hwmon_init(data);
 }
 
-- 
2.49.0

