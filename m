Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0687B1805A;
	Sun, 22 Jun 2025 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550698; cv=none; b=hGClOfvfqvVJdEOWll4U4vNmcSobA/97CPqOq6Pa2WxhkNCf2/B0VwqHxOF8ZNKiSnABvLCFCT+AU+g3SZXtWlgY2Nd2HdVphsecKoLmKxJnOOeNDLcZfrojop+6QZn/g+DZZYmu26F+F3NnKqmFTrvsH8kF9Lrw3VeKZeReDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550698; c=relaxed/simple;
	bh=liILi0h70NtnHMaTrnZq1JtW1kl+WBBQwRBtx4jqqqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tv5eDfkQnznU2Z1TEABHgE7I9LZQvV7ra3TeABve6v7izGsKCfYsYdRF8KqwVdJoCixQRSYLyBjfEQ9H4JcRkKCwEL89MyJ+rE8HrbKhQxMn/h8/V3eKGfONyuCPnm90FZaD8/nEE0YDJt9CT5PLUxXcl4NIRcA9OQtv9gp6JIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfSj/f0j; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfSj/f0j"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-749248d06faso640728b3a.2;
        Sat, 21 Jun 2025 17:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750550696; x=1751155496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2/KSwnwApNBj2qg4eJFgFllM2G5u9JrEk978fuXLkk=;
        b=mfSj/f0jH2ee+cKSv62gUDjDnL39Lg4WIVjaRgnj9TwC4ogAFnvtMD1eplzliImJgN
         uMyZ7cidgJ/tvoBPJdT1DCx0qY/VG1Tn8EG9UW6X8KHQbJMYcCYxwwiF9X2wpm3C2mau
         jztU51TgOGU2qJm3UYXMt2ZapCjzdvB44mgxpazyyOZNhvHJIKdsH+SgVfFheWXe1C/S
         I63AlM7p6DTTTRSgMCtIApKKVDtKdVleYTFtN//R1WYt6ASmAZ5MLN0KFRwjbOO9ZRGS
         IOmVgBqRuEHbbp00aoCbc4XT+TQs9ofssdH/mkAs3Zxt+HTRYHs6y/o3mFMKudMF2oBH
         wfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750550696; x=1751155496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2/KSwnwApNBj2qg4eJFgFllM2G5u9JrEk978fuXLkk=;
        b=PmErEfzrliJ/3nYl5WG9GcVabsveFuv/C7N42QVxeB43Egaq2dJKyOHqF0SUZnln/q
         EDmFck+ynUw9bEf+mglvcgJ4bHckyNhbjqQ3/hxhgzTb1aMtQnL+nFTVUJ34oSk6VCX8
         8VoXz0wzyImISVT5ib6YcaWk11b1wAuwIGFQwYoU2plfwHNIXWavy1IY4ljhMzTSOciY
         bI720MTI8BlMDiSczlbCTy5CEOCuXQWvkBEDjajQ+Kvq8I3AXKkQ/CNHL2aR7cUVqg8I
         aKP7U/RfumblCplLF4zvTiG4IayObNUKfo4T1FCbJj4ao6S04TK2X9tfSmGacsmDDDlO
         shBA==
X-Forwarded-Encrypted: i=1; AJvYcCV5x7SnUrJMkN9VXJkl/VE8A5NUfrfbkQfXVnyyQqsyMSoHFTsxFe8ZKuAw95mzIBKb2vkguCIM9zJopcSH15vB57urew==@vger.kernel.org, AJvYcCXD3zEyBUxexPm0+7ymvq6m5VyK+JLRu8Zcxu1qGewB8Q+rlvrOz0kzLryIx2Sga8rxgXq1eHW2wien7CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwztbXj9jBkSZiRpanEaTEzDqPL0IqzsA7qFm4B39AqPFtyY0ch
	vClNFZ3cohDmPs55LdWo4rsEj62nar+nYEr/0HVqgBalKiW36oAJBD9c
X-Gm-Gg: ASbGncufTNwRZV4j820tH/b24AO7XjRBHu6XK0LXBt6nlyCPnSemv36z/zpjCY8P7he
	zq+65pkWg9l4e0S9n1G7cr5ZIvRtj2V3PcsHErUNreiwcRiEg7vUx0VgZ6tEYvcF/qTwwm0NTb2
	KYM8iH7vfhv0a9szZG5etvIrW1YgiQWyORJRLUAXNSuLAZ+Fcol1dr/9iH/W0I010RRCJ0ZHs5v
	90Mm15oscYK99eH8rCqVZGJDKJhtW/5YV0Wi5G3s5KM9UW8mPEpi2lrb75ibJYPr8EnbJ1APMfX
	sBObHqcIrtwOmyJndhg6KViu2jnLmxa1w5iXxvg6kVDRWghKPuF6p3iA+T1UnXd5sz4dZIOO
X-Google-Smtp-Source: AGHT+IFtsZ9q2T86H6D8O76MCN+rXPQrc/Zj8zCoI46Ni7R7B0emU5wUSs5UuHY91MEwdstztE4NPw==
X-Received: by 2002:a05:6a00:1704:b0:748:f1ba:9aff with SMTP id d2e1a72fcca58-7490d478954mr8722457b3a.5.1750550696235;
        Sat, 21 Jun 2025 17:04:56 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626326sm4941424b3a.75.2025.06.21.17.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:04:55 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 21 Jun 2025 21:04:07 -0300
Subject: [PATCH v3 4/6] platform/x86: samsung-galaxybook: Transition new
 firmware_attributes API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-fw-attrs-api-v3-4-3dd55e463396@gmail.com>
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
In-Reply-To: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
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
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnhHlN7msoM1ife1p29p+Rp3eNHHjcqhE/L5AcyH6hvP
 RfPJjWjo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACaSn8bIMP2l8+OTFyJKrn1d
 Jlugd69wSe3bCzy2i55wp1vc2Vmq/JXhD5fryvmy5i2P2RM/z7sfWMPGFd4+efLh/G5rx+jLz/z
 NmQE=
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

