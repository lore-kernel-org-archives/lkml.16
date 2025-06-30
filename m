Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E734242D76;
	Mon, 30 Jun 2025 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270524; cv=none; b=EyRKYKGM7Ugw7IhRVl0GJu5yPoNtjk2k3+OStu5YRZXDENvXtI5TuNaCXXHD9Fj6aeKgw/xADNXCt3s10h0vYz3V74ZTpMAU+U7NlpisunS38UY0zpTddL0fxYm/Ll9O8IrB2S+Y6dH8N3MCcSCJ8ep8hCKq2TbKZH21b/sT2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270524; c=relaxed/simple;
	bh=liILi0h70NtnHMaTrnZq1JtW1kl+WBBQwRBtx4jqqqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3/JlZ+NiV8PSTFpPgQHEbH7KViCn9Z2NR3yIX/AB+HsBERT76phdbOB8CY9Q2mT3IQp9OAqLt1rgv0RhZEnA5p5dIFCt+POBXvOnr4ZgE6S9wjj/9uNs2kr/0kzr1ruiAKRxsK/Lc1u84Nva1aYPDYNGpbDvpRcefHKxYyFVPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeRG9qk7; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeRG9qk7"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d3f192a64eso381014385a.2;
        Mon, 30 Jun 2025 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751270521; x=1751875321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2/KSwnwApNBj2qg4eJFgFllM2G5u9JrEk978fuXLkk=;
        b=KeRG9qk7YxNJexqBFwir5APGPiCsRdvGUhbA11evtKV54tz9emegvh5+GUj2TRbR0K
         6pKMG1dJDea1nsMynfRg3xyOoSCtFeuYQKXHXobCv1KxHP/jJZHc27ajFXPMQbnUorGw
         j9oJB4B88Xkvp2/a95OGf70PIz0RfoKKLOaxspcyKJgvk1egqyi9qiiOmx1nIlCPWc8Z
         xpDbhfS3SG2VqAEjInDIM9lE6F9z5DEoxlZ/wsAskYzpqXKw9VZR3pN3JxSctgsNhVbp
         p2e4aKglG2uUOpTPykrsTj34jdOHXXC/lgOxUcUQryclkGgqXxnvJJT7oe13ZXWRPSY+
         DEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270521; x=1751875321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2/KSwnwApNBj2qg4eJFgFllM2G5u9JrEk978fuXLkk=;
        b=uN1SWSvSXcQKtd+6ihFIiEdxnucKMKZMNTQl3/S//ninVK0H5aauKnr4f6myLBtk3X
         TOc2aLw8qnMpXEgWGCmCC0NgZ9wbqjeuywMH8gJZkETIEF6mD+ci/rdfn2cdlNqo+Yjv
         DLN2UulNHQSnC5nZkUedim4KlT2JkSeO0a9JWA3HQDAgr86cHi8ovnT0ks+utQ2z5P+B
         Z64V+EI9akJzxnemx6pFYqf/WCoIG8Gu0NDl1ztWwGgfZnJY33Xe9v1NisJD0HaiYGsl
         s32wK8KITOxCvf6MXVLnEzrH1CMBjtlZst34v3AyhlZX29/+07acnoOImXoaaloDFvOL
         gQxw==
X-Forwarded-Encrypted: i=1; AJvYcCVpWKsAjuTxiLoExfxToAebmUVmNCJr6K4kzgHVeFfsudlciuE/1IZoLvb2d8xkV8naQfHg8tZ1I39pDUM=@vger.kernel.org, AJvYcCWfh9PTagGri3sh9B8KRJUCXixLuoMgqjekSKL8BCDqLaW8altHePAJMT9HhvPQWakoi5tVetRwohm2L2x7YG0R4fyKzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy50zRzSxCT8kgYG4O0lAw4LCfp4ywDoMM2gC0KQZZc+w/D12yk
	olsppTpWbWj9Yp/QduxmY9ucmswNKwcK/EoLlYPvSBOysWhj9ZXi5rLK
X-Gm-Gg: ASbGnct0BJA1nXii6x5GMV00ihrWkYnbdiY3Xw/nqcNPTcZCIRvFJLnXd7ZuJjo8b3u
	AjqriuFQ33hcBc2Fjutux0hnAMfCF1UQ98GNBwHx0pMsdbJ9OL8XW7L/AHlYhlxSHI1GB5I8knM
	SKmvXZE67y7mvl9qnu+gcEqFyl2BxiJ+2BNr5rkOweiBNyoS85mNCWlbFIBQcW4E1sffF6e8oWE
	6THAYF3p4Xojnd5GeEkP0THn9vxkZ2Lqs7/AMMMcVMiR7WIUl7hDqPT3vf2r6seawtLucggnLF4
	eYZ179LkVprA5shV+md92mCkh5SL9gRVzio97RGdJjyXFnyYkBohWunj3+sd4EMMBKl7jLYA
X-Google-Smtp-Source: AGHT+IGi948axwW3grs/bp+26eYMfDmth0LKYtJPzBATa5xws7sjcNEmZBpdKS9xlkZrBJT50LStqQ==
X-Received: by 2002:a05:620a:2910:b0:7d3:8da2:e9e2 with SMTP id af79cd13be357-7d443990ab8mr1720530085a.27.1751270521143;
        Mon, 30 Jun 2025 01:02:01 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772df637sm63677026d6.79.2025.06.30.01.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:02:00 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 30 Jun 2025 05:01:11 -0300
Subject: [PATCH v4 4/6] platform/x86: samsung-galaxybook: Transition new
 firmware_attributes API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-fw-attrs-api-v4-4-1a04952b255f@gmail.com>
References: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
In-Reply-To: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10903; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=liILi0h70NtnHMaTrnZq1JtW1kl+WBBQwRBtx4jqqqU=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlJLskW2oYR7au2XeWV7Lb+PJt3/rV7XDGFroZWC/MM+
 h43ll/tKGVhEONikBVTZGlPWPTtUVTeW78Dofdh5rAygQxh4OIUgIlsa2Fk+Mxx7p1TyWu93Ev2
 fxQLL6y2bVlz+objEdVnl1OCPBU0fBj+qa900ikvFKi8YfSdsZKHpW/fNnfrw692HZfw2fohS/c
 RLwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Transition to new firmware_attributes API.

Defining firmware_attributes groups statically through
DEFINE_FWAT_ENUM_GROUP() incurs in a minor ABI change. In particular the
display_name_language_code attribute is no longer created. Fortunately,
this doesn't break user-space compatibility, because this attribute is
not required, neither by the ABI specification nor by user-space tools.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 244 ++++++++----------------------
 1 file changed, 61 insertions(+), 183 deletions(-)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 9a5a7b956a9f6a2738470e83ce93f4cccf4bf3b4..d1db2a3f716aafc5a314f2bdc57f7c958a9ae346 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -36,8 +36,6 @@ struct samsung_galaxybook {
 	struct platform_device *platform;
 	struct acpi_device *acpi;
 
-	struct device *fw_attrs_dev;
-	struct kset *fw_attrs_kset;
 	/* block in case firmware attributes are updated in multiple threads */
 	struct mutex fw_attr_lock;
 
@@ -60,36 +58,6 @@ struct samsung_galaxybook {
 	u8 profile_performance_modes[PLATFORM_PROFILE_LAST];
 };
 
-enum galaxybook_fw_attr_id {
-	GB_ATTR_POWER_ON_LID_OPEN,
-	GB_ATTR_USB_CHARGING,
-	GB_ATTR_BLOCK_RECORDING,
-};
-
-static const char * const galaxybook_fw_attr_name[] = {
-	[GB_ATTR_POWER_ON_LID_OPEN] = "power_on_lid_open",
-	[GB_ATTR_USB_CHARGING]      = "usb_charging",
-	[GB_ATTR_BLOCK_RECORDING]   = "block_recording",
-};
-
-static const char * const galaxybook_fw_attr_desc[] = {
-	[GB_ATTR_POWER_ON_LID_OPEN] = "Power On Lid Open",
-	[GB_ATTR_USB_CHARGING]      = "USB Charging",
-	[GB_ATTR_BLOCK_RECORDING]   = "Block Recording",
-};
-
-#define GB_ATTR_LANGUAGE_CODE "en_US.UTF-8"
-
-struct galaxybook_fw_attr {
-	struct samsung_galaxybook *galaxybook;
-	enum galaxybook_fw_attr_id fw_attr_id;
-	struct attribute_group attr_group;
-	struct kobj_attribute display_name;
-	struct kobj_attribute current_value;
-	int (*get_value)(struct samsung_galaxybook *galaxybook, bool *value);
-	int (*set_value)(struct samsung_galaxybook *galaxybook, const bool value);
-};
-
 struct sawb {
 	u16 safn;
 	u16 sasb;
@@ -908,193 +876,106 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
 
 /* Firmware Attributes setup */
 
-static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+static const char * const galaxybook_possible_vals[] = {
+	[false] = "0", [true] = "1", NULL
+};
+
+static int power_on_lid_open_read(struct device *dev, long id, int *val_idx)
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
-	bool value;
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+	bool val;
 	int err;
 
-	err = fw_attr->get_value(fw_attr->galaxybook, &value);
+	err = power_on_lid_open_acpi_get(galaxybook, &val);
 	if (err)
 		return err;
 
-	return sysfs_emit(buf, "%u\n", value);
+	*val_idx = val;
+
+	return 0;
 }
 
-static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
-				   const char *buf, size_t count)
+static int power_on_lid_open_write(struct device *dev, long id, int val_idx)
 {
-	struct galaxybook_fw_attr *fw_attr =
-		container_of(attr, struct galaxybook_fw_attr, current_value);
-	struct samsung_galaxybook *galaxybook = fw_attr->galaxybook;
-	bool value;
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+
+	return power_on_lid_open_acpi_set(galaxybook, val_idx ? true : false);
+}
+
+DEFINE_FWAT_ENUM_GROUP(power_on_lid_open, "Power On Lid Open", galaxybook_possible_vals,
+		       false, 0644, FWAT_ENUM_ALL_ATTRS);
+
+static int usb_charging_read(struct device *dev, long id, int *val_idx)
+{
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+	bool val;
 	int err;
 
-	if (!count)
-		return -EINVAL;
-
-	err = kstrtobool(buf, &value);
+	err = usb_charging_acpi_get(galaxybook, &val);
 	if (err)
 		return err;
 
-	guard(mutex)(&galaxybook->fw_attr_lock);
+	*val_idx = val;
 
-	err = fw_attr->set_value(galaxybook, value);
+	return 0;
+}
+
+static int usb_charging_write(struct device *dev, long id, int val_idx)
+{
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+
+	return usb_charging_acpi_set(galaxybook, val_idx ? true : false);
+}
+
+DEFINE_FWAT_ENUM_GROUP(usb_charging, "USB Charging", galaxybook_possible_vals,
+		       false, 0644, FWAT_ENUM_ALL_ATTRS);
+
+static int block_recording_read(struct device *dev, long id, int *val_idx)
+{
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+	bool val;
+	int err;
+
+	err = block_recording_acpi_get(galaxybook, &val);
 	if (err)
 		return err;
 
-	return count;
+	*val_idx = val;
+
+	return 0;
 }
 
-#define NUM_FW_ATTR_ENUM_ATTRS  6
-
-static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
-				   const enum galaxybook_fw_attr_id fw_attr_id,
-				   int (*get_value)(struct samsung_galaxybook *galaxybook,
-						    bool *value),
-				   int (*set_value)(struct samsung_galaxybook *galaxybook,
-						    const bool value))
+static int block_recording_write(struct device *dev, long id, int val_idx)
 {
-	struct galaxybook_fw_attr *fw_attr;
-	struct attribute **attrs;
 
-	fw_attr = devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_attr), GFP_KERNEL);
-	if (!fw_attr)
-		return -ENOMEM;
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
 
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
+	return block_recording_acpi_set(galaxybook, val_idx ? true : false);
 }
 
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
+DEFINE_FWAT_ENUM_GROUP(block_recording, "Block Recording", galaxybook_possible_vals,
+		       false, 0644, FWAT_ENUM_ALL_ATTRS);
 
 static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
 {
+	struct fwat_device *fdev;
 	bool value;
 	int err;
 
-	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->fw_attr_lock);
-	if (err)
-		return err;
-
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
+	fdev = devm_fwat_device_register(&galaxybook->platform->dev, DRIVER_NAME, galaxybook, NULL);
+	if (IS_ERR(fdev))
+		return PTR_ERR(fdev);
 
 	err = power_on_lid_open_acpi_get(galaxybook, &value);
 	if (!err) {
-		err = galaxybook_fw_attr_init(galaxybook,
-					      GB_ATTR_POWER_ON_LID_OPEN,
-					      &power_on_lid_open_acpi_get,
-					      &power_on_lid_open_acpi_set);
+		err = fwat_create_group(fdev, &power_on_lid_open_group_data);
 		if (err)
 			return err;
 	}
 
 	err = usb_charging_acpi_get(galaxybook, &value);
 	if (!err) {
-		err = galaxybook_fw_attr_init(galaxybook,
-					      GB_ATTR_USB_CHARGING,
-					      &usb_charging_acpi_get,
-					      &usb_charging_acpi_set);
+		err = fwat_create_group(fdev, &usb_charging_group_data);
 		if (err)
 			return err;
 	}
@@ -1107,10 +988,7 @@ static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
 
 	galaxybook->has_block_recording = true;
 
-	return galaxybook_fw_attr_init(galaxybook,
-				       GB_ATTR_BLOCK_RECORDING,
-				       &block_recording_acpi_get,
-				       &block_recording_acpi_set);
+	return fwat_create_group(fdev, &block_recording_group_data);
 }
 
 /*

-- 
2.50.0

