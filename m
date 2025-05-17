Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BBB1DF749;
	Sat, 17 May 2025 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747471937; cv=none; b=lRkYCOsrpb/vjpjGVI7LTfL+2WlmNcGvGhQ3MB1ugg3V2XtDE001uaXu4DhQooogTO2HvMgXXKC/MQBmtItJyvIdZOlSM2H0YnA4941KRGtC3OGkh+qznXby0xh9cqi8YfQyeQSCIl4+a9nQzBwntvx8xgcXLHlrgicbFKhTYxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747471937; c=relaxed/simple;
	bh=v10ccQwiKauEsWWKcKaDIKd+NhV01PoUJeGo+T42gvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awudvg+wraEj4bOw3pBbpxEUlmiOyzdQSdbrSioOIQ2sEJt3YHgt88aX8WIo9FvJh2GGYkyUSqkhbbh1hbZxXqOWV+33EiID+KYXVlmJDQZkdO52Ra0naLb2CjF8H2n6cuviRRN4zxwkempyNLdSSMD+GmgmdVuEx3Qtb+bMRTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/i1kbRo; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/i1kbRo"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52403e39a23so1636027e0c.2;
        Sat, 17 May 2025 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747471933; x=1748076733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ArP9b/wyiV+t5knMSQpx52Kzo2+Ytjhthg01f0Li34=;
        b=Q/i1kbRoOnPCuxuWokvQuI1zMhdQEjByMdwx3Z7WzAAIoXzRIosw06nF9mdiglvnc1
         jGs6gU5B/go+7KfrbVCZeO6rwiy1MY24zC1fTvVb6U9iv6KwPuUzpnRn4s/WecWFu5Jd
         eJyTs5hMHa1O2r/7G14jRDo8c+/L/0cCIDpucOya5aKRPF7BLv0zCppcky7wohZ+S+tO
         bfPSgKQ3mlkBDRgZjPTDMswY2vEn2PmmUGc69xw8uTLcp58aY12sH8RX/KXRlDAQjZVy
         /RtsGL0NYs4Y1AjX+F2dcv1dELdFYq8CZPLNqzcPziqxxz5kjQHHHkuhKgQ/OmSyjiVU
         oMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747471933; x=1748076733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ArP9b/wyiV+t5knMSQpx52Kzo2+Ytjhthg01f0Li34=;
        b=dAtBYN8rNjS7eK02EvlmGB+BcgCczTf5orSYuGu536bf6weE6JzRsLl3wsIJC0OBF1
         qYVivFKqqxK9DXqGSJ5eFMvhbtTylx4ddnqmxHIshVbCWiGRuDqfhzGvoksCNm5XISxR
         SPiNbPg5ubVPQbFRoFAnul67a5usb5DZxfX6u+8922hngFt+PGVs3jv5QSF9d0blCCqH
         XCW7O1nar1W7OdfKzW+3Kcxb9FYvcSqlRU3dBzrtW3bDI1ORD2WK+hscu0UWDqL5a518
         DeTeCOLoq1UdrOfMuz+x0INFGGmUrqrIFFePT+gbZwM7hlZhYw+G30CRRbCu/k5K1ZOf
         jAgw==
X-Forwarded-Encrypted: i=1; AJvYcCU6BBOkRDzeHXQmdRp8hH3YRtVAbyWA7Blk3K1ukKAOwI1FwnlJK/wikiK6ixIzHUc3KgEkyx8ggNVYJoy87XCTdSz0zQ==@vger.kernel.org, AJvYcCU9MMA1QAgNprdSlhdSuP8Qtu95aAYewT+CJqN+7NtOYmuUeDDDja+1bsQuC7q61GMeb53H2ONB2sEexFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfP3xHyMM4TEVTTjyVRBxgpF5EyaM8OO8faX6BIWaH5fQzaeFl
	b977C74gq6wie9zrgx8MvWj38sFyHdLVcOk/18SkC6c5pEuu04MqnrmD
X-Gm-Gg: ASbGncv/3T+V92hJdX23RW7eKoZRLCH9XbWSPLkcZsqnNyIb2eCFEVdhu7GKJ1ErE5d
	wDrewmLkPGTfMljwpEp9inXrphFVtgKFIw7GpIrjsneTafLxqAd7syM5Lvg430oCAA81WUr+B2/
	uQMqGdT+Lrd0s7ppBR2OoWa4+C0My7OGmE6bV58oujFFKj1mr7aAoM5bntgYopVTq4rkiRPSRiY
	trUBc/MjAiPm47/HeH0zy7TVS4NDXQdkhT8nV9tyDcDc4CJJsse1kqj8IrZE4vl+FOY4+W552a2
	7jWcoPdUtD2uVZPtBtJ5MGpL+pnHqf+OX59aqS2ecVp582yX2g==
X-Google-Smtp-Source: AGHT+IFrqn7Sfxbw5x2+Uoh0tCSUzZuNY5btBPRdSu2uQFo+Rp3RlYC9mfrg8R93MhJyLSclJZRSQg==
X-Received: by 2002:a05:6122:1d48:b0:526:2210:5b68 with SMTP id 71dfb90a1353d-52dba80aa18mr7609873e0c.4.1747471933256;
        Sat, 17 May 2025 01:52:13 -0700 (PDT)
Received: from [192.168.1.26] ([181.85.227.70])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba9405adsm3455812e0c.11.2025.05.17.01.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 01:52:12 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 17 May 2025 05:51:37 -0300
Subject: [PATCH v2 2/5] platform/x86: firmware_attributes_class: Add a high
 level API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-fw-attrs-api-v2-2-fa1ab045a01c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19584; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=v10ccQwiKauEsWWKcKaDIKd+NhV01PoUJeGo+T42gvE=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkafvqWgpWKVz4lTS/ffaPmh072tGlhH9nNW9/F8x7M3
 M+scCW3o5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACaSkcLwTzkx65bxZtYlzLfT
 TC8djLt1JK1NZcPqq3GrK66El3zhCmNkmBgl4mryKa/n77PF+rr/e78KBL/xDWj100h67GOqrXq
 AAwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add an attribute configuration mechanism through the newly introduced
`struct fwat_dev_config`, which makes use of other documented structs
and callbacks.

This API aims to be simple, yet flexible. In order to accomplish this,
the following features were taken into account:

* Ability to statically define attributes
* Custom read/write callbacks for each attribute type
* Ability to map attributes to numbers in order to differentiate them in
  callbacks (`aux` number)
* Ability to reuse read/write callbacks in different attributes
* Ability to reuse property selection in different attributes
* Optional visibility callback for dynamic attribute visibility

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/firmware_attributes_class.c | 275 ++++++++++++++++++++++-
 drivers/platform/x86/firmware_attributes_class.h | 224 ++++++++++++++++++
 2 files changed, 496 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index e2dcf2781513b5b033b019780d3e28115e83a1a5..29401b81b25b9bb1332dbe56eadf96ff81e91c2f 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -8,14 +8,259 @@
 #include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include "firmware_attributes_class.h"
 
+#define to_fwat_attribute_ext(_a) container_of_const(_a, struct fwat_attribute_ext, attr)
+
+struct fwat_attribute_ext {
+	struct fwat_attribute attr;
+	enum fwat_property prop;
+	const struct fwat_attr_config *config;
+};
+
 const struct class firmware_attributes_class = {
 	.name = "firmware-attributes",
 };
 EXPORT_SYMBOL_GPL(firmware_attributes_class);
 
+static const char * const fwat_type_labels[] = {
+	[fwat_type_integer]		= "integer",
+	[fwat_type_string]		= "string",
+	[fwat_type_enumeration]		= "enumeration",
+};
+
+static const char * const fwat_prop_labels[] = {
+	[FWAT_PROP_DISPLAY_NAME]		= "display_name",
+	[FWAT_PROP_LANGUAGE_CODE]		= "display_name_language_code",
+	[FWAT_PROP_DEFAULT]			= "default",
+
+	[FWAT_INT_PROP_MIN]			= "min_value",
+	[FWAT_INT_PROP_MAX]			= "max_value",
+	[FWAT_INT_PROP_INCREMENT]		= "scalar_increment",
+
+	[FWAT_STR_PROP_MIN]			= "min_length",
+	[FWAT_STR_PROP_MAX]			= "max_length",
+
+	[FWAT_ENUM_PROP_POSSIBLE_VALUES]	= "possible_values",
+};
+
+static ssize_t
+fwat_type_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_attr_config *config = ext->config;
+
+	return sysfs_emit(buf, "%s\n", fwat_type_labels[config->ops->type]);
+}
+
+static ssize_t
+fwat_property_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_attr_config *config = ext->config;
+
+	if (!config->ops->prop_read)
+		return -EOPNOTSUPP;
+
+	return config->ops->prop_read(dev, config->aux, ext->prop, buf);
+}
+
+static ssize_t
+fwat_current_value_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_attr_config *config = ext->config;
+	const struct fwat_attr_ops *ops = config->ops;
+	const char *str;
+	long int_val;
+	int ret;
+
+	switch (ops->type) {
+	case fwat_type_integer:
+		if (!ops->integer.read)
+			return -EOPNOTSUPP;
+
+		ret = ops->integer.read(dev, config->aux, &int_val);
+		if (ret)
+			return ret;
+
+		return sysfs_emit(buf, "%ld\n", int_val);
+	case fwat_type_string:
+		if (!ops->string.read)
+			return -EOPNOTSUPP;
+
+		ret = ops->string.read(dev, config->aux, &str);
+		if (ret)
+			return ret;
+
+		return sysfs_emit(buf, "%s\n", str);
+	case fwat_type_enumeration:
+		if (!ops->enumeration.read)
+			return -EOPNOTSUPP;
+
+		ret = ops->enumeration.read(dev, config->aux, &str);
+		if (ret)
+			return ret;
+
+		return sysfs_emit(buf, "%s\n", str);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static ssize_t
+fwat_current_value_store(struct device *dev, const struct fwat_attribute *attr,
+			 const char *buf, size_t count)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_attr_config *config = ext->config;
+	const struct fwat_attr_ops *ops = config->ops;
+	long int_val;
+	int ret;
+
+	switch (ops->type) {
+	case fwat_type_integer:
+		if (!ops->integer.write)
+			return -EOPNOTSUPP;
+
+		ret = kstrtol(buf, 0, &int_val);
+		if (ret)
+			return ret;
+
+		ret = ops->integer.write(dev, config->aux, int_val);
+		break;
+	case fwat_type_string:
+		if (!ops->string.write)
+			return -EOPNOTSUPP;
+
+		ret = ops->string.write(dev, config->aux, buf, count);
+		break;
+	case fwat_type_enumeration:
+		if (!ops->enumeration.write)
+			return -EOPNOTSUPP;
+
+		ret = ops->enumeration.write(dev, config->aux, buf, count);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return ret ? ret : count;
+}
+
+static struct attribute *
+fwat_alloc_attr(struct device *dev, const struct fwat_attr_config *config,
+		const char *attr_name, umode_t mode, enum fwat_property prop,
+		ssize_t (*show)(struct device *dev, const struct fwat_attribute *attr,
+				char *buf),
+		ssize_t (*store)(struct device *dev, const struct fwat_attribute *attr,
+				 const char *buf, size_t count))
+{
+	struct fwat_attribute_ext *fattr;
+
+	fattr = devm_kzalloc(dev, sizeof(*fattr), GFP_KERNEL);
+	if (!fattr)
+		return NULL;
+
+	fattr->attr.attr.name = attr_name;
+	fattr->attr.attr.mode = mode;
+	fattr->attr.show = show;
+	fattr->attr.store = store;
+	fattr->prop = prop;
+	fattr->config = config;
+	sysfs_attr_init(&fattr->attr.attr);
+
+	return &fattr->attr.attr;
+}
+
+static struct attribute **
+fwat_create_attrs(struct device *dev, const struct fwat_attr_config *config)
+{
+	struct attribute **attrs;
+	enum fwat_property prop;
+	struct attribute *attr;
+	unsigned int index = 0;
+
+	attrs = devm_kcalloc(dev, config->num_props + 3, sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return NULL;
+
+	/* Optional attributes */
+	for (; index < config->num_props; index++) {
+		prop = config->props[index];
+		attr = fwat_alloc_attr(dev, config, fwat_prop_labels[prop],
+				       0444, prop, fwat_property_show, NULL);
+		if (!attr)
+			return NULL;
+		attrs[index] = attr;
+	}
+
+	/* Mandatory attributes */
+	attr = fwat_alloc_attr(dev, config, "type", 0444, 0, fwat_type_show, NULL);
+	if (!attr)
+		return NULL;
+	attrs[index++] = attr;
+	attr = fwat_alloc_attr(dev, config, "current_value", config->mode, 0,
+			       fwat_current_value_show, fwat_current_value_store);
+	if (!attr)
+		return NULL;
+	attrs[index++] = attr;
+
+	return attrs;
+}
+
+static const struct attribute_group *
+fwat_create_group(struct device *dev, const struct fwat_attr_config *config)
+{
+	struct attribute_group *group;
+	struct attribute **attrs;
+
+	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return NULL;
+
+	attrs = fwat_create_attrs(dev, config);
+	if (!attrs)
+		return NULL;
+
+	group->name = config->name;
+	group->attrs = attrs;
+
+	return group;
+}
+
+static const struct attribute_group **
+fwat_create_auto_groups(struct device *dev, const struct fwat_dev_config *config)
+{
+	const struct attribute_group **groups;
+	const struct attribute_group *grp;
+	unsigned int index = 0;
+	size_t ngroups = 0;
+
+	while (config->attrs_config[ngroups])
+		ngroups++;
+
+	groups = devm_kcalloc(dev, ngroups + 1, sizeof(*groups), GFP_KERNEL);
+	if (!groups)
+		return NULL;
+
+	for (unsigned int i = 0; i < ngroups; i++) {
+		if (config->is_visible &&
+		    !config->is_visible(dev, config->attrs_config[i]))
+			continue;
+
+		grp = fwat_create_group(dev, config->attrs_config[i]);
+		if (!grp)
+			return NULL;
+
+		groups[index++] = grp;
+	}
+
+	return groups;
+}
+
 static ssize_t fwat_attrs_kobj_show(struct kobject *kobj, struct attribute *attr,
 				    char *buf)
 {
@@ -62,6 +307,7 @@ static const struct kobj_type fwat_attrs_ktype = {
  *			  device
  * @parent: Parent device
  * @name: Name of the class device
+ * @config: Device configuration
  * @data: Drvdata of the class device
  * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
  *
@@ -73,8 +319,10 @@ static const struct kobj_type fwat_attrs_ktype = {
  */
 struct fwat_device *
 fwat_device_register(struct device *parent, const char *name, void *data,
+		     const struct fwat_dev_config *config,
 		     const struct attribute_group **groups)
 {
+	const struct attribute_group **auto_groups;
 	struct fwat_device *fadev;
 	struct device *dev;
 	int ret;
@@ -98,19 +346,36 @@ fwat_device_register(struct device *parent, const char *name, void *data,
 	if (ret)
 		goto out_kobj_put;
 
-	if (groups) {
-		ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
+	if (config) {
+		auto_groups = fwat_create_auto_groups(dev, config);
+		if (!auto_groups) {
+			ret = -ENOMEM;
+			goto out_kobj_unregister;
+		}
+
+		ret = sysfs_create_groups(&fadev->attrs_kobj, auto_groups);
 		if (ret)
 			goto out_kobj_unregister;
 	}
 
+	if (groups) {
+		ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
+		if (ret)
+			goto out_remove_auto_groups;
+	}
+
 	fadev->dev = dev;
 	fadev->groups = groups;
+	fadev->auto_groups = groups;
 
 	kobject_uevent(&fadev->attrs_kobj, KOBJ_ADD);
 
 	return fadev;
 
+out_remove_auto_groups:
+	if (config)
+		sysfs_remove_groups(&fadev->attrs_kobj, auto_groups);
+
 out_kobj_unregister:
 	kobject_del(&fadev->attrs_kobj);
 
@@ -126,6 +391,8 @@ void fwat_device_unregister(struct fwat_device *fwadev)
 {
 	if (fwadev->groups)
 		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->groups);
+	if (fwadev->auto_groups)
+		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->auto_groups);
 	kobject_del(&fwadev->attrs_kobj);
 	kobject_put(&fwadev->attrs_kobj);
 	device_unregister(fwadev->dev);
@@ -144,6 +411,7 @@ static void devm_fwat_device_release(void *data)
  *			       device
  * @parent: Parent device
  * @name: Name of the class device
+ * @config: Device configuration
  * @data: Drvdata of the class device
  * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
  *
@@ -157,12 +425,13 @@ static void devm_fwat_device_release(void *data)
  */
 struct fwat_device *
 devm_fwat_device_register(struct device *parent, const char *name, void *data,
+			  const struct fwat_dev_config *config,
 			  const struct attribute_group **groups)
 {
 	struct fwat_device *fadev;
 	int ret;
 
-	fadev = fwat_device_register(parent, name, data, groups);
+	fadev = fwat_device_register(parent, name, data, config, groups);
 	if (IS_ERR(fadev))
 		return fadev;
 
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index ad94bf91e5af30a2b8feb9abf224ee6f0d17600a..3a13c69ca6a0f993cf7c6bfae6e43f1eeaa002ab 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -18,11 +18,14 @@ extern const struct class firmware_attributes_class;
  * @dev: The class device.
  * @attrs_kobj: The "attributes" root kobject.
  * @groups: Sysfs groups attached to the @attrs_kobj.
+ * @auto_groups: Sysgs groups generated from &struct fwat_attr_config attached.
+ * to the @attrs_kobj
  */
 struct fwat_device {
 	struct device *dev;
 	struct kobject attrs_kobj;
 	const struct attribute_group **groups;
+	const struct attribute_group **auto_groups;
 };
 
 #define to_fwat_device(_k)	container_of_const(_k, struct fwat_device, attrs_kobj)
@@ -30,6 +33,7 @@ struct fwat_device {
 /**
  * struct fwat_attribute - The firmware-attributes's custom attribute
  * @attr: Embedded struct attribute.
+ * @aux: Auxiliary number defined by the user.
  * @show: Show method called by the "attributes" kobject's ktype.
  * @store: Store method called by the "attributes" kobject's ktype.
  */
@@ -43,14 +47,234 @@ struct fwat_attribute {
 
 #define to_fwat_attribute(_a) container_of_const(_a, struct fwat_attribute, attr)
 
+enum fwat_attr_type {
+	fwat_type_integer,
+	fwat_type_string,
+	fwat_type_enumeration,
+};
+
+enum fwat_property {
+	FWAT_PROP_DISPLAY_NAME,
+	FWAT_PROP_LANGUAGE_CODE,
+	FWAT_PROP_DEFAULT,
+
+	FWAT_INT_PROP_MIN,
+	FWAT_INT_PROP_MAX,
+	FWAT_INT_PROP_INCREMENT,
+
+	FWAT_STR_PROP_MIN,
+	FWAT_STR_PROP_MAX,
+
+	FWAT_ENUM_PROP_POSSIBLE_VALUES,
+};
+
+struct fwat_attr_config;
+
+struct long_ops {
+	int (*read)(struct device *dev, long aux, long *val);
+	int (*write)(struct device *dev, long aux, long val);
+};
+
+struct str_ops {
+	int (*read)(struct device *dev, long aux, const char **str);
+	int (*write)(struct device *dev, long aux, const char *str, size_t count);
+};
+
+/**
+ * struct fwat_attr_ops - Operations for a firmware *attribute*
+ * @type: Type of callbacks.
+ * @prop_read: Callback for retrieving each configured property of an attribute.
+ * @integer: Integer type callbacks.
+ * @string: String type callbacks.
+ * @enumeration: Enumeration type callbacks.
+ */
+struct fwat_attr_ops {
+	enum fwat_attr_type type;
+	ssize_t (*prop_read)(struct device *dev, long aux,
+			     enum fwat_property prop, char *buf);
+	union {
+		struct long_ops integer;
+		struct str_ops string;
+		struct str_ops enumeration;
+	};
+};
+
+/**
+ * struct fwat_attr_config - Configuration for a single firmware *attribute*
+ * @name: Name of the sysfs group associated with this *attribute*.
+ * @mode: Mode assigned to current_value
+ * @aux: Auxiliary number defined by the user, which will be passed to
+ *       read/write callbacks.
+ * @ops: Operations for this *attribute*.
+ * @props: Array of properties of this *attribute*.
+ * @num_props: Size of the props array.
+ */
+struct fwat_attr_config {
+	const char *name;
+	umode_t mode;
+	long aux;
+	const struct fwat_attr_ops *ops;
+	const enum fwat_property *props;
+	size_t num_props;
+};
+
+/**
+ * DEFINE_SIMPLE_FWAT_OPS() - Define static &struct fwat_attr_ops for a simple
+ *                            *attribute* with no properties, i.e. No
+ *                            &fwat_attr_ops.read_prop callback
+ * @_name: Prefix of the `read` and `write` callbacks.
+ * @_type: Firmware *attribute* type.
+ *
+ * Example:
+ *
+ * static int example_read(...) {...}
+ * static int example_write(...) {...}
+ *
+ * DEFINE_SIMPLE_FWAT_OPS(example, ...);
+ */
+#define DEFINE_SIMPLE_FWAT_OPS(_name, _type)		\
+	static const struct fwat_attr_ops _name##_ops = { \
+		.type = fwat_type_##_type,		\
+		._type = {				\
+			.read = _name##_read,		\
+			.write = _name##_write,		\
+		}					\
+	}
+
+/**
+ * DEFINE_FWAT_OPS() - Define static &struct fwat_attr_ops with all callbacks.
+ * @_name: Prefix of the `read` and `write` callbacks.
+ * @_type: Firmware *attribute* type.
+ *
+ * Example:
+ *
+ * static int example_read(...) {...}
+ * static int example_write(...) {...}
+ * static int example_prop_read(...) {...}
+ *
+ * DEFINE_FWAT_OPS(example, ...);
+ */
+#define DEFINE_FWAT_OPS(_name, _type)			\
+	static const struct fwat_attr_ops _name##_ops = { \
+		.type = fwat_type_##_type,		\
+		.prop_read = _name##_prop_read,		\
+		._type = {				\
+			.read = _name##_read,		\
+			.write = _name##_write,		\
+		}					\
+	}
+
+/**
+ * FWAT_CONFIG() - Configuration pointer for a single firmware *attribute*.
+ * @_name: String name of this *attribute*.
+ * @_mode: Mode assigned to current_value
+ * @_type: Firmware *attribute* type.
+ * @_ops: Pointer to &struct fwat_attr_ops.
+ * @_props: Pointer to a enum fwat_property array.
+ * @_num_props: Size of the @_props array.
+ *
+ * This is a convenience macro to quickly construct a &struct fwat_attr_config
+ * array, which will be passed to &struct fwat_dev_config.
+ *
+ * Example:
+ *
+ * static int example_read(...) {...}
+ * static int example_write(...) {...}
+ * static int example_prop_read(...) {...}
+ *
+ * DEFINE_FWAT_OPS(example, ...);
+ *
+ * static const enum fwat_property props[] = {...};
+ *
+ * static const struct fwat_attr_config * const attrs_config[] = {
+ *	FWAT_CONFIG(example, ..., &example_fwat_ops, props,
+ *		    ARRAY_SIZE(props)),
+ *	...
+ *	NULL
+ * };
+ *
+ * static const struct fwat_dev_config fdev_config = {
+ *	.attrs_config = attrs_config,
+ *	...
+ * }
+ */
+#define FWAT_CONFIG(_name, _mode, _ops, _props, _num_props) \
+	(&(const struct fwat_attr_config) {	\
+		.name = _name,				\
+		.mode = _mode,				\
+		.ops = _ops,				\
+		.num_props = _num_props,		\
+		.props = _props,			\
+	})
+
+/**
+ * FWAT_CONFIG_AUX() - Configuration pointer for a single firmware *attribute*
+ *                     with an auxiliary number defined by the user
+ * @_name: String name of this *attribute*.
+ * @_mode: Mode assigned to current_value
+ * @_type: Firmware *attribute* type.
+ * @_aux: Auxiliary number defined by the user.
+ * @_ops: Pointer to &struct fwat_attr_ops.
+ * @_props: Pointer to a enum fwat_property array.
+ * @_num_props: Size of the @_props array.
+ *
+ * This is a convenience macro to quickly construct a &struct fwat_attr_config
+ * array, which will be passed to &struct fwat_dev_config.
+ *
+ * Example:
+ *
+ * static int example_read(...) {...}
+ * static int example_write(...) {...}
+ * static int example_prop_read(...) {...}
+ *
+ * DEFINE_FWAT_OPS(example, ...);
+ *
+ * static const enum fwat_property props[] = {...};
+ *
+ * static const struct fwat_attr_config * const config[] = {
+ *	FWAT_CONFIG_AUX(example, ..., n, &example_fwat_ops, props,
+ *			ARRAY_SIZE(props)),
+ *	...
+ *	NULL
+ * };
+ *
+ * static const struct fwat_dev_config fdev_config = {
+ *	.attrs_config = attrs_config,
+ *	...
+ * }
+ */
+#define FWAT_CONFIG_AUX(_name, _mode, _aux, _ops, _props, _num_props) \
+	(&(const struct fwat_attr_config) {		\
+		.name = _name,				\
+		.mode = _mode,				\
+		.aux = _aux,				\
+		.ops = _ops,				\
+		.num_props = _num_props,		\
+		.props = _props,			\
+	})
+
+/**
+ * struct fwat_dev_config - Configuration for this devices's
+ *                          &fwat_device.auto_groups
+ * @attrs_config: NULL terminated &struct fwat_attr_config array.
+ * @is_visible: Optional visibility callback to determine the visibility
+ *              of each auto_group.
+ */
+struct fwat_dev_config {
+	const struct fwat_attr_config *const *attrs_config;
+	bool (*is_visible)(struct device *dev, const struct fwat_attr_config *config);
+};
+
 struct fwat_device * __must_check
 fwat_device_register(struct device *parent, const char *name, void *data,
+		     const struct fwat_dev_config *config,
 		     const struct attribute_group **groups);
 
 void fwat_device_unregister(struct fwat_device *fwadev);
 
 struct fwat_device * __must_check
 devm_fwat_device_register(struct device *parent, const char *name, void *data,
+			  const struct fwat_dev_config *config,
 			  const struct attribute_group **groups);
 
 #endif /* FW_ATTR_CLASS_H */

-- 
2.49.0

