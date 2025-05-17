Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEA1DEFDA;
	Sat, 17 May 2025 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747471949; cv=none; b=sa8mcDqq2O18yGuDB7ylSDoOUH6+OHqfEVe30yff8nKaiUrJi3SJczB03eHVuHr0Lwwmq/EE4tz/cPy7skCje4dyFqXGG6Sx4yrkPfBVLG7DyDkimSR6SV3Xwn1HTIWxfUO3TYsbZchis6eQctCN25avQUedkBAGpaUVVRx5HPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747471949; c=relaxed/simple;
	bh=5fWdlkwBhh2VysR3vGzbRF+lq4S0g74Mggb2Qpm7QeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0MW0cBhVvS/MrVH4v9xEuAJCsPNCMVwaJny/k0T+X8vGCi8MWOSTbUbBmHxrXdH7HaoHoJ976Z+aBnjPnywoxEI8lun9mbzVLYnvRIGK8mGYT8qAQZSqYDHq5nN1lL05z+VaHNcBDs54nAo6um4I3VJUrMvaRUKGirDAnPcNPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIi+znEw; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIi+znEw"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52c8849d7a5so1005393e0c.0;
        Sat, 17 May 2025 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747471946; x=1748076746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVXvDi5+Ff0T/Ic/az84hkliZguJhkKjrGAsxpJ7wpk=;
        b=KIi+znEw8XWygRpv2So4rwzi2f/Pd4Byk0fiB+3X/dETH/QmZYgynFW9htQBUoF7iF
         Ur4ZT1KCrBwFmcsz9Caws9j3WYGpmcKU/RmTHVyI4jg2IYSvRL5b6xw29QOCEE7dYavS
         4la6KAfVyV35oZpcKFk8z3Fs2zKPwtSxpH4J6NzHU97Bbh3dqXVsGhUDfcZ99l+frVPH
         q/Ny5G2kEPMgHBywXioaBIfc7hUE4IxzuvrBXVq7FFunI0Wg0Q0Cj0jcjQDtDtOBasWw
         aXwqZQdSoGlmSfSFkIvi7rXDKKjWff4CWfADGNOo2mToB41ArMxtw5CQ6s+OR+03y1++
         FOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747471946; x=1748076746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVXvDi5+Ff0T/Ic/az84hkliZguJhkKjrGAsxpJ7wpk=;
        b=iMosLjtsJ2EtP7kLbjYdzxsBn8QEE3hRMHMlFxYOMC/VinQZdSZtqifgGRUcYUpYlp
         qrnxA46EzQygSyXDkyQuJd3lumGVkVma8hFSIe6RbOWwDYEt4rPmA3aQE1C/NqOlFnJ5
         Cbw8E51fM58aQG1uOvG9Aozj2Ti+C5pxD0yqwLYUhnUf22GG7iuYLlEPHNymwbLIuwsI
         +pic+fouIq3QFWNyCzDokbM9POIw3rbdv1ZXcQAZfqPND7j62DoCtjq3GNNLgeJv/TmK
         myMtCpMH00bvsAohPyezybqC2ODhGde4D3SQ++cYN86KFa2RIVh1eIAGfhStlppOdI5i
         T8cg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Xt4ae+so6H+ypOmTmXD63FlLT55YO1RoBsWjq5+Orqr6KEVn1umUKerBewH0UkgmgWy1hpDmOvZBqRYSPJd8QvSfHQ==@vger.kernel.org, AJvYcCUgtruXxyuW+wuh+RbwDXnkmdxV4iuxFSUwQ94acEOg27KWpAiwu7ROR8Nx16ZycZFD5Nf3NnGW8dKSCRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoMKvVRLmQ+ZL3c1ZF7TCKK7VNM5Mky+lpxU6K3MweIvBlIEk
	wkT2olT7Lt/dRWNBwIU+gkpv4uwe73/MYNWDlL9OiIuuYto3yhIUtP54n0lquw==
X-Gm-Gg: ASbGncuCCMGM1TdnOTwCeY8kSYZdHGZ3+csydHM/cTX8THheobtnWn9TfvWTfVOajEw
	ztm3L8H66sibko6XVa1GJvqVBQEH3D0Brwl5xcZzu4kdvdCksvZABQs86vBR1yRDqru2SrLLHd7
	vDuwzrgNYfboHHxwkfU7qWSpHhDm71NFSvZwuvw9NpeIAX2b7uAaXNJFHAgOpmZiAkpf5pF4bnZ
	Ng6PmWYhdc078TrlGpv442A7XOCJTQpgkSXMDrRMFTFLK6l5T/slnQzeusm0YvLi/McW1ECgsex
	HNdwTbA+ga7jJ6ERfujFrtrIWFB1Gx+GwG1BIT6oZnvCyLaMeA==
X-Google-Smtp-Source: AGHT+IHolgOgY/LKg3X1KhcyCcZVqJss2/wGhxz+pRT8wvHUT20mSEBAdJUpZLdWjvZBR2Q1nDzX3Q==
X-Received: by 2002:a05:6122:1d48:b0:529:1a6a:cd48 with SMTP id 71dfb90a1353d-52dba964347mr7859500e0c.6.1747471946319;
        Sat, 17 May 2025 01:52:26 -0700 (PDT)
Received: from [192.168.1.26] ([181.85.227.70])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba9405adsm3455812e0c.11.2025.05.17.01.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 01:52:25 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 17 May 2025 05:51:40 -0300
Subject: [PATCH v2 5/5] platform/x86: samsung-galaxybook: Transition to new
 firmware_attributes API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-fw-attrs-api-v2-5-fa1ab045a01c@gmail.com>
References: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
In-Reply-To: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11814; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=5fWdlkwBhh2VysR3vGzbRF+lq4S0g74Mggb2Qpm7QeQ=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkafvrl767cXsLivPno+ZNej65/NNi+8Hml3um7UU2Xq
 4Tntx7821HKwiDGxSArpsjSnrDo26OovLd+B0Lvw8xhZQIZwsDFKQATEY9g+CtQ/T7P2t6OyT/u
 mGPyyvPzi9zVd05fPKnxtsnKGbItnw8wMnz8H/E5fkHv21tzC29f7o8qUjVZqhe1+ccesVmTZyh
 9fM0FAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Transition to new firmware_attributes API and replace `enumeration` types
with the simpler `boolean` type.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 308 ++++++++++++------------------
 1 file changed, 123 insertions(+), 185 deletions(-)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 5878a351993eb05a4c5c2c75b4915d972ce9becc..c69ac4b240ca2acb37ba751853ce33e10a91ebb3 100644
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
@@ -908,209 +900,155 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
 
 /* Firmware Attributes setup */
 
-static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+static int galaxybook_fwat_read(struct device *dev, long aux, const char **str)
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
+	*str = value ? "1" : "0";
+
+	return 0;
 }
 
-static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
-				   const char *buf, size_t count)
+static int galaxybook_fwat_write(struct device *dev, long aux, const char *str,
+				 size_t count)
 {
-	struct galaxybook_fw_attr *fw_attr =
-		container_of(attr, struct galaxybook_fw_attr, current_value);
-	struct samsung_galaxybook *galaxybook = fw_attr->galaxybook;
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+	bool val;
+	int err;
+
+	err = kstrtobool(str, &val);
+	if (err)
+		return err;
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
+					 enum fwat_property prop, char *buf)
+{
+	switch (prop) {
+	case FWAT_PROP_DISPLAY_NAME:
+		return sysfs_emit(buf, "%s\n", galaxybook_fwat_desc[aux]);
+	case FWAT_PROP_LANGUAGE_CODE:
+		return sysfs_emit(buf, "%s\n", GB_ATTR_LANGUAGE_CODE);
+	case FWAT_PROP_DEFAULT:
+		return sysfs_emit(buf, "%d\n", 0);
+	case FWAT_ENUM_PROP_POSSIBLE_VALUES:
+		return sysfs_emit(buf, "0;1\n");
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+DEFINE_FWAT_OPS(galaxybook_fwat, enumeration);
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
+	FWAT_ENUM_PROP_POSSIBLE_VALUES,
+};
 
-static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
-				   const enum galaxybook_fw_attr_id fw_attr_id,
-				   int (*get_value)(struct samsung_galaxybook *galaxybook,
-						    bool *value),
-				   int (*set_value)(struct samsung_galaxybook *galaxybook,
-						    const bool value))
+static const struct fwat_attr_config * const galaxybook_fwat_config[] = {
+	FWAT_CONFIG_AUX("power_on_lid_open", 0644,
+			GB_ATTR_POWER_ON_LID_OPEN,
+			&galaxybook_fwat_ops,
+			galaxybook_fwat_props,
+			ARRAY_SIZE(galaxybook_fwat_props)),
+	FWAT_CONFIG_AUX("usb_charging", 0644,
+			GB_ATTR_USB_CHARGING,
+			&galaxybook_fwat_ops,
+			galaxybook_fwat_props,
+			ARRAY_SIZE(galaxybook_fwat_props)),
+	FWAT_CONFIG_AUX("block_recording", 0644,
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
@@ -1389,7 +1327,7 @@ static int galaxybook_probe(struct platform_device *pdev)
 		return dev_err_probe(&galaxybook->platform->dev, err,
 				     "failed to initialize kbd_backlight\n");
 
-	err = galaxybook_fw_attrs_init(galaxybook);
+	err = galaxybook_fwat_init(galaxybook);
 	if (err)
 		return dev_err_probe(&galaxybook->platform->dev, err,
 				     "failed to initialize firmware-attributes\n");

-- 
2.49.0

