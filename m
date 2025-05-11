Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3913625F97C;
	Sun, 11 May 2025 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996298; cv=none; b=Bo2Ne5QMoYEXpDnyyBR/cI6W8+07cRfWrSOE/U2UXhziA+0++UA5zjkhZWB+Z5o72AaMy/b6YhOa0dbWj2tzkEHvGdLG0N03eoPLFryVp7WlLLYtEtf/RaSDtfkQr3y2mgihCbDXDHuDiyH52+wWAQUNJqqJASHw615+oMgqG/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996298; c=relaxed/simple;
	bh=u/pnYZxcbcw4sGrkm/SKQDDQ5LmdLfxsLKeJjfkaGl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHpqui3QGXeFiJ4FmZuATK9hB3w3gcXWbRiPTXjGSbc+Kk4b/gXbLbPploJ2DksQv5McmRtG7eDLjRgioEifrdlCwaac2odPaCCL/H2w8WsLevs57Mc0kF6ZcLzh7MYVdnZ2eqtR+TH1SHjPrnLdHAmILliwIV3gVM/YXQBXET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=OK854rBZ; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="OK854rBZ"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id CD9C92E0A48E;
	Sun, 11 May 2025 23:44:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996291;
	bh=1vf0uADkwVLhVqOD+YVjSxJ8zT+FEcBB8KuDdLtEsSc=; h=From:To:Subject;
	b=OK854rBZNgBM1hKqDfeOoKYm+tDR1qoCZUOuZtHvuMt19IZuc4QcXsb6SPvH+iYmw
	 AWEL+7u+4dWE3xWhf9XAkvOt7nXinLMG6HNrUXvUOSf+gNMGNJwzeM2AI7LnvH3I38
	 4+HwLGCT0Oce8Py2qJnzVvGBWsjRUHG5EfD+fxPA=
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
Subject: [PATCH v1 06/10] platform/x86: msi-wmi-platform: Add PL1/PL2 support
 via firmware attributes
Date: Sun, 11 May 2025 22:44:23 +0200
Message-ID: <20250511204427.327558-7-lkml@antheas.dev>
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
 <174699629160.27911.3593585289138935135@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Adds PL1, and PL2 support through the firmware attributes interface.
The min and max values are quirked, and the attributes are only defined
if they are set to a non-zero value. These values are meant to be set
in conjunction with shift mode, where shift mode automatically sets
an upper bound on PL1/PL2 (e.g., low-power would be used with 8W).

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/Kconfig            |   1 +
 drivers/platform/x86/msi-wmi-platform.c | 361 +++++++++++++++++++++++-
 2 files changed, 360 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 57a48910c8fd4..fd3da718731e7 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -747,6 +747,7 @@ config MSI_WMI_PLATFORM
 	depends on ACPI_WMI
 	depends on HWMON
 	select ACPI_PLATFORM_PROFILE
+	select FW_ATTR_CLASS
 	help
 	  Say Y here if you want to have support for WMI-based platform features
 	  like fan sensor access on MSI machines.
diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index c0b577c95c079..6498f4b44fe53 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -34,6 +34,8 @@
 
 #include <linux/unaligned.h>
 
+#include "firmware_attributes_class.h"
+
 #define DRIVER_NAME	"msi-wmi-platform"
 
 #define MSI_PLATFORM_GUID	"ABBC0F6E-8EA1-11d1-00A0-C90629100000"
@@ -74,6 +76,10 @@
 #define MSI_PLATFORM_SHIFT_ECO		(MSI_PLATFORM_SHIFT_ENABLE + 2)
 #define MSI_PLATFORM_SHIFT_USER		(MSI_PLATFORM_SHIFT_ENABLE + 3)
 
+/* Get_Data() and Set_Data() Params */
+#define MSI_PLATFORM_PL1_ADDR	0x50
+#define MSI_PLATFORM_PL2_ADDR	0x51
+
 static bool force;
 module_param_unsafe(force, bool, 0);
 MODULE_PARM_DESC(force, "Force loading without checking for supported WMI interface versions");
@@ -112,6 +118,9 @@ enum msi_wmi_platform_method {
 
 struct msi_wmi_platform_quirk {
 	bool shift_mode;	/* Shift mode is supported */
+	int pl_min;		/* Minimum PLx value */
+	int pl1_max;		/* Maximum PL1 value */
+	int pl2_max;		/* Maximum PL2 value */
 };
 
 struct msi_wmi_platform_data {
@@ -119,6 +128,44 @@ struct msi_wmi_platform_data {
 	struct msi_wmi_platform_quirk *quirks;
 	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
 	struct device *ppdev;
+	struct device *fw_attrs_dev;
+	struct kset *fw_attrs_kset;
+};
+
+enum msi_fw_attr_id {
+	MSI_ATTR_PPT_PL1_SPL,
+	MSI_ATTR_PPT_PL2_SPPT,
+};
+
+static const char *const msi_fw_attr_name[] = {
+	[MSI_ATTR_PPT_PL1_SPL] = "ppt_pl1_spl",
+	[MSI_ATTR_PPT_PL2_SPPT] = "ppt_pl2_sppt",
+};
+
+static const char *const msi_fw_attr_desc[] = {
+	[MSI_ATTR_PPT_PL1_SPL] = "CPU Steady package limit (PL1/SPL)",
+	[MSI_ATTR_PPT_PL2_SPPT] = "CPU Boost slow package limit (PL2/SPPT)",
+};
+
+#define MSI_ATTR_LANGUAGE_CODE "en_US.UTF-8"
+
+struct msi_fw_attr {
+	struct msi_wmi_platform_data *data;
+	enum msi_fw_attr_id fw_attr_id;
+	struct attribute_group attr_group;
+	struct kobj_attribute display_name;
+	struct kobj_attribute current_value;
+	struct kobj_attribute min_value;
+	struct kobj_attribute max_value;
+
+	u32 min;
+	u32 max;
+
+	int (*get_value)(struct msi_wmi_platform_data *data,
+			 struct msi_fw_attr *fw_attr, char *buf);
+	ssize_t (*set_value)(struct msi_wmi_platform_data *data,
+			     struct msi_fw_attr *fw_attr, const char *buf,
+			     size_t count);
 };
 
 struct msi_wmi_platform_debugfs_data {
@@ -163,10 +210,16 @@ static const char * const msi_wmi_platform_debugfs_names[] = {
 
 static struct msi_wmi_platform_quirk quirk_default = {};
 static struct msi_wmi_platform_quirk quirk_gen1 = {
-	.shift_mode = true
+	.shift_mode = true,
+	.pl_min = 8,
+	.pl1_max = 43,
+	.pl2_max = 45
 };
 static struct msi_wmi_platform_quirk quirk_gen2 = {
-	.shift_mode = true
+	.shift_mode = true,
+	.pl_min = 8,
+	.pl1_max = 30,
+	.pl2_max = 37
 };
 
 static const struct dmi_system_id msi_quirks[] = {
@@ -660,6 +713,306 @@ static const struct platform_profile_ops msi_wmi_platform_profile_ops = {
 	.profile_set = msi_wmi_platform_profile_set,
 };
 
+/* Firmware Attributes setup */
+static int data_get_addr(struct msi_wmi_platform_data *data,
+			 const enum msi_fw_attr_id id)
+{
+	switch (id) {
+	case MSI_ATTR_PPT_PL1_SPL:
+		return MSI_PLATFORM_PL1_ADDR;
+	case MSI_ATTR_PPT_PL2_SPPT:
+		return MSI_PLATFORM_PL2_ADDR;
+	default:
+		pr_warn("Invalid attribute id %d\n", id);
+		return -EINVAL;
+	}
+}
+
+static ssize_t data_set_value(struct msi_wmi_platform_data *data,
+			      struct msi_fw_attr *fw_attr, const char *buf,
+			      size_t count)
+{
+	u8 buffer[32] = { 0 };
+	int ret, fwid;
+	u32 value;
+
+	fwid = data_get_addr(data, fw_attr->fw_attr_id);
+	if (fwid < 0)
+		return fwid;
+
+	ret = kstrtou32(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	if (fw_attr->min >= 0 && value < fw_attr->min)
+		return -EINVAL;
+	if (fw_attr->max >= 0 && value > fw_attr->max)
+		return -EINVAL;
+
+	buffer[0] = fwid;
+	put_unaligned_le32(value, &buffer[1]);
+
+	ret = msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, sizeof(buffer));
+	if (ret) {
+		pr_warn("Failed to set_data with id %d: %d\n",
+			fw_attr->fw_attr_id, ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static int data_get_value(struct msi_wmi_platform_data *data,
+			  struct msi_fw_attr *fw_attr, char *buf)
+{
+	u8 buffer[32] = { 0 };
+	u32 value;
+	int ret, addr;
+
+	addr = data_get_addr(data, fw_attr->fw_attr_id);
+	if (addr < 0)
+		return addr;
+
+	buffer[0] = addr;
+
+	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, sizeof(buffer));
+	if (ret) {
+		pr_warn("Failed to show set_data for id %d: %d\n",
+			fw_attr->fw_attr_id, ret);
+		return ret;
+	}
+
+	value = get_unaligned_le32(&buffer[1]);
+
+	return sysfs_emit(buf, "%d\n", value);
+}
+
+static ssize_t display_name_language_code_show(struct kobject *kobj, struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "%s\n", MSI_ATTR_LANGUAGE_CODE);
+}
+
+static struct kobj_attribute fw_attr_display_name_language_code =
+	__ATTR_RO(display_name_language_code);
+
+static ssize_t scalar_increment_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "1\n");
+}
+
+static struct kobj_attribute fw_attr_scalar_increment =
+	__ATTR_RO(scalar_increment);
+
+static ssize_t pending_reboot_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0\n");
+}
+
+static struct kobj_attribute fw_attr_pending_reboot = __ATTR_RO(pending_reboot);
+
+static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct msi_fw_attr *fw_attr =
+		container_of(attr, struct msi_fw_attr, display_name);
+
+	return sysfs_emit(buf, "%s\n", msi_fw_attr_desc[fw_attr->fw_attr_id]);
+}
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct msi_fw_attr *fw_attr =
+		container_of(attr, struct msi_fw_attr, current_value);
+
+	return fw_attr->get_value(fw_attr->data, fw_attr, buf);
+}
+
+static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct msi_fw_attr *fw_attr =
+		container_of(attr, struct msi_fw_attr, current_value);
+
+	return fw_attr->set_value(fw_attr->data, fw_attr, buf, count);
+}
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "integer\n");
+}
+
+static struct kobj_attribute fw_attr_type_int = {
+	.attr = { .name = "type", .mode = 0444 },
+	.show = type_show,
+};
+
+static ssize_t min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	struct msi_fw_attr *fw_attr =
+		container_of(attr, struct msi_fw_attr, min_value);
+
+	return sysfs_emit(buf, "%d\n", fw_attr->min);
+}
+
+static ssize_t max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	struct msi_fw_attr *fw_attr =
+		container_of(attr, struct msi_fw_attr, max_value);
+
+	return sysfs_emit(buf, "%d\n", fw_attr->max);
+}
+
+#define FW_ATTR_ENUM_MAX_ATTRS  7
+
+static int
+msi_fw_attr_init(struct msi_wmi_platform_data *data,
+		 const enum msi_fw_attr_id fw_attr_id,
+		 struct kobj_attribute *fw_attr_type, const s32 min,
+		 const s32 max,
+		 int (*get_value)(struct msi_wmi_platform_data *data,
+				  struct msi_fw_attr *fw_attr, char *buf),
+		 ssize_t (*set_value)(struct msi_wmi_platform_data *data,
+				      struct msi_fw_attr *fw_attr,
+				      const char *buf, size_t count))
+{
+	struct msi_fw_attr *fw_attr;
+	struct attribute **attrs;
+	int idx = 0;
+
+	fw_attr = devm_kzalloc(&data->wdev->dev, sizeof(*fw_attr), GFP_KERNEL);
+	if (!fw_attr)
+		return -ENOMEM;
+
+	attrs = devm_kcalloc(&data->wdev->dev, FW_ATTR_ENUM_MAX_ATTRS + 1,
+			     sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	fw_attr->data = data;
+	fw_attr->fw_attr_id = fw_attr_id;
+	fw_attr->attr_group.name = msi_fw_attr_name[fw_attr_id];
+	fw_attr->attr_group.attrs = attrs;
+	fw_attr->get_value = get_value;
+	fw_attr->set_value = set_value;
+
+	attrs[idx++] = &fw_attr_type->attr;
+	if (fw_attr_type == &fw_attr_type_int)
+		attrs[idx++] = &fw_attr_scalar_increment.attr;
+	attrs[idx++] = &fw_attr_display_name_language_code.attr;
+
+	sysfs_attr_init(&fw_attr->display_name.attr);
+	fw_attr->display_name.attr.name = "display_name";
+	fw_attr->display_name.attr.mode = 0444;
+	fw_attr->display_name.show = display_name_show;
+	attrs[idx++] = &fw_attr->display_name.attr;
+
+	sysfs_attr_init(&fw_attr->current_value.attr);
+	fw_attr->current_value.attr.name = "current_value";
+	fw_attr->current_value.attr.mode = 0644;
+	fw_attr->current_value.show = current_value_show;
+	fw_attr->current_value.store = current_value_store;
+	attrs[idx++] = &fw_attr->current_value.attr;
+
+	if (min >= 0) {
+		fw_attr->min = min;
+		sysfs_attr_init(&fw_attr->min_value.attr);
+		fw_attr->min_value.attr.name = "min_value";
+		fw_attr->min_value.attr.mode = 0444;
+		fw_attr->min_value.show = min_value_show;
+		attrs[idx++] = &fw_attr->min_value.attr;
+	} else {
+		fw_attr->min = -1;
+	}
+
+	if (max >= 0) {
+		fw_attr->max = max;
+		sysfs_attr_init(&fw_attr->max_value.attr);
+		fw_attr->max_value.attr.name = "max_value";
+		fw_attr->max_value.attr.mode = 0444;
+		fw_attr->max_value.show = max_value_show;
+		attrs[idx++] = &fw_attr->max_value.attr;
+	} else {
+		fw_attr->max = -1;
+	}
+
+	attrs[idx] = NULL;
+	return sysfs_create_group(&data->fw_attrs_kset->kobj, &fw_attr->attr_group);
+}
+
+static void msi_kset_unregister(void *data)
+{
+	struct kset *kset = data;
+
+	sysfs_remove_file(&kset->kobj, &fw_attr_pending_reboot.attr);
+	kset_unregister(kset);
+}
+
+static void msi_fw_attrs_dev_unregister(void *data)
+{
+	struct device *fw_attrs_dev = data;
+
+	device_unregister(fw_attrs_dev);
+}
+
+static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
+{
+	int err;
+
+	data->fw_attrs_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
+						 NULL, "%s", DRIVER_NAME);
+	if (IS_ERR(data->fw_attrs_dev))
+		return PTR_ERR(data->fw_attrs_dev);
+
+	err = devm_add_action_or_reset(&data->wdev->dev,
+				       msi_fw_attrs_dev_unregister,
+				       data->fw_attrs_dev);
+	if (err)
+		return err;
+
+	data->fw_attrs_kset = kset_create_and_add("attributes", NULL,
+						  &data->fw_attrs_dev->kobj);
+	if (!data->fw_attrs_kset)
+		return -ENOMEM;
+
+	err = sysfs_create_file(&data->fw_attrs_kset->kobj,
+				&fw_attr_pending_reboot.attr);
+	if (err) {
+		kset_unregister(data->fw_attrs_kset);
+		return err;
+	}
+
+	err = devm_add_action_or_reset(&data->wdev->dev, msi_kset_unregister,
+				       data->fw_attrs_kset);
+	if (err)
+		return err;
+
+	if (data->quirks->pl1_max) {
+		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL1_SPL,
+					&fw_attr_type_int, data->quirks->pl_min,
+					data->quirks->pl1_max, &data_get_value,
+					&data_set_value);
+		if (err)
+			return err;
+	}
+
+	if (data->quirks->pl2_max) {
+		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL2_SPPT,
+				       &fw_attr_type_int, data->quirks->pl_min,
+				       data->quirks->pl2_max, &data_get_value,
+				       &data_set_value);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user *input,
 					      size_t length, loff_t *offset)
 {
@@ -888,6 +1241,10 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 	if (ret < 0)
 		return ret;
 
+	ret = msi_wmi_fw_attrs_init(data);
+	if (ret < 0)
+		return ret;
+
 	msi_wmi_platform_debugfs_init(data);
 
 	msi_wmi_platform_profile_setup(data);
-- 
2.49.0

