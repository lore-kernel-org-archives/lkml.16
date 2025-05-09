Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F11C2750E5;
	Fri,  9 May 2025 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776972; cv=none; b=BGz4OUFjqldaNcBLZ4G99vqrBuysguyeIfGgdYSbM4u5Kw1ZTwk/trGtKmLmMLtXVXWpsV6bRDS6goZit848N6gKbjyyVNHzXC4n47HjUG8iUxYkIislRPN/vl5AUlto11fn3FFC+dQnJH8FPHIhdqGlAkc92oxIlTpKPepi4hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776972; c=relaxed/simple;
	bh=3tnx6riRAQeIrglRoMr6Z8s06MlFFv8TNLVSX+2GLAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYUnuhcqO5ecVG0uxzr6MWfbz1HwKWqsmiUgXD3Xeyzsr38PnqwBkxQvBjtQpRU5BKhXvj9LwpjitmPP0obdejxZlzYe7XQCbSt0BawGLq7zXOqEAnqtpiT8GAjTN88rmk3VJq0anUoclxG6Dr8e14rqzDxd/nuA2LDtDMfFYe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q46kwQwe; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q46kwQwe"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d69774081so513630241.0;
        Fri, 09 May 2025 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746776968; x=1747381768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6s/805+g5ODaCP8r7aEFUxhD+7/pjJZZQYcqbKPPG0=;
        b=Q46kwQwenRgcTUwFhC3Q/0zfHwKlfV6jsnB9wcisjbSBvXxm+t7xUxtWiGGTZK9VaI
         O6Kp+yOF7ErOO0nh+2YSePzpz0bH6diHnhfXXUSj3HoSTOE2JZrqT2Zmit1HDhEty/qZ
         byl78uI0SpJJLuhK8W/Le/pSCSXbylSRrxd90uRVQprX7JV2JsFa+fJVjv7eQPbmeyYU
         a2cEnqsKIIO1qb4x7qf7sPlUXxg4HIqDguKeHl+afKmGl4OQysAan/g5f1CgZv0MPZpc
         4vRHWTZsnVZ1pap3nsGOXt9qXWGIs4Ad5CvwrOrSCnSbR4fLL/gghCD4DEcnYPiUfRzG
         RUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776968; x=1747381768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6s/805+g5ODaCP8r7aEFUxhD+7/pjJZZQYcqbKPPG0=;
        b=VGNap+GjlfbZJ99roCwPCmhXECkthlOOTvWkPnX0OCVi+sPpNR5RKJCnibF8Caimmb
         jC7wk9Mvwp1jqgoEioMSLaq/P3TVWNZsv7OwrUwvLQ55G3VkW2JwMnJZuDl2+PYDZBxE
         73nKr/9QOaFbSlj4tAewLvB+2+qsnaqRIrjz7D1FOhX6JBsNCKIMIv4hc8YfYqK7pHWf
         7iyapCfrDJeyQ9Ee4bFS69MtxIUo1W+XYFZiA14GxozELpeVUzJOw5TjAFA6SCrwoXPl
         S/3xybNJP/VCgu8Gye4XVcD/44O4/naHGLJx+2rnG6ASEFO0F8ODHT/paANqey5bi6Iv
         LVCA==
X-Forwarded-Encrypted: i=1; AJvYcCUGNS7kEmsNruHu2VyLKS5yOzCCQwQ1IRNPN9ZJhwFvU/8Z8mqRldAtVc8hbmOr7oIN1lk7dmX0PLSGz0JHdHF1nYbrcQ==@vger.kernel.org, AJvYcCVzgmYJtQLsp2aq0GMpG1NOfisrycHOAl7vupfbA3N/dw7mpereysJZldACU7OemXCgm32upyBkMwZuPIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbj/FpICsJyl2unnGkMpFjEsAkuNMNl2W4jE4TlFvWP9sJV9p3
	fw1y9haXJIOiffMZYMkdiJd3odxrCI9ZxjkFL/Ij0jXIQ77aCdb4
X-Gm-Gg: ASbGncvtt85p0Xtq22eB4MKmXM8gOF4jvV+rxnrjr04pZ4DQfIlgQxTup6qUWYFLa/I
	hyTGXfEKpJTjFJuChC/DSE4bVuu2/c2j6FCqM7qFnrEavFvU6wBg0nhkEnCyjqXuI2bc5vmtL57
	9+5LIkP4nFBkQxTKMhijuVv+A5ktXZ+dR4jwltQ6OpVNr7PtqSs0RyRGlCHMP0vF9oS95oDOzhu
	J0/kxaHbOuK4OUCUww0mtx1Ygl06LAwhDfVanJpK3XSm7NeNrepMX9TE/kIIe8GpFKPNWrVtK9d
	ezgdXvj4zHa0Izvl/RerNc0UNEnPG2PrO4PJDOtD
X-Google-Smtp-Source: AGHT+IGuHXVEFiPliN8mTIFTGOgHCymHxlz2oF5wubFos1dR5K1wUCF1bmrubLebt0FboBApbB3PzA==
X-Received: by 2002:a05:6102:15a0:b0:4c3:64be:5983 with SMTP id ada2fe7eead31-4deed3ee64emr2193937137.25.1746776968249;
        Fri, 09 May 2025 00:49:28 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f62986f3sm678265241.33.2025.05.09.00.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:49:27 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 09 May 2025 04:48:37 -0300
Subject: [PATCH RFC 5/5] platform/x86: samsung-galaxybook: Transition to
 new firmware_attributes API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-fw-attrs-api-v1-5-258afed65bfa@gmail.com>
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
In-Reply-To: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11575; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=3tnx6riRAQeIrglRoMr6Z8s06MlFFv8TNLVSX+2GLAM=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmym3MZrFTSNELjn/u/289cULB47wnPHxE7I14GOjTfE
 ol7JCjQUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhvCxSkAE5lZwPDPWE3yanlu3aaa2aWN
 gosPXPQ52/ppouukMNbagIe8CcW7GBneLtdfePP+R77++jcLK57O2ajKtGPmXR7GFu/e7HOBJfV
 sAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Transition to new firmware_attributes API and replace `enumeration` types
with the simpler `boolean` type.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 299 ++++++++++++------------------
 1 file changed, 114 insertions(+), 185 deletions(-)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 5878a351993eb05a4c5c2c75b4915d972ce9becc..4fe3601fa5d282e7f8ae0a9b7e973da0998a5a72 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -36,8 +36,6 @@ struct samsung_galaxybook {
 	struct platform_device *platform;
 	struct acpi_device *acpi;
 
-	struct device *fw_attrs_dev;
-	struct kset *fw_attrs_kset;
 	/* block in case firmware attributes are updated in multiple threads */
 	struct mutex fw_attr_lock;
 
@@ -66,13 +64,7 @@ enum galaxybook_fw_attr_id {
 	GB_ATTR_BLOCK_RECORDING,
 };
 
-static const char * const galaxybook_fw_attr_name[] = {
-	[GB_ATTR_POWER_ON_LID_OPEN] = "power_on_lid_open",
-	[GB_ATTR_USB_CHARGING]      = "usb_charging",
-	[GB_ATTR_BLOCK_RECORDING]   = "block_recording",
-};
-
-static const char * const galaxybook_fw_attr_desc[] = {
+static const char * const galaxybook_fwat_desc[] = {
 	[GB_ATTR_POWER_ON_LID_OPEN] = "Power On Lid Open",
 	[GB_ATTR_USB_CHARGING]      = "USB Charging",
 	[GB_ATTR_BLOCK_RECORDING]   = "Block Recording",
@@ -908,209 +900,146 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
 
 /* Firmware Attributes setup */
 
-static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+static int galaxybook_fwat_read(struct device *dev, long aux, bool *val)
 {
-	return sysfs_emit(buf, "enumeration\n");
-}
-
-static struct kobj_attribute fw_attr_type = __ATTR_RO(type);
-
-static ssize_t default_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-{
-	return sysfs_emit(buf, "0\n");
-}
-
-static struct kobj_attribute fw_attr_default_value = __ATTR_RO(default_value);
-
-static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-{
-	return sysfs_emit(buf, "0;1\n");
-}
-
-static struct kobj_attribute fw_attr_possible_values = __ATTR_RO(possible_values);
-
-static ssize_t display_name_language_code_show(struct kobject *kobj, struct kobj_attribute *attr,
-					       char *buf)
-{
-	return sysfs_emit(buf, "%s\n", GB_ATTR_LANGUAGE_CODE);
-}
-
-static struct kobj_attribute fw_attr_display_name_language_code =
-	__ATTR_RO(display_name_language_code);
-
-static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-{
-	struct galaxybook_fw_attr *fw_attr =
-		container_of(attr, struct galaxybook_fw_attr, display_name);
-
-	return sysfs_emit(buf, "%s\n", galaxybook_fw_attr_desc[fw_attr->fw_attr_id]);
-}
-
-static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-{
-	struct galaxybook_fw_attr *fw_attr =
-		container_of(attr, struct galaxybook_fw_attr, current_value);
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
 	bool value;
 	int err;
 
-	err = fw_attr->get_value(fw_attr->galaxybook, &value);
+	switch (aux) {
+	case GB_ATTR_POWER_ON_LID_OPEN:
+		err = power_on_lid_open_acpi_get(galaxybook, &value);
+		break;
+	case GB_ATTR_USB_CHARGING:
+		err = usb_charging_acpi_get(galaxybook, &value);
+		break;
+	case GB_ATTR_BLOCK_RECORDING:
+		err = block_recording_acpi_get(galaxybook, &value);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
 	if (err)
 		return err;
 
-	return sysfs_emit(buf, "%u\n", value);
+	*val = value;
+
+	return 0;
 }
 
-static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
-				   const char *buf, size_t count)
+static int galaxybook_fwat_write(struct device *dev, long aux, bool val)
 {
-	struct galaxybook_fw_attr *fw_attr =
-		container_of(attr, struct galaxybook_fw_attr, current_value);
-	struct samsung_galaxybook *galaxybook = fw_attr->galaxybook;
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+	int err;
+
+	switch (aux) {
+	case GB_ATTR_POWER_ON_LID_OPEN:
+		err = power_on_lid_open_acpi_set(galaxybook, val);
+		break;
+	case GB_ATTR_USB_CHARGING:
+		err = usb_charging_acpi_set(galaxybook, val);
+		break;
+	case GB_ATTR_BLOCK_RECORDING:
+		err = block_recording_acpi_set(galaxybook, val);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return err;
+}
+
+static ssize_t galaxybook_fwat_prop_read(struct device *dev, long aux,
+					 enum fwat_property prop, const char *buf)
+{
+	switch (prop) {
+	case FWAT_PROP_DISPLAY_NAME:
+		return sysfs_emit("%s\n", galaxybook_fwat_desc[aux]);
+	case FWAT_PROP_LANGUAGE_CODE:
+		return sysfs_emit("%s\n", GB_ATTR_LANGUAGE_CODE);
+	case FWAT_PROP_DEFAULT:
+		return sysfs_emit("%d\n", 0);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+DEFINE_FWAT_OPS(galaxybook_fwat, boolean);
+
+static bool galaxybook_fwat_is_visible(struct device *dev,
+				       const struct fwat_attr_config *config)
+{
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
 	bool value;
 	int err;
 
-	if (!count)
-		return -EINVAL;
+	switch (config->aux) {
+	case GB_ATTR_POWER_ON_LID_OPEN:
+		err = power_on_lid_open_acpi_get(galaxybook, &value);
+		break;
+	case GB_ATTR_USB_CHARGING:
+		err = usb_charging_acpi_get(galaxybook, &value);
+		break;
+	case GB_ATTR_BLOCK_RECORDING:
+		return galaxybook->has_block_recording;
+	default:
+		return false;
+	}
 
-	err = kstrtobool(buf, &value);
-	if (err)
-		return err;
-
-	guard(mutex)(&galaxybook->fw_attr_lock);
-
-	err = fw_attr->set_value(galaxybook, value);
-	if (err)
-		return err;
-
-	return count;
+	return !err;
 }
 
-#define NUM_FW_ATTR_ENUM_ATTRS  6
+static const enum fwat_property galaxybook_fwat_props[] = {
+	FWAT_PROP_DISPLAY_NAME,
+	FWAT_PROP_LANGUAGE_CODE,
+	FWAT_PROP_DEFAULT,
+};
 
-static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
-				   const enum galaxybook_fw_attr_id fw_attr_id,
-				   int (*get_value)(struct samsung_galaxybook *galaxybook,
-						    bool *value),
-				   int (*set_value)(struct samsung_galaxybook *galaxybook,
-						    const bool value))
+static const struct fwat_attr_config * const galaxybook_fwat_config[] = {
+	FWAT_CONFIG_AUX("power_on_lid_open", boolean,
+			GB_ATTR_POWER_ON_LID_OPEN,
+			&galaxybook_fwat_ops,
+			galaxybook_fwat_props,
+			ARRAY_SIZE(galaxybook_fwat_props)),
+	FWAT_CONFIG_AUX("usb_charging", boolean,
+			GB_ATTR_USB_CHARGING,
+			&galaxybook_fwat_ops,
+			galaxybook_fwat_props,
+			ARRAY_SIZE(galaxybook_fwat_props)),
+	FWAT_CONFIG_AUX("block_recording", boolean,
+			GB_ATTR_BLOCK_RECORDING,
+			&galaxybook_fwat_ops,
+			galaxybook_fwat_props,
+			ARRAY_SIZE(galaxybook_fwat_props)),
+	NULL
+};
+
+static const struct fwat_dev_config galaxybook_fwat_dev_config = {
+	.attrs_config = galaxybook_fwat_config,
+	.is_visible = galaxybook_fwat_is_visible,
+};
+
+static int galaxybook_fwat_init(struct samsung_galaxybook *galaxybook)
 {
-	struct galaxybook_fw_attr *fw_attr;
-	struct attribute **attrs;
-
-	fw_attr = devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_attr), GFP_KERNEL);
-	if (!fw_attr)
-		return -ENOMEM;
-
-	attrs = devm_kcalloc(&galaxybook->platform->dev, NUM_FW_ATTR_ENUM_ATTRS + 1,
-			     sizeof(*attrs), GFP_KERNEL);
-	if (!attrs)
-		return -ENOMEM;
-
-	attrs[0] = &fw_attr_type.attr;
-	attrs[1] = &fw_attr_default_value.attr;
-	attrs[2] = &fw_attr_possible_values.attr;
-	attrs[3] = &fw_attr_display_name_language_code.attr;
-
-	sysfs_attr_init(&fw_attr->display_name.attr);
-	fw_attr->display_name.attr.name = "display_name";
-	fw_attr->display_name.attr.mode = 0444;
-	fw_attr->display_name.show = display_name_show;
-	attrs[4] = &fw_attr->display_name.attr;
-
-	sysfs_attr_init(&fw_attr->current_value.attr);
-	fw_attr->current_value.attr.name = "current_value";
-	fw_attr->current_value.attr.mode = 0644;
-	fw_attr->current_value.show = current_value_show;
-	fw_attr->current_value.store = current_value_store;
-	attrs[5] = &fw_attr->current_value.attr;
-
-	attrs[6] = NULL;
-
-	fw_attr->galaxybook = galaxybook;
-	fw_attr->fw_attr_id = fw_attr_id;
-	fw_attr->attr_group.name = galaxybook_fw_attr_name[fw_attr_id];
-	fw_attr->attr_group.attrs = attrs;
-	fw_attr->get_value = get_value;
-	fw_attr->set_value = set_value;
-
-	return sysfs_create_group(&galaxybook->fw_attrs_kset->kobj, &fw_attr->attr_group);
-}
-
-static void galaxybook_kset_unregister(void *data)
-{
-	struct kset *kset = data;
-
-	kset_unregister(kset);
-}
-
-static void galaxybook_fw_attrs_dev_unregister(void *data)
-{
-	struct device *fw_attrs_dev = data;
-
-	device_unregister(fw_attrs_dev);
-}
-
-static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
-{
-	bool value;
+	struct fwat_device *fwdev;
 	int err;
 
 	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->fw_attr_lock);
 	if (err)
 		return err;
 
-	galaxybook->fw_attrs_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
-						 NULL, "%s", DRIVER_NAME);
-	if (IS_ERR(galaxybook->fw_attrs_dev))
-		return PTR_ERR(galaxybook->fw_attrs_dev);
-
-	err = devm_add_action_or_reset(&galaxybook->platform->dev,
-				       galaxybook_fw_attrs_dev_unregister,
-				       galaxybook->fw_attrs_dev);
-	if (err)
-		return err;
-
-	galaxybook->fw_attrs_kset = kset_create_and_add("attributes", NULL,
-							&galaxybook->fw_attrs_dev->kobj);
-	if (!galaxybook->fw_attrs_kset)
-		return -ENOMEM;
-	err = devm_add_action_or_reset(&galaxybook->platform->dev,
-				       galaxybook_kset_unregister, galaxybook->fw_attrs_kset);
-	if (err)
-		return err;
-
-	err = power_on_lid_open_acpi_get(galaxybook, &value);
-	if (!err) {
-		err = galaxybook_fw_attr_init(galaxybook,
-					      GB_ATTR_POWER_ON_LID_OPEN,
-					      &power_on_lid_open_acpi_get,
-					      &power_on_lid_open_acpi_set);
-		if (err)
-			return err;
-	}
-
-	err = usb_charging_acpi_get(galaxybook, &value);
-	if (!err) {
-		err = galaxybook_fw_attr_init(galaxybook,
-					      GB_ATTR_USB_CHARGING,
-					      &usb_charging_acpi_get,
-					      &usb_charging_acpi_set);
-		if (err)
-			return err;
-	}
-
 	err = galaxybook_block_recording_init(galaxybook);
-	if (err == GB_NOT_SUPPORTED)
-		return 0;
-	else if (err)
+	if (!err)
+		galaxybook->has_block_recording = true;
+	else if (err != GB_NOT_SUPPORTED)
 		return err;
 
-	galaxybook->has_block_recording = true;
+	fwdev = devm_fwat_device_register(&galaxybook->platform->dev,
+					  "samsung-galaxybook", galaxybook,
+					  &galaxybook_fwat_dev_config, NULL);
 
-	return galaxybook_fw_attr_init(galaxybook,
-				       GB_ATTR_BLOCK_RECORDING,
-				       &block_recording_acpi_get,
-				       &block_recording_acpi_set);
+	return PTR_ERR_OR_ZERO(fwdev);
 }
 
 /*
@@ -1389,7 +1318,7 @@ static int galaxybook_probe(struct platform_device *pdev)
 		return dev_err_probe(&galaxybook->platform->dev, err,
 				     "failed to initialize kbd_backlight\n");
 
-	err = galaxybook_fw_attrs_init(galaxybook);
+	err = galaxybook_fwat_init(galaxybook);
 	if (err)
 		return dev_err_probe(&galaxybook->platform->dev, err,
 				     "failed to initialize firmware-attributes\n");

-- 
2.49.0

